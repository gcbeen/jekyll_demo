---
layout: post
title: "rails实战圣经-RESTful"
description: ""
category: 
tags: []
---
{% include JB/setup %}

![img resources]({{ site.rails-szsj.restful }}/resources.png)

select：  
delegate :name, :to => :category, :prefix => true, :allow_nil => true  
 
![img resources-select]({{ site.rails-szsj.restful }}/resources-select.png)

例如 直接编辑 答卷的问题：  

accepts_nested_attributes_for:  
<http://asciicasts.com/episodes/196-nested-model-form-part-1>  
<http://asciicasts.com/episodes/197-nested-model-form-part-2>  

validates_associated(*attr_names):  
<http://stackoverflow.com/questions/5396273/rails-accepts-nested-attributes-for-and-validations-rails-2-3-11>  

![img validates_associated]({{ site.rails-szsj.restful }}/validates_associated.png)

nested_form:  
<https://github.com/ryanb/nested_form>  


一对一resource:  

	resources :events do
	  resource :location, :controller => 'event_locations'
	end

Nested Model 顺带编辑 新增：  

	accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

多对多resources：  
simple_form gem  


![img opt-status]({{ site.rails-szsj.restful }}/opt-status.png)

![img collection]({{ site.rails-szsj.restful }}/collection.png)

客制 Resources member  

![img member]({{ site.rails-szsj.restful }}/member.png)

namespace：  

![img namespace]({{ site.rails-szsj.restful }}/namespace.png)

