#!/bin/sh
setenforce 0
/bin/sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
yum -y install yum-utils mc wget curl mlocate
rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update
yum -y upgrade
/sbin/shutdown -r 5
