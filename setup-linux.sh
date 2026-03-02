#!/bin/bash

# ==================== SETUP SCRIPT ====================
# Script: Setup Dependencies untuk WiFi-Attack Ghost
# Platform: Linux (Debian/Ubuntu, Fedora, Arch)
# Author: Sneijderlino
# Description: Instalasi otomatis dependencies yang diperlukan

# --- COLORS ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# --- FUNCTIONS ---
print_header() {
    clear
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║     WiFi-Attack Ghost - Automated Setup Script v5.0            ║"
    echo "║     Platform: Linux (Debian/Ubuntu/Fedora/Arch)               ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "\n${BLUE}[●]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# --- ROOT CHECK ---
check_root() {
    if [ "$EUID" -ne 0 ]; then 
        print_error "Script harus dijalankan sebagai root"
        echo -e "Silakan jalankan: ${YELLOW}sudo bash setup-linux.sh${NC}"
        exit 1
    fi
    print_success "Root privileges terdeteksi"
}

# --- DETECT OS ---
detect_os() {
    print_step "Mendeteksi distribusi Linux..."
    
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
        print_success "Distribusi terdeteksi: $PRETTY_NAME"
    else
        print_error "Tidak bisa mendeteksi distribusi Linux"
        exit 1
    fi
}

# --- INSTALL DEBIAN/UBUNTU ---
install_debian() {
    print_step "Menginstall dependencies untuk Debian/Ubuntu..."
    
    # Update package list
    print_step "Update package list..."
    apt-get update || exit 1
    apt-get upgrade -y || exit 1
    print_success "Package list updated"
    
    # Install essential tools
    print_step "Installing essential packages..."
    apt-get install -y \
        aircrack-ng \
        mdk4 \
        wireless-tools \
        ethtool \
        git \
        curl \
        wget \
        nano \
        vim || exit 1
    
    print_success "Essential packages installed"
    
    # Install optional but recommended
    print_step "Installing recommended packages..."
    apt-get install -y \
        net-tools \
        iw \
        rfkill \
        build-essential || true
    
    print_success "Recommended packages installed"
}

# --- INSTALL FEDORA/RHEL ---
install_fedora() {
    print_step "Menginstall dependencies untuk Fedora/RHEL..."
    
    # Update system
    print_step "Update system..."
    dnf update -y || exit 1
    print_success "System updated"
    
    # Install essential tools
    print_step "Installing essential packages..."
    dnf install -y \
        aircrack-ng \
        mdk4 \
        wireless-tools \
        ethtool \
        git \
        curl \
        wget \
        nano \
        vim || exit 1
    
    print_success "Essential packages installed"
    
    # Install optional
    print_step "Installing recommended packages..."
    dnf install -y \
        net-tools \
        iw \
        rfkill \
        kernel-devel || true
    
    print_success "Recommended packages installed"
}

# --- INSTALL ARCH ---
install_arch() {
    print_step "Menginstall dependencies untuk Arch Linux..."
    
    # Update system
    print_step "Update system..."
    pacman -Syu --noconfirm || exit 1
    print_success "System updated"
    
    # Install essential tools
    print_step "Installing essential packages..."
    pacman -S --noconfirm \
        aircrack-ng \
        mdk4 \
        wireless_tools \
        ethtool \
        git \
        curl \
        wget \
        nano \
        vim || exit 1
    
    print_success "Essential packages installed"
    
    # Install optional
    print_step "Installing recommended packages..."
    pacman -S --noconfirm \
        net-tools \
        iw \
        rfkill || true
    
    print_success "Recommended packages installed"
}

# --- VERIFY INSTALLATION ---
verify_installation() {
    print_step "Verifying installation..."
    
    local failed=0
    local packages=("aircrack-ng" "mdk4" "git")
    
    for pkg in "${packages[@]}"; do
        if command -v "$pkg" &> /dev/null; then
            print_success "$pkg terinstall"
        else
            print_error "$pkg tidak terinstall"
            ((failed++))
        fi
    done
    
    if [ $failed -gt 0 ]; then
        print_warning "Beberapa package gagal terinstall"
        return 1
    fi
    
    print_success "Semua dependencies terinstall dengan benar"
    return 0
}

# --- WIRELESS ADAPTER SETUP ---
setup_wireless() {
    print_step "Checking wireless adapter..."
    
    # Check wireless tools
    if ! iwconfig &> /dev/null; then
        print_warning "iwconfig tidak ditemukan, silakan install wireless-tools"
        return 1
    fi
    
    print_success "Wireless tools found"
    
    # List available adapters
    print_step "Available wireless adapters:"
    iwconfig 2>/dev/null | grep "ESSID" | awk '{print "  - " $1}'
    
    print_warning "Edit Wifi-Attack.sh dan update IFACE variable dengan adapter name"
}

# --- FINAL CHECKS ---
final_checks() {
    print_step "Running final checks..."
    
    # Check kernel version
    KERNEL_VER=$(uname -r)
    print_success "Kernel version: $KERNEL_VER"
    
    # Check if running as sudo
    if [ -n "$SUDO_USER" ]; then
        print_success "Script ran with sudo"
    fi
    
    # Check git
    if command -v git &> /dev/null; then
        print_success "Git is installed"
    else
        print_warning "Git recommended untuk development"
    fi
}

# --- MAIN SETUP ---
main() {
    print_header
    check_root
    detect_os
    
    case $OS in
        ubuntu|debian)
            install_debian
            ;;
        fedora|rhel|centos)
            install_fedora
            ;;
        arch|manjaro)
            install_arch
            ;;
        *)
            print_error "Distribusi Linux tidak didukung: $OS"
            print_step "Silakan install dependencies secara manual:"
            echo "  - aircrack-ng"
            echo "  - mdk4"
            echo "  - wireless-tools"
            echo "  - ethtool"
            exit 1
            ;;
    esac
    
    verify_installation || {
        print_error "Installation verification failed"
        exit 1
    }
    
    setup_wireless
    final_checks
    
    print_header
    echo -e "${GREEN}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║        ✓ Setup Completed Successfully!                        ║"
    echo "║                                                                ║"
    echo "║  Langkah berikutnya:                                           ║"
    echo "║  1. Konfigurasi IFACE variable di Wifi-Attack.sh              ║"
    echo "║  2. Jalankan: sudo bash Wifi-Attack.sh                        ║"
    echo "║  3. Baca README.md untuk dokumentasi lengkap                  ║"
    echo "║                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# --- CLEANUP ON EXIT ---
cleanup() {
    print_step "Cleaning up..."
    print_success "Setup script finished"
}

trap cleanup EXIT

# --- RUN MAIN ---
main "$@"
