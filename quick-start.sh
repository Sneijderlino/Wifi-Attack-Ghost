#!/bin/bash

# ==================== QUICK START SCRIPT ====================
# Script: Quick start helper untuk WiFi-Attack Ghost
# Platform: Linux, macOS, Termux
# Author: Sneijderlino

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

show_menu() {
    clear
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║     WiFi-Attack Ghost v5.0 - Quick Start Wizard                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    echo -e "\n${YELLOW}Platform Selection:${NC}"
    echo "  1) Ubuntu / Debian"
    echo "  2) Fedora / RHEL"
    echo "  3) Arch Linux"
    echo "  4) Termux (Android)"
    echo "  5) Manual Setup"
    echo "  0) Exit"
    echo ""
    echo -ne "${BLUE}Choose option [0-5]: ${NC}"
}

install_debian() {
    echo -e "\n${GREEN}[*] Installing for Debian/Ubuntu...${NC}"
    sudo apt update
    sudo apt install -y aircrack-ng mdk4 wireless-tools ethtool git
    echo -e "${GREEN}[✓] Installation complete!${NC}"
}

install_fedora() {
    echo -e "\n${GREEN}[*] Installing for Fedora/RHEL...${NC}"
    sudo dnf install -y aircrack-ng mdk4 wireless-tools ethtool git
    echo -e "${GREEN}[✓] Installation complete!${NC}"
}

install_arch() {
    echo -e "\n${GREEN}[*] Installing for Arch Linux...${NC}"
    sudo pacman -S aircrack-ng mdk4 wireless_tools ethtool git
    echo -e "${GREEN}[✓] Installation complete!${NC}"
}

setup_interface() {
    echo -e "\n${YELLOW}[!] Setting up wireless interface...${NC}"
    echo "Available interfaces:"
    iwconfig 2>/dev/null || echo "No wireless interfaces found"
    
    echo -ne "\nEnter adapter name (e.g. wlan0): "
    read -r adapter
    
    echo -e "${BLUE}[*] Starting monitor mode...${NC}"
    sudo airmon-ng start "$adapter"
    
    echo -e "\nEdit Wifi-Attack.sh and update IFACE variable:"
    echo -e "${YELLOW}nano Wifi-Attack.sh${NC}"
}

run_script() {
    echo -e "\n${GREEN}[✓] Setup complete!${NC}"
    echo -e "\nTo start WiFi-Attack Ghost, run:"
    echo -e "${YELLOW}sudo bash Wifi-Attack.sh${NC}"
    
    read -p "Run now? (y/n): " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo bash Wifi-Attack.sh
    fi
}

main() {
    while true; do
        show_menu
        read -r choice
        
        case $choice in
            1) install_debian; setup_interface; run_script; break ;;
            2) install_fedora; setup_interface; run_script; break ;;
            3) install_arch; setup_interface; run_script; break ;;
            4) bash setup-termux.sh; break ;;
            5) echo -e "${YELLOW}[!] Please follow INSTALL.md for manual setup${NC}"; break ;;
            0) echo -e "${BLUE}Goodbye!${NC}"; exit 0 ;;
            *) echo -e "${RED}[!] Invalid option${NC}" ;;
        esac
    done
}

main
