#!/bin/bash

# 获取天气信息
json=`curl -s http://www.weather.com.cn/data/sk/101010100.html`
# 使用jq解析json
echo $json | jq .

# 解析json获取各项天气数据
city=`echo $json | jq '.weatherinfo.city'`
temp=`echo $json | jq '.weatherinfo.temp'`
wd=`echo $json | jq '.weatherinfo.WD'`
ws=`echo $json | jq '.weatherinfo.WS'`


# 根据时间显示不同消息
tm=$(date +%H)

# 根据时间显示不同消息
if [ $tm -gt 6 ]
then
    msg="Good Morning $USER"
elif [ $tm -gt 12 -a $tm -le 18 ]
then 
    msg="Good Afternoon $USER"
else
    msg="Good Night $USER"
fi

# 输出消息
echo "当前的时间是：$(date)"
echo -e "\033[34m$msg\033[0m"
echo '你现在位于'$city', '$temp'℃, '$ws $wd'.'
