#!/bin/bash
name=`hostname`
ip=`ifconfig ens33|awk /netmask/'{print $2}'`
os=`cat /etc/redhat-release`
kernel=`uname -r`
# tr -s " " 去掉重复的空格，单至少会保留一个空格。
#cut -d " " -f1 --complement 以空格为分隔符，显示除了第一个字段以外的所有内容。
cpu=`lscpu|grep '厂商 ID' |tr -s " "|cut -d " " -f1 --complement`
mem=`free -hm |awk /Mem/'{print $2}'`
#awk -F G '{print $1}' 以大写字符G为分隔符，打印第一个字段
space=`lsblk |awk /disk/'{print $4}'|awk -F G '{print $1}'`

G="\e[1;32m"  #绿色
B="\e[1;34m"  #蓝色
E="\e[0m"    #控制颜色的结束符

for i in $space
do
        let sum=$[$sum+$i]
done

echo -e "$B主机名：$E$G\t$name\t$E"
echo -e "$B主机名：\033[31;44m\t$name\t\033[0m"
echo -e "\033[1;33m${B}ip地址：\033[32;45m\t$ip\t\033[0m"
echo -e "\033[1;33m$B系统版本：\033[35;41m\t$os\t\033[0m"
echo -e "$B内核版本：$E$G\t$kernel\t$E"
echo -e "${B}cpu名称：$E$G\t$cpu\t$E"
echo -e "$B内存总大小：$E$G\t$mem\t$E"
echo -e "$B硬盘总大小：$E$G\t${sum}G\t$E"

echo "字符背景色示例：" 
echo -e "\033[1;40m\tHello World\t\033[0m"
echo -e "\033[1;41m\tHello World\t\033[0m"
echo -e "\033[1;42m\tHello World\t\033[0m"
echo -e "\033[1;43m\tHello World\t\033[0m"
echo -e "\033[1;44m\tHello World\t\033[0m"
echo -e "\033[1;45m\tHello World\t\033[0m"
echo -e "\033[1;46m\tHello World\t\033[0m"
echo -e "\033[1;47m\tHello World\t\033[0m"
echo "字符前景色示例："
echo -e "\033[1;30m\tHello World\t\033[0m"
echo -e "\033[1;31m\tHello World\t\033[0m"
echo -e "\033[1;32m\tHello World\t\033[0m"
echo -e "\033[1;33m\tHello World\t\033[0m"
echo -e "\033[1;31m\tHello World\t\033[0m"
echo -e "\033[1;35m\tHello World\t\033[0m"
echo -e "\033[1;36m\tHello World\t\033[0m"
echo -e "\033[1;37m\tHello World\t\033[0m"
echo "同时设置前景色和背景色示例："
echo -e "\033[1;37;44m\tHello World\t\033[0m"
