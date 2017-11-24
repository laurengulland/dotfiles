#!/bin/bash -exv

#based on Install script at https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu16.04_server/blob/master/step1.bash
#based on ROS Instructions at http://wiki.ros.org/kinetic/Installation/Ubuntu

#Setting variables
UBUNTU_VER=$(lsb_release -sc)
ROS_VER=kinetic
[ "$UBUNTU_VER" = "trusty" ] && ROS_VER=indigo

#Step 1.1: configure ubuntu to allow "restricted" "universe" and "multiverse" repositories: https://help.ubuntu.com/community/Repositories/Ubuntu

#Step 1.2: Set up sources.list
echo "deb http://packages.ros.org/ros/ubuntu $UBUNTU_VER main" > /tmp/$$-deb
sudo mv /tmp/$$-deb /etc/apt/sources.list.d/ros-latest.list

#???
# set +vx
# while ! sudo apt-get install -y curl ; do
# 	echo '***WAITING TO GET A LOCK FOR APT...***'
# 	sleep 1
# done
# set -vx

#Step 1.3: Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

#Step 1.4: Installation
sudo apt-get update || echo ""
sudo apt-get install -y ros-${ROS_VER}-desktop-full

#???
ls /etc/ros/rosdep/sources.list.d/20-default.list && sudo rm /etc/ros/rosdep/sources.list.d/20-default.list

#Step 1.5
sudo rosdep init
rosdep update

#Step 1.6
grep -F "source /opt/ros/$ROS_VER/setup.bash" ~/.bashrc ||
echo "source /opt/ros/$ROS_VER/setup.bash" >> ~/.bashrc

#grep -F "ROS_MASTER_URI" ~/.bashrc ||
#echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc

#grep -F "ROS_HOSTNAME" ~/.bashrc ||
#echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc

#Step 1.7
sudo apt-get install -y python-rosinstall
sudo apt-get install -y python-rosinstall-generator
sudo apt-get install -y python-wstool
sudo apt-get install -y build-essential

#??? was already commented out in that person's script
#[ "$ROS_VER" = "kinetic" ] && sudo apt-get install -y ros-${ROS_VER}-roslaunch


### instruction for user ###
set +xv

echo '***INSTRUCTION*****************'
echo '* do the following command    *'
echo '* $ source ~/.bashrc          *'
echo '* after that, try             *'
echo '* $ LANG=C roscore            *'
echo '*******************************'
