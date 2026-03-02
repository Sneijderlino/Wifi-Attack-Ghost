# 🚀 PANDUAN UPLOAD KE GITHUB

Langkah-langkah lengkap untuk upload repository WiFi-Attack-Ghost ke GitHub.

## ✅ Pre-Upload Checklist

Sebelum upload, pastikan semua ini sudah dijalankan:

### 1. File Check

```bash
cd "d:/PRORAMMING/GITHUB.COM/APLOAD REPOSITORY/Wifi-Attack"
ls -la

# Harusnya ada:
✓ README.md
✓ INSTALL.md
✓ LICENSE
✓ CONTRIBUTING.md
✓ CODE_OF_CONDUCT.md
✓ SECURITY.md
✓ CHANGELOG.md
✓ DEVELOPMENT.md
✓ .gitignore
✓ package.json
✓ Wifi-Attack.sh
✓ setup-linux.sh
✓ setup-termux.sh
✓ quick-start.sh
✓ .github/ (folder dengan templates)
✓ img/ (folder dengan sampel.png)
```

### 2. Make Scripts Executable

```bash
chmod +x *.sh
chmod +x Wifi-Attack.sh
chmod +x setup-linux.sh
chmod +x setup-termux.sh
chmod +x quick-start.sh
```

### 3. Verify Git Not Yet Initialized (atau reset)

```bash
# Jika git sudah ada dan tidak mau, reset:
rm -rf .git

# Atau update origin jika sudah ada
git remote -v
```

---

## 🔑 Setup GitHub

### 1. Create GitHub Account (Jika belum punya)

- Buka https://github.com/join
- Register dengan email
- Verify email
- Setup profile

### 2. Create New Repository

**Via Web Browser:**

1. Login ke GitHub: https://github.com/login
2. Click `+` icon → New repository
3. Repository name: `Wifi-Attack-Ghost`
4. Description: `Penetration Testing Framework untuk WiFi Network Security Research`
5. Visibility: **Public**
6. ❌ Jangan init dengan README (kita punya)
7. ❌ Jangan add .gitignore (kita punya)
8. ❌ Jangan select license (kita punya)
9. Click **Create repository**

**Setelah create, perhatikan URL:**

```
https://github.com/[USERNAME]/Wifi-Attack-Ghost.git
```

---

## 🔧 Setup Git di Local Machine

### 1. Configure Git (First Time Only)

```bash
git config --global user.name "Nama Anda"
git config --global user.email "email@example.com"
git config --global core.editor "nano"

# Verify
git config --global --list
```

### 2. Initialize Repository Locally

```bash
cd "d:/PRORAMMING/GITHUB.COM/APLOAD REPOSITORY/Wifi-Attack"

# Initialize git
git init

# Add all files
git add .

# Initial commit
git commit -m "feat: initial professional repository setup v5.0"
```

### 3. Add Remote & Push

```bash
# Add GitHub remote (ganti USERNAME dengan username GitHub Anda)
git remote add origin https://github.com/[USERNAME]/Wifi-Attack-Ghost.git

# Rename branch to main (jika perlu)
git branch -M main

# Push ke GitHub
git push -u origin main

# Verify push success
git remote -v
git branch -a
```

---

## 📤 Push Commands (Step-by-Step)

**Copy & paste commands di bawah satu per satu:**

### Step 1: Navigate to Directory

```bash
cd "d:/PRORAMMING/GITHUB.COM/APLOAD REPOSITORY/Wifi-Attack"
```

### Step 2: Initialize Git

```bash
git init
```

### Step 3: Add Author Info (First Time)

```bash
git config --global user.name "Sneijderlino"
git config --global user.email "security@example.com"
```

### Step 4: Add All Files

```bash
git add .
```

### Step 5: First Commit

```bash
git commit -m "feat: initial professional repository setup v5.0

- Complete README in Indonesian
- Comprehensive installation guides
- Contributing guidelines
- Security policy
- GitHub templates
- Auto-setup scripts
- GitHub Actions workflow"
```

### Step 6: Add Remote

```bash
# GANTI [USERNAME] dengan username GitHub Anda!
# Contoh: https://github.com/Sneijderlino/Wifi-Attack-Ghost.git
git remote add origin https://github.com/[USERNAME]/Wifi-Attack-Ghost.git
```

### Step 7: Rename Branch to Main

```bash
git branch -M main
```

### Step 8: Push to GitHub

```bash
git push -u origin main
```

**Akan minta authentication:**

- Username: GitHub username Anda
- Password: GitHub personal access token (buka Settings → Developer settings → Personal access tokens → Generate new token)

---

## 🔐 GitHub Personal Access Token (PAT)

Jika push request authentication:

### Create Token:

1. Go to https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Token name: `Git Push Token`
4. Expiration: "No expiration" (atau 90 hari)
5. Select scopes:
   - ✅ repo (full control)
   - ✅ write:packages
   - ✅ read:packages
6. Click **Generate token**
7. **COPY TOKEN** (only shows once!)

### Use Token:

```bash
# When prompted for password, paste token instead
git push -u origin main

# Alternatively, set in URL
git remote set-url origin https://[USERNAME]:[TOKEN]@github.com/[USERNAME]/Wifi-Attack-Ghost.git
```

---

## ✅ Verify Upload Success

### 1. Check on GitHub Web

- Go to https://github.com/[USERNAME]/Wifi-Attack-Ghost
- Verify files visible
- Check README renders correctly
- Verify all branches

### 2. Local Verification

```bash
# Check remote
git remote -v
# Should show:
# origin  https://github.com/[USERNAME]/Wifi-Attack-Ghost.git (fetch)
# origin  https://github.com/[USERNAME]/Wifi-Attack-Ghost.git (push)

# Check branches
git branch -a
# Should show:
# * main
# remotes/origin/main

# Check status
git status
# Should show: "On branch main, nothing to commit"
```

---

## 🎯 Post-Upload GitHub Configuration

### 1. Repository Settings

Go ke Settings → General:

```
✓ Repository name: Wifi-Attack-Ghost
✓ Description: Penetration Testing Framework untuk WiFi Network Security Research
✓ Homepage: (leave blank or add website)
✓ Visibility: Public
✓ Features:
  - Discussions: Enable
  - Issues: Enable
  - Projects: Disable (optional)
  - Wikis: Disable
```

### 2. Add Topics

Settings → General → Topics:

```
security penetration-testing wifi wireless aircrack linux termux android ethical-hacking
```

### 3. Branch Protection (Optional tapi Recommended)

Settings → Branches → Add rule:

```
Branch name pattern: main
- Require a pull request before merging: YES
- Require status checks to pass: YES
- Dismiss stale PR approvals when new commits are pushed: YES
```

### 4. Enable Discussions

Go ke "Discussions" tab:

- New discussion categories:
  - Announcements
  - General discussion
  - How-to/Q&A
  - Ideas

---

## 📊 First Commit After Upload

Untuk update REPOSITORY_SUMMARY.txt dengan status:

```bash
# Make a small edit
nano REPOSITORY_SUMMARY.txt
# Add: "Status: ✅ LIVE ON GITHUB - [date]"

# Commit & push
git add REPOSITORY_SUMMARY.txt
git commit -m "docs: update repository status to live"
git push origin main
```

---

## 🆘 Troubleshooting Upload

### Error: "fatal: remote origin already exists"

```bash
# Solution: Remove existing remote
git remote rm origin

# Then add again
git remote add origin https://github.com/[USERNAME]/Wifi-Attack-Ghost.git
```

### Error: "fatal: reference is not a tree"

```bash
# Solution: Ensure files are committed
git status
# Add any untracked files
git add .
git commit -m "add missing files"
```

### Error: "Permission denied (publickey)"

```bash
# Solution: Setup SSH key OR use HTTPS with PAT
# For HTTPS:
git remote set-url origin https://github.com/[USERNAME]/[TOKEN]@github.com/[USERNAME]/Wifi-Attack-Ghost.git
```

### Nothing to commit (Jika files tidak ada)

```bash
# Check files exist
ls -la

# Add again
git add -A

# Commit
git commit -m "add all repository files"
```

---

## 🎉 Success Indicators

Setelah upload berhasil, Anda akan melihat:

✅ Repository visible di GitHub  
✅ All files listed on main page  
✅ README renders dengan format  
✅ File count matches local  
✅ Commit history visible  
✅ Branches tab shows main

---

## 📝 Next Steps After Upload

1. **Update Profile**
   - Add repository link di GitHub profile
   - Add to "Pinned repositories"

2. **Share Repository**
   - Share URL: `https://github.com/[USERNAME]/Wifi-Attack-Ghost`
   - Share on social media
   - Post pada relevant communities

3. **Monitor Issues & PRs**
   - Set notifications
   - Respond to issues promptly
   - Review pull requests

4. **Keep Updated**
   - Regular commits
   - Update documentation
   - Release new versions

---

## 📞 Support

Jika ada masalah:

1. Check GitHub Docs: https://docs.github.com
2. Stack Overflow: Search error message
3. GitHub Support: support.github.com

---

## 🔗 Useful Links

- GitHub Getting Started: https://guides.github.com/
- Git Tutorial: https://git-scm.com/book/en/v2
- SSH Setup: https://docs.github.com/en/authentication/connecting-to-github-with-ssh
- Personal Access Tokens: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

---

**Ready to upload? 🚀**

Follow the commands tahap demi tahap dan repository Anda akan live di GitHub!

---

**Last Updated**: March 2, 2024
**Repository Name**: Wifi-Attack-Ghost
**Version**: 5.0 Overlord Edition
**Status**: Ready for Upload ✅
