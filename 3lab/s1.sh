#!/bin/bash

start_date=$(date '+%Y-%m-%d-%H:%M:%S')

mkdir "$HOME/test" && 
{
    echo "catalog was created successfully" > ~/report
    touch "$HOME/test/$start_date"
}

ping -c 1 "www.net_nikogo.ru" || echo "$(date) host is not available" >> ~/report