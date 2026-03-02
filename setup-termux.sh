#!/bin/bash

# ==================== TERMUX SETUP SCRIPT ====================
# Script: Setup untuk Termux (Android Terminal Emulator)
# Platform: Termux (Android 7+)
# Author: Sneijderlino
# Version: 5.0

# --- COLORS ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# --- FUNCTIONS ---
print_header() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║     WiFi-Attack Ghost - Termux Setup Script v5.0               ║"
    echo "║     Platform: Android Terminal Emulator (Termux)               ║"
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

# --- CHECK TERMUX ---
check_termux() {
    print_step "Checking Termux environment..."
    
    if [ -z "$TERMUX_VERSION" ]; then
        print_warning "Mungkin tidak berjalan di Termux, tapi akan lanjut..."
    else
        print_success "Termux detected: $TERMUX_VERSION"
    fi
}

# --- SETUP REPOSITORIES ---
setup_repos() {
    print_step "Setting up Termux repositories..."
    
    # Setup root-repo untuk akses package tambahan
    pkg install -y root-repo || print_warning "root-repo gagal"
    print_success "root-repo setup"
    
    # Setup unstable-repo untuk package terbaru
    pkg install -y unstable-repo || print_warning "unstable-repo gagal"
    print_success "unstable-repo setup"
    
    # Setup x11-repo untuk X11 support (opsional)
    pkg install -y x11-repo || print_warning "x11-repo gagal (opsional)"
}

# --- UPDATE PACKAGES ---
update_packages() {
    print_step "Updating package list..."
    
    pkg update || exit 1
    pkg upgrade -y || exit 1
    
    print_success "Packages updated"
}

# --- INSTALL DEPENDENCIES ---
install_deps() {
    print_step "Installing WiFi-Attack-Ghost dependencies..."
    
    # Array of required packages
    local packages=(
        "aircrack-ng"
        "mdk4"
        "git"
        "bash"
        "curl"
        "wget"
        "nano"
        "vim"
    )
    
    for pkg in "${packages[@]}"; do
        print_step "Installing $pkg..."
        if pkg install -y "$pkg"; then
            print_success "$pkg installed"
        else
            print_warning "$pkg installation may have failed"
        fi
    done
}

# --- INSTALL OPTIONAL PACKAGES ---
install_optional() {
    print_step "Installing optional packages..."
    
    local optional=(
        "net-tools"
        "iproute2"
        "termux-api"
    )
    
    for pkg in "${optional[@]}"; do
        print_step "Installing optional: $pkg..."
        pkg install -y "$pkg" || print_warning "$pkg tidak ditemukan"
    done
}

# --- SETUP FILE STORAGE ---
setup_storage() {
    print_step "Setting up storage access..."
    
    if [ ! -d "$HOME/storage" ]; then
        print_step "First time setup: requesting storage permissions..."
        termux-setup-storage
        print_success "Storage setup completed"
    else
        print_success "Storage already configured"
    fi
}

# --- VERIFY INSTALLATION ---
verify_installation() {
    print_step "Verifying installation..."
    
    local failed=0
    local packages=("aircrack-ng" "mdk4" "git")
    
    for pkg in "${packages[@]}"; do
        if command -v "$pkg" &> /dev/null; then
            print_success "$pkg is installed"
        else
            print_error "$pkg NOT found"
            ((failed++))
        fi
    done
    
    if [ $failed -gt 0 ]; then
        print_error "Some packages failed to install"
        return 1
    fi
    
    print_success "All dependencies verified"
}

# --- WIRELESS SETUP ---
wireless_setup() {
    print_step "Wireless setup instructions..."
    
    echo -e "${CYAN}"
    echo "┌─────────────────────────────────────────────────────────────────┐"
    echo "│ Untuk menggunakan WiFi-Attack di Termux:                       │"
    echo "│                                                                 │"
    echo "│ 1. Device HARUS di-root                                        │"
    echo "│ 2. Root Termux session: su                                     │"
    echo "│ 3. Check adapter: iwconfig atau ip link                        │"
    echo "│ 4. Enable monitor mode: airmon-ng start wlan0                  │"
    echo "│ 5. Update IFACE di Wifi-Attack.sh                             │"
    echo "│                                                                 │"
    echo "│ Catatan:                                                        │"
    echo "│  - Tidak semua device support monitor mode di Termux           │"
    echo "│  - USB WiFi adapter mungkin diperlukan                         │"
    echo "│  - Performance lebih lambat dari Linux native                  │"
    echo "└─────────────────────────────────────────────────────────────────┘"
    echo -e "${NC}"
}

# --- COMPATIBILITY CHECK ---
compatibility_check() {
    print_step "Checking Termux compatibility..."
    
    # Check if we can access busybox commands
    if command -v busybox &> /dev/null; then
        print_success "busybox found (good for command compatibility)"
    fi
    
    # Check grep
    if grep --version &> /dev/null; then
        print_success "grep is available"
    fi
    
    # Check awk
    if awk --version &> /dev/null; then
        print_success "awk is available"
    fi
    
    # Check sed
    if sed --version &> /dev/null; then
        print_success "sed is available"
    fi
}

# --- CLONE REPOSITORY ---
clone_repo() {
    print_step "Cloning WiFi-Attack-Ghost repository..."
    
    if [ -d "Wifi-Attack-Ghost" ]; then
        print_warning "Repository sudah ada di ./Wifi-Attack-Ghost"
        return
    fi
    
    if git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git; then
        print_success "Repository cloned"
        cd Wifi-Attack-Ghost || exit 1
    else
        print_error "Failed to clone repository"
        print_step "Clone manually: git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git"
        return 1
    fi
}

# --- SETUP TERMUX VERSION ---
setup_termux_version() {
    print_step "Creating Termux-compatible version..."
    
    if [ -f "Wifi-Attack.sh" ]; then
        print_success "Main script found"
        
        # Buat backup
        cp Wifi-Attack.sh Wifi-Attack.sh.backup
        print_success "Backup created: Wifi-Attack.sh.backup"
        
        # Notes untuk Termux
        cat > TERMUX_NOTES.txt << 'EOF'
WiFi-Attack Ghost - Termux Version Notes
==========================================

REQUIREMENTS:
- Device harus di-root
- Termux harus memiliki root access
- WiFi adapter yang mendukung monitor mode

USAGE:
1. Open Termux
2. Gain root: su
3. Go to project: cd Wifi-Attack-Ghost
4. Configure interface: nano Wifi-Attack.sh (ubah IFACE)
5. Run: bash Wifi-Attack.sh

TIPS:
- Use USB WiFi adapter untuk hasil optimal
- Termux storage harus sudah setup
- Check monitor mode: airmon-ng check
- Monitor interface: iwconfig

TROUBLESHOOTING:
- If monitor mode fails: lsusb (check adapter)
- If permission denied: Make sure you're in su shell
- If script not found: Check path dengan pwd
EOF
        
        print_success "TERMUX_NOTES.txt created"
    else
        print_error "Wifi-Attack.sh not found"
    fi
}

# --- FINAL INFO ---
final_info() {
    print_header
    
    echo -e "${GREEN}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║        ✓ Termux Setup Completed!                             ║"
    echo "║                                                                ║"
    echo "║  Langkah berikutnya:                                           ║"
    echo "║  1. Dapatkan root access di Termux                            ║"
    echo "║  2. Jalankan: su                                              ║"
    echo "║  3. Konfigurasi wireless interface                            ║"
    echo "║  4. Edit: nano Wifi-Attack.sh (ubah IFACE variable)           ║"
    echo "║  5. Jalankan: bash Wifi-Attack.sh                             ║"
    echo "║                                                                ║"
    echo "║  Baca TERMUX_NOTES.txt untuk info lengkap                     ║"
    echo "║                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# --- MAIN FUNCTION ---
main() {
    print_header
    
    check_termux
    setup_repos
    update_packages
    install_deps
    install_optional
    setup_storage
    compatibility_check
    verify_installation
    wireless_setup
    clone_repo
    setup_termux_version
    final_info
}

# --- RUN ---
main "$@"
