#!/bin/bash

if [[ ! -f "$HOME/.trash.log" ]]
then
    echo "Unable to restore files"
    exit
fi

filename="$1"

cat "$HOME/.trash.log" | grep -E "/$filename////" | while read line
do
    fullfilename=$(echo $line | awk -F//// '{print $1}')
    linkname=$(echo $line | awk -F//// '{print $2}')

    read -p "Do you want to restore '$fullfilename'? " answer

    if [[ $answer == 'y' || $answer == 'Y' ]]
    then
        filedir=$(dirname "$fullfilename")
        filename=$(basename "$fullfilename")

        newlogfile=$(sed -E "/$filename $linkname/d" "$HOME/.trash.log")
        echo "$newlogfile" > "$HOME/.trash.log"

        if [[ ! -d $filedir ]]
        then
            echo "There is no directory '$filedir', file will be saved in home directory"
            filedir=$HOME
            fullfilename="$filedir/$filename"
        fi

        while [ -f "$fullfilename" ]
        do
            read -p "File $filename already exists in directort '$filedir', enter a new name: " filename
            fullfilename="$filedir/$filename"
        done
        
        ln -- "$HOME/.trash/$linkname" "$fullfilename"
        rm -- "$HOME/.trash/$linkname"

        exit
    fi
done