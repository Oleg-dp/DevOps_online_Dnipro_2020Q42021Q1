#!/bin/bash

#Declare global variables

#Declare functions

function r_sync()
{
    /usr/bin/rsync -av --delete $1 $2 --log-file=/tmp/task7.1.C.log --log-file-format="%t %o %f"
}

#Start program

if [ ! -f /usr/bin/rsync ];
then 
    echo "/usr/bin/rsync is not installed on your system. Script aborted."
    exit 1
fi

#Verify enter variables
if [ -z $1 ]
then
    echo "Usage: task7.1.C.sh source_dir target_dir to you sync"
    exit 1
fi

if [ -z $2 ]
then
    echo "Usage: task7.1.C.sh source_dir target_dir to you sync"
    exit 1
fi

if [ -d $1 ]; 
then
    if [ -d $2 ]; 
    then
	r_sync $1 $2
    else
	echo "Not valid parametrs"
	exit 1
    fi
else
    echo "Not valid parametrs"
    exit 1
fi
