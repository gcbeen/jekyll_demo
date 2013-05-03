---
layout: post
title: "ubuntu wireless network"
description: ""
category: 
tags: []
---
{% include JB/setup %}
参考  
<http://blog.chinaunix.net/uid-25404734-id-3066433.html>  
<http://www.realtek.com/downloads/downloadsView.aspx?Langid=1&PFid=48&Level=5&Conn=4&ProdID=278&DownTypeID=3&GetDown=false&Downloads=true>  

lspci -vnn 查看网卡类型  
下载相应的网卡驱动解压缩  

	tar -xvf 92ce_se_de_linux_mac80211_0004.0816.2011.tar.gz  
	sudo make  
	sudo make install  
重启。  
