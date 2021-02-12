#!/bin/bash
file_in=$1 
cat $1 | awk '{print $4}' | sort | uniq -c | sort -gr | head -n 1 | sed 's/\[/ /'

