#!/bin/sh
 ############################################################
 # File:         Ftpenv.sh
 # Description:  Setup Environment Variables for FTP task by itquery
 ############################################################

REMOTE_FTP_SERVER=ftp.sportinlinea.it   			# Server where to put the Incremental Load files
 REMOTE_FTP_USER=vvyazvbx                			# User to login at REMOTE_FTP_USER
 REMOTE_FTP_PASSWORD=FDtXqQD2 						#Passwd for FTP usr at REMOTE_FTP_USR
 REMOTE_FTP_DIR=/TAD/$HOSTNAME   					# Directory where to put the files
 SOURCE_DIR=/home/pi/programs/TAD                   # Directory from where file is FTP’d

TIMESTAMP=`date +%d%m%Y`
 LOGFILE=/opt/FTP_$TIMESTAMP.log     # Log file

log() { echo “`date +%H:%M` – $1″ >> $LOGFILE; }


