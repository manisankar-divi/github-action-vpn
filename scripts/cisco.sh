#!/bin/bash

# Install OpenConnect client if not already installed
sudo apt-get update -qq
sudo apt-get install -yqq openconnect

# Create a directory to store VPN configurations (if not already present)
mkdir -p ~/.cisco

# Create a configuration file with the provided VPN configuration
echo "$VPN_CONFIG" > ~/.cisco/my-vpn-config.xml

# Connect to the VPN server using OpenConnect
sudo openconnect -b $VPN_SERVER -u $VPN_USER --passwd-on-stdin < ~/.cisco/my-vpn-config.xml
