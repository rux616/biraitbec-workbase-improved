# Error Messaging in BRB WorkBase Improved

## Table of Contents
- [Error Messaging in BRB WorkBase Improved](#error-messaging-in-brb-workbase-improved)
    - [Table of Contents](#table-of-contents)
    - [General Notes](#general-notes)
    - [Startup Errors](#startup-errors)
        - [Script is not run with PowerShell v5.1.x or v7.2.x](#script-is-not-run-with-powershell-v51x-or-v72x)
            - [Error Text](#error-text)
            - [Extra Error Text](#extra-error-text)
        - [Script is located in a protected folder](#script-is-located-in-a-protected-folder)
            - [Error Text](#error-text-1)
            - [Extra Error Text](#extra-error-text-1)
        - [Proper version of Visual C++ Redistributable not found](#proper-version-of-visual-c-redistributable-not-found)
            - [Error Text](#error-text-2)
            - [Extra Error Text](#extra-error-text-2)
        - [User cancels choosing a folder for the Patched BA2 archives](#user-cancels-choosing-a-folder-for-the-patched-ba2-archives)
            - [Error Text](#error-text-3)
            - [Extra Error Text](#extra-error-text-3)
        - [The Steam "Fallout 4\Data" folder is chosen as the patched BA2 archive output folder](#the-steam-fallout-4data-folder-is-chosen-as-the-patched-ba2-archive-output-folder)
            - [Error Text](#error-text-4)
            - [Extra Error Text](#extra-error-text-4)
        - [No custom assets exist and no repack archives found](#no-custom-assets-exist-and-no-repack-archives-found)
            - [Error Text](#error-text-5)
            - [Extra Error Text](#extra-error-text-5)
    - [Repack Errors](#repack-errors)
        - [Size mismatch on repack archive](#size-mismatch-on-repack-archive)
            - [Error Text](#error-text-6)
            - [Extra Error Text](#extra-error-text-6)
        - [Unrecognized repack archive](#unrecognized-repack-archive)
            - [Error Text](#error-text-7)
            - [Extra Error Text](#extra-error-text-7)
        - [Repack archive not found](#repack-archive-not-found)
            - [Error Text](#error-text-8)
            - [Extra Error Text](#extra-error-text-8)
        - [Extracting repack archive fails (\*)](#extracting-repack-archive-fails-)
            - [Error Text](#error-text-9)
            - [Extra Error Text](#extra-error-text-9)
        - [Validating files extracted from repack archive fails (\*)](#validating-files-extracted-from-repack-archive-fails-)
            - [Error Text](#error-text-10)
            - [Extra Error Text](#extra-error-text-10)
    - [Original/Alternate Archive Errors](#originalalternate-archive-errors)
        - [Original/alternate archive not found](#originalalternate-archive-not-found)
            - [Error Text](#error-text-11)
            - [Extra Error Text](#extra-error-text-11)
        - [Hash contents of PatchedFiles (\*)](#hash-contents-of-patchedfiles-)
            - [Error Text](#error-text-12)
            - [Extra Error Text](#extra-error-text-12)
        - [Size mismatch on original BA2 archive](#size-mismatch-on-original-ba2-archive)
            - [Error Text](#error-text-13)
            - [Extra Error Text](#extra-error-text-13)
        - [Old version of alternate original BA2 archive found](#old-version-of-alternate-original-ba2-archive-found)
            - [Error Text](#error-text-14)
            - [Extra Error Text](#extra-error-text-14)
        - [Original (or Alternate Original) archive is unrecognized](#original-or-alternate-original-archive-is-unrecognized)
            - [Error Text](#error-text-15)
            - [Extra Error Text](#extra-error-text-15)
        - [Original (or Alternate Original) BA2 extraction fails (\*)](#original-or-alternate-original-ba2-extraction-fails-)
            - [Error Text](#error-text-16)
            - [Extra Error Text](#extra-error-text-16)
        - [Cube map extraction fails (\*)](#cube-map-extraction-fails-)
            - [Error Text](#error-text-17)
            - [Extra Error Text](#extra-error-text-17)
        - [Copying patched files fails (\*)](#copying-patched-files-fails-)
            - [Error Text](#error-text-18)
            - [Extra Error Text](#extra-error-text-18)
        - [Creating patched archive file fails (\*)](#creating-patched-archive-file-fails-)
            - [Error Text](#error-text-19)
            - [Extra Error Text](#extra-error-text-19)
        - [Size mismatch on the patched file (\*)](#size-mismatch-on-the-patched-file-)
            - [Error Text](#error-text-20)
            - [Extra Error Text](#extra-error-text-20)
        - [Hash mismatch of patched file (\*)](#hash-mismatch-of-patched-file-)
            - [Error Text](#error-text-21)
            - [Extra Error Text](#extra-error-text-21)
        - [Tag mismatch of patched file](#tag-mismatch-of-patched-file)
            - [Error Text](#error-text-22)
            - [Extra Error Text](#extra-error-text-22)

---

## General Notes
When errors are displayed, they have the following format:
> ERROR: (Error Text)  
> ERROR: ----------  
> ERROR: (Extra Error Text)

This text will be displayed on exit if any errors marked with an asterisk (\*) occur:
>  
> One or more errors were encountered that could be caused by any one of a variety of factors, including (but not limited to) antivirus interference, failing/unstable hardware, or a lack of free space available on the drive.  
>  
> Please try the script again to confirm any issues are repeatable, then report any recurring errors on the Nexus Mods mod page (<https://www.nexusmods.com/fallout4/mods/57782>) or the GitHub project (<https://github.com/rux616/biraitbec-workbase-improved>). When you do so, please also upload the "install.current.log" file in the "`$(($dir.Logs).Split("\")[-1])`" folder to a website like TextUploader.com (<https://textuploader.com/>) or Pastebin (<https://pastebin.com/>), and include the link.

([Top](#table-of-contents))

---

## Startup Errors

---

### Script is not run with PowerShell v5.1.x or v7.2.x

#### Error Text
> Invalid PowerShell version.

#### Extra Error Text
> This script will not function properly if it is not run with PowerShell version 5.1.x or 7.2.x.
>
> Make sure to run this script by opening the folder where it resides, right-clicking the script, and choosing "Run with PowerShell" from the menu.

### Script is located in a protected folder

#### Error Text
> Problematic script location detected.

#### Extra Error Text
> Attempting to run script from "`$($dir.currentDirectory)`".
>
> Please ensure this script is not anywhere inside the following folders:  
> `$problemDirs | ForEach-Object { "  $_" }`

([Top](#table-of-contents))

---

### Proper version of Visual C++ Redistributable not found

#### Error Text
> Visual C++ Redistributable files not found.

#### Extra Error Text
> Need 64-bit Visual C++ Redistributable for Visual Studio 2012 Update 4. Please download it from this link:  
> <https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe>

([Top](#table-of-contents))

---

### User cancels choosing a folder for the Patched BA2 archives

#### Error Text
> Canceled by user.

#### Extra Error Text
> (None)

([Top](#table-of-contents))

---

### The Steam "Fallout 4\Data" folder is chosen as the patched BA2 archive output folder

#### Error Text
> Invalid folder.

#### Extra Error Text
> Cannot choose the "Fallout 4\Data" folder from your Steam library.
>
> Keeping the patched BA2 archives separate from the base game files keeps the location clean and enables you to verify the vanilla files through Steam without losing the patched archives.

([Top](#table-of-contents))

---

### No custom assets exist and no repack archives found

#### Error Text
> No repack archives found and no custom assets exist.

#### Extra Error Text
> (None)

([Top](#table-of-contents))

---

## Repack Errors

---

### Size mismatch on repack archive

#### Error Text
> Size mismatch.

#### Extra Error Text
> The size of this repack archive doesn't match any known archives.
>
> Try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying.

([Top](#table-of-contents))

---

### Unrecognized repack archive

#### Error Text
> Unrecognized file.

#### Extra Error Text
> The exact contents of this repack archive don't match any known archives.
>
> Try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying.

([Top](#table-of-contents))

---

### Repack archive not found

Special case - this only happens when only some parts of a repack set are there and others are not, e.g. "2a. Main..." and "2b. Main..." are there, but "2c. Main..." is not.

#### Error Text
> Not found.

#### Extra Error Text
> The file can not be found in the "`$(($dir.repack7z).Split("\")[-1])`" folder.
>
> Please ensure you have placed all the repack archives from each repack set that you wish to use in the "`$(($dir.repack7z).Split("\")[-1])`" folder, then run this script again.

([Top](#table-of-contents))

---

### Extracting repack archive fails (\*)

#### Error Text
> Extracting "`$relFile`" failed.

#### Extra Error Text
> The program used to extract repack archives (7za.exe) has indicated that an error occurred while extracting one of said archives. Unfortunately, 7za.exe doesn't output an error that can be interpreted by this script.

([Top](#table-of-contents))

---

### Validating files extracted from repack archive fails (\*)

#### Error Text
> Validation of `$($results.Count)` extracted file`$(if ($results.Count -gt 1) {"s"})` has failed.

#### Extra Error Text
> The exact contents of one or more files extracted from a repack archive set don't match any known files.
>
> See the "current.install" log file in the "`$($dir.Logs.Split("\")[-1])`" folder for the list of files which failed validation."


([Top](#table-of-contents))

---

## Original/Alternate Archive Errors

---

### Original/alternate archive not found

#### Error Text
> Archive not found.

#### Extra Error Text
> The archive in question cannot be found.
>
> If you're attempting to use the vanilla files as a base, please verify your game files through Steam and try again.
>
> If you're attempting to use one of the alternate bases, make sure you didn't miss a file when extracting and/or copying the files.


([Top](#table-of-contents))

---

### Hash contents of PatchedFiles (\*)

#### Error Text
> Collecting baseline information failed.

#### Extra Error Text
> Error`$(if ($errorRecords.Count -gt 1) {"s"})` occurred during this process.

([Top](#table-of-contents))

---

### Size mismatch on original BA2 archive

#### Error Text
> Size mismatch.

#### Extra Error Text
> The size of this original archive doesn't match any known archives.
>
> If you're attempting to use the vanilla files as a base, please verify your game files through Steam and try again.
>
> If you're attempting to use one of the alternate bases, make sure you have the exact files specified in the readme. If you do, next try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying.

([Top](#table-of-contents))

---

### Old version of alternate original BA2 archive found

#### Error Text
> Old version of an alternate original archive detected.

#### Extra Error Text
> If using alternate original BA2 archives (i.e. PhyOp or Luxor), this script only allows the latest versions.
>
> Check the readme and update the archive in question to the version that's needed.

([Top](#table-of-contents))

---

### Original (or Alternate Original) archive is unrecognized

#### Error Text
> Unrecognized archive file.

#### Extra Error Text
> The exact contents of this archive don't match any known archives.
>
> If you're attempting to use the vanilla files as a base, please verify your game files through Steam and try again.
>
> If you're attempting to use one of the alternate bases, make sure you have the exact files specified in the readme. If you do, next try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying.

([Top](#table-of-contents))

---

### Original (or Alternate Original) BA2 extraction fails (\*)

#### Error Text
> Extracting "`$originalBa2File`" failed.

#### Extra Error Text
> The program used to extract BA2 archives (archive2.exe) has indicated that an error occurred while extracting one of said archives. Unfortunately, archive2.exe doesn't output an error that can be interpreted by this script.

([Top](#table-of-contents))

---

### Cube map extraction fails (\*)

#### Error Text
> Extracting cube maps from "`$originalBa2File`" failed.

#### Extra Error Text
> The program used to extract cube maps from archives (bsab.exe) has indicated that an error occurred while extracting files from one of said archives. Unfortunately, bsab.exe doesn't output an error that can be interpreted by this script.

([Top](#table-of-contents))

---

### Copying patched files fails (\*)

#### Error Text
> Copying patched files failed.

#### Extra Error Text
> Error`$(if ($errorRecords.Count -gt 1) {"s"})` occurred when attempting to copy the files.

([Top](#table-of-contents))

---

### Creating patched archive file fails (\*)

#### Error Text
> Creating "`$patchedBa2File`" failed.

#### Extra Error Text
> The program used to create BA2 archives (archive2.exe) has indicated that an error occurred while creating one of said archives. Unfortunately, archive2.exe doesn't output an error that can be interpreted by this script.

([Top](#table-of-contents))

---

### Size mismatch on the patched file (\*)

#### Error Text
> Size mismatch.

#### Extra Error Text
> The size of this patched archive doesn't match any known archives.

([Top](#table-of-contents))

---

### Hash mismatch of patched file (\*)

#### Error Text
> Unrecognized file.

#### Extra Error Text
> The exact contents of this patched archive don't match any known archives.

([Top](#table-of-contents))

---

### Tag mismatch of patched file

#### Error Text
> Tag mismatch.

#### Extra Error Text
> Because some combinations of repack sets generate the same patched BA2 archive, patched archives have 'tags' associated with them, so that not only do the size and contents of the newly-created patched archive need to match the data associated with said archive, the tags do as well. In this case, they did not match.

([Top](#table-of-contents))
