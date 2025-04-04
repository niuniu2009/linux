#!/bin/bash

# 自定义盐值，长度建议为8字符
custom_salt="MYSALT12"

# 指定加密轮次
rounds=100000

# 要加密的密码
password="123456"

# 生成哈希值，使用指定的盐和轮次
hash_output=$(openssl passwd -6 -salt "rounds=${rounds}\$${custom_salt}" "$password")

# 输出生成的哈希值
echo "生成的哈希值: $hash_output"

# 解析生成的哈希值
IFS='$' read -ra parts <<< "$hash_output"
algorithm=${parts[1]}
salt=${parts[2]}
hash_value=${parts[3]}

# 构造包含轮次的完整哈希字符串（兼容/etc/shadow格式）
full_hash="\$6\$rounds=${rounds}\$${salt}\$${hash_value}"

# 输出解析后的信息
echo "加密结果："
echo "算法类型：SHA-$algorithm"
echo "指定盐值：$salt"
echo "加密轮次：$rounds"
echo "完整哈希：$full_hash"
echo "哈希长度：${#hash_value}字符"

# 验证哈希值
verify_hash=$(openssl passwd -6 -salt "rounds=${rounds}\$${custom_salt}" "$password")
if [ "$hash_output" = "$verify_hash" ]; then
    echo "验证成功"
else
    echo "验证失败"
fi