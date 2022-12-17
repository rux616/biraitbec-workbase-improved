BiRaitBec WorkBase Improved
===========================
by rux616

Table Of Contents
-----------------
- [BiRaitBec WorkBase Improved](#biraitbec-workbase-improved)
    - [Table Of Contents](#table-of-contents)
- [Overview](#overview)
    - [Summary](#summary)
    - [Features](#features)
    - [Requirements](#requirements)
    - [Installation](#installation)
    - [Repack Files](#repack-files)
- [Instructions](#instructions)
    - [Common](#common)
    - [Standard](#standard)
    - [Hybrid](#hybrid)
    - [Custom](#custom)
- [Advanced Usage](#advanced-usage)
    - [Supported Command Line Parameters](#supported-command-line-parameters)
    - [Unsupported Command Line Parameters](#unsupported-command-line-parameters)
- [Troubleshooting](#troubleshooting)
    - [Known Issues](#known-issues)
    - [Logs](#logs)
- [Copyright and Licenses](#copyright-and-licenses)
- [Credits and Thanks](#credits-and-thanks)
- [Contact](#contact)


Overview
========

Summary
-------
An evolution of the BiRaitBec WorkBase file.

The original [BiRaitBec guide](https://www.nexusmods.com/fallout4/mods/23556) (no longer supported), and the updated guide at the [Collective Modding Discord server](https://discord.gg/DfFYJtt8p4) (which _is_ still being supported) specify that the user install the original WorkBase file, but that one doesn't generate clear errors and is generally hard to diagnose.

This edition attempts to address those shortcomings.

This mod is also available at the [GitHub project](https://github.com/rux616/biraitbec-workbase-improved).

([TOC](#table-of-contents))

Features
--------
- Checks to see if the script is being run from a protected folder (Program Files, the user profile folder, etc.)
- Checks to make sure the needed Visual C++ 2012 Update 4 (or later) redistributable files are installed
- Checks to make sure enough free space is available
- Will only (re)build archives it needs
- Incremental status is printed to the screen
- Logs are generated in the `Logs` folder
- In "Standard" mode, repack archives are detected in the `Repack7z` folder and automatically extracted
- Original BA2 archives can be used directly from the Fallout 4 Data folder
- Verifies the repack archives, original BA2 archives, and patched BA2 archives via XXH128 hash
- Optionally has an Extended Validation mode where files are validated after every step
- Fixes known bad patched files
- Cleans up after itself

([TOC](#table-of-contents))

Requirements
------------
- Visual C++ 2012 Update 4 [redistributable](https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe)
- Fallout 4

([TOC](#table-of-contents))

Installation
------------
- Extract this archive to somewhere outside of the user folder. (Use `C:\WorkBase` for example.)

([TOC](#table-of-contents))

Repack Files
------------
These are the files from the [BiRaitBec Guide](https://www.nexusmods.com/fallout4/mods/23556?tab=files) as well as the Vault Fix file from the [SavrenX HD 1K Buildings and Interior](https://www.nexusmods.com/fallout4/mods/40534) mod which are supported.

**Performance:**
- [1. Performance Overhaul](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164236)
    - Version: 1.0
    - Filename: `1. Performance Overhaul-23556-1-0-1565601510.7z`

**Main:**
- [2a. Main Repack - Part One](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164245)
    - Version: 1.0
    - Filename:  `2a. Main Repack - Part One-23556-1-0-1565616028.7z`
- [2b. Main Repack - Part Two](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164487)
    - Version: 1.0
    - Filename:  `2b. Main Repack - Part Two-23556-1-0-1565980979.7z`
- [2c. Main Repack - Part Three](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164241)
    - Version: 1.0
    - Filename: `2c. Main Reapack - Part Three-23556-1-0-1565605113.7z`

**Quality:**
- [2a. Quality Addon - Part One](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164210)
    - Version: 1.0
    - Filename: `2a. Quality Addon - Part One-23556-1-0-1565546826.7z`
- [2b. Quality Overhaul - Part Two](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164486)
    - Version: 1.0
    - Filename: `2b. Quality Overhaul - Part Two-23556-1-0-1565980973.7z`

**Vault Fix:**

Recommended if using the Performance, Main, or Quality repack sets.

- [Fix Vault-Window-Metal-Institute](https://www.nexusmods.com/fallout4/mods/40534?tab=files&file_id=164279)
    - Version: 1.02
    - Filename: `Fix Vault-Window-Metal-Institute-40534-1-02-1565670781.7z`

**Restyle:**
- [3. Restyle Pack - Fomod](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164211)
    - Version: 1.0
    - Filename: `3. Restyle Pack - Fomod-23556-1-0-1565546849.7z`

([TOC](#table-of-contents))


Instructions
============
There are three modes of operation for BiRaitBec WorkBase Improved:

- Standard (recommended)
    - Original BA2 archives: Vanilla
    - Automatic extraction of repack archives: Yes
    - Use vanilla original BA2 archives in conjunction with the repack archives.
- Hybrid
    - Original BA2 archives: At least one alternate (Luxor/Luxor 2k/PhyOp/Performout)
    - Automatic extraction of repack archives: Yes
    - Use alternate original BA2 archives in conjunction with the repack archives.
- Custom
    - Original BA2 archives: Vanilla or at least one alternate (Luxor/Luxor 2k/PhyOp/Performout)
    - Automatic extraction of repack archives: No
    - Use custom assets

In all modes, the installer will first look at the `OriginalBa2` folder when looking for the original BA2 archives. If it doesn't find an archive there, it will then attempt to look in the Fallout 4 Data folder.

If any non-vanilla original BA2 archives are found, the script will automatically switch to Hybrid mode if no texture files are present in the `PatchedFiles` folder. If texture files _are_ found in the `PatchedFiles` folder, the script will switch to Custom mode.

Currently, the following original BA2 archives are supported:

- Vanilla (game version 1.10.163.0, steam build ID 4460038)
    - (All archives)
- Luxor's Fallout 4 HD Overhaul (mod version 1.3)
    - `DLCCoast - Textures.ba2` (file version 1.3)
    - `DLCNukaWorld - Textures.ba2` (file version 1.2.1)
    - `DLCRobot - Textures.ba2` (file version 1.2)
    - `DLCworkshop01 - Textures.ba2` (file version 1.2)
    - `DLCworkshop02 - Textures.ba2` (file version 1.2)
    - `DLCworkshop03 - Textures.ba2` (file version 1.2)
    - `Fallout4 - Textures1.ba2` (file version 1.3)
    - `Fallout4 - Textures2.ba2` (file version 1.3)
    - `Fallout4 - Textures3.ba2` (file version 1.3)
    - `Fallout4 - Textures4.ba2` (file version 1.3)
    - `Fallout4 - Textures5.ba2` (file version 1.3)
    - `Fallout4 - Textures6.ba2` (file version 1.3)
    - `Fallout4 - Textures7.ba2` (file version 1.2.2)
    - `Fallout4 - Textures8.ba2` (file version 1.2.2)
    - `Fallout4 - Textures9.ba2` (file version 1.2.2)
- Luxor's Fallout 4 HD Overhaul 2k (mod version 1.0)
    - (All archives)
- PhyOp's Overhauled Optimized Textures (v1.2a)
    - Custom
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Custom Brahmin Pack Fix
        - `Fallout4 - Textures1.ba2`
    - Custom Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
    - Custom Street Sign Fix
        - `Fallout4 - Textures7.ba2`
    - Custom Original Pip-boy
        - `Fallout4 - Textures2.ba2`
    - Custom Original Weapon Colors
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `Fallout4 - Textures8.ba2`
    - Custom Performance
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures7.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Custom Performance Brahmin Pack Fix
        - `Fallout4 - Textures1.ba2`
    - Custom Performance Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
    - Custom Performance Original Pip-boy
        - `Fallout4 - Textures2.ba2`
    - Dark
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Dark Brahmin Pack Fix
        - `Fallout4 - Textures1.ba2`
    - Dark Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
    - Dark Street Sign Fix
        - `Fallout4 - Textures7.ba2`
    - Dark Performance
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures7.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Dark Performance Brahmin Pack Fix
        - `Fallout4 - Textures1.ba2`
    - Dark Performance Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
    - Light
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures7.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Light Brahmin Pack Fix
        - `Fallout4 - Textures1.ba2`
    - Light Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
    - Light Performance
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures7.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Light Performance Brahmin Pack Fix
        - `Fallout4 - Textures1.ba2`
    - Light Performance Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
    - Light Potato
        - `DLCCoast - Textures.ba2`
        - `DLCNukaWorld - Textures.ba2`
        - `DLCRobot - Textures.ba2`
        - `DLCworkshop01 - Textures.ba2`
        - `DLCworkshop02 - Textures.ba2`
        - `DLCworkshop03 - Textures.ba2`
        - `Fallout4 - Textures1.ba1`
        - `Fallout4 - Textures2.ba2`
        - `Fallout4 - Textures3.ba2`
        - `Fallout4 - Textures5.ba2`
        - `Fallout4 - Textures6.ba2`
        - `Fallout4 - Textures7.ba2`
        - `Fallout4 - Textures8.ba2`
        - `Fallout4 - Textures9.ba2`
    - Light Potato Face Sculpting Fix
        - `Fallout4 - Textures4.ba2`
- Rikintosh's Performout (v2.0)
    - `DLCCoast - Textures.ba2` (file version 1.0)
    - `DLCNukaWorld - Textures.ba2` (file version 1.0)
    - `DLCRobot - Textures.ba2` (file version 1.0)
    - `DLCworkshop01 - Textures.ba2` (file version 1.0)
    - `DLCworkshop02 - Textures.ba2` (file version 1.0)
    - `DLCworkshop03 - Textures.ba2` (file version 1.0)
    - `Fallout4 - Textures1.ba2` (file version 2.0)
    - `Fallout4 - Textures2.ba2` (file version 2.0)
    - `Fallout4 - Textures3.ba2` (file version 2.0)
    - `Fallout4 - Textures4.ba2` (file version 2.0)
    - `Fallout4 - Textures5.ba2` (file version 2.0)
    - `Fallout4 - Textures6.ba2` (file version 2.0)
    - `Fallout4 - Textures7.ba2` (file version 2.0)
    - `Fallout4 - Textures8.ba2` (file version 2.0)
    - `Fallout4 - Textures9.ba2` (file version 2.0)

([TOC](#table-of-contents))

Common
------
NOTE: The script will automatically attempt to locate and use original BA2 archives from the Fallout 4 Data folder if it doesn't find them in the `OriginalBa2` folder.

Currently supports the BA2s from vanilla, [Luxor's Fallout 4 HD Overhaul](https://www.nexusmods.com/fallout4/mods/52423), [Luxor's Fallout 4 HD Overhaul 2k](https://www.nexusmods.com/fallout4/mods/65720), [PhyOp's Overhauled Optimized Textures](https://www.nexusmods.com/fallout4/mods/27038), and [Rickintosh's Performout](https://www.nexusmods.com/fallout4/mods/61750).

- [Optional] Copy the original BA2 archives from the Fallout 4 Data folder to the `OriginalBa2` folder.

([TOC](#table-of-contents))

Standard
--------
This mode is designed to be a mostly automatic process which validates both input and output files.

- Put the repack files you have downloaded into the `Repack7z` folder.
- Double click on "Installer.cmd". (If it just opens up in Notepad or something, right click it and choose "Open" instead.)
- A dialog box will pop up asking you to choose an output folder for the patched BA2 archives. By default it goes to the `PatchedBa2` folder, but you can choose a different folder. **Do not choose the Fallout 4 Data folder.**
- The script will then proceed to validate and extract the the repack archives, then create and validate the patched BA2 archives.

Notes:

- Only works with vanilla original BA2 archives (if non-vanilla original BA2s are detected, mode is switched to "Hybrid" if no texture files are present in the `PatchedFiles` folder, or "Custom" mode if they are).
- If using the `Restyle` repack set, the "Author's Choice" options are automatically chosen.

([TOC](#table-of-contents))

Hybrid
------
This mode is similar to "Standard" mode in that it's a mostly automatic process, but it allows alternate original BA2 archives (Luxor/Luxor 2k/PhyOp/Performout) to be used instead, sacrificing patched BA2 archive validation to do so.

- Put the repack files you have downloaded into the `Repack7z` folder.
- Put the alternate original BA2 files (Luxor/Luxor 2k/PhyOp/Performout) into the `OriginalBa2` folder.
- Double click on "Installer.cmd". (If it just opens up in Notepad or something, right click it and choose "Open" instead.)
- A dialog box will pop up asking you to choose an output folder for the patched BA2 archives. By default it goes to the `PatchedBa2` folder, but you can choose a different folder. **Do not choose the Fallout 4 Data folder.**
- The script will then proceed to validate and extract the the repack archives, then create (but **NOT** validate) the patched BA2 archives.

Notes:

- Only works with alternate original BA2 archives and if no texture files are present in the `PatchedFiles` folder (mode is switched to "Custom" mode if there are texture files present in the `PatchedFiles` folder).
- If using the `Restyle` repack set, the "Author's Choice" options are automatically chosen.

([TOC](#table-of-contents))

Custom
------
This process is basically the traditional BRB install process as has been described in the guide and is done the same way.

- Extract all the repack files to the `PatchedFiles` folder (creating it first, if necessary).
- Double click on "Installer.cmd". (If it just opens up in Notepad or something, right click it and choose "Open" instead.)
- A dialog box will pop up asking you to choose an output folder for the patched BA2 archives. By default it goes to the `PatchedBa2` folder, but you can choose a different folder. **Do not choose the Fallout 4 Data folder.**
- The script will then proceed to validate the original BA2 archives and create the patched BA2 archives.

([TOC](#table-of-contents))


Advanced Usage
==============
To utilize these parameters, you will have to open a PowerShell window, navigate to the folder where BRB WorkBase Improved is extracted, and invoke the script manually. For example: `.\Tools\lib\Installer.ps1 -ForceOperationMode Standard -ExtendedValidationMode`. Alternatively, you can edit the `Installer.cmd` file and change the `-Command` parameter to the previous example.

([TOC](#table-of-contents))

Supported Command Line Parameters
---------------------------------
These (and only these) parameters are supported.

- `ExtendedValidationMode`: Activates Extended Validation mode
- `MakeDLCOptional`: Make it so that the DLC archives are optional instead of required to have a successful run
- `SkipOriginalBa2Validation`: Skip validation of original BA2 archives

([TOC](#table-of-contents))

Unsupported Command Line Parameters
-----------------------------------
Most of these were added for my own convenience while testing or for debugging purposes. I take no responsibility if your computer implodes when using them.

- `NoClearScreen`: Prevents the script from clearing the screen when starting up
- `OriginalBa2Folder`: Changes the OriginalBa2 folder
- `PatchedBa2Folder`: Changes the PatchedBa2 folder
- `ForceOperationMode <Custom|Hybrid|Standard>`: Forces "Custom", "Hybrid", or "Standard" mode of operation
- `SkipPowerShellVersionCheck`: Skip checking that this script is being run by a supported version of PowerShell
- `SkipProblematicDirectoryCheck`: Skip checking that this script is not being run from a problematic directory
- `SkipVisualCppRedistFileCheck`: Skip checking the Visual C++ Redistributable file versions
- `SkipChoosingPatchedBa2Dir`: Don't display the dialog box to choose the patched BA2 folder and instead choose the default (`.\PatchedBa2`)
- `SkipRepackValidation`: Skip the validation of the repack archives
- `SkipFreeSpaceCheck`: Skip the free space check on the various drives
- `SkipRepackExtraction`: Skip the extraction of the repack archives
- `SkipExistingPatchedValidation`: Skip validation of any existing patched BA2 archives
- `ForcePatchedBa2Hashing`: Force the script to hash a patched BA2 file after creation, even if the size doesn't match any known archives
- `AllowUnchanged`: Allow unchanged patched BA2 archives to be created (don't throw an error)
- `SkipFinalCleanup`: Don't delete the `.\PatchedFiles` folder after the script is complete
- `NoPauseOnExit`: Don't pause on exit

([TOC](#table-of-contents))


Troubleshooting
===============
This script has a lot of built-in checks that will tend to have very clear error messages. However, if you run into something that's not clear, post a message on the Nexus Mods mod comments page or make an issue on the GitHub project.

Known Issues
------------
- Sometimes when attempting to running the Installer script, the console window will open then immediately close again. If this happens, you can run it by doing the following:
    - Click the Start button, type "Command Prompt" and hit "Enter" to open up a new Command Prompt window.
    - Type the name of the drive you have WBI extracted to (for example `C:` or `D:`) and hit "Enter".
    - Type `cd` followed by the folder where you have WorkBase Improved extracted to in quotes (for example `cd "D:\Path to\WorkBase Improved"`) and hit "Enter".
    - Type the command `Installer.cmd` and hit "Enter".
- The script appears stuck at "Patched BA2 archive folder:".
    - The script has opened up a window to enable you to choose the folder where the patched BA2 archives will go. Sometimes this window gets hidden behind others, so hit the Windows+Tab key combination, look for a window titled "Browse For Folder", then click on it.
- In some cases, there is something called Group Policy that may be applied to a computer. If Group Policy disables PowerShell scripts, this script simply will not work. The Group Policy disabling PowerShell must itself be disabled before this script will work.
- Don't rename the repack files. This script has some limited flexibility for recognizing file names appended with things like "(1)" or " - Copy" and such, but not much more than that.

([TOC](#table-of-contents))

Logs
----
Logs will be located in the `Logs` sub-folder. There will be 2 or 4 files generated per run, depending on how far the process gets: `current.install.log` and `install_<timestamp>.log`, and `current.tool.log` and `tool_<timestamp>.log`, where `<timestamp>` is the timestamp of when the process was started, for example `20220201T205350Z`. The `current.*.log` files will be overwritten every run, while the `*_<timestamp>.log` files serve as a more permanent record.

The `install` log generally mirrors what is seen on screen, and the `tool` log is the output of the various tools used, such as `7za.exe` and `archive2.exe`. When asking questions or attempting to get help for errors, please include at least the `current.install` log.

([TOC](#table-of-contents))


Copyright and Licenses
======================
Copyright 2022 Dan Cassidy

All my code in this tool is licensed under the [GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) or later.

Everything else in this mod created by me is [CC-BY-SA](https://creativecommons.org/licenses/by-sa/4.0/legalcode) licensed.

This tool is bundled with the following programs, each having their own copyrights and licenses:
- [7-Zip 64-bit v22.01 (2022-07-15) by Igor Pavlov](https://www.7-zip.org/)
- [Archive2 v1.1.0.4 by Bethesda Game Studios, part of the Fallout 4 Creation Kit](https://bethesda.net/en/game/bethesda-launcher)
- [BSA Browser v1.14.1 by AlexxEG](https://www.nexusmods.com/skyrimspecialedition/mods/1756)
- [xxhsum v0.8.1 by Cyan4973](https://cyan4973.github.io/xxHash/)

This tool also uses the following source code; each has their own copyrights and licenses:
- [Crc32 hash sum by Damien Guard](https://github.com/damieng/DamienGKit/blob/178992cb6215104a9312720881d8465d7bf040ba/CSharp/DamienG.Library/Security/Cryptography/Crc32.cs)
- [Get-KnownFolderPath function by Boe Prox](https://github.com/proxb/PInvoke/blob/bd3b5e572a722a2e7557968761992b334c134596/Get-KnownFolderPath.ps1)

([TOC](#table-of-contents))


Credits and Thanks
==================
- BiRaitBec: For the original WorkBase file and [guide](https://www.nexusmods.com/fallout4/mods/23556)
- ScreamingLake and CyberDanz: For administering the [Community Modding discord server and the updated BRB guide](https://discord.gg/DfFYJtt8p4)
- luxor8071: For the [Fallout 4 HD Overhaul](https://www.nexusmods.com/fallout4/mods/52423) and [Fallout 4 HD Overhaul 2k](https://www.nexusmods.com/fallout4/mods/65720) mods
- Phylith: For the [PhyOp - Overhauled Optimized Textures](https://www.nexusmods.com/fallout4/mods/27038) mod
- Rikintosh: For the [Rickintosh's Performout](https://www.nexusmods.com/fallout4/mods/61750) mod
- Lively: For helping me make the error messaging easier to understand
- Aegis27: For helping me make the error messaging easier to understand
- Kaethela: For being an excellent guinea pig and helping me track down the issue with USB drives

([TOC](#table-of-contents))


Contact
=======
If you find a bug or have a question about the mod, please post it on the [mod page at Nexus Mods](https://www.nexusmods.com/fallout4/mods/57782), or in the [GitHub project](https://github.com/rux616/biraitbec-workbase-improved).

If you need to contact me personally, I can be reached through one of the following means:
- **Nexus Mods**: [rux616](https://www.nexusmods.com/users/124191) (Send a message via the "CONTACT" button)
- **Email**: rux616-at-pm-dot-me (replace `-at-` with `@` and `-dot-` with `.`)
- **Discord**: rux616#0950 (I tend to hang out on the [Nexus Mods](https://discord.gg/nexusmods) and [Wabbajack](https://discord.gg/wabbajack) servers, amongst others)

([TOC](#table-of-contents))
