#!/bin/bash

# update system
sudo apt update
sudo apt install -y \

# install git
sudo apt install -y git

# clone domoskanonos offline-server repo and copy root resources
_OFFLINE_SERVER_DIR="~/offline-assistant/"
if [ -d "$_OFFLINE_SERVER_DIR" ]; then
  echo "Installing offline-server in ${_OFFLINE_SERVER
_DIR}..."
  git clone https://github.com/domoskanonos/offline-assistant.git
fi
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
git clone https://github.com/HinTak/seeed-voicecard.git
cd seeed-voicecard
sudo ./install.sh
cd ..

# install respeaker led driver
_4MIC_DIR="~/4mics_hat/"
if [ -d "$_4MIC_DIR" ]; then
  echo "Installing 4MIC LED files in ${_4MIC_DIR}..."
  git clone https://github.com/respeaker/4mics_hat.git
fi
cd 4mics_hat
source ~/env/bin/activate
pip install numpy spidev gpiozero
cd ..

# install mp3 player
sudo apt-get install mpg123


# install nginx
sudo apt install -y nginx
sudo service nginx start
