# Install operation system
## download image from
    https://www.raspberrypi.org/software/operating-systems/
## install with balenaEtcher, format with Fat32
    https://www.balena.io/etcher/
## create empty ssh file named "ssh" in root folder of card/drive to activate ssh
## copy wpa_suppicant in root folder of card/drive to activate wlan, don`t forget to enter correct wlan pasword in file.

# run rasperry pi 4b install file
    yes | bash <(curl -sL https://raw.githubusercontent.com/domoskanonos/offline-assistant/main/rasp4binstall.sh)

# same as command below, difference is, when network connection lost, installation will be continued
    nohup yes | bash <(curl -sL https://raw.githubusercontent.com/domoskanonos/offline-assistant/main/rasp4binstall.sh)