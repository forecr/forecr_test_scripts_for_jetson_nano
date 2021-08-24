#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 0 > /sys/class/gpio/gpio64/value
sudo echo 1 > /sys/class/gpio/gpio168/value
sudo echo 1 > /sys/class/gpio/gpio216/value
#sudo gtkterm -p /dev/ttyTHS1 -s 115200 -w RS485
