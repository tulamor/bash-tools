#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

DIR1=$1
DIR2=$2

files="$DIR1/*"
for file in $files
 do
  name=${file##*/}
  echo "cmp $name"
  cmp $DIR1/$name $DIR2/$name
#  diff $DIR1/$name $DIR2/$name
 done
echo "-- Comparison completed successfully"
