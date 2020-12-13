var=value  
echo $var  
var=`echo command`  
echo $var  
command  
  
#!/bin/bash  
# Arguments can be accessed using $x where x is the index of the argument 0-9:  
$0      -  the name of the file  
$1      -  first argument (index starts from 1)  
$123    -  first argument concatenated with string '23'  
$?      -  exit code of the last command  
$*      -  list of all arguments  
$@"
$#      -  number of arguments passed to the shell file  

bash .\script.sh  


