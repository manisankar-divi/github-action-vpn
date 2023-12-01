# Cisco AnyConnect VPN GitHub Action

This GitHub Action allows you to establish a VPN connection using Cisco AnyConnect through OpenConnect in your
workflows.

## Usage

To use this action in your workflow, you can include it in your workflow YAML file as follows:

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
          VPN_SERVER: ${{ secrets.VPN_SERVER }}
          VPN_USER: ${{ secrets.VPN_USER }}
          # Add more input variables as needed
```

## Input Variables

- **VPN_CONFIG**: Your VPN configuration data.
- **VPN_SERVER**: The address of your VPN server.
- **VPN_USER**: Your VPN username.

Make sure to store sensitive information like passwords and configurations securely using GitHub Secrets and reference
them in your workflow.