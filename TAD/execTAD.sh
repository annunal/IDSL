cd /home/pi/programs/TAD
NOW=$(date +"%Y-%m-%d")
FILE="execLog_$NOW.txt"
echo $date >> $FILE
sudo nice ./tad  >> $FILE 
