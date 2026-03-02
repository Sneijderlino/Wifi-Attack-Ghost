# Contributing to WiFi-Attack Ghost

Terima kasih telah tertarik untuk berkontribusi pada WiFi-Attack Ghost! Panduan ini menjelaskan cara terbaik untuk berpartisipasi dalam proyek kami.

## 📋 Daftar Isi

- [Code of Conduct](#code-of-conduct)
- [Bagaimana Cara Berkontribusi](#bagaimana-cara-berkontribusi)
- [Proses Pull Request](#proses-pull-request)
- [Panduan Gaya Kode](#panduan-gaya-kode)
- [Pelaporan Bug](#pelaporan-bug)
- [Saran Fitur](#saran-fitur)

## Code of Conduct

Proyek ini dan semua pesertanya tunduk pada [Code of Conduct](CODE_OF_CONDUCT.md) kami. Dengan berpartisipasi, Anda diharapkan mematuhi kode ini.

## Bagaimana Cara Berkontribusi

### 1. Laporkan Bugs

Bug reports sangat membantu! Sebelum membuat laporan bug, periksa [issue list](https://github.com/Sneijderlino/Wifi-Attack-Ghost/issues) untuk menghindari duplikat.

**Ketika membuat bug report, sertakan:**

- Judul deskriptif
- Deskripsi masalah yang jelas
- Langkah-langkah untuk mereproduksi
- Perilaku aktual dan yang diharapkan
- Screenshot jika relevan
- Informasi sistem (OS, versi kernel, wireless adapter)

**Contoh Bug Report:**

```markdown
**Title**: airodump-ng tidak menampilkan SSID dengan karakter spesial

**Description**: Ketika melakukan scanning pada WiFi dengan SSID mengandung
emoji atau karakter UTF-8, SSID tidak ditampilkan dengan benar.

**Steps to Reproduce**:

1. Jalankan Wifi-Attack.sh
2. Pilih [01] NETWORK ANALYSIS
3. Tunggu scanning selesai

**Expected Behavior**: SSID ditampilkan dengan benar

**Actual Behavior**: SSID menunjukkan character corrupt

**System Info**:

- OS: Ubuntu 22.04 LTS
- Kernel: 5.15.0-56-generic
- Adapter: TP-Link TL-WN722N
```

### 2. Buat Fork dan Branch

```bash
# 1. Fork repository ke akun GitHub Anda

# 2. Clone fork lokal Anda
git clone https://github.com/YOUR_USERNAME/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# 3. Remote ke upstream
git remote add upstream https://github.com/Sneijderlino/Wifi-Attack-Ghost.git

# 4. Buat branch untuk fitur/fix
git checkout -b feature/deskripsi-fitur
# atau
git checkout -b fix/nomor-issue-deskripsi
```

**Konvensi Nama Branch:**

- `feature/nama-fitur` - untuk fitur baru
- `fix/nomor-issue-deskripsi` - untuk bug fix
- `docs/topik` - untuk dokumentasi
- `refactor/area` - untuk refactoring kode

### 3. Modifikasi Kode

**Pastikan untuk:**

- Mengikuti [Panduan Gaya Kode](#panduan-gaya-kode)
- Menambahkan komentar untuk logika kompleks
- Testing perubahan Anda secara menyeluruh
- Tidak mengubah dependencies tanpa diskusi

### 4. Commit dan Push

```bash
# Lihat perubahan
git status
git diff

# Stage perubahan
git add .

# Commit dengan pesan deskriptif
git commit -m "feat: deskripsi singkat perubahan

Penjelasan lebih detail tentang perubahan ini.
- Point 1
- Point 2

Fixes #123"

# Push ke branch Anda
git push origin feature/deskripsi-fitur
```

**Format Commit Message:**

```
<type>: <subject>

<body>

<footer>
```

**Types:**

- `feat`: Fitur baru
- `fix`: Bug fix
- `docs`: Dokumentasi
- `style`: Formatting, semicolon, dll
- `refactor`: Refactoring kode
- `perf`: Performance improvement
- `test`: Testing
- `chore`: Build tools, dependencies

## Proses Pull Request

### 1. Buat Pull Request

- Berikan judul deskriptif: `feat: add beacon ghosting on channel 13`
- Lingkkan ke issue yang relevan: `Fixes #123`
- Jelaskan perubahan yang dibuat
- Sertakan screenshot jika UI berubah

**Template PR (Gunakan ini):**

```markdown
## Deskripsi

Jelaskan perubahan yang dibuat.

## Terkait Issue

Fixes #(issue number)

## Tipe Perubahan

- [ ] Bug fix
- [ ] Fitur baru
- [ ] Breaking change
- [ ] Dokumentasi update

## Testing

Jelaskan testing yang sudah dilakukan:

- [ ] Tested pada Linux Ubuntu 22.04
- [ ] Tested pada Termux
- [ ] Monitor mode verified
- [ ] Error handling checked

## Checklist

- [ ] Kode mengikuti style guide proyek
- [ ] Documentation updated
- [ ] Tidak ada peringatan baru
- [ ] Testing lokal passed
```

### 2. Review Proses

- Maintainer akan review PR Anda
- Mungkin ada permintaan untuk perubahan
- Setelah approval, PR akan di-merge

### 3. Setelah Merge

Branch Anda dapat dihapus:

```bash
# Hapus branch lokal
git branch -d feature/deskripsi-fitur

# Hapus branch remote
git push origin --delete feature/deskripsi-fitur

# Update fork Anda
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

## Panduan Gaya Kode

### Bash Script Style Guide

#### 1. Shebang dan Header

```bash
#!/bin/bash

# Script: Nama Script
# Author: Your Name
# Date: YYYY-MM-DD
# Description: Deskripsi yang jelas tentang fungsi script
```

#### 2. Variabel

```bash
# CONSTANTS dalam UPPERCASE dengan underscore
RED='\033[0;31m'
IFACE="wlan0mon"
TEMP_FILE="/tmp/wifi_scan_final"

# Variabel lokal dalam lowercase
target_bssid="AA:BB:CC:DD:EE:FF"
packet_count=300
```

#### 3. Fungsi

```bash
# Nama fungsi deskriptif, snake_case
show_banner() {
    # Komentar untuk fungsi kompleks
    echo "Banner content"
}

# Parameter dengan prefix jika global
attack_deauth() {
    local bssid=$1
    local channel=$2
    local packets=$3

    # Validasi input
    if [[ -z "$bssid" ]] || [[ -z "$channel" ]]; then
        echo "Error: Missing parameters"
        return 1
    fi

    # Logika fungsi
    sudo mdk4 "$IFACE" d -B "$bssid" -c "$channel" -s "$packets"
}
```

#### 4. Quoting dan Expansion

```bash
# ✅ BAIK: Quote variables
sudo airmon-ng start "$IFACE"
echo "$variable"

# ❌ BURUK: Unquoted variables
sudo airmon-ng start $IFACE
echo $variable
```

#### 5. Error Handling

```bash
# ✅ BAIK: Check return codes
if ! sudo mdk4 "$IFACE" d -B "$bssid"; then
    echo "Error: Attack failed" >&2
    return 1
fi

# ✅ BAIK: Trap errors
trap "cleanup; exit" SIGINT SIGTERM
```

#### 6. Comments

```bash
# Satu baris untuk logic sederhana
echo "Starting attack"

# Multi-line untuk logika kompleks
# Ini adalah fungsi untuk mengirim deauth frames
# ke multiple targets secara bersamaan dengan
# kontrol rate yang adjustable per target
complex_logic() {
    :
}
```

#### 7. Indentation dan Spacing

```bash
# Gunakan 4 spaces (bukan tabs)
if [[ condition ]]; then
    do_something
    if [[ nested ]]; then
        do_nested_thing
    fi
fi

# Spacing di sekitar operators
variable=$((count + 1))
```

## Pelaporan Bug

Gunakan [GitHub Issues](https://github.com/Sneijderlino/Wifi-Attack-Ghost/issues) untuk melaporkan bug.

**Kriteria PR Penerimaan:**

- ✅ Mengikuti panduan gaya kode
- ✅ Tidak mengintroduksi breaking changes
- ✅ Kode sudah ditest
- ✅ Dokumentasi updated
- ✅ Commit message jelas

## Saran Fitur

Punya ide untuk fitur baru? Buat [GitHub Discussion](https://github.com/Sneijderlino/Wifi-Attack-Ghost/discussions) terlebih dahulu untuk mendiskusikan apakah fitur ini sesuai dengan visi proyek.

**Sertakan:**

- Use case Anda
- Implementasi yang mungkin
- Potensi masalah

## Lisensi

Dengan berkontribusi pada proyek ini, Anda setuju bahwa kontribusi Anda akan dilisensikan di bawah GNU General Public License v3.0.

---

**Terima kasih atas kontribusi Anda! 🎉**

Pertanyaan? Hubungi kami di [GitHub Discussions](https://github.com/Sneijderlino/Wifi-Attack-Ghost/discussions)
