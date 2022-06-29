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


Clear-Host

$scriptTimer = [System.Diagnostics.Stopwatch]::StartNew()
$keySetTimer = New-Object System.Diagnostics.Stopwatch

Set-Variable "RunStartTime" -Value "$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ"))" -Option Constant

$dir = @{}
$dir.logs = ".\Logs"
$dir.patchedBa2 = ".\PatchedBa2"
$dir.repack7z = ".\Repack7z"
$dir.tools = ".\Tools"
$env:PATH = (Resolve-Path "$($dir.tools)\xxHash").Path + ";" + $env:PATH

Add-Type -TypeDefinition (Get-Content "$($dir.tools)\lib\Crc32.cs" -Raw) -Language CSharp
. "$($dir.tools)\lib\Functions.ps1"

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

$allKeyCombinations = New-Object System.Collections.Generic.List[string[]]
$allKeyCombinations.Add(@("Unchanged"))
$allKeyCombinations.Add(@("Performance"))
$allKeyCombinations.Add(@("Main"))
$allKeyCombinations.Add(@("Quality"))
$allKeyCombinations.Add(@("Restyle"))
$allKeyCombinations.Add(@("Performance", "Main"))
$allKeyCombinations.Add(@("Performance", "Quality"))
$allKeyCombinations.Add(@("Performance", "Vault Fix"))
$allKeyCombinations.Add(@("Performance", "Restyle"))
$allKeyCombinations.Add(@("Main", "Quality"))
$allKeyCombinations.Add(@("Main", "Vault Fix"))
$allKeyCombinations.Add(@("Main", "Restyle"))
$allKeyCombinations.Add(@("Quality", "Vault Fix"))
$allKeyCombinations.Add(@("Quality", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Main", "Quality"))
$allKeyCombinations.Add(@("Performance", "Main", "Vault Fix"))
$allKeyCombinations.Add(@("Performance", "Main", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Quality", "Vault Fix"))
$allKeyCombinations.Add(@("Performance", "Quality", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Vault Fix", "Restyle"))
$allKeyCombinations.Add(@("Main", "Quality", "Vault Fix"))
$allKeyCombinations.Add(@("Main", "Quality", "Restyle"))
$allKeyCombinations.Add(@("Main", "Vault Fix", "Restyle"))
$allKeyCombinations.Add(@("Quality", "Vault Fix", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Main", "Quality", "Vault Fix"))
$allKeyCombinations.Add(@("Performance", "Main", "Quality", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Main", "Vault Fix", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Quality", "Vault Fix", "Restyle"))
$allKeyCombinations.Add(@("Main", "Quality", "Vault Fix", "Restyle"))
$allKeyCombinations.Add(@("Performance", "Main", "Quality", "Vault Fix", "Restyle"))

function Remove-TempFolders {
    Get-ChildItem . -Directory -Filter PatchedBa2 | Remove-Item -Force -Recurse
    Get-ChildItem . -Directory -Filter PatchedFiles* | Remove-Item -Force -Recurse
    Get-ChildItem . -Directory -Filter Temp | Remove-Item -Force -Recurse
    Get-ChildItem . -Directory -Filter WorkingFiles | Remove-Item -Force -Recurse
}

# initial reset
"*************", "initial reset", "*************"
foreach ($key in  $repackFiles.Keys) {
    foreach ($file in $repackFiles.$key) {
        if (Test-Path -LiteralPath "$($dir.repack7z)\$file.disabled") {
            Rename-Item -LiteralPath "$($dir.repack7z)\$file.disabled" -NewName "$file"
        }
    }
}
Remove-TempFolders
Get-ChildItem $dir.logs -File -Filter *.log | Remove-Item -Force

foreach ($keySet in $allKeyCombinations) {
    $keySetTimer.Restart()
    "key set $($allKeyCombinations.IndexOf($keySet) + 1) of $($allKeyCombinations.Count): [$($keySet -join ", ")]"

    # prep
    "  - prep"
    $inverseKeySet = $repackFiles.Keys | Where-Object { $_ -notin $keySet }
    foreach ($key in $inverseKeySet) {
        foreach ($file in $repackFiles.$key) {
            Rename-Item -LiteralPath "$($dir.repack7z)\$file" -NewName "$file.disabled"
        }
    }

    # execute
    "  - execute"
    Start-Process powershell { .\Installer.ps1 -SkipRepackHashing -SkipExistingPatchedHashing -SkipChoosingPatchedBa2Dir -NoPauseOnExit -AllowUnchanged } -Wait

    # log
    "  - log"
    "# $(($keySet -join " + ").ToLower())" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append
    "`$tag = @(`"$($keySet -join "``", ``"")`") -join `$TagJoiner" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append
    foreach ($file in $ba2Files.GetEnumerator()) {
        $fileName = "$($dir.patchedBa2)\$($file.Value)"
        if (-not (Test-Path -LiteralPath $fileName)) {
            Write-Warning "File does not exist: $fileName"
            continue
        }
        $hash = (Get-FileHash -LiteralPath $fileName -Algorithm XXH128).Hash
        $size = (Get-ChildItem -LiteralPath $fileName).Length
        "Add-Hash -VariableName `$var -Hash `"$hash`" -Tag `$tag -FileName `$ba2Files.$($file.Key) -FileSize $size" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append
    }
    "" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append

    # reset
    "  - reset"
    foreach ($key in $inverseKeySet) {
        foreach ($file in $repackFiles.$key) {
            Rename-Item -LiteralPath "$($dir.repack7z)\$file.disabled" -NewName "$file"
        }
    }
    Remove-TempFolders

    "  time taken: $($keySetTimer.Elapsed)"
}

"total time taken: $($scriptTimer.Elapsed)"
