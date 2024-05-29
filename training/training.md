# Linux综合实训指导

时间计划：

- 任务1：Linux系统管理            3天

- 任务2：Linux磁盘管理  LVM RAID     3天

- 任务3：SHELL编程                             2天

- 任务4：Linux服务器及防火墙配置       2天

  

## 任务1 Linux系统管理 3天

- 基础命令
- 目录结构
- 用户管理
- 权限管理
- 软件安装
- 网络配置

### 环境配置

- 第一步：新建虚拟机
- 下载并安装vmware workstation（通过博通官网，注册账号后可以下载，对个人用户免费）[下载VMware17 视频教程](https://www.bilibili.com/video/BV1o7421o7Vt/?spm_id_from=333.788.recommend_more_video.1&vd_source=c7b66582e4bea8e9a772ca334df24fe5)
- vmware 三种网络模式         [VMware虚拟机三种网络模式](https://www.toutiao.com/article/7301587787995038245/)     [三种网络模式图解2](https://www.toutiao.com/article/7147892994501493285/?channel=&source=search_tab)
- 按照如下的步骤新建一个虚拟机：

<img src="training.assets/image-20240528202650090.png" alt="image-20240528202650090"  />



![image-20240528202730960](training.assets/image-20240528202730960.png)

![image-20240528202746927](training.assets/image-20240528202746927.png)

![image-20240528202803960](training.assets/image-20240528202803960.png)

![image-20240528202837790](training.assets/image-20240528202837790.png)



![image-20240528202912784](training.assets/image-20240528202912784.png)

![image-20240528202929270](training.assets/image-20240528202929270.png)

![image-20240528202959056](training.assets/image-20240528202959056.png)

![image-20240528203010822](training.assets/image-20240528203010822.png)



![image-20240528203021208](training.assets/image-20240528203021208.png)

![image-20240528203035247](training.assets/image-20240528203035247.png)

![image-20240528203048385](training.assets/image-20240528203048385.png)



![image-20240528203104416](training.assets/image-20240528203104416.png)

![image-20240528203135751](training.assets/image-20240528203135751.png)

![image-20240528203204478](training.assets/image-20240528203204478.png)

![image-20240528203227210](training.assets/image-20240528203227210.png)

- 第二步：下载Linux发行版，并安装操作系统。

下载喜欢的Linux发行版：

> 国内常用Linux开源镜像站：
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

这里以下载centos7.9版本为例。地址：[centos-7.9.2009-isos-x86_64安装包下载_开源镜像站-阿里云 (aliyun.com)](https://mirrors.aliyun.com/centos/7.9.2009/isos/x86_64/?spm=a2c6h.25603864.0.0.1f64f5adCnsNRv)

![image-20240528203832847](training.assets/image-20240528203832847.png)

下载这里的Centos-7-x86-Everything-2207-02.iso。保存至电脑的D:/temp/centos7目录内。

下面开始安装Linux。

![image-20240528204211329](training.assets/image-20240528204211329.png)

![image-20240528204301313](training.assets/image-20240528204301313.png)

![image-20240528204420718](training.assets/image-20240528204420718.png)

![image-20240528204757073](training.assets/image-20240528204757073.png)

![image-20240528204920044](training.assets/image-20240528204920044.png)

![image-20240528205009172](training.assets/image-20240528205009172.png)

![image-20240528205040378](training.assets/image-20240528205040378.png)

![image-20240528205133001](training.assets/image-20240528205133001.png)

![image-20240528205151241](training.assets/image-20240528205151241.png)

![image-20240528205236810](training.assets/image-20240528205236810.png)

![image-20240528205309849](training.assets/image-20240528205309849.png)

![image-20240528205400274](training.assets/image-20240528205400274.png)

点击“开始安装”按钮。开始安装过程。

![image-20240528205425978](training.assets/image-20240528205425978.png)

点击“ROOT密码”，给超级用户root设置密码。

![image-20240528205450809](training.assets/image-20240528205450809.png)

点击“完成”，等待安装。

![image-20240528205526770](training.assets/image-20240528205526770.png)

点击“创建用户”，可以设置普通用户账号。

![image-20240528205614898](training.assets/image-20240528205614898.png)

点击“完成”，等待安装。

![image-20240528205635525](training.assets/image-20240528205635525.png)

耐心等待安装过程，可能需要几分钟。

![image-20240528210649607](training.assets/image-20240528210649607.png)

![image-20240528210825096](training.assets/image-20240528210825096.png)

![image-20240528210846543](training.assets/image-20240528210846543.png)



![image-20240528210907711](training.assets/image-20240528210907711.png)

![image-20240528210953760](training.assets/image-20240528210953760.png)

![image-20240528211025064](training.assets/image-20240528211025064.png)

![image-20240528211111704](training.assets/image-20240528211111704.png)

![image-20240528211136177](training.assets/image-20240528211136177.png)

![image-20240528211154065](training.assets/image-20240528211154065.png)

![image-20240528211208400](training.assets/image-20240528211208400.png)

![image-20240528211224834](training.assets/image-20240528211224834.png)

![image-20240528211245062](training.assets/image-20240528211245062.png)

- 第三步：Windows登录Linux。

首先需要保证虚拟机中的Linux的ssh服务正常启动，并且22端口出于监听状态。默认情况下，按照上述步骤安装完成后，sshd服务就是处于启动状态，22号端口也是处于可连接状态。

可以确认一下：

![image-20240528211829116](training.assets/image-20240528211829116.png)

![image-20240528211931985](training.assets/image-20240528211931985.png)

那么接下来就可以通过22号端口远程登录这台Linux服务器了。在远程连接之前首先查看Linux的IP地址。

![image-20240528212206345](training.assets/image-20240528212206345.png)

上图中的ens33就是Linux服务器的网络接口，其IP地址是192.168.204.128

- windows下载并安装MobaXterm   地址： [MobaXterm Xserver with SSH, telnet, RDP, VNC and X11 - Home Edition (mobatek.net)](https://mobaxterm.mobatek.net/download-home-edition.html)

下载解压后，不用安装即可使用。

![image-20240528212504479](training.assets/image-20240528212504479.png)

这里选择“session”按钮，

![image-20240528212624831](training.assets/image-20240528212624831.png)

![image-20240528212645975](training.assets/image-20240528212645975.png)

在下图中，输入密码，提示：这里输入密码的时候，屏幕没有任何提示。只要输入正确，输入完成回车即可。

![image-20240528212709159](training.assets/image-20240528212709159.png)

![image-20240528212808485](training.assets/image-20240528212808485.png)

上图中选择“No”就可以。

![image-20240528212844128](training.assets/image-20240528212844128.png)

这里就登录到了Linux服务器。可以通过命令行管理Linux系统了。

### 为了减少不必要的错误，关闭selinux

完成上述环境配置后，关闭selinux。

关闭selinux的步骤如下所示：

```
# 查看selinux的状态，这里可以看到默认情况下，selinux是处于enabled的状态，也就是开启的状态。
[root@bogon ~]# sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      31

# 可以使用nano编辑器修改/etc/selinux/config文件
[root@bogon ~]# nano /etc/selinux/config
找到文件中的这一行  SELINUX=enforcing
修改为 SELINUX=disabled
然后保存即可。

```

这里如果不喜欢使用命令行下的编辑器，也可以通过Mobaxterm远程修改Linux服务器上的文件。
步骤如下所示：

![image-20240528214009926](training.assets/image-20240528214009926.png)

![image-20240528214035119](training.assets/image-20240528214035119.png)

![image-20240528214111807](training.assets/image-20240528214111807.png)

上图所示的编辑器就远程打开了Linux服务器上的/etc/selinux/config文件，

找到文件中的这一行  SELINUX=enforcing
修改为 SELINUX=disabled

修改完成后，保存即可。

不管是使用哪种方式，修改完成后，重新启动Linux。

![image-20240528214651495](training.assets/image-20240528214651495.png)

提示：重新启动后，需要重新远程连接Linux服务器。

至此，所有的基础环境准备工作已经完成。

## 任务2 磁盘实训：fdisk、RAID和LVM 3天

实验指导书：

[第6章 存储结构与管理硬盘 | 《Linux就该这么学》 (linuxprobe.com)](https://www.linuxprobe.com/basic-learning-06.html)

[第7章 使用RAID与LVM磁盘阵列技术 | 《Linux就该这么学》 (linuxprobe.com)](https://www.linuxprobe.com/basic-learning-07.html)

## 任务3  SHELL编程  时间：3天

例题1：探测服务器的信息。

```bash
#第一个例子，探测主机信息
[zhangsan@localhost ~]$ vi example7.sh
#!/bin/bash
name=`hostname`
ip=`ifconfig ens160|awk /netmask/'{print $2}'`
os=`cat /etc/redhat-release`
kernel=`uname -r`
cpu=`lscpu|grep 厂商|tr -s " "|cut -d " " -f1 --complement`
mem=`free -hm |awk /Mem/'{print $2}'`

#----------------------------------------------------------
# 这里是计算硬盘的总大小
#----------------------------------------------------------
space=`lsblk |awk /disk/'{print $4}'|awk -F G '{print $1}'`
G="\e[1;32m"
B="\e[1;34m"
E="\e[0m"
#如果有多块硬盘的话，就循环计算所有的硬盘的总容量的大小
for i in $space
do
        let sum=$[$sum+$i]
done

echo -e "$B主机名：$E$G\t$name\t$E"
echo -e "${B}ip地址:$E$G\t$ip\t$E"
echo -e "$B系统版本：$E$G\t$os\t$E"
echo -e "$B内核版本：$E$G\t$kernel\t$E"
echo -e "${B}cpu名称：$E$G\t$cpu\t$E"
echo -e "$B内存总大小：$E$G\t$mem\t$E"
echo -e "$B硬盘总大小：$E$G\t${sum}G\t$E"
[zhangsan@localhost ~]$chmod u+x example7.sh
[zhangsan@localhost ~]$ ./example7.sh
主机名：    localhost.localdomain
ip地址:    192.168.14.140
系统版本：    Red Hat Enterprise Linux release 9.1 (Plow)
内核版本：    5.14.0-162.23.1.el9_1.aarch64
cpu名称：    ID： Apple
内存总大小：    1.7Gi
硬盘总大小：    38G
```

例题2：

```bash
#第二个例子，测试整个网段有哪些主机上线
[zhangsan@localhost ~]$ vi example8.sh
#!/bin/bash
#编写脚本测试192.168.14.*整个网段中哪些主机处于开机状态，哪些主机处于关机状态。
for i in {1..254}
do
        #每隔0.3秒ping一次，一共ping2次，并以1毫秒为单位设置ping的超时时间
        ping -c 2 -i 0.3 -W 1 192.168.14.$i &>/dev/null
        if [ $? -eq 0 ]
        then
                echo "192.168.14.$i is up"
        else
                echo "192.168.14.$i is down"
        fi
done
[zhangsan@localhost ~]$ chmod u+x example8.sh
[zhangsan@localhost ~]$ ./example8.sh
192.168.14.1 is up
192.168.14.2 is up
192.168.14.3 is down
192.168.14.4 is down
192.168.14.5 is down
...
```

例题3：多线程扫描网段

```bash
#!/bin/bash
#编写脚本测试192.168.14.*整个网段中哪些主机处于开机状态，哪些主机处于关机状态。
#example8.sh这个程序是一个多线程的，速度较快
#example8-2.sh时一个单线程的，速度较慢

#清空当前目录下up.txt文件和down.txt的内容
 > up.txt
 > down.txt
#记录程序开始执行的时间
start_time=`date +%s`
for i in {1..10}
do
        #每隔0.3秒ping一次，一共ping2次，并以1毫秒为单位设置ping的超时时间
        ping -c 2 -i 0.3 -W 1 172.21.3.$i &>/dev/null

        (if [ $? -eq 0 ]
        then
                echo "172.21.3.$i is up" >> up.txt    #能够ping通的记录在up.txt文件中
        else
                echo "172.21.3.$i is down" >> down.txt  #不能够ping通记录在down.txt文件中
        fi)&   #把一个命令放进后台运行，相当于启动了一个独立的线程，这种方式是修改为并行多线程执行，调高效率。

done
        wait   #每个线程执行的时间不一样，这里等待所有的线程执行完毕
stop_time=`date +%s`   #所有线程执行完毕以后，记录结束时间
echo "时间：`expr $stop_time - $start_time`秒"  #计算一共花费了多长时间

#输出有多少线上的机器，多少线下的机器。
echo `cat up.txt | wc -l`hosts are up.
echo `cat down.txt | wc -l`hosts are down.
```

例题4：单线程扫描网段

```bash
#!/bin/bash
#编写脚本测试192.168.14.*整个网段中哪些主机处于开机状态，哪些主机处于关机状态。
#example8.sh这个程序是一个多线程的，速度较快
#example8-2.sh时一个单线程的，速度较慢

#清空当前目录下up.txt文件和down.txt的内容
 > up.txt
 > down.txt
#记录程序开始执行的时间
start_time=`date +%s`
for i in {1..10}
do
        #每隔0.3秒ping一次，一共ping2次，并以1毫秒为单位设置ping的超时时间
        ping -c 2 -i 0.3 -W 1 172.21.3.$i &>/dev/null
        if [ $? -eq 0 ]
        then
                echo "172.21.3.$i is up" >> up.txt
        else
                echo "172.21.3.$i is down" >> down.txt
        fi
                ping -c 2 -i 0.3 -W 1 172.21.3.$i &>/dev/null
 
done

stop_time=`date +%s`   #记录结束时间
echo "时间：`expr $stop_time - $start_time`秒"  #计算一共花费了多长时间

#输出有多少线上的机器，多少线下的机器。
echo `cat up.txt | wc -l`hosts are up.
echo `cat down.txt | wc -l`hosts are down.
```

例题5：从网络上获取天气预报

```bash
#第三个例子
[root@localhost examplesh]# cat example32.sh
#!/bin/bash
#从天气预报网获取该城市的天气json数据
json=`curl -s http://www.weather.com.cn/data/sk/101010100.html`
echo $json
#提取城市、温度、几级风、风向四个数据
city=`echo $json | sed 's/.*city":"//g' | sed 's/","cityid.*$//g'`
temp=`echo $json | sed 's/.*temp":"//g' | sed 's/","WD.*$//g'`
wd=`echo $json | sed 's/.*WD":"//g' | sed 's/","WS.*$//g'`
ws=`echo $json | sed 's/.*WS":"//g' | sed 's/","SD.*$//g'`

#提取时间，判断早中晚
tm=$(date +%H)
if [ $tm -gt 12 ]
then
    msg="Good Morning $USER"
elif [ $tm -gt 12 -a $tm -le 18 ]
then 
    msg="Good Afternoon $USER"
else
    msg="Good Night $USER"
fi

#格式化输出时间和天气信息
echo "当前的时间是：$(date)"
echo -e "\033[34m$msg\033[0m"
echo '你现在位于'$city', '$temp'℃, '$ws $wd'.'
[root@localhost examplesh]# bash example32.sh
当前的时间是：2024年 03月 22日 星期五 22:30:32 CST
Good Morning root
你现在位于北京, 18℃, 1级 东南风.
```

例题6：批量创建和删除用户

```bash
#--------------------------------------------------------------------------------------------------------
172.21.3.11  /root/temp/sh07.sh   sh08.sh    user1.txt
sh07.sh 批量创建用户
sh08.sh 批量清除用户
用户的信息保存在user1.txt中
运行方式为：
bash sh07.sh user1.txt
bash sh08.sh user1.txt
#--------------------------------------------------------------------------------------------------------
[root@localhost temp]# cat sh07.sh

#!/bin/bash
#作用：把需要批量的创建的用户的名称和密码保存在当前目录下的user1.txt中，、
#然后从脚本运行时读入该文件，例如：bash sh07.sh user1.txt
#系统循环读入该文件中的每一行，并自动创建用户。
#特别注意的是：第二次运行程序的时候，需要使用userdel -r 用户名的方式彻底从系统中清除该用户的文件。然后才能再次成功运行。
#运行完成后，最好把创建的用户从系统清除。

#判断是否有参数
#用户名和密码保存在user1.txt文件中
if [ $# -eq 0 ]
then
    echo "输入文件：`basename $0` file"
    exit
fi

#判断是否是一个文件
if [ ! -f $1 ]
then
    echo "error file"
    exit
fi 

#考虑到特殊情况，如果变量是空行，其解决办法是重新定义分隔符
#for处理文件按回车分隔，而不是按空格或者TAB
#重新定义分隔符
#IFS内部字段分隔符
IFS=$'\n'
for line in `cat $1`
do
    if [ ${#line} -eq 0 ]
    then
        echo "nothing to do"
        continue
    fi
 
# 在Linux系统中，管道无法给变量直接赋值，例如下面的句子
#  user=`echo "$line"`| awk -F " " '{print $1}这里直接用管道把两个命令连接起来，无法给user变量赋值
#  只有使用echo 把整个管道处理后的结果打印出来以后，才能给变量赋值，例如下面的示例：

    user=`echo "$line" | awk -F " " '{print $1}'` 
    pass=`echo "$line" | awk -F " " '{print $2}'` 

    echo $user
    echo $pass

    id $user &> /dev/null
 
    if [ $? -eq 0 ]
    then 
        echo "user $user already exists"
    else
        echo "success"
        useradd $user
        echo "$pass" | passwd --stdin $user &> /dev/null
       

        if [ $? -eq 0 ]
        then 
            echo "$user is created."
        fi
    fi
done
#批量创建用户和密码

#--------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------
[root@localhost temp]# cat sh08.sh
#!/bin/bash
#作用：该程序的作用是和sh07.sh程序配套的，用来进行把用户从系统里面干净的清除。
#每次运行：bash sh07.sh user1.txt 以后
#可以使用：bash sh08.sh user1.txt 来清除sh07脚本创建的用户。


#判断是否有参数
#用户名和密码保存在user1.txt文件中
if [ $# -eq 0 ]
then
    echo "输入文件：`basename $0` file"
    exit
fi

#判断是否是一个文件
if [ ! -f $1 ]
then
    echo "error file"
    exit
fi 

#考虑到特殊情况，如果变量是空行，其解决办法是重新定义分隔符
#for处理文件按回车分隔，而不是按空格或者TAB
#重新定义分隔符
#IFS内部字段分隔符
IFS=$'\n'
for line in `cat $1`
do
    if [ ${#line} -eq 0 ]
    then
        echo "nothing to do"
        continue
    fi
 
#在Linux系统中，管道无法给变量直接赋值，例如下面的句子
#  user=`echo "$line"`| awk -F " " '{print $1} 这里直接用管道把两个命令连接起来，无法给user变量赋值
#  只有使用echo 把整个管道处理后的结果打印出来以后，才能给变量赋值，例如下面的示例：
    user=`echo "$line" | awk -F " " '{print $1}'` 

    id $user &> /dev/null
 
    if [ $? -eq 0 ]
    then
        echo "$user is already deleted!" 
        userdel -r $user
    else
        echo "没有$user用户"       
    fi
done
#批量创建用户和密码

#--------------------------------------------------------------------------------------------------------
运行示例
#--------------------------------------------------------------------------------------------------------
[root@localhost temp]# bash sh07.sh user1.txt
test_user1
123456
success
test_user1 is created.
[root@localhost temp]# bash sh08.sh user1.txt
test_user1 is already deleted!

```

例题7：打字小游戏

```bash
#!/bin/bash

#------------------------------------------------------------
# 练习：单词打字练习，本程序主要练习函数的使用方式
#------------------------------------------------------------

# 随机单词列表
word_list=("hello" "world" "programming" "practice" "typing")

# 总单词数
total_words=$((${#word_list[@]}))

# 当前单词索引
current_word_index=0

# 显示当前单词
function display_word() {
  local word=${word_list[$current_word_index]}
  echo "请输入单词: $word"
}

# 检查输入是否正确
function check_input() {
  local input_word=$1
  local correct_word=${word_list[$current_word_index]}

  if [ "$input_word" = "$correct_word" ]; then
    echo "正确！下一个单词..."
    ((current_word_index++))
  else
    echo "错误！正确的单词是：$correct_word，请重新输入。"
  fi

  # 检查是否完成所有单词
  if [ $current_word_index -eq $total_words ]; then
    echo "恭喜您完成了所有单词的打字练习！"
    exit 0
  fi
}

# 主循环
while true; do
  display_word # 显示当前单词
  read -p "请输入您的答案并按回车键：" user_input 
  # 检查输入是否正确,调用函数来实现
  check_input "$user_input"
done
```

SHELL编程基本语法：[Bash 脚本教程](https://wangdoc.com/bash/)

## 任务4：Linux服务器及防火墙配置 3天

- LAMP服务器的配置  [第10章 使用Apache服务部署静态网站 | 《Linux就该这么学》 (linuxprobe.com)](https://www.linuxprobe.com/basic-learning-10.html)
- 防火墙配置：iptables和firewalld  [第8章 使用Iptables与Firewalld防火墙 | 《Linux就该这么学》 (linuxprobe.com)](https://www.linuxprobe.com/basic-learning-08.html)







