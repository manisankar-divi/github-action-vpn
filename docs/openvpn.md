# OpenVPN VPN GitHub Action

This GitHub Action establishes an OpenVPN connection using `openvpn` in your workflows.

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
          VPN_CONFIG: ${{ secrets.VPN_CONFIG }}
          VPN_USER: ${{ secrets.VPN_USER }}
          VPN_PASSWORD: ${{ secrets.VPN_PASSWORD }}
          # Add more input variables as needed
```

## Input Variables

- **VPN_CONFIG**: Content of the VPN configuration file.
- **VPN_USER**: Your VPN username.
- **VPN_PASSWORD**: Your VPN password.

Make sure to store sensitive information like passwords and configurations securely using GitHub Secrets and reference
them in your workflow.