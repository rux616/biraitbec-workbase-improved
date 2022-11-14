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
# this script extracts a 7zip, rar, or zip archive, checks that the file(s) extracted properly, then
# hashes them, and finally displays a list of them
# --------------------------------------------------------------------------------------------------


[CmdletBinding(DefaultParameterSetName = "Path")]
param (
    [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "Path", Position = 0)]
    [PSObject] $Path,

    [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "LiteralPath", Position = 0)]
    [PSObject] $LiteralPath
)

begin {
    $ErrorActionPreference = 'Stop'

    $dir = @{}
    $dir.scriptDirectory = Split-Path $MyInvocation.MyCommand.Path -Parent
    $dir.logs = "$($dir.scriptDirectory)\..\..\Logs"
    $dir.temp = "$($dir.scriptDirectory)\..\..\Temp"
    $dir.tools = "$($dir.scriptDirectory)\..\..\Tools"
    $dir

    # 7-Zip 64-bit v22.01 (2022-07-15) by Igor Pavlov
    # https://www.7-zip.org/
    $env:PATH = (Resolve-Path -LiteralPath "$($dir.tools)\7-zip").Path + ";" + $env:PATH

    # xxhsum v0.8.1 by cyan4973
    # https://cyan4973.github.io/xxHash/
    $env:PATH = (Resolve-Path -LiteralPath "$($dir.tools)\xxHash").Path + ";" + $env:PATH

    Write-Host "Loading functions..."
    . "$($dir.tools)\lib\Functions.ps1"
    . "$($dir.tools)\lib\Get-KnownFolderPath.ps1"
    if ((Get-FileHash -LiteralPath "$($dir.tools)\lib\Crc32.cs" -Algorithm SHA256 -ErrorAction SilentlyContinue).Hash -ne "53C3DE02CFAD47B2C9D02B2EDEDA0CCD25E38652CD2A1D7AA348F038026D5EAF") {
        Write-CustomError "The contents of `"$($dir.tools)\lib\Crc32.cs`" do not match what's expected. Try re-extracting the WorkBase Improved files again. If this error persists, please contact the author." -Prefix "ERROR: " -NoJustifyRight
    }
    else {
        Add-Type -TypeDefinition (Get-Content -LiteralPath "$($dir.tools)\lib\Crc32.cs" -Raw) -Language CSharp
    }
}

process {
    # do a bit of pre-processing
    $files = if ($Path) {
        $Path
    }
    elseif ($LiteralPath) {
        $LiteralPath
    }

    # process any directories and wildcards and build a list of actual files
    $allFiles = foreach ($file in $files) {
        if ($file -is [System.IO.FileSystemInfo]) {
            $file = $file.FullName
        }
        if ($Path) {
            if (Test-Path $file -PathType Container) {
                $file += "\*"
            }
            Resolve-Path -Path $file | Where-Object { Test-Path $_ -PathType Leaf }
        }
        elseif ($LiteralPath -and -not (Test-Path $file -PathType Container)) {
            Resolve-Path -LiteralPath $file
        }
    }
    # sort and remove duplicates
    $allFiles = $allFiles | Sort-Object -Unique
    # files must end in .rar, .zip, or .7z
    $allFiles = $allFiles | Where-Object ({ (Split-Path $_ -Leaf).Split(".")[-1] -in @("rar", "zip", "7z") })
    $allFiles | Format-Table

    foreach ($modFile in $allFiles) {
        $archiveFiles = New-Object System.Collections.Generic.List[Hashtable]
        # get info on the contents of the archive
        $archiveTechnicalInformation = 7z.exe l -slt "$modFile"
        foreach ($line in $archiveTechnicalInformation |
                Select-Object -Skip ($archiveTechnicalInformation | Select-String "----------").LineNumber |
                Where-Object { $_ -match "^Path.*" -or $_ -match "^Size.*" -or $_ -match "^CRC.*" }) {
            $splitLine = $line -split " = "
            switch ($splitLine | Select-Object -First 1) {
                "Path" {
                    $currentRecord = @{}
                    $currentRecord.$_ = ($splitLine | Select-Object -Skip 1) -join " = "
                }
                "Size" {
                    $currentRecord.$_ = [long] ($splitLine | Select-Object -Skip 1)
                }
                "CRC" {
                    $hash = $splitLine | Select-Object -Skip 1
                    # if an item has a hash, update the record and add it to the list
                    if ($hash) {
                        $currentRecord.$_ = $hash
                        $archiveFiles.Add($currentRecord)
                    }
                }
            }
        }

        # extract the archive
        $stdout, $stderr = (7z.exe x -y -bb2 -bd -o"." "$modFile" 2>&1).Where({ $_ -is [string] -and $_ -ne "" }, "Split")

        # hash and compare the files
        foreach ($archiveFile in $archiveFiles) {
            $modObject = [PSCustomObject]@{
                Path = $archiveFile.Path
            }
            Add-Member -InputObject $modObject -MemberType NoteProperty -Name "Size" -Value (Get-ChildItem $archiveFile.Path).Length
            $hash = (Get-FileHash -Algorithm CRC32 -Path $archiveFile.Path).Hash
            Add-Member -InputObject $modObject -MemberType NoteProperty -Name "CRC" -Value $hash
            $hash = (Get-FileHash -Algorithm XXH128 -Path $archiveFile.Path).Hash
            Add-Member -InputObject $modObject -MemberType NoteProperty -Name "XXH128" -Value $hash

            if ($archiveFile.Size -ne $modObject.Size -or $archiveFile.CRC -ne $modObject.CRC) {
                "error"
            }
            else {
                $modObject
            }
        }

        # remove the files
        foreach ($archiveFile in $archiveFiles) {
            Remove-Item $archiveFile.Path
        }
    }
}
