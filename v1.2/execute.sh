#!/bin/bash
# This script is licenced under GPLv2 ; you can get your copy of licence from http://www.gnu.org/licenses/gpl-2.0.html
# Utility tool to Startup and Shutdown EBS
# (c) Omkar Dhekne
# Script version: 1.2

# EBS Profile
source /home/oracle/.ebs/ebs-profile


start() # Purpose - Startup EBS
{
{
#db:
source $ORACLE_BASE/db/tech_st/11.1.0/$SID\_$HOST.env
$ORACLE_BASE/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addlnctl.sh start $SID
$ORACLE_BASE/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addbctl.sh start
} > $startlog | s_1
{
#apps:
source $ORACLE_BASE/apps/apps_st/appl/APPS$SID\_$HOST.env
$ORACLE_BASE/inst/apps/$SID\_$HOST/admin/scripts/adstrtal.sh apps/apps
} >> $startlog | s_2
}

stop() # Purpose - Shutdown EBS
{
{
#apps:
source $ORACLE_BASE/apps/apps_st/appl/APPS$SID\_$HOST.env
$ORACLE_BASE/inst/apps/$SID\_$HOST/admin/scripts/adstpall.sh apps/apps
} > $stoplog | s_3
{
#db:
source $ORACLE_BASE/db/tech_st/11.1.0/$SID\_$HOST.env
$ORACLE_BASE/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addlnctl.sh stop $SID
$ORACLE_BASE/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addbctl.sh stop
} >> $stoplog | s_4
}

press1() # Overall Status 1 - For startup
{
	if test `expr $o1 + $o2 + $o3 + $o4 + $o5 + $o6 + $o7 + $o8 + $o9 + $o10 + $o11` -eq "0"
	then
		echo -e "[OVERALL: ${Bold_Green:-}SUCCESS${Reset:-}] Press 'Enter' key to return Main-Menu"
		echo -e "          Access URL via Browser: 'http://$HOST:80$PORT'"
	else
		echo -e "[OVERALL: ${Bold_Red:-}FAILED${Reset:-}] Press 'Enter' key to return Main-Menu"
	fi
}

press2() # Overall Status 2 - For shutdown
{
	if test `expr $i1 + $i2 + $i3 + $i4 + $i5 + $i6 + $i7 + $i8 + $i9 + $i10 + $i11` -eq "0"
	then
		echo -e "[OVERALL: ${Bold_Green:-}SUCCESS${Reset:-}] Press 'Enter' key to return Main-Menu"
	else
		echo -e "[OVERALL: ${Bold_Red:-}FAILED${Reset:-}] Press 'Enter' key to return Main-Menu"
	fi
}

unexpected() # Check if application is terminated unexpectedly.
{
	if test "$curltest" -ne "0"
	then
		echo -e "[${Bold_Purple:-}DOWN${Reset:-}]  : Current Status"
		echo -e "Apps-DB terminated unexpectedly before `uptime | awk '{print $1}'` ; Press 'Enter' key to restart Apps-DB Services from Main-Menu"
	else
		s_1 ; s_2 ; press1
	fi
}

status() # Purpose - Check realtime status of Apps-DB Services
{
if test $startlogfile -gt $stoplogfile
then
	echo -e "[${Bold_Purple:-}UP${Reset:-}] Last check APPS-DB Status. " ; sleep 1s;echo ""; unexpected ; read
else
	echo -e "[${Bold_Purple:-}DOWN${Reset:-}] Last check APPS-DB Status. " ; sleep 1s;echo ""; s_3 ; s_4 ; press2  ; read
fi
}
