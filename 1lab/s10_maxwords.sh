#!/bin/bash

filename="/var/log/*.log"

cat $filename | wc -l
[user@localhost lab1]$ cat s10_maxwords.sh 
#!/bin/bash

man bash | tr '[A-Z]' '[a-z]' | grep -o '[a-z]\{4,\}' | sort | uniq -c | sort -n -r | head -3