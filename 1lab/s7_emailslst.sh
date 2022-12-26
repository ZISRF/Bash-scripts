#!/bin/bash

dir="/etc"
email_regex='[a-zA-Z0-9_\.]+@[a-zA-Z0-9_\.]+(\.[a-zA-Z]+)+'

grep -I -E -h -o -w -s -r $email_regex $dir | awk '{printf("%s, ", $1)}' > emails.lst