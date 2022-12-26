#!/bin/bash

while true
do

echo "1 - open nano"
echo "2 - open vi"
echo "3 - open links"
echo "q - exit"

read arg

case "$arg" in
"1" )
nano
;;
"2" )
vi
;;
"3" )
links
;;
"q" )
exit
;;
* )
echo "invalid argument"
;;
esac

done