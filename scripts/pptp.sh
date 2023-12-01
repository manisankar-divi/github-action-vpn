#!/bin/bash

# Install PPTP client if not already installed (for Debian/Ubuntu)
sudo apt-get update -qq
sudo apt-get install -yqq pptp-linux

# Create a directory to store VPN configurations (if not already present)
mkdir -p ~/.pptp

# Create a configuration file with the provided VPN configuration
cat << EOF > ~/.pptp/my-vpn-config.conf
pty "pptp $VPN_SERVER --nolaunchpppd"
name $VPN_USER
password $VPN_PASSWORD
remotename PPTP
require-mppe-128
file /etc/ppp/options.pptp
ipparam PPTP
EOF

# Connect to the VPN server using the created configuration file
sudo pon my-vpn-config

# After the VPN connection is established, you can optionally retrieve network information
ifconfig
