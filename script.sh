#!/bin/bash

#--------------------------------
# Special variables in shell:
# echo Good Evening World
#echo "\$0:  -  the name of the file                           $0"
#echo "\$1:  -  first argument (index starts from 1)           $1"
#echo "\$?:  -  exit code of the last command                  $?                          -  if 0: executed successfully, while a non-zero exit value means an error"
#echo "\$*:  -  list of all arguments                          $*"
#echo "\$@:  -                                                 $@"
#echo "\$#:  -  number of arguments passed to the shell file   $#"

#------------------------------
# var1=0
# var1=`expr $var1 + 3`
# echo $var1

#------------------------------
# Simple for loop:
# echo $@
# for var1 in $@; do
# echo $var1
# done

#----------------------------------
# Simple while and until loops:
# var1=0
# while [ $var1 -lt 10 ]
#     do
#         echo $var1
#         var1=`expr $var1 + 1`
#     done
# echo "var1 after while loop: $var1"
# until [ $var1 -lt 3 ]
#     do
#         echo "var1 inside until is: $var1"
#         var1=`expr $var1 - 1`
#     done

#----------------------------------
# Case 
# case $1 in
#     "apple")
#         echo $1;;
#     "peach")
#         echo $1;;
#     *)
#         echo "else"
# esac

#----------------------------------
#echo Please, enter your name
#read NAME
#echo "Hi $NAME!"
#echo Please, enter your firstname and lastname
#read FN LN
#echo "Hi! $LN, $FN !"