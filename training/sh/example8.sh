#!/bin/bash
#编写脚本测试192.168.14.*整个网段中哪些主机处于开机状态，哪些主机处于关机状态。
#2024年3月26日，增加了端口扫描的功能
#example8.sh这个程序是一个多线程的，速度较快
#example8-2.sh时一个单线程的，速度较慢

#清空当前目录下up.txt文件和down.txt的内容
>up.txt
>down.txt
#记录程序开始执行的时间
start_time=$(date +%s)
for i in {1..11}; do
        #每隔0.3秒ping一次，一共ping2次，并以1毫秒为单位设置ping的超时时间
        ping -c 2 -i 0.3 -W 1 172.21.3.$i &>/dev/null

        (if [ $? -eq 0 ]; then
                echo "172.21.3.$i is up" >>up.txt #能够ping通的记录在up.txt文件中

                #----------------------------------------
                #这几行代码是使用netcat进行端口扫描，netcat 默认采用tcp进行扫描，速度较慢，这里采用udp进行扫描，提高速度。
                #----------------------------------------
                netcat -z -u 172.21.3.$i 22 &>/dev/null
                if [ $? = 0 ]; then
                        echo "172.21.3.$i的22端口开放！"
                fi
                #-----------------------------------------
                #-----------------------------------------

        else
                echo "172.21.3.$i is down" >>down.txt #不能够ping通记录在down.txt文件中
        fi) &                                         #把一个命令放进后台运行，相当于启动了一个独立的线程，这种方式是修改为并行多线程执行，调高效率。

done
wait                                        #每个线程执行的时间不一样，这里等待所有的线程执行完毕
stop_time=$(date +%s)                       #所有线程执行完毕以后，记录结束时间
echo "时间：$(expr $stop_time - $start_time)秒" #计算一共花费了多长时间

#输出有多少线上的机器，多少线下的机器。
echo $(cat up.txt | wc -l)hosts are up.
echo $(cat down.txt | wc -l)hosts are down.
