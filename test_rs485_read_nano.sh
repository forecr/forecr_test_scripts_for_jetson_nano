#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

board_rev_1_2=$1

sudo echo 64 > /sys/class/gpio/export
sudo echo 168 > /sys/class/gpio/export
sudo echo 216 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio64/direction
sudo echo out > /sys/class/gpio/gpio168/direction
sudo echo out > /sys/class/gpio/gpio216/direction

sudo echo 0 > /sys/class/gpio/gpio64/value
if $board_rev_1_2; then
	sudo echo 0 > /sys/class/gpio/gpio168/value 
else
	sudo echo 1 > /sys/class/gpio/gpio168/value 
fi
sudo echo 1 > /sys/class/gpio/gpio216/value

sudo gtkterm -p /dev/ttyTHS1 -s 115200 -w RS485

sudo echo 64 > /sys/class/gpio/unexport
sudo echo 168 > /sys/class/gpio/unexport
sudo echo 216 > /sys/class/gpio/unexport

