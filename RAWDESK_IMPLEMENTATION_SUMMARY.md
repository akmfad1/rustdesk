# RAWdesk - Implementation Summary

## Overview

This repository has been configured to build **RAWdesk**, a customized version of RustDesk with pre-configured settings for automatic deployment.

## What Was Implemented

### 1. GitHub Actions Workflow ✅

**File**: `.github/workflows/build-rawdesk.yml`

A complete automated build pipeline that:
- Builds Windows 32-bit executable
- Configures server settings at build time
- Embeds encryption key and credentials
- Sets connection type to "Incoming Only"
- Creates portable build (no installation required)
- Packages as ZIP with all dependencies

### 2. Pre-configured Settings ✅

The following settings are hardcoded into the build:

| Setting | Value | Purpose |
|---------|-------|---------|
| **App Name** | RAWdesk | Client branding |
| **Server Address** | desk.timextools.ir | RustDesk relay server |
| **Public Key** | vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o= | Server authentication |
| **Permanent Password** | @dmin110 | Access password |
| **Connection Type** | Incoming Only | Client can only receive connections |
| **Settings Lock** | Enabled | Users cannot change configuration |
| **Platform** | Windows 32-bit | Target architecture |
| **Build Type** | Portable/Inline | No installation required |

### 3. Icon/Logo Customization System ✅

**Files**:
- `res/rawdesk/` - Directory for custom icons
- `customize-icons.sh` - Automated icon replacement script
- `res/rawdesk/README.md` - Detailed icon creation guide

Supports custom:
- Application icon (icon.ico)
- System tray icon (tray-icon.ico)
- PNG icon (icon.png)
- SVG logo (logo.svg)
- Banner logo (banner.svg)

### 4. Documentation ✅

Created comprehensive documentation:

- **RAWDESK_QUICKSTART.md** - Quick start guide for building and deploying
- **RAWDESK_BUILD_GUIDE.md** - Detailed build and configuration guide
- **res/rawdesk/README.md** - Icon customization guide
- **This file** - Implementation summary

### 5. Build Configuration ✅

Modified configurations:
- `.gitignore` - Exclude build artifacts and custom icons
- Workflow sets `inline` feature for portable build
- Workflow modifies `libs/hbb_common/src/config.rs` at build time

## How It Works

### Build Process Flow

```
1. Trigger GitHub Actions workflow
   ↓
2. Setup build environment (Rust, Python, LLVM, vcpkg)
   ↓
3. Install 32-bit dependencies (libvpx, libyuv, opus, aom)
   ↓
4. Download Sciter UI library (32-bit)
   ↓
5. Modify config.rs with custom settings:
   - Server address
   - Public key
   - App name
   - Incoming-only mode
   - Permanent password
   - Disable settings changes
   ↓
6. Build Rust binary (32-bit, inline mode)
   ↓
7. Package executable + DLL + README
   ↓
8. Upload as GitHub Actions artifact
```

### Configuration Changes Made at Build Time

The workflow modifies `libs/hbb_common/src/config.rs`:

```rust
// Server configuration
pub const RENDEZVOUS_SERVERS: &[&str] = &["desk.timextools.ir"];
pub const RS_PUB_KEY: &str = "vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=";

// App branding
Arc::new(RwLock::new("RAWdesk".to_owned()))

// Connection type
pub fn is_incoming_only() -> bool { true }

// Settings lock
pub fn is_disable_settings() -> bool { true }

// Default password
pub const DEFAULT_PERMANENT_PASSWORD: &str = "@dmin110";
```

## How to Use

### Option 1: Automated Build (Recommended)

1. **Trigger workflow**:
   - Go to **Actions** tab on GitHub
   - Select **Build RAWdesk (Windows 32-bit)**
   - Click **Run workflow**

2. **Wait for build** (15-20 minutes)

3. **Download artifact**:
   - Click on completed workflow run
   - Download `RAWdesk-windows-x86-portable` artifact

4. **Deploy**:
   - Extract ZIP file
   - Distribute `RAWdesk.exe` + `sciter.dll`
   - Users run `RAWdesk.exe` (no installation)

### Option 2: Custom Icons First

1. **Create your icons** (see `res/rawdesk/README.md`)

2. **Place in `res/rawdesk/`**:
   ```
   res/rawdesk/
   ├── icon.ico
   ├── tray-icon.ico
   ├── icon.png
   ├── logo.svg
   └── banner.svg
   ```

3. **Run customization script**:
   ```bash
   ./customize-icons.sh
   ```

4. **Commit and push changes**

5. **Run GitHub Actions workflow**

### Option 3: Manual Build

See `RAWDESK_BUILD_GUIDE.md` for detailed manual build instructions.

## Security Considerations

### ⚠️ Important Security Notes

1. **Hardcoded Credentials**:
   - Password is visible in source code
   - Acceptable for controlled deployments
   - Not recommended for public distribution

2. **Private Key Security**:
   - Keep the private key (matching public key) secure
   - Private key is NOT in this repository
   - Anyone with private key can decrypt communications

3. **Server Security**:
   - Ensure `desk.timextools.ir` is properly secured
   - Server must have corresponding private key
   - Keep server software updated

4. **Full Access Mode**:
   - This build has full access permissions
   - Control who can connect to clients
   - Monitor server logs for unauthorized access

5. **Incoming Only**:
   - ✅ More secure: clients can't initiate connections
   - ✅ Better for controlled support scenarios
   - ❌ Can't use for outbound remote control

## File Structure

```
rustdesk/
├── .github/
│   └── workflows/
│       └── build-rawdesk.yml          # Main build workflow
├── res/
│   ├── rawdesk/
│   │   └── README.md                  # Icon customization guide
│   ├── icon.ico                       # Default icons
│   ├── tray-icon.ico
│   └── ...
├── libs/
│   └── hbb_common/
│       └── src/
│           └── config.rs              # Modified at build time
├── RAWDESK_QUICKSTART.md              # Quick start guide
├── RAWDESK_BUILD_GUIDE.md             # Detailed build guide
├── RAWDESK_IMPLEMENTATION_SUMMARY.md  # This file
├── customize-icons.sh                 # Icon replacement script
└── .gitignore                         # Excludes build artifacts
```

## Deployment Checklist

### For Administrator

- [ ] Server `desk.timextools.ir` is running rustdesk-server
- [ ] Server has private key matching `vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=`
- [ ] Server is accessible from client networks
- [ ] Firewall rules allow RustDesk ports (typically 21115-21119)
- [ ] (Optional) Custom icons placed in `res/rawdesk/`
- [ ] GitHub Actions workflow executed
- [ ] Artifact downloaded and tested

### For End Users

- [ ] Extract ZIP file
- [ ] Copy `RAWdesk.exe` and `sciter.dll` to desired location
- [ ] Run `RAWdesk.exe`
- [ ] Accept any Windows security prompts
- [ ] Verify connection to server
- [ ] Share your ID with support team for remote access

## Troubleshooting

### Build Issues

**Problem**: Workflow fails at dependency installation
- **Solution**: GitHub may have network issues, re-run workflow

**Problem**: Submodules not initialized
- **Solution**: Workflow uses `submodules: recursive`, should auto-fix

**Problem**: YAML syntax error
- **Solution**: Validate with `python3 -c "import yaml; yaml.safe_load(open('.github/workflows/build-rawdesk.yml'))"`

### Runtime Issues

**Problem**: Cannot connect to server
- **Check**: Server is running and accessible
- **Check**: Firewall allows connections
- **Check**: Public key matches server configuration

**Problem**: Icons don't appear
- **Check**: Icons were placed in `res/rawdesk/` before build
- **Check**: `customize-icons.sh` was run
- **Check**: Workflow was triggered AFTER icon customization

**Problem**: "Installation required" message
- **Check**: `inline` feature is enabled in Cargo.toml
- **Check**: Workflow step "Configure Cargo.toml for Inline Build" succeeded

## Next Steps

### Immediate Actions

1. **Test the build**:
   - Run GitHub Actions workflow
   - Download artifact
   - Test on Windows 32-bit machine

2. **Verify server connection**:
   - Ensure server is running
   - Test connection from client
   - Verify password works

3. **Deploy to users**:
   - Package for distribution
   - Provide simple instructions
   - Include README.txt from build

### Optional Enhancements

1. **Custom Icons**:
   - Design RAWdesk branded icons
   - Follow guidelines in `res/rawdesk/README.md`
   - Rebuild with custom branding

2. **Additional Builds**:
   - Create similar workflow for 64-bit
   - Add Linux/Mac builds if needed
   - Set up automated releases

3. **Enhanced Security**:
   - Consider certificate signing
   - Add virus scanner exceptions documentation
   - Document firewall configuration

## Support Resources

- **RustDesk Documentation**: https://rustdesk.com/docs/
- **RustDesk Server**: https://github.com/rustdesk/rustdesk-server
- **RustDesk Client**: https://github.com/rustdesk/rustdesk
- **Build Issues**: Check workflow logs in GitHub Actions

## License

Based on RustDesk, licensed under GPL v3.

---

## Summary

✅ **Complete RAWdesk customization implemented**

All requirements from the original request have been fulfilled:
- ✅ Client name: RAWdesk
- ✅ Server: desk.timextools.ir
- ✅ Public key: vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=
- ✅ Permanent password: @dmin110
- ✅ Windows 32-bit build
- ✅ Full access enabled
- ✅ No installation required (portable)
- ✅ Connection type: Incoming Only
- ✅ Custom icon/logo support

**Ready to build!** → Go to Actions tab and run the workflow.
