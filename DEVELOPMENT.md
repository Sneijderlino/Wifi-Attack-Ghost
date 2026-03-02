# Development Guide

Panduan untuk developer yang ingin berkontribusi atau mencustomisasi WiFi-Attack Ghost.

## 📋 Daftar Isi

- [Code Structure](#code-structure)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Debugging](#debugging)
- [Git Workflow](#git-workflow)

---

## 🏗️ Code Structure

### File Organization

```
Wifi-Attack-Ghost/
├── Wifi-Attack.sh              # Main script (5.0 version)
├── setup-linux.sh              # Linux dependency installer
├── setup-termux.sh             # Termux / Android setup
├── README.md                   # Indonesian documentation
├── INSTALL.md                  # Installation guide
├── CONTRIBUTING.md             # Contribution guidelines
├── CODE_OF_CONDUCT.md          # Community guidelines
├── SECURITY.md                 # Security policy
├── CHANGELOG.md                # Version history
├── LICENSE                     # GNU GPL v3.0
├── package.json                # Metadata file
├── .gitignore                  # Git ignore rules
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   ├── feature_request.md
│   │   └── question.md
│   └── pull_request_template.md
├── img/
│   └── sampel.png              # Preview image
└── docs/ (future)
    └── technical/
```

### Main Script Structure (Wifi-Attack.sh)

```bash
#!/bin/bash
# Header & Configuration
IFACE="wlan0mon"            # Interface config
TEMP_FILE="/tmp/..."        # Temp files

# Color Definitions
RED='\033...'               # Color codes
WHITE='\033...'

# Status Indicators
SYS="[${L_RED}SYSTEM${NC}]" # Indicators

# Functions
show_banner()               # Display banner
pro_progress()              # Progress animation
home()                      # Main menu
scan_wifi()                 # Scanning logic
after_scan_menu()           # Scan results menu
attack_menu()               # Attack options
post_attack_choice()        # Post-attack menu

# Main Execution
if [ "$EUID" -ne 0 ]; then  # Root check
    exit 1
fi
home                        # Start program
```

---

## 🛠️ Development Setup

### Prerequisites

```bash
# Install development tools
sudo apt install -y \
    git \
    vim \
    shellcheck \        # Bash linter
    shfmt \             # Bash formatter
    nano

# Optional: IDE
sudo apt install -y code    # VS Code
sudo apt install -y gedit   # Text editor
```

### Setup Development Environment

```bash
# 1. Fork & Clone
git clone https://github.com/YOUR_USERNAME/Wifi-Attack-Ghost.git
cd Wifi-Attack-Ghost

# 2. Create development branch
git checkout -b develop

# 3. Create feature branch
git checkout -b feature/your-feature
```

### Code Analysis Tools

```bash
# Check bash syntax
bash -n Wifi-Attack.sh

# Lint bash script
shellcheck Wifi-Attack.sh

# Format bash code
shfmt -i 4 Wifi-Attack.sh

# View potential issues
shellcheck -x Wifi-Attack.sh
```

---

## 📐 Coding Standards

### Bash Style Guide

#### 1. File Header

```bash
#!/bin/bash

# Script: Script Name
# Author: Your Name
# Version: 5.0
# Date: YYYY-MM-DD
# Description: What this script does
```

#### 2. Variable Naming

```bash
# Constants in UPPERCASE
RED='\033[0;31m'
TEMP_FILE="/tmp/wifi_scan"
MAX_ATTEMPTS=5

# Variables in lowercase with underscores
target_bssid="AA:BB:CC:DD:EE:FF"
scan_timeout=30
interface_name="wlan0mon"

# Boolean-like true/false
is_monitoring=true
has_error=false
```

#### 3. Function Template

```bash
# Function with description
# Parameters: param1, param2
# Returns: 0 on success, 1 on error
perform_scan() {
    local interface=$1
    local timeout=$2

    # Input validation
    if [[ -z "$interface" ]] || [[ -z "$timeout" ]]; then
        echo "Error: Missing parameters" >&2
        return 1
    fi

    # Function body
    local result=0

    # Error handling
    if ! command="$interface"; then
        echo "Error: Command failed" >&2
        return 1
    fi

    return $result
}
```

#### 4. Error Handling

```bash
# ✅ GOOD: Check return codes
if ! sudo mdk4 "$IFACE" d -B "$bssid"; then
    echo "Error: Attack failed" >&2
    return 1
fi

# ✅ GOOD: Use set -e untuk strict mode
set -e  # Exit on any error
set -o pipefail  # Pipe error propagation

# ✅ GOOD: Trap cleanup
cleanup() {
    # Cleanup code
    echo "Cleaning up..."
}
trap cleanup EXIT
```

#### 5. Comments

```bash
# Single line comment untuk simple logic
variable="value"

# Multi-line comment untuk complex logic
# Ini adalah fungsi untuk melakukan sesuatu yang kompleks
# dengan multiple steps dan error handling yang
# perlu dijelaskan secara detail
complex_function() {
    :
}
```

### Best Practices

- **Quoting**: Always quote variables: `"$var"` not `$var`
- **Conditionals**: Use `[[ ]]` instead of `[ ]`
- **Arrays**: Use proper array syntax
- **Functions**: Prefer functions over scripts
- **Documentation**: Comment complex logic
- **Testing**: Test all code paths
- **Performance**: Avoid unnecessary processes

---

## 🧪 Testing

### Manual Testing

```bash
# 1. Syntax check
bash -n Wifi-Attack.sh

# 2. Lint check
shellcheck Wifi-Attack.sh

# 3. Run in debug mode
bash -x Wifi-Attack.sh 2>&1 | head -50

# 4. Test specific function
bash -c 'source Wifi-Attack.sh; show_banner'

# 5. Test with different interfaces
IFACE="eth0" bash Wifi-Attack.sh
```

### Testing Checklist

- [ ] Script runs without syntax errors
- [ ] All functions execute correctly
- [ ] Root privilege check works
- [ ] Monitor mode detection works
- [ ] CTRL+C gracefully cleanup
- [ ] Temp files are cleaned
- [ ] Color output displays correctly
- [ ] Error messages are clear

### Platform Testing

```bash
# Test pada berbagai platform:
- [ ] Ubuntu 22.04 LTS
- [ ] Fedora 40
- [ ] Arch Linux
- [ ] Debian 12
- [ ] CentOS 8
- [ ] Termux (Android)
- [ ] WSL2 (Windows)
```

---

## 🐛 Debugging

### Debug Mode

```bash
# Run script dengan verbose output
bash -v Wifi-Attack.sh

# Run dengan xtrace (command execution)
bash -x Wifi-Attack.sh

# Combine both
bash -vx Wifi-Attack.sh 2>&1 | tee debug.log
```

### Debug Functions

```bash
# Add to script untuk debugging
debug() {
    [[ $DEBUG ]] && echo "DEBUG: $*" >&2
}

# Usage
DEBUG=1 bash Wifi-Attack.sh

# In script
debug "Interface: $IFACE"
debug "Target: $target_bssid"
```

### Logging

```bash
# Create log function
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> attack.log
}

# Usage
log_message "Scan started"
log_message "Target found: $bssid"
```

### Common Issues

```bash
# Issue: Variable tidak terdeteksi
# Solution: Check variable scope
perform_function() {
    local variable="value"
}
echo $variable  # Won't work (local scope)

# Issue: Command not found
# Solution: Check PATH dan quoting
"$command" "$arg1"  # Include quotes

# Issue: File permission denied
# Solution: Run dengan sudo jika diperlukan
sudo command --requires-root
```

---

## 📝 Git Workflow

### Branch Strategy

```
main (production)
  ↑
  └─ release branches
develop (development)
  ↑
  ├─ feature/feature-name
  ├─ fix/issue-number
  ├─ docs/topic
  └─ refactor/component
```

### Workflow Example

```bash
# 1. Create feature branch
git checkout -b feature/add-wpa3-support

# 2. Make changes
nano Wifi-Attack.sh
# ... edit file ...

# 3. Stage changes
git add Wifi-Attack.sh

# 4. Commit dengan messaging yang jelas
git commit -m "feat: add WPA3 network detection

- Added WPA3 detection in scan results
- Updated display format to show WPA3 networks
- Tests pass on Ubuntu 22.04"

# 5. Push to fork
git push origin feature/add-wpa3-support

# 6. Create Pull Request pada GitHub
# ...wait for review...

# 7. After merge, cleanup
git checkout develop
git pull upstream develop
git branch -d feature/add-wpa3-support
git push origin --delete feature/add-wpa3-support
```

### Commit Message Format

```
<type>: <subject (50 chars max)>

<body (wrap at 72 chars)>

<footer>

# Example:
feat: add WPA3 network detection in scanning

Implement detection for WPA3 wireless networks in the
scanning module. This allows users to see WPA3 networks
in the network list and provides proper channel info.

- Parse WPA3 beacon frames
- Extract encryption type
- Display in results table

Fixes #123
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting changes
- `refactor`: Code refactoring
- `perf`: Performance improvement
- `test`: Test addition/modification
- `chore`: Build/dependency changes

---

## 📚 Additional Resources

### Learning Resources

- Bash Scripting Guide: https://www.gnu.org/software/bash/manual/
- ShellCheck: https://www.shellcheck.net/
- Google Shell Style Guide: https://google.github.io/styleguide/shellguide.html

### Tools

- VS Code: https://code.visualstudio.com/
- ShellCheck Extension: `timonwong.shellcheck`
- Bash Beautify: `foxundermoon.shell-format`

---

## 🤝 Getting Help

- 📧 Email: security@example.com
- 💬 Discussions: GitHub Discussions
- 🐛 Issues: GitHub Issues

---

**Last Updated**: March 2024 | **Version**: 5.0
