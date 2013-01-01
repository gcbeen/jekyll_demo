---
layout: post
title: "deploy rails app"
description: ""
category: 
tags: []
---
{% include JB/setup %}
本人参考<br />
[ihower.tw/rails3/deployment.html](http://ihower.tw/rails3/deployment.html)<br />
[http://code.macournoyer.com/thin](http://code.macournoyer.com/thin)<br />
[articles.slicehost.com/2008/5/6/ubuntu-hardy-apache-rails-and-thin](http://articles.slicehost.com/2008/5/6/ubuntu-hardy-apache-rails-and-thin)<br />
[hot88zh.iteye.com/blog/856017](http://hot88zh.iteye.com/blog/856017)<br />
[blog.prosight.me/index.php/2009/07/265](http://blog.prosight.me/index.php/2009/07/265)<br />
做了点rails的部署，又不对之处请指正，谢谢。

###apache2 + passenger

先安装apache

    $sudo apt-get install apache2
    $sudo apt-get install -y apache2-mpm-prefork  apache2-prefork-dev libapr1-dev libaprutil1-dev libcurl4-openssl-dev
    $rvmsudo gem install passenger
    $sudo passenger-install-apache2-module

创建/etc/apache2/mods-available/mod_rails档案，
填入以下代码（具体看$sudo passenger-install-apache2-module执行结果)：

    LoadModul peassenger_module /usr/local/lib/ruby/gems/1.8/gems/passenger-3.0.7/ext/apache2/mod_passenger.so
    PassengerRoot /usr/local/lib/ruby/gems/1.8/gems/passenger-3.0.7
    PassengerRuby /usr/local/bin/ruby

    
执行一下命令使 module mod_rails 在mods-enabled文件夹中创建链接档

    $ sudo a2enmod mod_rails

新增：/etc/apache2/sites-available/your_rails_app.conf档案,填入一下代码

    <VirtualHost *:80> 
      ServerName www.yourhost.com 
      DocumentRoot /somewhere/public 
      <Directory /somewhere/public>     
        AllowOverride all     
        Options -MultiViews 
      </Directory>
    </VirtualHost>

在sites-enabled文件夹中创建your_rails_app.conf的链接档
    
    $sudo a2ensite your_rails_app.conf

设定监听端口
    
    $sudo vim /etc/apache2/ports.conf

增加如下：

    NameVirtualHost *:80
    Listen 80

运行apache

    $ sudo /etc/init.d/apache2 start

###nginx + passenger

装好passenger 后

    sudo passenger-install-nginx-module

编辑设定/opt/nginx/conf/nginx.conf
如下：

    server {   
      listen       80;   
      server_name  www.yourhost.com;   
      root /somewhere/public;   
      passenger_enabled on;
    }

启动nginx
    
    $ sudo /opt/nginx/sbin/nginx

停止nginx

    $ sudo kill `cat /opt/nginx/logs/nginx.pid `


###apache2 + thin

    gem install thin 
    sudo a2enmod proxy
    sudo a2enmod proxy_balancer
    sudo a2enmod proxy_http
    sudo a2enmod rewrite
    sudo /etc/init.d/apache2 force-reload

设置站点

    sudo nano /etc/apache2/sites-available/domain.com

填入一下代码

    <VirtualHost *:80> 
      ServerName domain.com 
      ServerAlias www.domain.com 
      DocumentRoot /home/demo/public_html/railsapp/public  
      RewriteEngine On 
      <Proxy balancer://thinservers>  
        BalancerMember http://127.0.0.1:5000  
        BalancerMember http://127.0.0.1:5001  
        BalancerMember http://127.0.0.1:5002
      </Proxy> 
      # Redirect all non-static requests to thin 
      RewriteCond %{DOCUMENT_ROOT}/%{REQUEST_FILENAME} !-f
      RewriteRule ^/(.*)$ balancer://thinservers%{REQUEST_URI} [P,QSA,L]
      ProxyPass / balancer://thinservers/
      ProxyPassReverse / balancer://thinservers/
      ProxyPreserveHost on
      <Proxy *>  
       Order deny,allow  
       Allow from all
      </Proxy>
      # Custom log file locations 
      ErrorLog  /home/demo/public_html/railsapp/log/error.log
      CustomLog /home/demo/public_html/railsapp/log/access.log combined
    </VirtualHost>

创建domain.com链接档
    
    sudo a2ensite domain.com
    sudo /etc/init.d/apache2 reload

设置rails应用配置railsapp.yml

    sudo thin install 会添加/etc/thin目录。
    sudo thin config -C /etc/thin/railsapp.yml -c /home/demo/public_html/railsapp/  --servers 3 -p 5000 -e production
    sudo vim /etc/thin/railsapp.yml

内容：

    pid: tmp/pids/thin.pid
    log: log/thin.log
    timeout: 30
    max_conns: 1024
    port: 5000
    max_persistent_conns: 512
    chdir: /home/demo/public_html/railsapp
    environment: production
    servers: 3
    address: 0.0.0.0
    daemonize: true

启动thin,apache

    sudo /etc/init.d/thin start
    sudo /etc/init.d/apache2 restart

###nginx thin


thin  安装后，
配置nginx即可 

      passenger_root /home/guanchengbing/.rvm/gems/ruby-1.9.3-p194/gems/passenger-3.0.17;
      passenger_ruby /home/guanchengbing/.rvm/wrappers/ruby-1.9.3-p194/ruby;   
      include       mime.types;
      default_type  application/octet-stream;   
      log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';  
     access_log  logs/access.log  main;

     upstream thin {   
       server 127.0.0.1:8000;
       server 127.0.0.1:8001;
       server 127.0.0.1:8002;
    }

    server {      
      listen   80;    
      server_name  localhost;
      access_log  /var/log/nginx/localhost.access.log;  
      root /var/www/test/public;
      location / {             
        proxy_set_header  X-Real-IP  $remote_addr;      
        proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;          
        proxy_set_header Host $http_host;          
        proxy_redirect false;            
       if (-f $request_filename/index.html) {                
         rewrite (.*) $1/index.html break;         
        }        
       if (-f $request_filename.html) {            
         rewrite (.*) $1.html break;        
       }               
       if (!-f $request_filename) {              
         proxy_pass http://thin;                 
         break;              
       }     
      }
    } 

