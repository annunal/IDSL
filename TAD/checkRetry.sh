cd /home/pi/programs/TAD
echo "$(date) retrying to transmit" >> execLog.txt
sudo nice ./tad retry 

