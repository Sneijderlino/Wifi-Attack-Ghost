# CHANGELOG

Semua perubahan penting dalam proyek ini akan didokumentasikan di file ini.

Format berdasarkan [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
dan proyek ini mengikuti [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [5.0] - Overlord Edition - 2024-03-02

### Added (Fitur Baru)

- ✨ Interactive menu system dengan ASCII art profesional
- ✨ Deauth attack dengan kontrol packet speed
- ✨ Multi-beacon ghosting untuk wireless spoofing
- ✨ Real-time network scanning dengan airodump-ng
- ✨ SIGINT handler untuk graceful shutdown
- ✨ Color-coded terminal output untuk UX lebih baik
- ✨ Progress bar animation untuk feedback visual

### Changed (Perubahan)

- 🔄 Rebranding ke "WiFi-Attack Ghost" untuk clarity
- 🔄 Interface redesign dengan lebih profesional
- 🔄 Improved error handling dan validation

### Fixed (Bug Fix)

- 🐛 Fixed temporary file cleanup issue
- 🐛 Improved monitor mode detection
- 🐛 Better handling untuk CTRL+C interrupt

### Security

- 🔒 Added root privilege check
- 🔒 Parameter validation untuk input
- 🔒 Secure temp file handling

### Documentation

- 📚 Comprehensive README.md dalam Bahasa Indonesia
- 📚 Setup guide untuk Windows, Linux, Termux
- 📚 Troubleshooting section
- 📚 Contributing guidelines

---

## [4.5] - 2024-02-28

### Added

- Basic WiFi attack functionality
- Monitor mode support

### Known Issues

- Limited error handling
- No user-friendly interface

---

## [4.0] - 2024-02-20

### Initial Release

- Core deauth functionality
- Basic scanning

---

## Format Changelog Entry

```
## [VERSION] - YYYY-MM-DD

### Added (untuk fitur baru)
- ✨ Deskripsi fitur baru

### Changed (untuk perubahan eksisting)
- 🔄 Deskripsi perubahan

### Deprecated (untuk fitur yang akan dihapus)
- ⚠️ Deskripsi deprecation

### Removed (untuk fitur yang dihapus)
- ❌ Deskripsi removal

### Fixed (untuk bug fix)
- 🐛 Deskripsi fix

### Security (untuk security fix)
- 🔒 Deskripsi security fix

### Performance (untuk improvement performa)
- ⚡ Deskripsi improvement
```

---

## Rencana Masa Depan (Roadmap)

### v6.0 (Q2 2024)

- [ ] Web-based dashboard
- [ ] Advanced AI network detection
- [ ] Shodan integration
- [ ] WPA2 auto-crack

### v7.0 (Q4 2024)

- [ ] Mobile app (iOS/Android)
- [ ] Kubernetes support
- [ ] Machine learning features
- [ ] REST API

---

## Cara Melaporkan Perubahan

1. Perubahan harus di-commit dengan pesan yang jelas
2. Setiap release harus update CHANGELOG.md
3. Follow format di atas untuk konsistensi

---

**Terakhir update**: 2024-03-02
**Maintainer**: Sneijderlino
