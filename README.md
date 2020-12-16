var=value  
echo $var  
var=`echo command`  
echo $var  
command  
----
#!/bin/bash  
#Arguments can be accessed using $x where x is the index of the argument 0-9:  
$0      -  the name of the file  
$1      -  first argument (index starts from 1)  
$123    -  first argument concatenated with string '23'  
$?      -  exit code of the last command  
$*      -  list of all arguments  
$@"
$#      -  number of arguments passed to the shell file  
---
bash .\script.sh  
"one argument"  -  passed as one argument (double quotes enables Shell Expansions  ($ ` \ newline)
                   https://www.gnu.org/software/bash/manual/html_node/Double-Quotes.html
'one argument'  -  passed as one argument (single quotes ignore all special chars)
                   https://www.gnu.org/software/bash/manual/html_node/Single-Quotes.html#Single-Quotes
`command`       -  results of command passed as one argument
---
#INTEGER COMPARISON
-eq # equal
-ge # greater or equal
-gt # greater than
-le # less of equal
-lt # less than
-ne # not equal

#test expression:
test 10 -eq 10 # exit code 0
test 10 -eq 11 # exit code 1
#[ expression ]:
[ 10 -eq 10 ] # exit code 0
[ 10 -eq 11 ] # exit code 1
[ expression ] && command # run command if expresssion returns True

#STRING COMPARISON
str1 = str2
str1 != str2
str # True if str is not null
-n str # True if the length of str is greater than zero
-z str # True if the length of str is equal to zero.

#FILE COMPARISON
-d # file is a dir?
-e # exists? (Could be a dir also)
-f # file?
-h # file is a symbolic link?
-p # file is a pipe?
-r # can be read by the process?
-s # is a non-zero?
-S # is a Socker?
-w # file can be written by the process
-x # file is executable?
file1 -ef file2 # if file1 is a hard link to file2
file1 -ot file2 # if file1 is older than file2 (by modification date)
file1 -nt file2 # if file1 is newer than file2 (by modification date)

#EXPRESSION COMPARISON
!expression # true if expression is not true
exp1 -a exp2 # True if exp1 and exp2 are true (&&, and)
exp1 -o exp2 # True if exp1 or exp2 is true (||, or)

---
#NOTES
Test if $var is an integer:
if [ `expr $a + 1 2> /dev/null` ] ; then echo $a is numeric ; else echo $a is not numeric ; fi ;
  	
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