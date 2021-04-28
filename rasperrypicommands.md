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


