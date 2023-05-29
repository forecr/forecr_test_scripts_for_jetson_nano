#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

BOARD_REV_1_23=$1

sleep_time=0.3

OUT0_PIN_NUM=508
OUT0_PIN=gpio508
OUT1_PIN_NUM=509
OUT1_PIN=gpio509
OUT2_PIN_NUM=510
OUT2_PIN=gpio510

if $BOARD_REV_1_23; then
	OUT0_PIN_NUM=12
	OUT0_PIN=gpio12
	OUT1_PIN_NUM=15
	OUT1_PIN=gpio15
	OUT2_PIN_NUM=232
	OUT2_PIN=gpio232
fi

sudo echo $OUT0_PIN_NUM > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/$OUT0_PIN/direction
sudo echo $OUT1_PIN_NUM > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/$OUT1_PIN/direction
sudo echo $OUT2_PIN_NUM > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/$OUT2_PIN/direction

sleep $sleep_time

echo "DIGITAL_OUT0 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value

#Single Test
echo "step: 1/14"
echo "DIGITAL_OUT0 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sleep $sleep_time

echo "step: 2/14"
echo "DIGITAL_OUT0 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sleep $sleep_time

echo "step: 3/14"
echo "DIGITAL_OUT1 ON"
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 4/14"
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 5/14"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 6/14"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

#Double Test
echo "step: 7/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 8/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 9/14"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 10/14"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 11/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 12/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

#Triple Test
echo "step: 13/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 14/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value

echo "Completed"

sleep 1
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep 1

sudo echo $OUT0_PIN_NUM > /sys/class/gpio/unexport
sudo echo $OUT1_PIN_NUM > /sys/class/gpio/unexport
sudo echo $OUT2_PIN_NUM > /sys/class/gpio/unexport

