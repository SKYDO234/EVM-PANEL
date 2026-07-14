#!/bin/bash

clear
echo "===================================="
echo "       EVM PANEL INSTALLER"
echo "          By SKYDO YT"
echo "===================================="

# Update system
apt update -y && apt upgrade -y

# Install dependencies
apt install -y git unzip curl python3 python3-pip npm

# Clone repository
git clone https://github.com/SKYDO234/EVM-PANEL.git

# Extract panel
mkdir -p panel
unzip EVM.zip -d panel

# Enter directory
cd panel/EVM/hvm || exit

# Install Node.js packages
npm install

# Install Python packages
pip3 install -r requirements.txt
python3 -m pip install --break-system-packages -r requirements.txt

echo ""
echo "===================================="
echo "Starting EVM Panel..."
echo "Press CTRL+C after the panel starts."
echo "===================================="
echo ""

python3 hvm.py

echo ""
echo "===================================="
echo "Installing LXD..."
echo "===================================="

bash <(curl -fsSL "https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/refs/heads/main/lxd%20installer.txt")

echo ""
echo "Installation Completed!"
