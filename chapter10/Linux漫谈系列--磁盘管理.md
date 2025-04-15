# Linux漫谈系列--磁盘管理

## 一、磁盘

### 1、磁盘结构

- 物理结构

[机械硬盘储物理拆解](https://www.bilibili.com/video/BV1kf4y137Zd/?spm_id_from=333.337.search-card.all.click&vd_source=c7b66582e4bea8e9a772ca334df24fe5)  

[机械硬盘的工作原理](https://www.bilibili.com/video/BV1WF411R7es/?spm_id_from=333.788)（B站）

[固态硬盘的工作原理](https://www.bilibili.com/video/BV1yh4y1j7sg?spm_id_from=333.788.videopod.sections&vd_source=c7b66582e4bea8e9a772ca334df24fe5)（B站）

- 逻辑结构

[硬盘就是一个旋转餐桌](https://mp.weixin.qq.com/s/eIU_adzAbOjsytcajhjrNA) **（码农翻身）**

[PPT课件](磁盘管理20241112.pptx)（刘老师整理课件（1--35））



### 2、磁盘分区

 [上帝托梦给我说：一切皆文件](https://mp.weixin.qq.com/s/oXsL83KcObnUyYc-knaZvQ)：漫画图解unix的Everything is file!

- 操作系统引导方式
- 三种分区：主分区、扩展分区、逻辑分区
- Linux分区如何标识？
- 主引导记录MBR

[PPT课件](磁盘管理20241112.pptx)（刘老师整理课件）（36--51）

### 3、文件系统

[我是一块硬盘（上）](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513289&idx=1&sn=ab19dcad7b1dc217463f155fe106091a&scene=21#wechat_redirect)  

[我是一块硬盘（下）](https://mp.weixin.qq.com/s/1odOmbHJI5kSNI-YegrsPg)

#### （1）为什么要格式化？

![image-20250407191749458](Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/image-20250407191749458.png)

为了在该分区上创建文件系统。

#### （2）Linux主流文件系统

（1）ext  专门为Linux设计的，为linux核心所做的第一个文件系统。

该文件系统最大支持2GB的容量。

（2）ext2  由Rémy Card设计，用以代替ext，是LINUX内核所用的文件系统。单个文件最大限制2TB；

该文件系统最大支持32TB的容量。

（3）ext3  一个日志文件系统。

单个文件最大限制16TB，该文件系统最大支持32TB的容量。 

（4）ext4   Theodore Tso领导的开发团队实现,Linux系统下的日志文件系统。

单个文件最大限制16TB， 该文件系统最大支持1EB的容量。

（5）JFS2  一种字节级日志文件系统,该文件系统主要是为满足服务器的高吞吐量和可靠性需求而设计、 开发的。

单个文件最大限制16TB，该文件系统最大支持1PB的容量。

(6)XFS   是 64 位高性能日志文件系统。对 XFS 的支持大概在 2002 年合并到了 Linux 内核。

对于 64 位文件系统，XFS 支持最大文件系统大小为 8 exbibytes。 

目前RHEL 7.0 文件系统默认使用 XFS。

XFS的文件系统结构如上，不同于Ext4，它通过B+树来索引inode和数据块。用树结构的文件系统通常相比Ext4用表结构，如链表、直接/间接Block以及extent，能更好地支持大文件，如视频/数据库文件等。另外其元数据规模少，使得硬盘可用空间更多，实测XFS、Btrfs多平均至少1.5%以上的可用空间。 

XFS能支持单卷可达 8EiB ，最大文件也到 8EiB ，相比Ext4的16TiB可高了几个数量级。而且是其实动态分配inode的实现机制，只要有空间，就不会耗尽inode。

<img src="Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/carbon%20(2).png" alt="carbon (2)" style="zoom: 50%;" />

#### （3）有意思的 inode

Linux文件系统中，文件的inode和文件名是一一对应的关系，真正识别一个文件依靠的是inode编号，而不是文件名。

在Linux操作系统中，将文件系统分为2部分，一部分为数据区，一部分为元数据区。

这里的元数据就是inode， 它存取文件的创建者，文件的创建日期，修改日期，访问日期，文件大小等信息。

![image-20250407192726192](Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/image-20250407192726192.png)

使用ls -i命令可以查看文件的inode编号

![carbon (3)](Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/carbon%20(3).png)

如何查看一个分区究竟有多少个inodes

#### （4）例题

以/dev/sda1分区为例：

![carbon (4)](Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/carbon%20(4).png)

如何计算一个文件系统支持的最大支持的文件？

例题：

计算ext2类型的文件系统最大支持的文件大小为16GB，参考：[ext2文件系统详解 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/579567318)



一个稍微有点深度的话题：

#### （5）目录是如何存储的？

在一个硬盘的分区中，目录是如何存储的？

对于目录而言，当我们新建一个目录的时候，文件系统会分配一个inode和一个block给该目录。

- 其中inode记录该目录的相关权限和属性，并记录分配到的那块block号码
- 而block块则是记录在这个目录下的文件名与该文件名对应的inode的号码的对应关系表。

例题

以访问/root/user1.txt文件为例，来说明目录是如何存储的：

![carbon (5)](Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/carbon%20(5).png)

从上图中可以看出Linux目录是这样的一种结构：

![image-20250407201003207](Linux%E6%BC%AB%E8%B0%88%E7%B3%BB%E5%88%97--%E7%A3%81%E7%9B%98%E7%AE%A1%E7%90%86.assets/image-20250407201003207.png)



如何从linux的根目录开始一层一层的找到文件的？你理解了吗？

- 首先来查看根目录的inode
- 然后读该目录数据块中存储的对应关系：子目录或者文件和其对应inode的对应表。通过该对应表找到子目录或者文件。
- 一层一层找下去即可。

#### （6）经典面试问题

从上述讲解中，你能看出Linux系统中，一个文件的名字究竟存储在哪里呢？

比如上述的user1.txt这个文件的名字。

是存储在这个文件的自己的inode中吗？

这里就发现了一个有意思的问题，一个文件的名字并没有存储在自己的inode中，而是存储在其上层目录的(block)数据区域里面。

这样就解释了为什么用户在想要新增、删除、重命名文件的时候，该用户必须对其父目录具备w权限。

换句话说：一个用户想要重命名 /root/user1.txt，和用户对user1.txt有什么的权限没有关系，而是取决于该用户对其父目录/root必须要有w权限。

该用户对其父目录/root有w权限，也就是说该用户可以修改/root的(block)数据区域的内容，也就是可以更改文件名和inode的对应关系。从而能够更改文件的名字。

理解了这个问题，你也就理解，为啥一旦该用户拥有了某个文件的父目录的w权限，就能新建、删除、移动、复制、更名文件。



这个问题也是面试的经典话题，你了解了么？



### 4、有趣的话题，如何销毁硬盘数据



[销毁硬盘，用这个妙招，美国中央情报局也难以恢复](https://maimai.cn/article/detail?efid=sGRzNWmh3beQYP7__ww7KQ&fid=1816899559)

## 二、实战

### 1、磁盘分区fdisk和gparted



### 2、格式化分区



### 3、分区挂载和卸载，自动挂载



### 4、交换分区

4.1 交换分区





4.2 交换文件



### 5、磁盘阵列RAID

[磁盘阵列实战精简版](磁盘阵列RAID实战.txt)

`RAID磁盘阵列实战：`

`1、准备工作：`

`（1）在虚拟机中添加一块硬盘（sdc）。`
`（2）使用  gparted （ fdsik）分区工具把分成5个100M的分区。格式化为xfs类型 mkfs -t xfs 分区。`

`2、创建RAID10磁盘阵列：`

`（3）使用  mdadm -Cv /dev/md1 -n 4 -l 10 /dev/sdc1 /dev/sdc2 /dev/sdc3 /dev/sdc5   创建一个名为md1的磁盘阵列`
`（4）查看该磁盘阵列的详细信息  mdadm -Q /dev/md1`
`（5）也可以使用  lsblk -f  命令查看磁盘阵列`

`3、使用该磁盘阵列：`

`（6）然后格式化该磁盘阵列  mkfs -t xfs /dev/md1`
`（7）新建一个目录  mkdir /root/raid`
`（8）挂载该磁盘阵列  mount -t xfs /dev/md1 /root/raid`
`（9）使用 df -i /root/raid 查看此磁盘已经使用inode是多少`
`（10）使用 touch /root/raid/hello{1..10} 创建10个文件`
`（11）再次使用 df -i /root/raid 查看此磁盘已经使用inode，发现可用的inode少了10个`

`4、模拟磁盘损坏情况：`

`（12）使用mdadm /dev/md1 -f /dev/sdc3 来模拟/dev/sdc3磁盘已经损坏`
`（13）使用mdadm /dev/md1 -r /dev/sdc3 来移除该损坏的硬盘`
`（14）使用[root@localhost ~]# ls /root/raid 查看发现该磁盘阵列还能正常使用`
`（15）使用[root@localhost ~]# mdadm -D /dev/md1 查看发现只有3块硬盘可以工作了。`

`5、用新的硬盘进行热替换：`

`（16）使用[root@localhost ~]# mdadm /dev/md1 -a /dev/sdc6 新添加一块新的硬盘`
`（17）使用[root@localhost ~]# mdadm -D /dev/md1查看发现该磁盘阵列会自动完成数据重建工作`

`6、删除磁盘阵列：`

`（18）使用umount /dev/md1卸载该磁盘阵列`
`（19）使用mdadm --stop /dev/md1 删除该磁盘阵列`
`（20）使用lsblk -f 命令查看硬盘情况，看是否完成磁盘阵列的删除工作`



### 6、逻辑卷管理LVM

