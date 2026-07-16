#!/bin/bash

clear

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

while true; do
    clear
    echo -e "${CYAN}"
    echo "========================================"
    echo "            EVM PANEL INSTALLER         "
    echo "========================================"
    echo -e "${NC}"
    echo "1) Install EVM Panel"
    echo "2) LXC Installer"
    echo "3) Cloudflare Install"
    echo "4) Multinode Install"
    echo "0) Exit"
    echo
    read -p "Select an option: " OPTION

    case $OPTION in
        1)
            clear
            echo -e "${GREEN}Installing EVM Panel...${NC}"

            apt update -y
            apt upgrade -y

            apt install -y git unzip curl python3 python3-pip python3-venv npm

            if [ ! -d "EVM-PANEL" ]; then
                git clone https://github.com/SKYDO234/EVM-PANEL.git
            fi

            cd EVM-PANEL || exit

            mkdir -p panel
            unzip -o EVM.zip -d panel

            cd panel/EVM/hvm || exit

            npm install

            pip3 install -r requirements.txt
            python3 -m pip install --break-system-packages -r requirements.txt

            python3 hvm.py

            read -p "Press Enter to return to menu..."
            ;;
        2)
            clear
            echo -e "${GREEN}Starting LXC Installer...${NC}"
            bash <(curl -fsSL "https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/refs/heads/main/lxd%20installer.txt")
            read -p "Press Enter to return to menu..."
            ;;
        3)
            clear
            echo -e "${GREEN}Installing Cloudflare Tunnel...${NC}"
            bash <(curl -fsSL https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/main/cloudflare.sh)
            read -p "Press Enter to return to menu..."
            ;;
        4)
            clear
            echo -e "${GREEN}Installing Multinode...${NC}"
            sudo python3 node.py --install
            read -p "Press Enter to return to menu..."
            ;;
        0)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option!${NC}"
            sleep 2
            ;;
    esac
done
