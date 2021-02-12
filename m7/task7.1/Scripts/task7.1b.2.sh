#!/bin/bash
file_in=$1 
cat $1 | awk '{print $7}' | sort | uniq -c | sort -gr | head -n 1

