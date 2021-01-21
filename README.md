
```bash
var=value
NAME="Alex"
echo ${NAME}     #   Alex
echo $NAME       #   Alex
echo "$NAME"     #   Alex
echo '$NAME'     #   $NAME
echo "${NAME}!"  #   Alex!
var=`echo command`
echo $var        # command
function_name () { echo `date`; }
echo $(function_name) # Mon 04 Jan 2021 06:55:50 PM EST
```

## Arguments

Special parameters

```
Arguments can be accessed using $x where x is the index of the argument 0-9:
$0      -  the name of the file  or the function
$1      -  first argument (index starts from 1)
$123    -  first argument concatenated with string '23'
$?      -  exit code of the last command
$#      -  number of arguments passed to the shell file/function
$*      -  list of all arguments, "$*" expands to a single string separated
           by space (the first character of IFS) - "$1 $2 $n"
$@      -  list of all arguments, "$@" expands to separate strings - "$1" "$2" "$n"
           When not double-quoted, $* and $@ are the same
$$      -  process id of the shell
$_      -  last argument of the previous command
$-      -  current options
```

IFS - The shell treats each character of IFS as a delimiter, and splits the results of the other expansions into words on these characters.

```bash
echo "grapefruit|grapes|peach|mango" > fruits.txt
```

```bash
#!/bin/bash  
file=./fruits.txt
# set the Internal Field Separator to |
IFS='|'
while read -r first_fruit second_fruit third_fruit last_fruit
do
        printf "... %s ...\n" $first_fruit
        printf "... %s ...\n" $second_fruit
        printf "... %s ...\n" $third_fruit
done < "$file"
```

```
"one argument"  -  passed as one argument (double quotes enables Shell Expansions ($ \` \ newline)  
                   https://www.gnu.org/software/bash/manual/html_node/Double-Quotes.html
'one argument'  -  passed as one argument (single quotes ignore all special chars)
                   https://www.gnu.org/software/bash/manual/html_node/Single-Quotes.html#Single-Quotes
`command`       -  results of command passed as one argument
```

## Brace expansion

```bash
echo {A, B}     # A B
echo {A, B}.js  # A.js B.js
echo {1..5}     # 1 2 3 4 5
```

## Command substitution

```bash
echo "I'm in $(PWD)"
# Same as:
echo "I'm in `pwd`"
```

```
INTEGER COMPARISON  
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
str1 == str2  
str1 != str2  
str # True if str is not null  
-n str # True if the length of str is greater than zero  
-z str # True if the length of str is equal to zero  
  
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
!expression  # True if expression is not true
exp1 -a exp2 # True if exp1 and exp2 are true (&&, and)
exp1 -o exp2 # True if exp1 or exp2 is true (||, or)
```
```bash
#CONDITIONAL STATEMENT
if [ expression ]; then command; elif [ expression ]; then command; else command; fi
```

### LOOPS
```bash
for variable in list; do
        commands
    done

echo $@
for var1 in $@; do
echo $var1
done

while [ expression ]; do
    commands
done

until [ expression ]; do
    commands
done
  
#while runs the loop WHILE the condition is TRUE
#until runs the loop UNTIL the condition is TRUE

case string in
    str1)
        command1
        ;;
    str2)
        command2
        ;;
    *)
        command3
        ;;
esac
```
### input/output descriptors
```
0 stdin
1 stdout
2 stderr
<file       take input from
>file       write output to
>>file      append
<<word      read input until line matches word
<>file      open for reading and writing
<&digit     use file descriptor as input
<&-         close stdin
>&-         close stdout
cmd1|cmd2   stdout of cmd1 is piped to stdin of cmd2  
```

---

### FUNCTIONS

```bash
function_name () {
  commands
} 
# Oneliner
function_name () { commands; }

# Alternative syntax
function function_name {
  commands
}

function function_name { commands; }

# return
myfunc() {
    local myresult='some value'
    echo $myresult
}
result="$(myfunc)"

# Raising errors
myfunc() {
    return 1
}

if myfunc; then
    echo "success"
else
    echo "failure"
fi
```

### Arrays as arguments

```bash
function extract()
{
    local -n myarray=$1
    local idx=$2
    echo "${myarray[$idx]}"
}
Fruits=('Apple' 'Banana' 'Orange')
extract Fruits 2     # => Orangle
```


```bash
echo Please, enter your firstname and lastname  
read FN LN  
echo "Hi! $LN, $FN !"  
 
cd /not_existing_directory &> /dev/null  
echo $? # 1  
```
 
### ARITHMETIC & BASH-EXPANSION  
`let` is a builtin command of the Bash shell that evaluates arithmetic expressions.  
Using let is similar to enclosing an arithmetic expression in double parentheses:  
```bash
i=$(( i + 1 ))  
let i+=1  
i=$(( i++))  
let i++  
  
#Operation with assignment  
a*=b # a=(a*b)  
```
---  
### SED (Stream Editor)

```bash
sed 's/\/usr\/local\/bin/\/common\/bin/' < old > new
```

takes string from old file and writes out into new file  
"/" is the delimiter which could be any other character than backslash or newline instead of a slash

```bash
sed 's|/usr/local/bin|/common/bin|' < old > new
```

Apply multiple find-replace expressions to a file:

```bash
sed -e 's/{{find}}/{{replace}}/' -e 's/{{find}}/{{replace}}/' {{filename}}
```

2 ways to print lines with matched regex:

```bash
sed -n 's/REGEX/&/p' text.txt
cat text.txt | grep -i "REGEX"
```

---
# REGEX
```
. (dot) Any single character except newline
* zero or more occurances of any character
[. . . ] Any single character specified in the set
[^. . . ] Any single character not specified in the set
^ Anchor - beginning of the line
$ Anchor - end of line
\< Anchor - begining of word
\> Anchor - end of word
\(. . . \) Grouping - usually used to group conditions
\n Contents of nth grouping
————————————————————–
[. . . ] Set Examples [A-Z] The SET from Capital A to Capital Z
[a-z] The SET from lowercase a to lowercase z
[0-9] The SET from 0 to 9 (All numerals)
[./=+] The SET containing . (dot), / (slash), =, and +
[-A-F] The SET from Capital A to Capital F and the dash (dashes must be specified first)
[0-9 A-Z] The SET containing all capital letters and digits and a space
[A-Z][a-zA-Z] In the first position, the SET from Capital A to Capital Z In the second char-
acter position, the SET containing all lettersChapter 3. Editor - Quick References
3.2.12
29
Regular Expression Examples
/Hello/ Matches if the line contains the value Hello
/^TEST$/ Matches if the line contains TEST by itself
/^[a-zA-Z]/ Matches if the line starts with any letter
/^[a-z].*/ Matches if the first character of the line is a-z and there is at least one more of any
character following it
/2134$/ Matches if line ends with 2134
/\(21|35\)/ Matches is the line contains 21 or 35; Note the use of ( ) with the pipe symbol to
specify the ’or’ condition
/[0-9]*/ Matches if there are zero or more numbers in the line
/^[^#]/ Matches if the first character is not a # in the line
```

## Parameter expansions

```bash
${FOO%suffix}   # Remove suffix
${FOO#prefix}   # Remove prefix
${FOO%%suffix}  # Remove long suffix
${FOO##prefix}  # Remove long prefix
${FOO/from/to}  # Replace first match
${FOO//from/to} # Replace all
${FOO/%from/to} # Replace suffix
${FOO/#from/to} # Replace prefix
```

### Substrings

```bash
${FOO:0:3}      # Substring (position, length)
${FOO:(-3):3}   # Substring from the right

${#FOO}         # Length of $FOO

Default values
${FOO:-val}     # $FOO, or val if unset
${FOO:=val}     # Set $FOO to val if unset
${FOO:+val}     # val if $FOO is set
${FOO:?message} # Show message and exit if $FOO is unset
```

---

## Substitution

```bash
echo ${food:-Cake}  #=> $food or "Cake"

STR="/path/to/foo.cpp"
echo ${STR%.cpp}    # /path/to/foo
echo ${STR%.cpp}.o  # /path/to/foo.o
echo ${STR%/*}      # /path/to

echo ${STR##*.}     # cpp (extension)
echo ${STR##*/}     # foo.cpp (basepath)

echo ${STR#*/}      # path/to/foo.cpp
echo ${STR##*/}     # foo.cpp

echo ${STR/foo/bar} # /path/to/bar.cpp
```

## Slice

```bash
name="John"
echo ${name}           # => John
echo ${name:0:2}       # => Jo
echo ${name::2}        # => Jo
echo ${name::-1}       # => Joh
echo ${name:(-1)}      # => n
echo ${name:(-2)}      # => hn
echo ${name:(-2):2}    # => hn

# length = 2
echo ${name:0:length}  # => Jo

## basepath & dirpath
SRC="/path/to/foo.cpp"

BASEPATH=${SRC##*/}   
echo $BASEPATH  # => "foo.cpp"


DIRPATH=${SRC%$BASEPATH}
echo $DIRPATH   # => "/path/to/"
```

## Transform
```bash
STR="HELLO WORLD!"
echo ${STR,}   # => hELLO WORLD!
echo ${STR,,}  # => hello world!

STR="hello world!"
echo ${STR^}   # => Hello world!
echo ${STR^^}  # => HELLO WORLD!

ARR=(hello World)
echo "${ARR[@],}" # => hello world
echo "${ARR[@]^}" # => Hello World
```

---

## Arrays

```bash
Fruits=('Apple' 'Banana' 'Orange')
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"
ARRAY2=(foo{1..2}) # => foo1 foo2
ARRAY3=({A..D})    # => A B C D
# declare construct
declare -a Numbers=(1 2 3 4 5 6)
```

### Indexing

```bash
${Fruits[0]}        # First element
${Fruits[-1]}       # Last element
${Fruits[*]}        # All elements
${Fruits[@]}        # All elements
${#Fruits[@]}       # Number of all
${#Fruits}          # Length of 1st
${#Fruits[3]}       # Length of nth
${Fruits[@]:3:2}    # Range
${!Fruits[@]}       # Keys of all
```

### Array operations

```bash
Fruits=("${Fruits[@]}" "Watermelon")     # Push
Fruits+=('Watermelon')                   # Also Push
Fruits=( ${Fruits[@]/Ap*/} )             # Remove by regex match
unset Fruits[2]                          # Remove one item
Fruits=("${Fruits[@]}")                  # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}")  # Concatenate
lines=(`cat "logfile"`)                  # Read from file
```

### Itteration

```bash
Fruits=('Apple' 'Banana' 'Orange')
for e in "${Fruits[@]}"; do
    echo $e
done
# With index
for i in "${!Fruits[@]}"; do
  printf "%s\t%s\n" "$i" "${Fruits[$i]}"
done
```

```bash
array=(red green blue yellow magenta)  
echo $array      # red  
echo ${array[2]} # blue  
echo ${array[*]} # red green blue yellow magenta  
len=${#array[*]} # len = 5  
  
i=0  
while [ $i -lt $len ]; do  
    echo "$i: ${array[$i]}"  
    let i++  
done  
```

Output:

```
0: red
1: green
2: blue
3: yellow  
4: magenta
```
---

## Dictionaries

```bash
# Define:
declare -A sounds
sounds[dog]="bark"
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"
# Operate:
echo ${sounds[dog]} # Dog's sound
echo ${sounds[@]}   # All values
echo ${!sounds[@]}  # All keys
echo ${#sounds[@]}  # Number of elements
unset sounds[dog]   # Delete dog
# Iteration
for val in "${sounds[@]}"; do
    echo $val
done
for key in "${!sounds[@]}"; do
    echo $key
done
```

## File conditions

```bash
[[ -e FILE ]]	# Exists
[[ -d FILE ]]	# Directory
[[ -f FILE ]]	# File
[[ -h FILE ]]	# Symlink
[[ -s FILE ]]	# Size is > 0 bytes
[[ -r FILE ]]	# Readable
[[ -w FILE ]]	# Writable
[[ -x FILE ]]	# Executable
[[ f1 -nt f2 ]]	# f1newerthan f2
[[ f1 -ot f2 ]]	# f2olderthan f1
[[ f1 -ef f2 ]]	# Same files
```

## continue

```bash
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        continue;
    fi
    echo "$number"
done
```
## break
```bash
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        # Skip entire rest of loop.
        break;
    fi
    # This will only print 1
    echo "$number"
done
```
## until
```bash
count=0
until [ $count -gt 10 ]; do
    echo "$count"
    ((count++))
done
```
## forever
```bash
while true; do
    # here is some code.
done

# forever (short)

while :; do
    # here is some code.
done
```

## readline

```bash
cat file.txt | while read line; do
    echo $line
done
```

## Raising errors

```bash
myfunc() {
    return 1
}

if myfunc; then
    echo "success"
else
    echo "failure"
fi
```

## Special parameters

```bash
[[ -e FILE ]]   # Exists
[[ -d FILE ]]   # Directory
[[ -f FILE ]]   # File
[[ -h FILE ]]   # Symlink
[[ -s FILE ]]   # Size is > 0 bytes
[[ -r FILE ]]   # Readable
[[ -w FILE ]]   # Writable
[[ -x FILE ]]   # Executable
[[ f1 -nt f2 ]] # f1newerthan f2
[[ f1 -ot f2 ]] # f2olderthan f1
[[ f1 -ef f2 ]] # Same files
```

## Conditions

```bash
if [ "$1" = 'y' -a $2 -gt 0 ]; then
    echo "yes"
fi

if [ "$1" = 'n' -o $2 -lt 0 ]; then
    echo "no"
fi

[[ ! EXPR ]]    # NOT
[[ X && Y ]]    # AND
[[ X || Y ]]    # OR
```

## Examples

```bash
# String

if [[ -z "$string" ]]; then
    echo "String is empty"
elif [[ -n "$string" ]]; then
    echo "String is not empty"
else
    echo "This never happens"
fi

# Combinations

if [[ X && Y ]]; then
    ...
fi

# Equal

if [[ "$A" == "$B" ]]; then
    ...
fi

# Regex

if [[ '1. abc' =~ ([a-z]+) ]]; then
    echo ${BASH_REMATCH[1]}
fi

# Smaller

if (( $a < $b )); then
   echo "$a is smaller than $b"
fi

# Exists

if [[ -e "file.txt" ]]; then
    echo "file exists"
fi
```

---

## Loops (examples)

```bash
for i in /etc/rc.*; do
    echo $i
done


for ((i = 0 ; i < 100 ; i++)); do
    echo $i
done

# Ranges
for i in {1..5}; do
    echo "Welcome $i"
done
# Ranges with step size
for i in {5..50..5}; do
    echo "Welcome $i"
done

# Autoincrement
i=1
while [[ $i -lt 4 ]]; do
    echo "Number: $i"
    ((i++))
done

# Autodecrement
i=3
while [[ $i -gt 0 ]]; do
    echo "Number: $i"
    ((i--))
done

# Continue
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        continue;
    fi
    echo "$number"
done

# Break
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        # Skip entire rest of loop.
        break;
    fi
    # This will only print 1
    echo "$number"
done

# Until
count=0
until [ $count -gt 10 ]; do
    echo "$count"
    ((count++))
done

# Forever
while true; do
    # here is some code.
done

# Forever (short)
while :; do
    # here is some code.
done

# Reading lines
cat file.txt | while read line; do
    echo $line
done
```

### Special parameters

```bash
!!	                # Execute last command again
!!:s/<FROM>/<TO>/	# Replace first occurrence of <FROM> to <TO> in most recent command
!!:gs/<FROM>/<TO>/	# Replace all occurrences of <FROM> to <TO> in most recent command
!$:t	            # Expand only basename from last parameter of most recent command
!$:h	            # Expand only directory from last parameter of most recent command
```
!! and !$ can be replaced with any valid expansion.

```bash
!$	                # Expand last parameter of most recent command  
!*	                # Expand all parameters of most recent command  
!-n	                # Expand nth most recent command  
!n	                # Expand nth command in history  
!<command>	        # Expand most recent invocation of command <command> 
```

## Slices
```
!!:n	Expand only nth token from most recent command (command is 0; first argument is 1)
!^	Expand first argument from most recent command
!$	Expand last token from most recent command
!!:n-m	Expand range of tokens from most recent command
!!:n-$	Expand nth token to last from most recent command

!! can be replaced with any valid expansion i.e. !cat, !-2, !42, etc.
```

---
# NOTES

```bash
date +%F" "%H:%M:%S # Get date
```

Test if `$var` is an integer:

```bash
if [ `expr $a + 1 2> /dev/null` ] ; then echo $a is numeric ; else echo $a is not numeric ; fi ;  
```

List all files in the current directory with size:

```bash
du -csh *
```

List the 10 biggest files of current directory:

```bash
ls -l --sort=size | head -10  
```

List the size of all files and summarized size of directories inside current directory

```bash
du -csh * | sort -rh
```

```
du
    -s (display only a total for each argument)
    -h (print sizes in human readable format)
sort
    -r (descending order)
    -h (compare human readable numbers (e.g., 2K 1G))
```

Cleaning all logs on a Linux system without deleting the files:

```bash
for CLEAN in $(find /var/log/ -type f); do  
    cp /dev/null  $CLEAN  
done

```

Append to restricted file:

```bash
sudo bash -c 'echo "string" > file'
echo "string" | sudo tee file.txt  # add -a to append
```

## Information Sources

https://wiki.bash-hackers.org/start