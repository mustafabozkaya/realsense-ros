
#!/bin/sh
# Path: src/realsense_install.sh
#Realsense githup install
# isues 
# 1. intel realsense Sdk is not available 
# https://github.com/IntelRealSense/librealsense/releases
#https://github.com/IntelRealSense/realsense-ros/issues/821

#https://github.com/IntelRealSense/librealsense/blob/master/doc/installation.md

#https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages


sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

# Download/Clone librealsense github repository:

# Get librealsense sources in one of the following ways:

# Download the complete source tree with git

git clone https://github.com/IntelRealSense/librealsense.git

# Navigate to librealsense root directory to run the following scripts.
# Unplug any connected Intel RealSense camera.

# Install the core packages required to build librealsense binaries and the affected kernel modules:

sudo apt-get install git libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev

sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev at

## go to root directory of librealsense

cd librealsense
./scripts/setup_udev_rules.sh 

./scripts/patch-realsense-ubuntu-lts.sh

#Navigate to librealsense root directory and run 
mkdir build && cd build

cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=true

#Recompile and install librealsense binaries:

sudo make uninstall && make clean && make && sudo make install




