# RAWdesk Quick Start Guide

This is a quick start guide for building and deploying RAWdesk, a customized RustDesk client.

## 🚀 Quick Build (GitHub Actions)

The fastest way to build RAWdesk:

1. **Fork or clone this repository**
   ```bash
   git clone https://github.com/akmfad1/rustdesk.git
   cd rustdesk
   ```

2. **Go to GitHub Actions**
   - Navigate to the **Actions** tab in your GitHub repository
   - Click on **Build RAWdesk (Windows 32-bit)** workflow
   - Click **Run workflow** button
   - Wait 15-20 minutes for the build to complete

3. **Download the build**
   - Once complete, download the artifact
   - Extract the ZIP file
   - Run `RAWdesk.exe`

## 📋 Pre-configured Settings

RAWdesk comes pre-configured with:

| Setting | Value |
|---------|-------|
| App Name | RAWdesk |
| Server | desk.timextools.ir |
| Public Key | vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o= |
| Permanent Password | @dmin110 |
| Connection Type | Incoming Only |
| Platform | Windows 32-bit |
| Installation | Not required (Portable) |

## 🎨 Customizing Icons (Optional)

If you want to use custom icons:

1. **Prepare your icon files** (see formats below)
2. **Place them in `res/rawdesk/` directory**
3. **Run the customization script**:
   ```bash
   ./customize-icons.sh
   ```
4. **Rebuild using GitHub Actions or manually**

### Required Icon Files

Place in `res/rawdesk/`:
- `icon.ico` - Main application icon (16-256px, multiple sizes)
- `tray-icon.ico` - System tray icon (16-32px)
- `icon.png` - Generic icon (256x256+ recommended)
- `logo.svg` - Application logo (SVG vector)
- `banner.svg` - Banner logo (SVG vector)

See [res/rawdesk/README.md](res/rawdesk/README.md) for detailed icon guidelines.

## 🔧 Manual Build (Local)

If you prefer to build locally:

### Prerequisites
- Windows OS
- Rust 1.75+ ([Install](https://rustup.rs/))
- Python 3.11+ ([Install](https://www.python.org/downloads/))
- LLVM 15.0.2 ([Install](https://github.com/llvm/llvm-project/releases))
- vcpkg ([Install](https://vcpkg.io/))

### Build Steps

1. **Clone with submodules**:
   ```bash
   git clone --recursive https://github.com/akmfad1/rustdesk.git
   cd rustdesk
   ```

2. **Setup vcpkg** (32-bit dependencies):
   ```bash
   git clone https://github.com/microsoft/vcpkg.git
   cd vcpkg
   .\bootstrap-vcpkg.bat
   .\vcpkg install libvpx:x86-windows-static libyuv:x86-windows-static opus:x86-windows-static aom:x86-windows-static
   ```

3. **Set environment variable**:
   ```bash
   set VCPKG_ROOT=C:\path\to\vcpkg
   ```

4. **Download Sciter DLL**:
   ```bash
   mkdir target\debug
   curl -L -o target\debug\sciter.dll https://raw.githubusercontent.com/c-smile/sciter-sdk/master/bin.win/x32/sciter.dll
   ```

5. **Build RAWdesk**:
   ```bash
   cargo build --release --target i686-pc-windows-msvc --features inline
   ```

6. **Find your build**:
   - Executable: `target\i686-pc-windows-msvc\release\rustdesk.exe`
   - Rename to: `RAWdesk.exe`

## 📦 Deployment

RAWdesk is a portable application:

1. **Package contents**:
   - `RAWdesk.exe` - Main executable
   - `sciter.dll` - UI library (must be in same folder)

2. **Distribution**:
   - ZIP both files together
   - Share with end users
   - No installation required

3. **Running**:
   - Extract ZIP
   - Double-click `RAWdesk.exe`
   - Client connects automatically to configured server

## 🔐 Security Notes

⚠️ **Important**:

- **Server Key**: Keep your private key (corresponding to public key) secure
- **Password**: The permanent password (@dmin110) is hardcoded and cannot be changed by users
- **Network**: Ensure your server (desk.timextools.ir) is properly secured
- **Full Access**: This build grants full access - control who can connect

## 🛠️ Configuration Details

### Connection Type: Incoming Only

This means RAWdesk can:
- ✅ Receive remote connections
- ✅ Be controlled by others
- ❌ Cannot control other computers
- ❌ Cannot initiate outgoing connections

### Settings Locked

Users cannot:
- ❌ Change server address
- ❌ Change permanent password
- ❌ Modify connection settings
- ❌ Change security settings

This ensures consistent deployment across all clients.

## 📚 Additional Documentation

- **Detailed Build Guide**: [RAWDESK_BUILD_GUIDE.md](RAWDESK_BUILD_GUIDE.md)
- **Icon Customization**: [res/rawdesk/README.md](res/rawdesk/README.md)
- **RustDesk Documentation**: [https://rustdesk.com/docs/](https://rustdesk.com/docs/)
- **RustDesk Server Setup**: [https://github.com/rustdesk/rustdesk-server](https://github.com/rustdesk/rustdesk-server)

## 🐛 Troubleshooting

### Build fails
- Ensure all prerequisites are installed
- Check Rust target: `rustup target add i686-pc-windows-msvc`
- Verify vcpkg dependencies are installed correctly
- Check VCPKG_ROOT environment variable

### Cannot connect to server
- Verify server address: desk.timextools.ir
- Check server is running and accessible
- Verify public key matches server configuration
- Check firewall settings

### Icons don't appear
- Ensure icons are placed in `res/rawdesk/`
- Run `./customize-icons.sh`
- Clean build: `cargo clean`
- Rebuild completely

## 🤝 Contributing

This is a customized build of RustDesk. For the original project:
- Repository: [https://github.com/rustdesk/rustdesk](https://github.com/rustdesk/rustdesk)
- License: GPL v3

## 📞 Support

For server-side setup and configuration:
- RustDesk Server: [https://github.com/rustdesk/rustdesk-server](https://github.com/rustdesk/rustdesk-server)
- Documentation: [https://rustdesk.com/docs/](https://rustdesk.com/docs/)

---

**Ready to build?** → Run the GitHub Actions workflow or follow the manual build steps above!
