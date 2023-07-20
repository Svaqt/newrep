#!/bin/bash

function help {
echo "Генератор паролей"
echo "-l Длинна пароля.По умолчанию 10"
echo "-n Колличесво паролей. По умолчанию 5"
echo "-h Помощь"
}

symb="qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
dlin=10
col=5

while getopts "l:n:h" opt; do
case $opt in
l)
dlin=$OPTARG;;
n)
col=$OPTARG;;
h)
help
exit 0;;
\?)
echo "Ne ponyatno: -$OPTARG" >&2
help
exit 1;;
esac
done

for (( j=0; j<col; j++)); do
pas=""
for (( i=0; i<dlin; i++ )); do
random=$((RANDOM % ${#symb}))
rand=${symb:$random:1}
pas+=$rand
done
echo "$pas"
done
