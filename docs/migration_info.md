# Migration Guide: v1.1 to v2.0

This info file describes the migration from AutoHotkey v1.1 to v2.0 for the HyperKey script.

## 🔄 Why Migrate?

### Benefits of v2.0
- **Better Performance**: Improved execution speed
- **Object-Oriented Programming (OOP)**: AutoHotkey v2.0 introduces OOP features, allowing for more modular and reusable code
- **Modern Syntax**: Cleaner, more readable code that's easier to maintain 
- **Enhanced Error Handling**: Better debugging capabilities
- **Future-Proof**: Active development and support
- **Unicode Support**: Improved international character handling

### Breaking Changes
- Requires AutoHotkey v2.0 installation
- Some syntax changes 
- Minor behavioral improvements

---

## Prerequisites

### Before You Start

I have changed the repo structure to have separate folders for v1.1 and v2.0 scripts. 
HyperKey.ahk has been renamed to HyperKey_v1.1.ahk and placed in the v1.1 folder as legacy.

1. **Install AutoHotkey v2.0**: Download from [autohotkey.com](https://www.autohotkey.com/)
2. **Backup your v1.1 setup**: Copy your current v1.1 script and any custom configurations to a safe location
3. **Close v1.1 script**: Right-click tray icon → Exit
4. **Download v2.0 script**: Get the latest v2.0 version from the `v2.0/` folder in this repo

### System Requirements
- Windows 10/11
- AutoHotkey v2.0+

---

## Migration Steps

### Step 1: Install AutoHotkey v2.0
1. Download AutoHotkey v2.0 from the official website
2. Run the installer
3. Choose "Use v2.0 by default" during installation

### Step 2: Test v2.0 Script
1. Navigate to the `v2.0/` folder
2. Double-click `HyperKey_v2.0.ahk`
3. Check the tray icon to confirm it's running
4. Test basic functionality:
   - CapsLock + IJKL for navigation
   - CapsLock + XCV for clipboard
   - Double-tap CapsLock for Escape

### Step 3: Update Auto-Start
**Option A: Startup Folder**
1. Press `Win + R`, type `shell:startup`
2. Delete old `HyperKey_v1.1.ahk` shortcut
3. Create new shortcut to `HyperKey_v2.0.ahk`

**Option B: Task Scheduler**
1. Open Task Scheduler
2. Find and edit the existing HyperKey task
3. Update the action to point to `v2.0/HyperKey_v2.0.ahk`

**Option C: Registry**
1. Press `Win + R`, type `regedit`
2. Navigate to `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run`
3. Update the HyperKey value to point to `v2.0/HyperKey_v2.0.ahk`

### Step 4: Verify Migration
Test all your frequently used features:
- [ ] Basic navigation (IJKL)
- [ ] Text editing (XCV, Z)
- [ ] App-specific shortcuts (VS Code, SSMS, etc.)
- [ ] Special functions (double-tap, clipboard history)

---

## Configuration Migration

### Custom Shortcuts
If you modified the v1.1 script, you'll need to update v2.0:

---

## Troubleshooting

### Common Issues

#### "Script won't start"
- **Cause**: AutoHotkey v1.1 still default
- **Fix**: Reinstall AutoHotkey v2.0 and choose "Use v2.0 by default"

#### "Hotkeys not working"
- **Cause**: Script not running or conflicts
- **Fix**: Check tray icon, restart script, check for conflicts

#### "App-specific shortcuts broken"
- **Cause**: Window class names changed
- **Fix**: Use Window Spy to verify `ahk_exe` names

### Getting Help
1. Check the [v2.0 Documentation](../v2.0/README_v2.0.md)

---

## Additional Resources

- [v2.0 Script Syntax Reference](https://www.autohotkey.com/docs/v2/)
- [HyperKey v2.0 Documentation](../v2.0/README.md)

---

## Migration Checklist

- [ ] Backup v1.1 setup
- [ ] Install AutoHotkey v2.0
- [ ] Test v2.0 script functionality
- [ ] Update auto-start configuration
- [ ] Migrate custom configurations
- [ ] Verify all features work
- [ ] Remove v1.1 auto-start (optional)

---

*Need help? Open an issue or check the troubleshooting guide.*