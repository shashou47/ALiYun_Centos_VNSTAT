#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#===================================================================
#   SYSTEM REQUIRED:  CentOS 6 (32bit/64bit)
#   DESCRIPTION:  Auto install vnstat for CentOS 6
#===================================================================

if [[ $EUID -ne 0 ]]; then
    echo "Error:This script must be run as root!"
    exit 1
fi


clear
echo ""
echo "#############################################################"
echo "# Auto Install vnstat for ALiYun CentOS 6.x                 #"
echo "# System Required: CentOS 6(32bit/64bit)                    #"
echo "#############################################################"
echo ""



yum install epel-release -y

if ! yum install vnstat -y;then
    echo "Failed to download vnstat."
    exit 1
fi


vnstat -u -i eth1
service vnstat start
chkconfig vnstat on

echo ""
echo "vnstat is installed."
echo "use [vnstat -d] or [vnstat -m] 10 minutes later"
echo ""
 
exit 0
