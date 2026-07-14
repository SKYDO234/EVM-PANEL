##!/bin/bash

clear
echo "=================================="
echo "        EVM PANEL INSTALLER"
echo "         By SKYDO YT"
echo "=================================="

apt update -y && apt upgrade -y

echo "[+] Installing dependencies..."
apt install -y git unzip curl python3 python3-pip python3-venv npm

echo "[+] Cloning EVM PANEL..."
git clone https://github.com/SKYDO234/EVM-PANEL.git

cd EVM-PANEL || exit

echo "[+] Extracting panel..."
mkdir -p panel
unzip -o EVM.zip -d panel

cd panel/EVM/hvm || exit

echo "[+] Installing Node.js packages..."
npm install

echo "[+] Installing Python packages..."
pip3 install -r requirements.txt
python3 -m pip install --break-system-packages -r requirements.txt

echo
echo "=================================="
echo "Starting EVM PANEL..."
echo "Press CTRL+C to stop the panel."
echo "=================================="

python3 hvm.py

echo
echo "=================================="
echo "Installing LXD..."
echo "=================================="

bash <(curl -fsSL "https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/refs/heads/main/lxd%20installer.txt")
