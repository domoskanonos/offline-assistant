sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y python-dev
python3 -m pip install numpy
git clone https://github.com/respeaker/4mics_hat.git
cd 4mics_hat
sudo apt install python-virtualenv
virtualenv --system-site-packages ~/env
source ~/env/bin/activate
pip install spidev gpiozero