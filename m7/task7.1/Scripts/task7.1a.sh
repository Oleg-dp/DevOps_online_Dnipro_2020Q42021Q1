#!/bin/bash

#Declare global variables
ipaddr=`/usr/sbin/ip a | grep inet | grep -v "127.0.0.1" | awk '{print $2}'`

#Preparing to work
rm -rf $valid_host_txt
rm -rf $online_host_txt

#Declare functions

function func_all()
{
    /usr/bin/nmap -sn $ipaddr -oG - | awk '/Up$/{print $2 " " $3}'
}

function func_target()
{
#    /usr/bin/nmap -sn $ipaddr -oG - | awk '/Up$/{print $2 " " $3}'
    /usr/bin/netstat -nlpt
#    /usr/bin/nmap $ipaddr | grep open
}

#Start program

if [ ! -f /usr/bin/nmap ];
then 
    echo "/usr/bin/nmap is not installed on your system. Script aborted."
    exit 1
fi

#Verify enter variables
if [ -z $1 ]
then
    echo "The --all key displays the IP addresses and symbolic names of all hosts in the current subnet"
    echo "The --target key displays a list of open system TCP ports"
    exit 1
fi
case $1 in
        "--all")
		func_all
        ;;
        "--target")
    		func_target
        ;;
        "-h")
	    echo "The --all key displays the IP addresses and symbolic names of all hosts in the current subnet"
	    echo "The --target key displays a list of open system TCP ports"
	;;
        *)
	echo "Unrecognized option $1"
	echo "See the output of -h for a summary of options."
	exit 1
        ;;
esac
