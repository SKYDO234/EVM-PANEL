#!/bin/bash

clear
echo "=========================================="
echo "      Cloudflare Tunnel Installer"
echo "=========================================="
echo
echo "1) VPS"
echo "2) CodeSandbox"
echo
read -p "Choose an option [1-2]: " CHOICE

case $CHOICE in
1)
    echo
    echo "[+] Updating system..."
    apt update -y
    apt upgrade -y

    echo
    echo "[+] Installing dependencies..."
    apt install -y curl gnupg lsb-release

    echo
    echo "[+] Adding Cloudflare repository..."
    mkdir -p --mode=0755 /usr/share/keyrings

    curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | \
    gpg --dearmor -o /usr/share/keyrings/cloudflare-main.gpg

    echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main" | \
    tee /etc/apt/sources.list.d/cloudflared.list >/dev/null

    apt update
    apt install -y cloudflared

    if ! command -v cloudflared >/dev/null 2>&1; then
        echo
        echo "❌ Cloudflared installation failed."
        exit 1
    fi

    echo
    read -p "Paste your Cloudflare Tunnel Token: " TOKEN

    cloudflared service install "$TOKEN"
    systemctl enable cloudflared
    systemctl restart cloudflared

    echo
    echo "=========================================="
    echo "✅ Tunnel Connected Successfully!"
    echo "=========================================="
    ;;

2)
    clear
    echo "=========================================="
    echo "      CodeSandbox Instructions"
    echo "=========================================="
    echo
    echo "Cloudflared does not need to be installed."
    echo
    echo "1. Open Cloudflare Zero Trust."
    echo "2. Go to Networks > Tunnels."
    echo "3. Click Create Tunnel."
    echo "4. Select your device's operating system."
    echo "5. Choose Docker."
    echo "6. Copy the Docker command shown."
    echo "7. Paste that command into your CodeSandbox terminal."
    echo "8. Done! Your tunnel will connect automatically."
    echo
    ;;

*)
    echo "Invalid option."
    exit 1
    ;;
esac
