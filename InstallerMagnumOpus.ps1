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

function Write-Error([string[]]$Message, [string]$Prefix = $null, [int]$SnippetLength = 3){
    [Console]::ForegroundColor = 'red'
    $doSnip = $Message.Length -gt $SnippetLength * 2 -and $SnippetLength -gt 0
    for ($index = 0; $index -lt $Message.Length; $index++) {
        if ($doSnip -and $index -eq $SnippetLength) {
            [Console]::Error.WriteLine($Prefix + "--- snip ---")
            $index = $Message.Length - $SnippetLength
        }
        [Console]::Error.WriteLine($Prefix + $Message[$index])
    }
    [Console]::ResetColor()
}

function Write-Warning([string[]]$Message, [string]$Prefix = $null) {
    [Console]::ForegroundColor = 'yellow'
    for ($index = 0; $index -lt $Message.Length; $index++) { [Console]::Out.WriteLine($Prefix + $Message[$index]) }
    [Console]::ResetColor()
}

function Write-Success([string[]]$Message, [string]$Prefix = $null) {
    [Console]::ForegroundColor = 'green'
    for ($index = 0; $index -lt $Message.Length; $index++) { [Console]::Out.WriteLine($Prefix + $Message[$index]) }
    [Console]::ResetColor()
}

function Exit-Script([int]$ExitCode = 0, [bool]$PauseBeforeExit = $true) {
    if ($PauseBeforeExit) {
        Write-Host -NoNewline "`nPress any key to continue . . . "
        [void][System.Console]::ReadKey($true)
        Write-Output "" ""
    }
    exit $ExitCode
}

Clear-Host
Write-Host ""

# check location to ensure it's not located in a problematic directory
$problemDirs = @(
    [IO.Path]::GetFullPath(${env:ProgramFiles})
    [IO.Path]::GetFullPath(${env:ProgramFiles(x86)})
    [IO.Path]::GetFullPath(${env:windir})
    [IO.Path]::GetFullPath(${env:USERPROFILE})
    [IO.Path]::GetFullPath(${env:PUBLIC})
)
$currentDirectory = [IO.Path]::GetFullPath((Get-Location))
foreach ($problemDir in $problemDirs) {
    if ($currentDirectory.StartsWith($problemDir, [System.StringComparison]::OrdinalIgnoreCase)) {
        # throw "bad dir"
        Write-Error @(
            "Problematic location detected. Please ensure this folder is OUTSIDE of the following folders:"
            $problemDirs
        ) -Prefix "ERROR: " -SnippetLength 0
        Exit-Script 1
    }
}

# check for visual c++ redist files
# need only C:\Windows\System32\msvcp110.dll and C:\Windows\System32\msvcr110.dll
# from vc redist 2012 update 4:
#   msvcp110.dll version = 11.00.51106.1
#   msvcr110.dll version = 11.00.51106.1
$vcRedistFile = @{}
$vcRedistFile.msvcp110dll = "${env:windir}\System32\msvcp110.dll"
$vcRedistFile.msvcr110dll = "${env:windir}\System32\msvcr110.dll"
$vcrMinVersion = New-Object -TypeName "System.Version" -ArgumentList @(11, 00, 51106, 1)
if (
    (Test-Path -Path $vcRedistFile.msvcp110dll,$vcRedistFile.msvcr110dll) -eq $false `
    -or (Get-Command $vcRedistFile.msvcr110dll).Version -lt $vcrMinVersion
) {
        Write-Error @(
            "Need 64-bit Visual C++ Redistributable for Visual Studio 2012 Update 4! Please download it from this link:"
            "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
         ) -Prefix "ERROR: "
        Exit-Script 1
}

$dir = @{}
$dir.originalBa2 = ".\OriginalBa2"
$dir.patchedBa2 = ".\PatchedBa2"
$dir.patchedFiles = ".\PatchedFiles"
$dir.workingFiles = ".\WorkingFiles"

$originalBa2Hashes = @{}
# game version 1.10.163.0 (steam build ID 4460038)
$originalBa2Hashes["D800B065414007F5060879D199D1961C8F36489841BB61B34E8C560E99B1C6B4"] = "$($dir.originalBa2)\DLCCoast - Textures.ba2"
$originalBa2Hashes["3FE2C787F0D4D88B043EC5580982A5DD728BD7F031633C72D27D89B0D9F1351E"] = "$($dir.originalBa2)\DLCNukaWorld - Textures.ba2"
$originalBa2Hashes["AE3801E98EA5AA8C8925A0DC9DC17227F46855F77AA05DE5B8EB2156667E1FE6"] = "$($dir.originalBa2)\DLCRobot - Textures.ba2"
$originalBa2Hashes["083A617C29C7817009B79819661869AB9BD2ADF683897F0BF7EDB62D65770ECD"] = "$($dir.originalBa2)\DLCworkshop01 - Textures.ba2"
$originalBa2Hashes["F960E81C8EB081F694E4DE4B293463D255A8052AF12110D2F6D90801E1ACBDEF"] = "$($dir.originalBa2)\DLCworkshop02 - Textures.ba2"
$originalBa2Hashes["525DF4C7368BA99EDD65A6607530AB8C5E92EBB8FE96DDF6CAB33C18FC2762C0"] = "$($dir.originalBa2)\DLCworkshop03 - Textures.ba2"
$originalBa2Hashes["0EF01DCC41167AEAA7C259C15FD3EE7792F36AB151A4907F220206A7A354C593"] = "$($dir.originalBa2)\Fallout4 - Textures1.ba2"
$originalBa2Hashes["CC76EB25C1B2882B31B941E0E4C7E5A536028A0641FD7B8072DCCC3C3D5007E3"] = "$($dir.originalBa2)\Fallout4 - Textures2.ba2"
$originalBa2Hashes["0A4B65B8779842DFDA4997FFDC8F05CE7C557871D413DB24FA356445ECE3BD11"] = "$($dir.originalBa2)\Fallout4 - Textures3.ba2"
$originalBa2Hashes["066C50791A7FAC5C64FE109BDF4986EF82D15E6378D658812BEC19751FDA8C45"] = "$($dir.originalBa2)\Fallout4 - Textures4.ba2"
$originalBa2Hashes["35F8F2EE70BC3D4BF387C94460EC89F9B99FAC2C04FDDC9DD42645A7EB60A1BC"] = "$($dir.originalBa2)\Fallout4 - Textures5.ba2"
$originalBa2Hashes["3407A0184BC871567DD1AA5B9E120A5B93AD035BDA961D7728441CC104E46CF2"] = "$($dir.originalBa2)\Fallout4 - Textures6.ba2"
$originalBa2Hashes["06299876A2FDBA48C2FC707C34314047FE423163A84CFE1E70986177E6C053B4"] = "$($dir.originalBa2)\Fallout4 - Textures7.ba2"
$originalBa2Hashes["BBA344ED3DA7A4ED9EC8CA8ABAD77CDFBF9756FC1C2B17F4F6B221368EF37374"] = "$($dir.originalBa2)\Fallout4 - Textures8.ba2"
$originalBa2Hashes["1F4DD1E0BC003195C8B4C39819B4657194E3196CDFA758DE57BF4D6A0B8E8A4D"] = "$($dir.originalBa2)\Fallout4 - Textures9.ba2"

$patchedBa2Hashes = @{}
# main repack only
$patchedBa2Hashes["2AECCB7D54F2755F7E0B3B00D94D2CDDB655A1A4904417665337632C6A8FDD2D"] = "$($dir.patchedBa2)\DLCCoast - Textures.ba2"
$patchedBa2Hashes["2D173730BBEC6D4DEB8F0076CDA3F9DAC6FCCB79284220D86119AD8F69A7CCCC"] = "$($dir.patchedBa2)\DLCNukaWorld - Textures.ba2"
$patchedBa2Hashes["EC9B04A5A7612A8BC6BDF5FE02058DB35858725ECC6723626163A27C3B63D933"] = "$($dir.patchedBa2)\DLCRobot - Textures.ba2"
$patchedBa2Hashes["897A7977EB543EC9619A7017D9221CCC24A990E25AF093BBFD5CAAA7AD922EA2"] = "$($dir.patchedBa2)\DLCworkshop01 - Textures.ba2"
$patchedBa2Hashes["58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1"] = "$($dir.patchedBa2)\DLCworkshop02 - Textures.ba2"
$patchedBa2Hashes["600CBC9E4B389AE34EE5C9CE895D507CAB6A3FDE2E3F1944F2C02ADBEDB4210B"] = "$($dir.patchedBa2)\DLCworkshop03 - Textures.ba2"
$patchedBa2Hashes["28E2FCB30A06349D8D80B089B3B993E77AF6AA200B825B5FDAA4FC3733E83C05"] = "$($dir.patchedBa2)\Fallout4 - Textures1.ba2"
$patchedBa2Hashes["98A5BBB9D998723842A74940746725DD6D1EE453ADF721425760647E41950A43"] = "$($dir.patchedBa2)\Fallout4 - Textures2.ba2"
$patchedBa2Hashes["A4EDE389AB6D66482B1E743D35ACFD829356FC0A819155B57A72546CD3AB057B"] = "$($dir.patchedBa2)\Fallout4 - Textures3.ba2"
$patchedBa2Hashes["09FC556595E0044DBFB9F214DE0E575408995FD3BD20E08BFF6AB1CEBE8362AF"] = "$($dir.patchedBa2)\Fallout4 - Textures4.ba2"
$patchedBa2Hashes["F3B2E5470968D1BD54ED4A4723F311B85EDB5E4508DB1B2E84135118D01BFA81"] = "$($dir.patchedBa2)\Fallout4 - Textures5.ba2"
$patchedBa2Hashes["D6A61A819E7607FC06F2270B287603D1D2D88A896A3EA4E3F3AC0D4C26BAE97C"] = "$($dir.patchedBa2)\Fallout4 - Textures6.ba2"
$patchedBa2Hashes["03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765"] = "$($dir.patchedBa2)\Fallout4 - Textures7.ba2"
$patchedBa2Hashes["1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E"] = "$($dir.patchedBa2)\Fallout4 - Textures8.ba2"
$patchedBa2Hashes["C749A686FE03A1EFABC6918978E7A27FAF98E91C62EA89D126A9FDAA2A2276AA"] = "$($dir.patchedBa2)\Fallout4 - Textures9.ba2"

$ba2Files = @(foreach ($hash in $originalBa2Hashes.GetEnumerator()) { $hash.Value.Split('\')[-1] }) | Sort-Object

Set-Variable -Name "FileHashAlgorithm" -Value "SHA256" -Option Constant
Set-Variable -Name "Indent" -Value "       " -Option Constant

try {
    if (!(Test-Path -Path $dir.patchedBa2)) {
        New-Item $dir.patchedBa2 -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    if (Test-Path -Path $dir.workingFiles) {
        Write-Warning "$($dir.workingFiles.Split('\')[-1]) shouldn't exist but does; removing...`n" -Prefix "WARNING: "
        Remove-Item -Path $dir.workingFiles -Recurse -Force -ErrorAction Stop
    }
}
catch {
    Write-Error $_ -Prefix "ERROR: "
    Exit-Script 1
}
Write-Host "`nProcessing archives...`n"
for ($index = 0; $index -lt $ba2Files.Count; $index++) {
    try {
        $stdout, $stderr = $null
        $ba2File = $ba2Files[$index]
        Write-Host "Archive $($index + 1) of $($ba2Files.Count) ($ba2File):"
        $originalBa2File = "$($dir.originalBa2)\$ba2File"
        $patchedBa2File = "$($dir.patchedBa2)\$ba2File"

        # validate existing patched archive
        if (Test-Path -Path $patchedBa2File) {
            Write-Host -NoNewLine "${Indent}Existing patched archive found; validating..."
            $hash = (Get-FileHash -Path $patchedBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
            if ($patchedBa2Hashes[$hash] -ne $patchedBa2File) {
                Write-Warning "`r[FAIL]"
            }
            else {
                Write-Success "`r[PASS]"
                continue
            }
        }

        # validate original archive
        Write-Host -NoNewline "${Indent}Validating original archive..."
        if ($originalBa2Hashes[$(Get-FileHash -Path $originalBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash] -ne $originalBa2File) {
            throw "Hash mismatch."
        }
        Write-Success "`r[PASS]"

        # create working files directory
        New-Item -ItemType "directory" -Path $dir.workingFiles -ErrorAction Stop | Out-Null

        # extract archive
        Write-Host -NoNewline "${Indent}Extracting original archive..."
        $stdout, $stderr = (.\Archive2.exe "$($dir.originalBa2)\$ba2File" -extract="$($dir.workingFiles)" 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        if ($LASTEXITCODE -ne 0) {
            throw "Extracting '$originalBa2File' failed."
        }
        $stdout, $stderr = $null
        Write-Success "`r[DONE]"

        # copy patched files
        Write-Host -NoNewline "${Indent}Copying patched files..."
        $stdout, $stderr = (robocopy "$($dir.patchedFiles)" "$($dir.workingFiles)" /s /xl /njh 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        if ($LASTEXITCODE -ge 8) {
            # because robocopy doesn't use stderr (WHY?!), copy stdout to stderr, but check anyway just in case
            if ($stderr -eq "") {
                $stderr = $stdout
            }
            throw "Copying patched files failed."
        }
        $stdout, $stderr = $null
        Write-Success "`r[DONE]"

        # create patched archive
        Write-Host -NoNewline "${Indent}Creating patched archive..."
        $stdout, $stderr = (.\Archive2.exe "$($dir.workingFiles)" -format="DDS" -create="$patchedBa2File" -root="$(Resolve-Path $dir.workingFiles)" 2>&1).`
            Where({$_ -is [string] -and $_ -ne ""}, 'Split')
        if ($LASTEXITCODE -ne 0) {
            throw "Creating '$patchedBa2File' failed."
        }
        $stdout, $stderr = $null
        Write-Success "`r[DONE]"

        # validate patched archive
        Write-Host -NoNewline "${Indent}Validating patched archive..."
        $hash = $(Get-FileHash -Path $patchedBa2File -Algorithm $FileHashAlgorithm -ErrorAction Stop).Hash
        if ($patchedBa2Hashes[$hash] -ne $patchedBa2File) {
            throw "Unknown hash '$hash'."
        }
        Write-Success "`r[PASS]"
    }
    catch {
        Write-Error "`r[FAIL]"
        if ($null -ne $stderr) {
            Write-Error $stderr -Prefix "ERROR: "
            $stdout, $stderr = $null
        }
        Write-Error $_ -Prefix "ERROR: "
        $processingFailed = $true
    }
    finally {
        if (Test-Path -Path $dir.workingFiles) {
            Remove-Item -Path $dir.workingFiles -Recurse -Force
        }
        if ($index -lt $ba2Files.Length - 1) {
            Write-Host $("-" * 30)
        }
    }
}

if ($processingFailed) {
    Write-Error "`nProcessing archives failed."
    Exit-Script 1
}

Write-Success "`nProcessing archives succeeded."
Exit-Script
