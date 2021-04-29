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
_4MIC_DIR="/etc/httpd/"
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

# install node red
yes | bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service

# install docker
sudo apt install -y apt-transport-https
sudo apt install -y ca-certificates
sudo apt install -y curl
sudo apt install -y gnupg2
sudo apt install -y software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

sudo apt install -y --no-install-recommends
sudo apt install -y docker-ce
sudo apt install -y cgroupfs-mount

sudo systemctl enable docker
sudo systemctl start docker

sudo docker run --rm hello-world

# install docker compoose
sudo apt install -y python3-pip libffi-dev
sudo pip3 install docker-compose
sudo usermod -aG docker pi


# relogin to get new permissions for pi user and continue installation
echo "relogin pi user to activate new docker permissions group."
exec su -l pi

# install domoskanonos offline-assistant repo and run docker-compose up
git clone https://github.com/domoskanonos/offline-assistant.git
cd offline-assistant
sudo chmod 0744 ./run.sh
sudo chmod 0744 ./stop.sh
sudo ./run.sh
sudo ./stop.sh
cd ..

# network dhcp optimiziation
cd offline-assistant
cp dhcpcd.service /lib/systemd/system/dhcpcd.service
sudo chmod 0644 /lib/systemd/system/dhcpcd.service
cd ..
