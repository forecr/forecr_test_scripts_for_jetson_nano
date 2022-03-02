sudo echo 149 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio149/direction
watch -n 0.1 lsusb
sudo echo 149 > /sys/class/gpio/unexport

