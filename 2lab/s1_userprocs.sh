#!/bin/bash

ps U user | tail -n +2 | wc -l
ps U user | tail -n +2 | awk '{printf("%s:%s\n", $1, $5)}' > s1_result.txt