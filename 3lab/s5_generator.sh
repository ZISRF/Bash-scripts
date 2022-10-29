#!/bin/bash

if [[ ! -f s5_pipe ]]
then
    mkfifo s5_pipe
fi

while true
do
    read LINE;
    echo $LINE > s5_pipe
done