# HyperKey Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## HyperKey [Unreleased]

### Planned
- Comment enhancements
- Additional application-specific features
- Second layer for advanced shortcuts 

---

## HyperKey [2.1.0] - 2025-11-26

### Added
- New hotkey: HyperKey + E in VS Code to focus/unfocus Explorer (Ctrl+Shift+E)
- Moved all blocking hotkeys to the end of the script with detailed explanation for correct override behavior

### Changed
- Updated documentation with detailed hotkey blocking mechanism explanations
- Added version comments to all script files for clarity
- Fixed version references in script headers
- Improved changelog formatting and consistency
 - Improved double-tap CapsLock responsiveness: Escape is now sent immediately on the second tap
 - Refactored quote and bracket handling to use a new `InsertPair` helper function for consistency

### Fixed
- Corrected incorrect version references in v1.1 script header

---

## HyperKey [2.0.0] - 2025-11-25

### Added
- AutoHotkey v2.0 compatibility
- Modern syntax implementation
- Project structure based on different AutoHotkey versions 
- Comprehensive migration documentation
- App-specific hotkey (HyperKey + E for VS Code Explorer focus/unfocus to switch quickly between editor and file explorer)

### Changed
- **BREAKING**: Requires AutoHotkey v2.0+
- Updated all hotkey syntax to v2.0 standards
- Improved timer management and key state detection
- Refactored clipboard operations for better reliability
- Moved all blocking hotkeys to the end of the script for correct override behavior. This ensures app-specific hotkeys always take precedence over global blocks.
- Refactored app executable names to use variables for easier maintenance
- Removed obsolete blocking section for cleaner code

### Deprecated
- AutoHotkey v1.1 support (moved to legacy v1.1 branch)

### Documentation
- Complete rewrite of documentation structure
- Added migration information
- New README with version comparison

---

## HyperKey [1.1.0] - 2024-XX-XX

### Added
- SQL Server Management Studio (SSMS) specific shortcuts
- Smart comment toggle for SQL queries
- SELECT-FROM-WHERE template insertion
- Enhanced clipboard history integration
- Improved Unicode quote handling for international layouts
- Context-aware bracket pairing
- File Explorer navigation shortcuts
- Browser navigation enhancements

### Changed
- Improved double-tap CapsLock detection
- Enhanced timer reliability
- Better app-specific hotkey isolation
- Optimized key blocking mechanism

### Fixed
- Resolved conflicts with VS Code auto-bracket features
- Improved reliability in high-CPU situations
- Better handling of rapid CapsLock presses
- Fixed edge cases in word deletion functions

### Documentation
- Added comprehensive feature documentation
- Enhanced visual layout reference
- Added practical examples and use cases

---

## HyperKey [1.0.0] - 2022-XX-XX

### Added
- Initial release of HyperKey-script for Windows
- CapsLock as HyperKey modifier
- Vim-inspired navigation (IJKL)
- Basic clipboard operations (XCV)
- Smart text wrapping for quotes and brackets
- Double-tap CapsLock for Escape
- Right Shift + CapsLock for CapsLock toggle
- App-specific enhancements for VS Code
- Context-aware behavior
- Key blocking mechanism
- Comprehensive documentation

---

## Version History Summary

| Version | Release Date | AutoHotkey | Status |
|---------|--------------|------------|--------|
| 2.1.0  | 2025-11-26  | v2.0+     | ✅ Current |
| 2.0.0  | 2025-11-25  | v2.0+     | ⚠️ Legacy |
| 1.1.0  | 2024-XX-XX  | v1.1+     | ⚠️ Legacy |
| 1.0.0  | 2022-XX-XX  | v1.1+     | ⚠️ Legacy |



