---
layout: post
title: "rails-web缓存设计"
description: ""
category: 
tags: []
---
{% include JB/setup %}

orm缓存  
<http://robbinfan.com/blog/38/orm-cache-sumup>  
<http://robbinfan.com/blog/3/orm-cache>  
activerecord object cache：  
<http://robbinfan.com/blog/33/activerecord-object-cache>  


N+1：  

![img n+1]({{ site.web-hcsj }}/n+1.png)

column拆表：  

![img column-div]({{ site.web-hcsj }}/column-div.png)

![img column-div-]({{ site.web-hcsj }}/column-div-.png)

写一致性：  

![img write-same]({{ site.web-hcsj }}/write-same.png)


片段缓存：  

![img part-cach]({{ site.web-hcsj }}/part-cach.png)

过期处理：  

![img part-cach-2]({{ site.web-hcsj }}/part-cach-2.png)

![img write-cache]({{ site.web-hcsj }}/write-cache.png)

http cache： <http://robbinfan.com/blog/13/http-cache-implement>  

一览缓存：  


![img http-list-cache]({{ site.web-hcsj }}/http-list-cache.png)

show 缓存：  

![img http-show-cache]({{ site.web-hcsj }}/http-show-cache.png)

关联文章推荐：  

![img http-5day-cache]({{ site.web-hcsj }}/http-5day-cache.png)

