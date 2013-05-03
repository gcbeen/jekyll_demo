---
layout: post
title: "DB ssh 备份"
description: ""
category: 
tags: []
---
{% include JB/setup %}

db备份命令： 
	
	mysqldump -uacademy -p5t3Re0Wx academy_production > /home/academy/academy_production.sql  
	scp academy@academy-dev.funward.jp:/home/academy/rails/academy_production.sql academy_production.sql  

db 导入数据  

	mysql -u root -p test_db < ~/work-app/revic_bak.sql  

[mysql导入导出数据blog参考](http://blog.linezing.com/2012/02/mysql%E5%AF%BC%E5%85%A5%E5%AF%BC%E5%87%BA%E6%95%B0%E6%8D%AE%E6%96%B9%E6%B3%95) 

	mysqldump -hhostname -uusername -p dbname tbname>xxxx.sql  
