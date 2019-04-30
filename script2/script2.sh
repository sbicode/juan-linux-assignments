#!/bin/bash

dirs_list="dirs.txt"
files_list="files.txt"

if [ "$#" -eq 1 ]; then
    dirs_list=$1
elif [ "$#" -eq 2 ]; then
    dirs_list=$1
    files_list=$2
fi

if [ -f $dirs_list ]; then
    while IFS= read -r var
    do
        echo $var
    done < "$dirs_list"
fi

echo "******"

if [ -f $files_list ]; then
    while IFS= read -r var
    do
        stat $var
    done < "$files_list"
fi
