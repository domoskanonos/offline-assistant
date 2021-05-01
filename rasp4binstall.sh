#!/bin/bash

# update system
sudo apt update
sudo apt upgrade -y

# install git
sudo apt install -y git

# install python3 and python3 package manager pip and moduls
sudo apt install python3
sudo apt install python3-pip
sudo apt install python3-rpi.gpi
pip3 install paho-mqtt
pip3 install gpiozero
pip3 install pixel-ring

# install python 2 modules
sudo apt-get install python-pip
pip install numpy
pip install spidev
pip install gpiozero

# clone domoskanonos offline-assistant repo and copy root resources
if [ -d "~/offline-assistant" ]; then rm -Rf ~/offline-assistant; fi
git clone https://github.com/domoskanonos/offline-assistant.git
cd offline-assistant
sudo cp -r ./root/home /
sudo cp -r ./root/var /
sudo cp -r ./root/etc /
cd ..

# install respeaker driver
if [ -d "~/seeed-voicecard" ]; then rm -Rf ~/seeed-voicecard; fi
git clone https://github.com/HinTak/seeed-voicecard.git
cd seeed-voicecard
sudo ./install.sh
cd ..

# install respeaker led driver
if [ -d "~/4mics_hat" ]; then rm -Rf ~/4mics_hat; fi
git clone https://github.com/respeaker/4mics_hat.git
cd 4mics_hat
cd ..

# test sound
aplay ./offline-assistant/test.wav

# install mp3 player
sudo apt-get install mpg123
mpg123 ./offline-assistant/test.mp3

# install led service
systemctl enable --now led.service

# install nginx
sudo apt install -y nginx
sudo service nginx start

# install node red
yes | bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service

# install mosquitto
sudo apt install -y mosquitto mosquitto-clients
sudo systemctl enable mosquitto.service

# install rhasspy     
wget -O rhasspy_2.5.10_armhf.deb https://github.com/rhasspy/rhasspy/releases/download/v2.5.10/rhasspy_2.5.10_armhf.deb
sudo apt install -y ./rhasspy_2.5.10_armhf.deb
sudo systemctl enable rhasspy.service