#!/bin/bash

clear

echo "====================================="
echo "         EVM PANEL INSTALLER"
echo "====================================="
echo "1) Install EVM Panel"
echo "2) LXC Installer"
echo "3) Cloudflare Install"
echo "4) Multinode Installer"
echo "0) Exit"
echo "====================================="
read -p "Select an option: " option

case $option in

1)
    git clone https://github.com/SKYDO234/EVM-PANEL.git
    cd EVM-PANEL || exit

    mkdir -p panel
    unzip EVM.zip -d panel

    cd panel || exit
    cd EVM || exit
    cd hvm || exit

    apt update && apt upgrade -y

    apt install -y python3
    apt install -y python3-pip
    apt install -y pip

    # Install Node.js & npm
    apt install -y npm

    npm install

    pip3 install -r requirements.txt
    python3 -m pip install --break-system-packages -r requirements.txt

    python3 hvm.py
    ;;

2)
    bash <(curl -fsSL "https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/refs/heads/main/lxd%20installer.txt")
    ;;

3)
    bash <(curl -fsSL https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/main/cloudflare.sh)
    ;;

4)
    cd EVM-PANEL || exit
    cd panel || exit
    cd EVM || exit

    python3 node.py --install
    ;;

0)
    echo "Exiting..."
    exit 0
    ;;

*)
    echo "Invalid option!"
    ;;
esac
