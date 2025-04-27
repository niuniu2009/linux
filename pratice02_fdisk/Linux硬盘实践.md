# Linux硬盘实践

## 1、Linux硬盘分区

第一步：关闭虚拟机，按照向导添加一块新的硬盘，然后重启虚拟机，以root身份登录，在终端中查看新的硬盘如下：

<img src="Linux%E7%A1%AC%E7%9B%98%E5%AE%9E%E8%B7%B5.assets/carbon%20(6).png" alt="carbon (6)" style="zoom:50%;" />

第二步：使用fdisk命令进行分区

<img src="Linux%E7%A1%AC%E7%9B%98%E5%AE%9E%E8%B7%B5.assets/carbon%20(7).png" alt="carbon (7)" style="zoom:50%;" />

第三步：确认一下/dev/sdb硬盘的分区情况

<img src="Linux%E7%A1%AC%E7%9B%98%E5%AE%9E%E8%B7%B5.assets/carbon%20(8).png" alt="carbon (8)" style="zoom:50%;" />

图中可以看到硬盘被分成了连个主分区sdb1, sdb2, 扩展分区sdb3，逻辑分区sdb5

## 2、格式化分区

把/dev/sdb1, dev/sdb2和逻辑分区/dev/sdb5格式化成xfs格式的文件类型

<img src="Linux%E7%A1%AC%E7%9B%98%E5%AE%9E%E8%B7%B5.assets/carbon%20(9).png" alt="carbon (9)" style="zoom:50%;" />

## 3、挂载分区

新建三个目录/root/zhangsan_01, /root/zhangsan_02, /root/zhangsan_05

<img src="Linux%E7%A1%AC%E7%9B%98%E5%AE%9E%E8%B7%B5.assets/carbon%20(10).png" alt="carbon (10)" style="zoom:50%;" />

## 4、卸载分区

卸载分区

<img src="Linux%E7%A1%AC%E7%9B%98%E5%AE%9E%E8%B7%B5.assets/carbon%20(12).png" alt="carbon (12)" style="zoom:50%;" />



使用mount命令挂载分区的方法，当重新启动Linux系统以后，挂载信息会自动丢失。那么如何永久性的挂载呢？

## 5、永久性挂载

编辑/etc/fstab文件，把挂载信息写入该文件，并保存就可以了。

例如，如果想要自动挂载/dev/sdb1分区到/root/zhangsan_01目录，可以把下面一行信息添加进/etc/fstab文件。

/dev/sdb1     /root/zhangsan_01  xfs   defaults   0   0 





