#!/bin/bash
 
clear

network=$1

#################################################################
# VeChain Deployment script #
#################################################################
echo "This script will setup a VeChain node."
echo "---"
#################################################################
# Updating and upgrading linux environment   #
#################################################################
echo "Performing a general system update (this might take a while)..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1
sudo apt-get -y dist-upgrade > /dev/null 2>&1
echo "---"
#################################################################
# Installing pre-requisites for VeChain deployment   #
#################################################################
echo "Installing prerequisites..."
sudo apt-get -y install build-essential libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev git > /dev/null 2>&1
echo "---"
#################################################################
# Downloading and installing Go dependency #
#################################################################
echo "Installing go..."
cd ~
export GOPATH=$HOME/go
mkdir -p $GOPATH/src
wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz > /dev/null 2>&1
tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz > /dev/null 2>&1
chmod +x /usr/local/go/bin/go > /dev/null 2>&1
rm go1.14.linux-amd64.tar.gz > /dev/null 2>&1
echo "---"
#################################################################
# Downloading and installing Dep dependency   #
#################################################################
echo "Installing dep..."
export PATH=$PATH:/usr/local/go/bin
cd /usr/local/bin/
wget https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64 > /dev/null 2>&1
ln -s dep-linux-amd64 dep > /dev/null 2>&1
chmod +x /usr/local/bin/* > /dev/null 2>&1
echo "---"
#################################################################
# Cloning VeChain git repositor and build the complete suite  #
#################################################################
echo "Installing and configuring VeChain..."
git clone https://github.com/vechain/thor.git $GOPATH/src/VeChain/thor > /dev/null 2>&1
cd $GOPATH/src/VeChain/thor
make dep > /dev/null 2>&1
make all > /dev/null 2>&1
echo "---"
