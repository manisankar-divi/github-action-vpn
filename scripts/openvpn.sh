#!/bin/bash

# Install OpenVPN client if not already installed (for Debian/Ubuntu)
sudo apt-get update -qq
sudo apt-get install -yqq openvpn

# Create a directory to store VPN configurations (if not already present)
mkdir -p ~/.openvpn

# Create a configuration file with the provided VPN configuration (replace CONFIG_FILE_PATH with your configuration file)
echo "$VPN_CONFIG" > ~/.openvpn/my-vpn-config.ovpn

# Create a credentials file with the provided username and password
echo "$VPN_USER" > ~/.openvpn/my-vpn-credentials
echo "$VPN_PASSWORD" >> ~/.openvpn/my-vpn-credentials
sudo chmod 600 ~/.openvpn/my-vpn-credentials

# Connect to the VPN server using the created configuration file and credentials
sudo openvpn --config ~/.openvpn/my-vpn-config.ovpn --auth-user-pass ~/.openvpn/my-vpn-credentials

# After the VPN connection is established, you can optionally retrieve network information
ifconfig
