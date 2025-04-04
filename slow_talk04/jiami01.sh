#!/bin/bash
 
# 计算字符串的SHA-512哈希值,这里只是加密，没有使用salt
string1="Hello, World!"
miwen1=`echo -n "$string1" | sha512sum | awk '{print $1}'`

string2="Hello, World!"
miwen2=`echo -n "$string2" | sha512sum | awk '{print $1}'`

string3="Hello"
miwen3=`echo -n "$string3" | sha512sum | awk '{print $1}'`

echo "密文长度是：${#miwen1}个字符，512 位，采用 16 进制，每个字符占用 4 位"
echo
echo "第一个明文：$string1"
echo "第一个密文：$miwen1"
echo
echo "第二个明文：$string2" 
echo "第二个密文：$miwen2"
echo
echo "第三个明文：$string3"
echo "第三个密文：$miwen3"

#可以看出hash加密算法的特点是:明文一样，密文就一样，这样黑客就可以采用暴力破解的方法来进行攻击。
#常用的暴力破解的方法有：字典攻击，查表法
#https://www.dcode.fr/sha512-hash?#f0  sha512破解  知道了密文反过来查询明文的网站