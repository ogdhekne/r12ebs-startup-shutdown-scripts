#!/bin/bash
# This script is licenced under GPLv2 ; you can get your copy of licence from http://www.gnu.org/licenses/gpl-2.0.html
# Utility tool to Startup and Shutdown EBS
# (c) Omkar Dhekne
# Script version: 1.1

# EBS Profile
source /home/oracle/.ebs/ebs-profile


start() # Purpose - Startup EBS
{
{
#db:
source $INSTALLATION_DIR/oracle/$SID/db/tech_st/11.1.0/$SID\_$HOST.env
$INSTALLATION_DIR/oracle/$SID/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addlnctl.sh start $SID
$INSTALLATION_DIR/oracle/$SID/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addbctl.sh start
} > $startlog | s_1
{
#apps:
source $INSTALLATION_DIR/oracle/$SID/apps/apps_st/appl/APPS$SID\_$HOST.env
$INSTALLATION_DIR/oracle/$SID/inst/apps/$SID\_$HOST/admin/scripts/adstrtal.sh apps/apps
} >> $startlog | s_2
}

stop() # Purpose - Shutdown EBS
{
{
#apps:
source $INSTALLATION_DIR/oracle/$SID/apps/apps_st/appl/APPS$SID\_$HOST.env
$INSTALLATION_DIR/oracle/$SID/inst/apps/$SID\_$HOST/admin/scripts/adstpall.sh apps/apps
} > $stoplog | s_3
{
#db:
source $INSTALLATION_DIR/oracle/$SID/db/tech_st/11.1.0/$SID\_$HOST.env
$INSTALLATION_DIR/oracle/$SID/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addlnctl.sh stop $SID
$INSTALLATION_DIR/oracle/$SID/db/tech_st/11.1.0/appsutil/scripts/$SID\_$HOST/addbctl.sh stop
} >> $stoplog | s_4
}

status() # Purpose - Check realtime status of Apps-DB Services
{
if test $startlogfile -gt $stoplogfile
then
	echo -e "[${Bold_Purple:-}UP${Reset:-}] Last check APPS-DB Status. " ; sleep 1s;echo ""; s_1 ; s_2 ; sleep 5s
else
	echo -e "[${Bold_Purple:-}DOWN${Reset:-}] Last check APPS-DB Status. " ; sleep 1s;echo ""; s_3 ; s_4 ; sleep 5s
fi
}
