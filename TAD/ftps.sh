#! /bin/bash

HOST='ftp.sportinlinea.it'
USER='vvyazvbx'
PASSWD='FDtXqQD2'
DIRE=TAD/$HOSTNAME

echo "sudo wput -N -nv AST ftp://$USER:$PASSWD@$HOST/$DIRE/"

echo "chiamo comando"
time sudo wput -N -nv * ftp://$USER:$PASSWD@$HOST/$DIRE/   # -o  ftpLog.txt  
