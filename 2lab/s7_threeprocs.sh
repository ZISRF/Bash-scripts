#!/bin/bash

echo "" > begin.tmp
for pid in $(ps -eo pid | tail -n +2)
do if [[ -d "/proc/$pid" ]]
then
    read_bytes=$(cat "/proc/$pid/io" | grep -E 'read_bytes:' | awk '{print $2}')
    echo "Pid=$pid $read_bytes" >> begin.tmp
fi
done

sleep 60

echo "" > result.tmp
for pid in $(ps -eo pid | tail -n +2)
do if [[ -d "/proc/$pid" ]]
then
    begin_read_bytes=$(cat "begin.tmp" | grep -Ew "Pid=$pid" | awk '{print $2}')
    end_read_bytes=$(cat "/proc/$pid/io" | grep -E 'read_bytes:' | awk '{print $2}')

    if [[ ! -z "$begin_read_bytes" ]]
    then
        delta_read_bytes=$(( $end_read_bytes - $begin_read_bytes ))
        echo $delta_read_bytes >> result.tmp
    fi
fi
done

cat result.tmp | sort -n | tail -n3

rm begin.tmp
rm result.tmp