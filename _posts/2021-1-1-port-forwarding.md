---
layout: post
title:  "Configuration of Port Forwarding"
excerpt: "Port Fowarding"
categories: [tutorial]
tags: [tutorial]
author: Elliot He
date:   2021-1-1 00:00:00
comments: true
---

Problem:

- Only single Ethernet jack in the Lab.
- Use the router (cisco brand) for ethernet connectio.
- Need to access the server or the desktop remotely through SSH.

Here we consider the solution of Port Forwarding (端口映射).

Assuming the connection medium: Laptop => Router => Server. The default port used is 22 if not specified.

1. Choose single port forwarding.
2. Map the internal port 22 of server (e.g., 192.168.1.X) to a external port (777 for example)
3. Perform the ssh access as:

```
$ ssh elliot@{Public-IP} -p 777
```

Some useful links:
- [设置路由器 从外网访问内网服务器 端口映射](https://blog.csdn.net/honululu/article/details/78127107)