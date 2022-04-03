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
    [switch] $SkipRepackHashing,
    [switch] $SkipExistingPatchedHashing,
    [switch] $SkipChoosingPatchedBa2Dir,
    [switch] $NoPauseOnExit,
    [switch] $NoClearScreen,
    [switch] $AllowUnchanged
)


# constants and variables
# -----------------------

Set-Variable "BRBWIVersion" -Value $(New-Object System.Version -ArgumentList @(1, 1, 0)) -Option Constant
Set-Variable "InstallerVersion" -Value $(New-Object System.Version -ArgumentList @(1, 4, 0)) -Option Constant

Set-Variable "FileHashAlgorithm" -Value "SHA256" -Option Constant
Set-Variable "RunStartTime" -Value "$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ"))" -Option Constant
Set-Variable "LineWidth" -Value ($Host.UI.RawUI.WindowSize.Width - 1) -Option Constant
Set-Variable "TagJoiner" -Value "+" -Option Constant
Set-Variable "OriginalBackgroundColor" -Value $Host.UI.RawUI.BackgroundColor -Option Constant

$dir = @{}
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

$msvcp110dllVersion = (Get-Command "${env:windir}\System32\msvcp110.dll" -ErrorAction SilentlyContinue).Version
$msvcr110dllVersion = (Get-Command "${env:windir}\System32\msvcr110.dll" -ErrorAction SilentlyContinue).Version

$scriptTimer = [System.Diagnostics.Stopwatch]::StartNew()
$sectionTimer = New-Object System.Diagnostics.Stopwatch
$archiveTimer = New-Object System.Diagnostics.Stopwatch
$toolTimer = New-Object System.Diagnostics.Stopwatch
$writeCustomPrevNoNewLineLength = 0


# tools
# -----

# 7-Zip Standalone Console v21.07 (2021-12-26) by Igor Pavlov
# https://www.7-zip.org/
$tool7za = "$($dir.tools)\7-Zip\x64\7za.exe"

# Archive2 v1.1.0.4 by Bethesda Game Studios
# Part of the Fallout 4 Creation Kit
# https://bethesda.net/en/game/bethesda-launcher
$toolArchive2 = "$($dir.tools)\Archive2\Archive2.exe"

# BSA Browser v1.14.1 by AlexxEG
# https://www.nexusmods.com/skyrimspecialedition/mods/1756
$toolBsab = "$($dir.tools)\BSA Browser\bsab.exe"

# robocopy by Microsoft
# included with Windows
$toolRobocopy = "robocopy"


# imports
# -------

. .\Tools\lib\Functions.ps1
. .\Tools\lib\Hashes.ps1


# late variables
# --------------

$currentDirectory = [IO.Path]::GetFullPath((Get-Location))

# more complicated than simply using $ba2Files, but allows for easier testing
[string[]] $ba2Filenames = @($originalBa2Hashes.Keys | ForEach-Object { $originalBa2Hashes[$_].FileName }) | Sort-Object -Unique

$dir.fallout4DataRegistry = Get-Fallout4DataFolder -DiscoveryMethod Registry
$dir.fallout4DataSteam = Get-Fallout4DataFolder -DiscoveryMethod Steam


# begin script
# ------------

$Host.UI.RawUI.BackgroundColor = 'black'
if (-not $NoClearScreen) { Clear-Host }
Write-Log @(
    ">" * $LineWidth
    "Diagnostic Information:"
    "  BiRaitBec WorkBase Improved Version: $BRBWIVersion"
    ""
    "  Installer Version: $InstallerVersion"
    "  Functions Version: $FunctionsVersion"
    "  Hashes Version: $HashesVersion"
    ""
    "  Windows Version: $(Get-WindowsVersion)"
    "  msvcp110.dll Version: " + $(if ($msvcp110dllVersion) { $msvcp110dllVersion } else { "(Not Found)" })
    "  msvcr110.dll Version: " + $(if ($msvcr110dllVersion) { $msvcr110dllVersion } else { "(Not Found)" })
    ""
    "  Current Directory: $currentDirectory"
    ""
    "  Number of Repack archive hashes: $($repack7zHashes.Keys.Count)"
    "  Number of Original BA2 Hashes: $($originalBa2Hashes.Keys.Count)"
    "  Number of Patched BA2 Hashes: $($patchedBa2Hashes.Keys.Count)"
    ""
    "  Line Width: $LineWidth"
    "  Original Console Background Color: $OriginalBackgroundColor"
    "  Color DWORD Value (Black): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Black.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Blue): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Blue.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Green): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Green.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Red): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Red.value__).ToString("D2"))").ToString("X6"))"
    "  Color DWORD Value (Yellow): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Yellow.value__).ToString("D2"))").ToString("X6"))"
    ""
    "  Fallout 4 Data directory (Registry method): " + $(if ($dir.fallout4DataRegistry) { $dir.fallout4DataSteam } else { "(Not Found)" })
    "  Fallout 4 Data directory (Steam method): " + $(if ($dir.fallout4DataSteam) { $dir.fallout4DataSteam } else { "(Not Found)" })
    ""
    "  Files in Repack7z directory:"
    Get-ChildItem $dir.repack7z -File | ForEach-Object { "    `"$($_.Name)`" ($($_.Length) bytes)" }
    ""
    "  Files in OriginalBa2 directory:"
    Get-ChildItem $dir.originalBa2 -File | ForEach-Object { "    `"$($_.Name)`" ($($_.Length) bytes)" }
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


# check location to ensure the script is not located in a problematic directory
# -----------------------------------------------------------------------------

$problemDirs = @(
    [IO.Path]::GetFullPath(${env:ProgramFiles})
    [IO.Path]::GetFullPath(${env:ProgramFiles(x86)})
    [IO.Path]::GetFullPath(${env:windir})
    (Get-Item $([IO.Path]::GetFullPath(${env:USERPROFILE}))).Parent.FullName
)
foreach ($problemDir in $problemDirs) {
    if ($currentDirectory.StartsWith($problemDir, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-Custom ""
        Write-Error @(
            "Attempting to run script from `"$currentDirectory`"."
            ""
            "Problematic location detected. Please ensure this script is not anywhere inside the following folders:"
            $problemDirs | ForEach-Object { "  $_" }
        ) -Prefix "ERROR: " -NoJustifyRight
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
    Write-Error @(
        "Need 64-bit Visual C++ Redistributable for Visual Studio 2012 Update 4! Please download it from this link:"
        "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
    ) -Prefix "ERROR: " -NoJustifyRight
    Exit-Script 1
}


# select patched BA2 folder
# -------------------------

$sectionTimer.Restart()

# create the PatchedBa2 folder and error out if it fails
try {
    if (-not (Test-Path -LiteralPath $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
}
catch {
    Write-Error $_ -Prefix "ERROR: " -SnippetLength 3 -NoJustifyRight
    Exit-Script 1
}

Write-Custom ""
Write-Custom "Patched BA2 archive folder:" -NoNewLine
if (-not $SkipChoosingPatchedBa2Dir) {
    $dir.patchedBa2 = Get-Folder -Description "Select patched BA2 output folder:" -InitialDirectory $([IO.Path]::GetFullPath("$(Get-Location)\$($dir.patchedBa2)"))
}
if ($null -eq $dir.patchedBa2) {
    Write-Error "[CANCELLED]"
    Write-Custom ""
    Write-Error "Cancelled by user." -NoJustifyRight
    Exit-Script 1
}

# prettify the common case of user specifying the default folder
if (
    $(Resolve-Path -LiteralPath $dir.defaultPatchedBa2 -ErrorAction SilentlyContinue).Path -eq
    $(Resolve-Path -LiteralPath $dir.patchedBa2 -ErrorAction SilentlyContinue).Path
) {
    $dir.patchedBa2 = $dir.defaultPatchedBa2
}

Write-Info $dir.patchedBa2

Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"


# check for repack archives
# -------------------------

$sectionTimer.Restart()

$repackFlags = [ordered]@{}
$repackFiles.Keys | ForEach-Object { $repackFlags.$_ = $true }

$foundRepackFiles = [ordered]@{}  # set up variable to mirror data structure of $repackFiles, only with the actual files used
$firstIteration = $true
Write-Custom "", "Validating repack sets:"
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
            $fileExt = $file.Substring($file.LastIndexOf('.'))

            # allow for fuzzy matching
            # @(Get-ChildItem -Path $dir.repack7z -File -Filter "$fileName*$fileExt" | Where-Object
            #   get files that match file name with anything between the end of the filename and the file extension and pipe them into Where-Object
            # { $_.Length -eq
            #   get the file size and prepare to see if it's equal to
            # ($repack7zHashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file }).Value.FileSize })
            #   get the repack hash object that matches the file name and get its file size for comparison
            $potentialRepackFiles = @(Get-ChildItem -Path $dir.repack7z -File -Filter "$fileName*$fileExt" | Where-Object { $_.Length -eq ($repack7zHashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file }).Value.FileSize })
            if ($potentialRepackFiles.Count -gt 0) {
                if ($potentialRepackFiles.Count -gt 1) {
                    Write-Log "    Found multiple candidate files for ${file}:"
                    foreach ($potentialFile in $potentialRepackFiles) { Write-Log "      $($potentialFile.Name) ($($potentialFile.Length) bytes)" }
                }
                $altFile = $potentialRepackFiles[-1].Name
                $altRelFile = "$($dir.repack7z)\$($potentialRepackFiles[-1].Name)"
            }

            $foundFiles += $altFile

            if ($null -ne $altRelFile -and $altRelFile -ne $relFile) {
                Write-Log "    `"$file`" not found; using `"$altFile`" instead"
                $relFile = $altRelFile
            }

            Write-Custom "    $altFile" -NoNewLine

            if (Test-Path -LiteralPath $relFile) {
                if ($SkipRepackHashing) {
                    Write-Warning "    [SKIPPED]"
                }
                else {
                    # check size before checking hash
                    if (@($repack7zHashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $file -and $_.Value.FileSize -eq (Get-ChildItem $relFile).Length }).Count -eq 0) {
                        Write-Warning "    [SIZE MISMATCH]"
                        $repackFlags[$object.Key] = $false
                        continue
                    }

                    Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
                    $hash = (Get-FileHash -LiteralPath $relFile -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
                    Write-Log "    Hash: $hash"
                    if ($repack7zHashes[$hash].FileName -eq $file) {
                        Write-Success "    [VALID]"
                    }
                    else {
                        Write-Warning "    [UNRECOGNIZED]"
                        $repackFlags[$object.Key] = $false
                    }
                }
            }
            else {
                Write-Warning "    [NOT FOUND]"
                $repackFlags[$object.Key] = $false
            }
        }
        catch {
            Write-Error "    [ERROR]"
            Write-Error $_ -Prefix "    ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
            $validateRepacksFailed = $true
            break outerLoop
        }
        finally {
            Write-Log "    Archive duration: $($archiveTimer.Elapsed.ToString())"
        }
    }
    $foundRepackFiles."$($object.Key)" = $foundFiles
}

Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"

if ($validateRepacksFailed) {
    Exit-Script 1
}

# replace list of expected repack files with the list of found repack files
$repackFiles = $foundRepackFiles


# check if custom run and create tag
# ----------------------------------

$sectionTimer.Restart()

# if not using Performance, Main, or Quality, don't need to install the Vault Fix
$vaultFixNeeded = $true
if (-not $repackFlags.Performance -and -not $repackFlags.Main -and -not $repackFlags.Quality) {
    $repackFlags."Vault Fix" = $false
    $vaultFixNeeded = $false
}

# get the list of original archive size mismatches, then take that list and see how many of those mismatches match sizes for alternate original archives
$originalBa2SizeMismatches, $alternateOriginalBa2SizeMatches = $null
# $originalBa2Hashes.GetEnumerator() | Where-Object {
#   get enumerator for the original BA2 hashes and pipe it into Where-Object
# $_.Value.FileSize -ne
#   get file size for a given file and prepare to see if it's not equal
# (Get-ChildItem -LiteralPath (Get-OriginalBa2File $_.Value.FileName) -ErrorAction SilentlyContinue).Length
#   use the Get-OriginalBa2File function to grab the full path of the file
#   feed full file path of file to Get-ChildItem, telling it to silently continue if not there (it gets checked later)
#   get file size of file returned by Get-ChildItem
# } | Sort-Object { $_.Value.FileName }
#   make sure that any objects found are sorted by file name
$originalBa2SizeMismatches = $originalBa2Hashes.GetEnumerator() | Where-Object { $_.Value.FileSize -ne (Get-ChildItem -LiteralPath (Get-OriginalBa2File $_.Value.FileName) -ErrorAction SilentlyContinue).Length } | Sort-Object { $_.Value.FileName }
# $originalBa2SizeMismatches | ForEach-Object {
#   take the original ba2 size mismatches and pipe them into ForEach-Object
# $currentMismatch = $_;
#   assign the current object in the pipeline to a variable other than $_
# $alternateOriginalBa2Hashes.GetEnumerator() | Where-Object {
#   get an enumerator for the alternate original ba2 hashes and pipe it into Where-Object
# $_.Value.FileName -eq $currentMismatch.Value.FileName -and
# $_.Value.FileSize -eq (Get-ChildItem -LiteralPath (Get-OriginalBa2File $_.Value.FileName) -ErrorAction SilentlyContinue).Length } }
#   have Where-Object find alternate original BA2s that have matching file names and matching file sizes
$alternateOriginalBa2SizeMatches = $originalBa2SizeMismatches | ForEach-Object { $currentMismatch = $_; $alternateOriginalBa2Hashes.GetEnumerator() | Where-Object { $_.Value.FileName -eq $currentMismatch.Value.FileName -and $_.Value.FileSize -eq (Get-ChildItem -LiteralPath (Get-OriginalBa2File $_.Value.FileName) -ErrorAction SilentlyContinue).Length } }

# check to see if the conditions for a custom run are met:
#   custom assets exist AND one+ original BA2 size doesn't match expected original BA2 size AND those same archives original BA2 size matches expected alternate BA2 size
#   custom assets exist AND no standard tag
if (
    (Test-Path -LiteralPath "$($dir.patchedFiles)\Textures") -and
    (Get-ChildItem -LiteralPath "$($dir.patchedFiles)\Textures" -Filter "*.dds" -Recurse).Count
) {
    $customReason = 0
    if (
        $originalBa2SizeMismatches.Count -gt 0 -and
        $alternateOriginalBa2SizeMatches.Count -gt 0
    ) {
        $customReason = 1
    }
    elseif ($repackFlags.Keys.Where({ $repackFlags[$_] }).Count -eq 0) {
        $customReason = 2
    }
    if ($customReason) {
        foreach ($key in $($repackFlags.Keys)) { $repackFlags[$key] = $false }
        $repackFlags.Custom = $customReason
        $repackTag = "Custom"
        $repackFlags
    }
}

# create tag
$repackTag = $repackFlags.Keys.Where({ $repackFlags[$_] }) -join $TagJoiner
if (-not $repackTag) { $repackTag = "Unchanged" }

$firstIteration = $true
Write-Custom "", "Using repack set:"
foreach ($object in $repackFlags.GetEnumerator()) {
    if ($firstIteration) { $firstIteration = $false } else { Write-Log "  $("-" * ($LineWidth - 2))" }
    Write-Custom "  $($object.Key)" -NoNewLine
    switch -wildcard ($object.Key) {
        "*" { $flagSetText = "  [YES]"; $flagUnsetText = "  [NO]" }
        "Vault Fix" {
            if (-not $vaultFixNeeded) { $flagUnsetText = "  [NOT NEEDED]" }
        }
    }
    if ($object.Value) {
        Write-Success $flagSetText
    }
    else {
        Write-Warning $flagUnsetText
    }
}

Write-Log "", "Repack tag: $repackTag"
if ($repackFlags.Custom) {
    Write-Log @(
        "Original BA2 size mismatches: $($originalBa2SizeMismatches.Count)"
        @($originalBa2SizeMismatches | ForEach-Object { "  $(Get-OriginalBa2File $_.Value.FileName) ($($_.Value.Tags -join ", "))" })
        "Original BA2 size mismatches that match alternate original BA2 sizes: $($alternateOriginalBa2SizeMatches.Count)"
        @($alternateOriginalBa2SizeMatches | ForEach-Object { "  $($_.Value.FileName) ($($_.Value.Tags -join ", "))" })
    )
}
Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"

if ($repackFlags.Custom -eq 1) {
    Write-Warning "", "Existing assets found in `"$($dir.patchedFiles)`" and possible alternative original BA2 archive$(if ($alternateOriginalBa2SizeMatches.Count -ne 1) {"s"}) detected.", "Mode switched to `"Custom`"." -NoJustifyRight
}
elseif ($repackFlags.Custom -eq 2) {
    Write-Warning "", "Existing assets found in `"$($dir.patchedFiles)`" and no repack sets detected.", "Mode switched to `"Custom`"." -NoJustifyRight
}
elseif ($repackTag -eq "Unchanged") {
    $message = "No repack sets found and no custom assets exist."
    Write-Custom ""
    if ($AllowUnchanged) {
        Write-Warning $message -Prefix "WARNING: " -NoJustifyRight
    }
    else {
        Write-Error $message -Prefix "ERROR: " -NoJustifyRight
        Exit-Script 1
    }
}


# validate any existing patched archives
# --------------------------------------

$sectionTimer.Restart()

Write-Custom ""
Write-Custom "Validating existing patched BA2 archives:" -NoNewLine
if ($SkipExistingPatchedHashing) {
    Write-Warning "[SKIPPED]"
}
elseif ($repackFlags.Custom) {
    Write-Warning "[CUSTOM - SKIPPED]"
}
else {
    $firstIteration = $true
    Write-Custom "" -BypassLog
    foreach ($object in $ba2Files.GetEnumerator()) {
        try {
            $archiveTimer.Restart()

            $file = $object.Value
            $relFile = "$($dir.patchedBa2)\$file"

            if ($firstIteration) { $firstIteration = $false } else { Write-Log "  $("-" * ($LineWidth - 2))" }
            Write-Custom "  $file" -NoNewLine

            if (Test-Path -LiteralPath $relFile) {
                $hash = (Get-FileHash -LiteralPath $relFile -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
                Write-Log "  Hash: $hash"
                if ($patchedBa2Hashes[$hash].FileName -eq $file) {
                    Write-Log "  Tags: $($patchedBa2Hashes[$hash].Tags -join ", ")"
                    if ($patchedBa2Hashes[$hash].Tags -contains $repackTag) {
                        Write-Success "  [VALID]"
                        $ba2Filenames = $ba2Filenames.Where({ $_ -ne $file })
                    }
                    else {
                        Write-Warning "  [REPACK SET MISMATCH]"
                    }
                }
                else {
                    Write-Warning "  [UNRECOGNIZED]"
                }
            }
            else {
                Write-Warning "  [NOT FOUND]"
            }
        }
        catch {
            Write-Error "  [ERROR]"
            Write-Error $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
            $validateArchivesFailed = $true
            break
        }
        finally {
            Write-Log "  Archive duration: $($archiveTimer.Elapsed.ToString())"
        }
    }
}

Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"

if ($validateArchivesFailed) {
    Exit-Script 1
}

if (-not $ba2Filenames.Count) {
    Write-Success "", "Existing patched archives validated successfully; nothing to do!" -NoJustifyRight
    Exit-Script 0
}


# extract repack archives
# -----------------------

$sectionTimer.Restart()

Write-Custom ""
Write-Custom "Extracting repack archives:" -NoNewLine
if ($repackFlags.Custom) {
    Write-Warning "[CUSTOM - SKIPPED]"
}
else {
    Write-Custom "" -BypassLog

    # because not using a custom repack, move PatchedFiles directory if said directory exists
    if (Test-Path -LiteralPath $dir.patchedFiles) {
        Write-Custom "  Pre-existing PatchedFiles folder moved to:" -NoNewLine
        try {
            Rename-Item -LiteralPath $dir.patchedFiles -NewName "$($dir.patchedFiles).backup.$RunStartTime" -ErrorAction Stop
        }
        catch {
            Write-Error "  [ERROR]"
            Write-Error $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
            Exit-Script 1
        }
        Write-Info "  $($dir.patchedFiles).backup.$RunStartTime"
    }

    # create PatchedFiles directory
    try {
        New-Item $dir.patchedFiles -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    catch {
        Write-Error $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
        Exit-Script 1
    }

    $firstIteration = $true
    :outerLoop foreach ($object in $repackFiles.GetEnumerator()) {
        # pre-extraction
        try {
            if (-not $repackFlags[$object.Key]) { continue }
            if ($firstIteration) { $firstIteration = $false } else { Write-Custom "  $("-" * ($LineWidth - 2))" }
            Write-Custom "  $($object.Key) ($($object.Value.Count) archive$(if ($object.Value.Count -ne 1) {"s"})):"

            # remove and create temp directory
            if (Test-Path -LiteralPath $dir.temp) {
                Remove-Item -LiteralPath $dir.temp -Force -Recurse -ErrorAction Stop
            }
            New-Item $dir.temp -ItemType "directory" -ErrorAction Stop | Out-Null

            switch ($object.Key) {
                # special case: if main is being used with performance, save texture from performance for later use
                "Main" {
                    if ($repackFlags.Performance) {
                        Copy-Item -LiteralPath "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" -Destination "$($dir.temp)\VltHallResPaneled07Cafeteria02_Damage_d.dds" -ErrorAction Stop
                    }
                }
            }
        }
        catch {
            Write-Error "  [ERROR]"
            Write-Error $_ -Prefix "  ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
            $extractRepackFailed = $true
            break
        }

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
                Write-Custom "    $file" -NoNewLine
                Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog

                # do the actual extraction and save the command line used to the tool log
                Write-Log "`"$tool7za`" x -y -bb2 -bd -o`"$outDir`" `"$relFile`" `"$(if ($extra) {$extra -join '" "'})`"" -Log "tool"
                $toolTimer.Restart()
                $stdout, $stderr = (& "$tool7za" x -y -bb2 -bd -o"$outDir" "$relFile" "$(if ($extra) {$extra -join '" "'})" 2>&1).Where({ $_ -is [string] -and $_ -ne "" }, "Split")
                Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
                Write-Log "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool" -NoTimestamp

                # check if extracting the archive succeeded
                if ($LASTEXITCODE -ne 0) {
                    throw "Extracting `"$relFile`" failed."
                }
                Write-Success "    [DONE]"
            }
            catch {
                Write-Error "    [ERROR]"
                if ($null -ne $stderr) {
                    Write-Error $stderr -Prefix "    ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
                }
                Write-Error $_ -Prefix "    ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
                $extractRepackFailed = $true
                break outerLoop
            }
            finally {
                $stdout = $null
                Write-Log "    Archive duration: $($archiveTimer.Elapsed.ToString())"
            }
        }

        # post-extraction
        try {
            switch ($object.Key) {
                # special case: if on main and using performance, copy previously-saved texture
                "Main" {
                    if ($repackFlags.Performance) {
                        Copy-Item -LiteralPath "$($dir.temp)\VltHallResPaneled07Cafeteria02_Damage_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" -ErrorAction Stop
                    }
                }
                # special case: if on restyle, copy items to PatchedFiles folder
                "Restyle" {
                    Copy-Item -LiteralPath $($extra | ForEach-Object { "$($dir.temp)\$_" }) -Destination "$($dir.patchedFiles)" -Force -Recurse -ErrorAction Stop
                }
                # special case: if using vault fix, copy copy Textures subdirectory
                "Vault Fix" {
                    Copy-Item -LiteralPath "$($dir.temp)\Data\Textures" -Destination "$($dir.patchedFiles)" -Force -Recurse -ErrorAction Stop
                }
            }

            if (Test-Path -LiteralPath $dir.temp) {
                Remove-Item -LiteralPath $dir.temp -Force -Recurse
            }
        }
        catch {
            Write-Error $_ -Prefix "  ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
            $extractRepackFailed = $true
            break
        }
    }
}

Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"

if ($extractRepackFailed) {
    if (Test-Path -LiteralPath $dir.temp) {
        Remove-Item -LiteralPath $dir.temp -Force -Recurse
    }
    Exit-Script 1
}


# remove known bad patched files
# ------------------------------

$sectionTimer.Restart()

Write-Custom ""
Write-Custom "Checking for known bad patched files:" -NoNewLine

$potentiallyBadPatchedFilenames = @($badPatchedFileHashes.GetEnumerator() | ForEach-Object { $_.Value.FileName } | Where-Object { Test-Path -LiteralPath $_ } | Sort-Object -Unique)
Write-Info "  $($potentiallyBadPatchedFilenames.Count) potential file$(if ($potentiallyBadPatchedFilenames.Count -ne 1) {"s"}) found"

for ($index = 0; $index -lt $potentiallyBadPatchedFilenames.Count; $index++) {
    $file = $potentiallyBadPatchedFilenames[$index]
    Write-Custom "  File $($index + 1) of $($potentiallyBadPatchedFilenames.Count): " -NoNewLine
    Write-Info "  $(($file.Split("\") | Select-Object -Skip 2) -join "\")" -NoJustifyRight -NoNewLine
    $hash = (Get-FileHash -LiteralPath $file -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
    if ($badPatchedFileHashes[$hash].FileName -eq $file) {
        try {
            Rename-Item -LiteralPath $file -NewName "$($file.Split("\")[-1]).bad_file" -ErrorAction Stop
            Write-Warning "  [RENAMED]"
        }
        catch {
            Write-Error "  [ERROR]"
            Write-Error $_ -Prefix "  ERROR: " -NoJustifyRight -NoTrimBeforeDisplay
            Exit-Script 1
        }
    }
    else {
        Write-Success "  [GOOD FILE]"
    }
}

Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"


# process archives
# ----------------

$sectionTimer.Restart()
Write-Custom "", "Archives to build:"
foreach ($file in $ba2Files.GetEnumerator()) {
    Write-Custom "  $($file.Value)" -NoNewLine
    if ($ba2Filenames -contains $file.Value) {
        Write-Success "  [YES]"
    }
    else {
        Write-Warning "  [NO]"
    }
}

try {
    if (-not (Test-Path -LiteralPath $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    if (Test-Path -LiteralPath $dir.workingFiles) {
        Remove-Item -LiteralPath $dir.workingFiles -Recurse -Force -ErrorAction Stop
    }
}
catch {
    Write-Error $_ -Prefix "ERROR: " -SnippetLength 3
    Exit-Script 1
}

$firstIteration = $true
Write-Custom "", "Processing archives:"
for ($index = 0; $index -lt $ba2Filenames.Count; $index++) {
    try {
        $archiveTimer.Restart()

        if ($firstIteration) { $firstIteration = $false } else { Write-Custom "  $("-" * ($LineWidth - 2))" }

        $stdout, $stderr = $null
        $file = $ba2Filenames[$index]
        Write-Custom "  Archive $($index + 1) of $($ba2Filenames.Count) ($file):"
        $originalBa2File = Get-OriginalBa2File $file
        $patchedBa2File = "$($dir.patchedBa2)\$file"

        Write-Custom "    Original BA2: " -NoNewLine
        Write-Info "    $originalBa2File"

        # validate original archive
        Write-Custom "      Validating original archive..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
        $hash = (Get-FileHash -LiteralPath $originalBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
        Write-Log "      Hash: $hash"
        if ($originalBa2Hashes[$hash].FileName -eq $file) {
            $validOriginalText = "[VALID]"
        }
        elseif ($repackFlags.Custom -and $alternateOriginalBa2Hashes[$hash].FileName -eq $file) {
            $validOriginalText = "[VALID - ALTERNATE]"
        }
        elseif ($repackFlags.Custom -and $oldAlternateOriginalBa2Hashes[$hash].FileName -eq $file) {
            Write-Log "      Tags: $($oldAlternateOriginalBa2Hashes[$hash].Tags -join ", ")"
            throw "Old version of an alternate original archive detected."
        }
        else {
            throw "Unrecognized archive file."
        }
        Write-Log "      Tags: $($originalBa2Hashes[$hash].Tags -join ", ")$($alternateOriginalBa2Hashes[$hash].Tags -join ", ")"
        Write-Success "      $validOriginalText"

        # create working files directory
        New-Item $dir.workingFiles -ItemType "directory" -ErrorAction Stop | Out-Null

        # extract original archive
        Write-Custom "      Extracting original archive..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
        Write-Log "`"$toolArchive2`" `"$originalBa2File`" -extract=`"$($dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolArchive2" "$originalBa2File" -extract="$($dir.workingFiles)" 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ne 0) {
            throw "Extracting `"$originalBa2File`" failed."
        }
        $stdout, $stderr = $null

        # correctly extract cubemaps
        Write-Log "`"$toolBsab`" -e -o -f `"Textures\Shared\Cubemaps\*`" `"$originalBa2File`" `"$($dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolBsab" -e -o -f "Textures\Shared\Cubemaps\*" "$originalBa2File" "$($dir.workingFiles)" 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ne 0) {
            # because bsab doesn't use stderr, copy stdout to stderr, but check anyway just in case
            if ($stderr -eq "") {
                $stderr = $stdout
            }
            throw "Extracting cubemaps from `"$originalBa2File`" failed."
        }
        $stdout, $stderr = $null
        Write-Success "      [DONE]"

        Write-Custom "    Patched BA2: " -NoNewLine
        Write-Info "    $patchedBa2File"

        # copy patched files
        Write-Custom "      Copying patched files..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
        Write-Log "`"$toolRobocopy`" `"$($dir.patchedFiles)`" `"$($dir.workingFiles)`" /s /xl /np /njh" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolRobocopy" "$($dir.patchedFiles)" "$($dir.workingFiles)" /s /xl /np /njh 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ge 8) {
            # because robocopy doesn't use stderr, copy stdout to stderr, but check anyway just in case
            if ($stderr -eq "") {
                $stderr = $stdout
            }
            throw "Copying patched files failed."
        }
        $stdout, $stderr = $null
        Write-Success "      [DONE]"

        # create patched archive
        Write-Custom "      Creating patched archive..." -NoNewline
        Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
        Write-Log "`"$toolArchive2`" `"$($dir.workingFiles)`" -format=`"DDS`" -create=`"$patchedBa2File`" -root=`"$(Resolve-Path $dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolArchive2" "$($dir.workingFiles)" -format="DDS" -create="$patchedBa2File" -root="$(Resolve-Path $dir.workingFiles)" 2>&1).
        Where({ $_ -is [string] -and $_ -ne "" }, "Split")
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log "STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ne 0) {
            throw "Creating `"$patchedBa2File`" failed."
        }
        $stdout, $stderr = $null
        Write-Success "      [DONE]"

        # validate patched archive
        if ($repackFlags.Custom) {
            Write-Custom "      Hashing patched archive..." -NoNewLine
        }
        else {
            Write-Custom "      Validating patched archive..." -NoNewline
        }
        Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
        $hash = $(Get-FileHash -LiteralPath $patchedBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
        Write-Log "      Hash: $hash"
        if ($repackFlags.Custom) {
            Write-Info "      [Hash: $hash]" -BypassLog
            continue
        }
        elseif ($patchedBa2Hashes[$hash].FileName -ne $file) {
            throw "Unrecognized file. The file's SHA256 hash doesn't match any known outputs."
        }
        Write-Log "      Tags: $($patchedBa2Hashes[$hash].Tags -join ", ")"
        if ($patchedBa2Hashes[$hash].Tags -contains $repackTag) {
            Write-Success "      [VALID]"
        }
        else {
            throw "Tag mismatch. Metadata for the hash of this archive does not contain tag `"$repackTag`"."
        }
    }
    catch {
        Write-Error "      [FAIL]"
        if ($null -ne $stderr) {
            Write-Error $stderr -Prefix "      ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
            $stdout, $stderr = $null
        }
        Write-Error $_ -Prefix "      ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
        $processingFailed = $true
    }
    finally {
        if (Test-Path -LiteralPath $dir.workingFiles) {
            Remove-Item -LiteralPath $dir.workingFiles -Recurse -Force
        }
        Write-Log "  Archive duration: $($archiveTimer.Elapsed.ToString())"
    }
}

Write-Log "", "Section duration: $($sectionTimer.Elapsed.ToString())"

if (-not $repackFlags.Custom) {
    Write-Custom ""
    Write-Custom "Cleaning up..." -NoNewLine
    Write-Custom "[WORKING...]" -NoNewLine -JustifyRight -KeepCursorPosition -BypassLog
    try {
        if (Test-Path -LiteralPath $dir.patchedFiles) {
            Remove-Item -LiteralPath $dir.patchedFiles -Force -Recurse
        }
        if (-not (Get-ChildItem $dir.defaultPatchedBa2)) {
            Remove-Item -LiteralPath $dir.defaultPatchedBa2
        }
    }
    catch {
        Write-Error "[ERROR]"
        Write-Error $_ -Prefix "ERROR: " -SnippetLength 3 -NoJustifyRight -NoTrimBeforeDisplay
    }
    Write-Success "[DONE]"
}

Write-Custom ""
if ($processingFailed) {
    Write-Error "Processing archives failed." -NoJustifyRight
    Exit-Script 1
}

Write-Success "Processing archives succeeded." -NoJustifyRight
Exit-Script 0
