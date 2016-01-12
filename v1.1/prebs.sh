#!/bin/bash
# This script is licenced under GPLv2 ; you can get your copy of licence from http://www.gnu.org/licenses/gpl-2.0.html
# Utility tool to Startup and Shutdown EBS
# (c) Omkar Dhekne
# Script version: 1.1

# Functions:
form() # EBS-Profile form
{
exec 3>&1

dialog                                             \
--separate-widget $'\n'                            \
--backtitle "Oracle Applications R12 - Startup/Shutdown Script" \
--title "EBS-Profile form"                                  \
--form "Create new EBS-Profile:"                                          \
0 0 0                                              \
"Installation Dir: ex: /R12"     1 1 "$dir1"     1 30 30 0              \
"SID: ex: PROD"       2 1     "$sid1"       2 30 30 0  \
2>&1 1>&3 | {
    read -r dir1
    read -r sid1
    host=`hostname -a`
    # The rest of the script goes here
mkdir -p /home/oracle/.ebs/logs/
touch /home/oracle/.ebs/logs/{stop.log,start.log}
cp -r ./ebs-profile /home/oracle/.ebs/
cat >> /home/oracle/.ebs/ebs-profile <<EOF
export INSTALLATION_DIR="$dir1"
export SID="$sid1"
export HOST="$host"
EOF
}

exec 3>&-
whiptail --title "EBS Profile form" --backtitle "Oracle Applications R12 - Startup/Shutdown Script" --msgbox "                 EBS profile is created successfully. 
Please re-execute the script to continue with Oracle Applications R12 - Startup/Shutdown Script."  8 77
}
