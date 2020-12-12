#!/bin/bash
echo Good Evening World
echo "\$0:  -  the name of the file                           $0"
echo "\$1:  -  first argument (index starts from 1)           $1"
echo "\$?:  -  exit code of the last command                  $?                          -  if 0: executed successfully, while a non-zero exit value means an error"
echo "\$*:  -  list of all arguments                          $*"
echo "\$@:  -                                                 $@"
echo "\$#:  -  number of arguments passed to the shell file   $#"
