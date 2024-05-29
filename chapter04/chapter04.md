# chapter04

Linux文本处理的三剑客。

```bash
#!/bin/bash
#一个例子演示：Linux三剑客：grep  awk   sed    管道 |    重定向 >
#ifconfig ens33 显示网卡ens33的详细信息
#grep "inet "  搜索包含"inet "字符串的那一行并输出到屏幕上
#sed 's/\./\#/g'   sed是一个流式处理命令，'s/\./\#/g' 该模式的含义是s表示替换，g表示全局替换，这里表示把字符.全局替换成#
#awk '{print $2}'  awk以列的形式分割每一行的各个字段，这里表示打印第二个字段
#  |  表示管道
#  >  表示重定向
#  每个命令的具体使用参考有道云笔记的“Linux三剑客”篇

ifconfig ens33 | grep "inet "| sed 's/\./\#/g' |awk '{print $2}' > 5.txt
```

## grep 

文本搜索工具，擅长查找与筛选

- 正则表达式

```bash
#正则表达式分为标准正则表达式和扩展表达式
#标准正则表达式需要转义

#第一类：匹配字符和次数
.        匹配任意单个字符                            .
*        匹配其前面的字符任意次                        *           
.*        匹配任意长度的任意字符                        
\?        匹配其前面的字符0次或者1次                    ?
\{m,n\}    匹配其前面的字符至少m次，最多n次
\{m\}    匹配其前面字符m次
\{0,n\}    匹配其前面字符最多n次
\{1，\}    匹配其前面字符至少1次，最多无限次            + { }
[ ]    匹配指定范围内的任意单个字符                    [ ]
[^]    匹配指定范围外的任意单个字符                    [^ ]
#第二类：匹配字符集合
[[：digit:]]    匹配单个数字，等价于[0-9]
[[：lower:]]    匹配单个小写字母，等价于[a-z]
[[：upper:]]    匹配单个大写字母，等价于[A-Z]
[[：punct:]]    匹配单个标点字符
[[：space:]]    匹配单个空白字符
#第三类：位置锚定匹配
^    锚定行首
$    锚定行尾
^$    空白行
\<    锚定词首
\>    锚定词尾
\<  \>    中间添加的任意字符必须精确匹配
#第四类
\(  \)    使括号内的内容称为一组，一个整体
\1    引用第一个左括号和与之对应的右括号之间包括的所有内容
```

- grep 举例

```bash
#例题1：以l开头的行
[root@localhost ~]# grep -in '^l' /etc/passwd
5:lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
29:libstoragemgmt:x:986:986:daemon account for libstoragemgmt:/:/usr/sbin/nologin
48:lsr:x:1000:1000:lsr:/home/lsr:/bin/bash

#例题2：以aZ字母开头的行
[root@localhost ~]# grep -in '^[aZ]' /etc/passwd
4:adm:x:3:4:adm:/var/adm:/sbin/nologin
20:avahi:x:70:70:Avahi mDNS/DNS-SD Stack:/var/run/avahi-daemon:/sbin/nologin
49:apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
51:zhangsan:x:1002:1002::/home/zhangsan:/bin/bash

#例题3：不包含/bin/bash字符串的行
[root@localhost ~]# grep -v '/bin/bash' /etc/passwd
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin

#例题4：搜索包含root字符串的行，行首包含文件名或不加文件名
[root@localhost ~]# grep -h 'root' /etc/passwd /etc/group
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
root:x:0:
[root@localhost ~]# grep -H 'root' /etc/passwd /etc/group
/etc/passwd:root:x:0:0:root:/root:/bin/bash
/etc/passwd:operator:x:11:0:operator:/root:/sbin/nologin
/etc/group:root:x:0:

#例题5：以大写字母开头的文件
[root@localhost ~]# ls |grep '^[A-Z]'
Hello.txt

#例题6：获取操作系统中网卡的MAC的地址 :利用了三种匹配方式，[ ]    \( \)     \{ \}
[root@localhost ~]# ifconfig |grep ether|head -n 1|grep -o "[a-f0-9A-F]\\([a-f0-9A-F]\\:[a-f0-9A-F]\\)\\{5\\}[a-f0-9A-F]"
02:42:bf:0f:c7:06
```

[linux三剑客之一（grep） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/415394105)

## sed

面相字节流的编辑器，截取行和替换

```bash
# 语法：
#sed   [选项]  'script'   文件名
'script'包含两个内容：一个是地址定界，明确要操作的范围；另一个是操作命令，例如替换、插入等
#地址定界
单地址：
n    指定第n行，对此行进行编辑操作
/pattern/    指定模式匹配到的每一行
地址范围：
n,m    从第n行开始至第m行的范围
n,+m    从第n行开始至往后m行的范围
n,/pattern/   从第n行开始，至指定模式匹配到的那一行
步进：
1~2    以1为起始行，步进2行向下匹配，表示所有的奇数行
2~2    表示所有的偶数行

#操作命令
a    在匹配行下面插入
i    在匹配行上面插入
c    将匹配的行替换为指定的内容
d    删除指定的行
y    替换匹配的字符
r    读取指定文件内容并添加到目标文件指定行的下面

[address]s/pattern/replacement/flags
[address]表示地址定界
s  替换操作
/: 分隔符
pattern 需要替换的内容
replacement 要替换的新内容
flags 标记或功能，包括下面几个：
(1)n:1-512之间的数字，表示指定要替换的字符串出现第几次时才进行替换操作
(2)g: 对所有匹配到的内容进行替换
(3)p: 打印在替换命令中指定模式匹配的行
(4)w file 将缓冲区中的内容另存到指定的文件中
(5)&： 用正则表达式匹配的内容进行替换
(6)\n 匹配第n个子串，该标记会在pattern中用\( \)指定
```

- sed举例

```bash
#例题：替换字符串
[root@localhost temp]# echo "root" > 1.txt
[root@localhost temp]# cat 1.txt
root
[root@localhost temp]# sed 's/root/ROOT/' 1.txt
ROOT
[root@localhost temp]# cat 1.txt
root

#例题2：将/bin/bash替换为/sbin/nologin    g进行全局替换
[root@localhost temp]# sed 's/\/bin\/bash/\/sbin\/nologin/g' 1.txt
root:x:0:0:root:/root:/sbin/nologin
bin:x:1:1:bin:/bin:/sbin/nologin

#例题3：将每一行的第二次匹配到的：替换成#
[root@localhost temp]# sed 's/\:/\#/2' 1.txt |head -n 2
root:x#0:0:root:/root:/bin/bash
bin:x#1:1:bin:/bin:/sbin/nologin

#例题4：打印包含两个o的字符的行
[root@localhost temp]# sed -nr '/o{2}/'p 1.txt
root:x:0:0:root:/root:/bin/bash
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin

#例题5：打印包含5个数字的行
[root@localhost temp]# sed -nr '/[0-9]{5}/'p  1.txt
nobody:x:65534:65534:Kernel Overflow User:/:/sbin/nologin

#例题6：将1.txt文件的1--10行内容中的root替换成ABCD。
[root@localhost temp]# sed -n '1,10s/root/ABCD/gp' 1.txt
ABCD:x:0:0:ABCD:/ABCD:/bin/bash
operator:x:11:0:operator:/ABCD:/sbin/nologin
```

[linux三剑客之二（sed） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/415806422)

## awk

文本分析工具，擅长截取列和数据分析

```bash
#awk会将文件逐行读入，以单行内容内容为处理单位，接着以分隔符进行切片成数据字段，再对数据字段进行各种分析处理。
#awk [选项]  'pattern{command}' 文件名

#例题1：输出以冒号为分隔符的第1,3,6,7四个字段
[root@localhost temp]# awk -F ':' '{print $1,$3,$6,$7}' /etc/passwd | head -n 2
root 0 /root /bin/bash
bin 1 /bin /sbin/nologin

#例题2：
[root@localhost temp]# awk 'BEGIN{FS=":"}{print $1,$2}' /etc/passwd | head -n 2
root x
bin x

#例题3：
[root@localhost temp]# awk 'BEGIN{FS=":";OFS="+++"}{print  $1,  $2,$3}' /etc/passwd |head -n 2
root+++x+++0
bin+++x+++1

#例题4：
[root@localhost temp]# awk -F ":" '$3>999' /etc/passwd
nobody:x:65534:65534:Kernel Overflow User:/:/sbin/nologin
lsr:x:1000:1000:lsr:/home/lsr:/bin/bash
tigerVNC:x:1001:1001::/home/tigerVNC:/bin/bash
zhangsan:x:1002:1002::/home/zhangsan:/bin/bash

#例题4：
[root@localhost temp]# awk -F ":" '$3>999{print $1,$2}' /etc/passwd
nobody x
lsr x
tigerVNC x
zhangsan x

#例题5：
[root@localhost temp]# awk '{i++;print $0;}END{print "user total is ",i}' /etc/passwd | tail -n 1
user total is  53

#例题6：
[root@localhost temp]# ifconfig ens160 | awk -F  "[ ]+" '/inet /{print $3}'
192.168.14.137
[root@localhost temp]# ifconfig ens160 | awk -F  "[ ]+" '/inet /{print $5}'
255.255.255.0
[root@localhost temp]# ifconfig ens160 | awk -F "[ ]+" '/ether /{print $3}'
00:0c:29:ca:bc:66

#例题7：
[root@localhost temp]# ls -l /etc/*.conf | awk 'BEGIN {size=0;}{size=size+$5;}END{print "所有.conf结尾的文件总大小是"size"字节"}'
所有.conf结尾的文件总大小是153474字节
```

- [20分钟降服Linux三剑客老大awk，让人拍案叫绝 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/518549290)

## 神奇的管道

命令1  |  命令2

```bash
#举例1：管道符+grep实现行过滤
[root@localhost temp]# ls /etc/ | grep "passwd"
passwd
passwd-
[root@localhost temp]# ls /etc/ | grep "^p"
pam.d
papersize

#举例2：管道符+tail实现过滤开头和结尾的行
[root@localhost temp]# cat /etc/passwd | head -n 2
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
[root@localhost temp]# cat /etc/passwd | tail -n 2
nginx:x:975:970:Nginx web server:/var/lib/nginx:/sbin/nologin
mysql:x:27:27:MySQL Server:/var/lib/mysql:/sbin/nologin

#举例3：管道符和awk的连用
[root@localhost temp]# ls -l | awk '{print $1}'| head -n 2
总用量
-rw-r--r--
[root@localhost temp]# cat /var/log/messages | awk '{if( $3 < "19:0"0 && $3 > "18:45") print $0}'
Mar 14 18:45:48 localhost NetworkManager[998]: <info>  [1710413148.3812] dhcp4 (ens160): state changed new lease, address=192.168.14.137
Mar 14 18:45:48 localhost systemd[1]: Starting Network Manager Script Dispatcher Service...
Mar 14 18:45:48 localhost systemd[1]: Started Network Manager Script Dispatcher Service.
Mar 14 18:45:58 localhost systemd[1]: NetworkManager-dispatcher.service: Deactivated successfully.

#举例4：管道符做统计使用
[root@localhost temp]# cat /var/log/messages | wc -l
3880
```

[Linux中的管道命令使用 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/447595852)

## 重定向

```bash
#例题1：输出重定向
[root@localhost temp]# echo "hello" > 1.txt
[root@localhost temp]# cat 1.txt
hello
[root@localhost temp]# echo "你好" > 1.txt
[root@localhost temp]# cat 1.txt
你好

#例题2：追加重定向
[root@localhost temp]# echo "大家好" > 1.txt
[root@localhost temp]# cat 1.txt
大家好
[root@localhost temp]# echo "你好啊" >> 1.txt
[root@localhost temp]# cat 1.txt
大家好
你好啊
[root@localhost temp]# for i in `seq 1 10000`; do echo $i; done >> 2.txt
[root@localhost temp]# free -m | awk '{print $1}'
total
Mem:
Swap:
[root@localhost temp]# free -m | awk '{print $1}' > 3.txt
[root@localhost temp]# cat 3.txt
total
Mem:
Swap:

#例题3：错误重定向
[root@localhost temp]# cat test01 2> error.log
[root@localhost temp]# cat error.log
cat: test01: 没有那个文件或目录

#例题4：输入重定向
[root@localhost temp]# wc -l < 1.txt
2
```

