BiRaitBec WorkBase Improved
===========================

Table Of Contents
-----------------
- [BiRaitBec WorkBase Improved](#biraitbec-workbase-improved)
    - [Table Of Contents](#table-of-contents)
- [Changelogs](#changelogs)
    - [v1.1.0](#v110)
    - [v1.0.0](#v100)


Changelogs
==========

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
- Added NoPauseOnExit, NoClearScreen, and AllowUnchanged CLI switches
- Added new `[WORKING...]` text to show that a process is running
- Fixed mistaken right justification of some errors
- Updated some error messages to enhance clarity
- Updated some verbiage around custom repacks to enhance clarity
- Transition to using .Count instead of .Length where possible

**Functions v1.13.0:**
- Added FileSize argument to Add-Hash function to allow for adding file sizes
- Added ability to associate actions with hashes in Add-Hash function and to invoke said actions with Invoke-HashActions function
- Added BypassLog parameter to Write-{Error,Info,Success,Warning} functions
- Added Get-OriginalBa2File function
- Added TrimBeforeDisplay parameter to Write-Custom
- Added NoTrimBeforeDisplay parameter to Write-{Error,Info,Success,Warning}
- Added KeepCursorPosition parameter to Write-Custom
- Partially refactored Write-Custom function
- Moved Write-Error function
- Transition to using .Count instead of .Length where possible

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
