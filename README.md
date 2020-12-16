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

"one argument"  -  passed as one argument (double quotes enables Shell Expansions  ($ ` \ newline)
                   https://www.gnu.org/software/bash/manual/html_node/Double-Quotes.html
'one argument'  -  passed as one argument (single quotes ignore all special chars)
                   https://www.gnu.org/software/bash/manual/html_node/Single-Quotes.html#Single-Quotes
`command`       -  results of command passed as one argument


---
### NOTES
du -csh *
List all files in the current directory with size

ls -l --sort=size | head -10  
List the 10 biggest files of current directory. 
If you find which file is growing and with which data you are a step nearer to the solution


Cleaning all logs on a Linux system without deleting the files:
for CLEAN in $(find /var/log/ -type f)
do
    cp /dev/null  $CLEAN
done