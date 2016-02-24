#!/bin/bash
#------------------------------------------------------------------------------------------------------------------------#
# This script is licenced under GPLv2 ; you can get your copy of licence from http://www.gnu.org/licenses/gpl-2.0.html   #
# Utility tool to Startup and Shutdown EBS                                                                               #
# (c) Omkar Dhekne                                                                                                       #
# Script version: 1.2                                                                                                    #
#------------------------------------------------------------------------------------------------------------------------#

# Functions:
form() # EBS-Profile form
{
exec 3>&1

dialog                                             \
--separate-widget $'\n'                            \
--backtitle "Oracle Applications R12 - Startup/Shutdown Script" \
--title "EBS-Profile form"                                  \
--form "Create new EBS-Profile:"                                          \
10 80 0                                              \
"ORACLE_BASE Dir.: ex: /R12/oracle/PROD"     1 1 "$dir1"     1 40 32 0              \
"SID: ex: PROD"       2 1     "$sid1"       2 40 32 0  \
"PORT-POOL: ex: 00,01,02,.. "       3 1     "$pool1"       3 40 32 0  \
2>&1 1>&3 | {
    read -r dir1
    read -r sid1
    read -r pool1
    host=`hostname -a`
    # The rest of the script goes here
mkdir -p /home/oracle/.ebs/logs/
touch /home/oracle/.ebs/logs/{stop,start}.log
cp -r ./ebs-profile /home/oracle/.ebs/
cat >> /home/oracle/.ebs/ebs-profile <<EOF
export ORACLE_BASE="$dir1"
export SID="$sid1"
export HOST="$host"
export PORT="$pool1"
export curltest="$(curl http://$HOST:80$PORT &> /dev/null ; echo $?)"
EOF
}

exec 3>&-
whiptail --title "EBS Profile form" --backtitle "Oracle Applications R12 - Startup/Shutdown Script" --msgbox "                 EBS profile is created successfully.
Please re-execute the script to continue with Oracle Applications R12 - Startup/Shutdown Script."  8 77
}
