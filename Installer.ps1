# Copyright 2022 Dan Cassidy

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY# without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# SPDX-License-Identifier: GPL-3.0-or-later


# parameters
# ----------

param (
    # Prevents the script from clearing the screen when starting up
    [switch] $NoClearScreen,
    # Forces 'Custom', 'Hybrid', or 'Automatic' mode of operation
    [ValidateSet("Custom", "Hybrid", "Standard")] [string] $ForceOperationMode,
    # Activates Extended Validation mode
    [switch] $ExtendedValidationMode,
    # Make it so that the DLC archives are optional instead of required to have a successful run
    [switch] $MakeDLCOptional,
    # Don't display the dialog box to choose the patched BA2 folder and instead choose the default (".\PatchedBa2")
    [switch] $SkipChoosingPatchedBa2Dir,
    # Skip the validation of the repack archives
    [switch] $SkipRepackValidation,
    # Skip the extraction of the repack archives
    [switch] $SkipRepackExtraction,
    # Skip validation of any existing patched BA2 archives
    [switch] $SkipExistingPatchedValidation,
    # Skip validation of original BA2 archives
    [switch] $SkipOriginalBa2Validation,
    # Force the script to hash a patched BA2 file after creation, even if the size doesn't match any known archives
    [switch] $ForcePatchedBa2Hashing,
    # Allow unchanged patched BA2 archives to be created (don't throw an error)
    [switch] $AllowUnchanged,
    # Don't delete the ".\PatchedFiles" folder after the script is complete
    [switch] $SkipFinalCleanup,
    # Don't pause on exit
    [switch] $NoPauseOnExit
)


# constants and variables
# -----------------------

$scriptTimer = [System.Diagnostics.Stopwatch]::StartNew()

Set-Variable "WBIVersion" -Value $(New-Object System.Version -ArgumentList @(1, 3, 1)) -Option Constant
Set-Variable "InstallerVersion" -Value $(New-Object System.Version -ArgumentList @(1, 20, 8)) -Option Constant

Set-Variable "FileHashAlgorithm" -Value "XXH128" -Option Constant
Set-Variable "RunStartTime" -Value "$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ"))" -Option Constant
Set-Variable "LineWidth" -Value ($Host.UI.RawUI.WindowSize.Width - 1) -Option Constant
Set-Variable "TagJoiner" -Value "+" -Option Constant
Set-Variable "OriginalBackgroundColor" -Value $Host.UI.RawUI.BackgroundColor -Option Constant

$dir = @{}
$dir.currentDirectory = $pwd.Path
$dir.defaultPatchedBa2 = ".\PatchedBa2"
$dir.fallout4DataRegistry = ""
$dir.fallout4DataSteam = ""
$dir.logs = ".\Logs"
$dir.originalBa2 = ".\OriginalBa2"
$dir.patchedBa2 = $dir.defaultPatchedBa2
$dir.patchedFiles = ".\PatchedFiles"
$dir.repack7z = ".\Repack7z"
$dir.temp = ".\Temp"
$dir.tools = ".\Tools"
$dir.workingFiles = ".\WorkingFiles"

$repackFiles = [ordered]@{}
$repackFiles.Performance = @(
    "1. Performance Overhaul-23556-1-0-1565601510.7z"
)
$repackFiles.Main = @(
    "2a. Main Repack - Part One-23556-1-0-1565616028.7z"
    "2b. Main Repack - Part Two-23556-1-0-1565980979.7z"
    "2c. Main Reapack - Part Three-23556-1-0-1565605113.7z"
)
$repackFiles.Quality = @(
    "2a. Quality Addon - Part One-23556-1-0-1565546826.7z"
    "2b. Quality Overhaul - Part Two-23556-1-0-1565980973.7z"
)
$repackFiles."Vault Fix" = @(
    "Fix Vault-Window-Metal-Institute-40534-1-02-1565670781.7z"
)
$repackFiles.Restyle = @(
    "3. Restyle Pack - Fomod-23556-1-0-1565546849.7z"
)

$ba2Files = [ordered]@{}
$ba2Files.dlcCoastTextures = "DLCCoast - Textures.ba2"
$ba2Files.dlcNukaWorldTextures = "DLCNukaWorld - Textures.ba2"
$ba2Files.dlcRobotTextures = "DLCRobot - Textures.ba2"
$ba2Files.dlcWorkshop1Textures = "DLCworkshop01 - Textures.ba2"
$ba2Files.dlcWorkshop2Textures = "DLCworkshop02 - Textures.ba2"
$ba2Files.dlcWorkshop3Textures = "DLCworkshop03 - Textures.ba2"
$ba2Files.fallout4Textures1 = "Fallout4 - Textures1.ba2"
$ba2Files.fallout4Textures2 = "Fallout4 - Textures2.ba2"
$ba2Files.fallout4Textures3 = "Fallout4 - Textures3.ba2"
$ba2Files.fallout4Textures4 = "Fallout4 - Textures4.ba2"
$ba2Files.fallout4Textures5 = "Fallout4 - Textures5.ba2"
$ba2Files.fallout4Textures6 = "Fallout4 - Textures6.ba2"
$ba2Files.fallout4Textures7 = "Fallout4 - Textures7.ba2"
$ba2Files.fallout4Textures8 = "Fallout4 - Textures8.ba2"
$ba2Files.fallout4Textures9 = "Fallout4 - Textures9.ba2"

$optionalOriginalArchives = @(
    "DLCCoast - Textures.ba2"
    "DLCNukaWorld - Textures.ba2"
    "DLCRobot - Textures.ba2"
    "DLCworkshop01 - Textures.ba2"
    "DLCworkshop02 - Textures.ba2"
    "DLCworkshop03 - Textures.ba2"
)

# Get-Disk and Get-PhysicalDisk don't seem to work on the first try in Windows 11 in virtualbox (and maybe elsewhere)
# but do seem to work after a second call. as a workaround, call Get-PhysicalDisk once before actually trying to get
# the drive information
Get-PhysicalDisk -ErrorAction SilentlyContinue | Out-Null

$driveInfo = Get-PhysicalDisk |
    ForEach-Object {
        $physicalDisk = $_
        Get-Partition -DiskNumber $_.DeviceId |
            Where-Object { $_.DriveLetter } |
            Get-Volume |
            ForEach-Object {
                [PSCustomObject]@{
                    DriveLetter     = $_.DriveLetter
                    MediaType       = $physicalDisk.MediaType
                    BusType         = $physicalDisk.BusType
                    SizeFree        = $_.SizeRemaining
                    SizeFreePercent = if ($_.Size) { $_.SizeRemaining / $_.Size * 100 } else { -1 }
                    SizeUsed        = $_.Size - $_.SizeRemaining
                    SizeUsedPercent = if ($_.Size) { ($_.Size - $_.SizeRemaining) / $_.Size * 100 } else { -1 }
                    SizeTotal       = $_.Size
                }
            }
        } | Sort-Object -Property DriveLetter

$driveInfoTableFormat = [object]@(
    @{ Name = "Drive"; Expression = { $_.DriveLetter }; Width = 6; Alignment = "left" },
    @{ Name = "Type"; Expression = { $_.MediaType }; Width = 12; Alignment = "left" },
    @{ Name = "Bus"; Expression = { $_.BusType }; Width = 5; Alignment = "left" },
    @{ Name = "Free"; Expression = { Write-PrettySize $_.SizeFree }; Width = 9; Alignment = "right" },
    @{ Name = "% Free"; Expression = { if ($_.SizeFreePercent -eq -1) { "Unknown" } else { "$(($_.SizeFreePercent).ToString("f1"))%" } }; Width = 8; Alignment = "right" },
    @{ Name = "Used"; Expression = { Write-PrettySize $_.SizeUsed }; Width = 10; Alignment = "right" },
    @{ Name = "% Used"; Expression = { if ($_.SizeUsedPercent -eq -1) { "Unknown" } else { "$(($_.SizeUsedPercent).ToString("f1"))%" } }; Width = 8; Alignment = "right" },
    @{ Name = "Total"; Expression = { Write-PrettySize $_.SizeTotal }; Width = 10; Alignment = "right" }
)

# archive2 becomes non-deterministic if the data it is putting into an archive comes from a USB drive, so if WBI is being ran
# from a USB drive, switch $dir.workingFiles to reside in the user's $env:TEMP directory instead
if (($driveInfo | Where-Object { $_.DriveLetter -eq $dir.currentDirectory.Substring(0, 1) }).BusType -eq "USB") {
    $dir.workingFiles = (Resolve-Path $(if ($env:TEMP) { $env:TEMP } elseif ($env:TMP) { $env:TMP } else { "." })).Path + "\WorkingFiles"
}

# figure out the max number of threads to use in multi-threading operations involving the respective drives
# 2 threads for HDDs, 16 threads otherwise
$maxWBIDriveThreads = if (($driveInfo | Where-Object { $_.DriveLetter -eq $dir.currentDirectory.Substring(0, 1) } | Select-Object MediaType) -eq "HDD") {
    2
}
else {
    16
}
$maxWorkingFilesDriveThreads = if (($driveInfo | Where-Object { $_.DriveLetter -eq $dir.workingFiles.Substring(0, 1) } | Select-Object MediaType) -eq "HDD") {
    2
}
else {
    16
}

$sectionTimer = New-Object System.Diagnostics.Stopwatch
$archiveTimer = New-Object System.Diagnostics.Stopwatch
$toolTimer = New-Object System.Diagnostics.Stopwatch
$writeCustomPrevNoNewLineLength = 0


# add tools to PATH
# -----------------

# save the original PATH variable
$originalPath = $env:PATH

# 7-Zip Standalone Console v21.07 (2021-12-26) by Igor Pavlov
# https://www.7-zip.org/
$env:PATH = (Resolve-Path "$($dir.tools)\7-zip\x64").Path + ";" + $env:PATH

# Archive2 v1.1.0.4 by Bethesda Game Studios
# Part of the Fallout 4 Creation Kit
# https://bethesda.net/en/game/bethesda-launcher
$env:PATH = (Resolve-Path "$($dir.tools)\Archive2").Path + ";" + $env:PATH

# BSA Browser v1.14.1 by AlexxEG
# https://www.nexusmods.com/skyrimspecialedition/mods/1756
$env:PATH = (Resolve-Path "$($dir.tools)\BSA Browser").Path + ";" + $env:PATH

# xxhsum v0.8.1 by cyan4973
# https://cyan4973.github.io/xxHash/
$env:PATH = (Resolve-Path "$($dir.tools)\xxHash").Path + ";" + $env:PATH


# imports
# -------

Write-Host "Loading functions..."
. "$($dir.tools)\lib\Functions.ps1"
Write-Host "Loading hashes..."
. "$($dir.tools)\lib\Hashes.ps1"


# check files
# -----------

if ((Get-FileHash "$($dir.tools)\lib\Crc32.cs" -Algorithm SHA256 -ErrorAction SilentlyContinue).Hash -ne "78750A7DD1EA51144AA06098E42878F6618A42C712021849AE3A7AD352EC7DC6") {
    Write-CustomError "The contents of `"$($dir.tools)\lib\Crc32.cs`" do not match what's expected. Try re-extracting the WorkBase Improved files again. If this error persists, please contact the author." -Prefix "ERROR: " -NoJustifyRight
}
else {
    Add-Type -TypeDefinition (Get-Content "$($dir.tools)\lib\Crc32.cs" -Raw) -Language CSharp
}


# late variables
# --------------

# more complicated than simply using $ba2Files, but allows for easier testing
[string[]] $ba2Filenames = @($originalBa2Hashes.Keys | ForEach-Object { $originalBa2Hashes[$_].FileName }) | Sort-Object -Unique

$dir.fallout4DataRegistry = Get-Fallout4DataFolder -DiscoveryMethod Registry
$dir.fallout4DataSteam = Get-Fallout4DataFolder -DiscoveryMethod Steam

$msvcp110dllPath = "${env:windir}\System32\msvcp110.dll"
$msvcp110dllVersion = (Get-Command $msvcp110dllPath -ErrorAction SilentlyContinue).Version
$msvcp110dllSize = (Get-Item $msvcp110dllPath -ErrorAction SilentlyContinue).Length
$msvcp110dllHash = (Get-FileHash -LiteralPath $msvcp110dllPath -Algorithm $FileHashAlgorithm -ErrorAction SilentlyContinue).Hash
$msvcr110dllPath = "${env:windir}\System32\msvcr110.dll"
$msvcr110dllVersion = (Get-Command $msvcr110dllPath -ErrorAction SilentlyContinue).Version
$msvcr110dllSize = (Get-Item $msvcr110dllPath -ErrorAction SilentlyContinue).Length
$msvcr110dllHash = (Get-FileHash -LiteralPath $msvcr110dllPath -Algorithm $FileHashAlgorithm -ErrorAction SilentlyContinue).Hash


# >>>>>>>>>>>>>>>>>>
# testing area start
# >>>>>>>>>>>>>>>>>>
# "begin test"
# foo
# "end test"
# Exit-Script 0
# <<<<<<<<<<<<<<<<
# testing area end
# <<<<<<<<<<<<<<<<


# begin script
# ------------

# clear the *.current.log files
Remove-Item "$($dir.Logs)\current.*.log" -ErrorAction SilentlyContinue

# set the console background to a more appealing color and clear the background so it takes effect
$Host.UI.RawUI.BackgroundColor = 'black'
if (-not $NoClearScreen) { Clear-Host }

# write some diagnostic information to the logs
Write-CustomLog "Run start: $RunStartTime"
Write-CustomLog "Run start: $RunStartTime" -log tool
Write-CustomLog @(
    ">" * $LineWidth
    "Diagnostic Information:"
    "  WorkBase Improved Directory: $($dir.currentDirectory)"
    "  WorkBase Improved Version: $WBIVersion"
    ""
    "  Installer Version: $InstallerVersion"
    "  Functions Version: $FunctionsVersion"
    "  Hashes Version: $HashesVersion"
    ""
    "  Command Line Parameters:"
    ((Get-Command -Name $MyInvocation.MyCommand.Path).Parameters.Keys | ForEach-Object {
        [PSCustomObject]@{Parameter = $_; Value = (Get-Variable -Name $_ -ErrorAction SilentlyContinue).Value }
    } | Format-Table | Out-String) -split "`r`n" | Where-Object { $_ } | ForEach-Object { "    " + $_ }
    ""
    "  Windows Version: $(Get-WindowsVersion)"
    "  PowerShell Version: $($PSVersionTable.PSVersion)"
    "  msvcp110.dll Version: " + $(if ($msvcp110dllVersion) { "$msvcp110dllVersion (Hash: $msvcp110dllHash, Size: $msvcp110dllSize bytes)" } else { "(Not Found)" })
    "  msvcr110.dll Version: " + $(if ($msvcr110dllVersion) { "$msvcr110dllVersion (Hash: $msvcr110dllHash, Size: $msvcr110dllSize bytes)" } else { "(Not Found)" })
    ""
    "  WorkingFiles Directory: $($dir.workingFiles)"
    ""
    "  Drive Threads (WBI Drive): $maxWBIDriveThreads"
    "  Drive Threads (Working Files Drive): $maxWorkingFilesDriveThreads"
    "  Drive Info:"
    ($driveInfo | Format-Table -Property $driveInfoTableFormat | Out-String) -split "`r`n" | Where-Object { $_ } | ForEach-Object { "    " + $_ }
    ""
    "  Number of repack archive hashes: $($repack7zHashes.Keys.Count)"
    "  Number of original BA2 hashes: $($originalBa2Hashes.Keys.Count)"
    "  Number of alternate original BA2 hashes: $($alternateOriginalBa2Hashes.Keys.Count)"
    "  Number of old alternate original BA2 hashes: $($oldAlternateOriginalBa2Hashes.Keys.Count)"
    "  Number of bad patched File hashes: $($badPatchedFileHashes.Keys.Count)"
    "  Number of patched BA2 hashes: $($patchedBa2Hashes.Keys.Count)"
    ""
    "  Line Width: $LineWidth"
    "  Original Console Background Color: $OriginalBackgroundColor"
    "  Color DWORD Value (Black): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Black.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Blue): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Blue.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Green): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Green.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Red): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Red.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Yellow): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Yellow.value__).ToString("D2"))").ToString("X6"))"
    ""
    "  Fallout 4 Data directory (Registry method): " + $(if ($dir.fallout4DataRegistry) { $dir.fallout4DataRegistry } else { "(Not Found)" })
    "  Fallout 4 Data directory (Steam method): " + $(if ($dir.fallout4DataSteam) { $dir.fallout4DataSteam } else { "(Not Found)" })
    ""
    "  Files in Repack7z directory: $(if ((Get-ChildItem $dir.repack7z -File -ErrorAction SilentlyContinue).Count -eq 0) { "(None)" })"
    (Get-ChildItem $dir.repack7z -File -ErrorAction SilentlyContinue | Sort-Object Name | ForEach-Object {
        [PSCustomObject]@{ Name = $_.Name; Size = $_.Length }
    } | Format-Table | Out-String) -split "`r`n" | Where-Object { $_ } | ForEach-Object { "    " + $_ }
    ""
    "  Files in OriginalBa2 directory: $(if ((Get-ChildItem $dir.originalBa2 -File -ErrorAction SilentlyContinue).Count -eq 0) { "(None)" })"
    (Get-ChildItem $dir.originalBa2 -File -ErrorAction SilentlyContinue | Sort-Object Name | ForEach-Object {
        [PSCustomObject]@{ Name = $_.Name; Size = $_.Length }
    } | Format-Table | Out-String) -split "`r`n" | Where-Object { $_ } | ForEach-Object { "    " + $_ }
    "<" * $LineWidth
)

Write-Custom @(
    " ____    _   ____            _   _     ____                "
    "| __ )  (_) |  _ \    __ _  (_) | |_  | __ )    ___    ___ "
    "|  _ \  | | | |_) |  / _`` | | | | __| |  _ \   / _ \  / __|"
    "| |_) | | | |  _ <  | (_| | | | | |_  | |_) | |  __/ | (__ "
    "|____/  |_| |_| \_\  \__,_| |_|  \__| |____/   \___|  \___|"
    ""
    "__        __                 _      ____                       "
    "\ \      / /   ___    _ __  | | __ | __ )    __ _   ___    ___ "
    " \ \ /\ / /   / _ \  | '__| | |/ / |  _ \   / _`` | / __|  / _ \"
    "  \ V  V /   | (_) | | |    |   <  | |_) | | (_| | \__ \ |  __/"
    "   \_/\_/     \___/  |_|    |_|\_\ |____/   \__,_| |___/  \___|"
    ""
    " ___                                                         _ "
    "|_ _|  _ __ ___    _ __    _ __    ___   __   __   ___    __| |"
    " | |  | '_ `` _ \  | '_ \  | '__|  / _ \  \ \ / /  / _ \  / _`` |"
    " | |  | | | | | | | |_) | | |    | (_) |  \ V /  |  __/ | (_| |"
    "|___| |_| |_| |_| | .__/  |_|     \___/    \_/    \___|  \__,_|"
    "                  |_|                                          "
) -JustifyCenter -BypassLog


# check to make sure that this is being run with PowerShell 5.1.x or 7.2.x
# ------------------------------------------------------------------------
if (($PSVersionTable.PSVersion.Major -ne 5 -and $PSVersionTable.PSVersion.Minor -ne 1) -and
    ($PSVersionTable.PSVersion.Major -ne 7 -and $PSVersionTable.PSVersion.Minor -ne 2)) {
    Write-Custom ""
    $extraErrorText = @(
        "This script will not function properly if it is not run with PowerShell version 5.1.x or 7.2.x."
        ""
        "Make sure to run this script by opening the folder where it resides, right-clicking the script, and choosing `"Run with PowerShell`" from the menu."
    )
    Write-CustomError "Invalid PowerShell version." -ExtraContext $extraErrorText -Prefix "ERROR: " -NoJustifyRight
    Exit-Script 1
}


# check location to ensure the script is not located in a problematic directory
# -----------------------------------------------------------------------------

$problemDirs = @(
    [IO.Path]::GetFullPath(${env:ProgramFiles})
    [IO.Path]::GetFullPath(${env:ProgramFiles(x86)})
    [IO.Path]::GetFullPath(${env:windir})
    (Get-Item $([IO.Path]::GetFullPath(${env:USERPROFILE}))).Parent.FullName
)
foreach ($problemDir in $problemDirs) {
    if ($dir.currentDirectory.StartsWith($problemDir, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-Custom ""
        $extraErrorText = @(
            "Attempting to run script from `"$($dir.currentDirectory)`"."
            ""
            "Please ensure this script is not anywhere inside the following folders:"
            $problemDirs | ForEach-Object { "  $_" }
        )
        Write-CustomError "Problematic script location detected." -ExtraContext $extraErrorText -Prefix "ERROR: " -NoJustifyRight
        Exit-Script 1
    }
}


# check for visual c++ redist files
# ---------------------------------

# need only C:\Windows\System32\msvcp110.dll and C:\Windows\System32\msvcr110.dll
# from vc redist 2012 update 4:
#   msvcp110.dll version = 11.00.51106.1
#   msvcr110.dll version = 11.00.51106.1
$vcrMinVersion = New-Object System.Version -ArgumentList @(11, 00, 51106, 1)
if ($msvcp110dllVersion -lt $vcrMinVersion -or $msvcr110dllVersion -lt $vcrMinVersion) {
    Write-Custom ""
    $extraErrorText = @(
        "Need 64-bit Visual C++ Redistributable for Visual Studio 2012 Update 4. Please download it from this link:"
        "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
    )
    Write-CustomError "Visual C++ Redistributable files not found." -ExtraContext $extraErrorText -Prefix "ERROR: " -NoJustifyRight
    Exit-Script 1
}


# select patched BA2 folder
# -------------------------

$sectionTimer.Restart()
Write-CustomLog "Section: select patched BA2 folder"

# create the PatchedBa2 folder and error out if it fails
try {
    if (-not (Test-Path -LiteralPath $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
}
catch {
    Write-CustomError $_ -Prefix "ERROR: " -SnippetLength 3 -NoJustifyRight
    Exit-Script 1
}

Write-Custom ""
Write-Custom "Patched BA2 archive folder:" -NoNewline
if (-not $SkipChoosingPatchedBa2Dir) {
    $dir.patchedBa2 = Get-Folder -Description "Select patched BA2 output folder:" -InitialDirectory $([IO.Path]::GetFullPath("$(Get-Location)\$($dir.patchedBa2)"))
}
if ($null -eq $dir.patchedBa2) {
    Write-CustomError "[CANCELLED]"
    Write-CustomError "Cancelled by user." -NoJustifyRight
    Exit-Script 1
}
elseif ($dir.fallout4DataSteam -and $dir.fallout4DataSteam -eq $dir.patchedBa2) {
    Write-CustomError "[ERROR]"
    $extraErrorText = @(
        "Cannot choose the `"Fallout 4\Data`" folder from your Steam library."
        ""
        "Keeping the patched BA2 archives separate from the base game files keeps the location clean and enables you to verify the vanilla files through Steam without losing these files."
    )
    Write-CustomError "Invalid folder." -ExtraContext $extraErrorText -Prefix "ERROR: " -NoJustifyRight
    Exit-Script 1
}

# prettify the common case of user specifying the default folder
if (
    $(Resolve-Path -LiteralPath $dir.defaultPatchedBa2 -ErrorAction SilentlyContinue).Path -eq
    $(Resolve-Path -LiteralPath $dir.patchedBa2 -ErrorAction SilentlyContinue).Path
) {
    $dir.patchedBa2 = $dir.defaultPatchedBa2
}

Write-CustomInfo $dir.patchedBa2

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"


# extended validation mode status
# -------------------------------

$sectionTimer.Restart()
Write-CustomLog "Section: choose extended validation mode"

Write-CustomLog ""
Write-Custom "Extended validation mode:" -NoNewline

if ($ExtendedValidationMode) { Write-CustomInfo "Active" }
else { Write-CustomInfo "Inactive" }

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"


# determine mode of operation and create tag
# ------------------------------------------

$sectionTimer.Restart()
Write-CustomLog "Section: determine mode of operation and create tag"

Write-CustomLog ""
Write-Custom "Mode of operation:" -NoNewLine

$repackFlags = [ordered]@{}
$repackFiles.Keys | ForEach-Object { $repackFlags.$_ = $false }

# do a pre-scan to gather existing repack files - this allows us to ignore nonexistent repack files
$existingRepackFiles = [ordered]@{}  # set up variable to mirror data structure of $repackFiles, only with actual existing files
foreach ($object in $repackFiles.GetEnumerator()) {
    $existingFiles = 0
    foreach ($file in $object.Value.GetEnumerator()) {
        $fileName = $file.Substring(0, $file.LastIndexOf('.'))

        # do wildcard matching
        $potentialRepackFiles = @(Get-ChildItem -Path $dir.repack7z -File -Filter "$fileName*")
        if ($potentialRepackFiles.Count -gt 0) { $existingFiles++ }
    }
    if ($existingFiles -gt 0) { $existingRepackFiles."$($object.Key)" = $object.Value; $repackFlags."$($object.Key)" = $true }
}
$repackFiles = $existingRepackFiles

# if not using Performance, Main, or Quality, don't need to install the Vault Fix
if (-not $repackFlags.Performance -and -not $repackFlags.Main -and -not $repackFlags.Quality) {
    $repackFlags."Vault Fix" = $false
}

# get the list of original archive size mismatches, then take that list and see how many of those mismatches match sizes for alternate original archives

# get enumerator for the original BA2 hashes and pipe it into Where-Object
$originalBa2SizeMismatches = $originalBa2Hashes.GetEnumerator() | Where-Object {
    # get file size for a given file and prepare to see if it's not equal
    $_.Value.FileSize -ne
    # use the Get-OriginalBa2File function to grab the full path of the file
    # feed full file path of file to Get-ChildItem, telling it to silently continue if not there (it gets checked later)
    # get file size of file returned by Get-ChildItem
    (Get-ChildItem -LiteralPath (Get-OriginalBa2File $_.Value.FileName) -ErrorAction SilentlyContinue).Length
    # make sure that any objects found are sorted by file name
} | Sort-Object { $_.Value.FileName }

# take the original ba2 size mismatches and pipe them into ForEach-Object
$alternateOriginalBa2SizeMatches = $originalBa2SizeMismatches | ForEach-Object {
    # assign the current object in the pipeline to a variable other than $_
    $currentMismatch = $_
    # get an enumerator for the alternate original ba2 hashes and pipe it into Where-Object
    $alternateOriginalBa2Hashes.GetEnumerator() | Where-Object {
        # have Where-Object find alternate original BA2s that have matching file names and matching file sizes
        $_.Value.FileName -eq $currentMismatch.Value.FileName -and
        $_.Value.FileSize -eq (Get-ChildItem -LiteralPath (Get-OriginalBa2File $_.Value.FileName) -ErrorAction SilentlyContinue).Length
    }
}

switch ($ForceOperationMode) {
    "Custom" { $repackFlags.Custom = $true }
    "Hybrid" { $repackFlags.Hybrid = $true }
    "Standard" { <# do nothing #> }
    Default {
        # check to see if the conditions for a custom run are met:
        #   custom assets exist AND
        #     one or more original BA2 size doesn't match expected original BA2 size AND
        #     those same archives original BA2 size matches expected alternate BA2 size
        #   OR
        #   custom assets exist AND
        #     no repack flags are set (meaning no repack archives are found)
        if (
            ((Get-ChildItem -LiteralPath $dir.patchedFiles -Filter "*.dds" -Recurse -ErrorAction SilentlyContinue).Count -gt 0 -and
            $originalBa2SizeMismatches.Count -gt 0 -and
            $alternateOriginalBa2SizeMatches.Count -gt 0) -or
            ((Get-ChildItem -LiteralPath $dir.patchedFiles -Filter "*.dds" -Recurse -ErrorAction SilentlyContinue).Count -gt 0 -and
            $repackFlags.Keys.Where({ $repackFlags[$_] }).Count -eq 0)
        ) {
            $repackFlags.Custom = $true
        }
        # check to see if the conditions for a hybrid run are met:
        #   no custom assets exist AND
        #   one or more original BA2 size doesn't match expected original BA2 size AND
        #   those same archives original BA2 size matches expected alternate BA2 size
        elseif (
            (Get-ChildItem $dir.patchedFiles -File -Recurse -ErrorAction SilentlyContinue).Count -eq 0 -and
            $originalBa2SizeMismatches.Count -gt 0 -and
            $alternateOriginalBa2SizeMatches.Count -gt 0
        ) {
            $repackFlags.Hybrid = $true
        }
    }
}

# if using custom mode, turn off all the other repack flags
if ($repackFlags.Custom) {
    foreach ($key in $($repackFlags.Keys)) { if ($key -ne "Custom") { $repackFlags[$key] = $false } }
}

if ($repackFlags.Custom) { Write-CustomInfo "Custom" }
elseif ($repackFlags.Hybrid) { Write-CustomInfo "Hybrid" }
else { Write-CustomInfo "Standard" }

# create tag
$repackTag = $repackFlags.Keys.Where({ $repackFlags[$_] }) -join $TagJoiner
if (-not $repackTag) { $repackTag = "Unchanged" }

if ($repackFlags.Custom) {
    Write-CustomWarning "Mode of operation switched to `"Custom`"." -NoJustifyRight -BypassLog
}
elseif ($repackFlags.Hybrid) {
    Write-CustomWarning "Mode of operation switched to `"Hybrid`"." -NoJustifyRight -BypassLog
}
elseif ($repackTag -eq "Unchanged") {
    Write-CustomLog ""
    $message = "No repack archives found and no custom assets exist."
    if ($AllowUnchanged) {
        Write-CustomWarning $message -Prefix "WARNING: " -NoJustifyRight
    }
    else {
        Write-CustomError $message -Prefix "ERROR: " -NoJustifyRight
        Exit-Script 1
    }
}

Write-CustomLog "", "Repack tag: $repackTag"

if ($repackFlags.Custom -or $repackFlags.Hybrid) {
    Write-CustomLog @(
        ""
        "Original BA2 size mismatches: $($originalBa2SizeMismatches.Count)"
        @($originalBa2SizeMismatches | ForEach-Object { "  $(Get-OriginalBa2File $_.Value.FileName) ($($_.Value.Tags -join ", "))" })
        "Original BA2 size mismatches that match alternate original BA2 sizes: $($alternateOriginalBa2SizeMatches.Count)"
        @($alternateOriginalBa2SizeMatches | ForEach-Object { "  $($_.Value.FileName) ($($_.Value.Tags -join ", "))" })
    )
}

if (-not $repackFlags.Custom) {
    Write-Custom "", "Using repack set:"
    $repackFlags.GetEnumerator() | Where-Object { $_.Value -and $_.Key -ne "Hybrid" } | ForEach-Object {
        Write-Custom "  $($_.Key)"
    }
}

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"


# validate repack archives
# ------------------------

$sectionTimer.Restart()
Write-CustomLog "Section: validate repack archives"

$foundRepackFiles = [ordered]@{}  # set up variable to mirror data structure of $repackFiles, only with the actual files used
$firstIteration = $true
if ($existingRepackFiles.Count -gt 0) {
    Write-Custom ""
    Write-Custom "Validating repack sets:" -NoNewline
    if ($repackFlags.Custom) {
        Write-CustomWarning "[CUSTOM - SKIPPED]"
    }
    else {
        Write-Custom "" -BypassLog
        :outerLoop foreach ($object in $repackFiles.GetEnumerator()) {
            $foundFiles = @() # keep track of the actual found files for this key
            if ($firstIteration) { $firstIteration = $false } else { Write-Custom "  $("-" * ($LineWidth - 2))" }
            Write-Custom "  $($object.Key) ($($object.Value.Count) archive$(if ($object.Value.Count -ne 1) {"s"})):"
            foreach ($file in $object.Value.GetEnumerator()) {
                try {
                    $archiveTimer.Restart()

                    $altFile = $file
                    $relFile = "$($dir.repack7z)\$file"
                    $altRelFile = $null
                    $fileName = $file.Substring(0, $file.LastIndexOf('.'))

                    # do wildcard matching
                    # get files that match file name with anything after the end of the filename
                    $potentialRepackFiles = @(Get-ChildItem -Path $dir.repack7z -File -Filter "$fileName*")
                    # @($potentialRepackFiles | Where-Object
                    #   pipe potential repack files into Where-Object
                    # { $_.Length -eq
                    #   get the file size and prepare to see if it's equal to
                    # ($repack7zHashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file }).Value.FileSize })
                    #   get the repack hash object that matches the file name and get its file size for comparison
                    $potentialRepackFilesSizeMatched = @($potentialRepackFiles | Where-Object { $_.Length -eq ($repack7zHashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file }).Value.FileSize })
                    if ($potentialRepackFilesSizeMatched.Count -gt 0) {
                        # if there are size-matched files, use those
                        $potentialRepackFiles = $potentialRepackFilesSizeMatched
                    }
                    if ($potentialRepackFiles.Count -gt 0) {
                        if ($potentialRepackFiles.Count -gt 1) {
                            Write-CustomLog "    Found multiple candidate files for ${file}:"
                            foreach ($potentialFile in $potentialRepackFiles) { Write-CustomLog "      $($potentialFile.Name) ($($potentialFile.Length) bytes)" }
                        }
                        $altFile = $potentialRepackFiles[-1].Name
                        $altRelFile = "$($dir.repack7z)\$($potentialRepackFiles[-1].Name)"
                    }

                    $foundFiles += $altFile

                    if ($null -ne $altRelFile -and $altRelFile -ne $relFile) {
                        Write-CustomLog "    `"$file`" not found; using `"$altFile`" instead"
                        $relFile = $altRelFile
                    }

                    Write-Custom "    $altFile" -NoNewline

                    if (Test-Path -LiteralPath $relFile) {
                        if ($SkipRepackValidation) {
                            Write-CustomWarning "    [SKIPPED]"
                        }
                        else {
                            Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog

                            Write-CustomLog "    Size: $((Get-ChildItem -LiteralPath $relFile).Length) bytes"
                            # check size before checking hash
                            if (@($repack7zHashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file -and $_.Value.FileSize -eq (Get-ChildItem $relFile).Length }).Count -eq 0) {
                                $extraErrorText = @(
                                    "The size of this repack archive doesn't match any known archives."
                                    ""
                                    "Try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying."
                                )
                                $extraLogText = @("(No extra log info.)")
                                throw "Size mismatch."
                            }

                            $hash = (Get-FileHash -LiteralPath $relFile -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
                            Write-CustomLog "    Hash: $hash"
                            if ($repack7zHashes[$hash].FileName -eq $file) {
                                Write-CustomSuccess "    [VALID]"
                            }
                            else {
                                $extraErrorText = @(
                                    "The exact contents of this repack archive don't match any known archives."
                                    ""
                                    "Try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying."
                                )
                                $extraLogText = @("(No extra log info.)")
                                throw "Unrecognized file."
                            }
                        }
                    }
                    else {
                        $extraErrorText = @(
                            "The file can not be found in the `"$($dir.repack7z.Split("\")[-1])`" folder."
                            ""
                            "Please ensure you have placed all the repack archives from each repack set that you wish to use in the `"$($dir.repack7z.Split("\")[-1])`" folder, then run this script again."
                        )
                        $extraLogText = @("(No extra log info.)")
                        throw "Not found."
                    }
                }
                catch {
                    Write-CustomError "    [FAIL]"
                    Write-CustomError $_ -ExtraContext $extraErrorText -Prefix "    ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
                    Write-CustomLog $_.InvocationInfo.PositionMessage -ExtraContext $extraLogText -Prefix "    ERROR: "
                    $validateRepacksFailed = $true
                }
                finally {
                    $extraErrorText, $extraLogText = $null
                    Write-CustomLog "    Archive duration: $($archiveTimer.Elapsed.ToString())"
                }
            }
            $foundRepackFiles."$($object.Key)" = $foundFiles
        }
    }
}

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"

if ($validateRepacksFailed) {
    Exit-Script 1
}

# replace list of expected repack files with the list of found repack files
$repackFiles = $foundRepackFiles


# validate any existing patched archives
# --------------------------------------

$sectionTimer.Restart()
Write-CustomLog "Section: validate any existing patched archives"

$existingPatchedArchives = foreach ($object in $ba2Files.GetEnumerator()) {
    if (Test-Path -LiteralPath "$($dir.patchedBa2)\$($object.Value)") { , $object.Value }
}

if ($existingPatchedArchives.Count -gt 0) {
    Write-Custom ""
    Write-Custom "Validating existing patched BA2 archives:" -NoNewline
    if ($SkipExistingPatchedValidation) {
        Write-CustomWarning "[SKIPPED]"
    }
    elseif ($repackFlags.Custom) {
        Write-CustomWarning "[CUSTOM - SKIPPED]"
    }
    elseif ($repackFlags.Hybrid) {
        Write-CustomWarning "[HYBRID - SKIPPED]"
    }
    else {
        $firstIteration = $true
        Write-Custom "" -BypassLog
        foreach ($object in $ba2Files.GetEnumerator()) {
            if (Test-Path -LiteralPath "$($dir.patchedBa2)\$($object.Value)") {
                try {
                    $archiveTimer.Restart()

                    $file = $object.Value
                    $relFile = "$($dir.patchedBa2)\$file"

                    if ($firstIteration) { $firstIteration = $false } else { Write-CustomLog "  $("-" * ($LineWidth - 2))" }
                    Write-Custom "  $file" -NoNewline
                    Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog

                    if (($patchedBa2Hashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file -and $_.Value.FileSize -eq (Get-ChildItem -LiteralPath $relFile).Length }).Count -eq 0) {
                        Write-CustomWarning "  [SIZE MISMATCH]"
                        continue
                    }
                    Write-CustomLog "  Size: $((Get-ChildItem -LiteralPath $relFile).Length) bytes"
                    $hash = (Get-FileHash -LiteralPath $relFile -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
                    Write-CustomLog "  Hash: $hash"
                    if ($patchedBa2Hashes[$hash].FileName -eq $file) {
                        Write-CustomLog "  Tags: $($patchedBa2Hashes[$hash].Tags -join ", ")"
                        if ($patchedBa2Hashes[$hash].Tags -contains $repackTag) {
                            Write-CustomSuccess "  [VALID]"
                            $ba2Filenames = $ba2Filenames.Where({ $_ -ne $file })
                        }
                        else {
                            Write-CustomWarning "  [REPACK SET MISMATCH]"
                        }
                    }
                    else {
                        Write-CustomWarning "  [UNRECOGNIZED]"
                    }
                }
                catch {
                    Write-CustomError "  [ERROR]"
                    Write-CustomError $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
                    $validateArchivesFailed = $true
                    break
                }
                finally {
                    Write-CustomLog "  Archive duration: $($archiveTimer.Elapsed.ToString())"
                }
            }
        }
    }
}

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"

if ($validateArchivesFailed) {
    Exit-Script 1
}

if (-not $ba2Filenames.Count) {
    Write-CustomSuccess "", "Existing patched archives validated successfully; nothing to do!" -NoJustifyRight
    Exit-Script 0
}


# extract repack archives
# -----------------------

$sectionTimer.Restart()
Write-CustomLog "Section: extract repack archives"

Write-Custom ""
Write-Custom "Extracting repack archives:" -NoNewline
if ($repackFlags.Custom) {
    Write-CustomWarning "[CUSTOM - SKIPPED]"
}
elseif ($SkipRepackExtraction) {
    Write-CustomWarning "[SKIPPED]"
}
else {
    Write-Custom "" -BypassLog

    # because not using a custom repack, move PatchedFiles directory if said directory exists
    if (Test-Path -LiteralPath $dir.patchedFiles) {
        Write-Custom "  Pre-existing PatchedFiles folder moved to:" -NoNewline
        try {
            Rename-Item -LiteralPath $dir.patchedFiles -NewName "$($dir.patchedFiles).backup.$RunStartTime" -ErrorAction Stop
        }
        catch {
            Write-CustomError "  [ERROR]"
            Write-CustomError $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
            Exit-Script 1
        }
        Write-CustomInfo "  $($dir.patchedFiles).backup.$RunStartTime"
    }

    # create PatchedFiles directory
    try {
        New-Item $dir.patchedFiles -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    catch {
        Write-CustomError $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
        Exit-Script 1
    }

    # iterate through repack sets
    $firstIteration = $true
    :outerLoop foreach ($object in $repackFiles.GetEnumerator()) {
        if (-not $repackFlags[$object.Key]) { continue }

        try {
            $repackTimer = [System.Diagnostics.Stopwatch]::StartNew()

            # pre-extraction
            try {
                if ($firstIteration) { $firstIteration = $false } else { Write-Custom "  $("-" * ($LineWidth - 2))" }
                Write-Custom "  $($object.Key) ($($object.Value.Count) archive$(if ($object.Value.Count -ne 1) {"s"})):", "    Extracting..."

                # remove and create temp directory
                if (Test-Path -LiteralPath $dir.temp) {
                    Remove-Item -LiteralPath $dir.temp -Force -Recurse -ErrorAction Stop
                }
                New-Item $dir.temp -ItemType "directory" -ErrorAction Stop | Out-Null

                switch ($object.Key) {
                    "Main" {
                        if ($repackFlags.Performance) {
                            # special case: if main is being used with performance but not quality, save textures from performance for later use
                            if (-not $repackFlags.Quality) {
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\Buildings\RoofMetal02_d.DDS" -Destination "$($dir.temp)\RoofMetal02_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01.DDS" -Destination "$($dir.temp)\DiamondMetalTrims01.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01_d.DDS" -Destination "$($dir.temp)\DiamondMetalTrims01_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01_n.DDS" -Destination "$($dir.temp)\DiamondMetalTrims01_n.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01_s.DDS" -Destination "$($dir.temp)\DiamondMetalTrims01_s.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02.DDS" -Destination "$($dir.temp)\DiamondRVPanel02.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02_d.DDS" -Destination "$($dir.temp)\DiamondRVPanel02_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02_n.DDS" -Destination "$($dir.temp)\DiamondRVPanel02_n.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02_s.DDS" -Destination "$($dir.temp)\DiamondRVPanel02_s.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01.DDS" -Destination "$($dir.temp)\DiamondWood01.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01_d.DDS" -Destination "$($dir.temp)\DiamondWood01_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01_n.DDS" -Destination "$($dir.temp)\DiamondWood01_n.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01_s.DDS" -Destination "$($dir.temp)\DiamondWood01_s.DDS" -ErrorAction Stop
                            }
                            # special case: if main is being used with performance, save textures from performance for later use
                            Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled02Clinic_Damage_d.dds" -Destination "$($dir.temp)\VltHallResPaneled02Clinic_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria01_Damage_d.dds" -Destination "$($dir.temp)\VltHallResPaneled07Cafeteria01_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" -Destination "$($dir.temp)\VltHallResPaneled07Cafeteria02_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria03_Damage_d.dds" -Destination "$($dir.temp)\VltHallResPaneled07Cafeteria03_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Interiors\Vault\VltSecretWindow01_d.dds" -Destination "$($dir.temp)\VltSecretWindow01_d.dds" -ErrorAction Stop
                        }
                    }
                }
            }
            catch {
                Write-CustomError "  [ERROR]"
                Write-CustomError $_ -Prefix "  ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
                $extractRepackFailed = $true
                break
            }

            $repack7zFileRecords = New-Object System.Collections.Generic.List[Hashtable]

            # extract files
            foreach ($file in $object.Value) {
                try {
                    $archiveTimer.Restart()

                    $relFile = "$($dir.repack7z)\$file"
                    switch -wildcard ($object.Key) {
                        "*" { $outDir = $dir.patchedFiles; $extra = @() }
                        "Restyle" {
                            $outDir = $dir.temp
                            $extra = @(
                                "Creatures\Dogmeat\2k Shadow The Dark Husky\Textures"
                                "Environment\Evil Institute HD\2k\Textures"
                                "Miscellaneous\Perk Grid Background Replacer\2k Silver White\Textures"
                            )
                        }
                        "Vault Fix" {
                            $outDir = $dir.temp
                        }
                    }
                    Write-Custom "      $file" -NoNewline
                    Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog

                    # do the actual extraction and save the command line used to the tool log
                    Write-CustomLog "7za.exe x -y -bb2 -bd -o`"$outDir`" `"$relFile`" `"$(if ($extra) {$extra -join '" "'})`"" -Log "tool"
                    $toolTimer.Restart()
                    $stdout, $stderr = (7za.exe x -y -bb2 -bd -o"$outDir" "$relFile" "$(if ($extra) {$extra -join '" "'})" 2>&1).Where({ $_ -is [string] -and $_ -ne "" }, "Split")
                    Write-CustomLog "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
                    Write-CustomLog "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool"

                    # check if extracting the archive succeeded
                    if ($LASTEXITCODE -ne 0) {
                        $extraErrorText = @(
                            "The program used to extract repack archives (7za.exe) has indicated that an error occurred while extracting one of said archives. Unfortunately, 7za.exe doesn't output an error that can be interpreted by this script."
                        )
                        $extraLogText = @(
                            $stderr
                            "Exit code: $LASTEXITCODE"
                        )
                        throw "Extracting `"$relFile`" failed."
                    }

                    # if using extended validation mode, get file details (checksums) from archive and process the results
                    if ($ExtendedValidationMode) {
                        $archiveTechnicalInformation = 7za.exe l -slt "$relFile" "$(if ($extra) {$extra -join '" "'})"
                        foreach ($line in $archiveTechnicalInformation |
                                Select-Object -Skip 18 |
                                Where-Object { $_ -match "^Path.*" -or $_ -match "^CRC.*" }) {
                            $splitLine = $line -split " = "
                            switch ($splitLine | Select-Object -First 1) {
                                "Path" {
                                    $currentRecord = @{}
                                    $currentRecord.$_ = ($splitLine | Select-Object -Skip 1) -join " = "
                                }
                                "CRC" {
                                    $hash = $splitLine | Select-Object -Skip 1
                                    # if an item has a hash, update the file record and add it to the list
                                    if ($hash) {
                                        $currentRecord.$_ = $hash
                                        $repack7zFileRecords.Add($currentRecord)
                                    }
                                }
                            }
                        }
                    }
                    Write-CustomSuccess "      [DONE]"
                }
                catch {
                    Write-CustomError "      [ERROR]"
                    Write-CustomError $_ -ExtraContext $extraErrorText -Prefix "      ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
                    Write-CustomLog $_.InvocationInfo.PositionMessage -ExtraContext $extraErrorText -Prefix "      ERROR: "
                    $extractRepackFailed = $true
                    break outerLoop
                }
                finally {
                    $stdout, $stderr = $null
                    $extraErrorText, $extraLogText = $null
                    Write-CustomLog "      Archive duration: $($archiveTimer.Elapsed.ToString())"
                }
            }

            # post-extraction
            try {
                $toolTimer.Restart()

                Write-Custom "    Performing post-extraction tasks..." -NoNewline
                Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog

                switch ($object.Key) {
                    # special case: if on main and using performance, copy previously-saved texture
                    "Main" {
                        if ($repackFlags.Performance) {
                            # special case: if on main and using performance but not quality, copy previously-saved textures
                            if (-not $repackFlags.Quality) {
                                Copy-Item -LiteralPath "$($dir.temp)\RoofMetal02_d.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\Buildings\RoofMetal02_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondMetalTrims01.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondMetalTrims01_d.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondMetalTrims01_n.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01_n.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondMetalTrims01_s.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondMetalTrims01_s.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondRVPanel02.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondRVPanel02_d.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondRVPanel02_n.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02_n.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondRVPanel02_s.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondRVPanel02_s.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondWood01.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondWood01_d.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01_d.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondWood01_n.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01_n.DDS" -ErrorAction Stop
                                Copy-Item -LiteralPath "$($dir.temp)\DiamondWood01_s.DDS" -Destination "$($dir.patchedFiles)\Textures\Architecture\diamondcity\DiamondWood01_s.DDS" -ErrorAction Stop
                                if ($ExtendedValidationMode) {
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\Buildings\RoofMetal02_d.DDS" }).CRC = "7B3D09AB"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondMetalTrims01.DDS" }).CRC = "3699752D"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondMetalTrims01_d.DDS" }).CRC = "380060B9"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondMetalTrims01_n.DDS" }).CRC = "7A18AF3D"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondMetalTrims01_s.DDS" }).CRC = "837A7203"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondRVPanel02.DDS" }).CRC = "78D926EE"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondRVPanel02_d.DDS" }).CRC = "3E986B45"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondRVPanel02_n.DDS" }).CRC = "E80E73F4"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondRVPanel02_s.DDS" }).CRC = "1DB6762D"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondWood01.DDS" }).CRC = "B5C1A134"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondWood01_d.DDS" }).CRC = "EE4A20AD"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondWood01_n.DDS" }).CRC = "5053F59A"
                                    ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Architecture\diamondcity\DiamondWood01_s.DDS" }).CRC = "6E6EFFA4"
                                }
                            }
                            # special case: if on main and using performance, copy previously-saved textures
                            Copy-Item -LiteralPath "$($dir.temp)\VltHallResPaneled02Clinic_Damage_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled02Clinic_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.temp)\VltHallResPaneled07Cafeteria01_Damage_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria01_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.temp)\VltHallResPaneled07Cafeteria02_Damage_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.temp)\VltHallResPaneled07Cafeteria03_Damage_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria03_Damage_d.dds" -ErrorAction Stop
                            Copy-Item -LiteralPath "$($dir.temp)\VltSecretWindow01_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltSecretWindow01_d.dds" -ErrorAction Stop
                            if ($ExtendedValidationMode) {
                                ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Interiors\Vault\VltHallResPaneled02Clinic_Damage_d.dds" }).CRC = "81F209CA"
                                ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Interiors\Vault\VltHallResPaneled07Cafeteria01_Damage_d.dds" }).CRC = "3E8ABAF8"
                                ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" }).CRC = "4B0F2DCE"
                                ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Interiors\Vault\VltHallResPaneled07Cafeteria03_Damage_d.dds" }).CRC = "E289DD52"
                                ($repack7zFileRecords | Where-Object { $_.Path -eq "Textures\Interiors\Vault\VltSecretWindow01_d.dds" }).CRC = "27950FEB"
                            }
                        }
                    }
                    # special case: if on restyle, copy items to PatchedFiles folder
                    "Restyle" {
                        Copy-Item -LiteralPath $($extra | ForEach-Object { "$($dir.temp)\$_" }) -Destination "$($dir.patchedFiles)" -Force -Recurse -ErrorAction Stop
                        if ($ExtendedValidationMode) {
                            $repack7zFileRecords | ForEach-Object { $_.Path = ($_.Path.Split("\") | Select-Object -Skip 3) -join "\" }
                        }
                    }
                    # special case: if using vault fix, copy Textures subdirectory
                    "Vault Fix" {
                        Copy-Item -LiteralPath "$($dir.temp)\Data\Textures" -Destination "$($dir.patchedFiles)" -Force -Recurse -ErrorAction Stop
                        if ($ExtendedValidationMode) {
                            $repack7zFileRecords | ForEach-Object { $_.Path = ($_.Path.Split("\") | Select-Object -Skip 1) -join "\" }
                        }
                    }
                }

                if (Test-Path -LiteralPath $dir.temp) {
                    Remove-Item -LiteralPath $dir.temp -Force -Recurse
                }

                Write-CustomSuccess "    [DONE]"
            }
            catch {
                Write-CustomError "    [ERROR]"
                Write-CustomError $_ -Prefix "    ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
                Write-CustomLog $_.InvocationInfo.PositionMessage -Prefix "    ERROR: "
                $extractRepackFailed = $true
                break
            }
            finally {
                Write-CustomLog "    Post-extraction tasks duration: $($toolTimer.Elapsed.ToString())"
            }

            # if using extended validation mode, validate extracted files
            if ($ExtendedValidationMode) {
                try {
                    $toolTimer.Restart()

                    Write-Custom "    Validating extracted files..." -NoNewline
                    Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog

                    $argList = @{
                        ScriptBlock              = {
                            param([Hashtable] $FileRecord, [Hashtable] $Dir)
                            # enable capability to calculate CRC32 checksums
                            Add-Type -TypeDefinition (Get-Content "$($Dir.tools)\lib\Crc32.cs" -Raw) -Language CSharp
                            . "$($Dir.tools)\lib\Functions.ps1"
                            # hash the file
                            $hash = (Get-FileHash -LiteralPath "$($Dir.patchedFiles)\$($FileRecord.Path)" -Algorithm CRC32 -ErrorAction SilentlyContinue).Hash
                            # if the hash doesn't match, we want to know about it; emit an object
                            # containing the file record and computed hash
                            if ($hash -ne $FileRecord.CRC) { , @{ FileRecord = $FileRecord; CalculatedCRC = $hash } }
                        }
                        ParameterTable           = @{
                            Dir = $dir
                        }
                        InputObjectParameterName = "FileRecord"
                        RunspacePoolJobLimit     = 500
                        MaxThreads               = $maxWBIDriveThreads
                    }
                    $results = $repack7zFileRecords | Invoke-Parallel @argList

                    # if there is anything in $results, then validation failed on one or more files
                    if ($results) {
                        $extraErrorText = @(
                            "The exact contents of one or more files extracted from a repack archive set don't match any known files."
                            ""
                            "See the `"current.install`" log file in the `"$($dir.Logs.Split("\")[-1])`" folder for the list of files which failed validation."
                        )
                        $extraLogText = @(
                            $results | Sort-Object { $_.FileRecord.Path } | ForEach-Object { "`"$($_.FileRecord.Path)`" (CRC32: $($_.CalculatedCRC)) failed validation. Expected CRC32: $($_.FileRecord.CRC)" }
                        )
                        throw "Validation of $($results.Count) extracted file$(if ($results.Count -gt 1) {"s"}) has failed."
                    }

                    Write-CustomSuccess "    [VALID]"
                }
                catch {
                    Write-CustomError "    [FAIL]"
                    Write-CustomError $_ -ExtraContext $extraErrorText -Prefix "    ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
                    Write-CustomLog $_.InvocationInfo.PositionMessage -ExtraContext $extraLogText -Prefix "    ERROR: "
                    $extractRepackFailed = $true
                    break
                }
                finally {
                    $archiveTechnicalInformation.Clear()
                    $extraErrorText, $extraLogText = $null
                    Write-CustomLog "    Validation duration: $($toolTimer.Elapsed.ToString())"
                }
            }
        }
        finally {
            Write-CustomLog "  Repack set duration: $($repackTimer.Elapsed.ToString())"
            Remove-Variable repackTimer
        }
    }
}

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"

if ($extractRepackFailed) {
    if (Test-Path -LiteralPath $dir.temp) {
        Remove-Item -LiteralPath $dir.temp -Force -Recurse
    }
    Exit-Script 1
}


# remove known bad patched files
# ------------------------------

$sectionTimer.Restart()
Write-CustomLog "Section: remove known bad patched files"

Write-Custom ""
Write-Custom "Checking for known bad patched files:" -NoNewline

$potentiallyBadPatchedFilenames = @($badPatchedFileHashes.GetEnumerator() | ForEach-Object { $_.Value.FileName } | Where-Object { Test-Path -LiteralPath $_ } | Sort-Object -Unique)
Write-CustomInfo "  $($potentiallyBadPatchedFilenames.Count) potential file$(if ($potentiallyBadPatchedFilenames.Count -ne 1) {"s"}) found"

for ($index = 0; $index -lt $potentiallyBadPatchedFilenames.Count; $index++) {
    $file = $potentiallyBadPatchedFilenames[$index]
    Write-Custom "  File $($index + 1) of $($potentiallyBadPatchedFilenames.Count): " -NoNewline
    Write-CustomInfo "  $(($file.Split("\") | Select-Object -Skip 2) -join "\")" -NoJustifyRight -NoNewline
    $hash = (Get-FileHash -LiteralPath $file -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
    if ($badPatchedFileHashes[$hash].FileName -eq $file) {
        try {
            Rename-Item -LiteralPath $file -NewName "$($file.Split("\")[-1]).bad_file" -ErrorAction Stop
            Write-CustomSuccess "  [FIXED]"
        }
        catch {
            Write-CustomError "  [ERROR]"
            Write-CustomError $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
            Write-CustomLog $("-" * 20), $_.InvocationInfo.PositionMessage -Prefix "  ERROR: "
            Exit-Script 1
        }
    }
    else {
        Write-CustomSuccess "  [GOOD FILE]"
    }
}

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"


# process archives
# ----------------

$sectionTimer.Restart()
Write-CustomLog "Section: process archives"

Write-Custom "", "Archives to build:"
Write-Custom $ba2Filenames -Prefix "  "

try {
    if (-not (Test-Path -LiteralPath $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    if (Test-Path -LiteralPath $dir.workingFiles) {
        Remove-Item -LiteralPath $dir.workingFiles -Recurse -Force -ErrorAction Stop
    }
}
catch {
    Write-CustomError $_ -Prefix "ERROR: " -SnippetLength 3
    Write-CustomLog $("-" * 20), $_.InvocationInfo.PositionMessage -Prefix "ERROR: "
    Exit-Script 1
}

$firstIteration = $true
Write-Custom "", "Processing archives:"
for ($index = 0; $index -lt $ba2Filenames.Count; $index++) {
    try {
        $archiveTimer.Restart()

        if ($firstIteration) { $firstIteration = $false } else { Write-Custom "  $("-" * ($LineWidth - 2))" }

        $stdout, $stderr = $null
        $throwDelayedSizeMismatchError = $false
        $file = $ba2Filenames[$index]
        Write-Custom "  Archive $($index + 1) of $($ba2Filenames.Count) ($file):"
        $originalBa2File = Get-OriginalBa2File $file
        $patchedBa2File = "$($dir.patchedBa2)\$file"

        Write-Custom "    Original BA2: " -NoNewline
        Write-CustomInfo "    $originalBa2File"

        # validate original archive
        Write-Custom "      Validating original archive..." -NoNewline
        if ($SkipOriginalBa2Validation) {
            Write-CustomWarning "      [SKIPPED]"
        }
        else {
            Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
            if (-not (Test-Path -LiteralPath $originalBa2File)) {
                if ($file -in $optionalOriginalArchives -and $MakeDLCOptional) {
                    Write-CustomWarning "      [NOT FOUND - OPTIONAL]"
                    continue
                }
                $extraErrorText = @(
                    "The archive in question cannot be found."
                    ""
                    "If you're attempting to use the vanilla files as a base, please verify your game files through Steam and try again."
                    ""
                    "If you're attempting to use one of the alternate bases, make sure you didn't miss a file when extracting and/or copying the files."
                )
                $extraLogText = @("(No extra log info.)")
                throw "Archive not found."
            }
            Write-CustomLog "      Size: $((Get-ChildItem -LiteralPath $originalBa2File).Length) bytes"
            if (
                ($originalBa2Hashes.GetEnumerator() | Where-Object {
                    $_.Value.FileName -eq $file -and
                    $_.Value.FileSize -eq (Get-ChildItem -LiteralPath $originalBa2File).Length
                }).Count -eq 0 -and
                ($alternateOriginalBa2Hashes.GetEnumerator() | Where-Object {
                    $_.Value.FileName -eq $file -and
                    $_.Value.FileSize -eq (Get-ChildItem -LiteralPath $originalBa2File).Length
                }).Count -eq 0 -and
                ($oldAlternateOriginalBa2Hashes.GetEnumerator() | Where-Object {
                    $_.Value.FileName -eq $file -and
                    $_.Value.FileSize -eq (Get-ChildItem -LiteralPath $originalBa2File).Length
                }).Count -eq 0
            ) {
                $extraErrorText = @(
                    "The size of this original archive doesn't match any known archives."
                    ""
                    "If you're attempting to use the vanilla files as a base, please verify your game files through Steam and try again."
                    ""
                    "If you're attempting to use one of the alternate bases, make sure you have the exact files specified in the readme. If you do, next try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying."
                )
                $extraLogText = @("Size: $((Get-ChildItem -LiteralPath $originalBa2File).Length) bytes")
                throw "Size mismatch."
            }
            $hash = (Get-FileHash -LiteralPath $originalBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
            Write-CustomLog "      Hash: $hash"
            if ($originalBa2Hashes[$hash].FileName -eq $file) {
                $validOriginalText = "[VALID]"
            }
            elseif (($repackFlags.Custom -or $repackFlags.Hybrid) -and $alternateOriginalBa2Hashes[$hash].FileName -eq $file) {
                $validOriginalText = "[VALID - ALTERNATE]"
            }
            elseif (($repackFlags.Custom -or $repackFlags.Hybrid) -and $oldAlternateOriginalBa2Hashes[$hash].FileName -eq $file) {
                Write-CustomLog "      Tags: $($oldAlternateOriginalBa2Hashes[$hash].Tags -join ", ")"
                $extraErrorText = @(
                    "If using alternate original BA2 archives (i.e. PhyOp or Luxor), this script only allows the latest versions."
                    ""
                    "Check the readme and update the archive in question to the version that's needed."
                )
                $extraLogText = @("(No extra log info.)")
                throw "Old version of an alternate original archive detected."
            }
            else {
                $extraErrorText = @(
                    "The exact contents of this archive don't match any known archives."
                    ""
                    "If you're attempting to use the vanilla files as a base, please verify your game files through Steam and try again."
                    ""
                    "If you're attempting to use one of the alternate bases, make sure you have the exact files specified in the readme. If you do, next try re-downloading this file from Nexus Mods. If this step continues to fail, re-download again using a different server if you're able to (Nexus Premium required), otherwise just keep trying."
                )
                $extraLogText = @("(No extra log info.)")
                throw "Unrecognized archive file."
            }
            Write-CustomLog "      Tags: $($originalBa2Hashes[$hash].Tags -join ", ")$($alternateOriginalBa2Hashes[$hash].Tags -join ", ")"
            Write-CustomSuccess "      $validOriginalText"
        }

        # create working files directory
        New-Item $dir.workingFiles -ItemType "directory" -ErrorAction Stop | Out-Null

        # extract original archive
        Write-Custom "      Extracting original archive..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
        Write-CustomLog "archive2.exe `"$originalBa2File`" -extract=`"$($dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (archive2.exe "$originalBa2File" -extract="$($dir.workingFiles)" 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-CustomLog "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-CustomLog "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool"
        if ($LASTEXITCODE -ne 0) {
            $extraErrorText = @(
                "The program used to extract BA2 archives (archive2.exe) has indicated that an error occurred while extracting one of said archives. Unfortunately, archive2.exe doesn't output an error that can be interpreted by this script."
            )
            $extraLogText = @(
                $stderr
                "Exit code: $LASTEXITCODE"
            )
            $multiFactorErrorFlag = $true
            throw "Extracting `"$originalBa2File`" failed."
        }
        $stdout, $stderr = $null

        # correctly extract cubemaps
        Write-CustomLog "bsab.exe -e -o -f `"Textures\Shared\Cubemaps\*`" `"$originalBa2File`" `"$($dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (bsab.exe -e -o -f "Textures\Shared\Cubemaps\*" "$originalBa2File" "$($dir.workingFiles)" 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-CustomLog "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-CustomLog "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool"
        if ($LASTEXITCODE -ne 0) {
            # because bsab doesn't use stderr, copy stdout to stderr, but check anyway just in case
            if ($stderr -eq "") {
                $stderr = $stdout
            }
            $extraErrorText = @(
                "The program used to extract cube maps from archives (bsab.exe) has indicated that an error occurred while extracting files from one of said archives. Unfortunately, bsab.exe doesn't output an error that can be interpreted by this script."
            )
            $extraLogText = @(
                $stderr
                "Exit code: $LASTEXITCODE"
            )
            $multiFactorErrorFlag = $true
            throw "Extracting cube maps from `"$originalBa2File`" failed."
        }
        $stdout, $stderr = $null
        Write-CustomSuccess "      [DONE]"

        # extract original archive/correctly extract cubemaps extended validation
        if ($ExtendedValidationMode -and -not ($repackFlags.Custom -or $repackFlags.Hybrid)) {
            Write-Custom "      Validating extracted files..." -NoNewline
            Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
            # load file-specific hashes
            . "$($dir.tools)\lib\Hashes ($file).ps1"
            # calculate and compare hashes
            $argList = @{
                InputObject              = $originalBa2FileHashes.Values
                ScriptBlock              = {
                    param([Hashtable] $FileRecord, [Hashtable] $Dir, [string] $FileHashAlgorithm)
                    # import functions
                    . "$($Dir.tools)\lib\Functions.ps1"
                    # create object that may be emitted if size or hash is unexpected
                    $emissionObject = @{ FileRecord = $FileRecord; Size = $null; Hash = "(not calculated)" }
                    # record and test size
                    $size = (Get-ChildItem -LiteralPath "$($Dir.workingFiles)\$($FileRecord.FileName)").Length
                    if ($size -ne $FileRecord.FileSize) { $emissionObject.Size = $size }
                    # if size matches what is expected, check the hash
                    if (-not $emissionObject.Size) {
                        $hash = (Get-FileHash -LiteralPath "$($Dir.workingFiles)\$($FileRecord.FileName)" -Algorithm $FileHashAlgorithm).Hash
                        if ($hash -ne $FileRecord.Hash) { $emissionObject.Size = $size; $emissionObject.Hash = $hash }
                    }
                    # the 'size' key/value pair will not be null if either the size or the hash doesn't match, so
                    # use that as the factor to determine whether to emit the object
                    if ($emissionObject.Size) { , $emissionObject }
                }
                ParameterTable           = @{
                    Dir               = $dir
                    FileHashAlgorithm = $FileHashAlgorithm
                }
                InputObjectParameterName = "FileRecord"
                RunspacePoolJobLimit     = 500
                MaxThreads               = [Math]::Min($maxWBIDriveThreads, $maxWorkingFilesDriveThreads)
                ErrorAction              = "SilentlyContinue"
                ErrorVariable            = "errorRecords"
            }
            $results = Invoke-Parallel @argList
            # if there is anything in $results, then validation failed on one or more files
            if ($results) {
                $extraErrorText = @(
                    "The exact contents of one or more files extracted from this BA2 archive don't match any known files."
                    ""
                    "See the `"current.install`" log file in the `"$($dir.Logs.Split("\")[-1])`" folder for the list of files which failed validation."
                )
                $extraLogText = @(
                    $results | Sort-Object { $_.FileRecord.FileName } | ForEach-Object {
                        "`"$($_.FileRecord.FileName)`" (Size: $($_.Size) bytes, Hash: $($_.Hash)) failed validation. Expected size: $($_.FileRecord.FileSize) bytes, expected hash: $($_.FileRecord.Hash)"
                    }
                    if ($errorRecords) {
                        "-" * 10
                        $errorRecords | ForEach-Object { $_.ToString(); $_.InvocationInfo.PositionMessage }
                    }
                )
                $multiFactorErrorFlag = $true
                throw "Validation of $($results.Count) extracted file$(if ($results.Count -gt 1) {"s"}) has failed."
            }

            Write-CustomSuccess "      [VALID]"
        }

        Write-Custom "    Patched BA2: " -NoNewline
        Write-CustomInfo "    $patchedBa2File"

        # copy patched files
        Write-Custom "      Copying patched files..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
        Push-Location $dir.workingFiles
        $relativeFileList = (Get-ChildItem -File -Recurse | Resolve-Path -Relative).Substring(2)
        Pop-Location
        $relativeFileList = $relativeFileList | Where-Object { Test-Path "$($dir.patchedFiles)\$_" }
        $argList = @{
            InputObject              = $relativeFileList
            ScriptBlock              = {
                param([string] $File, [string] $SourceFolder, [string] $DestinationFolder)
                Copy-Item -LiteralPath "$SourceFolder\$File" -Destination "$DestinationFolder\$File" -Force
            }
            ParameterTable           = @{
                SourceFolder      = $dir.patchedFiles
                DestinationFolder = $dir.workingFiles
            }
            InputObjectParameterName = "File"
            RunspacePoolJobLimit     = 500
            MaxThreads               = [Math]::Min($maxWBIDriveThreads, $maxWorkingFilesDriveThreads)
            ErrorAction              = "SilentlyContinue"
            ErrorVariable            = "errorRecords"
        }
        Invoke-Parallel @argList
        if ($errorRecords) {
            $extraErrorText = @(
                "Error$(if ($errorRecords.Count -gt 1) {"s"}) occurred when attempting to copy the files."
            )
            $extraLogText = @(
                $errorRecords | ForEach-Object { $_.ToString(); $_.InvocationInfo.PositionMessage }
            )
            $multiFactorErrorFlag = $true
            throw "Copying patched files failed."
        }

        Write-CustomSuccess "      [DONE]"

        # copy patched files extended validation
        if ($ExtendedValidationMode) {
            Write-Custom "      Validating copied files..." -NoNewline
            Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
            # calculate and compare hashes
            $argList = @{
                InputObject              = $relativeFileList
                ScriptBlock              = {
                    param([String] $File, [Hashtable] $Dir, [string] $FileHashAlgorithm)
                    # import functions
                    . "$($Dir.tools)\lib\Functions.ps1"
                    # create objects that will be emitted if size or hash is unexpected
                    patchedFile = @{ File = $File; Size = $null; Hash = $null }
                    workingFile = @{ File = $File; Size = $null; Hash = "(not calculated)" }
                    $patchedFile.Size = (Get-ChildItem -LiteralPath "$($Dir.patchedFiles)\$File").Length
                    $patchedFile.Hash = (Get-FileHash -LiteralPath "$($Dir.patchedFiles)\$File" -Algorithm $FileHashAlgorithm).Hash
                    # record and test size
                    $size = (Get-ChildItem -LiteralPath "$($Dir.workingFiles)\$File").Length
                    if ($size -ne $patchedFile.Size) { $workingFile.Size = $size }
                    # if size matches what is expected, check the hash
                    if (-not $workingFile.Size) {
                        $hash = (Get-FileHash -LiteralPath "$($Dir.workingFiles)\$($FileRecord.FileName)" -Algorithm $FileHashAlgorithm).Hash
                        if ($hash -ne $patchedFile.Hash) { $workingFile.Size = $size; $workingFile.Hash = $hash }
                    }
                    # the 'size' key/value pair will not be null if either the size or the hash doesn't match, so
                    # use that as the factor to determine whether to emit the object
                    if ($workingFile.Size) { , @{PatchedFile = $patchedFile; WorkingFile = $workingFile } }
                }
                ParameterTable           = @{
                    Dir               = $dir
                    FileHashAlgorithm = $FileHashAlgorithm
                }
                InputObjectParameterName = "File"
                RunspacePoolJobLimit     = 500
                MaxThreads               = [Math]::Min($maxWBIDriveThreads, $maxWorkingFilesDriveThreads)
                ErrorAction              = "SilentlyContinue"
                ErrorVariable            = "errorRecords"
            }
            $results = Invoke-Parallel @argList
            # if there is anything in $results, then validation failed on one or more files
            if ($results) {
                $extraErrorText = @(
                    "The exact contents of one or more files copied from `"$($dir.patchedFiles)`" to `"$($dir.workingFiles)`" don't match."
                    ""
                    "See the `"current.install`" log file in the `"$($dir.Logs.Split("\")[-1])`" folder for the list of files which failed validation."
                )
                $extraLogText = @(
                    $results | Sort-Object { $_.FileRecord.FileName } | ForEach-Object {
                        "`"$($_.WorkingFile.File)`" (Size: $($_.WorkingFile.Size) bytes, Hash: $($_.WorkingFile.Hash)) failed validation. Expected size: $($_.PatchedFile.Size) bytes, expected hash: $($_.PatchedFile.Hash)"
                    }
                    if ($errorRecords) {
                        "-" * 10
                        $errorRecords | ForEach-Object { $_.ToString(); $_.InvocationInfo.PositionMessage }
                    }
                )
                $multiFactorErrorFlag = $true
                throw "Validation of $($results.Count) copied file$(if ($results.Count -gt 1) {"s"}) has failed."
            }

            Write-CustomSuccess "      [VALID]"
        }

        # create patched archive
        Write-Custom "      Creating patched archive..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
        Write-CustomLog "archive2.exe `"$($dir.workingFiles)`" -format=`"DDS`" -create=`"$patchedBa2File`" -root=`"$(Resolve-Path $dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (archive2.exe "$($dir.workingFiles)" -format="DDS" -create="$patchedBa2File" -root="$(Resolve-Path $dir.workingFiles)" 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-CustomLog "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-CustomLog "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool"
        if ($LASTEXITCODE -ne 0) {
            $extraErrorText = @(
                "The program used to create BA2 archives (archive2.exe) has indicated that an error occurred while creating one of said archives. Unfortunately, archive2.exe doesn't output an error that can be interpreted by this script."
            )
            $extraLogText = @(
                $stderr
                "Exit code: $LASTEXITCODE"
            )
            $multiFactorErrorFlag = $true
            throw "Creating the `"$file`" patched archive failed."
        }
        $stdout, $stderr = $null
        Write-CustomSuccess "      [DONE]"

        # validate patched archive
        if ($repackFlags.Custom -or $repackFlags.Hybrid) {
            Write-Custom "      Hashing patched archive..." -NoNewline
        }
        else {
            Write-Custom "      Validating patched archive..." -NoNewline
        }
        Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
        Write-CustomLog "      Size: $((Get-ChildItem -LiteralPath $patchedBa2File).Length) bytes"
        if (
            -not ($repackFlags.Custom -or $repackFlags.Hybrid) -and
            # get patched BA2 hash records where the file name matches, the tag is present, and the file size matches
            ($patchedBa2Hashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file -and $_.Value.Tags -contains $repackTag -and $_.Value.FileSize -eq (Get-ChildItem -LiteralPath $patchedBa2File).Length }).Count -eq 0
        ) {
            $extraErrorText = @(
                "The size of this patched archive doesn't match any known archives."
            )
            $extraLogText = @(
                "Size: $((Get-ChildItem -LiteralPath $patchedBa2File).Length) bytes"
            )
            if (-not $ForcePatchedBa2Hashing) {
                $throwDelayedSizeMismatchError = $true
            }
            else {
                $multiFactorErrorFlag = $true
                throw "Size mismatch."
            }
        }
        $hash = $(Get-FileHash -LiteralPath $patchedBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
        Write-CustomLog "      Hash: $hash"
        if ($throwDelayedSizeMismatchError) {
            $multiFactorErrorFlag = $true
            throw "Size mismatch."
        }
        if ($repackFlags.Custom -or $repackFlags.Hybrid) {
            Write-CustomInfo "      [Hash: $hash]" -BypassLog
            continue
        }
        elseif ($patchedBa2Hashes[$hash].FileName -ne $file) {
            $extraErrorText = @(
                "The exact contents of this patched archive don't match any known archives."
            )
            $extraLogText = @("(No extra log info.)")
            $multiFactorErrorFlag = $true
            throw "Unrecognized file."
        }
        Write-CustomLog "      Tags: $($patchedBa2Hashes[$hash].Tags -join ", ")"
        if ($patchedBa2Hashes[$hash].Tags -contains $repackTag) {
            Write-CustomSuccess "      [VALID]"
        }
        else {
            $extraErrorText = @(
                "Because some combinations of repack sets generate the same patched BA2 archive, patched archives have 'tags' associated with them, so that not only do the size and contents of the newly-created patched archive need to match the data associated with said archive, the tags do as well. In this case, they did not match."
            )
            $extraLogText = @("(No extra log info.)")
            throw "Tag mismatch."
        }
    }
    catch {
        Write-CustomError "      [FAIL]"
        Write-CustomError $_ -ExtraContext $extraErrorText -Prefix "      ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
        Write-CustomLog $_.InvocationInfo.PositionMessage -ExtraContext $extraLogText -Prefix "      ERROR: "
        $processingFailed = $true
    }
    finally {
        $errorRecords = $null
        $stdout, $stderr = $null
        $extraErrorText, $extraLogText = $null
        $throwDelayedSizeMismatchError = $false
        if (Test-Path -LiteralPath $dir.workingFiles) {
            Remove-Item -LiteralPath $dir.workingFiles -Recurse -Force
        }
        Write-CustomLog "  Archive duration: $($archiveTimer.Elapsed.ToString())"
    }
}

Write-CustomLog "", "Section duration: $($sectionTimer.Elapsed.ToString())", "$("-" * 34)"


# clean up
Write-Custom ""
Write-Custom "Cleaning up..." -NoNewline
if ($repackFlags.Custom) {
    Write-CustomWarning "[CUSTOM - SKIPPED]"
}
elseif ($SkipFinalCleanup) {
    Write-CustomWarning "[SKIPPED]"
}
else {
    Write-Custom "[WORKING...]" -NoNewline -JustifyRight -KeepCursorPosition -BypassLog
    try {
        if (Test-Path -LiteralPath $dir.patchedFiles) {
            Remove-Item -LiteralPath $dir.patchedFiles -Force -Recurse
        }
        if (-not (Get-ChildItem $dir.defaultPatchedBa2)) {
            Remove-Item -LiteralPath $dir.defaultPatchedBa2
        }
    }
    catch {
        Write-CustomError "[ERROR]"
        Write-CustomError $_ -Prefix "ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
    }
    Write-CustomSuccess "[DONE]"
}

Write-Custom ""
if ($processingFailed) {
    Write-CustomError "Patched archive creation failed." -NoJustifyRight
    Exit-Script 1
}

Write-CustomSuccess "Patched archive creation succeeded." -NoJustifyRight
Exit-Script 0
