sc stop dnscache

timeout /t 5 /nobreak
net start > services2.txt
fc services1.txt services2.txt > servicesDiff.txt

sc start dnscache