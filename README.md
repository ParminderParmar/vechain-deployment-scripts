# Vechain Deployment Scripts

This repo contains shell scripts to deploy/host VeChain thor node on a Ubuntu 16.04 machine. This script can be utilised on your development or production environments. 

This repository performs below opeartions:
  - Setting up environment variables and profile setup
  - Updating and upgrading the linux environment
  - Installing pre-requisites for the VeChain Thor deployment
  - Installing additional external dependencies
  - Create a service script for restart on reboot
  - Start VeChain thor node

### Usage
Clone this repository and make sure the script has 'execute' access on the machine.

```sh
# Check below for possible values of network
./deployment.sh [NETWORK]
```

#### Troubleshooting
'Permission Denied' while running the script
```sh
sudo chmod +x deployment.sh
```
