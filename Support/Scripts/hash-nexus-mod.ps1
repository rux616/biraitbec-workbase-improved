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


# for future reference use the following URL format to download archived files:
# https://www.nexusmods.com/Core/Libs/Common/Widgets/ModRequirementsPopUp?id=<fileID>&game_id=<gameID>
# "<fileID>":
#   - can be found via page inspection
# "<gameID>":
#   - Fallout 4 = 1151
#   - Skyrim SE = 1704
#
# alternately this form also seems to work:
# https://www.nexusmods.com/fallout4/mods/<modID>?tab=files&file_id=<fileID>
# "<modID>":
#   - in the URL
# "<fileID>":
#   - can be found via page inspection

[CmdletBinding(DefaultParameterSetName = "Path")]
param (
    [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "Path", Position = 0)]
    [PSObject] $Path,

    [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "LiteralPath", Position = 0)]
    [PSObject] $LiteralPath,

    [Parameter(Mandatory)]
    [string] $NexusAPIKey,

    [string] $GameDomain = "fallout4"
)

begin {
    $ErrorActionPreference = 'Stop'

    $dir = @{}
    $dir.scriptDirectory = Split-Path $MyInvocation.MyCommand.Path -Parent
    $dir.logs = "$($dir.scriptDirectory)\..\..\Logs"
    $dir.temp = "$($dir.scriptDirectory)\..\..\Temp"
    $dir.tools = "$($dir.scriptDirectory)\..\..\Tools"
    $dir.lib = "$($dir.tools)\lib"
    $dir

    $apiBase = "https://api.nexusmods.com/v1"
    $apiValidate = "${apiBase}/users/validate.json"
    $apiModsBase = "${apiBase}/games/$($GameDomain.ToLower())/mods"

    # validate API key
    Invoke-RestMethod -Uri $apiValidate -Headers @{ apikey = $NexusAPIKey } -ErrorVariable "ValidateRestError" | Out-Null
    if ($ValidateRestError) { exit 1 }

    # xxhsum by cyan4973
    # https://cyan4973.github.io/xxHash/
    $env:PATH = (Resolve-Path -LiteralPath "$($dir.tools)\xxHash").Path + ";" + $env:PATH

    # source functions
    . "$($dir.lib)\Functions.ps1"
}

process {
    # do a bit of pre-processing
    $files = if ($Path) {
        $Path
    }
    elseif ($LiteralPath) {
        $LiteralPath
    }

    # process any directories and wildcards and build a list of actual files to hash
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
    # files must end in .rar, .zip, .7z, .exe, or .omod
    $allFiles = $allFiles | Where-Object ({ (Split-Path $_ -Leaf).Split(".")[-1] -in @("rar", "zip", "7z", "exe", "omod") })
    $allFiles | Format-Table

    foreach ($file in $allFiles) {
        $modObject = [PSCustomObject]@{
            Path = $file
        }
        $hash = (Get-FileHash -Algorithm MD5 -Path $file).Hash
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "MD5" -Value $hash.ToLower()
        $hash = (Get-FileHash -Algorithm XXH128 -Path $file).Hash
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "XXH128" -Value $hash.ToLower()
        try {
            $response = Invoke-RestMethod -Uri "${apiModsBase}/md5_search/$($modObject.MD5).json" -Headers @{ apikey = $NexusAPIKey }
        }
        catch { $response = $null }
        if ($null -eq $response) {
            $modName = $null
            $modID = $null
            $fileName = $null
            $fileID = $null
            $fileVersion = $null
            $fileSize = (Get-ChildItem $file).Length
        }
        else {
            $modName = $response.mod.name
            $modID = $response.mod.mod_id
            $fileName = $response.file_details.file_name
            $fileID = $response.file_details.file_id
            $fileVersion = $response.file_details.version
            $fileSize = $response.file_details.size_in_bytes
        }
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "ModName" -Value $modName
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "ModID" -Value $modID
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "FileName" -Value $fileName
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "FileID" -Value $fileID
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "FileVersion" -Value $fileVersion
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "FileSize" -Value $fileSize
        $modObject
    }
}
