--- 
layout: post
title: Docker 初步
date: Nov 15, 2017
author: Yi DING
---

[comment]: # (This blog introduce the use of Docker)

## Docker 初步
部分内容来源：

http://www.360doc.com/content/15/0419/01/21412_464258944.shtml



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
简要说明：
* `--rm`：告诉Docker一旦运行的进程退出就删除容器。这在进行测试时非常有用，可免除杂乱
* `-ti`：告诉Docker分配一个伪终端并进入交互模式。这将进入到容器内，对于快速原型开发或尝试很有用，但不要在生产容器中打开这些标志
* `ubuntu`：这是容器立足的镜像
* `/bin/bash`：要运行的命令，因为我们以交互模式启动，它将显示一个容器的提示符

在后台运行容器：(输出随机分配的ID)
```
docker run -d unbutu ping 8.8.8.8

```

查看当前运行的容器
```
docker ps
```


查看全部容器(包括运行中的和停止的)
```
docker ps -a
```

在容器里运行程序：
```
docker exec -ti loving_mcclintock /bin/bash
```
这里所做的是在容器里运行程序，这里的程序是`/bin/bash`。`-ti`标志与`docker run`的作用相同，将我们放置到容器的控制台里。


### Useful links:

