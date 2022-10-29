#!/bin/bash

mode="+"
cur_value=1

(tail -f s5_pipe) | while true
do
    read LINE;
    case $LINE in
    "+" )
        mode="+"
        ;;
    "*" )
        mode="*"
        ;;
    "QUIT" )
        echo "Exiting without errors (final value = $cur_value)"
        killall tail
        killall s5_generator.sh
        exit
        ;;
    * )
        if [[ $LINE =~ '^[+-]?[0-9]+$' ]]
        then
            cur_value=$(echo "$cur_value$mode$LINE" | bc -l)
        else
            echo "Error, invalid argument"
            killall tail
            killall s5_generator.sh
            exit
        fi
        ;;
    esac
done