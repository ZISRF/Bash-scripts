#!/bin/bash

echo "" > s4_result.txt

for pid in $(ps -e -o pid | tail -n +2)
do if [[ -d "/proc/$pid" ]]
then
    ppid=$(cat "/proc/$pid/status" | grep -E 'PPid:' | awk '{print $2}')

    ser=$(cat "/proc/$pid/sched" | grep -E 'sum_exec_runtime' | awk '{print $3}')
    nrs=$(cat "/proc/$pid/sched" | grep -E 'nr_switches' | awk '{print $3}')
    art=$(bc<<<"scale=3;$ser/$nrs")
    
    echo "ProcessID= $pid : Parent_ProcessID= $ppid : Average_Running_Time= $art" >> s4_result.txt
fi
done

res=$(cat s4_result.txt | sort -nk5 | sed 's/= /=/g')
echo $res > result.txt