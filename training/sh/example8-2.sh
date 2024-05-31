#!/bin/bash
#编写脚本测试192.168.14.*整个网段中哪些主机处于开机状态，哪些主机处于关机状态。
#example8.sh这个程序是一个多线程的，速度较快
#example8-2.sh时一个单线程的，速度较慢

#清空当前目录下up.txt文件和down.txt的内容
 > up.txt
 > down.txt
#记录程序开始执行的时间
start_time=`date +%s`
for i in {1..20}
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


