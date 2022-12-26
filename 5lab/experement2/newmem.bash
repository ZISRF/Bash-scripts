#!/bin/bash

maxsize="$1"
array=()

while true
do
    array+=(1 2 3 4 5 6 7 8 9 10)

    if [[ "${#array[@]}" -gt $maxsize ]]
    then
        exit 0
    fi
done