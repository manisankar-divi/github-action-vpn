#!/bin/bash

# Install FortiClient if not already installed (for Debian/Ubuntu)
sudo apt-get update -qq
sudo apt-get install -yqq forticlient

# Create a directory to store FortiClient configurations (if not already present)
mkdir -p ~/.forticlient

# Create a configuration file with the provided VPN configuration (if applicable)
echo "$VPN_CONFIG" > ~/.forticlient/my-vpn-config.conf

# Authenticate with FortiClient using username and password
forticlient --vpn --host "$VPN_SERVER" --username "$VPN_USER" --password "$VPN_PASSWORD" --vpnconfig ~/.forticlient/my-vpn-config.conf

# After the VPN connection is established, you can optionally retrieve network information
ifconfig
