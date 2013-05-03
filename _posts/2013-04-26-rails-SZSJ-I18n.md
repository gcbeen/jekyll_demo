---
layout: post
title: "rails实战圣经I18n"
description: ""
category: 
tags: []
---
{% include JB/setup %}

	User.human_attribute_name(:login)  
	config.i18n.default_locale = "zh-TW"  
	
	t("admin.event")  
	t(:event, :scope => :admin )  

![img record-attribute]({{ site.rails-szsj.i18n }}/record-attribute.png)

![img model]({{ site.rails-szsj.i18n }}/model.png)

![img i18n-]({{ site.rails-szsj.i18n }}/i18n-.png)



