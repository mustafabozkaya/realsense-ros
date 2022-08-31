

#!/bin/sh
# Path: src/realsense_install.sh
#Realsense githup install
# isues 
# 1. intel realsense Sdk is not available 
# https://github.com/IntelRealSense/librealsense/releases
#https://github.com/IntelRealSense/realsense-ros/issues/821

#https://github.com/IntelRealSense/realsense-ros
mkdir -p ~/realsense_catkin_ws/src



cd ~/realsense_catkin_ws/src

catkin_init_workspace


git clone https://github.com/IntelRealSense/realsense-ros.git
git clone https://github.com/pal-robotics/realsense_gazebo_plugin.git
cd realsense-ros/
git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`
cd ..

cd ..

rosdep update

sudo apt-get install ros-$ROS_DISTRO-ddynamic-reconfigure

rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y

catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install

echo "source ~/realsense_catkin_ws/devel/setup.bash" >> ~/.bashrc

source ~/.bashrc

rospack profile

#for gazebo launch file
roslaunch realsense2_description view_d435_model_rviz_gazebo.launch

#for real realsense launch file
roslaunch realsense2_camera rs_camera.launch
