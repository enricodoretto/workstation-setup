#!/bin/bash

echo Begin autoconfiguration

sudo apt update && sudo apt upgrade -y

echo Installing Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf ./google-chrome-stable_current_amd64.deb
echo Google Chrome installed!

echo Installing Terminator
sudo apt install terminator -y
echo Terminator installed!

echo Installing ZSH
sudo apt install zsh -y
echo Installed ZSH!
# TODO install oh-my-zsh and setup default terminator shell

echo Installing Java 17
sudo apt install openjdk-17-jdk -y 
echo Java 17 installed!

echo Installing Java 8
sudo apt install openjdk-8-jdk -y
echo Java 8 installed!

echo Installing Python 3.10
sudo apt install python3.10 -y
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
echo Python 3.10 installed!

echo Installing Python 2.7
sudo apt install python2 -y
echo Python 2.7 installed!

echo Installing docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y 
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl disable docker.service
sudo systemctl disable containerd.service
echo Docker installed!

echo Installing VSCode
sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code -y
echo VSCode installed!

echo Installing IntelliJ IDEA Ultimate
sudo snap install intellij-idea-ultimate --classic 
echo IntelliJ IDEA Ultimate installed!

echo Installing PyCharm Community
sudo snap install pycharm-community --classic
echo PyCharm Community installed!

echo Installing Maven
sudo apt install maven -y
echo Maven installed!

echo Installing Virtualbox
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/ 
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/ 
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt update -y
sudo apt install linux-headers-$(uname -r) dkms -y
sudo apt install virtualbox-7.0 -y
cd ~/
VER=$(curl -s https://download.virtualbox.org/virtualbox/LATEST.TXT)
wget https://download.virtualbox.org/virtualbox/$VER/Oracle_VM_VirtualBox_Extension_Pack-$VER.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-*.vbox-extpack
echo Virtualbox installed!

echo Installing Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -  
echo "deb https://download.sublimetext.com/ apt/stable/" |  sudo tee /etc/apt/sources.list.d/sublime-text.list  
sudo apt update -y
sudo apt install sublime-text -y

echo Installing Postman
sudo snap install postman
echo Postma installed!

echo Installing misc shell tools
sudo apt install locate net-tools 
echo Installed misc shell tools

# TODO
# node
# generate git key