# HyperKey v1.1 for Windows (AutoHotkey v1.1)

> ⚠️ **Legacy Version**: This documentation is frozen. v1.1 is stable but no longer actively developed.  
> For new users, we recommend [v2.0](../v2.0/) with modern AutoHotkey syntax.

Hijack your CapsLock: transform your keyboard with powerful navigation, editing, and productivity shortcuts.

---

## Quick Start

1. Install [AutoHotkey v1.1](https://www.autohotkey.com/download/1.1/)
2. Run `HyperKey_v1.1.ahk`
3. Add to startup folder for auto-launch

---

## Basic Usage (ANSI US-QWERTY Layout)

- **CapsLock + J/K/L/I** = Arrow keys (Vim-Inspired)
- **CapsLock + H/;** = Word left/right
- **CapsLock + U/O** = Line start/end
- **CapsLock + X/C/V** = Cut/Copy/Paste
- **CapsLock + Z** = Undo | **CapsLock + Shift+Z** = Redo
- **CapsLock + Shift+V** = Open clipboard history (Win+V)
- **CapsLock + D** = Duplicate line (VS Code, SSMS, Obsidian, Visual Studio)
- **Double-tap CapsLock** = Escape
- **RShift + CapsLock** = Toggle real CapsLock

Add `Shift` to any navigation key to select text while moving.

---

## Visual Layout Reference

```
╔══════════════════════════════════════════════════════════════════╗
║                   HYPERKEY LAYOUT REFERENCE                      ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  ┌─ HOME ROW LAYOUT (ANSI US QWERTY) ────────────────────────┐   ║
║  │  [Esc] [F1]...[F12]                                       │   ║
║  │  [`] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [-] [=] [Bk] │   ║
║  │  [Tab] [Q] [W] [E] [R] [T] [Y] [U] [I] [O] [P] [[] []] [\]│   ║
║  │  [Caps] [A] [S] [D] [F] [G] [H] [J] [K] [L] [;] ['] [Ent] │   ║
║  │  [Shift] [Z] [X] [C] [V] [B] [N] [M] [,] [.] [/] [Shift]  │   ║
║  │  [Ctrl] [Win] [Alt]   [Space]   [Alt] [Win] [Menu] [Ctrl] │   ║
║  └───────────────────────────────────────────────────────────┘   ║
║                                                                  ║
║  ┌─ NAVIGATION ──────────────────────────────────────────────┐   ║
║  │  CapsLock + [I] = ↑       CapsLock + [K] = ↓              │   ║
║  │  CapsLock + [J] = ←       CapsLock + [L] = →              │   ║
║  │  CapsLock + [H] = Word left    CapsLock + [;] = Word right│   ║
║  │  CapsLock + [U] = Home         CapsLock + [O] = End       │   ║
║  └───────────────────────────────────────────────────────────┘   ║
║                                                                  ║
║  ┌─ TEXT EDITING ────────────────────────────────────────────┐   ║
║  │  CapsLock + [X] = Cut      CapsLock + [C] = Copy          │   ║
║  │  CapsLock + [V] = Paste    CapsLock + [A] = Select All    │   ║
║  │  CapsLock + [Z] = Undo     CapsLock + Shift+[Z] = Redo    │   ║
║  └───────────────────────────────────────────────────────────┘   ║
║                                                                  ║
║  ┌─ SMART FEATURES ──────────────────────────────────────────┐   ║
║  │  CapsLock + ['] = ''       CapsLock + Shift+['] = ""      │   ║
║  │  CapsLock + [9] = ()       CapsLock + [[] = []            │   ║
║  │  CapsLock + Shift+[[] = {}                                │   ║
║  └───────────────────────────────────────────────────────────┘   ║
║                                                                  ║
║  ┌─ DELETE OPERATIONS ───────────────────────────────────────┐   ║
║  │  CapsLock + [N] = Delete word left                        │   ║
║  │  CapsLock + [M] = Delete character left                   │   ║
║  │  CapsLock + [,] = Delete character right                  │   ║
║  │  CapsLock + [.] = Delete word right                       │   ║
║  └───────────────────────────────────────────────────────────┘   ║
║                                                                  ║
║  ┌─ SPECIAL FUNCTIONS ───────────────────────────────────────┐   ║
║  │  Double-tap CapsLock = Escape                             │   ║
║  │  CapsLock + Shift + [/] = Right-click menu                │   ║
║  │  Right Shift + CapsLock = Toggle real CapsLock            │   ║
║  └───────────────────────────────────────────────────────────┘   ║
║                                                                  ║
║  ┌─ SYMBOLS (Number Row) ────────────────────────────────────┐   ║
║  │  CapsLock + [`] = ~       CapsLock + [1-0] = !@#$%^&*()   │   ║
║  │  CapsLock + [-] = _       CapsLock + [=] = +              │   ║
║  └───────────────────────────────────────────────────────────┘   ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## App-Specific Features

### Visual Studio Code
- **CapsLock+D** duplicates line
- **CapsLock+/** toggles comments
- **CapsLock+Alt+I/K** moves line up/down

### Visual Studio
- **CapsLock+D** duplicates line
- **CapsLock+/** toggles comments
- **CapsLock+Alt+I/K** moves line up/down

### SQL Server Management Studio (SSMS)
- **CapsLock+R** executes query
- **CapsLock+Shift+0** inserts SELECT-FROM-WHERE template
- **CapsLock+/** smart comment toggle

### Obsidian
- **CapsLock+D** duplicates line
- **CapsLock+Alt+J/L** navigates between headers
- **CapsLock+Ctrl+I/K** folds/unfolds sections
- **CapsLock+Ctrl+Enter** opens link under cursor

### File Explorer
- **CapsLock+Alt+I/K/J/L** navigates Up/Down/Back/Forward

### Brave Browser
- **CapsLock+Ctrl+J/L** navigates back/forward

---

## Advanced Features

- **Smart Wrapping**: Auto-pairs quotes/brackets with cursor positioning
- **Context-Aware**: Different behavior in code editors vs other apps
- **Key Blocking**: Unused keys are automatically blocked to prevent accidents

---

## Auto-Start Configuration

### Startup Folder (Recommended)
1. Press `Win + R`
2. Type `shell:startup` and press Enter
3. Copy `HyperKey_v1.1.ahk` to the startup folder

---

## Requirements

- **AutoHotkey v1.1+** (not compatible with v2.0)
- **Windows 10/11**
- **US-QWERTY layout** (recommended)

---

## Syntax Reference

This version uses AutoHotkey v1.1 syntax:
```autohotkey
#If GetKeyState("CapsLock", "P")
key::Send, {command}
#If
```

---

## Upgrading to v2.0

For better performance and modern syntax, consider upgrading:

1. Install [AutoHotkey v2.0](https://www.autohotkey.com/)
2. See the [Migration Info](../docs/migration_info.md)
3. Switch to `../v2.0/HyperKey_v2.0.ahk`

---

*HyperKey v1.1 - Legacy AutoHotkey implementation (frozen)*
