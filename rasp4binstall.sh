#!/bin/bash

# update system
sudo apt update
sudo apt install -y \

# install git
sudo apt install -y git

# clone domoskanonos offline-server repo and copy root resources
if [ -d "~/offline-assistant" ]; then rm -Rf ~/offline-assistant; fi
git clone https://github.com/domoskanonos/offline-assistant.git
cd offline-assistant
sudo cp -r ./root/home /
sudo cp -r ./root/var /
cd ..

# install python
sudo apt install -y python3-pip
sudo apt install -y python-dev

# install python-virtualenv
sudo apt install python-virtualenv
virtualenv --system-site-packages ~/env

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
source ~/env/bin/activate
pip install numpy spidev gpiozero
cd ..

# install mp3 player
sudo apt-get install mpg123


# install nginx
sudo apt install -y nginx
sudo service nginx start

# install node red
yes | bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service

# install mosquitto
sudo apt install -y mosquitto

# install rhasspy     
curl -LJO https://github.com/rhasspy/rhasspy/releases/download/v2.5.10/rhasspy_2.5.10_armhf.deb > rhasspy_2.5.10_armhf.deb
sudo apt install -y ./rhasspy_2.5.10_armhf.deb

# install grafana
wget https://github.com/fg2it/grafana-on-raspberry/releases/download/v5.1.4/grafana_5.1.4_armhf.deb
sudo dpkg -i ./grafana_5.1.4_armhf.deb
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server
