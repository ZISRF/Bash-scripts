#!/bin/bash

echo $$ > .s6_handler_pid

mode="+"
cur_value=1
delta=2

usr1()
{
    mode="+"
}

usr2()
{
    mode="*"
}

sigterm()
{
    echo "Exiting without errors"
    exit
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM

while true
do
    cur_value=$(echo "$cur_value$mode$delta" | bc -l)
    echo "Current value = $cur_value"
    sleep 1
done