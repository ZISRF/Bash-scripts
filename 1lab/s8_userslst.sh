#!/bin/bash

dir="/etc"
email_regex='[a-zA-Z0-9_\.]+@[a-zA-Z0-9_\.]+(\.[a-zA-Z]+)+'

grep -I -E -h -o -w -s -r $email_regex $dir | awk '{printf("%s, ", $1)}' > emails.lst
[user@localhost lab1]$ cat s8_userslst.sh 
#!/bin/bash

filename="/etc/passwd"

awk 'FS=":" {printf("%s\t%s\n", $3, $1)}' $filename | sort -n