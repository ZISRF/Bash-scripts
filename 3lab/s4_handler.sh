#!/bin/bash

counting()
{
    while true
    do
        let a=123456*654321
    done &
}

counting & pid1=$!
counting & pid2=$!
counting & pid2=$!

priority=1

while true
do
    cpu=$(top -b -n 1 -p "$pid1" | tail -n 1 | awk '{print $9}')
    if (( $(echo "$cpu>10.0" | bc -l) ))
    then
        renice -p $pid1 -n $priority
        let priority=$priority+1
    fi
    sleep 1
done