IDSL
====

IDSL Programs

The programs below are the ones used to run the IDSL (Inexpensive Device for Sea Level measurement system)

(c) JRC European Commission 2014

Quick instructions git

to send changed files
git commit -m "comment for this upload"
git push idsl master
<provide user/pwd when requested>

to sync files
git pull idsl master

at the beginning, to define the remote file repository
git remote add idsl https://github.com/annunal/IDSL.git

to sync at the beginning
git pull -a ? xx specificare...

Attention:
with the config file present here the name is taken from the hostname that must be set to the deviceID


Launch programme:
  sudo ./tad

to retransmit today data:
  sudo ./tad retry

to retransmit a specific file, related to dd/mm/yyyy 
  sudo ./tad retry retry_yyyy-mm-dd.txt

