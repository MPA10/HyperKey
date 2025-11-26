# HyperKey v2.0 for Windows (AutoHotkey v2.0)

This is the **recommended script version** of HyperKey with modern AutoHotkey v2.0 syntax.

---

## What's New in v2.0

### Improvements
- **Modern Syntax**: AutoHotkey v2.0 compatible with cleaner, more maintainable code
- **Better Performance**: Optimized timer and key state management
- **Enhanced Error Handling**: More reliable operation

### Breaking Changes from v1.1
- Requires **AutoHotkey v2.0+** (not compatible with v1.1)
- Updated syntax throughout the script
- See [Migration Info](../docs/migration_info.md) for upgrade instructions

---

## Quick Start

1. Install [AutoHotkey v2.0](https://www.autohotkey.com/)
2. Run `HyperKey_v2.0.ahk`
3. See the [main documentation](../README.md) for all features and shortcuts

---

## Requirements

- **AutoHotkey v2.0+** (not compatible with v1.1)
- **Windows 10/11**
- **US-QWERTY layout** (recommended)

---

## Syntax Reference

This version uses modern AutoHotkey v2.0 syntax:
```autohotkey
#HotIf GetKeyState("CapsLock", "P")
key::Send("{command}")
#HotIf
```

### Customization Examples

**Adding new shortcuts:**
```autohotkey
#HotIf GetKeyState("CapsLock", "P")
yourKey::Send("yourCommand")
#HotIf
```

**App-specific shortcuts:**
```autohotkey
#HotIf GetKeyState("CapsLock", "P") && WinActive("ahk_exe YourApp.exe")
yourKey::Send("yourCommand")
#HotIf
```

---

## Advanced Features

- **Hotkey Blocking Mechanism**: All blocking hotkeys are defined at the end of the script, inside a single `#HotIf GetKeyState("CapsLock", "P")` block. This is intentional: in AutoHotkey v2.0, the last hotkey definition takes precedence. By placing the blocklist last, app-specific hotkeys (such as for VS Code, Obsidian, etc.) always work as intended, and all other keys are blocked only when HyperKey is active. This change was made to ensure context-aware hotkeys are never accidentally overridden by global blocks. For example, HyperKey+D duplicates a line in VS Code, but is blocked in other apps.

---

## Migrating from v1.1

1. **Backup** your current setup
2. **Install** AutoHotkey v2.0
3. **Test** v2.0 script before removing v1.1
4. **Update** auto-start configuration

For detailed instructions, see the [Migration Info](../docs/migration_info.md).

---

## Troubleshooting

### Script won't start
- Ensure AutoHotkey v2.0 is installed and set as default
- Right-click `.ahk` file → "Open with" → AutoHotkey v2.0

### Hotkeys not working
- Check for AutoHotkey icon in system tray
- Reload script: right-click tray icon → Reload Script

---

## Full Documentation

For all features, shortcuts, visual layout reference, and usage instructions, see the [main README](../README.md).

---

*HyperKey v2.0 - Modern AutoHotkey implementation*
