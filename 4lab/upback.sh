#!/bin/bash

if [[ ! -d "/home/user/restore" ]]
then
    mkdir "/home/user/restore"
fi

lastest_date="0001-01-01"

IFS=$'\n'
for dir in $(ls -1 /home/user)
do
    if [[ $dir =~ ^Backup-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$ ]]
    then
        dirdate=${dir:7}
        dirdate_inseconds=$(date -d $dirdate +"%s")
        if [[ $(date -d $dirdate +"%s") -gt $(date -d $lastest_date +"%s") ]]
        then
            lastest_date=$dirdate
        fi
    fi
done

IFS=$'\n'
for file in $(ls -1 "/home/user/Backup-$lastest_date")
do
    if [[ ! file =~ .[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$ ]]
    then
        cp "/home/user/Backup-$lastest_date/$file" "/home/user/restore/$file"
    fi
done