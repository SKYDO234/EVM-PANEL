#!/bin/bash

echo "=================================="
echo " Cloudflare Tunnel Installer"
echo "=================================="

# Update system
apt update -y && apt upgrade -y

# Install dependencies
apt install -y curl wget sudo

# Install Cloudflare Tunnel
curl -fsSL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
dpkg -i cloudflared.deb || apt --fix-broken install -y
rm -f cloudflared.deb

echo ""
echo "Cloudflare Tunnel installed successfully."
echo ""

# Ask for tunnel token
read -p "Enter your Cloudflare Tunnel Token: " TOKEN

# Connect the tunnel
cloudflared service install "$TOKEN"

# Start and enable service
systemctl enable cloudflared
systemctl restart cloudflared

echo ""
echo "=================================="
echo "Tunnel Connected Successfully!"
echo "=================================="

systemctl status cloudflared --no-pager
