#!/bin/bash
file_in=$1 
cat $1 | grep bot | awk '{print $1 " " $14}' | grep bot |  sort | uniq -c | sort -gr 

