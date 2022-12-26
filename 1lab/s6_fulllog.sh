#!/bin/bash

filename="/var/log/anaconda/syslog"

awk '$2 == "INFO" {print}' "$filename" > info.log
[user@localhost lab1]$ cat s6_fulllog.sh 
#!/bin/bash

filename="/var/log/anaconda/X.log"
info_regex='\(II\)'
warning_regex='\(WW\)'

grep -E $warning_regex $filename | sed -E "s/$warning_regex/Warning: /" > full.log
grep -E $info_regex $filename | sed -E "s/$info_regex/Information: /" >> full.log

cat full.log