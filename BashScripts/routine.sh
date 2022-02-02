@echo off

#routine maintanence script
sudo apt-get update -y
sudo apt-get full-upgrade -y
sudo apt autoremove -y

