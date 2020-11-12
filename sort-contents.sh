#!/bin/bash
# sort the contents of all files inside etc dir (subdirectories included)
find ./etc/* -maxdepth 2 -type f -exec sort -o {} {} \;
