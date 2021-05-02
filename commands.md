# setup
    sudo raspi-config

# shutdown
    sudo shutdown -r 0
    sudo shutdown -r now

# alias shutdown
    sudo poweroff

# reboot
    sudo reboot

# show current time
    date

# change time
    sudo date -s "2021-04-28 08:23:00"

- network config
    sudo raspi-config

# Lautstärke
    amixer -c 0 sset Headphone,0 20%
    amixer -c 0 scontrols

# scan wlan
    sudo iwlist wlan0 scan

# systemd commands
## get a list of services
    systemd-analyze blame

## read service log
    journalctl -u <service-name>

## edit service file
sudo nano /etc/systemd/system/<service-name>

## service execute commands
    sudo systemctl enable <service-name>
    sudo systemctl stop <service-name>
    sudo systemctl start <service-name>
    sudo systemctl restart <service-name>

# start rhasspy from command line
    rhasspy --profile de

# audio commands
## check audio
    arecord -L

## test audio wav
    aplay ./offline-assistant/test.wav

## test audio mp3
    mpg123 ./offline-assistant/test.mp3

# read logfile continuously
    sudo tail -f /var/log/syslog