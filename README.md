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

# run
docker-compose --env-file ./env.conf up --remove-orphans 

# run detached
docker-compose --env-file ./env.conf up -d --remove-orphans 

# stop
docker-compose down --remove-orphans


## nextcloud config
    user=root
    host=offline-server-mariadb

port 3306

db nextcloud

Node Red Volumen Rights to set !! Important
    
    /sudo chown -R 1000:1000 home/pi/_store/node-red/data


Netzwerkprobleme Docker:
https://www.youtube.com/watch?v=TeKKExBWiog




zim File for Wiki
#- DOWNLOAD=https://ftp.fau.de/kiwix/zim/wikipedia/wikipedia_de_top_maxi_2021-03.zim


/usr/lib/rhasspy/share/rhassp
