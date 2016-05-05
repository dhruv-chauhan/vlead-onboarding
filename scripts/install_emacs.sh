#!/bin/bash
source config.sh
export $http_proxy
export $httsp_proxy

echo "######### UPDATING SYSTEM #########"
sudo apt-get -y update
if [ $? -eq 0 ]
then
    echo "########### UPDATING IS DONE ###########"
else
    echo "########### ERRO IN UPDATING SYSTEM ###########"
    exit
fi
sudo apt-get -y build-dep emacs24
if [ $? -eq 0 ]
then
    echo "######### Dependencies installed ###########"
else
    echo "ERROR IN INSTALLING EMACS DEPENDENCIES"
    echo "##### EXITING ######"
    exit 1
fi

sudo apt-get -y install checkinstall
if [ $? -eq 0 ]
then
    echo "######### Dependencies installed ###########"
else
    echo "ERROR IN INSTALLING EMACS CHECKINSTALL PACKAGE"
    echo "##### EXITING ######"
    exit 1
fi
mkdir -p ~/src
cd ~/src
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
if [ $? -eq 0 ]
then
    echo "######### emacs-24.5.tar.gz is downloaded ###########"
else
    echo "Error in downlaoding emacs-24.5.tar.gz file"
    echo "##### EXITING ######"
    exit 1
fi
tar xf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
sudo checkinstall

