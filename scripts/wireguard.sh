#!/bin/bash

# Install WireGuard tools if not already installed
sudo apt-get update -qq
sudo apt-get install -yqq wireguard

# Create a directory to store WireGuard configurations (if not already present)
mkdir -p ~/.wireguard

# Create a configuration file with the provided VPN configuration (replace CONFIG_FILE_PATH with your configuration file)
echo "$VPN_CONFIG" > ~/.wireguard/my-vpn-config.conf

# Connect to the VPN server using the created configuration file
sudo wg-quick up ~/.wireguard/my-vpn-config.conf

# Display connection status or other relevant information
sudo wg show
