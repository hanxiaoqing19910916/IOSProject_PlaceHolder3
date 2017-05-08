#! /bin/bash

#echo "this is a test"
#ls 
#echo "there are all files"


# export COUNT=5
# echo ${COUNT}99

# $()引用其他命令
# DATE=$(date)
# LL=$(ls -l)
# echo $DATE
# echo $LL


# Shell脚本中的单引号和双引号一样都是字符串的界定符，
# 单引号用于保持引号内所有字符的字面值，
# 而双引号有些情况则特殊。如果字符串中有特殊字符需要处理时就用双引号。
# echo '\\'
# echo "\\"
# echo '\date\'
# echo "`date`"
# echo `date`

# your_name="qinjx"
# str='Hello, I know your are  $your_name!'
# echo $str
# # get string length 
# echo "string leng is ${#str}"
# # sub string range
# echo "substring ${str:0:20}"
# # echo `expr index "$str" are`

# str="Hello I know your are"
# array=("$str" "$str") #为了防止数组声明的时候把str里面的空格当成元素的分割，用双引号括起来
# echo ${array[0]}
# echo ${array[*]}
# echo ${array[@]}
# echo ${#array[0]}


# num1=2800
# num2=200

# if test $num1 -gt $num2
# then 
# echo "true"
# else 
# echo "false"
# fi



# a=5
# b=6
# result=`expr $a + $b` #注意算数运算符左右值要加上空格
# echo $result

# result2=$[a*b]  # 注意等号两边不能有空格
# echo "result2 : $result2"

a=10
b=20

# val=`expr $a + $b`
# echo "a + b : $val"

# val=`expr $a - $b`
# echo "a - b : $val"

# val=`expr $a \* $b`
# echo "a * b : $val"

# val=`expr $a / $b`
# echo "a / b : $val"

# val=`expr $a % $b`
# echo "a % b : $val"

# if [ $a == $b ]
# then
# 	echo " a = b "
# fi

# if [ $a != $b ] 
# then
# 	echo " a != b"
# fi






















