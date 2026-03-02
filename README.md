<!-- ==================== HEADER BANNER ==================== -->
<div align="center">
  <img src="img/sampel.png" alt="WiFi-Attack Ghost - Banner" width="100%" style="border-radius:12px; box-shadow:0 0 30px rgba(255,0,0,0.5); margin-bottom:20px;">
</div>

<!-- ==================== JUDUL UTAMA ==================== -->
<h1 align="center">🔴 WiFi-Attack Ghost</h1>
<h3 align="center">Alat Penetrasi WiFi Profesional untuk Penelitian Keamanan Jaringan</h3>

<div align="center">

![License](https://img.shields.io/badge/License-GNU%20GPL%203.0-red?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Windows%20%7C%20Termux-darkred?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active%20Development-brightgreen?style=for-the-badge)
![Version](<https://img.shields.io/badge/Version-5.0%20(Overlord)-blue?style=for-the-badge>)

**[PERINGATAN KEAMANAN](#-peringatan-keamanan-hukum) • [Instalasi Cepat](#-panduan-instalasi) • [Dokumentasi Lengkap](#-dokumentasi) • [Kontribusi](#-berkontribusi)**

</div>

---

## ⚠️ PERINGATAN KEAMANAN & HUKUM

**⛔ PERINGATAN PENTING:**

Alat ini dirancang **HANYA** untuk:

- ✅ Pengujian keamanan pada jaringan Anda sendiri
- ✅ Lab penelitian dan lingkungan test kontrol
- ✅ Tujuan pendidikan dengan persetujuan tertulis
- ✅ Operasi Red Team yang sah dan teruji hukum

**Penggunaan alat ini untuk:**

- ❌ Menyerang jaringan WiFi milik orang lain **ADALAH TINDAKAN ILEGAL**
- ❌ Mengganggu layanan komunikasi publik
- ❌ Pencurian akses internet

**📋 Tanggung Jawab Pengguna:**

- Anda sepenuhnya bertanggung jawab atas penggunaan alat ini
- Dapatkan **izin tertulis** sebelum melakukan penetrasi apa pun
- Patuhi hukum dan peraturan lokal di yurisdiksi Anda
- Penulis dan kontributor tidak menanggung tanggung jawab atas penyalahgunaan

---

<!-- ==================== DESKRIPSI ==================== -->

## 📌 Tentang WiFi-Attack Ghost

**WiFi-Attack Ghost** adalah framework penetrasi WiFi profesional dengan interface interaktif yang memungkinkan security researcher dan ethical hacker untuk melakukan:

### 🎯 Fitur Utama

| Fitur                   | Deskripsi                                            |
| ----------------------- | ---------------------------------------------------- |
| **🔍 Network Scanning** | Scanning WiFi dengan detail channel, power, dan SSID |
| **⚡ Deauth Attack**    | Putuskan koneksi target dengan precision control     |
| **👻 Beacon Ghosting**  | Broadcast multiple fake access points sekaligus      |
| **🎨 Interactive UI**   | Interface terminal profesional dengan ASCII art      |
| **⚙️ Adaptive Control** | Control kecepatan packet dan channel dynamically     |
| **🛡️ Monitor Mode**     | Dukungan lengkap wireless monitor mode               |

### 💻 Spesifikasi Teknis

```
- Bahasa Pemrograman: Bash Script
- Kernel Minimum: Linux 4.x / Termux
- Engine Core: mdk4, airodump-ng
- Mode Operasi: Monitor Mode (802.11)
- Privilege: Root/Sudo Required
- Arsitektur: x86_64, ARM64, ARM
```

---

## 📦 Persyaratan Sistem

### Dependensi Utama

| Paket              | Fungsi                     | Platform     |
| ------------------ | -------------------------- | ------------ |
| **aircrack-ng**    | Scanning & monitoring WiFi | Linux/Termux |
| **mdk4**           | Generating attack payloads | Linux/Termux |
| **wireless-tools** | WiFi interface management  | Linux        |
| **ethtool**        | Network interface tools    | Linux        |

### Prasyarat Hardware

- Wireless adapter dengan dukungan monitor mode
- Minimal 512MB RAM
- Koneksi internet untuk instalasi dependencies

---

## 🚀 PANDUAN INSTALASI

### 1️⃣ Instalasi di Windows

#### Opsi A: Windows Subsystem for Linux 2 (WSL2) - REKOMENDASI

<details>
<summary><b>Klik untuk membuka panduan WSL2</b></summary>

**Langkah 1: Aktivasi WSL2**

```bash
# Jalankan PowerShell sebagai Administrator
wsl --install
wsl --set-default-version 2
```

**Langkah 2: Install Ubuntu dari Microsoft Store**

- Buka Microsoft Store
- Cari "Ubuntu 22.04 LTS" atau versi terbaru
- Klik Install
- Buka Ubuntu dan selesaikan setup

**Langkah 3: Clone Repository**

```bash
sudo apt-get update && sudo apt-get upgrade -y
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
```

**Langkah 4: Jalankan Script Setup**

```bash
sudo bash setup-linux.sh
```

**Langkah 5: Konfigurasi Wireless Adapter**

```bash
# Temukan nama interface
sudo iwconfig

# Buat virtual monitor interface (ganti wlan0 dengan nama adapter Anda)
sudo airmon-ng start wlan0
# Interface akan menjadi sesuatu seperti wlan0mon

# Edit Wifi-Attack.sh dan ubah IFACE variable
nano Wifi-Attack.sh
```

**Langkah 6: Jalankan Program**

```bash
sudo bash Wifi-Attack.sh
```

⚠️ **Catatan WSL2:**

- Wireless adapter fisik mungkin menunjukkan issue pada beberapa setup
- Gunakan VirtualBox dengan passthrough USB untuk solusi optimal
- Monitoring real-time memerlukan USB wireless adapter yang didedikasikan

</details>

#### Opsi B: VirtualBox + Linux

<details>
<summary><b>Klik untuk membuka panduan VirtualBox</b></summary>

**Langkah 1: Setup VirtualBox**

- Download VirtualBox dari [virtualbox.org](https://www.virtualbox.org)
- Download ISO Ubuntu Server/Desktop 22.04 LTS
- Buat VM dengan min 2GB RAM, 20GB storage

**Langkah 2: USB Passthrough**

- Masukkan wireless adapter USB ke VM settings
- Devices → USB → Select adapter Anda
- Pastikan adapter terdeteksi di Linux: `lsusb`

**Langkah 3: Install Dependencies**

```bash
sudo apt update
sudo apt install -y aircrack-ng mdk4 wireless-tools ethtool git
```

**Langkah 4: Clone & Setup**

```bash
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
sudo bash setup-linux.sh
```

**Langkah 5: Jalankan**

```bash
sudo bash Wifi-Attack.sh
```

</details>

---

### 2️⃣ Instalasi di Linux

#### Debian/Ubuntu Based (REKOMENDASI)

```bash
# 1. Update sistem
sudo apt-get update && sudo apt-get upgrade -y

# 2. Clone repository
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# 3. Install dependencies otomatis
sudo bash setup-linux.sh

# 4. Konfigurasi wireless interface
sudo airmon-ng check kill
sudo airmon-ng start wlan0  # Ganti dengan adapter Anda
# Output akan menunjukkan nama interface (biasanya wlan0mon)

# 5. Edit script untuk konfigurasi interface (jika perlu)
sudo nano Wifi-Attack.sh
# Ubah: IFACE="wlan0mon"

# 6. Jalankan aplikasi
sudo bash Wifi-Attack.sh
```

**Instalasi Manual untuk Troubleshooting:**

```bash
sudo apt install -y \
    aircrack-ng \
    mdk4 \
    wireless-tools \
    ethtool \
    git \
    curl

# Verifikasi instalasi
airmon-ng --help
mdk4 --help
```

#### Fedora/RedHat Based

```bash
# 1. Update sistem
sudo dnf update -y

# 2. Clone repository
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# 3. Install dependencies
sudo dnf install -y \
    aircrack-ng \
    mdk4 \
    wireless-tools \
    ethtool \
    git

# 4. Setup dan jalankan
sudo bash setup-linux.sh
sudo bash Wifi-Attack.sh
```

#### Arch Linux

```bash
sudo pacman -Sy archlinux-keyring
sudo pacman -S aircrack-ng mdk4 wireless_tools ethtool git
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
sudo bash Wifi-Attack.sh
```

---

### 3️⃣ Instalasi di Termux (Android)

<details>
<summary><b>Klik untuk membuka panduan Termux</b></summary>

#### Persiapan & Setup

**Langkah 1: Install Termux**

- Download APK dari [termux.com](https://termux.com) atau F-Droid
- Atau install dari Play Store (versi lama)

**Langkah 2: Update Termux**

```bash
pkg update
pkg upgrade -y
```

**Langkah 3: Install Dependencies**

```bash
pkg install -y \
    root-repo \
    unstable-repo \
    x11-repo \
    aircrack-ng \
    mdk4 \
    wget \
    curl \
    git \
    bash \
    nano
```

**Langkah 4: Clone Repository**

```bash
cd ~
git clone https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost
```

**Langkah 5: Adaptasi Script untuk Termux**

```bash
# Copy script Termux
cp Wifi-Attack-Termux.sh Wifi-Attack.sh

# Atau edit script original
nano Wifi-Attack.sh
```

**Langkah 6: Jalankan dengan Root**

```bash
# Opsi 1: Jika sukses gain root
sudo bash Wifi-Attack.sh

# Opsi 2: Jalankan langsung sebagai root termux
bash Wifi-Attack.sh
```

#### Konfigurasi Wireless pada Termux

```bash
# Check interface yang tersedia
ifconfig
# Atau
ip link show

# Set interface ke monitor mode
su
airmon-ng start wlan0  # Sesuaikan dengan interface Anda
exit

# Edit IFACE variable dalam script
nano Wifi-Attack.sh
# Ubah: IFACE="wlan0mon"
```

#### Troubleshooting Termux

| Masalah                          | Solusi                                             |
| -------------------------------- | -------------------------------------------------- |
| Permission denied                | Jalankan `su` terlebih dahulu, atau gunakan `sudo` |
| aircrack-ng tidak ditemukan      | `pkg install aircrack-ng`                          |
| Network interface tidak terlihat | Aktifkan WiFi di Android, restart Termux           |
| mdk4 error                       | Gunakan versi community: `pkg install mdk4`        |

#### Optimasi Termux

```bash
# Tingkatkan performa
termux-setup-storage

# Install proot untuk akses file system penuh (opsional)
pkg install proot
proot -r /data/data/com.termux/files/home bash
```

⚠️ **Catatan Penting Termux:**

- Akses wireless adapter tergantung pada rooting dan permission
- Beberapa device tidak mendukung monitor mode di Termux
- Performance lebih lambat dibanding Linux native
- Untuk hasil optimal gunakan Linux native di device yang support

</details>

---

## 📖 DOKUMENTASI

### Struktur Menu Aplikasi

```
┌─ OVERLAY HOME FRAME
│
├─ [01] NETWORK ANALYSIS (SCAN SECTOR)
│       └─ Scanning WiFi dengan channel & signal strength
│          ├─ [01] PROCEED TO ATTACK COMMANDS
│          └─ [02] RETURN TO HOME FRAME
│
└─ [02] SHUTDOWN SYSTEM
        └─ Exit aplikasi dengan graceful shutdown

ATTACK VECTORS:
├─ [01] DEAUTH STRIKE (DISCONNECT TARGET)
│       └─ Input: BSSID, Channel, Packet Speed
│
└─ [02] MULTI-BEACON GHOSTING (FAKE APs)
        └─ Input: Multiple SSID (comma-separated)
```

### Panduan Penggunaan Dasar

#### 1. Scanning WiFi Network

```bash
# Jalankan aplikasi
sudo bash Wifi-Attack.sh

# Menu utama akan muncul
# Pilih [01] untuk NETWORK ANALYSIS

# Script akan menjalankan airodump-ng
# Tekan CTRL+C ketika sudah mendeteksi target

# Output akan menampilkan:
# BSSID | Channel | Power | SSID
```

#### 2. Deauth Attack

```
Menu Utama
  ↓
[01] NETWORK ANALYSIS
  ↓
List target networks muncul
  ↓
[01] PROCEED TO ATTACK COMMANDS
  ↓
ATTACK VECTORS
  ↓
[01] DEAUTH STRIKE
  ↓
Input:
  - TARGET BSSID: [MAC Address dari hasil scan]
  - TARGET CHANNEL: [Channel number]
  - PACKET SPEED: [Jumlah packets/sec, contoh: 300]
  ↓
Attack dimulai - Tekan CTRL+C untuk menghentikan
```

**Contoh Praktis:**

```
TARGET BSSID: AA:BB:CC:DD:EE:FF
TARGET CHANNEL: 6
PACKET SPEED: 300
```

#### 3. Beacon Ghosting Attack

```
Menu Utama
  ↓
[01] NETWORK ANALYSIS
  [01] PROCEED TO ATTACK COMMANDS
  [02] ATTACK VECTORS
  [02] MULTI-BEACON GHOSTING
  ↓
Input SSID terpisah koma:
  Contoh: WiFi_Fake,Hospital_Free,Airport_Guest
  ↓
Script membuat file fake_list.txt
  ↓
mdk4 broadcast beacon frames
  ↓
Tekan CTRL+C untuk berhenti
```

### Variabel Konfigurasi

Edit `Wifi-Attack.sh` untuk kustomisasi:

```bash
# Interface wireless (PENTING: sesuaikan dengan sistem Anda)
IFACE="wlan0mon"

# Temporary file untuk hasil scanning
TEMP_FILE="/tmp/wifi_scan_final"

# Color palette (bisa disesuaikan)
RED='\033[0;31m'
L_RED='\033[1;31m'
WHITE='\033[1;37m'
```

### Advanced Configuration

**Setting Interface Default:**

```bash
# Cek semua interface
iwconfig

# Aktifkan monitor mode secara manual
sudo airmon-ng start wlan0
# Output: (monitor mode enabled on wlan0mon)

# Set di script
IFACE="wlan0mon"
```

**Custom Attack Parameters:**

```bash
# Edit parameter mdk4 di script untuk mod behavior
# Deauth packets per second: bisa diubah 100-1000
# Beacon frame rate: adjustable berdasarkan capability
```

---

## 🔧 Troubleshooting

### Error Umum & Solusi

| Error                                        | Cause                                | Solusi                                          |
| -------------------------------------------- | ------------------------------------ | ----------------------------------------------- |
| `[!] FATAL ERROR: ROOT PRIVILEGES REQUIRED`  | Script tidak dijalankan sebagai root | Gunakan `sudo bash Wifi-Attack.sh`              |
| `command not found: aircrack-ng`             | aircrack-ng tidak terinstall         | `sudo apt install aircrack-ng`                  |
| `command not found: mdk4`                    | mdk4 tidak terinstall                | `sudo apt install mdk4`                         |
| `RTNETLINK answers: Operation not permitted` | Monitor mode tidak aktif             | Jalankan `sudo airmon-ng start wlan0`           |
| `Interface wlan0mon not found`               | Interface salah                      | Edit `IFACE` variable di script                 |
| `NO DATA FOUND. CHECK MONITOR MODE`          | Adapter tidak mendeteksi network     | Check wireless adapter: `rfkill list`           |
| `Timeout waiting for scan hasil`             | airmon-ng process hang               | Buka terminal baru, kill: `sudo pkill airodump` |

### Wireless Adapter Tidak Terdeteksi

```bash
# 1. Check adapter tercantum
iwconfig
ifconfig
lsusb  # Untuk USB adapter

# 2. Aktifkan WiFi (jika off)
sudo rfkill unblock wifi
sudo rfkill unblock all

# 3. Load driver kernel
sudo modprobe -r rtl8xxxu  # Sesuaikan dengan chip
sudo modprobe rtl8xxxu

# 4. Restart networking
sudo systemctl restart networking

# 5. Test monitor mode
sudo airmon-ng check
sudo airmon-ng start wlan0
```

### Performance Issue pada Termux

```bash
# Clear cache
pkg clean all

# Restart Termux
pkill -f termux

# Jalankan dengan prioritas tinggi
nice -n -10 bash Wifi-Attack.sh
```

---

## 📊 Contoh Output

```
  ██╗    ██╗██╗███████╗██╗   █████╗ ████████╗████████╗ █████╗  ██████╗██╗  ██╗
  ██║    ██║██║██╔════╝██║  ██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝
  ██║ █╗ ██║██║█████╗  ██║  ███████║   ██║      ██║   ███████║██║     █████═╝
  ██║███╗██║██║██╔══╝  ██║  ██╔══██║   ██║      ██║   ██╔══██║██║     ██╔═██╗
  ╚███╔███╔╝██║██║     ██╗  ██║  ██║   ██║      ██║   ██║  ██║╚██████╗██║  ██╗
   ╚══╝╚══╝ ╚═╝╚═╝     ╚              ╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═════╝╚═╝  ╚═╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ OVERLORD EDITION v5.0 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INTERFACE: wlan0mon | STATUS: READY

   [01] NETWORK ANALYSIS (SCAN SECTOR)
   [02] SHUTDOWN SYSTEM

   ┌──(Overlord@Root)─[~/HOME]
   └─╼ [01]

[SYSTEM] Scanning Frequencies...
[SYSTEM] Press CTRL+C to Lock Target List.

╔━━━━━━━━━━━━━━━━━━ TARGETING GRID ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗
   BSSID              CH    PWR    SSID
   ───────────────────────────────────────────────────────────────
   AA:BB:CC:DD:EE:FF   6    -45    MyWiFi_Network
   11:22:33:44:55:66   11   -62    CoffeeShop_WiFi
   99:88:77:66:55:44   1    -48    Airport_Guest
╚━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╝
```

---

## 🎓 Pembelajaran & Referensi

### Konsep Teknis

#### Deauth Attack

```
Client ←→ AP (Connected)
        ↓
   Send Deauth Frame
   (MAC spoofing sebagai AP)
        ↓
Client Putus Koneksi
```

**Parameter:**

- **BSSID**: MAC address dari Access Point
- **Channel**: Frekuensi operasi (1-11 2.4GHz, 36-165 5GHz)
- **Packet Speed**: Jumlah deauth frame per detik (100-1000)

#### Multi-Beacon Ghosting

```
Broadcast Beacon Frames
   ↓
Multiple SSIDs (Fake Networks)
   ↓
Device menampilkan "Available Networks"
   ↓
Users terdistraksi/tertipu
```

**Fungsi Praktis:**

- Pengujian robustness WiFi scanning
- Awareness training tentang rogue APs
- Network monitoring simulation

### Resource Tambahan

- 📚 [Aircrack-ng Suite Documentation](https://www.aircrack-ng.org)
- 📚 [MDK4 GitHub Repository](https://github.com/aircrack-ng/mdk4)
- 📚 [IEEE 802.11 Specifications](https://en.wikipedia.org/wiki/IEEE_802.11)
- 📚 [Ethical Hacking Fundamentals](https://www.comptia.org/certifications/security)

### Security Research Best Practices

1. **Dokumentasi Lengkap**
   - Catat waktu, lokasi, interface
   - Log semua aktivitas untuk audit trail
   - Dokumentasi written consent

2. **Izin & Compliance**
   - Dapatkan written authorization
   - Pahami hukum lokal
   - Report findings responsibly

3. **Ethical Conduct**
   - Jangan akses data pribadi
   - Minimize impact pada target
   - Inform stakeholders setelah test

---

## 🤝 BERKONTRIBUSI

Kami menerima kontribusi dari komunitas! Panduan lengkap di [CONTRIBUTING.md](CONTRIBUTING.md)

### Cara Berkontribusi

1. **Fork Repository**

   ```bash
   git clone https://github.com/YOUR_USERNAME/Wifi-Attack-Ghost.git
   cd Wifi-Attack-Ghost
   git checkout -b feature/amazing-feature
   ```

2. **Commit Changes**

   ```bash
   git add .
   git commit -m "Add amazing feature"
   ```

3. **Push to Branch**

   ```bash
   git push origin feature/amazing-feature
   ```

4. **Create Pull Request**
   - Jelaskan perubahan Anda
   - Link ke issue terkait
   - Tunggu review

### Area Kontribusi Yang Dibutuhkan

- ✨ **Feature Requests**: Ideen untuk fitur baru
- 🐛 **Bug Reports**: Laporkan issues yang ditemukan
- 📖 **Documentation**: Improve panduan & kommentarkan kode
- 🌍 **Localization**: Translas ke bahasa lain
- 🔒 **Security**: Laporan vulnerability responsibly

---

## 📋 CODE OF CONDUCT

Komunitas kami berkomitmen pada lingkungan yang inklusif dan menghormati. Baca [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) untuk detail lengkap.

---

## 🔐 SECURITY POLICY

💣 **Menemukan Vulnerability?** Jangan buka public issue!

Laporkan ke: [SECURITY.md](SECURITY.md)

**Proses Responsible Disclosure:**

1. Email: security@example.com
2. Enkripsi dengan PGP key kami jika sensitif
3. Tunggu konfirmasi dalam 48 jam
4. Timeline: 90 hari untuk fix & release

---

## 📄 LISENSI

Proyek ini dilisensikan di bawah **GNU General Public License v3.0**

Lihat file [LICENSE](LICENSE) untuk detail lengkap.

**Ringkas Lisensi:**

- ✅ Modify & distribute (dengan license yang sama)
- ✅ Private use
- ❌ Liability terbatas
- ❌ Warranty tidak ada

```
WiFi-Attack Ghost - Penetration Testing Framework
Copyright (C) 2024 Sneijderlino

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
```

---

## 👨‍💻 TENTANG PENGEMBANG

<div align="center">

**Dikembangkan dengan ❤️ oleh:**

### **Sneijderlino**

_Ethical Security Researcher | Penetration Tester | Tool Developer_

[![GitHub](https://img.shields.io/badge/GitHub-Sneijderlino-black?style=for-the-badge&logo=github)](https://github.com/Sneijderlino)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Sneijderlino-blue?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/sneijderlino)
[![Email](https://img.shields.io/badge/Email-Contact-red?style=for-the-badge&logo=gmail)](mailto:security@example.com)

</div>

---

## 🎯 ROADMAP & FUTURE

### v5.0 (Overlord - Current)

- ✅ Core deauth & ghosting functionality
- ✅ Interactive terminal UI
- ✅ Multi-platform support
- ✅ Professional documentation

### v6.0 (Planned)

- 🔄 Web-based dashboard untuk network visualization
- 🔄 Advanced AI untuk network pattern detection
- 🔄 Integration dengan Shodan untuk device fingerprinting
- 🔄 Auto-crack WPA2 dengan dictionary support
- 🔄 Custom payload generation
- 🔄 Database logging untuk audit trails

### v7.0 (Long-term)

- 🔮 Mobile app (iOS/Android)
- 🔮 Kubernetes deployment
- 🔮 Machine learning untuk threat detection
- 🔮 API REST untuk automation

---

## 💬 KOMUNITAS & SUPPORT

- 💬 **Discussions**: [GitHub Discussions](https://github.com/Sneijderlino/Wifi-Attack-Ghost/discussions)
- 🐛 **Issues**: [Report Bugs](https://github.com/Sneijderlino/Wifi-Attack-Ghost/issues)
- 📧 **Email**: security@example.com
- 🌐 **Website**: https://sneijderlino.github.io

---

## ⭐ SPONSOR & SUPPORT

Jika proyek ini membantu Anda, pertimbangkan:

- ⭐ **Beri Star** di repository ini
- 🔗 **Share** dengan komunitas
- 💰 **Sponsor** pengembangan (tautan segera)
- 📝 **Kontribusi** dokumentasi & kode

---

<div align="center">

<!-- Wave Footer -->
<img src="https://capsule-render.vercel.app/api?type=waving&color=ff0000&height=100&section=footer&reversal=true&animation=fadeIn" width="100%"/>

### ⚡ Ethical Hacking • Security Research • Continuous Learning ⚡

**[↑ Kembali ke Atas](#-wifi-attack-ghost)**

© 2024 Sneijderlino. All Rights Reserved.

**Version**: 5.0 Overlord Edition | **Last Updated**: March 2024

</div>
# Wifi-Attack-Ghost
