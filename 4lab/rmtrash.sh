#!/bin/bash

filename="$1"

if [[ ! -f "$filename" ]]
then
    echo "Invalid filename"
    exit
fi

if [[ ! -d "$HOME/.trash" ]]
then
    mkdir "$HOME/.trash"
fi

echo 1 > .linkname
ls "$HOME/.trash" | while read i
do
    if [[ $i -ge $(cat .linkname) ]]
    then
        let newlinkname=$i+1
        echo "$newlinkname" > .linkname
    fi
done
linkname=$(cat .linkname)
rm .linkname

ln -- "$filename" "$HOME/.trash/$linkname"
rm -- "$filename"

echo "$PWD/$filename////"$linkname >> "$HOME/.trash.log"