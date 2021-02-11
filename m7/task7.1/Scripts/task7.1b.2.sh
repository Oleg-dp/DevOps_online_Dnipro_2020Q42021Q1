#!/bin/bash
file_out=out_script2
awk '{print $7}' $1 | sort | uniq -c | sort -gr > $file_out
{
read line1
} < $file_out
echo $line1
