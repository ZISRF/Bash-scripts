#!/bin/bash

while true
do
    read LINE;
    case $LINE in
    "+" )
        kill -USR1 $(cat .s6_handler_pid)
        ;;
    "*" )
        kill -USR2 $(cat .s6_handler_pid)
        ;;
    "TERM" )
        kill -SIGTERM $(cat .s6_handler_pid)
        exit
        ;;
    * )
        ;;
    esac
done