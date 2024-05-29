# Chapter03 

## Linux登录

Linux默认系统开启了6个字符终端，1个图形界面。

```bash
#登录时密码没有提示符；
#退出时使用logout

#超级用户
[root@hecs-86034 ~]# whoami
root
#普通用户
[zhangsan@hecs-86034 ~]$ whoami
zhangsan
[zhangsan@hecs-86034 ~]$
```

远程通过ssh登录。

## 关机和重启

```shell
#第一个命令 shutdown
[zhangsan@hecs-86034 ~]$ shutdown --help
shutdown [OPTIONS...] [TIME] [WALL...]

Shut down the system.

     --help      Show this help
  -H --halt      Halt the machine
  -P --poweroff  Power-off the machine
  -r --reboot    Reboot the machine
  -h             Equivalent to --poweroff, overridden by --halt
  -k             Don't halt/power-off/reboot, just send warnings
     --no-wall   Don't send wall message before halt/power-off/reboot
  -c             Cancel a pending shutdown
举例：现在立刻关机
[root@hecs-86034 ~]# shutdown -h now
举例：45分钟后关机
[root@hecs-86034 ~]# shutdown -h +45
举例：23点55分重新启动计算机
[root@hecs-86034 ~]# shutdown -r 23:55

#关机和重启的另外两个命令
[root@hecs-86034 ~]# halt
[root@hecs-86034 ~]# reboot
```

## Linux的5个启动目标

```shell
[root@hecs-86034 ~]# ls -l /lib/systemd/system/run*.target
lrwxrwxrwx 1 root root 15 12月 28 10:57 /lib/systemd/system/runlevel0.target -> poweroff.target
lrwxrwxrwx 1 root root 13 12月 28 10:57 /lib/systemd/system/runlevel1.target -> rescue.target
lrwxrwxrwx 1 root root 17 12月 28 10:57 /lib/systemd/system/runlevel2.target -> multi-user.target
lrwxrwxrwx 1 root root 17 12月 28 10:57 /lib/systemd/system/runlevel3.target -> multi-user.target
lrwxrwxrwx 1 root root 17 12月 28 10:57 /lib/systemd/system/runlevel4.target -> multi-user.target
lrwxrwxrwx 1 root root 16 12月 28 10:57 /lib/systemd/system/runlevel5.target -> graphical.target
lrwxrwxrwx 1 root root 13 12月 28 10:57 /lib/systemd/system/runlevel6.target -> reboot.target

[root@hecs-86034 ~]# systemctl get-default
multi-user.target
[root@hecs-86034 ~]# systemctl get-default multi-user.target
```

## 有趣的Linux命令

基于[oeasy 带你学 Linux 之零基础快速上手](https://www.lanqiao.cn/courses/2712)平台演示：

> - cowsay
> - cmatrix
> - bastet
> - sl
> - fortune
> - fortune-zh

```shell
[root@hecs-86034 ~]# man shutdown
[root@hecs-86034 ~]# info shutdown
[root@hecs-86034 ~]# shutdown --help
```

## shell常用功能

- 自动补全：命令的自动补全、文件名的自动补全
- 历史记录：.bash_history
- 命令替换：两种方法

```bash
# `` $( )
[root@localhost ~]# echo `date`
2024年 03月 13日 星期三 21:56:47 CST
[root@localhost ~]# echo $(date)
2024年 03月 13日 星期三 21:56:53 CST
```



- 整数运算：

```bash
# $(( ))
[root@localhost ~]# echo $((2+3))
5
[root@localhost ~]# i=2;j=3
[root@localhost ~]# echo $((i+j))
5
[root@localhost ~]# echo $((i*j))
6
```



- 通配符：

```bash
# ? * [^123]  {1..5}
[root@localhost temp]# touch a{1..5}
[root@localhost temp]# ls a*
a0  a{0-5}  a1  a1.hard  a1.soft  a2  a3  a4  a5  ab  a.bak  ac  ae  aff
[root@localhost temp]# ls a?
a0  a1  a2  a3  a4  a5  ab  ac  ae
[root@localhost temp]# ls a[^1234]
a0  a5  ab  ac  ae
```



- 多个命令连续执行：

```bash
#三种方法 ；   &&   || 
#连续执行两个命令
[root@localhost temp]# ls -a ;pwd
.  ..  a0  a{0-5}  a1  a1.hard  a1.soft  a2  a3  a4  a5  ab  a.bak  ac  ae  aff  pipe1
/root/temp
#第一个命令正确执行，再执行第二个命令
[root@localhost temp]# ls -a && pwd
.  ..  a0  a{0-5}  a1  a1.hard  a1.soft  a2  a3  a4  a5  ab  a.bak  ac  ae  aff  pipe1
/root/temp
#第一个不正确，才执行第二个命令
[root@localhost temp]# ls -a || pwd
.  ..  a0  a{0-5}  a1  a1.hard  a1.soft  a2  a3  a4  a5  ab  a.bak  ac  ae  aff  pipe1
```



- 命令别名：

```
#alias
[root@almalinux ~]# alias
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'

#unalias 取消一个别名
```



## Linux目录结构

```shell
[root@almalinux ~]# tree -L 1 /
/
├── afs
├── bin -> usr/bin
├── boot
├── dev
├── etc
├── home
├── lib -> usr/lib
├── lib64 -> usr/lib64
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/sbin
├── srv
├── sys
├── tmp
├── usr
├── var
21 directories, 6 files
```

## 绝对路径和相对路径

```shell
#绝对路径
[root@localhost temp]# ls -l  /root/temp/a2
-rw-r--r-- 1 root root 0  3月 12 20:23 /root/temp/a2
[root@localhost temp]# pwd
/root/temp
[root@localhost temp]# cd ..
[root@localhost ~]# pwd
/root
[root@localhost ~]# cd ..
[root@localhost /]# cd ~
[root@localhost ~]# pwd
/root
[root@localhost ~]# cd ~/temp/
[root@localhost temp]# pwd
/root/temp
#相对路径
```

## 编辑器

- 命令行编辑器 vi  nano等
- 图形界面编辑器Emacs   VSCode   gedit等

推荐资源：

- [oeasy 教您零基础玩转 Vim编辑神器_Linux - 蓝桥云课 (lanqiao.cn)](https://www.lanqiao.cn/courses/2840)
- [Vim 基础入门_Linux - 蓝桥云课 (lanqiao.cn)](https://www.lanqiao.cn/courses/2)

## 管道

- [Linux Shell管道详解 - 温家三哥 - 博客园 (cnblogs.com)](https://www.cnblogs.com/w-j-q/p/14833714.html)

## 重定向

- [Linux Shell重定向（输入输出重定向）精讲 - 温家三哥 - 博客园 (cnblogs.com)](https://www.cnblogs.com/w-j-q/p/14832492.html)

