#!/bin/bash
 
clear

network=$1

echo "This script will setup a VeChain node."
echo "---"
echo "Performing a general system update (this might take a while)..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1
sudo apt-get -y dist-upgrade > /dev/null 2>&1
echo "---"
echo "Installing prerequisites..."
sudo apt-get -y install build-essential libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev git
echo "---"
echo "Installing go..."
cd ~
export GOPATH=$HOME/go
mkdir -p $GOPATH/src
wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz
chmod +x /usr/local/go/bin/go
rm go1.14.linux-amd64.tar.gz
echo "---"
echo "Installing dep..."
export PATH=$PATH:/usr/local/go/bin
cd /usr/local/bin/
wget https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64
ln -s dep-linux-amd64 dep
chmod +x /usr/local/bin/*
echo "---"
echo "Installing and configuring VeChain..."
git clone https://github.com/vechain/thor.git $GOPATH/src/VeChain/thor
cd $GOPATH/src/VeChain/thor
make dep
make all
echo "---"
