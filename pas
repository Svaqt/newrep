#!/bin/bash

small=$(echo $((RANDOM % 26 + 97)) | awk '{printf("%c",$1)}')
big=$(echo $((RANDOM % 26 + 65)) | awk '{printf("%c",$1)}')
num=$(echo $((RANDOM % 10 + 48)) | awk '{printf("%c",$1)}')

length=10

while getopts "l:" opt; do
case $opt in
l)
length=$OPTARG;;
\?)
echo "неверный параметр: -$OPTARG" >&2
esac
done

abc=$(printf "%0.s$small$big$num" $(seq 1 $length))

sf=$(echo "$abc" | fold -w1 | shuf | tr -d '\n')
sf=${sf:0:$length}

echo "$sf"
