BiRaitBec WorkBase Improved
===========================

Table Of Contents
-----------------
- [BiRaitBec WorkBase Improved](#biraitbec-workbase-improved)
    - [Table Of Contents](#table-of-contents)
- [Changelogs](#changelogs)
    - [v1.14.0](#v1140)
    - [v1.13.0](#v1130)
    - [v1.12.0](#v1120)
    - [v1.11.0](#v1110)
    - [v1.10.0](#v1100)
    - [v1.9.1](#v191)
    - [v1.9.0](#v190)
    - [v1.8.1](#v181)
    - [v1.8.0](#v180)
    - [v1.7.0](#v170)
    - [v1.6.3](#v163)
    - [v1.6.2](#v162)
    - [v1.6.1](#v161)
    - [v1.6.0](#v160)
    - [v1.5.0](#v150)
    - [v1.4.0](#v140)
    - [v1.3.6](#v136)
    - [v1.3.5](#v135)
    - [v1.3.4](#v134)
    - [v1.3.3](#v133)
    - [v1.3.2](#v132)
    - [v1.3.1](#v131)
    - [v1.3.0](#v130)
    - [v1.2.1](#v121)
    - [v1.2.0](#v120)
    - [v1.1.0](#v110)
    - [v1.0.0](#v100)


Changelogs
==========

v1.14.0
-------
- [Installer] Add ability to check existing patched BA2 files for version mismatches
- [Installer] Rename some variables to better match their contents
- [Installer] Version bump to `1.29.0`

([TOC](#table-of-contents))

v1.13.0
-------
- [Functions] Changed Add-Hash input parameter "Tag" to "Tags"
- [Functions] Updated Add-Hash to accept arrays for the Tags input parameter
- [Functions] Use ArrayLists for tags and versions in Add-Hash now
- [Functions] Version bumped to `1.30.1`
- [Tools] Removed BSA Browser
- [Tools] Added BSArch v0.9c
- [Installer] Changed drive check to be based on file system instead of USB/not USB (exFAT, or maybe non-NTFS, causes the issue with archive2 acting in a non-deterministic manner)
- [Installer] Now adds the expected hash to the output when a file doesn't match during post-creation validation
- [Installer] Hash original BA2 archives early in order to detect version
- [Installer] Version bumped to `1.28.0`
- [Hashes] Added hashes for base Fallout 4 archives from v1.10.980.0 (Steam build ID 14160910)
- [Hashes] Added hashes for base Fallout 4 archives from v1.10.984.0 (Steam build ID 14349213)
- [Hashes] Added hashes for patched archives from v1.10.980.0 (Steam build ID 14160910)
- [Hashes] Added hashes for patched archives from v1.10.984.0 (Steam build ID 14349213)
- [Hashes] Version bumped to `1.18.0`

([TOC](#table-of-contents))

v1.12.0
-------
- [Tools] Updated 7-Zip to v23.01 (2023-06-20)
- [Tools] Updated BSA Browser to v1.17.0
- [Tools] Updated xxHash to v0.8.2
- [Functions] Updated Get-FileHash function to support xxHash 0.8.2's behavior of putting a backslash at the beginning of the line if its output has any characters that need to be escaped
- [Functions] Version bumped to `1.29.0`
- [Installer] Added check for extracted files inside Repack7z folder
- [Installer] Version bumped to `1.27.0`
- [InstallerCmd] Added check that Tools\Installer.ps1 exists before running
- [Readme] Updated contact section
- [Readme] Updated "Copyright and Licenses" section to include updated information on the Tools

([TOC](#table-of-contents))

v1.11.0
-------
- [Hashes] Remove hashes for "The Midnight Performance AIO" mod (deleted)
- [Hashes] Remove hashes for "The Ultimate Texture Performance" mod (deleted)
- [Hashes] Remove hashes for "Performout" mod (deleted)
- [Hashes] Version bumped to `1.17.0`
- [Installer] Adjusted "disk information" error message to refer to the readme
- [Installer] Version bumped to `1.26.0`
- [Readme] Added a couple additional "known issues" in the Troubleshooting section
- [Readme] Purged all mention of Performout, The Midnight Performance, and The Ultimate Texture Performance mods

([TOC](#table-of-contents))

v1.10.0
-------
- [Hashes] Added hashes for The Midnight Performance AIO Full v1.0.1 files
- [Hashes] Added hashes for The Midnight Performance AIO Lite v1.0.1 files
- [Hashes] Added hashes for The Ultimate Texture Performance Mod v1.0
- [Hashes] Added hashes for The Ultimate Texture Performance Mod - Nuka DLC v1.0
- [Hashes] Added hashes for The Ultimate Texture Performance Mod - FarHarbor DLC v1.0
- [Hashes] Added hashes for The Ultimate Texture Performance Mod - Automatron DLC v1.0
- [Hashes] Added hashes for The Ultimate Texture Performance Mod - Contraptions Workshop DLC v1.0
- [Hashes] Added hashes for The Ultimate Texture Performance Mod - Vault-Tec Workshop DLC v1.0
- [Hashes] Added hashes for The Ultimate Texture Performance Mod - Wasteland Workshop DLC v1.0
- [Hashes] Version bumped to `1.16.0`
- [Installer] Moved code to detect running Powershell version earlier
- [Installer] Version bumped to `1.25.0`
- [Readme] Added some verbiage explaining that RX9000 Midnight and Ultimate Texture mods are now supported
- [CI] Removed code signing portion of CI pipeline

([TOC](#table-of-contents))

v1.9.1
------
- [Hashes] Fixed sizes for Luxor HD v1.3 files
- [Hashes] Version bumped to `1.15.1`

([TOC](#table-of-contents))

v1.9.0
------
- [Hashes] Fixed hashes for Luxor HD v1.3 files
- [Hashes] Add hashes for Luxor HD 2k v1.01 files
- [Hashes] Version bumped to `1.15.0`
- [Readme] Updated version listings for Luxor HD 2k
- [Readme] Updated text around where to go to get support

([TOC](#table-of-contents))

v1.8.1
------
- [Installer] Made getting disk information more robust
- [Installer] Added region/endregion tags to code
- [Installer] Fixed logging of raw repack flags
- [Installer] Version bumped to `1.24.1`
- [Functions] Moved variable to functions because that's where it's used
- [Functions] Version bumped to `1.28.2`

([TOC](#table-of-contents))

v1.8.0
------
- [Installer] Prevent running script from a folder that has square brackets anywhere in the path
- [Installer] Error out if the SHA256 sum of the Crc32 hash source doesn't match what's expected
- [Installer] Added ability to call installer script from anywhere and have it change to the correct folder
- [Installer] Added free space check
- [Installer] Added new `-SkipFreeSpaceCheck` parameter
- [Installer] Getting the temp directory now uses `Resolve-PathAnyway`
- [Installer] Fixed a bug where the number of threads being selected for HDDs was incorrect
- [Installer] Fixed thread # selection for working files drive
- [Installer] Bytes are now logged with thousands separators
- [Installer] Added new `-ForceTempWorkingFiles` and `-WorkingFilesFolder` parameters
- [Installer] Cleaned up some logs
- [Installer] Moved some variables around
- [Installer] Only PowerShell 5.1.x is supported now
- [Installer] Added some more bad file fixes
- [Installer] Version bumped to `1.23.5`
- [InstallerCMD] Added ability to call installer script from anywhere and have it change to the correct folder
- [Functions] Added switch to Exit-Script function to bypass writing to the log
- [Functions] Exit-Script function now notes if the MultiFactorErrorFlag was set in the log
- [Functions] Added `Get-PathSize` and `Resolve-PathAnyway` functions to support free space check
- [Functions] Remove PatchedFiles when needed whenever the script exits
- [Functions] Added (currently unused) `Get-ExistingPatchedFilesFolderChoice` function
- [Functions] Moved some variables around
- [Functions] Version bumped to `1.28.1`
- [Project] Added debug config
- [Hashes] Add hashes and sizes for Luxor HD v1.3 archives
- [Hashes] Add more bad file hashes
- [Hashes] Update patched BA2 hashes
- [Hashes] Version bumped to `1.14.1`
- [Readme] Adjusted verbiage around supported Luxor HD archives
- [Readme] Added `SkipFreeSpaceCheck` to unsupported command line parameters section
- [Readme] Added `WorkingFilesFolder` to unsupported command line parameters section
- [Readme] Added `ForceTempWorkingFiles` to unsupported command line parameters section
- [Support] Updated `generate-hashes.ps1` script to work with newest versions WBI
- [CI] Updated CI pipeline to publish build artifact to release tag

([TOC](#table-of-contents))

v1.7.0
------
- [Hashes] Add hashes and sizes for Luxor HD 2k v1.0 archives
- [Hashes] Version bumped to `1.13.0`

([TOC](#table-of-contents))

v1.6.3
------
- [Installer] Ignore MSFT XVDD drives when enumerating disks
- [Installer] Version bumped to `1.21.1`

([TOC](#table-of-contents))

v1.6.2
------
- [Hashes] Fixed hashes and sizes for Luxor HD v1.2.2 archives
- [Hashes] Version bumped to `1.12.1`

([TOC](#table-of-contents))

v1.6.1
------
- [Readme] Added some verbiage explaining that Rickintosh's Performout is now supported

([TOC](#table-of-contents))

v1.6.0
------
- [Hashes] Added support for Performout v2.0 (base game files v2.0, DLC files v1.0)
- [Hashes] Version bumped to `1.12.0`

([TOC](#table-of-contents))

v1.5.0
------
- [Hashes] Added support for Luxor HD v1.2.2
- [Hashes] Marked some Luxor HD v1.2.1 files as old
- [Hashes] Marked some Luxor HD v1.2 files as old
- [Hashes] Version bumped to `1.11.0`

([TOC](#table-of-contents))

v1.4.0
------
- [7-Zip] Upgraded to 7-Zip 64-bit v22.01 (2022-07-15)
- [Installer] Changed calls from old 7-zip executable to new 7-Zip executable
- [Installer] Version bumped to `1.20.13`
- [Hashes] Added support for Luxor HD v1.2
- [Hashes] Marked Luxor HD v1.1 as old
- [Hashes] Version bumped to `1.10.0`

([TOC](#table-of-contents))

v1.3.6
------
- [Functions] Fix logic error with `SteamFallback` discovery method - don't code when tired, kids
- [Functions] Version bumped to `1.26.3`

([TOC](#table-of-contents))

v1.3.5
------
- [Installer] Fixed some potential failures when the user has unusual characters in the path to some folders
- [Installer] Added support for a fallback method of finding the Fallout 4 directory
- [Installer] Added `OriginalBa2Folder` parameter
- [Installer] Added `PatchedBa2Folder` parameter
- [Installer] Version bumped to `1.20.12`
- [Functions] Fixed `Get-Fallout4DataFolder` returning an empty path for the `Steam` discovery method if the path had unusual characters in it
- [Functions] Added `SteamFallback` discovery method to `Get-Fallout4DataFolder` function
- [Functions] Utilize `SteamFallback` data in `Get-OriginalBa2File` function
- [Functions] Version bumped to `1.26.2`

([TOC](#table-of-contents))

v1.3.4
------
**Summary:**
- Added some additional directories to the problematic folder list and updated the method used to determine those folders
- Added SPDX identifier for Crc32.cs
- Added some additional debugging parameters

**Installer v1.20.11:**
- Added some additional directories to the problematic folder list and updated the method used to determine those folders
- Added some additional debugging parameters

([TOC](#table-of-contents))

v1.3.3
------
**Summary:**
- Fixed a build issue

([TOC](#table-of-contents))

v1.3.2
------
**Summary:**
- Fixed bug with long user names and USB drives
- Moved to using a CMD file to call the installer script to bypass issues with ExecutionPolicies in PowerShell

**Installer v1.20.9:**
- Fixed process failing when ran from a USB drive and the user having a long username

([TOC](#table-of-contents))

v1.3.1
------
**Summary:**
- Fixed a couple bugs related to Custom mode

**Installer v1.20.8:**
- Fixed "Custom" mode always deactivating itself
- Fixed "[CUSTOM - SKIPPED]" being shown even if there were no repack archives to validate

([TOC](#table-of-contents))

v1.3.0
------
**Summary:**
- Added support for Luxor HD v1.1

**Hashes v1.9.0:**
- Added support for Luxor HD v1.1
- Marked Luxor HD v1.03, v1.04, and v1.05 as "old"

([TOC](#table-of-contents))

v1.2.1
------
**Summary:**
- Loosened the naming requirements for the repack archives

**Installer v1.20.7:**
- Loosened the naming requirements for the repack archives - file extension is no longer required

([TOC](#table-of-contents))

v1.2.0
------
**Summary:**
- Fixed issue where the script would never be able to validate the patched BA2 successfully if the Installer script was run from a USB drive
- Fixed some more invalid patched files (make sure to rebuild your patched archives!)
- Added support for Luxor HD v1.03
- Added Extended Validation mode to validate all the files after every step (run it via the "Installer (Extended Validation Mode).ps1" file)
- Added Hybrid mode, allowing the repack archives to be used with alternate original BA2 archives
- Changed to the XXH128 algorithm for (most) file validation, which should result in a significant speed increase when using NVMe or fast SSD drives
- Started code signing the scripts, so occurrences of them getting blocked by Windows should be reduced

**Installer v1.20.6:**
- Fixed issue where Archive2 was outputting archives with their data in seemingly random order if WorkBase Improved was ran from a USB drive
- Added a command line parameter to make DLCs optional and not fail the process if not found
- Added "Hybrid" mode of operation, where a user can now use alternate original BA2 archives like Luxor and PhyOp, and then use the repack set archives as well
- Added multiple command line parameters for debugging and troubleshooting
- Added import for CRC32 C# code
- Added printing out hash and size of MSVC DLLs
- Added "Extended Validation Mode", which validates all relevant files after every step of the process, this mode can be activated by running the "Installer (Extended Validation Mode).ps1" script
- Added size checking where possible to attempt to make failing a bit faster if needed
- Added PowerShell 7.2.x compatibility
- Added checks for PowerShell version and will error out when not using 5.1.x or 7.2.x
- Changed main hashing algorithm to XXH128; this should result in a significant speed up when validating files on NVMe and fast SSD drives
- Changed "Validating repack sets", "Validating existing patched BA2 archives", and "Archives to build" output to only show exactly what's needed
- Changed flow around corrupted repack files and missing repack set files, the script will now error out instead of continuing
- Changed error messaging to be much more clear and less technical; big thanks to Lively and Aegis27 for their help
- Removed call to robocopy executable, instead handling the copying of files inside the script using PowerShell-native methods
- Enhanced the diagnostic info written to the log

**Functions v1.26.1:**
- Added Invoke-Parallel function to be able to run script blocks in parallel
- Added line-wrapping capability to Write-Custom* functions
- Added Get-FileHash function to include ability to use CRC32, XXH3, XXH32, XXH64, and XXH128 algorithms to hash files
- Added multi-line string splitting to Write-Custom and Write-Log functions
- Added ability to add extra context when calling Write-Error and Write-Log
- Change Add-Hash function to be able to choose the key type for the added item

**Hashes v1.8.0:**
- Added v1.03 of Luxor HD texture BA2 archives to the list of valid alternate original BA2s
- Moved v1.0, v1.01, and v1.02 of Luxor HD texture BA2 archives to the list of OLD alternate original BA2s
- Recalculated hashes for all files with the XXH128 algorithm
- Cleaned up the main hashes file a bit

([TOC](#table-of-contents))

v1.1.0
------
**General:**
- Made project a VSCode workspace in preparation for some build automation
- Corrected capitalization on ScreamingLake's name in the readme
- Added generate-hashes script to assist in generating hashes for different combinations of repack sets
- Updated readmes for clarity

**Installer v1.5.0:**
- Added main BRBWI version to diagnostic information printed to the log
- Added logging of original archive tags
- Added semi-fuzzy matching for repack 7z files
- Added support for using alternate original BA2 archives
- Added logging of contents of Repack7z folder
- Added logging of contents of OriginalBa2 folder
- Added checks for known bad patched files
- Added `NoPauseOnExit`, `NoClearScreen`, and `AllowUnchanged` CLI switches
- Added new `[WORKING...]` text to show that a process is running
- Fixed mistaken right justification of some errors
- Updated some error messages to enhance clarity
- Updated some verbiage around custom repacks to enhance clarity
- Transition to using `.Count` instead of `.Length` where possible

**Functions v1.13.0:**
- Added `FileSize` argument to `Add-Hash` function to allow for adding file sizes
- Added ability to associate actions with hashes in `Add-Hash` function and to invoke said actions with `Invoke-HashActions` function
- Added `BypassLog` parameter to `Write-{Error,Info,Success,Warning}` functions
- Added `Get-OriginalBa2File` function
- Added `TrimBeforeDisplay` parameter to `Write-Custom`
- Added `NoTrimBeforeDisplay` parameter to `Write-{Error,Info,Success,Warning}`
- Added `KeepCursorPosition` parameter to `Write-Custom`
- Partially refactored `Write-Custom` function
- Moved `Write-Error` function
- Transition to using `.Count` instead of `.Length` where possible

**Hashes v1.5.0:**
- Added Luxor HD texture BA2s to the list of valid alternate original BA2s
- Added PhyOp texture BA2s to the list of valid alternate original BA2s
- Added expected sizes to all original BA2s
- Added expected sizes to all repack 7zs
- Added bad file hashes
- Updated patched BA2 hashes
- Updated 'vanilla' tag for original BA2s

([TOC](#table-of-contents))

v1.0.0
------
- Initial release

([TOC](#table-of-contents))
