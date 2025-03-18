# Linux漫谈系列--shell 编程（2）

本节主要介绍流程控制语句、循环控制语句、函数等编程知识。并在最后给出了一些实践应用的示例。

## 1、判断语句 if

三种判断语句：

<img src="./assets/carbon (31).png" alt="carbon (31)" style="zoom:67%;" />

例题：嵌套举例

<img src="./assets/carbon (32).png" alt="carbon (32)" style="zoom:67%;" />

## 2、多分支选择

<img src="./assets/carbon (33).png" alt="carbon (33)" style="zoom:67%;" />

一个比较复杂的例子：/root/examplesh/example30.sh

统计内存中出于各种状态的进程分别有多少个？使用了多分支选择。

<img src="./assets/carbon (34).png" alt="carbon (34)" style="zoom:67%;" />

运行结果如下：

<img src="./assets/carbon (35).png" alt="carbon (35)" style="zoom:67%;" />

## 3、for 循环

<img src="./assets/carbon (36).png" alt="carbon (36)" style="zoom:67%;" />

### 例题 

常见的两种循环：

<img src="./assets/carbon (38).png" alt="carbon (38)" style="zoom:67%;" />

再举两个循环的例子：

<img src="./assets/carbon (39).png" alt="carbon (39)" style="zoom:67%;" />

用数值列表循环。

<img src="./assets/carbon (40).png" alt="carbon (40)" style="zoom:67%;" />

## 4、while 循环

<img src="./assets/carbon (42).png" alt="carbon (42)" style="zoom:67%;" />

## 5、until 循环

<img src="./assets/carbon (43).png" alt="carbon (43)" style="zoom:67%;" />

## 6、三种无限循环

<img src="./assets/carbon (41).png" alt="carbon (41)" style="zoom:67%;" />

## 7、continue和break语句

<img src="./assets/carbon (44).png" alt="carbon (44)" style="zoom:67%;" />

## 8、函数

### （1）不带返回值的函数

<img src="./assets/carbon (45).png" alt="carbon (45)" style="zoom:67%;" />

### （2）带返回值的函数

提示：返回值通过 $? 变量返回。

<img src="./assets/carbon (46).png" alt="carbon (46)" style="zoom:67%;" />

### （3）向函数内部传递参数

<img src="./assets/carbon (47).png" alt="carbon (47)" style="zoom:67%;" />

通过位置参数向子函数传递参数。

### （4）文件引用

在一个文件中定义变量和函数，在另一个文件中引用。

<img src="./assets/carbon (48).png" alt="carbon (48)" style="zoom:67%;" />

## 9、有趣的程序

### （1）fork 炸弹

<img src="./assets/carbon (49).png" alt="carbon (49)" style="zoom:67%;" />

### （2）汉诺塔游戏

<img src="./assets/carbon (50).png" alt="carbon (50)" style="zoom:67%;" />

### （3）单词练习小游戏

<img src="./assets/carbon (51).png" alt="carbon (51)" style="zoom:67%;" />

### （4）窃取用户的密码

<img src="./assets/carbon (52).png" alt="carbon (52)" style="zoom:67%;" />

该程序运行过程为：

<img src="./assets/carbon (53).png" alt="carbon (53)" style="zoom:67%;" />

## 10、企业面试实战项目

### （1）探测主机信息

<img src="./assets/carbon (54).png" alt="carbon (54)" style="zoom:67%;" />

运行结果如下：

<img src="./assets/carbon (55).png" alt="carbon (55)" style="zoom:67%;" />

### （2）测试局域网里面有多少台主机

- 第一个例子，用单线程扫描，速度慢

<img src="./assets/carbon (58).png" alt="carbon (58)" style="zoom:67%;" />

- 第二个例子，用多线程扫描，速度快

<img src="./assets/carbon (57).png" alt="carbon (57)" style="zoom:67%;" />

### （3）从网络获取天气预报

<img src="./assets/carbon (59).png" alt="carbon (59)" style="zoom:67%;" />

运行结果为：

<img src="./assets/carbon (60).png" alt="carbon (60)" style="zoom:67%;" />

## 11、实践项目（实验报告参考）

### （1）实验参考 第一题

<img src="./assets/carbon (61).png" alt="carbon (61)" style="zoom:67%;" />

### （2）实验参考 第二题

<img src="./assets/carbon (62).png" alt="carbon (62)" style="zoom:67%;" />

### （3）实验参考 第三题

<img src="./assets/carbon (63).png" alt="carbon (63)" style="zoom:67%;" />

### （4）实验参考 第四题

<img src="./assets/carbon (64).png" alt="carbon (64)" style="zoom:67%;" />

### （5）实验参考 第五题

<img src="./assets/carbon (65).png" alt="carbon (65)" style="zoom:67%;" />

运行结果如下：

<img src="./assets/image-20250315182456505.png" alt="image-20250315182456505" style="zoom:50%;" />

字符背景色和前景色的设置的解释：

<img src="./assets/carbon (66).png" alt="carbon (66)" style="zoom:67%;" />

<img src="./assets/image-20250315182652216.png" alt="image-20250315182652216" style="zoom:67%;" />

例如把这里的背景色44更改为42，那么程序运行如下所示：

<img src="./assets/image-20250315182729029.png" alt="image-20250315182729029" style="zoom:50%;" />

### （6）实验参考 第 六题

<img src="./assets/carbon (67).png" alt="carbon (67)" style="zoom:67%;" />

### （7）实验参考 第七题

<img src="./assets/carbon (68).png" alt="carbon (68)" style="zoom:67%;" />

例

<img src="./assets/carbon (69).png" alt="carbon (69)" style="zoom:67%;" />

运行结果如下：

<img src="./assets/carbon (70).png" alt="carbon (70)" style="zoom:67%;" />

## 12、推荐两个学习 Linux的网站

- [Bash 脚本教程 - 网道 (wangdoc.com)](https://wangdoc.com/bash/)  阮一峰的shell教程，值得一看。
- [菜鸟教程](https://www.runoob.com/linux/linux-tutorial.html)  Linux 基础和 shell 编程基础

## 随堂测试

