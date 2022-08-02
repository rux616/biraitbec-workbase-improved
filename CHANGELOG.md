BiRaitBec WorkBase Improved
===========================

Table Of Contents
-----------------
- [BiRaitBec WorkBase Improved](#biraitbec-workbase-improved)
    - [Table Of Contents](#table-of-contents)
- [Changelogs](#changelogs)
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
