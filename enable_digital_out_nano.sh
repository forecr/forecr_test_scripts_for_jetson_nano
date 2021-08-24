#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 508 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio508/direction
sudo echo 509 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio509/direction
sudo echo 510 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio510/direction

echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio508/value
sudo echo 0 > /sys/class/gpio/gpio509/value
sudo echo 0 > /sys/class/gpio/gpio510/value

