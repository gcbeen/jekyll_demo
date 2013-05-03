---
layout: post
title: "rails实战圣经-assets"
description: ""
category: 
tags: []
---
{% include JB/setup %}

assets：  

img assets  

assets 目录：  

![img assets-paths-]({{ site.rails-szsj.assets }}/assets-paths-.png)

paths：包括gem里的。  

![img assets-paths]({{ site.rails-szsj.assets }}/assets-paths.png)

rake assets:precompile RAILS_ENV=production 的路径：  
前：  
在开发环境   image('user/....png')  

![img comp-0]({{ site.rails-szsj.assets }}/comp-0.png)

后：

![img comp-]({{ site.rails-szsj.assets }}/comp-.png)


assets 路径：  

![img application-css]({{ site.rails-szsj.assets }}/application-css.png)

![img assets-images-]({{ site.rails-szsj.assets }}/assets-images-.png)

![img assets-images]({{ site.rails-szsj.assets }}/assets-images.png)

precompile:  

![img precompile]({{ site.rails-szsj.assets }}/precompile.png)

servers:  

![img assets-http-servers]({{ site.rails-szsj.assets }}/assets-http-servers.png)

live complile:  

![img live-compile]({{ site.rails-szsj.assets }}/live-compile.png)

Bundler 使用 assets：  


![img bundler]({{ site.rails-szsj.assets }}/bundler.png)

<http://railscasts.com/episodes/340-datatables?view=asciicast>  
<http://railscasts.com/episodes/282-upgrading-to-rails-3-1?view=asciicast>  
<http://railscasts.com/episodes/279-understanding-the-asset-pipeline?view=asciicast>  
