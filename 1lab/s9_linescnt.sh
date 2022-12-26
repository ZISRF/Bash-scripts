#!/bin/bash

filename="/var/log/*.log"

cat $filename | wc -l