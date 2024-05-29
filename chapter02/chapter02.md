# Chapter02

## 0、一张图看懂操作系统

[一张图读懂Unix](https://handwiki.org/wiki/images/7/77/Unix_history-simple.svg)

![Unix_history-simple](./chapter02.assets/Unix_history-simple.svg)

## 1、Linux一切皆文件

[上帝给我托梦说：一切皆文件](https://zhuanlan.zhihu.com/p/654911374)

```shell
#在Linux系统中，每个设备都被当成一个文件来对待。
#u盘---------------------/dev/sda[a-p]
#scsi/sata/usb硬盘--------/dev/sda[a-p]
#ide硬盘------------------/dev/hd[a-d]
#打印机-------------------/dev/lp[0-2]
#光驱--------------------/dev/cdrom

#四种不用类型接口的硬盘对应的表达方式分别是：
#IDE接口 表示为hd[a-z]
#scsi接口和sata接口 表示为sd[a-z]
#Nvme接口 表示为nvme0n1,nvme0n2....
#这里的[a-z]指的是第几块硬盘，比如scsi接口的硬盘，第一块就是sda,第二块是sdb，依次类推。
```

## 2、Linux安装

- 安装vmware workstation（通过博通官网，注册账号后可以下载，对个人用户免费）[下载VMware17 视频教程](https://www.bilibili.com/video/BV1o7421o7Vt/?spm_id_from=333.788.recommend_more_video.1&vd_source=c7b66582e4bea8e9a772ca334df24fe5)

- vmware 三种网络模式         [VMware虚拟机三种网络模式](https://www.toutiao.com/article/7301587787995038245/)     [三种网络模式图解2](https://www.toutiao.com/article/7147892994501493285/?channel=&source=search_tab)

- 在vmware中新建一个虚拟机

- 下载喜欢的Linux发行版：

  > 国内常用Linux开源镜像站：
  >
  > 淘宝镜像
  >
  > https://npm.taobao.org/mirrors/
  >
  > 清华大学开源镜像站　　
  >
  > https://mirrors.tuna.tsinghua.edu.cn/
  >
  > 网易开源镜像站
  >
  > http://mirrors.163.com/
  >
  > 阿里巴巴开源镜像站
  >
  > https://opsx.alibaba.com/mirror/
  >
  > 搜狐镜像站
  >
  > http://mirrors.sohu.com/

- 安装Linux： [AlmaLinux 9操作系统安装及配置视频教程](https://www.bilibili.com/video/BV1oK411a7Ce/?spm_id_from=333.337.search-card.all.click&vd_source=c7b66582e4bea8e9a772ca334df24fe5)

- Linux安装时：分区选择，自动分区和手动分区。[centos分区视频教程](https://www.bilibili.com/video/BV1ju41197w1/?spm_id_from=333.337.search-card.all.click&vd_source=c7b66582e4bea8e9a772ca334df24fe5)

  > 手动分区建议：
  >
  > /boot 分区：存放Linux系统启动有关程序，建议大小100MB。 
  >
  > /usr 分区：存放Linux系统中的应用程序，数据较多，建议大于3GB。 
  >
  > /var 分区：存放Linux系统中经常变化的数据及日志文件，建议大小为1GB，视服务器用途而定。 
  >
  > /home 分区：存放普通用户的数据，是普通用户的宿主目录，建议大小为磁盘剩下的空间。
  >
  > /分区：Linux系统的根目录，建议大小为1GB。 
  >
  > SWAP分区：实现虚拟内存，建议大小是物理内存的1~2倍。

## 3、Linux登录

（1）本机登录

1. 本机字符界面登录（Linux默认提供了6个tty终端登录）

2. 本机图形界面登录

   [Linux 黑话解释：TTY 是什么？](https://zhuanlan.zhihu.com/p/447014333)

（2）远程登录

- MobaXterm  (windows)
- Royal TSX     (mac)
- ssh命令       （Linux）

（3）有趣的Linux命令

- [oeasy 带你学 Linux 之零基础快速上手_Linux - 蓝桥云课 (lanqiao.cn)](https://www.lanqiao.cn/courses/2712)

（4）云服务器申请

## 4、参考资料

- 鸟哥Linux私房菜

- Linux就该这么学

- 蓝桥云课（实验平台）

- B站视频

- 刘老师课堂笔记

- [课件参考](./1.ppt)

- [BIOS设置详解](./bios.ppt)

- [vmware-workstation-user-guide](./workstation-guide.pdf)

  



