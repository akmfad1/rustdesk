# RAWdesk Custom Icons and Assets

This directory contains custom icons and assets for RAWdesk branding.

## Required Files

Place your custom icon files in this directory with the following names:

### Windows Icons
- **icon.ico** - Main application icon
  - Multi-resolution ICO file
  - Required resolutions: 16x16, 32x32, 48x48, 64x64, 128x128, 256x256
  - Used for: Executable file, taskbar, Alt+Tab switcher
  
- **tray-icon.ico** - System tray icon
  - Multi-resolution ICO file
  - Required resolutions: 16x16, 32x32
  - Used for: System tray notification area

### Generic Icons
- **icon.png** - Generic application icon
  - PNG format
  - Recommended size: 256x256 or 512x512
  - Transparent background recommended

### Vector Logos
- **logo.svg** - Main application logo
  - SVG vector format
  - Used in application UI and dialogs
  
- **banner.svg** - Banner/header logo
  - SVG vector format
  - Used in splash screens and about dialogs
  - Recommended aspect ratio: Wide (e.g., 400x100)

## How to Create Icons

### Option 1: Using Online Tools
1. Create your design in your favorite graphics editor
2. Export as PNG (high resolution, e.g., 512x512)
3. Convert to ICO using online tool:
   - https://convertio.co/png-ico/
   - https://www.icoconverter.com/
4. Select "Custom sizes" and include: 16, 32, 48, 64, 128, 256

### Option 2: Using ImageMagick
```bash
# Install ImageMagick
# Ubuntu/Debian: sudo apt-get install imagemagick
# macOS: brew install imagemagick
# Windows: Download from https://imagemagick.org/

# Convert PNG to multi-resolution ICO
convert source-icon.png -define icon:auto-resize=256,128,64,48,32,16 icon.ico
convert source-tray.png -define icon:auto-resize=32,16 tray-icon.ico
```

### Option 3: Using GIMP
1. Open your source image in GIMP
2. Scale to largest size needed (e.g., 256x256)
3. File → Export As
4. Change extension to .ico
5. In ICO export dialog, select compression options
6. Add multiple sizes: 256, 128, 64, 48, 32, 16

## Design Guidelines

### Application Icon (icon.ico)
- **Style**: Clear and recognizable at small sizes
- **Colors**: Use brand colors consistently
- **Simplicity**: Avoid too much detail (won't show at 16x16)
- **Background**: Transparent or solid color
- **Test**: View at 16x16 to ensure recognizability

### Tray Icon (tray-icon.ico)
- **Minimalist**: Even simpler than main icon
- **High contrast**: Must be visible on light and dark taskbars
- **Symbolic**: Consider using simple geometric shapes
- **Monochrome option**: Some designs work better in single color

### Logo (logo.svg)
- **Vector format**: Ensures scalability
- **Brand consistency**: Match your brand guidelines
- **Clean lines**: Avoid excessive complexity
- **Format**: Valid SVG with viewBox attribute

### Banner (banner.svg)
- **Aspect ratio**: Wide format (3:1 or 4:1)
- **Text legibility**: Ensure text is readable at various sizes
- **Brand elements**: Include logo and/or wordmark

## Example File Structure

After placing your files, this directory should look like:

```
res/rawdesk/
├── README.md (this file)
├── icon.ico
├── tray-icon.ico
├── icon.png
├── logo.svg
└── banner.svg
```

## Installation

Once you've placed your custom icons here, run:

```bash
./customize-icons.sh
```

This will:
1. Backup original RustDesk icons
2. Copy your custom icons to the appropriate locations
3. Prepare the build to use your branding

## Testing

After installing custom icons:

1. **Build the project**:
   ```bash
   cargo build --release --target i686-pc-windows-msvc --features inline
   ```

2. **Check the executable icon**:
   - Right-click the .exe file
   - Check Properties → Details tab
   - Verify your icon appears

3. **Run the application**:
   - Launch RAWdesk.exe
   - Check system tray icon
   - Verify UI shows correct logo

## Troubleshooting

### Icons don't appear
- Ensure files are valid formats (use online validators)
- Clear build cache: `cargo clean`
- Rebuild completely
- Check file permissions

### Icons look blurry
- Include all required resolutions in ICO file
- Use higher quality source images
- Ensure PNG has transparent background

### Tray icon not visible
- Test on both light and dark taskbars
- Increase contrast
- Use simpler design

## Color Palette Suggestion

For RAWdesk branding, consider:
- Primary: Your brand color
- Secondary: Complementary color
- Neutral: Gray tones for backgrounds
- Accent: Highlight color for interactive elements

## Additional Resources

- ICO format specification: https://en.wikipedia.org/wiki/ICO_(file_format)
- SVG optimization: https://jakearchibald.github.io/svgomg/
- Icon design best practices: https://material.io/design/iconography/
- Windows icon guidelines: https://docs.microsoft.com/en-us/windows/apps/design/style/iconography/

## Notes

- All files in this directory are for RAWdesk customization only
- Original RustDesk assets are backed up automatically
- You can restore originals by renaming .original files
- Keep source files (PSD, AI, etc.) in a separate location for future edits
