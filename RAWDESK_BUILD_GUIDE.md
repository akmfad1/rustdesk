# RAWdesk Custom Build Configuration

This document explains how to customize and build RAWdesk, a customized version of RustDesk.

## Overview

RAWdesk is configured with the following settings:
- **Server Address**: desk.timextools.ir
- **Public Key**: vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=
- **App Name**: RAWdesk
- **Permanent Password**: @dmin110
- **Connection Type**: Incoming Only (client mode)
- **Platform**: Windows 32-bit
- **Build Type**: Portable (no installation required)
- **Full Access**: Enabled

## Building RAWdesk

### Automatic Build (GitHub Actions)

The easiest way to build RAWdesk is using GitHub Actions:

1. Go to the **Actions** tab in your GitHub repository
2. Select **Build RAWdesk (Windows 32-bit)** workflow
3. Click **Run workflow**
4. Wait for the build to complete (approximately 15-20 minutes)
5. Download the artifact from the workflow run

The artifact will contain:
- `RAWdesk.exe` - The main executable
- `sciter.dll` - Required UI library
- `README.txt` - Configuration information

### Manual Build

If you want to build manually:

1. **Prerequisites**:
   - Rust 1.75 or later
   - Python 3.11
   - LLVM 15.0.2
   - vcpkg with 32-bit libraries

2. **Clone and Setup**:
   ```bash
   git clone https://github.com/akmfad1/rustdesk.git
   cd rustdesk
   git submodule update --init --recursive
   ```

3. **Configure**:
   Edit `libs/hbb_common/src/config.rs` to set your custom values:
   - `RENDEZVOUS_SERVERS`: Your server address
   - `RS_PUB_KEY`: Your public key
   - `APP_NAME`: Your application name

4. **Build**:
   ```bash
   cargo build --release --target i686-pc-windows-msvc --features inline
   ```

## Customizing Icons and Logo

To use your custom icons and logo:

### 1. Replace Icon Files

Replace these files in the `res/` directory with your custom images:

- **res/icon.ico** - Main Windows icon (used for executable)
  - Format: ICO file
  - Recommended sizes: 16x16, 32x32, 48x48, 64x64, 128x128, 256x256
  
- **res/tray-icon.ico** - System tray icon
  - Format: ICO file
  - Recommended sizes: 16x16, 32x32
  
- **res/icon.png** - Generic icon
  - Format: PNG
  - Recommended size: 256x256 or 512x512

- **res/logo.svg** - Main logo (vector)
  - Format: SVG
  - Used in UI

- **res/rustdesk-banner.svg** - Banner/header logo
  - Format: SVG
  - Used in about/splash screens

### 2. Generate Icon Files

If you have a source image, you can generate the required formats:

#### Creating .ico file from PNG (using ImageMagick):
```bash
convert icon-source.png -define icon:auto-resize=256,128,64,48,32,16 res/icon.ico
convert tray-source.png -define icon:auto-resize=32,16 res/tray-icon.ico
```

#### Creating .ico file (using online tools):
- Visit https://convertio.co/png-ico/
- Upload your source image (PNG/JPG)
- Download the .ico file

### 3. Icon Preparation Tips

- **Icon.ico**: Should contain multiple sizes for best display at different resolutions
- **Transparency**: Use transparent backgrounds for icons
- **Colors**: Test icons with both light and dark backgrounds
- **Simplicity**: Keep tray icons simple and recognizable at small sizes

### 4. Rebuild

After replacing icons, rebuild the project:
```bash
cargo build --release --target i686-pc-windows-msvc --features inline
```

The new icons will be embedded in the executable during the build process.

## Configuration Details

### Server Configuration

The server address is hardcoded during build time in `libs/hbb_common/src/config.rs`:

```rust
pub const RENDEZVOUS_SERVERS: &[&str] = &["desk.timextools.ir"];
pub const RS_PUB_KEY: &str = "vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=";
```

### Connection Type

The connection type is set to "Incoming Only" which means:
- ✅ Can receive incoming connections
- ❌ Cannot initiate outgoing connections to other computers
- ✅ Can be controlled remotely
- ❌ Cannot control other computers

This is configured by making `is_incoming_only()` return `true`:

```rust
pub fn is_incoming_only() -> bool {
    true
}
```

### Permanent Password

The permanent password is set to `@dmin110` and is stored as:

```rust
pub const DEFAULT_PERMANENT_PASSWORD: &str = "@dmin110";
```

Users cannot change this password because settings are disabled.

### Security Considerations

⚠️ **Important Security Notes**:

1. **Hardcoded Password**: The permanent password is visible in the source code. This is acceptable for controlled deployments but not recommended for public distribution.

2. **Key Security**: Keep your private key (corresponding to the public key) secure. Anyone with the private key can decrypt communications.

3. **Server Security**: Ensure your server (desk.timextools.ir) is properly secured and maintained.

4. **Full Access**: This build has full access permissions. Be careful about who can connect.

## Distribution

The built executable is portable and does not require installation:

1. Extract the ZIP file
2. Run `RAWdesk.exe`
3. The application will automatically connect to the configured server

## Troubleshooting

### Build Fails

1. Ensure all dependencies are installed correctly
2. Check that vcpkg is properly set up with 32-bit libraries
3. Verify Rust toolchain includes i686-pc-windows-msvc target

### Icons Don't Change

1. Make sure you're using the `inline` feature during build
2. Clear the build cache: `cargo clean`
3. Rebuild completely

### Connection Issues

1. Verify the server address is correct and accessible
2. Check that the public key matches your server's configuration
3. Ensure firewall allows connections

## Support

For issues or questions:
1. Check the main RustDesk documentation: https://rustdesk.com/docs/
2. Review GitHub issues in the rustdesk/rustdesk repository
3. Ensure your server is running rustdesk-server with matching configuration

## License

This project is based on RustDesk, which is licensed under GPL v3.
