#!/bin/bash

# update system
sudo apt update
sudo apt install -y \

# install git
sudo apt install -y git

# install python
sudo apt install -y python3-pip
sudo apt install -y python-dev
python3 -m pip install numpy

# install python-virtualenv
sudo apt install python-virtualenv
virtualenv --system-site-packages ~/env
source ~/env/bin/activate

# install respeaker driver
git clone https://github.com/HinTak/seeed-voicecard.git
cd seeed-voicecard
sudo ./install.sh
cd ..

# install respeaker led driver
git clone https://github.com/respeaker/4mics_hat.git
cd 4mics_hat
pip install spidev gpiozero
cd ..