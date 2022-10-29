#!/bin/bash

max=-1

for pid in $(ps -e -o pid | tail -n +2)
do if [[ -d "/proc/$pid" ]]
then
    cur=$(cat "/proc/$pid/status" | grep -E 'VmRSS:' | awk '{print $2}')

    if [[ "$cur" -gt "$max" ]]
    then
        max=$cur
        echo $pid > max_pid.tmp
    fi
fi
done

cat max_pid.tmp
rm max_pid.tmp