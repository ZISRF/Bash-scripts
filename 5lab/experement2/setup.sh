#!/bin/bash

N="$1"
K="$2"

for (( i=0; i<$K; i++))
do
    ./newmem.bash $N &
    sleep 1
done