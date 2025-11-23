# HyperKey for Windows

Transform CapsLock into a powerful modifier key. Perfect for macOS users switching to Windows.

## Why I Built This

As a long-time macOS user, I was accustomed to the incredible productivity of **Karabiner-Elements** - the ability to transform CapsLock into a powerful HyperKey that unlocks a complete secondary keyboard layer. When I switched to Windows for work, I immediately noticed a productivity gap: my hands constantly had to leave the home row for arrow keys, and I missed the consistent shortcuts I was used to on macOS.
After extensive searching for Windows alternatives, I found that most existing AutoHotkey scripts were either too limited or awkward to use. I wanted the same seamless experience as Karabiner: a smart CapsLock that works both as a modifier and supports double-tap Escape, with context-aware behavior for different applications.
This script is the result of that quest - a Windows equivalent that mimics the macOS productivity experience, powered by AutoHotkey. It combines the best of both worlds: the familiar Vim-inspired navigation, with Windows-specific optimizations for VS Code, SSMS, Obsidian, and other popular applications.

## Table of Contents

- [Quick Start](#quick-start)
- [Basic Usage](#basic-usage-ansi-us-qwerty-layout)
- [Practical Examples](#practical-examples)
- [Real-World Usage](#real-world-usage)
- [Advanced Features](#advanced-features)
- [Visual Layout Reference](#visual-layout-reference)
- [Auto-Start Configuration](#auto-start-configuration)
- [Development (Optional)](#development-optional)

## Quick Start

1. Install [AutoHotkey](https://www.autohotkey.com/)
2. Save script as `HyperKey.ahk`
3. Double-click to run
4. Add to startup folder for auto-launch

## Basic Usage (Ansi US-QWERTY Layout)

- **CapsLock + J/K/L/I** = Arrow keys (Vim-Inspired)
- **CapsLock + H/;** = Word left/right
- **CapsLock + U/O** = Line start/end
- **CapsLock + X/C/V** = Cut/Copy/Paste
- **CapsLock + D** = Duplicate line (VS Code, SSMS, Obsidian)
- **Double-tap CapsLock** = Escape
- **RShift + CapsLock** = Toggle real CapsLock

Add `Shift` to any navigation key to select text while moving.

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

## Practical Examples

### App-Specific Features
- **In VS Code:** CapsLock+D duplicates current line, CapsLock+/ toggles comments
- **In SSMS:** CapsLock+R executes query, CapsLock+Shift+0 creates SQL template  
- **In Obsidian:** CapsLock+Alt+J/L navigates between headers, CapsLock+Ctrl+I/K folds sections
- **In File Explorer:** CapsLock+Alt+I/K/J/L replaces Up/Down/Back/Forward buttons
- **In Brave:** CapsLock+Ctrl+J/L replaces browser back/forward buttons

### Universal Examples (Works Everywhere)
- **Text editing:** CapsLock+J/K/L/I for navigation, CapsLock+X/C/V for clipboard
- **Quick access:** CapsLock+Shift+/ for right-click menu anywhere
- **Escape alternative:** Double-tap CapsLock instead of reaching for Esc key

## Real-World Usage
- **Writing documents:** Keep hands on home row, no more reaching for arrow keys
- **Coding:** Duplicate lines, toggle comments, navigate code efficiently  
- **Web browsing:** Navigate back/forward without mouse
- **SQL development:** Execute queries, insert templates instantly and comment out selected code

## Advanced Features

- **Smart Wrapping:** Auto-pairs quotes/brackets with cursor positioning
  - **Single quotes:** CapsLock + ' = '' (cursor between)
  - **Double quotes:** CapsLock + Shift + ' = "" (cursor between)
  - **Context-aware:** In VS Code/Obsidian only sends single quote
- **Context-Aware:** Different behavior in code editors vs other apps
- **Key Blocking:** Unused keys are automatically blocked to prevent accidents

## Auto-Start Configuration

### Method A: Startup Folder 
1. Press `Win + R`
2. Type `shell:startup` and press Enter
3. Copy `HyperKey.ahk` to the startup folder
4. Script will launch automatically on Windows boot

### Method B: Task Scheduler
1. Open Task Scheduler
2. Create Basic Task
3. Set trigger: "When I log on"
4. Action: "Start a program"
5. Browse to your `HyperKey.ahk` file

### Method C: Registry (Advanced)
1. Press `Win + R`
2. Type `regedit` and press Enter
3. Navigate to: `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run`
4. Right-click → New → String Value
5. Name: `HyperKey`
6. Value: Full path to `HyperKey.ahk`

## Development (Optional)

For editing, use VS Code with AHK++ extension for syntax highlighting and IntelliSense.

---

*Created by Mike Pattyn - Free to use and modify*