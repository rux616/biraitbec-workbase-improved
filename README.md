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
    - [Automatic](#automatic)
    - [Custom](#custom)
- [Troubleshooting Info](#troubleshooting-info)
    - [Logs](#logs)
- [Copyright and Licenses](#copyright-and-licenses)
- [Credits and Thanks](#credits-and-thanks)
- [Contact](#contact)


Overview
========

Summary
-------
An evolution of the BiRaitBec WorkBase file.

The original [BiRaitBec guide](https://www.nexusmods.com/fallout4/mods/23556) (this version is no longer supported), and the updated guide at the [Collective Modding Discord server](https://discord.gg/DfFYJtt8p4) (which _is_ still being supported) specify that the user install the WorkBase file, but the old one was hard to diagnose and didn't generate clear errors.

This edition attempts to address these shortcomings.

This mod is also available at the [GitHub project](https://github.com/rux616/biraitbec-workbase-improved).

([TOC](#table-of-contents))

Features
--------
- Checks to see if the script is being run from a protected folder (Program Files, the user profile folder, etc.)
- Checks to make sure the needed Visual C++ 2012 Update 4 (or later) redistributable files are installed
- Will only (re)build archives it needs
- Incremental status is printed to the screen
- Logs are generated in the `Logs` folder
- In 'automatic mode', repack archives are detected in the `Repack7z` folder and automatically extracted
- Original BA2 archives can be used directly from the Fallout 4 Data folder
- Verifies the repack archives via SHA256 hash
- Verifies the original BA2 archives via SHA256 hash
- Verifies the patched BA2 archives via SHA256 hash
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
- [`1. Performance Overhaul-23556-1-0-1565601510.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164236)

**Main:**
- [`2a. Main Repack - Part One-23556-1-0-1565616028.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164245)
- [`2b. Main Repack - Part Two-23556-1-0-1565980979.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164487)
- [`2c. Main Reapack - Part Three-23556-1-0-1565605113.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164241)

**Quality:**
- [`2a. Quality Addon - Part One-23556-1-0-1565546826.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164210)
- [`2b. Quality Overhaul - Part Two-23556-1-0-1565980973.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164486)

**Vault Fix:**

NOTE: Recommended if using the Performance, Main, or Quality repack sets.

- [`Fix Vault-Window-Metal-Institute-40534-1-02-1565670781.7z`](https://www.nexusmods.com/fallout4/mods/40534?tab=files&file_id=164279)

**Restyle:**
- [`3. Restyle Pack - Fomod-23556-1-0-1565546849.7z`](https://www.nexusmods.com/fallout4/mods/23556?tab=files&file_id=164211)

([TOC](#table-of-contents))


Instructions
============
There are two modes of operation for BRB WorkBase Improved:

- Automatic (recommended)
- Custom

NOTE: The script will automatically attempt to locate and use the any original BA2 archive from the Fallout 4 Data folder if it doesn't find it in the `OriginalBa2` folder.

- [Optional] Copy the original BA2 archives from the Fallout 4 Data folder to the `OriginalBa2` folder.

([TOC](#table-of-contents))

Automatic
---------
Notes:

- If using the `Main` repack set _with_ the `Performance` repack set, the texture noted in the guide as being corrupt, `Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS`, is preserved from the `Performance` repack set
- If using the `Main` repack set _without_ the `Performance` repack set, the texture noted in the guide as being corrupt, `Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS`, is deleted
- If using the `Restyle` repack set, the "Author's Choice" options are automatically chosen

- Put the repack files you have downloaded into the `Repack7z` folder.
- Right click on `Installer.ps1` file and select "Run with PowerShell".
- If you get an "Execution Policy Change" warning, type `Y` then hit the `Enter` key.
- A dialog box will pop up asking you to choose an output folder for the patched BA2 archives. By default it goes to the `PatchedBa2` folder, but you can choose a different folder. **Do not choose the Fallout 4 Data folder.**
- The script will then proceed to verify and extract the the repack archives, then create the patched BA2 archives.

([TOC](#table-of-contents))

Custom
------
This process is basically the traditional BRB install process as has been described in the guide and is done the same way.

- Extract all the repack files to the `PatchedFiles` folder (creating it first, if necessary).
- Right click on `Installer.ps1` file and select "Run with PowerShell".
- If you get an "Execution Policy Change" warning, type `Y` then hit the `Enter` key.
- A dialog box will pop up asking you to choose an output folder for the patched BA2 archives. By default it goes to the `PatchedBa2` folder, but you can choose a different folder. **Do not choose the Fallout 4 Data folder.**
- The script will then proceed to create the patched BA2 archives.

([TOC](#table-of-contents))


Troubleshooting Info
====================

This script has a lot of built-in checks that will tend to have very clear error messages. If you run into something that's not clear though, post something on the Nexus mod comments page or make an issue on the GitHub project.

Logs
----
Logs will be located in the `Logs` folder inside the `WorkBase` folder. There will be 1 to 2 files generated per run, depending on how far the process gets: `install_yyyymmddTHHMMssZ.log` and `tool_yyyymmddTHHMMssZ.log`, where `yyyymmddTHHMMssZ` is the timestamp of when the process was started, for example `20220201T205350Z`.

The `install` log generally mirrors what is seen on screen, and the `tool` log is the output of the various tools used, such as `7za.exe` and `archive2.exe`. When asking questions or attempting to get help for errors, please include at least the `install` log.

([TOC](#table-of-contents))


Copyright and Licenses
======================
Copyright 2022 Dan Cassidy

All my code in this tool is licensed under the [GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) or later.

Everything else in this mod created by me is [CC-BY-SA](https://creativecommons.org/licenses/by-sa/4.0/legalcode) licensed.

This tool is bundled with the following programs, each having their own copyrights and licenses:
- [7-Zip Standalone Console v21.07 (2021-12-26) by Igor Pavlov](https://www.7-zip.org/)
- [Archive2 v1.1.0.4 by Bethesda Game Studios, part of the Fallout 4 Creation Kit](https://bethesda.net/en/game/bethesda-launcher)
- [BSA Browser v1.14.1 by AlexxEG](https://www.nexusmods.com/skyrimspecialedition/mods/1756)

([TOC](#table-of-contents))


Credits and Thanks
==================
- BiRaitBec: For the original WorkBase file and the [guide](https://www.nexusmods.com/fallout4/mods/23556)
- Screaminglake and CyberDanz: For administering the [Community Modding discord server and the updated BRB guide](https://discord.gg/DfFYJtt8p4)

([TOC](#table-of-contents))


Contact
=======
If you find a bug or have a question about the mod, please post it on the [mod page at Nexus Mods](), or in the [GitHub project](https://github.com/rux616/biraitbec-workbase-improved).

If you need to contact me personally, I can be reached through one of the following means:
- **Nexus Mods**: [rux616](https://www.nexusmods.com/users/124191) (Send a message via the "CONTACT" button.)
- **Email**: rux616-at-pm-dot-me (replace `-at-` with `@` and `-dot-` with `.`)
- **Discord**: rux616#0950 (I tend to hang out on the [Nexus Mods](https://discord.gg/nexusmods) and [Wabbajack](https://discord.gg/wabbajack) servers, amongst others.)

([TOC](#table-of-contents))
