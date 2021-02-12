#!/bin/bash
file_in=$1 
cat $1 | grep ' 404 ' | awk '{print $7}' | sort | uniq -c | sort -gr

