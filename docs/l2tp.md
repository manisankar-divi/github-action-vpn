# L2TP/IPsec VPN GitHub Action

This GitHub Action establishes an L2TP/IPsec VPN connection using StrongSwan in your workflows.

## Usage

To use this action in your workflow, include it in your workflow YAML file:

```yaml
name: VPN Connection

on:
  push:
    branches:
      - main

jobs:
  connect-vpn:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Establish VPN Connection
        uses: unknow-sk/github-action-vpn@v1
        with:
          VPN_SERVER: ${{ secrets.VPN_SERVER }}
          VPN_USER: ${{ secrets.VPN_USER }}
          VPN_PASSWORD: ${{ secrets.VPN_PASSWORD }}
          VPN_PSK: ${{ secrets.VPN_PSK }}
          # Add more input variables as needed
```

## Input Variables

- **VPN_PSK**: Your pre-shared key for the VPN connection (if required).
- **VPN_SERVER**: The address of your VPN server.
- **VPN_USER**: Your VPN username.
- **VPN_PASSWORD**: Your VPN password.

Make sure to store sensitive information like passwords and configurations securely using GitHub Secrets and reference
them in your workflow.