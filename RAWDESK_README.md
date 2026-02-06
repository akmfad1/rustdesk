# 🎯 RAWdesk Custom Build

> **Note**: This repository has been configured to build **RAWdesk**, a customized version of RustDesk.

## ⚡ Quick Start

### Build RAWdesk Now:

1. **Go to Actions**: Click the [Actions tab](../../actions)
2. **Select Workflow**: "Build RAWdesk (Windows 32-bit)"
3. **Run**: Click "Run workflow" button
4. **Download**: Wait 15-20 minutes, then download the artifact

That's it! You'll get a portable RAWdesk.exe ready to deploy.

---

## 📖 Documentation

All RAWdesk documentation is available in this repository:

### 🚀 Getting Started
- **[HOW_TO_USE_RAWDESK.md](HOW_TO_USE_RAWDESK.md)** - Complete usage guide (START HERE!)
- **[RAWDESK_QUICKSTART.md](RAWDESK_QUICKSTART.md)** - Quick start guide

### 📚 Detailed Guides
- **[RAWDESK_BUILD_GUIDE.md](RAWDESK_BUILD_GUIDE.md)** - Build instructions
- **[RAWDESK_IMPLEMENTATION_SUMMARY.md](RAWDESK_IMPLEMENTATION_SUMMARY.md)** - Technical details

### 🌍 Languages
- **[RAWDESK_PERSIAN_README.md](RAWDESK_PERSIAN_README.md)** - راهنمای فارسی

### 🎨 Customization
- **[res/rawdesk/README.md](res/rawdesk/README.md)** - Icon & logo customization
- **[customize-icons.sh](customize-icons.sh)** - Icon replacement tool

---

## ⚙️ Pre-configured Settings

RAWdesk is built with these settings:

| Setting | Value |
|---------|-------|
| **App Name** | RAWdesk |
| **Server** | desk.timextools.ir |
| **Public Key** | vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o= |
| **Password** | @dmin110 |
| **Platform** | Windows 32-bit |
| **Type** | Incoming Only (no installation) |
| **Settings** | Locked (users cannot change) |

---

## 🔗 Workflow

The build workflow is located at:
**[.github/workflows/build-rawdesk.yml](.github/workflows/build-rawdesk.yml)**

It automatically:
- ✅ Builds Windows 32-bit executable
- ✅ Configures all custom settings
- ✅ Creates portable package (no installation)
- ✅ Packages with all dependencies

---

## 📦 What You Get

After building, you'll receive:
- `RAWdesk.exe` - Main application
- `sciter.dll` - Required library
- `README.txt` - Configuration info

**No installation required** - just run RAWdesk.exe!

---

## 🆘 Need Help?

- **Read**: [HOW_TO_USE_RAWDESK.md](HOW_TO_USE_RAWDESK.md)
- **Persian/فارسی**: [RAWDESK_PERSIAN_README.md](RAWDESK_PERSIAN_README.md)
- **Issues**: Open an issue in this repository

---

## 📋 Original RustDesk

This is a customized build of RustDesk. For the original RustDesk:
- Project: [rustdesk/rustdesk](https://github.com/rustdesk/rustdesk)
- Website: [rustdesk.com](https://rustdesk.com)
- Docs: [rustdesk.com/docs](https://rustdesk.com/docs)

---

**Ready to build?** → [Go to Actions](../../actions) and run the workflow!
