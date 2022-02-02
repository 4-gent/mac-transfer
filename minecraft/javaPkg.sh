#Update everything
sudo apt update
sudo apt-get full-upgrade -y

#Get java dev kit
sudo apt install default-jdk -y
java --version

#Screen install to keep on while not running
sudo apt install screen -y

#Make files for minecraft
mkdir minecraft
cd minecraft

#Run java -jar minecraft_server.jar --nogui
#Go into eula.txt and change from false to true
#Run java -jar minecraft_server.jar --nogui
