; 88  88 Yb  dP 88""Yb 888888 88""Yb 88  dP 888888 Yb  dP        db    88  88 88  dP     
; 88  88  YbdP  88__dP 88__   88__dP 88odP  88__    YbdP        dPYb   88  88 88odP      
; 888888   8P   88"""  88""   88"Yb  88"Yb  88""     8P   .o.  dP__Yb  888888 88"Yb      
; 88  88  dP    88     888888 88  Yb 88  Yb 888888  dP    `"' dP""""Yb 88  88 88  Yb   
;
; 88""Yb Yb  dP        o        8b    d8 88 88  dP 888888 88""Yb    db      .d  dP"Yb  
; 88__dP  YbdP      `8.8.8'     88b  d88 88 88odP  88__   88__dP   dPYb   .d88 dP   Yb 
; 88""Yb   8P       .8.8.8.     88YbdP88 88 88"Yb  88""   88"""   dP__Yb    88 Yb   dP 
; 88oodP  dP           "        88 YY 88 88 88  Yb 888888 88     dP""""Yb   88  YbodP  
;
; HyperKey Script Version: 2.1.0
; Compatible with AutoHotkey v2.0+
;
; ================================================================================================
; HYPERKEY WINDOWS SCRIPT v2.0 - Advanced Keyboard Productivity Enhancement
; ================================================================================================
;
; WHAT IS A HYPERKEY?
; -------------------
; A HyperKey transforms an underutilized key (CapsLock) into a powerful modifier key that unlocks
; a complete secondary keyboard layer. Think of it as Ctrl, Alt, or Shift - but better, because
; it's positioned on the home row and doesn't conflict with existing shortcuts.
;
; WHY USE A HYPERKEY?
; -------------------
; • Ergonomic: Keep your hands on the home row - no reaching for arrow keys or mouse
; • Efficient: Execute complex actions with simple key combinations
; • Consistent: Same shortcuts work across all applications with context-aware behavior
; • Powerful: Access unlimited custom shortcuts without memorizing complex key chords
;
; CORE FEATURES OF THIS SCRIPT:
; ------------------------------
; ✓ Vim-Inspired Navigation   - HyperKey + IJKL for cursor movement (no arrow keys needed)
; ✓ Smart Text Manipulation   - Duplicate lines, smart delete, word-by-word movement
; ✓ Context-Aware Shortcuts   - Same key does different things in different apps
; ✓ Smart Wrapping            - Auto-pair quotes, brackets, parentheses with cursor positioning
; ✓ Clipboard Operations      - Quick cut/copy/paste/select-all on home row
; ✓ Double-Tap Escape         - Quick double-tap on CapsLock sends Escape 
; ✓ App-Specific Enhancements - Custom shortcuts for VS Code, SSMS, Obsidian, Brave, and more
;
; KEYBOARD LAYOUT:
; ----------------
; Optimized for: US-ANSI/QWERTY layout
; Note: This script may behave unexpectedly on AZERTY or other QWERTY layouts - adjust accordingly.
;
; QUICK START GUIDE:
; ------------------
; 1. Hold CapsLock + J/K/L/I = Move cursor (Left/Down/Right/Up) 
; 2. Hold CapsLock + H/; = Jump word left/right
; 3. Hold CapsLock + U/O = Jump to start/end of line
; 4. Hold CapsLock + X/C/V = Cut/Copy/Paste (home row clipboard!)
; 5. Hold CapsLock + D = Duplicate current line (context-aware)
; 6. Hold CapsLock + N/M = Smart delete word/character left of cursor
; 6. Hold CapsLock + ,/. = Smart delete word/character right of cursor
; 7. Double-tap CapsLock quickly = Send Escape key
; 8. RShift + CapsLock = Toggle actual CapsLock on/off
;
; Add Shift to any navigation key to select while moving!
;
; INSTALLATION & SETUP:
; ---------------------
; 1. Install AutoHotkey v2.0+ from https://www.autohotkey.com/
; 2. Place this script in your startup folder to run on boot
; 3. Right-click the AHK tray icon and select "Reload Script" after making changes
;
; CUSTOMIZATION:
; --------------
; • Modify existing shortcuts to match your workflow
; • Add new app-specific sections using #HotIf WinActive("ahk_exe YourApp.exe") 
; • Block unused keys in the "Block Keys" section to prevent accidents
; • Use backtick (`) to escape special characters in send commands
;
; COMPATIBILITY:
; --------------
; • Windows 10/11 (PowerShell default)
; • AutoHotkey v2.0+
; • Works alongside other productivity tools
;
; AUTHOR: Mike Pattyn
; LICENSE: MIT - Free to use and modify
; VERSION: 2.1.0
; LAST UPDATED: November 2025
;
; ================================================================================================
; AutoHotkey v2.0 Syntax - MODIFIER KEYS REFERENCE 
; ================================================================================================
; Ctrl = ^  
; Alt = !  
; Shift = +  
; LShift = <+  
; RShift = >+  
; Win = #  
; AltGr = <^>! 
; CapsLock = CapsLock
;
; ================================================================================================
; APPLICATION VARIABLES
; ================================================================================================
; Define application executable names here for easy maintenance.
; To add a new app, simply add a new variable and use it in the #HotIf conditions.

APP_VSCODE := "ahk_exe Code.exe"
APP_VISUAL_STUDIO := "ahk_exe devenv.exe"
APP_OBSIDIAN := "ahk_exe Obsidian.exe"
APP_EXPLORER := "ahk_exe explorer.exe"
APP_BRAVE := "ahk_exe brave.exe"
APP_SSMS := "ahk_exe Ssms.exe"

; ================================================================================================
; HELPER FUNCTIONS
; ================================================================================================

; Check if Shift is pressed (simplified version)
IsShiftPressed()
{
    return GetKeyState("Shift")
}

; Smart delete function with selection check
SmartDelete(deleteCommand)
{
    if (IsShiftPressed())
    {
        Send("{Backspace}") ; Delete selection if there is a selection
    }
    else
    {
        Send(deleteCommand) ; Execute the specific delete command
    }
}

; ================================================================================================
; HYPERKEY CONFIGURATION (CapsLock as HyperKey)
; ================================================================================================
; CapsLock hold activates HyperKey functionality:
; - Hold (longer than 0.2s): Activates HyperKey functionality
; CapsLock Double-Tap for Escape Functionality:
; - One short tap: No action (prevents accidents)
; - Double tap (within 300ms): Sends Escape

; Global variables for tap counting and timer management
tapCount := 0
isHyperKeyActive := false

; ================================================================================================
; THE ACTUAL SCRIPT STARTS HERE
; ================================================================================================

; Main CapsLock handler with v2.0 syntax
CapsLock::
{
    global tapCount, isHyperKeyActive
    if (!KeyWait("CapsLock", "T0.2")) ; Timeout occurred - key was held
    {
        ; CapsLock held longer - this is HyperKey mode
        isHyperKeyActive := true
        tapCount := 0
        CleanupTimers() ; Ensure no conflicting timers
        SetTimer(CheckCapsLock, 10) ; Start timer to monitor CapsLock status
    }
    else
    {
        ; Short tap on CapsLock - check for double tap
        tapCount += 1
        SetTimer(HandleDoubleTap, -300) ; Start 300ms timer
    }
}

; Handle double-tap functionality
HandleDoubleTap()
{
    global tapCount
    if (tapCount = 2)
    {
        Send("{Escape}") ; Send Escape if double-tapped quickly
    }
    tapCount := 0 ; Reset tap counter
}

; Monitor CapsLock state for HyperKey mode
CheckCapsLock()
{
    global isHyperKeyActive
    if (!GetKeyState("CapsLock", "P"))
    { 
        SetTimer(CheckCapsLock, 0) ; Turn off timer when CapsLock not pressed
        KeyWait("CapsLock") ; Wait for CapsLock to be released
        isHyperKeyActive := false
    }
}

; Cleanup function for timers
CleanupTimers()
{
    SetTimer(HandleDoubleTap, 0)
    SetTimer(CheckCapsLock, 0)
}

; ================================================================================================
; GENERAL HYPERKEY COMBINATIONS (all programs)
; ================================================================================================
; Use #HotIf directive for v2.0 context-aware hotkeys
#HotIf GetKeyState("CapsLock", "P") ; When CapsLock is pressed, execute the following hotkeys

; SPECIAL CHARACTERS - Second layer of top row 1-9 for shift functionality
1::Send("+1") ; Send Shift + 1 for !
2::Send("+2") ; Send Shift + 2 for @
3::Send("+3") ; Send Shift + 3 for #
4::Send("+4") ; Send Shift + 4 for $
5::Send("+5") ; Send Shift + 5 for %
6::Send("+6") ; Send Shift + 6 for ^
7::Send("+7") ; Send Shift + 7 for &
8::Send("+8") ; Send Shift + 8 for *
0::Send("+0") ; Send Shift + 0 for )
-::Send("_") ; Underscore
=::SendText("+") ; Plus sign
`::Send("~") ; Tilde (hyperkey + `)

; ================================================================================================
; QUOTES - Layout-Independent (US/NL) & Context-Aware - Solves the "Dead Key" issue found in layouts like NL-QWERTY vs US-QWERTY.
; ================================================================================================
;
; The Problem:
; - NL-QWERTY: Quotes are "dead keys" (waiting for input to create accents like é/ë).
; - US-QWERTY: Quotes are immediate keys.
;
; The Solution:
; - HyperKey + ' or " uses Unicode to bypass layout specifics, ensuring consistent behavior.
; - Inserts paired quotes ('') and places cursor inside, regardless of active layout.
; - Context-Aware: Sends single quote in apps with auto-close (VS Code, Obsidian).
; - Native Behavior: Normal typing (without HyperKey) retains dead key functionality for accents.
;
; - VS Code & Obsidian: These apps have their own "auto-close" features, so we only send a single quote to avoid duplication.
'::
{
    if (WinActive(APP_VSCODE) || WinActive(APP_OBSIDIAN))
    {
        ; Send Unicode Single Quote (U+0027)
        Send("{U+0027}") 
    }
    else
    {
        ; Send two Unicode Single Quotes and move left
        Send("{U+0027}{U+0027}") 
        Sleep(20) ; Short delay to ensure characters are placed before moving
        Send("{Left}")
    }
}

+':: ; HyperKey + Shift + '
{
    if (WinActive(APP_VSCODE) || WinActive(APP_OBSIDIAN))
    {
        ; Send Unicode Double Quote (U+0022) ; Send double quote only
        Send("{U+0022}")
    }
    else
    {
        ; Send two Unicode Double Quotes and move left
        Send("{U+0022}{U+0022}") 
        Sleep(20) ; Short delay to ensure characters are placed before moving
        Send("{Left}")
    }
}

; PARENTHESES - Context-aware behavior
9:: ; Place parentheses and cursor inside in all contexts except VS Code, Visual Studio, and Obsidian
{   
    if (WinActive(APP_VSCODE) || WinActive(APP_VISUAL_STUDIO) || WinActive(APP_OBSIDIAN))
    {
        ; Send only opening parenthesis in Visual Studio, VS Code, and Obsidian
        Send("(") 
    }
    else
    {
        ; Insert () everywhere and place cursor between parentheses
        Send("()")
        Sleep(20) 
        Send("{Left}") ; Place cursor between parentheses
    }
}

; BRACKETS - Context-aware behavior
; Curly brackets {} with HyperKey
+[:: ; Place curly brackets and cursor inside in all contexts except VS Code, Visual Studio, and Obsidian
{
    if (WinActive(APP_VSCODE) || WinActive(APP_VISUAL_STUDIO) || WinActive(APP_OBSIDIAN))
    {
        ; Send only opening curly bracket in Visual Studio, VS Code, and Obsidian
        Send("{")
    }
    else
    {
        ; Insert {} everywhere and place cursor between brackets
        SendText("{}")
        Sleep(20) 
        Send("{Left}") ; Place cursor between brackets
    }
}

; Square brackets [] with HyperKey
[:: ; Place square brackets and cursor inside in all contexts except VS Code, Visual Studio, and Obsidian
{
    if (WinActive(APP_VSCODE) || WinActive(APP_VISUAL_STUDIO) || WinActive(APP_OBSIDIAN))
    {
        ; Send only opening square bracket in Visual Studio, VS Code, and Obsidian
        Send("[")
    }
    else
    {
        ; Insert [] everywhere and place cursor between brackets
        Send("[]")
        Sleep(20) 
        Send("{Left}") ; Place cursor between brackets
    }
}

; CLIPBOARD OPERATIONS
x::Send("^x") ; Cut with Hyperkey + X
c::Send("^c") ; Copy with Hyperkey + C
v::Send("^v") ; Paste with Hyperkey + V
+v::Send("#v") ; Open clipboard history (Win + V)
a::Send("^a") ; Select all with HyperKey

; UNDO & REDO
z::Send("^z") ; Undo with Hyperkey + Z (Ctrl + Z)
+z::Send("^y") ; Redo with Hyperkey + Shift + Z (Ctrl + Y)

; CONTEXT MENU (Right-click menu)
+/::Send("+{F10}") ; Open context menu with Hyperkey + Shift + / (same as right-click menu or Shift + F10)

; NAVIGATION KEYS LAYOUT REFERENCE
;           _______ _______ _______ 
;          |\     /|\     /|\     /|
;          | +---+ | +---+ | +---+ |     U = Home
;          | |   | | |   | | |   | |     I = Up Arrow ↑
;          | | U | | | I | | | O | |     O = End
;          | +---+ | +---+ | +---+ |
;          |/_____\|/_____\|/_____\|
;    _______ _______ _______ _______ _______ 
;    |\     /|\     /|\     /|\     /|\     /|
;    | +---+ | +---+ | +---+ | +---+ | +---+ |   H = Jump Word Left 
;    | |   | | |   | | |   | | |   | | |   | |   J = Left Arrow ←
;    | | H | | | J | | | K | | | L | | | ; | |   K = Down Arrow ↓ 
;    | +---+ | +---+ | +---+ | +---+ | +---+ |   L = Right Arrow →
;    |/_____\|/_____\|/_____\|/_____\|/_____\|   ; = Jump Word Right 
;          _______ _______ _______ _______ 
;        |\     /|\     /|\     /|\     /|
;        | +---+ | +---+ | +---+ | +---+ |     N = Delete Word Left
;        | |   | | |   | | |   | | |   | |     M = Delete Character Left
;        | | N | | | M | | | , | | | . | |     , = Delete Character Right
;        | +---+ | +---+ | +---+ | +---+ |     . = Delete Word Right
;        |/_____\|/_____\|/_____\|/_____\|
                                  
; NAVIGATION (Almost Vim-style)
j::Send("{Left}") ; Arrow left with Hyperkey + J
l::Send("{Right}") ; Arrow right with Hyperkey + L
i::Send("{Up}") ; Arrow up with Hyperkey + I
k::Send("{Down}") ; Arrow down with Hyperkey + K
h::Send("^{Left}") ; Word left with Hyperkey + H
`;::Send("^{Right}") ; Word right with Hyperkey + ;
u::Send("{Home}") ; Go to line start with Hyperkey + U
o::Send("{End}") ; Go to line end with Hyperkey + O

; Select text with Hyper + Shift & Navigation (same as navigation but with Shift pressed)
+j::Send("+{Left}") ; Select left with Hyperkey + Shift + J
+k::Send("+{Down}") ; Select down with Hyperkey + Shift + K
+i::Send("+{Up}") ; Select up with Hyperkey + Shift + I
+l::Send("+{Right}") ; Select right with Hyperkey + Shift + L 
+h::Send("^+{Left}") ; Select word left with Hyperkey + Shift + H
+`;::Send("^+{Right}") ; Select word right with Hyperkey + Shift + ;
+u::Send("+{Home}") ; Select to line start with Hyperkey + Shift + U
+o::Send("+{End}") ; Select to line end with Hyperkey + Shift + O

; Delete Characters/Words Left and Right of cursor, with selection check
n::SmartDelete("^{Backspace}") ; Delete WORD left or delete selection

.::SmartDelete("^{Delete}") ; Delete WORD right or delete selection

m::SmartDelete("{Backspace}") ; Delete CHARACTER left or delete selection
    
,::SmartDelete("{Delete}") ; Delete CHARACTER right or delete selection



; ================================================================================================
; VISUAL STUDIO CODE SPECIFIC COMBINATIONS
; ================================================================================================
#HotIf GetKeyState("CapsLock", "P") && WinActive(APP_VSCODE) ; VS Code active
d::Send("+!{Down}") ; HyperKey + D: Duplicate line (Like default shortcut Shift + Alt + Down)
/::Send("^/") ; HyperKey + /: Toggle comment (Ctrl + /)
!i::SendInput("{Alt Down}{Up}{Alt Up}") ; HyperKey + Alt + I: Move line up
!k::SendInput("{Alt Down}{Down}{Alt Up}") ; HyperKey + Alt + K: Move line down
e::Send("^+e") ; HyperKey + E: Focus Explorer (Ctrl+Shift+E)
#HotIf

; ================================================================================================
; VISUAL STUDIO SPECIFIC COMBINATIONS  
; ================================================================================================
#HotIf GetKeyState("CapsLock", "P") && WinActive(APP_VISUAL_STUDIO) ; Visual Studio active
d::Send("^d") ; HyperKey + D: Duplicate line (Ctrl + D)
/::Send("^/") ; HyperKey + /: Toggle comment (Ctrl + /)
!i::SendInput("{Alt Down}{Up}{Alt Up}") ; HyperKey + Alt + I: Move line up
!k::SendInput("{Alt Down}{Down}{Alt Up}") ; HyperKey + Alt + K: Move line down
#HotIf

; ================================================================================================
; OBSIDIAN SPECIFIC COMBINATIONS
; ================================================================================================
#HotIf GetKeyState("CapsLock", "P") && WinActive(APP_OBSIDIAN) ; Obsidian active
; Line operations
d::Send("^d") ; HyperKey + D: Duplicate line (Ctrl + D)
!i::Send("!{Up}") ; HyperKey + Alt + I: Move line up (Alt + Up)
!k::Send("!{Down}") ; HyperKey + Alt + K: Move line down (Alt + Down)

; Navigation
!j::Send("!{Left}") ; HyperKey + Alt + J: Previous header (Alt + Left)
!l::Send("!{Right}") ; HyperKey + Alt + L: Next header (Alt + Right)
^j::Send("^!{Left}") ; HyperKey + Ctrl + J: Navigate back (Ctrl + Alt + Left)
^l::Send("^!{Right}") ; HyperKey + Ctrl + L: Navigate forward (Ctrl + Alt + Right)

; Folding
^i::Send("^{Up}") ; HyperKey + Ctrl + I: Fold heading (Ctrl + Up)
^k::Send("^{Down}") ; HyperKey + Ctrl + K: Unfold heading (Ctrl + Down)

; Links
^Enter::Send("^{Enter}") ; HyperKey + Ctrl + Enter: Open link under cursor
+^Enter::Send("+^{Enter}") ; HyperKey + Shift + Ctrl + Enter: Open link in new tab
#HotIf

; ================================================================================================
; WINDOWS FILE EXPLORER SPECIFIC COMBINATIONS
; ================================================================================================
#HotIf GetKeyState("CapsLock", "P") && WinActive(APP_EXPLORER) ; File Explorer active
!i::Send("!{Up}") ; HyperKey + Alt + I: Up in folder structure (Alt + Up)
!k::Send("!{Down}") ; HyperKey + Alt + K: Down in folder structure (Alt + Down)
!j::Send("!{Left}") ; HyperKey + Alt + J: Navigate back (Alt + Left)
!l::Send("!{Right}") ; HyperKey + Alt + L: Navigate forward (Alt + Right)
#HotIf

; ================================================================================================
; BRAVE BROWSER SPECIFIC COMBINATIONS
; ================================================================================================
#HotIf GetKeyState("CapsLock", "P") && WinActive(APP_BRAVE) ; Brave browser active
^j::Send("!{Left}") ; HyperKey + Ctrl + J: Navigate back (Alt + Left)
^l::Send("!{Right}") ; HyperKey + Ctrl + L: Navigate forward (Alt + Right)
#HotIf

; ================================================================================================
; SQL SERVER MANAGEMENT STUDIO (SSMS) SPECIFIC COMBINATIONS
; ================================================================================================
#HotIf GetKeyState("CapsLock", "P") && WinActive(APP_SSMS) ; SSMS active

; Line manipulation
!i::SendInput("{Alt Down}{Up}{Alt Up}") ; HyperKey + Alt + I: Move line up
!k::SendInput("{Alt Down}{Down}{Alt Up}") ; HyperKey + Alt + K: Move line down

; Query execution
r::Send("{F5}") ; HyperKey + R: Execute query (F5)

; SQL snippet - HyperKey + Shift + 0 for SELECT-FROM-WHERE template
+0::
{
    SendInput("SELECT{Tab}")
    Sleep(50)
    SendInput("`nFROM{Tab}")
    Sleep(50)
    SendInput("`nWHERE{Tab}")
    Sleep(50)
    SendInput("{Up}") ; Move cursor back to FROM line
}

; Quotes - HyperKey + ' for double quotes with cursor between them
'::
{
    SendInput("''")
    SendInput("{Left}")
}

; Smart comment toggle - HyperKey + /
/::
{
    ; Save current clipboard content safely
    ClipSaved := ClipboardAll()
    
    ; Clear clipboard and copy selection
    A_Clipboard := ""
    Send("^c")
    
    ; Wait for clipboard with timeout
    if (!ClipWait(1))
    {
        A_Clipboard := ClipSaved ; Restore clipboard if copy failed
        return
    }

    ; Check if we have content to work with
    if (A_Clipboard = "")
    {
        A_Clipboard := ClipSaved ; Restore clipboard
        return
    }

    ; Check if all selected lines start with "--" (SQL comments)
    if (RegExMatch(A_Clipboard, "m)^\s*--"))
    {
        ; Uncomment: Remove "--" from start of lines
        Send("^k")
        Sleep(50)
        Send("^u")
        Sleep(50)
        Send("+{End}")
    }
    else
    {
        ; Comment: Add "--" to start of lines
        Send("^k")
        Sleep(50)
        Send("^c")
        Sleep(50)
        Send("+{End}")
    }
    
    ; Always restore original clipboard
    A_Clipboard := ClipSaved
}

#HotIf

; ================================================================================================
; BLOCKING HOTKEYS (Placed at the end for correct override behavior)
; ================================================================================================
; All blocking hotkeys are defined below, inside a single #HotIf GetKeyState("CapsLock", "P") block.
; This is intentional: in AutoHotkey v2.0, the last hotkey definition takes precedence.
; By placing the blocklist last, app-specific hotkeys (such as for VS Code, Obsidian, etc.) always
; work as intended, and all other keys are blocked only when HyperKey is active.
; This change was made to ensure context-aware hotkeys are never accidentally overridden by global blocks.
; Example: HyperKey+D duplicates a line in VS Code, but is blocked in other apps.

; Block the following keys during HyperKey mode
#HotIf GetKeyState("CapsLock", "P") ; When CapsLock is pressed, block the following hotkeys
b::return
d::return
e::return
f::return
q::return
r::return
s::return
t::return
w::return
y::return
\::return
p::return
g::return
#::return

; Explicitly block all other keys during HyperKey mode with shift
+a::return
+b::return 
+d::return
+e::return
+f::return
+q::return
+r::return 
+s::return
+t::return
+w::return
+y::return
+m::return
+n::return
+,::return
+.::return
+\::return
+p::return
+g::return
+#::Return
#HotIf


; ================================================================================================
; CAPSLOCK STATUS MANAGEMENT
; ================================================================================================
; Prevent CapsLock from turning on with modifier key combinations
+CapsLock::return  ; Disable Shift + CapsLock combination
!CapsLock::return  ; Disable Alt + CapsLock combination
^CapsLock::return  ; Disable Ctrl + CapsLock combination
<!^CapsLock::return  ; Disable Ctrl + Alt (AltGr) + CapsLock combination
<^>!CapsLock::return ; Disable AltGr + CapsLock combination
#CapsLock::return  ; Disable Win + CapsLock combination

; Use Right Shift + HyperKey (CapsLock) to toggle actual CapsLock on/off
>+CapsLock::
{
    SetCapsLockState(!GetKeyState("CapsLock", "T")) ; Toggle CapsLock state
}