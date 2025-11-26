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
; HyperKey Script Version: 1.1.0
; Compatible with AutoHotkey v1.1+
;
; ================================================================================================
; HYPERKEY WINDOWS SCRIPT - Advanced Keyboard Productivity Enhancement
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
; 1. Install AutoHotkey v1.1+ from https://www.autohotkey.com/
; 2. Place this script in your startup folder to run on boot
; 3. Right-click the AHK tray icon and select "Reload Script" after making changes
;
; CUSTOMIZATION:
; --------------
; • Modify existing shortcuts to match your workflow
; • Add new app-specific sections using #If WinActive("ahk_exe YourApp.exe") 
; • Block unused keys in the "Block Keys" section to prevent accidents
; • Use backtick (`) to escape special characters in send commands
;
; COMPATIBILITY:
; --------------
; • Windows 10/11 (PowerShell default)
; • AutoHotkey v1.1+
; • Works alongside other productivity tools
;
; AUTHOR: Mike Pattyn
; LICENSE: MIT - Free to use and modify
; VERSION: 1.1.0
; LAST UPDATED: November 2025
;
; ================================================================================================
; HyperKey_Windows_Script with AutoHotkey
; ================================================================================================
; AZERTY Notice: This script is optimized for US-ANSI layout and will behave unexpectedly on AZERTY.
; Comments are throughout the script. Add a semicolon (;) to disable a line.
; Visual Studio Code has an AutoHotkey extension (AHK++) for syntax highlighting. 
; Use backtick (`) to escape special characters.
; To reload the script after modifications:
; Right-click the AutoHotkey icon in the system tray and choose 'Reload Script'.
;
; ================================================================================================
; AutoHotkey Syntax - MODIFIER KEYS REFERENCE 
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
; HYPERKEY CONFIGURATION (CapsLock as HyperKey)
; ================================================================================================
; CapsLock hold activates HyperKey functionality:
; - Hold (longer than 0.2s): Activates HyperKey functionality
; CapsLock Double-Tap for Escape Functionality:
; - One short tap: No action (prevents accidents)
; - Double tap (within 300ms): Sends Escape


; ================================================================================================
; THE ACTUAL SCRIPT STARTS HERE
; ================================================================================================
CapsLock::
    KeyWait, CapsLock, T0.2 
    if ErrorLevel
    {
        ; CapsLock held longer - this is HyperKey mode
        ; Cancel double tap functionality
        SetTimer, HandleDoubleTap, Off
        tapCount := 0
        SetTimer, CheckCapsLock, 0 ; Start timer to monitor CapsLock status
    }
    else
    {
        ; Short tap on CapsLock - check for double tap
        tapCount += 1 ; Increment tap counter only on short tap
        SetTimer, HandleDoubleTap, -300 ; Start 300ms timer
    }
return

HandleDoubleTap:
    if (tapCount = 2) {
        Send, {Escape} ; Send Escape if double-tapped quickly
    }
    tapCount := 0 ; Reset tap counter
return

CheckCapsLock:
    if (!GetKeyState("CapsLock", "P")) { 
        SetTimer, CheckCapsLock, Off ; Turn off timer when CapsLock not pressed
        KeyWait, CapsLock ; Wait for CapsLock to be released
        SetTimer, CheckCapsLock, 10 ; Restart timer after 10ms
    }
return 

; ================================================================================================
; GENERAL HYPERKEY COMBINATIONS (all programs)
; ================================================================================================
; Combinations with HyperKey
#If GetKeyState("CapsLock", "P") ; When "hyperkey" is pressed (P means "pressed"), execute the following hotkeys
;
; SPECIAL CHARACTERS - Second layer of top row 1-9 for shift functionality
    1::Send, +1 ; Send Shift + 1 for !
    2::Send, +2 ; Send Shift + 2 for @
    3::Send, +3 ; Send Shift + 3 for #
    4::Send, +4 ; Send Shift + 4 for $
    5::Send, +5 ; Send Shift + 5 for %
    6::Send, +6 ; Send Shift + 6 for ^
    7::Send, +7 ; Send Shift + 7 for &
    8::Send, +8 ; Send Shift + 8 for *
    0::send, +0 ; Send Shift + 0 for )
    -::Send, _ ; Underscore
    =::Send, {Text}+ ; Plus sign
    `::Send, ~ ; Tilde (hyperkey + `)

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
    ':: ; HyperKey + '
        if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe")) {
            ; Send Unicode Single Quote (U+0027)
            SendInput, {U+0027} 
        } else {
            ; Send two Unicode Single Quotes and move left
            SendInput, {U+0027}{U+0027} 
            Sleep, 20 ; Short delay to ensure characters are placed before moving
            SendInput, {Left}
        }
    return
    
    +':: ; HyperKey + Shift + '
        if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe")) {
            ; Send Unicode Double Quote (U+0022) ; Send double quote only
            SendInput, {U+0022}
        } else {
            ; Send two Unicode Double Quotes and move left
            SendInput, {U+0022}{U+0022} 
            Sleep, 20 ; Short delay to ensure characters are placed before moving
            SendInput, {Left}
        }
    return

; PARENTHESES - Context-aware behavior
    9:: ; Place parentheses and cursor inside in all contexts except VS Code, Visual Studio, and Obsidian
    if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe Obsidian.exe")) {
        ; Send only opening parenthesis in Visual Studio, VS Code, and Obsidian
        SendInput, ( 
    } else {
        ; Insert () everywhere and place cursor between parentheses
        SendInput, ()
        Sleep, 20 
        SendInput, {Left} ; Place cursor between parentheses
    }
    return

; BRACKETS - Context-aware behavior
; Curly brackets {} with HyperKey
    +[:: ; Place curly brackets and cursor inside in all contexts except VS Code, Visual Studio, and Obsidian
        if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe Obsidian.exe")) {
            ; Send only opening curly bracket in Visual Studio, VS Code, and Obsidian
            SendInput, {
        } else {
            ; Insert {} everywhere and place cursor between brackets
            SendInput, {Text}{}
            Sleep, 20 
            SendInput, {Left} ; Place cursor between brackets
        }
    return

; Square brackets [] with HyperKey
    [:: ; Place square brackets and cursor inside in all contexts except VS Code, Visual Studio, and Obsidian
        if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe Obsidian.exe")) {
            ; Send only opening square bracket in Visual Studio, VS Code, and Obsidian
            SendInput, [
        } else {
            ; Insert [] everywhere and place cursor between brackets
            SendInput, []
            Sleep, 20 
            SendInput, {Left} ; Place cursor between brackets
        }
    return

; CLIPBOARD OPERATIONS
    x::Send, ^x ; Cut with Hyperkey + X
    c::Send, ^c ; Copy with Hyperkey + C
    v::Send, ^v ; Paste with Hyperkey + V
    +v::Send, #v ; Open clipboard history (Win + V)
    a::Send, ^a ; Select all with HyperKey

; UNDO & REDO
    z::Send, ^z ; Undo with Hyperkey + Z (Ctrl + Z)
    +z::Send, ^y ; Redo with Hyperkey + Shift + Z (Ctrl + Y)

; CONTEXT MENU (Right-click menu)
    +/::Send, +{F10} ; Open context menu with Hyperkey + Shift + / (same as right-click menu or Shift + F10)


    
;;;;; ======= NAVIGATION KEYS LAYOUT REFERENCE ======================================
;;;;;           _______ _______ _______ 
;;;;;          |\     /|\     /|\     /|
;;;;;          | +---+ | +---+ | +---+ |     U = Home
;;;;;          | |   | | |   | | |   | |     I = Up Arrow ↑
;;;;;          | | U | | | I | | | O | |     O = End
;;;;;          | +---+ | +---+ | +---+ |
;;;;;          |/_____\|/_____\|/_____\|
;;;;;    _______ _______ _______ _______ _______ 
;;;;;    |\     /|\     /|\     /|\     /|\     /|
;;;;;    | +---+ | +---+ | +---+ | +---+ | +---+ |   H = Jump Word Left 
;;;;;    | |   | | |   | | |   | | |   | | |   | |   J = Left Arrow ←
;;;;;    | | H | | | J | | | K | | | L | | | ; | |   K = Down Arrow ↓ 
;;;;;    | +---+ | +---+ | +---+ | +---+ | +---+ |   L = Right Arrow →
;;;;;    |/_____\|/_____\|/_____\|/_____\|/_____\|   ; = Jump Word Right 
;;;;;          _______ _______ _______ _______ 
;;;;;        |\     /|\     /|\     /|\     /|
;;;;;        | +---+ | +---+ | +---+ | +---+ |     N = Delete Word Left
;;;;;        | |   | | |   | | |   | | |   | |     M = Delete Character Left
;;;;;        | | N | | | M | | | , | | | . | |     , = Delete Character Right
;;;;;        | +---+ | +---+ | +---+ | +---+ |     . = Delete Word Right
;;;;;        |/_____\|/_____\|/_____\|/_____\|
                                 
    
; NAVIGATION (Almost Vim-style)
    j::Send, {Left} ; Arrow left with Hyperkey + J
    l::Send, {Right} ; Arrow right with Hyperkey + L
    i::Send, {Up} ; Arrow up with Hyperkey + I
    k::Send, {Down} ; Arrow down with Hyperkey + K
    h::Send, ^{Left} ; Word left with Hyperkey + H
    `;::Send, ^{Right} ; Word right with Hyperkey + ;
    u::Send, {Home} ; Go to line start with Hyperkey + U
    o::Send, {End} ; Go to line end with Hyperkey + O

; Select text with Hyper + Shift & Navigation (same as navigation but with Shift pressed)
    +j::Send, +{Left} ; Select left with Hyperkey + Shift + J
    +k::Send, +{Down} ; Select down with Hyperkey + Shift + K
    +i::Send, +{Up} ; Select up with Hyperkey + Shift + I
    +l::Send, +{Right} ; Select right with Hyperkey + Shift + L 
    +h::Send, ^+{Left} ; Select word left with Hyperkey + Shift + H
    +`;::Send, ^+{Right} ; Select word right with Hyperkey + Shift + ;
    +u::Send, +{Home} ; Select to line start with Hyperkey + Shift + U
    +o::Send, +{End} ; Select to line end with Hyperkey + Shift + O

; Delete Characters/Words Left and Right of cursor, with selection check
    n:: ; Delete WORD left or delete selection
        if (GetKeyState("Shift") || GetKeyState("LShift") || GetKeyState("RShift")) {
            Send, {Backspace} ; Delete selection if there is a selection
        } else {
            Send, ^{Backspace} ; Delete word left without selection
        }
    return

    .:: ; Delete WORD right or delete selection
        if (GetKeyState("Shift") || GetKeyState("LShift") || GetKeyState("RShift")) {
            Send, {Backspace} ; Delete selection if there is a selection
        } else {
            Send, ^{Delete} ; Delete word right without selection
        }
    return

    m:: ; Delete CHARACTER left or delete selection
        if (GetKeyState("Shift") || GetKeyState("LShift") || GetKeyState("RShift")) {
            Send, {Backspace} ; Delete selection if there is a selection
        } else {
            Send, {Backspace} ; Delete character left without selection
        }
    return
    
    ,:: ; Delete CHARACTER right or delete selection
        if (GetKeyState("Shift") || GetKeyState("LShift") || GetKeyState("RShift")) {
            Send, {Backspace} ; Delete selection if there is a selection
        } else {
            Send, {Delete} ; Delete character right without selection
        }
    return

; Explicitly block all other keys during HyperKey mode unless they are defined
; If you want to block a key, add it to the list below   

    ; d:: is handled in the "BLOCKING FOR OTHER APPLICATIONS" section below 
    ; It is enabled for specific apps (VS Code, Obsidian) and explicitly blocked for others.

    ; Block the following keys during HyperKey mode
    b::return
    e::return
    f::return
    q::return
    r::return
    s::return
    t::return
    w::return
    y::return
    ; [::return
    ; ]::return
    \::return
    ; '::return
    p::return
    g::return
    #::return
    ; Add any other keys to block if you notice they are not blocked
    
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
        ; +/::return  ; Not blocked - used for context menu
        ; +[::return  ; Not blocked - used for curly brackets
        ; +]::return  ; Not blocked - used for curly brackets
        +\::return
        ;+'::return   ; Not blocked - used for double quotes
        +p::return
        +g::return
        +#::Return
#If



; ================================================================================================
; BLOCKING FOR OTHER APPLICATIONS
; ================================================================================================
; Block specific keys in applications where they should not have functionality
#If GetKeyState("CapsLock", "P") && !WinActive("ahk_exe Code.exe") && !WinActive("ahk_exe devenv.exe") && !WinActive("ahk_exe Obsidian.exe")
    d::return ; Block d in all other applications except VS Code, Visual Studio, and Obsidian
#If

; ================================================================================================
; VISUAL STUDIO CODE SPECIFIC COMBINATIONS
; ================================================================================================
#If GetKeyState("CapsLock", "P") && WinActive("ahk_exe Code.exe") ; VS Code active
    d::Send, +!{Down} ; HyperKey + D: Duplicate line (Like default shortcut Shift + Alt + Down)
    /::Send, ^/ ; HyperKey + /: Toggle comment (Ctrl + /)
    !i::SendInput, {Alt Down}{Up}{Alt Up} ; HyperKey + Alt + I: Move line up
    !k::SendInput, {Alt Down}{Down}{Alt Up} ; HyperKey + Alt + K: Move line down
#If

; ================================================================================================
; VISUAL STUDIO SPECIFIC COMBINATIONS  
; ================================================================================================
#If GetKeyState("CapsLock", "P") && WinActive("ahk_exe devenv.exe") ; Visual Studio active
    d::Send, ^d ; HyperKey + D: Duplicate line (Ctrl + D)
    /::Send, ^/ ; HyperKey + /: Toggle comment (Ctrl + /)
    !i::SendInput, {Alt Down}{Up}{Alt Up} ; HyperKey + Alt + I: Move line up
    !k::SendInput, {Alt Down}{Down}{Alt Up} ; HyperKey + Alt + K: Move line down
#If


; ================================================================================================
; OBSIDIAN SPECIFIC COMBINATIONS
; ================================================================================================
#If GetKeyState("CapsLock", "P") && WinActive("ahk_exe Obsidian.exe") ; Obsidian active
    ; Line operations
    d::Send, ^d ; HyperKey + D: Duplicate line (Ctrl + D)
    !i::Send, !{Up} ; HyperKey + Alt + I: Move line up (Alt + Up)
    !k::Send, !{Down} ; HyperKey + Alt + K: Move line down (Alt + Down)
    
    ; Navigation
    !j::Send, !{Left} ; HyperKey + Alt + J: Previous header (Alt + Left)
    !l::Send, !{Right} ; HyperKey + Alt + L: Next header (Alt + Right)
    ^j::Send, ^!{Left} ; HyperKey + Ctrl + J: Navigate back (Ctrl + Alt + Left)
    ^l::Send, ^!{Right} ; HyperKey + Ctrl + L: Navigate forward (Ctrl + Alt + Right)
    
    ; Folding
    ^i::Send, ^{Up} ; HyperKey + Ctrl + I: Fold heading (Ctrl + Up)
    ^k::Send, ^{Down} ; HyperKey + Ctrl + K: Unfold heading (Ctrl + Down)
    
    ; Links
    ^Enter::Send, ^{Enter} ; HyperKey + Ctrl + Enter: Open link under cursor
    +^Enter::Send, +^{Enter} ; HyperKey + Shift + Ctrl + Enter: Open link in new tab
#If

; ================================================================================================
; WINDOWS FILE EXPLORER SPECIFIC COMBINATIONS
; ================================================================================================
#If GetKeyState("CapsLock", "P") && WinActive("ahk_exe explorer.exe") ; File Explorer active
    !i::Send, !{Up} ; HyperKey + Alt + I: Up in folder structure (Alt + Up)
    !k::Send, !{Down} ; HyperKey + Alt + K: Down in folder structure (Alt + Down)
    !j::Send, !{Left} ; HyperKey + Alt + J: Navigate back (Alt + Left)
    !l::Send, !{Right} ; HyperKey + Alt + L: Navigate forward (Alt + Right)
#If

; ================================================================================================
; BRAVE BROWSER SPECIFIC COMBINATIONS
; ================================================================================================
#If GetKeyState("CapsLock", "P") && WinActive("ahk_exe brave.exe") ; Brave browser active
    ^j::Send, !{Left} ; HyperKey + Ctrl + J: Navigate back (Alt + Left)
    ^l::Send, !{Right} ; HyperKey + Ctrl + L: Navigate forward (Alt + Right)
#If

; ================================================================================================
; SQL SERVER MANAGEMENT STUDIO (SSMS) SPECIFIC COMBINATIONS
; ================================================================================================
#If GetKeyState("CapsLock", "P") && WinActive("ahk_exe Ssms.exe") ; SSMS active

    ; Line manipulation
    !i::SendInput, {Alt Down}{Up}{Alt Up} ; HyperKey + Alt + I: Move line up
    !k::SendInput, {Alt Down}{Down}{Alt Up} ; HyperKey + Alt + K: Move line down
    
    ; Query execution
    r::Send, {F5} ; HyperKey + R: Execute query (F5)
    
    ; SQL snippet - HyperKey + Shift + 0 for SELECT-FROM-WHERE template
    +0::
        SendInput, SELECT{Tab}
        Sleep, 50
        SendInput, `nFROM{Tab}
        Sleep, 50
        SendInput, `nWHERE{Tab}
        Sleep, 50
        SendInput, {Up} ; Move cursor back to FROM line
        return  

    ; Quotes - HyperKey + ' for double quotes with cursor between them
    '::
        SendInput, ''
        SendInput, {Left}
        return    ; Smart comment toggle - HyperKey + /
    /::  
        ; Save current clipboard content
        ClipSaved := ClipboardAll
        Clipboard := "" ; Clear clipboard

        ; Copy current selection to clipboard
        Send, ^c
        ClipWait, 1 ; Wait max 1 second until content is in clipboard

        ; Check selection
        if (Clipboard != "") {
            ; Check if all selected lines start with "--"
            if (RegExMatch(Clipboard, "m)^\s*--")) {
                ; If lines start with "--", execute Uncomment
                Send, ^k
                Sleep, 50
                Send, ^u
                Sleep, 50
                Send, +{End}
            }
            else {
                ; If no lines with "--", execute Comment
                Send, ^k
                Sleep, 50
                Send, ^c
                Sleep, 50
                Send, +{End}
            }
        }        ; Restore original clipboard
        Clipboard := ClipSaved
        ClipSaved := ""
        return

#If

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
>+CapsLock:: SetCapsLockState, % !GetKeyState("CapsLock", "T") ; Toggle CapsLock state
return