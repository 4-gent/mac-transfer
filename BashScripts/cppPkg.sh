#!/bin/bash
#File Name: cppPkg.sh
#This file is a c++ package installer to allow linScript.cpp to work

echo "c++ Package installer to let linScript.cpp work"

#update package list
echo Updating package list
apt-get update
echo Package List Updated

#upgrade current linux
echo Upgrading Linux
apt-get full-upgrade -y
echo Linux Upgraded

#install newest available gcc distro
echo Installing gcc compiler
apt install build-essential -y
apt-get install gcc -y
echo gcc installed
sleep 1
gcc --version

#Running linScript.cpp after gcc is installed
echo Launching linScript.cpp
sleep 1
g++ linScript.cpp -o linScript.o
chmod +x linScript.o
sudo ./linScript.o
