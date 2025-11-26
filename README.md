# HyperKey for Windows

Hijack your CapsLock: transform your keyboard with powerful navigation, editing, and productivity shortcuts.

---

## Table of Contents

- [Why I Built This](#why-i-built-this)
- [Quick Version Selection](#quick-version-selection)
- [Quick Start](#quick-start)
- [Basic Usage](#basic-usage-ansi-us-qwerty-layout)
- [Visual Layout Reference](#visual-layout-reference)
- [Practical Examples](#practical-examples)
- [Real-World Usage](#real-world-usage)
- [Advanced Features](#advanced-features)
- [Auto-Start Configuration](#auto-start-configuration)
- [Version-Specific Documentation](#version-specific-documentation)
- [Version Comparison](#version-comparison)
- [Support](#support)

---

## Why I Built This

As a long-time macOS user, I was accustomed to the incredible productivity of **Karabiner-Elements** - the ability to transform CapsLock into a powerful HyperKey that unlocks a complete secondary keyboard layer. When I switched to Windows for work, I immediately noticed a productivity gap: my hands constantly had to leave the home row for arrow keys, and I missed the consistent shortcuts I was used to on macOS.

After extensive searching for Windows alternatives, I found that most existing AutoHotkey scripts were either too limited or awkward to use. I wanted the same seamless experience i had with Karabiner: a smart CapsLock that works both as a modifier and supports double-tap Escape, with context-aware behavior for different applications.

This script is the result of that quest - a Windows equivalent that mimics my macOS productivity experience, powered by AutoHotkey. It combines the best of both worlds: the familiar Vim-inspired navigation, with Windows-specific optimizations for VS Code, SSMS, Obsidian, and other popular applications which i will update over time as my needs evolve. I hope it helps others achieve the same productivity boost on Windows!

---

## Quick Version Selection

Choose your AutoHotkey version:

### **Version 2.0 (Recommended)**
- **AutoHotkey v2.0** compatible
- Modern syntax and improved performance
- Enhanced error handling
- **Script**: `v2.0/HyperKey_v2.0.ahk`

### **Version 1.1 (Legacy)**
- **AutoHotkey v1.1** compatible
- Stable and proven functionality
- Original implementation
- **Script**: `v1.1/HyperKey_v1.1.ahk`

> **New to HyperKey?** Start with v2.0 for the best experience.  
> **Currently using v1.1?** See [Migration Info](docs/migration_info.md) for upgrade instructions.

---

## Quick Start

1. **Choose your version** (see selection above)
2. **Install AutoHotkey**:
   - [AutoHotkey v2.0](https://www.autohotkey.com/) (recommended)
   - [AutoHotkey v1.1](https://www.autohotkey.com/download/1.1/) (legacy)
3. **Download the script** from your chosen version folder
4. **Double-click to run** the `.ahk` file
5. **Add to startup folder** for auto-launch (see below)

---

## Basic Usage (Ansi US-QWERTY Layout)

- **CapsLock + J/K/L/I** = Arrow keys (Vim-Inspired)
- **CapsLock + H/;** = Word left/right
- **CapsLock + U/O** = Line start/end
- **CapsLock + X/C/V** = Cut/Copy/Paste
- **CapsLock + Shift+V** = Open clipboard history (Win+V)
- **CapsLock + Z** = Undo | **CapsLock + Shift+Z** = Redo
- **CapsLock + D** = Duplicate line (VS Code, SSMS, Obsidian, Visual Studio)
- **Double-tap CapsLock** = Escape
- **RShift + CapsLock** = Toggle real CapsLock

Add `Shift` to any navigation key to select text while moving.

---

## Visual Layout Reference

```
; ====================================================================
; ╔══════════════════════════════════════════════════════════════════╗
; ║                   HYPERKEY LAYOUT REFERENCE                      ║
; ╠══════════════════════════════════════════════════════════════════╣
; ║                                                                  ║
; ║  ┌─ HOME ROW LAYOUT (ANSI US QWERTY) ────────────────────────┐   ║
; ║  │  [Esc] [F1]...[F12]                                       │   ║
; ║  │  [`] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [-] [=] [Bk] │   ║
; ║  │  [Tab] [Q] [W] [E] [R] [T] [Y] [U] [I] [O] [P] [[] []] [\]│   ║
; ║  │  [Caps] [A] [S] [D] [F] [G] [H] [J] [K] [L] [;] ['] [Ent] │   ║
; ║  │  [Shift] [Z] [X] [C] [V] [B] [N] [M] [,] [.] [/] [Shift]  │   ║
; ║  │  [Ctrl] [Win] [Alt]   [Space]   [Alt] [Win] [Menu] [Ctrl] │   ║
; ║  └───────────────────────────────────────────────────────────┘   ║
; ║                                                                  ║
; ║  ┌─ NAVIGATION ──────────────────────────────────────────────┐   ║
; ║  │  ARROW KEYS:                                              │   ║
; ║  │  CapsLock + [I] = ↑                                       │   ║
; ║  │  CapsLock + [K] = ↓                                       │   ║
; ║  │  CapsLock + [J] = ←                                       │   ║
; ║  │  CapsLock + [L] = →                                       │   ║
; ║  │                                                           │   ║
; ║  │  WORD JUMPS:                                              │   ║
; ║  │  CapsLock + [H] = Jump word left                          │   ║
; ║  │  CapsLock + [;] = Jump word right                         │   ║
; ║  │                                                           │   ║
; ║  │  LINE NAVIGATION:                                         │   ║
; ║  │  CapsLock + [U] = Home                                    │   ║
; ║  │  CapsLock + [O] = End                                     │   ║
; ║  └───────────────────────────────────────────────────────────┘   ║
; ║                                                                  ║
; ║  ┌─ TEXT EDITING ────────────────────────────────────────────┐   ║
; ║  │  CLIPBOARD:                                               │   ║
; ║  │  CapsLock + [X] = Cut                                     │   ║
; ║  │  CapsLock + [C] = Copy                                    │   ║
; ║  │  CapsLock + [V] = Paste                                   │   ║
; ║  │  CapsLock + [A] = Select All                              │   ║
; ║  │                                                           │   ║
; ║  │  UNDO & REDO:                                             │   ║
; ║  │  CapsLock + [Z] = Undo                                    │   ║
; ║  │  CapsLock + Shift + [Z] = Redo                            │   ║
; ║  │                                                           │   ║
; ║  │  SMART FEATURES:                                          │   ║
; ║  │  CapsLock + ['] = ''                                      │   ║
; ║  │  CapsLock + Shift + ['] = ""                              │   ║
; ║  │  CapsLock + [9] = ()                                      │   ║
; ║  │  CapsLock + [[] = []                                      │   ║
; ║  │  CapsLock + Shift + [[] = {}                              │   ║
; ║  └───────────────────────────────────────────────────────────┘   ║
; ║                                                                  ║
; ║  ┌─ DELETE OPERATIONS ───────────────────────────────────────┐   ║
; ║  │  CapsLock + [N] = Delete word left                        │   ║
; ║  │  CapsLock + [M] = Delete character left                   │   ║
; ║  │  CapsLock + [,] = Delete character right                  │   ║
; ║  │  CapsLock + [.] = Delete word right                       │   ║
; ║  └───────────────────────────────────────────────────────────┘   ║
; ║                                                                  ║
; ║  ┌─ SPECIAL FUNCTIONS ───────────────────────────────────────┐   ║
; ║  │  Double-tap CapsLock = Escape                             │   ║
; ║  │  CapsLock + Shift + [/] =  (Right-click menu)             │   ║
; ║  │  Right Shift + CapsLock = ⇪ (Toggle real CapsLock)        │   ║
; ║  └───────────────────────────────────────────────────────────┘   ║
; ║                                                                  ║
; ║  ┌─ SYMBOLS (Number Row) ────────────────────────────────────┐   ║
; ║  │  CapsLock + [`] = ~                                       │   ║
; ║  │  CapsLock + [1-0] = !@#$%^&*()                            │   ║
; ║  │  CapsLock + [-] = _                                       │   ║
; ║  │  CapsLock + [=] = +                                       │   ║
; ║  └───────────────────────────────────────────────────────────┘   ║
; ║                                                                  ║
; ╚══════════════════════════════════════════════════════════════════╝
```

---

## Practical Examples

### App-Specific Features

#### Visual Studio Code
- **CapsLock+D** duplicates line
- **CapsLock+/** toggles comments
- **CapsLock+Alt+I/K** moves line up/down

#### Visual Studio
- **CapsLock+D** duplicates line
- **CapsLock+/** toggles comments
- **CapsLock+Alt+I/K** moves line up/down

#### SQL Server Management Studio (SSMS)
- **CapsLock+R** executes query
- **CapsLock+Shift+0** inserts SELECT-FROM-WHERE template
- **CapsLock+/** smart comment toggle (detects if already commented)

#### Obsidian
- **CapsLock+D** duplicates line
- **CapsLock+Alt+J/L** navigates between headers
- **CapsLock+Ctrl+I/K** folds/unfolds sections
- **CapsLock+Ctrl+Enter** opens link under cursor
- **CapsLock+Shift+Ctrl+Enter** opens link in new tab

#### File Explorer
- **CapsLock+Alt+I/K/J/L** navigates Up/Down/Back/Forward

#### Brave Browser
- **CapsLock+Ctrl+J/L** navigates back/forward

### Universal Examples (Works Everywhere)
- **Text editing**: CapsLock+J/K/L/I for navigation, CapsLock+X/C/V for clipboard
- **Quick access**: CapsLock+Shift+/ for right-click menu anywhere
- **Escape alternative**: Double-tap CapsLock instead of reaching for Esc key

---

## Real-World Usage

- **Writing documents**: Keep hands on home row, no more reaching for arrow keys
- **Coding**: Duplicate lines, toggle comments, navigate code efficiently  
- **Web browsing**: Navigate back/forward without mouse (will be updated and added to more browsers)
- **SQL development**: Execute queries, insert templates instantly and comment out selected code

---

## Advanced Features

- **Smart Wrapping**: Auto-pairs quotes/brackets with cursor positioning 
  - **Single quotes**: CapsLock + ' = '' (cursor between)
  - **Double quotes**: CapsLock + Shift + ' = "" (cursor between)
  - **Context-aware**: In VS Code/Obsidian only sends single quote because they have their own auto-pairing
- **Context-Aware**: Different behavior in code editors vs other apps
- **Key Blocking**: Unused keys are automatically blocked to prevent accidents

---

## Auto-Start Configuration

### Method A: Startup Folder 
1. Press `Win + R`
2. Type `shell:startup` and press Enter
3. Copy your chosen script (`HyperKey_v1.1.ahk` or `HyperKey_v2.0.ahk`) to the startup folder
4. Script will launch automatically on Windows boot

### Method B: Task Scheduler
1. Open Task Scheduler
2. Create Basic Task
3. Set trigger: "When I log on"
4. Action: "Start a program"
5. Browse to your chosen script file

### Method C: Registry (Advanced)
1. Press `Win + R`
2. Type `regedit` and press Enter
3. Navigate to: `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run`
4. Right-click → New → String Value
5. Name: `HyperKey`
6. Value: Full path to your chosen script file

---

## Development (Optional)

For editing the script, use VS Code with AHK++ extension for syntax highlighting and IntelliSense.

---

## Version-Specific Documentation

### Version 2.0 (Recommended)
- **Features**: Modern AutoHotkey v2.0 syntax, enhanced performance, better error handling
- **Documentation**: [v2.0 README](v2.0/README.md)
- **Migration**: [Migration Info](docs/migration_info.md)

### Version 1.1 (Legacy)
- **Features**: Stable AutoHotkey v1.1 implementation, proven functionality
- **Documentation**: [v1.1 README](v1.1/README.md) *(frozen - complete standalone docs)*
- **Status**: No longer actively developed

---

## Version Comparison

| Feature | v1.1 (Legacy) | v2.0 (Recommended) |
|---------|---------------|-------------------|
| AutoHotkey Version | v1.1+ | v2.0+ |
| Syntax | Legacy | Modern |
| Performance | Good | Better |
| Error Handling | Basic | Enhanced |
| Maintenance | Deprecated | Active development |
| Migration Path | N/A | from v1.1 |

---

## Support

If you find this project useful, consider buying me a coffee!

[![Buy Me a Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=mikepattyn&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=black)](https://buymeacoffee.com/mikepattyn)

---

*Created by Mike Pattyn - Free to use and modify*