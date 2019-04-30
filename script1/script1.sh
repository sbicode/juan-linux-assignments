#!/bin/bash
while getopts ":d:f:" opt; do
  case "$opt" in
    d) directory_list=$OPTARG ;;
    f) file_list=$OPTARG ;;
  esac
done
shift $(( OPTIND - 1 ))

echo $directory_list
echo $file_list

if [ -z $directory_list ]
then
    echo "\$directory_list is empty"
else
    touch $directory_list
    > $directory_list
    for file_or_directory in "$@"; do
        if [ -d $file_or_directory ]; then
            echo "$file_or_directory exists"
            echo "$file_or_directory" > $directory_list
        fi
    done
fi

if [ -z $file_list ]
then
    echo "\$file_list is empty"
else
    touch $file_list
    > $file_list
    for file_or_directory in "$@"; do
        if [ -f $file_or_directory ]; then
            echo "$file_or_directory exists"
            echo "$file_or_directory" > $file_list
        fi
    done
fi
