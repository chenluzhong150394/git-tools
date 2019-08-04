#!/bin/bash

###记录当前路径
str=`pwd`

###将当前路径与脚本名进行拼接,便得到脚本的绝对路径
allstr="$str"/'start.sh'

###将脚本的路径当做别名放入到用户的环境变量下,并生成别名



echo "alias clz='$allstr'">>~/.bashrc
source ~/.bashrc


### 一个免费的编程工具语言，用来实现自动和交互式任务进行通信:
sudo apt-get -y install expect
