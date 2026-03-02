# Installation Guide - WiFi-Attack Ghost v5.0

Panduan lengkap untuk instalasi WiFi-Attack Ghost di berbagai platform.

## 📋 Daftar Isi

- [Quick Start](#quick-start)
- [Windows Setup](#windows-setup)
- [Linux Setup](#linux-setup)
- [Termux Setup](#termux-setup)
- [Troubleshooting](#troubleshooting)
- [Verification](#verification)

---

## 🚀 Quick Start

**Untuk pengguna berpengalaman:**

### Linux

```bash
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
sudo bash setup-linux.sh
sudo bash Wifi-Attack.sh
```

### Termux

```bash
pkg install git aircrack-ng mdk4
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
su
bash Wifi-Attack.sh
```

---

## 💻 Windows Setup

### Opsi 1: WSL2 + Ubuntu (REKOMENDASI)

**Persyaratan:**

- Windows 10 Build 19041 atau lebih tinggi
- 4GB RAM minimal
- SSD untuk performa lebih baik

**Langkah 1: Enablement WSL2**

Buka PowerShell sebagai Administrator:

```powershell
# Enable WSL
wsl --install

# Set default ke WSL2
wsl --set-default-version 2

# Verify installation
wsl --list --verbose
```

**Langkah 2: Install Ubuntu dari Microsoft Store**

- Buka Microsoft Store
- Cari "Ubuntu 22.04 LTS"
- Klik Install
- Buka Ubuntu dan setup user/password

**Langkah 3: Setup di WSL Ubuntu**

```bash
# Update sistem
sudo apt update && sudo apt upgrade -y

# Clone repository
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# Instalasi otomatis
sudo bash setup-linux.sh

# Configure wireless interface
sudo airmon-ng start wlan0
# Note: ganti wlan0 dengan interface Anda

# Edit script
nano Wifi-Attack.sh
# Ubah: IFACE="wlan0mon"
```

**Langkah 4: Run Program**

```bash
sudo bash Wifi-Attack.sh
```

**⚠️ WSL2 Notes:**

- USB passthrough memerlukan konfigurasi tambahan
- Wireless adapter fisik mungkin tidak terdeteksi
- Gunakan VirtualBox untuk hasil lebih stabil

### Opsi 2: VirtualBox + Linux

**Download Required:**

- VirtualBox: https://www.virtualbox.org/wiki/Downloads
- Ubuntu ISO: https://ubuntu.com/download/desktop

**Setup Steps:**

1. **Buat Virtual Machine**
   - CPU: 2+ cores
   - RAM: 2GB+
   - Storage: 20GB+
   - Network: Host-only Adapter

2. **Install Ubuntu**
   - Boot dari ISO
   - Follow instalasi standard
   - Update sistem: `sudo apt update && sudo apt upgrade`

3. **Setup USB Passthrough**

   ```bash
   # Dalam VM, plug USB WiFi adapter
   # VBox menu: Devices → USB → Select adapter

   # Verify terdeteksi
   lsusb
   iwconfig
   ```

4. **Install Dependencies**

   ```bash
   sudo apt install -y aircrack-ng mdk4 wireless-tools ethtool git
   ```

5. **Clone & Run**
   ```bash
   git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
   cd Wifi-Attack-Ghost
   sudo bash setup-linux.sh
   sudo bash Wifi-Attack.sh
   ```

---

## 🐧 Linux Setup

### Debian/Ubuntu (Tested: 20.04, 22.04, 24.04)

**Method 1: Automated Setup**

```bash
# 1. Clone repository
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# 2. Run setup script (semua dependency akan terinstall)
sudo bash setup-linux.sh

# 3. Configure interface
sudo airmon-ng check kill
sudo airmon-ng start wlan0  # Replace with your adapter

# 4. Edit IFACE variable jika diperlukan
nano Wifi-Attack.sh

# 5. Run program
sudo bash Wifi-Attack.sh
```

**Method 2: Manual Installation**

```bash
# Update
sudo apt update && sudo apt upgrade -y

# Install core packages
sudo apt install -y \
    aircrack-ng \
    mdk4 \
    wireless-tools \
    ethtool \
    git \
    curl \
    build-essential

# Verify installation
aircrack-ng --help
mdk4 --help

# Clone repo
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# Run
sudo bash Wifi-Attack.sh
```

### Fedora/RHEL (Tested: Fedora 38, 39, 40)

```bash
# Update
sudo dnf update -y

# Install packages
sudo dnf install -y \
    aircrack-ng \
    mdk4 \
    wireless-tools \
    ethtool \
    git \
    curl

# Clone & run
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
sudo bash Wifi-Attack.sh
```

### Arch Linux, Manjaro

```bash
# Update
sudo pacman -Syu

# Install packages
sudo pacman -S \
    aircrack-ng \
    mdk4 \
    wireless_tools \
    ethtool \
    git

# Clone & run
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
sudo bash Wifi-Attack.sh
```

---

## 📱 Termux Setup

### Prerequisites

- Termux app (dari F-Droid atau fork yang support root)
- Android device dengan root access
- USB WiFi adapter (opsional, untuk hasil lebih baik)

### Installation Steps

**Langkah 1: Update Termux**

```bash
pkg update
pkg upgrade -y
```

**Langkah 2: Setup Repositories**

```bash
# Install root repository
pkg install -y root-repo

# Install unstable repository
pkg install -y unstable-repo
```

**Langkah 3: Install Dependencies**

```bash
pkg install -y \
    aircrack-ng \
    mdk4 \
    git \
    bash \
    curl \
    wget \
    nano
```

**Langkah 4: Storage Setup**

```bash
# First time only
termux-setup-storage

# Verify
ls -la ~/storage
```

**Langkah 5: Clone Repository**

```bash
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
```

**Langkah 6: Get Root Access**

```bash
# Gain superuser access
su

# Verify
id  # Should show uid=0
```

**Langkah 7: Configure Interface**

```bash
# Dalam root shell, cek adapter
iwconfig

# Enable monitor mode
airmon-ng start wlan0

# Edit script
nano Wifi-Attack.sh
# Ubah IFACE sesuai output airmon-ng (biasanya wlan0mon)
```

**Langkah 8: Run WiFi-Attack**

```bash
# Masih dalam root shell
bash Wifi-Attack.sh
```

### Termux Tips & Tricks

**Optimize Performance:**

```bash
# Before running
pkg autoclean
pkg clean all

# Run with nice
nice -n -10 bash Wifi-Attack.sh
```

**Persistent Root Shell:**

```bash
# Make root session persistent
su -c "bash Wifi-Attack.sh"
```

**Create Launcher Script:**

```bash
cat > ~/launch-attack.sh << 'EOF'
#!/bin/bash
su -c "cd ~/Wifi-Attack-Ghost && bash Wifi-Attack.sh"
EOF

chmod +x ~/launch-attack.sh
# Run: bash ~/launch-attack.sh
```

---

## ✅ Verification

### Check Installation Success

```bash
# 1. Check aircrack-ng
aircrack-ng --help | head -5
# Output: should show version info

# 2. Check mdk4
mdk4 --help | head -5
# Output: should show help menu

# 3. Check git
git --version
# Output: git version x.x.x

# 4. Check wireless tools
iwconfig
# Output: should show your wireless adapters

# 5. Check monitor mode
sudo airmon-ng check
# Output: should list any monitoring processes
```

### Test Run

```bash
# Go to project directory
cd Wifi-Attack-Ghost

# Make executable
chmod +x Wifi-Attack.sh
chmod +x setup-linux.sh

# Run help/verify
head -20 Wifi-Attack.sh

# Try running (akan ask untuk target setup)
sudo bash Wifi-Attack.sh
```

---

## 🔧 Troubleshooting

### Common Issues

#### 1. "Root privileges required"

```bash
# Error: ROOT PRIVILEGES REQUIRED

# Solution: Run with sudo
sudo bash Wifi-Attack.sh
```

#### 2. "command not found: aircrack-ng"

```bash
# Error: command not found

# Solution: Install manually
sudo apt install aircrack-ng  # Ubuntu/Debian
# or
sudo dnf install aircrack-ng  # Fedora
```

#### 3. "Interface not found"

```bash
# Error: RTNETLINK answers: Operation not permitted

# Solution: Setup monitor mode
sudo airmon-ng check kill
sudo airmon-ng start wlan0
# Check output untuk interface name (usually wlan0mon)

# Then edit Wifi-Attack.sh
nano Wifi-Attack.sh
# Change IFACE="wlan0" to IFACE="wlan0mon"
```

#### 4. "No network detected"

```bash
# Error: NO DATA FOUND

# Solution: Check if adapter is working
iwconfig
rfkill list
sudo rfkill unblock wifi

# Test monitor mode
sudo airodump-ng wlan0mon
# Should see networks
```

#### 5. "Permission denied" (Termux)

```bash
# Error: Permission denied

# Solution: Make sure you're in root shell
su
# Then run script
bash Wifi-Attack.sh
```

### Check System Requirements

```bash
# Check kernel version (min 4.0)
uname -r

# Check RAM
free -h

# Check disk space (min 100MB)
df -h ~/

# Check processor
lscpu | grep "CPU Model"
```

---

## 🎓 Next Steps

1. **Read Documentation**: `cat README.md`
2. **Understand Code**: Review `Wifi-Attack.sh`
3. **Configure**: Edit variables sesuai kebutuhan
4. **Test**: Di lab/isolated environment
5. **Learn**: Study wireless security concepts

---

## 📞 Support

- 📧 Email: security@example.com
- 🐛 Issues: https://github.com/Sneijderlino/Wifi-Attack-Ghost/issues
- 💬 Discussions: https://github.com/Sneijderlino/Wifi-Attack-Ghost/discussions

---

**Last Updated**: March 2024 | **Version**: 5.0
