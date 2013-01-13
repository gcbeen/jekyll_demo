---
layout: post
title: "pry person summary"
description: ""
category: 
tags: []
---
{% include JB/setup %}
以下是本人在rails项目中使用pry的一点经历
想了解更多参考:<br/>
[github.com/pry/pry](github.com/pry/pry)<br />
[rubyer.me/blog/1585](rubyer.me/blog/1585)<br />
[blog.tyraeltong.com/blog/2011/10/14/introducing-pry](blog.tyraeltong.com/blog/2011/10/14/introducing-pry)<br />
**运行pry调试ruby代码

    pry

**运行pry调试rails

    pry -r ./config/environment

**在rails s运行时调试pry终端

在调试的代码中加入binding.pry
