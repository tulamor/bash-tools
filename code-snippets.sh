#!/bin/bash

# list unique file extensions inside directory
find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u

# copy .txt file extension files into "txt" directory
for file in `find . -type f -name "*.txt"`; do cp $file ../txt; done

# move specific file extension files to "sortedfiles" directory
for filetype in {*.sh,*.py,*.pdf,*.html}; do
  for file in `find . -filetype f -name "*.txt"`; do 
    echo $file; mv $file ../sortedfiles
  done
done

