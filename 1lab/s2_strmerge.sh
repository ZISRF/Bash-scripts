#!/bin/bash

res=""

read c
while [[ "$c" != "q" ]]
do
res="$res$c"
read c
done

echo $res