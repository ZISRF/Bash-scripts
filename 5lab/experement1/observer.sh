#!/bin/bash

./mem.bash & pid=$!

echo -e "MEM\tSWAP\tTIME\tVIRT\tRES\tSHR\t%MEM\t%CPU" > data

while [[ ! -z $(top -b -n 1 | grep $pid) ]]
do
    free_mem=$(top -b -n 1 | head -n 4 | tail -n 1 | awk '{print $6}')
    free_swap=$(top -b -n 1 | head -n 5 | tail -n 1 | awk '{print $5}')
    proc_info=$(top -b -n 1 | grep $pid | awk '{print $11 "\t" $5 "\t" $6 "\t" $7 "\t" $9 "\t" $10}')

    echo -e "$free_mem\t$free_swap\t$proc_info" >> data

    sleep 1
done