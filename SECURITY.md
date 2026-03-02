# Security Policy

## Melaporkan Kerentanan

**Kami sangat serius tentang security.** Jika Anda menemukan kerentanan keamanan, JANGAN membuka public issue.

### Responsible Disclosure

Kami mengikuti praktik responsible disclosure dan berkomitmen untuk bekerja dengan peneliti keamanan untuk memahami dan menyelesaikan masalah keamanan dengan segera.

### Cara Melaporkan

1. **Email**: Kirim laporan ke `security@example.com`
2. **Judul Email**: `[SECURITY] Deskripsi singkat kerentanan`
3. **Konten Laporan**: Sertakan:
   - Deskripsi detail kerentanan
   - Langkah-langkah untuk mereproduksi
   - Proof of Concept (jika memungkinkan, tanpa exploit berbahaya)
   - Impact assessment
   - Saran perbaikan (opsional)

### Contoh Laporan Keamanan

```
Subject: [SECURITY] Command Injection pada mdk4 interface parsing

Description:
Variabel IFACE tidak di-validate sebelum digunakan dalam command mdk4.
User input atau nilai environment bisa mengeksekusi arbitrary commands.

Steps to Reproduce:
1. Set IFACE="wlan0 && rm -rf /"
2. Jalankan script
3. Command berbahaya akan dieksekusi

Impact: Remote Code Execution dengan privilege root

Suggested Fix:
Validate dan sanitize input IFACE menggunakan whitelist pattern
```

### Timeline Perbaikan

| Stage                        | Timeline               |
| ---------------------------- | ---------------------- |
| **Report diterima**          | Dalam 24-48 jam        |
| **Investigasi & Assessment** | 7 hari                 |
| **Fix development**          | 14 hari                |
| **Testing & QA**             | 7 hari                 |
| **Security update release**  | Dalam 30 hari          |
| **Public disclosure**        | Setelah patch tersedia |

### Kerahasiaan

Kami akan menjaga kerahasiaan informasi tentang kerentanan sampai patch dirilis. Kami meminta Anda juga menjaga kerahasiaan sampai saat itu.

### Bug Bounty

Saat ini kami **tidak menawarkan program bug bounty**, namun kami akan memberikan:

- Credit dalam security advisory
- Listing di [SECURITY.md](SECURITY.md) sebagai "Reported by"
- Penghargaan dalam bentuk recognition lainnya

---

## Dukungan Versi

| Versi              | Status      | Dukungan Sampai |
| ------------------ | ----------- | --------------- |
| 5.0 (Overlord)     | **Aktif**   | Ongoing         |
| 4.x                | End of Life | 2024-06-01      |
| 3.x dan lebih lama | unsupported | ❌              |

Hanya versi terbaru yang akan menerima security patches.

---

## Security Best Practices untuk Pengguna

### Sebelum Menggunakan Tool Ini:

1. **Dapatkan Izin Tertulis**
   - Dokumentasikan consent dari pemilik network
   - Simpan untuk audit trail

2. **Isolasi Environment**
   - Gunakan di lab atau VM yang terisolasi
   - Jangan jalankan di production network tanpa review

3. **Monitoring**
   - Log semua aktivitas
   - Monitor impact terhadap network
   - Siap untuk menghentikan jika ada masalah

4. **Knowledge**
   - Pahami apa yang dilakukan setiap command
   - Pelajari teori wireless networking
   - Ikuti training keamanan professional

### Secure Operation

```bash
# ✅ BAIK: Run dalam isolated VM
sudo bash Wifi-Attack.sh

# ❌ BURUK: Modification tanpa validation
sed -i 's/mdk4/rm -rf \//g' Wifi-Attack.sh

# ✅ BAIK: Backup sebelum modifikasi
cp Wifi-Attack.sh Wifi-Attack.sh.backup
```

---

## Vulnerability Classes

Kerentanan keamanan dalam proyek ini termasuk tapi tidak terbatas pada:

- **Code Injection**: Command injection, script injection
- **Privilege Escalation**: Bypass privilege checks
- **Denial of Service**: Crash or hang the application
- **Unauthorized Access**: Access data/functions tanpa izin
- **Cryptographic Weaknesses**: Weak crypto implementations
- **Malicious Dependencies**: Compromised or unsafe dependencies

---

## PGP Key (Untuk Enkripsi Laporan)

Jika laporan Anda sangat sensitif, Anda dapat mengenkripsi dengan PGP key kami:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

[PGP Key akan ditambahkan di sini]

-----END PGP PUBLIC KEY BLOCK-----
```

Untuk versi terbaru, hubungi: security@example.com

---

## Security Advisories Terdahulu

Akan dipublikasikan setelah patch dirilis.

---

**Terima kasih atas komitmen Anda terhadap security communitas! 🔐**

Pertanyaan? Email: security@example.com
