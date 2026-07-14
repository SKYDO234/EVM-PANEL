#!/bin/bash

clear

echo "======================================"
echo "        EVM PANEL INSTALLER"
echo "           By SKYDO YT"
echo "======================================"
echo ""
echo "1) Install EVM Panel"
echo "2) LXC/LXD Installer"
echo ""
read -p "Select an option [1-2]: " option

case $option in
1)
    echo "Installing EVM Panel..."

    apt update -y && apt upgrade -y
    apt install -y git unzip curl python3 python3-pip npm

    git clone https://github.com/SKYDO234/EVM-PANEL.git

    cd EVM-PANEL || exit

    mkdir -p panel
    unzip -o EVM.zip -d panel

    cd panel/EVM/hvm || exit

    npm install

    pip3 install -r requirements.txt
    python3 -m pip install --break-system-packages -r requirements.txt

    python3 hvm.py
    ;;
2)
    echo "Launching LXC/LXD Installer..."

    bash <(curl -fsSL "https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/refs/heads/main/lxd%20installer.txt")
    ;;
*)
    echo "Invalid option!"
    exit 1
    ;;
esac
