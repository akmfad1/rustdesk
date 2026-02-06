#!/bin/bash

# RAWdesk Icon Customization Script
# This script helps you replace RustDesk icons with RAWdesk custom icons

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RES_DIR="$SCRIPT_DIR/res"
RAWDESK_DIR="$RES_DIR/rawdesk"

echo "======================================"
echo "RAWdesk Icon Customization Helper"
echo "======================================"
echo ""

# Check if custom icons directory exists
if [ ! -d "$RAWDESK_DIR" ]; then
    echo "Creating RAWdesk assets directory..."
    mkdir -p "$RAWDESK_DIR"
fi

echo "Place your custom icons in: $RAWDESK_DIR"
echo ""
echo "Required files:"
echo "  - icon.ico        (Main Windows icon - multiple sizes: 16,32,48,64,128,256)"
echo "  - tray-icon.ico   (System tray icon - sizes: 16,32)"
echo "  - icon.png        (Generic icon - 256x256 or larger)"
echo "  - logo.svg        (Main logo - SVG vector)"
echo "  - banner.svg      (Banner logo - SVG vector)"
echo ""

# Function to backup original file
backup_file() {
    local file=$1
    if [ -f "$RES_DIR/$file" ] && [ ! -f "$RES_DIR/$file.original" ]; then
        echo "  Backing up original $file..."
        cp "$RES_DIR/$file" "$RES_DIR/$file.original"
    fi
}

# Function to copy custom icon
copy_icon() {
    local src=$1
    local dst=$2
    if [ -f "$RAWDESK_DIR/$src" ]; then
        echo "  Installing $src -> $dst..."
        cp "$RAWDESK_DIR/$src" "$RES_DIR/$dst"
        return 0
    else
        echo "  ⚠ $src not found in $RAWDESK_DIR"
        return 1
    fi
}

# Check if any custom icons exist
if [ ! "$(ls -A $RAWDESK_DIR 2>/dev/null)" ]; then
    echo "❌ No custom icons found in $RAWDESK_DIR"
    echo ""
    echo "To customize icons:"
    echo "  1. Create your icon files (.ico, .png, .svg)"
    echo "  2. Place them in: $RAWDESK_DIR"
    echo "  3. Run this script again"
    echo ""
    echo "Example file names:"
    echo "  $RAWDESK_DIR/icon.ico"
    echo "  $RAWDESK_DIR/tray-icon.ico"
    echo "  $RAWDESK_DIR/icon.png"
    echo "  $RAWDESK_DIR/logo.svg"
    echo "  $RAWDESK_DIR/banner.svg"
    echo ""
    exit 1
fi

echo "Found custom icons. Proceeding with installation..."
echo ""

# Install icons
echo "Installing icons..."

# Backup originals
backup_file "icon.ico"
backup_file "tray-icon.ico"
backup_file "icon.png"
backup_file "logo.svg"
backup_file "rustdesk-banner.svg"

# Copy custom icons
copy_icon "icon.ico" "icon.ico" || true
copy_icon "tray-icon.ico" "tray-icon.ico" || true
copy_icon "icon.png" "icon.png" || true
copy_icon "logo.svg" "logo.svg" || true
copy_icon "banner.svg" "rustdesk-banner.svg" || true

echo ""
echo "✅ Icon customization complete!"
echo ""
echo "Next steps:"
echo "  1. Review the installed icons in: $RES_DIR"
echo "  2. Build the project:"
echo "     cargo build --release --target i686-pc-windows-msvc --features inline"
echo "  3. Or use GitHub Actions workflow: Build RAWdesk (Windows 32-bit)"
echo ""
echo "To restore original icons:"
echo "  cd $RES_DIR"
echo "  mv icon.ico.original icon.ico"
echo "  mv tray-icon.ico.original tray-icon.ico"
echo "  # ... etc for other files"
echo ""
