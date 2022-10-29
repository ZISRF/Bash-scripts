#!/bin/bash

echo "" > s5_result.txt

prev_ppid=0
s=0
k=0

cat 's4_result.txt' | while read l
do
    l=$(echo $l | sed 's/=/= /g')
    
    pid=$(echo $l | awk '{print $2}')
    ppid=$(echo $l | awk '{print $5}')
    art=$(echo $l | awk '{print $8}')

    if [[ $ppid == $prev_ppid || prev_ppid == '0' ]]
    then
        s=$(bc<<<"scale=3;$s+$art")
        let k=$k+1
    else
        echo "Average_Running_Children_of_ParentID=$prev_ppid is $(bc<<<"scale=3;$s/$k")" >> s5_result.txt
        s=$art
        k=1
    fi

    echo $l | sed 's/= /=/g' >> s5_result.txt
    prev_ppid=$ppid
done