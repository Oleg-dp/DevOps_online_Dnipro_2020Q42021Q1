#!/bin/bash
file_in=$1
cat $1 | grep -E -o "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c | sort -gr | head -n 1

