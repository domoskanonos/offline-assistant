#!/bin/bash

# update system
sudo apt update
sudo apt install -y \

# install git
sudo apt install -y git

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
git clone https://github.com/respeaker/4mics_hat.git
cd 4mics_hat
source ~/env/bin/activate
pip install numpy spidev gpiozero
cd ..

# install mp3 player
sudo apt-get install mpg123

# install node red
yes | bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service