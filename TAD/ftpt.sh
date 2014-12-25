#!/bin/bash
HOST='www.sportinlinea.it'
USER='vvyazvbx'
PASSWD='FDtXqQD2'
DIR=TAD/$HOSTNAME
FNAME="*.txt"

ftp -n -v $HOST << EOT
user $USER $PASSWD
prompt
cd $DIR
mput newer $FNAME 
bye
EOT
