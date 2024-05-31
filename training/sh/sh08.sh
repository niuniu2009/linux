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
#  user=`echo "$line"`| awk -F " " '{print $1}'  这里直接用管道把两个命令连接起来，无法给user变量赋值
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


