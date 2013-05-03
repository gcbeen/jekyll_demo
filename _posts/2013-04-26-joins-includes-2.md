---
layout: post
title: "joins includes 2"
description: ""
category: 
tags: []
---
{% include JB/setup %}


include：不带关系中的条件： 查一篇  
带关系中的条件： 查两篇  
"is not null"  

	users = User.all(:include => :comments, :conditions =>  "comments.id is not null")  

![img rails2-include-relation]({{ site.joins2-img-url }}/rails2-include-relation.png)


![img rails2-include-relation-2]({{ site.joins2-img-url }}/rails2-include-relation-2.png)


![img rails2-include-relation-2-2]({{ site.joins2-img-url }}/rails2-include-relation-2-2.png)

joins：加select：直接得到字段。  
通过关系会再查询一篇。  

![img rails2-joins-relation]({{ site.joins2-img-url }}/rails2-joins-relation.png)

![img rails2-joins-relation-2]({{ site.joins2-img-url }}/rails2-joins-relation-2.png)

![img rails2-joins-relation-3]({{ site.joins2-img-url }}/rails2-joins-relation-3.png)

![img rails2-joins-relation-4]({{ site.joins2-img-url }}/rails2-joins-relation-4.png)

