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
# infos: https://forum-raspberrypi.de/forum/thread/42097-lautstaerke-per-befehl-aendern/

## check volume
    alsamixer

## check audio
    arecord -L

## test audio wav
    aplay ./offline-assistant/test.wav

## test audio mp3
    mpg123 ./offline-assistant/test.mp3

# read logfile continuously
    sudo tail -f /var/log/syslog

# MQTT
## subscriber
    mosquitto_sub -v -t 'test/topic'
## publisher
    mosquitto_pub -t 'test/topic' -m 'helloWorld'


# bluetooth
    sudo bluetoothctl
    pairable on
    scan on
    scan off
    agent on
    pair F8:5C:7D:0F:F7:81
    connect F8:5C:7D:0F:F7:81
    remove F8:5C:7D:0F:F7:81
    trust F8:5C:7D:0F:F7:81
    info F8:5C:7D:0F:F7:81


raus aus bluetooth:
    exit


# bluetooth audio problem:
https://peppe8o.com/tag/failed-to-set-privacy-rejected-0x0b/



# install
sudo usermod -G bluetooth -a pi
sudo apt-get install bluealsa pulseaudio





sudo apt install -y vlc

cvlc --aout=alsa --alsa-audio-device=bluealsa --verbose=-1 ./Musik/Max\ Giesinger\ -\ Irgendwann\ Ist\ Jetzt.mp3












# check
sudo systemctl status bluetooth




sudo systemctl status bluetooth
sudo systemctl restart bluetooth
sudo apt-get install pulseaudio-module-bluetooth
sudo killall pulseaudio
pulseaudio --start    
sudo systemctl restart bluetooth
pulseaudio --start
sudo apt install pulseaudio-module-bluetooth

