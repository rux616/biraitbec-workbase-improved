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


# --------------------------------------------------------------------------------------------------
# this script generates hashes of the contents of the BA2 archives
# these hashes are intended for use with the extended validation mode of WBI
# --------------------------------------------------------------------------------------------------


Clear-Host

$scriptTimer = [System.Diagnostics.Stopwatch]::StartNew()
$keySetTimer = New-Object System.Diagnostics.Stopwatch

Set-Variable "RunStartTime" -Value "$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ"))" -Option Constant

$dir = @{}
$dir.logs = ".\Logs"
$dir.originalBa2 = ".\OriginalBa2"
$dir.tools = ".\Tools"
$dir.workingFiles = ".\WorkingFiles"
$originalPath = $env:Path
$env:Path = (Resolve-Path "$($dir.tools)\BSArch").Path + ";" + $env:PATH
$env:Path = (Resolve-Path "$($dir.tools)\xxHash").Path + ";" + $env:PATH

Add-Type -TypeDefinition (Get-Content "$($dir.tools)\lib\Crc32.cs" -Raw) -Language CSharp
. "$($dir.tools)\lib\Functions.ps1"

$ba2Files = @(
    "DLCCoast - Textures.ba2"
    "DLCNukaWorld - Textures.ba2"
    "DLCRobot - Textures.ba2"
    "DLCworkshop01 - Textures.ba2"
    "DLCworkshop02 - Textures.ba2"
    "DLCworkshop03 - Textures.ba2"
    "Fallout4 - Textures1.ba2"
    "Fallout4 - Textures2.ba2"
    "Fallout4 - Textures3.ba2"
    "Fallout4 - Textures4.ba2"
    "Fallout4 - Textures5.ba2"
    "Fallout4 - Textures6.ba2"
    "Fallout4 - Textures7.ba2"
    "Fallout4 - Textures8.ba2"
    "Fallout4 - Textures9.ba2"
)

$dir.fallout4Data = Get-Fallout4DataFolder -DiscoveryMethod Steam

function Remove-TempFolders {
    Get-ChildItem . -Directory -Filter WorkingFiles | Remove-Item -Force -Recurse
}

# initial reset
"*************", "initial reset", "*************"
Remove-TempFolders
Get-ChildItem $dir.logs -File -Filter *.log | Remove-Item -Force
Get-ChildItem $dir.logs -File -Filter *.ps1 | Remove-Item -Force

foreach ($ba2File in $ba2Files) {
    $keySetTimer.Restart()
    New-Item $dir.workingFiles -ItemType "directory" -ErrorAction Stop | Out-Null
    "ba2 file $($ba2Files.IndexOf($ba2file) + 1) of $($ba2Files.Count) ($ba2File)"
    $logFile = "$($dir.logs)\EVM Hashes ($ba2File).ps1"
    $bsarchLogFile = "$($dir.logs)\bsarch ($ba2File).log"

    # header
    @(
        "# Copyright 2024 Dan Cassidy"
        ""
        "# This program is free software: you can redistribute it and/or modify"
        "# it under the terms of the GNU General Public License as published by"
        "# the Free Software Foundation, either version 3 of the License, or"
        "# (at your option) any later version."
        "#"
        "# This program is distributed in the hope that it will be useful,"
        "# but WITHOUT ANY WARRANTY# without even the implied warranty of"
        "# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
        "# GNU General Public License for more details."
        "#"
        "# You should have received a copy of the GNU General Public License"
        "# along with this program.  If not, see <https://www.gnu.org/licenses/>."
        ""
        "# SPDX-License-Identifier: GPL-3.0-or-later"
        ""
        ""
    ) | Out-File -LiteralPath $logFile

    # extract
    "  - extract"
    $stdout, $stderr = (bsarch.exe unpack "$($dir.fallout4Data)\$ba2File" "$($dir.workingFiles)" -mt 2>&1).Where({ $_ -is [string] -and $_ -ne "" }, "Split")
    "STDOUT" | Out-File -LiteralPath $bsarchLogFile -Append
    $stdout | Out-File -LiteralPath $bsarchLogFile -Append
    "STDERR" | Out-File -LiteralPath $bsarchLogFile -Append
    $stderr | Out-File -LiteralPath $bsarchLogFile -Append

    # hash
    "  - hash"
    "# $ba2File" | Out-File -LiteralPath $logFile -Append
    "`$originalBa2FileHashes = @{}" | Out-File -LiteralPath $logFile -Append
    "`$var = `"originalBa2FileHashes`"; `$keyType = `"FileName`"; `$tag = `"Vanilla v1.10.980.0-14160910`"" | Out-File -LiteralPath $logFile -Append
    Push-Location $dir.workingFiles
    $relativeFileList = (Get-ChildItem -File -Recurse | Resolve-Path -Relative).Substring(2)
    Pop-Location
    $relativeFileList | ForEach-Object {
        $fileName = "$($dir.workingFiles)\$_"
        $hash = (Get-FileHash -LiteralPath $fileName -Algorithm XXH128).Hash
        $size = (Get-ChildItem -LiteralPath $fileName).Length
        "Add-Hash -VariableName `$var -KeyType `$keyType -Hash `"$hash`" -Tag `$tag -FileName `"$_`" -FileSize $size" | Out-File -LiteralPath $logFile -Append
    }
    "Remove-Variable `"var`", `"keyType`", `"tag`"" | Out-File -LiteralPath $logFile -Append

    # reset
    "  - reset"
    Remove-TempFolders

    "  time taken: $($keySetTimer.Elapsed)"
}

"total time taken: $($scriptTimer.Elapsed)"

$env:Path = $originalPath
