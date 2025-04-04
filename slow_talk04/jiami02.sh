#!/bin/bash

# openssl 在不指定盐的时候，会随机生成盐（16个字符）

# 随机盐示例（每次生成不同盐）
echo -e "\n随机盐示例："
rand_hash1=$(openssl passwd -6 "123456")
echo "第一次加密：$rand_hash1"
echo "random_hash2的长度： ${#rand_hash1}"  

rand_hash2=$(openssl passwd -6 "123456")
echo "第二次加密：$rand_hash2"  # 输出不同的哈希值


# 指定盐示例（固定盐值）
custom_salt="X7s9vF2q"  # 盐是8个字符，也可以是 16 个字符
echo -e "\n指定盐示例："
fixed_hash1=$(openssl passwd -6 -salt $custom_salt "mypassword")
echo "第一次加密：$fixed_hash1"  

fixed_hash2=$(openssl passwd -6 -salt $custom_salt "mypassword")
echo "第二次加密：$fixed_hash2"  # 输出相同哈希值

# 验证盐的复用
echo -e "\n验证结果："
[ "$fixed_hash1" = "$fixed_hash2" ] && echo "指定盐生成相同哈希" || echo "哈希不一致"