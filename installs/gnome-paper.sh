#!/bin/bash

#add daily builds PPA
sudo add-apt-repository -y ppa:snwh/pulp
# update repository info
sudo apt-get update
# install icon theme
sudo apt-get -y install paper-icon-theme
# install cursor theme
sudo apt-get -y install paper-cursor-theme
# install gtk theme
sudo apt-get -y install paper-gtk-theme
