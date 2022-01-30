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
    [switch] $SkipExistingPatchedHashing
)


# constants and variables
# -----------------------

Set-Variable "InstallerVersion" -Value $(New-Object "System.Version" -ArgumentList @(0, 1, 0))

Set-Variable "FileHashAlgorithm" -Value "SHA256" -Option Constant
Set-Variable "RunStartTime" -Value "$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ"))" -Option Constant
Set-Variable "LineWidth" -Value ($Host.UI.RawUI.WindowSize.Width - 1) -Option Constant
Set-Variable "TagJoiner" -Value "+" -Option Constant
Set-Variable "OriginalBackgroundColor" -Value $Host.UI.RawUI.BackgroundColor -Option Constant

$dir = @{}
$dir.fallout4DataRegistry = ""
$dir.fallout4DataSteam = ""
$dir.logs = ".\Logs"
$dir.originalBa2 = ".\OriginalBa2"
$dir.patchedBa2 = ".\PatchedBa2"
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
$vcrMinVersion = New-Object "System.Version" -ArgumentList @(11, 00, 51106, 1)

$scriptTimer = [System.Diagnostics.Stopwatch]::StartNew()
$sectionTimer = New-Object System.Diagnostics.Stopwatch
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
Clear-Host
Write-Log @(
    ">" * $LineWidth
    "Diagnostic Information:"
    "  Installer Version: $InstallerVersion"
    "  Functions Version: $FunctionsVersion"
    "  Hashes Version: $HashesVersion"
    ""
    "  Windows Version: $(Get-WindowsVersion)"
    "  msvcp110.dll Version: " + $(if ($msvcp110dllVersion) {$msvcp110dllVersion} else {"Not Found"})
    "  msvcr110.dll Version: " + $(if ($msvcr110dllVersion) {$msvcr110dllVersion} else {"Not Found"})
    ""
    "  Current Directory: $currentDirectory"
    ""
    "  Number of Repack archive hashes: $($repack7zHashes.Keys.Count)"
    "  Number of Original BA2 Hashes: $($originalBa2Hashes.Keys.Count)"
    "  Number of Patched BA2 Hashes: $($patchedBa2Hashes.Keys.Count)"
    ""
    "  Line Width: $LineWidth"
    "  Original Console Background Color: $OriginalBackgroundColor"
    "  Color Hex Value (Black): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Black.value__).ToString("D2"))").ToString("X6"))"
    "  Color Hex Value (Blue): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Blue.value__).ToString("D2"))").ToString("X6"))"
    "  Color Hex Value (Green): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Green.value__).ToString("D2"))").ToString("X6"))"
    "  Color Hex Value (Red): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Red.value__).ToString("D2"))").ToString("X6"))"
    "  Color Hex Value (Yellow): $((Get-ItemPropertyValue HKCU:\Console -Name "ColorTable$(([System.ConsoleColor]::Yellow.value__).ToString("D2"))").ToString("X6"))"
    ""
    "  Fallout 4 Data directory (Registry method): " + $(if ($dir.fallout4DataRegistry) {$dir.fallout4DataSteam} else {"Not Found"})
    "  Fallout 4 Data directory (Steam method): " + $(if ($dir.fallout4DataSteam) {$dir.fallout4DataSteam} else {"Not Found"})
    "<" * $LineWidth
    ""
)


# check location to ensure it's not located in a problematic directory
# --------------------------------------------------------------------

$problemDirs = @(
    [IO.Path]::GetFullPath(${env:ProgramFiles})
    [IO.Path]::GetFullPath(${env:ProgramFiles(x86)})
    [IO.Path]::GetFullPath(${env:windir})
    [IO.Path]::GetFullPath(${env:USERPROFILE})
    [IO.Path]::GetFullPath(${env:PUBLIC})
)
foreach ($problemDir in $problemDirs) {
    if ($currentDirectory.StartsWith($problemDir, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-Error @(
            "Attempting to run script from `"$currentDirectory`"."
            "Problematic location detected. Please ensure this folder is OUTSIDE of any of the following folders:"
        ) -Prefix "ERROR: "
        Write-Error $problemDirs -Prefix "ERROR:   "
        Exit-Script 1
    }
}


# check for visual c++ redist files
# ---------------------------------

# need only C:\Windows\System32\msvcp110.dll and C:\Windows\System32\msvcr110.dll
# from vc redist 2012 update 4:
#   msvcp110.dll version = 11.00.51106.1
#   msvcr110.dll version = 11.00.51106.1
$vcrMinVersion = New-Object "System.Version" -ArgumentList @(11, 00, 51106, 1)
if ($msvcp110dllVersion -lt $vcrMinVersion -or $msvcr110dllVersion -lt $vcrMinVersion) {
    Write-Error @(
        "Need 64-bit Visual C++ Redistributable for Visual Studio 2012 Update 4! Please download it from this link:"
        "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
        ) -Prefix "ERROR: "
    Exit-Script 1
}


# check for repack archives
# -------------------------

$sectionTimer.Restart()

$repackFlags = [ordered]@{}
$repackFlags.Performance = $true
$repackFlags.Main = $true
$repackFlags.Quality = $true
$repackFlags.Restyle = $true

$firstIteration = $true
Write-Custom "Validating repack sets:"
foreach ($object in $repackFiles.GetEnumerator()) {
    if ($firstIteration) {$firstIteration = $false} else {Write-Custom "  $("-" * ($LineWidth - 2))"}
    Write-Custom "  $($object.Key) ($($object.Value.Count) archive$(if ($object.Value.Count -ne 1) {"s"})):"
    foreach ($file in $object.Value) {
        $relFile = "$($dir.repack7z)\$file"
        Write-Custom "    $file" -NoNewLine
        if (Test-Path $relFile) {
            if ($SkipRepackHashing) {
                Write-Warning "    [SKIPPED]"
            }
            else {
                try {
                    $hash = (Get-FileHash -Path $relFile -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
                }
                catch {
                    Write-Error "    [ERROR]"
                    Write-Error $_ -Prefix "ERROR: " -NoJustifyRight
                    Exit-Script 1
                }
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
}

$repackTag = $repackFlags.Keys.Where({$repackFlags[$_]}) -join $TagJoiner
if (-not $repackTag) {
    if (
        (Test-Path "$($dir.patchedFiles)\Textures") -and
        (Get-ChildItem "$($dir.patchedFiles)\Textures" -Filter "*.dds" -Recurse).Count
    ) {
        $repackFlags.Custom = $true
        $repackTag = "Custom"
    }
}

$firstIteration = $true
Write-Custom "","Using repack set:"
foreach ($object in $repackFlags.GetEnumerator()) {
    if ($firstIteration) {$firstIteration = $false} else {Write-Log "  $("-" * ($LineWidth - 2))"}
    Write-Custom "  $($object.Key)" -NoNewLine
    if ($object.Value) {
        Write-Success "  [YES]"
    }
    else {
        Write-Warning "  [NO]"
    }
}

Write-Log "","Repack tag: $repackTag"
Write-Log "","Section duration: $($sectionTimer.Elapsed.ToString())"

if ($repackFlags.Custom) {
    Write-Warning "","No repack sets found, but custom assets exist." -NoJustifyRight
}
elseif (-not $repackTag) {
    Write-Error "","No repack sets found and no custom assets exist." -NoJustifyRight
    Exit-Script 1
}


# validate any existing patched archives
# --------------------------------------

$sectionTimer.Restart()

try {
    if (-not (Test-Path $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
}
catch {
    Write-Error $_ -Prefix "ERROR: " -SnippetLength 3
    Exit-Script 1
}

Write-Custom ""
Write-Custom "Patched BA2 archive folder:" -NoNewLine
$dir.patchedBa2 = Get-Folder -Description "Select patched BA2 output folder:" -InitialDirectory $([IO.Path]::GetFullPath("$(Get-Location)\$($dir.patchedBa2)"))
if ($null -eq $dir.patchedBa2) {
    Write-Custom "" -BypassLog
    Write-Error "","Cancelled by user." -NoJustifyRight
    Exit-Script 1
}
Write-Info $dir.patchedBa2

Write-Custom ""
Write-Custom "Validating existing patched BA2 archives:" -NoNewLine
if ($repackFlags.Custom -or $SkipExistingPatchedHashing) {
    Write-Warning "[SKIPPED]"
}
else {
    $firstIteration = $true
    Write-Custom "" -BypassLog
    foreach ($object in $ba2Files.GetEnumerator()) {
        $file = $object.Value
        $relFile = "$($dir.patchedBa2)\$file"

        if ($firstIteration) {$firstIteration = $false} else {Write-Log "  $("-" * ($LineWidth - 2))"}
        Write-Custom "  $file" -NoNewLine

        if (Test-Path $relFile) {
            try {
                $hash = (Get-FileHash $relFile -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
            }
            catch {
                Write-Error "  [ERROR]"
                Write-Error $_ -Prefix "ERROR: " -NoJustifyRight
                Exit-Script 1
            }
            Write-Log "  Hash: $hash"
            if ($patchedBa2Hashes[$hash].FileName -eq $file) {
                Write-Log "  Tags: $($patchedBa2Hashes[$hash].Tags -join ", ")"
                if ($patchedBa2Hashes[$hash].Tags -contains $repackTag) {
                    Write-Success "  [VALID]"
                    $ba2Filenames = $ba2Filenames.Where({$_ -ne $file})
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
}

Write-Log "","Section duration: $($sectionTimer.Elapsed.ToString())"

if (-not $ba2Filenames.Count) {
    Write-Success "","Existing patched archives validated successfully; nothing to do!" -NoJustifyRight
    Exit-Script 0
}


# extract repack archives
# -----------------------

$sectionTimer.Restart()

Write-Custom ""
Write-Custom "Extracting repack archives:" -NoNewLine
if ($repackFlags.Custom) {
    Write-Warning "[SKIPPED]"
}
else {
    # remove PatchedFiles\Textures directory if not a custom repack and said directory exists
    if (Test-Path "$($dir.patchedFiles)\Textures") {
        Remove-Item "$($dir.patchedFiles)\Textures" -Force -Recurse
    }

    # create PatchedFiles directory if it doesn't exist
    if (-not (Test-Path $dir.patchedFiles)) {
        New-Item $dir.patchedFiles -ItemType "directory" | Out-Null
    }

    $firstIteration = $true
    Write-Custom "" -BypassLog
    foreach ($object in $repackFiles.GetEnumerator()) {
        try {
            if (-not $repackFlags[$object.Key]) { continue }
            if ($firstIteration) {$firstIteration = $false} else {Write-Custom "  $("-" * ($LineWidth - 2))"}
            Write-Custom "  $($object.Key) ($($object.Value.Count) archive$(if ($object.Value.Count -ne 1) {"s"})):"

            # remove and create temp directory
            if (Test-Path $dir.temp) {
                Remove-Item $dir.temp -Force -Recurse -ErrorAction Stop
            }
            New-Item $dir.temp -ItemType "directory" -ErrorAction Stop | Out-Null

            # special case: if main is being used with performance, save texture from performance for later use
            if ($object.Key -eq "Main" -and $repackFlags.Performance) {
                Copy-Item "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" -Destination "$($dir.temp)\VltHallResPaneled07Cafeteria02_Damage_d.dds" -ErrorAction Stop
            }

            # extract files
            foreach ($file in $object.Value) {
                $relFile = "$($dir.repack7z)\$file"
                if ($object.Key -ne "Restyle") {
                    $outDir = $dir.patchedFiles
                    $extra = @()
                }
                else {
                    $outDir = $dir.temp
                    $extra = @(
                        "Creatures\Dogmeat\2k Shadow The Dark Husky\Textures"
                        "Environment\Evil Institute HD\2k\Textures"
                        "Miscellaneous\Perk Grid Background Replacer\2k Silver White\Textures"
                    )
                }
                Write-Custom "    $file" -NoNewLine

                # save the cursor position
                $cursorPos = $Host.UI.RawUI.CursorPosition
                $savedLineLength = $writeCustomPrevNoNewLineLength
                Write-Custom "" -BypassLog

                # do the actual extraction and save the command line used to the tool log
                Write-Log "`"$tool7za`" x -y -bb2 -bse1 -bsp2 -o`"$outDir`" `"$relFile`" `"$(if ($extra) {$extra -join '" "'})`"" -Log "tool"
                $toolTimer.Restart()
                $stdout = (& "$tool7za" x -y -bb2 -bse1 -bsp2 -o"$outDir" "$relFile" "$(if ($extra) {$extra -join '" "'})")
                Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
                Write-Log $stdout,"" -Log "tool" -NoTimestamp
                Write-Log "$("-" * $LineWidth)" -Log "tool"
                Write-Log "" -Log "tool" -NoTimestamp

                # restore the cursor position
                Write-Custom "$(" " * $LineWidth)" -NoNewLine -BypassLog
                $Host.UI.RawUI.CursorPosition = $cursorPos
                $writeCustomPrevNoNewLineLength = $savedLineLength

                # check if extracting the archive succeeded
                if ($LASTEXITCODE -ne 0) {
                    throw "Extracting `"$relFile`" failed."
                }
                Write-Success "    [DONE]"
                $stdout = $null
            }

            # special case: if on main and using performance, copy previously-saved texture, otherwise delete corrupted texture
            if ($object.Key -eq "Main") {
                if ($repackFlags.Performance){
                    Copy-Item "$($dir.temp)\VltHallResPaneled07Cafeteria02_Damage_d.dds" -Destination "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds" -ErrorAction Stop
                }
                else {
                    Remove-Item "$($dir.patchedFiles)\Textures\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.dds"
                }
            }
            # special case: if on restyle, copy items to PatchedFiles folder
            elseif ($object.Key -eq "Restyle") {
                Copy-Item $($extra | ForEach-Object {"$($dir.temp)\$_"}) -Destination "$($dir.patchedFiles)" -Force -Recurse -ErrorAction Stop
            }
        }
        catch {
            Write-Error "[ERROR]"
            if ($null -ne $stdout) {
                Write-Error $stdout -Prefix "ERROR: " -SnippetLength 3 -NoJustifyRight
                $stdout = $null
            }
            Write-Error $_ -Prefix "ERROR: " -SnippetLength 3 -NoJustifyRight
            $extractRepackFailed = $true
        }
        finally {
            if (Test-Path $dir.temp) {
                Remove-Item $dir.temp -Force -Recurse
            }
        }
    }
}

Write-Log "","Section duration: $($sectionTimer.Elapsed.ToString())"

if ($extractRepackFailed) {
    Exit-Script 1
}


# process archives
# ----------------

$sectionTimer.Restart()

Write-Custom "","Archives to build:"
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
    if (-not (Test-Path $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    if (Test-Path $dir.workingFiles) {
        Remove-Item $dir.workingFiles -Recurse -Force -ErrorAction Stop
    }
}
catch {
    Write-Error $_ -Prefix "ERROR: " -SnippetLength 3
    Exit-Script 1
}

$archiveTimer = New-Object System.Diagnostics.Stopwatch
Write-Custom "","Processing archives:"
for ($index = 0; $index -lt $ba2Filenames.Count; $index++) {
    try {
        $archiveTimer.Restart()

        $stdout, $stderr = $null
        $file = $ba2Filenames[$index]
        Write-Custom "  Archive $($index + 1) of $($ba2Filenames.Count) ($file):"
        $originalBa2File = "$($dir.originalBa2)\$file"
        if (-not (Test-Path $originalBa2File)) {
            if (Test-Path "$($dir.fallout4DataRegistry)\$file") {
                $originalBa2File = "$($dir.fallout4DataRegistry)\$file"
            }
            elseif (Test-Path "$($dir.fallout4DataSteam)\$file") {
                $originalBa2File = "$($dir.fallout4DataSteam)\$file"
            }
        }
        $patchedBa2File = "$($dir.patchedBa2)\$file"

        Write-Custom "    Original BA2: " -NoNewLine
        Write-Info "    $originalBa2File"

        # validate original archive
        Write-Custom "      Validating original archive..." -NoNewline
        $hash = (Get-FileHash -Path $originalBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
        Write-Log "      Hash: $hash"
        if ($originalBa2Hashes[$hash].FileName -ne $file) {
            throw "Hash mismatch."
        }
        Write-Success "      [VALID]"

        # create working files directory
        New-Item $dir.workingFiles -ItemType "directory" -ErrorAction Stop | Out-Null

        # extract original archive
        Write-Custom "      Extracting original archive..." -NoNewline
        Write-Log "`"$toolArchive2`" `"$originalBa2File`" -extract=`"$($dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolArchive2" "$originalBa2File" -extract="$($dir.workingFiles)" 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log $stdout,"",$stderr,"" -Log "tool" -NoTimestamp
        Write-Log "$("-" * $LineWidth)" -Log "tool"
        Write-Log "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ne 0) {
            throw "Extracting '$originalBa2File' failed."
        }
        $stdout, $stderr = $null

        # correctly extract cubemaps
        Write-Log "`"$toolBsab`" -e -o -f `"Textures\Shared\Cubemaps\*`" `"$originalBa2File`" `"$($dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolBsab" -e -o -f "Textures\Shared\Cubemaps\*" "$originalBa2File" "$($dir.workingFiles)" 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log $stdout,"",$stderr,"" -Log "tool" -NoTimestamp
        Write-Log "$("-" * $LineWidth)" -Log "tool"
        Write-Log "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ne 0) {
            # because bsab doesn't use stderr, copy stdout to stderr, but check anyway just in case
            if ($stderr -eq "") {
                $stderr = $stdout
            }
            throw "Extracting cubemaps from '$originalBa2File' failed."
        }
        $stdout, $stderr = $null
        Write-Success "      [DONE]"

        Write-Custom "    Patched BA2: " -NoNewLine
        Write-Info "    $patchedBa2File"

        # copy patched files
        Write-Custom "      Copying patched files..." -NoNewline
        Write-Log "`"$toolRobocopy`" `"$($dir.patchedFiles)`" `"$($dir.workingFiles)`" /s /xl /np /njh" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolRobocopy" "$($dir.patchedFiles)" "$($dir.workingFiles)" /s /xl /np /njh 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log $stdout,"",$stderr,"" -Log "tool" -NoTimestamp
        Write-Log "$("-" * $LineWidth)" -Log "tool"
        Write-Log "" -Log "tool" -NoTimestamp
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
        Write-Log "`"$toolArchive2`" `"$($dir.workingFiles)`" -format=`"DDS`" -create=`"$patchedBa2File`" -root=`"$(Resolve-Path $dir.workingFiles)`"" -Log "tool"
        $toolTimer.Restart()
        $stdout, $stderr = (& "$toolArchive2" "$($dir.workingFiles)" -format="DDS" -create="$patchedBa2File" -root="$(Resolve-Path $dir.workingFiles)" 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        Write-Log "Elapsed time: $($toolTimer.Elapsed.ToString())" -Log "tool"
        Write-Log $stdout,"",$stderr,"" -Log "tool" -NoTimestamp
        Write-Log "$("-" * $LineWidth)" -Log "tool"
        Write-Log "" -Log "tool" -NoTimestamp
        if ($LASTEXITCODE -ne 0) {
            throw "Creating '$patchedBa2File' failed."
        }
        $stdout, $stderr = $null
        Write-Success "      [DONE]"

        # validate patched archive
        Write-Custom "      Validating patched archive..." -NoNewline
        $hash = $(Get-FileHash $patchedBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
        Write-Log "      Hash: $hash"
        if ($repackFlags.Custom) {
            Write-Warning "      [CUSTOM]"
        }
        elseif ($patchedBa2Hashes[$hash].FileName -ne $file) {
            throw "Unknown hash `"$hash`"."
        }
        Write-Log "      Tags: $($patchedBa2Hashes[$hash].Tags -join ", ")"
        if ($patchedBa2Hashes[$hash].Tags -contains $repackTag) {
            Write-Success "      [VALID]"
        }
        else {
            throw "Archive hash does not have tag `"$repackTag`"."
        }
    }
    catch {
        Write-Error "      [FAIL]"
        if ($null -ne $stderr) {
            Write-Error $stderr -Prefix "ERROR: " -SnippetLength 3
            $stdout, $stderr = $null
        }
        Write-Error $_ -Prefix "ERROR: " -SnippetLength 3
        $processingFailed = $true
    }
    finally {
        if (Test-Path $dir.workingFiles) {
            Remove-Item $dir.workingFiles -Recurse -Force
        }
        Write-Log "  Archive duration: $($archiveTimer.Elapsed.ToString())"
        if ($index -lt $ba2Filenames.Length - 1) {
            Write-Custom "  $("-" * ($LineWidth - 2))" -JustifyRight
        }
    }
}

Write-Log "","Section duration: $($sectionTimer.Elapsed.ToString())"

if (-not $repackFlags.Custom) {
    Write-Custom ""
    Write-Custom "Cleaning up..." -NoNewLine
    try {
        if (Test-Path $dir.patchedFiles) {
            Remove-Item $dir.patchedFiles -Force -Recurse
        }
    }
    catch {
        Write-Error "[ERROR]"
        Write-Error $_ -Prefix "ERROR: " -SnippetLength 3
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
