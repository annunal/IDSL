#!/bin/bash
################################################################
# File:         Ftpscript.sh
# Description:  Trasfer file if they are changed and are more than 0 byte onto remote area # using FTP protocol task by itquery
################################################################
# Functions
log() { echo “`date +%H:%M` – $1″ >> $LOGFILE; }
#################################################################

REMOTE_FTP_SERVER=ftp.sportinlinea.it   			# Server where to put the Incremental Load files
REMOTE_FTP_USER=vvyazvbx                			# User to login at REMOTE_FTP_USER
REMOTE_FTP_PASSWORD=FDtXqQD2 						#Passwd for FTP usr at REMOTE_FTP_USR
if [ "$2" == "" ]
then
	REMOTE_FTP_DIR="TAD/$HOSTNAME"   					# Directory where to put the files
else	
	REMOTE_FTP_DIR=$2
fi
if [ "$1" == "" ]
then
	SOURCE_DIR=/home/pi/programs/TAD                   # Directory from where file is FTP’d
else
	SOURCE_DIR=$1
fi
if [ "$3" == "" ]
then
	DELTA_DAYS=-0.05  # within 1 h
else
	DELTA_DAYS=$3
fi
TIMESTAMP=`date +%d%m%Y`
LOGFILE=/opt/FTP_$TIMESTAMP.log     # Log file

echo "Start script to transfer files to $REMOTE_FTP_SERVER and DIR=$REMOTE_FTP_DIR"
echo "DELTA_DAYS=$DELTA_DAYS"
log "$0 – Start of Execution"
# Get ready for FTP, from the source directory
cd $SOURCE_DIR
#————————————————-
# Transfer only new/files greater than 0 byte files via FTP.
echo user $REMOTE_FTP_USER $REMOTE_FTP_PASSWORD > /tmp/ftptmp.txt
echo cd $REMOTE_FTP_DIR >> /tmp/ftptmp.txt
 for FILE in `ls -1  $SOURCE_DIR`
 do
 FoundFile=`find  $FILE -mtime $DELTA_DAYS |wc -l`
 #log "$FILE - $FoundFile"
 
 if [ "$FoundFile" -gt "0" ]
 then
  echo put $FILE >> /tmp/ftptmp.txt
  log $FILE
 fi
 done 
 echo quit >> /tmp/ftptmp.txt
  
ftp -n -v $REMOTE_FTP_SERVER   < /tmp/ftptmp.txt

rm /tmp/ftptmp.txt
#———————————————————–
#Archiving the FTP’d file to a new location $SOURCE_DIR/Done
 #mv $SOURCE_DIR/LOG_$TIMESTAMP.DAT.gz $SOURCE_DIR/Done
 log "$0 – End of Execution"
exit 0

