#!/bin/bash

(tail -f ~/report 2>/dev/null) | while true; 
do
    read LINE;
    echo $LINE
done