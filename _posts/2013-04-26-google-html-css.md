---
layout: post
title: "google的html css规范指南"
description: ""
category: 
tags: []
---
{% include JB/setup %}


<http://www.36ria.com/5249>  

<http://www.google.com/cse>  
code:

	<script>
		(function() {
		var cx = '007714197177174202439:76f93axbhn8';
		var gcse = document.createElement('script');
		gcse.type = 'text/javascript';
		gcse.async = true;
		gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
		'//www.google.com/cse/cse.js?cx=' + cx;
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(gcse, s);
		})();
	</script>
	<gcse:search></gcse:search>
