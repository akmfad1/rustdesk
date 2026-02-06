# ✅ RAWdesk Setup Complete - How to Use

## 🎉 Implementation Complete!

Your repository has been successfully configured to build **RAWdesk**, a customized RustDesk client with all your specified requirements.

---

## 📋 What Was Done

All requirements from your request have been implemented:

| Requirement | Status | Details |
|-------------|--------|---------|
| نام کلاینت (Client Name) | ✅ | RAWdesk |
| آدرس سرور (Server Address) | ✅ | desk.timextools.ir |
| کلید (Key) | ✅ | vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o= |
| رمز عبور دائمی (Permanent Password) | ✅ | @dmin110 |
| ویندوز 32 بیتی (Windows 32-bit) | ✅ | i686-pc-windows-msvc target |
| دسترسی کامل (Full Access) | ✅ | Enabled |
| بدون نصب (No Installation) | ✅ | Portable/Inline build |
| Connection Type: Incoming Only | ✅ | Can only receive connections |
| آیکون و لوگو (Icon & Logo) | ✅ | Customization system included |

---

## 🚀 How to Build RAWdesk (3 Simple Steps)

### Step 1: Go to GitHub Actions

1. Open your repository on GitHub: `https://github.com/akmfad1/rustdesk`
2. Click on the **Actions** tab (top navigation)
3. You'll see the workflow: **Build RAWdesk (Windows 32-bit)**

### Step 2: Run the Workflow

1. Click on **Build RAWdesk (Windows 32-bit)**
2. Click the **Run workflow** button (on the right side)
3. Click the green **Run workflow** button in the dropdown
4. Wait 15-20 minutes for the build to complete

### Step 3: Download Your Build

1. Once the workflow completes (green checkmark ✅), click on it
2. Scroll down to the **Artifacts** section
3. Download: **RAWdesk-windows-x86-portable.zip**
4. Extract the ZIP file

**You now have RAWdesk ready to deploy!**

---

## 📦 What You Get

After extracting the ZIP, you'll have:

```
RAWdesk-windows-x86-portable/
├── RAWdesk.exe          ← Main application
├── sciter.dll           ← Required library (must stay with .exe)
└── README.txt           ← Configuration info
```

### How to Use

1. **No Installation Required**: Just run `RAWdesk.exe`
2. **Keep Both Files Together**: `RAWdesk.exe` and `sciter.dll` must be in the same folder
3. **Distribute**: You can copy these files to any Windows 32-bit or 64-bit computer

---

## 🎨 Adding Custom Icons (Optional)

If you want to use your own icons and logo:

### Quick Method

1. **Create your icons**:
   - `icon.ico` - Main Windows icon
   - `tray-icon.ico` - System tray icon
   - `icon.png` - Generic icon (256x256)
   - `logo.svg` - Application logo
   - `banner.svg` - Banner logo

2. **Place in the repository**:
   - Put all icons in: `res/rawdesk/`

3. **Commit and push to GitHub**:
   ```bash
   git add res/rawdesk/
   git commit -m "Add custom RAWdesk icons"
   git push
   ```

4. **Run the workflow again** (Steps 1-3 above)

### Detailed Icon Guide

See the file `res/rawdesk/README.md` for detailed instructions on:
- Icon formats and sizes
- How to create .ico files from images
- Design guidelines
- Tools and resources

---

## 🔐 Important Security Information

### Hardcoded Configuration

The following settings are **permanently configured** and **cannot be changed by users**:

- ✅ Server address: `desk.timextools.ir`
- ✅ Public key: `vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=`
- ✅ Permanent password: `@dmin110`
- ✅ Connection type: Incoming Only

This ensures:
- Consistent configuration across all clients
- Users cannot accidentally misconfigure
- Centralized control and management

### What This Means

**Users CAN**:
- ✅ Run RAWdesk
- ✅ Receive remote connections
- ✅ See their unique ID
- ✅ Allow others to connect using password `@dmin110`

**Users CANNOT**:
- ❌ Change server address
- ❌ Change password
- ❌ Connect to other computers (incoming only)
- ❌ Modify security settings

### Server Requirements

For RAWdesk to work, you need:

1. **RustDesk Server** running at `desk.timextools.ir`
2. **Private Key** on server matching the public key
3. **Open Ports** (typically 21115-21119)
4. **Firewall Rules** allowing RustDesk traffic

---

## 📚 Documentation Files

Your repository now includes comprehensive documentation:

### English Documentation

1. **RAWDESK_QUICKSTART.md** - Quick start guide (you are here)
2. **RAWDESK_BUILD_GUIDE.md** - Detailed build instructions
3. **RAWDESK_IMPLEMENTATION_SUMMARY.md** - Technical implementation details
4. **res/rawdesk/README.md** - Icon customization guide

### Persian/Farsi Documentation

5. **RAWDESK_PERSIAN_README.md** - راهنمای کامل به فارسی

### Tools

6. **customize-icons.sh** - Automated icon replacement script
7. **.github/workflows/build-rawdesk.yml** - Build workflow (automated)

---

## 🔧 Technical Details

### Build Configuration

- **Architecture**: Windows i686 (32-bit)
- **Target**: `i686-pc-windows-msvc`
- **Features**: `inline` (portable, no installation)
- **Build Tool**: GitHub Actions (automated)
- **Dependencies**: Automatically installed by workflow

### Connection Type: Incoming Only

RAWdesk is configured as a **client-only** application:

| Capability | Status | Description |
|------------|--------|-------------|
| Receive connections | ✅ Enabled | Others can connect to this computer |
| Initiate connections | ❌ Disabled | Cannot connect to other computers |
| Be controlled | ✅ Enabled | Can be controlled remotely |
| Control others | ❌ Disabled | Cannot control other computers |

This is ideal for:
- Technical support scenarios
- Remote assistance
- Managed client deployments

---

## 🐛 Troubleshooting

### Build Problems

**Q: Workflow fails with error**
- **A**: Click "Re-run all jobs" to try again. GitHub sometimes has temporary issues.

**Q: Workflow takes longer than 20 minutes**
- **A**: This is normal. Complex builds can take up to 30 minutes.

**Q: Can't find the workflow**
- **A**: Go to Actions tab, look for "Build RAWdesk (Windows 32-bit)"

### Usage Problems

**Q: RAWdesk won't start**
- **A**: Make sure `sciter.dll` is in the same folder as `RAWdesk.exe`

**Q: Cannot connect to server**
- **A**: Check that your server at `desk.timextools.ir` is running and accessible

**Q: Password doesn't work**
- **A**: The password is `@dmin110` - make sure you're typing it exactly

**Q: Icons didn't change**
- **A**: Icons must be placed in `res/rawdesk/` BEFORE running the workflow

### Custom Icons

**Q: Icons look blurry**
- **A**: Make sure your .ico file contains multiple sizes (16, 32, 48, 64, 128, 256)

**Q: How to create .ico file?**
- **A**: Use online converter: https://convertio.co/png-ico/ or see `res/rawdesk/README.md`

---

## ✅ Deployment Checklist

### Before Building

- [ ] Verify server `desk.timextools.ir` is running
- [ ] Confirm server has the private key
- [ ] (Optional) Prepare custom icons in `res/rawdesk/`

### Building

- [ ] Go to Actions tab on GitHub
- [ ] Run "Build RAWdesk (Windows 32-bit)" workflow
- [ ] Wait for green checkmark (✅)
- [ ] Download artifact

### Testing

- [ ] Extract ZIP file
- [ ] Run RAWdesk.exe on test computer
- [ ] Verify connection to server
- [ ] Test remote connection with password `@dmin110`
- [ ] Confirm incoming connections work

### Distribution

- [ ] Package `RAWdesk.exe` + `sciter.dll` together
- [ ] Create user instructions (or use provided README.txt)
- [ ] Distribute to end users
- [ ] Provide support contact information

---

## 🎯 Next Steps

### Immediate

1. **Run the build** using GitHub Actions
2. **Test the build** on a Windows computer
3. **Verify server connection**

### Optional

1. **Add custom icons** to brand as RAWdesk
2. **Create user guide** for your organization
3. **Set up distribution method** (download link, USB drive, etc.)

### Future

1. **Monitor usage** through server logs
2. **Update as needed** by running workflow again
3. **Consider 64-bit build** if needed (can be added)

---

## 📞 Support & Resources

### RustDesk Resources

- Documentation: https://rustdesk.com/docs/
- Server Setup: https://github.com/rustdesk/rustdesk-server
- Original Project: https://github.com/rustdesk/rustdesk

### Your Repository

- Actions: https://github.com/akmfad1/rustdesk/actions
- Files: https://github.com/akmfad1/rustdesk
- Issues: https://github.com/akmfad1/rustdesk/issues

---

## 🎊 Summary

**✅ Everything is ready!**

Your repository is fully configured to build RAWdesk with:
- Pre-configured server and credentials
- Windows 32-bit support
- Portable build (no installation)
- Incoming-only connections
- Custom icon support
- Comprehensive documentation

**To build**: Go to Actions → Build RAWdesk → Run workflow

**Questions?** Check the documentation files listed above.

---

## 📝 Quick Reference

```
Server: desk.timextools.ir
Key: vuw04gfylmMzuWj2nFEV5a2gMbfsdnKwvbwsqhGBu0o=
Password: @dmin110
Build: Windows 32-bit, Portable
Type: Incoming Only
```

**Happy deploying! 🚀**
