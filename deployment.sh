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
wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz
chmod +x /usr/local/go/bin/go
rm go1.14.linux-amd64.tar.gz
echo "---"
