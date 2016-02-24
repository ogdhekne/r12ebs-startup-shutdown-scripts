#!/bin/bash
#------------------------------------------------------------------------------------------------------------------------#
# This script is licenced under GPLv2 ; you can get your copy of licence from http://www.gnu.org/licenses/gpl-2.0.html   #
# Utility tool to Startup and Shutdown EBS                                                                               #
# (c) Omkar Dhekne                                                                                                       #
# Script version: 1.2                                                                                                    #
#------------------------------------------------------------------------------------------------------------------------#

# EBS Profile
source /home/oracle/.ebs/ebs-profile

## Status Logs

# start_status

s_1()
{
#---#
if test $o1 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status listener process $SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status listener process $SID"
fi
#---#
if test $o2 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status the database $SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status the database $SID"
fi
}

s_2()
{
#---#
if test $o3 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status Oracle Process Manager (OPMN)"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status Oracle Process Manager (OPMN)"
fi
#---#
if test $o4 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status listener process APPS_$SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status listener process APPS_$SID"
fi
#---#
if test $o5 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status OPMN managed Oracle HTTP Server (OHS) instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status OPMN managed Oracle HTTP Server (OHS) instance"
fi
#---#
if test $o6 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status OPMN managed OACORE OC4J instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status OPMN managed OACORE OC4J instance"
fi
#---#
if test $o7 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status OPMN managed FORMS OC4J instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status OPMN managed FORMS OC4J instance"
fi
#---#
if test $o8 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status OPMN managed OAFM OC4J instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status OPMN managed OAFM OC4J instance"
fi
#---#
if test $o9 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status concurrent manager for $SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status concurrent manager for $SID"
fi
#---#
if test $o10 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Start-status Fulfillment Server for $SID on port '93$PORT'"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Start-status Fulfillment Server for $SID on port '93$PORT'"
fi
#---#
if test $o11 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] All enabled services for this node"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] All enabled services for this node"
fi
#---#
}


# stop_status

s_3()
{
#---#
if test $i1 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status Fulfillment Server for $SID on port '93$PORT'"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status Fulfillment Server for $SID on port '93$PORT'"
fi
#---#
if test $i2 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status concurrent manager for $SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status concurrent manager for $SID"
fi
#---#
if test $i3 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status OPMN managed OAFM OC4J instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status OPMN managed OAFM OC4J instance"
fi
#---#
if test $i4 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status OPMN managed FORMS OC4J instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status OPMN managed FORMS OC4J instance"
fi
#---#
if test $i5 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status OPMN managed OACORE OC4J instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status OPMN managed OACORE OC4J instance"
fi
#---#
if test $i6 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status OPMN managed Oracle HTTP Server (OHS) instance"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status OPMN managed Oracle HTTP Server (OHS) instance"
fi
#---#
if test $i7 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status listener process APPS_$SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status listener process APPS_$SID"
fi
#---#
if test $i8 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status Oracle Process Manager (OPMN)"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status Oracle Process Manager (OPMN)"
fi
#---#
if test $i9 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] All enabled services for this node"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] All enabled services for this node"
fi
}

s_4()
{
#---#
if test $i10 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status listener process $SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status listener process $SID"
fi
#---#
if test $i11 -eq "0"
then
echo -e "[${Bold_Green:-}OK${Reset:-}] Stop-status the database $SID"
else
echo -e "[${Bold_Red:-}FAILED${Reset:-}] Stop-status the database $SID"
fi
#---#
}
