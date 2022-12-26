#!/bin/bash

if [[ ! -d "/home/user/source" || -z $(ls "/home/user/source") ]]
then
    echo "Please create directory '/home/user/source' and put some files in them to make backup"
    exit
fi

curdate=$(date +"%Y-%m-%d")
curdate_inseconds=$(date -d "$curdate" +"%s")

nearest_date=0
delta=9999999999

IFS=$'\n'
for dir in $(ls -1 /home/user)
do
    if [[ "$dir" =~ ^Backup-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$ ]]
    then
        dirdate=${dir:7}
        dirdate_inseconds=$(date -d "$dirdate" +"%s")
        let newdelta="$curdate_inseconds"-"$dirdate_inseconds"
        if [[ "$newdelta" -le 604800 && "$newdelta" -lt "$delta" ]]
        then
            nearest_date="$dirdate"
            delta="$newdelta"
        fi
    fi
done

files=$(ls -1 "/home/user/source")
if [[ $nearest_date -eq 0 ]]
then
    mkdir "/home/user/Backup-$curdate"
    IFS=$'\n'
    for file in $files
    do
        cp "/home/user/source/$file" "/home/user/Backup-$curdate/$file"
    done
    echo "Backup-$curdate was created with files: $(echo $files | tr '\n' ', ')" >> /home/user/backup-report
else
    IFS=$'\n'
    for file in $files
    do
        logstr="Backup-$nearest_date was changed $curdate"
        if [[ ! -f "/home/user/Backup-$nearest_date/$file" ]]
        then
            cp "/home/user/source/$file" "/home/user/Backup-$nearest_date/$file"
            logstr="$logstr\n$file"
        elif [[ $(stat -c %s "/home/user/source/$file") -ne $(stat -c %s "/home/user/Backup-$nearest_date/$file") ]]
        then
            mv "/home/user/Backup-$nearest_date/$file" "/home/user/Backup-$nearest_date/$file.$curdate" 
            cp "/home/user/source/$file" "/home/user/Backup-$nearest_date/$file"
            logstr="$logstr\n$file $file.$curdate"
        fi
        echo $logstr >> /home/user/backup-report
    done
fi

