#!/bin/bash

echo "" > report2.log

array=()
counter=0

while true
do
    array+=(1 2 3 4 5 6 7 8 9 10)
    counter=$((counter + 1))

    if [[ $counter -eq 100000 ]]
    then
        echo "${#array[@]}" >> report2.log
        counter=0
    fi
done