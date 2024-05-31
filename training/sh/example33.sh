#!/bin/bash

#------------------------------------------------------------
# 练习：单词打字练习
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