---
layout: page
title: gcbeen blog
tagline: Supporting tagline
---
{% include JB/setup %}
  
###  My posts list  
<br/>
<!--ul class="posts"></ul--><!--<span>{{ post.date | date_to_string }}</span> &raquo; -->
{% for post in site.posts %}
- [{{ post.title }}]({{ BASE_PATH }}{{ post.url }})
{% endfor %}
