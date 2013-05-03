---
layout: post
title: "invalid byte sequence in UTF-8"
description: ""
category: 
tags: []
---
{% include JB/setup %}

	<%= stylesheet_link_tag "admin/login_page.css", :media => "all" %>  

ArgumentError (invalid byte sequence in UTF-8):  

	app/views/admin_sessions/new.html.erb:6:in `_app_views_admin_sessions_new_html_erb__563061566__626935068'  

修改：

	<%= stylesheet_link_tag "admins/login_page.css", :media => "all" %>  

正确运行  

靠，还出灵异事件了。。。  
