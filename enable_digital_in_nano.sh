#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 504 > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/gpio504/direction
sudo echo 505 > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/gpio505/direction

