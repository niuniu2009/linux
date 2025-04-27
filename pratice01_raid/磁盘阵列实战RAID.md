# 磁盘阵列实战RAID

本次实战首先创建了一个4块硬盘构成磁盘阵列，然后模拟其中一块硬盘损坏的情况下，替换后重建该磁盘阵列，以及删除磁盘阵列的过程。感兴趣的同学可以自己动手试一试。

![10](%E7%A3%81%E7%9B%98%E9%98%B5%E5%88%97%E5%AE%9E%E6%88%98RAID.assets/10-17450718446722.gif)

## 1、创建磁盘阵列

第1步：关闭虚拟机，按照向导添加5块硬盘，如下图所示：

![image-20250419203216608](C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20250419203216608.png)

第2步：启动虚拟机，开启终端，使用lsblk命令可以看到刚才新添加的5块硬盘，分别是sdb, sdc, sdd, sde, sdf

![image-20250419203833523](C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20250419203833523.png)

第3步：使用如下命令创建RAID，磁盘阵列名称为/dev/md0

```bash
# mdadm 用法详解：
#     -C 创建磁盘阵列  -v 显示创建的过程  /dev/md0 磁盘阵列的名称  -n 4 使用4块硬盘   -l 10 创建raid-10阵列
[root@lsr ~]# mdadm -Cv /dev/md0 -n 4 -l 10 /dev/sdb /dev/sdc /dev/sdd /dev/sde

# 查看磁盘阵列md0的详细信息
[root@lsr ~]# mdadm -D /dev/md0
/dev/md0:
           Version : 1.2
     Creation Time : Sat Apr 19 20:41:54 2025
        Raid Level : raid10
        Array Size : 41908224 (39.97 GiB 42.91 GB)              # 容量是40G
     Used Dev Size : 20954112 (19.98 GiB 21.46 GB)
      Raid Devices : 4                                          # 4块硬盘构成
...
            
    # 4块硬盘的详细信息
    Number   Major   Minor   RaidDevice State 
       0       8       16        0      active sync set-A   /dev/sdb
       1       8       32        1      active sync set-B   /dev/sdc
       2       8       48        2      active sync set-A   /dev/sdd
       3       8       64        3      active sync set-B   /dev/sde

```

第4步：格式化磁盘阵列；新建一个目录，把该磁盘阵列挂载到该目录

```bash
# 格式化磁盘阵列
[root@lsr ~]# mkfs.xfs -f  /dev/md0

# 新建一个马路
[root@lsr ~]# mkdir raid

# 挂载磁盘阵列
[root@lsr ~]# mount -t xfs /dev/md0 /root/raid/

# 查看挂载情况
[root@lsr ~]# df -h /dev/md0
文件系统        容量  已用  可用 已用% 挂载点
/dev/md0         40G   33M   40G    1% /root/raid

# 查看该磁盘阵列的inode使用情况，已用的inode是3个
[root@lsr ~]# df -i /dev/md0
文件系统          Inode 已用(I)  可用(I) 已用(I)% 挂载点
/dev/md0       20951040       3 20951037       1% /root/raid

# 在该磁盘阵列上新建10个文件
[root@lsr ~]# touch /root/raid/hello{1..10}
[root@lsr ~]# ls /root/raid
hello1  hello10  hello2  hello3  hello4  hello5  hello6  hello7  hello8  hello9

# 可以看出又消耗了10个inode
[root@lsr ~]# df -i /dev/md0
文件系统          Inode 已用(I)  可用(I) 已用(I)% 挂载点
/dev/md0       20951040      13 20951027       1% /root/raid
```

## 2、模拟磁盘阵列中一块硬盘损坏

第5步：模拟一块硬盘损坏

```bash
# 模拟一块硬盘损坏
[root@lsr ~]# mdadm /dev/md0 -f /dev/sdb
mdadm: set /dev/sdb faulty in /dev/md0

# 查看磁盘阵列，发现只有3块硬盘工作了
[root@lsr ~]# mdadm -D /dev/md0
/dev/md0:
  ...
   Working Devices : 3             # 工作硬盘的数量3个
    Failed Devices : 1             # 损坏的硬盘数量1个
...
    
    Number   Major   Minor   RaidDevice State
       -       0        0        0      removed
       1       8       32        1      active sync set-B   /dev/sdc
       2       8       48        2      active sync set-A   /dev/sdd
       3       8       64        3      active sync set-B   /dev/sde
    
       0       8       16        -      faulty   /dev/sdb
```

第6步：移除损坏的硬盘

```bash
# 移除损坏的硬盘
[root@lsr ~]# mdadm /dev/md0 -r /dev/sdb
mdadm: hot removed /dev/sdb from /dev/md0

# 查看移除后的磁盘阵列
[root@lsr ~]# mdadm -D /dev/md0
/dev/md0:
...
State : clean, degraded      # 磁盘阵列的状态是降级

Number   Major   Minor   RaidDevice State
   -       0        0        0      removed
   1       8       32        1      active sync set-B   /dev/sdc
   2       8       48        2      active sync set-A   /dev/sdd
   3       8       64        3      active sync set-B   /dev/sde
```

第7步：用新的硬盘sdf代替sdb，并重建磁盘阵列

```bash
# 这里可以看出，原来创建的10个文件当然在磁盘阵列上，也就是说一块硬盘损坏，并不影响磁盘阵列上的数据
[root@lsr ~]# ls /root/raid/
hello1  hello10  hello2  hello3  hello4  hello5  hello6  hello7  hello8  hello9

# 把硬盘sdf添加到磁盘阵列中
[root@lsr ~]# mdadm /dev/md0 -a /dev/sdf

[root@lsr ~]# mdadm -D /dev/md0
/dev/md0:
...
      Raid Devices : 4                                                # 硬盘数量4个
      State : clean, degraded, recovering                             # 状态是降级，恢复中 
...
    Rebuild Status : 70% complete                                     # 正在重建RAID 已恢复70%
...
    Number   Major   Minor   RaidDevice State
       4       8       80        0      spare rebuilding   /dev/sdf    # 这里的sdf替换了sdb
       1       8       32        1      active sync set-B   /dev/sdc
       2       8       48        2      active sync set-A   /dev/sdd
       3       8       64        3      active sync set-B   /dev/sde
       
# 过一会儿，再次查看
[root@lsr ~]# mdadm -D /dev/md0
/dev/md0:
...
       Update Time : Sat Apr 19 21:49:59 2025
             State : clean                                          # 状态是clean，表示已经完成了重建
    Active Devices : 4
...
    Number   Major   Minor   RaidDevice State
       4       8       80        0      active sync set-A   /dev/sdf
       1       8       32        1      active sync set-B   /dev/sdc
       2       8       48        2      active sync set-A   /dev/sdd
       3       8       64        3      active sync set-B   /dev/sde

# 再次查看磁盘阵列上文件，仍然存在
[root@lsr ~]# ls /root/raid
hello1  hello10  hello2  hello3  hello4  hello5  hello6  hello7  hello8  hello9

```

## 3、删除磁盘阵列

第8步：按照如下步骤删除一个磁盘阵列

```
# 首先卸载磁盘阵列
[root@lsr ~]# umount /dev/md0

# 停止磁盘阵列
[root@lsr ~]# mdadm --stop /dev/md0
mdadm: stopped /dev/md0

# 再次查看，这里的几块硬盘又恢复到最初的状态
[root@lsr ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
...
sdb               8:16   0   20G  0 disk
sdc               8:32   0   20G  0 disk
sdd               8:48   0   20G  0 disk
sde               8:64   0   20G  0 disk
sdf               8:80   0   20G  0 disk
...
```

到这里，整个磁盘阵列的实践结束，有兴趣么？试一试