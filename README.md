# Install operation system
## download image from
    https://www.raspberrypi.org/software/operating-systems/
## install with balenaEtcher, format with Fat32
    https://www.balena.io/etcher/
## create empty ssh file named "ssh" in root folder of card/drive to activate ssh
## connect to network and start, you can now controll via ssh, init user is pi, init password is raspberry

# rasperry pi 4b install file

yes | bash <(curl -sL https://raw.githubusercontent.com/domoskanonos/offline-assistant/main/rasp4binstall.sh)


wenn connection lost soll prozess weiter laufen mit nohub geht das:
 nohup yes | bash <(curl -sL https://raw.githubusercontent.com/domoskanonos/offline-assistant/main/rasp4binstall.sh)



to install on a rasperry pi 4b use the script:
    rasp4binstall.sh



zim File for Wiki
#- DOWNLOAD=https://ftp.fau.de/kiwix/zim/wikipedia/wikipedia_de_top_maxi_2021-03.zim



# systemd commands
## get a list of services
    systemd-analyze blame

## read service log
    journalctl -u rhasspy.service

## edit service file
sudo nano /etc/systemd/system/rhasspy.service

## service execute commands
    sudo systemctl enable rhasspy.service
    sudo systemctl stop rhasspy.service
    sudo systemctl start rhasspy.service
    sudo systemctl restart rhasspy.service


# start rhasspy from command line
    rhasspy --profile de

# audio commands
## check audio
    arecord -L

## test audio
    aplay ./offline-assistant/test.wav