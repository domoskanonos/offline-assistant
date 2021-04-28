# Install some required packages first
sudo apt update
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Get the Docker signing key for packages
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

# Add the Docker official repos
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Install Docker
sudo apt update
sudo apt install -y --no-install-recommends \
    docker-ce \
    cgroupfs-mount

sudo systemctl enable docker
sudo systemctl start docker

sudo docker run --rm hello-world

# Docker Compoose
# Install required packages
sudo apt update
sudo apt install -y python3-pip libffi-dev

# Install Docker Compose from pip (using Python3)
# This might take a while
sudo pip3 install docker-compose

# add pi user to docker group
sudo usermod -aG docker pi

# install mp3 player
sudo apt-get install mpg123

# install node red
yes | bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service
