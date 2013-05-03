---
layout: post
title: "rails实战圣经-timezone"
description: ""
category: 
tags: []
---
{% include JB/setup %}

<http://www.shareup.me/metadocs/1852>  

Time.zone  

	config.active_record.default_timezone = :local   #保存时区  
	config.time_zone = "Tokyo"  #显示时区  

set database time zone  

	SET global time_zone= '+08:00 ';  
or edit your mysql config file,like my.ini or my.cnf  
	
	[mysqld]
	default-time-zone=+8:00  
