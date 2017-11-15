--- 
layout: post
title: Docker 应用
date: Nov 15, 2017
author: Yi DING
---

[comment]: # (This blog introduce the use of Docker)

拉取镜像：
```
docker pull ubuntu:latest
```

列出镜像：
```
docker image
```

从该镜像上创建容器：
```
docker run --rm -ti ubuntu /bin/bash
```

查看当前运行的容器
```
docker ps
```

查看全部容器(包括运行中的和停止的)
```
docker ps -a
```




### Useful links:

http://www.360doc.com/content/15/0419/01/21412_464258944.shtml