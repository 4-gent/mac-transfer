@echo off

#package downloads
sudo apt-get update
sudo apt-get full-upgrade -y
sudo apt-get install gcc -y
sudo apt-get install g++ -y
sudo apt-get install make -y
sudo apt-get install python -y

#software downloads
sudo apt-get update && sudo apt-get full-upgrade -y
sudo apt-get install terminator -y
sudo apt-get install clamav clamav-daemon -y

echo Initialization Completed
