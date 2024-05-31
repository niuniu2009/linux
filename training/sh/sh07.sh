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
 
#在Linux系统中，管道无法给变量直接赋值，例如下面的句子
#  user=`echo "$line"`| awk -F " " '{print $1}'  这里直接用管道把两个命令连接起来，无法给user变量赋值
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


