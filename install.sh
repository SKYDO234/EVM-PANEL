#!/bin/bash

clear

while true; do
    clear
    echo "===================================="
    echo "         EVM PANEL INSTALLER"
    echo "===================================="
    echo "1) EVM PANEL INSTALL"
    echo "2) LXC INSTALLER"
    echo "3) CLOUDFLARE INSTALL"
    echo "4) MULTINODE INSTALL"
    echo "0) EXIT"
    echo "===================================="
    read -p "Select an option: " choice

    case $choice in
        1)
            clear

            git clone https://github.com/SKYDO234/EVM-PANEL.git

            cd EVM-PANEL || exit

            mkdir -p panel
            unzip EVM.zip -d panel

            cd panel
            cd EVM
            cd hvm

            apt update -y && apt upgrade -y

            apt install -y python3
            apt install -y python3-pip
            apt install -y pip

            # Install Node.js & npm
            apt install -y nodejs npm

            npm install

            pip3 install -r requirements.txt
            python3 -m pip install --break-system-packages -r requirements.txt

            python3 hvm.py

            echo
            read -p "Press Enter to return to the menu..."
            cd ../../../../
            ;;

        2)
            clear

            bash <(curl -fsSL "https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/refs/heads/main/lxd%20installer.txt")

            echo
            read -p "Press Enter to return to the menu..."
            ;;

        3)
            clear

            bash <(curl -fsSL https://raw.githubusercontent.com/SKYDO234/EVM-PANEL/main/cloudflare.sh)

            echo
            read -p "Press Enter to return to the menu..."
            ;;

        4)
            clear

            cd EVM-PANEL || {
                echo "EVM-PANEL folder not found!"
                read -p "Press Enter to return..."
                continue
            }

            cd panel
            cd EVM
            cd hvm

            python3 node.py --install

            echo
            read -p "Press Enter to return to the menu..."
            cd ../../../../
            ;;

        0)
            exit 0
            ;;

        *)
            echo "Invalid option!"
            sleep 2
            ;;
    esac
done
*)
    echo "Invalid option!"
    ;;
esac
