#!/bin/bash

# Install necessary packages (for Debian/Ubuntu)
sudo apt-get update -qq
sudo apt-get install -yqq strongswan libcharon-extra-plugins

# Create a directory to store VPN configurations (if not already present)
mkdir -p ~/.l2tp

# Create a configuration file with the provided VPN configuration
cat << EOF > ~/.l2tp/my-vpn-config.conf
conn my-l2tp
  keyexchange=ikev1
  authby=secret
  ike=aes256-sha1-modp1024
  esp=aes256-sha1
  left=%defaultroute
  leftsourceip=%config
  right=$VPN_SERVER
  rightsubnet=0.0.0.0/0
  auto=start
  user=$VPN_USER
  password=$VPN_PASSWORD
EOF

# Provide the path to the pre-shared key file (if required)
if [ -n "$VPN_PSK" ]; then
    echo "$VPN_SERVER $VPN_USER : $VPN_PSK" | sudo tee -a /etc/ipsec.secrets >/dev/null
fi

# Start the L2TP/IPsec VPN connection
sudo ipsec restart
sudo ipsec up my-l2tp

# After the VPN connection is established, you can optionally retrieve network information
ifconfig
