#!/bin/bash

ps -e | grep -E '\s/sbin/' | awk '{print $1}' > s2_result.txt