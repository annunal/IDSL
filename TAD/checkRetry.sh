cd /home/pi/programs/TAD
echo "$(date) retrying to transmit" >> retryLog.txt
sudo nice ./tad retry 

