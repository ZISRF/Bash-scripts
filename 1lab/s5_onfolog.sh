#!/bin/bash

if [[ "$PWD" == "$HOME" ]]
then
echo "$HOME"
exit 0
else
echo "error"
exit 1
fi
[user@localhost lab1]$ cat s5_infolog.sh 
#!/bin/bash

filename="/var/log/anaconda/syslog"

awk '$2 == "INFO" {print}' "$filename" > info.log