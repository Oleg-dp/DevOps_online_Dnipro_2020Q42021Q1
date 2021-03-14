#!/bin/sh
setenforce 0
yum -y install yum-utils
yum -y update
yum -y upgrade
yum -y install -y wget curl
rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#setenforce 1
reboot
