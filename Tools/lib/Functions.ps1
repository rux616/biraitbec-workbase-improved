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


# functions
# ---------

Set-Variable "FunctionsVersion" -Value $(New-Object "System.Version" -ArgumentList @(1, 28, 1))

$writeCustomPrevNoNewLineLength = 0

function Add-Hash {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [string] $VariableName,
        [Parameter(Mandatory)] [string] $Hash,
        [Parameter(Mandatory)] [string] $FileName,
        [Parameter(Mandatory)] [string] $Tag,
        [Parameter()] [ValidateSet('FileName', 'Hash')] [string] $KeyType = 'Hash',
        [Parameter()] [long] $FileSize = -1,
        [Parameter()] [string] $Action = $null
    )

    $var = (Get-Variable -Name $VariableName -ErrorAction Stop).Value
    $key = switch ($KeyType) {
        'FileName' { $FileName }
        'Hash' { $Hash }
    }
    if ($var.ContainsKey($key)) {
        if ($var[$key].FileName -ne $FileName) {
            throw "Assigning file `"$FileName`" to key `"$key`" failed because that key is already in use by file `"$($var[$key].FileName)`"."
        }
        if ($FileSize -ne -1) {
            if ($var[$key].FileSize -eq -1) {
                $var[$key].FileSize = $FileSize
            }
            elseif ($var[$key].FileSize -ne $FileSize) {
                throw "Assigning size `"$FileSize`" to key `"$key`" failed because that key already has size `"$($var[$key].FileSize)`"."
            }
        }
        if ($var[$key].Hash -ne $Hash) {
            throw "Assigning hash `"$Hash`" to key `"$key`" failed because that key is already in use by hash `"$($var[$key].Hash)`"."
        }
        $var[$key].Tags = $var[$key].Tags + @($Tag) | Sort-Object -Unique
        $var[$key].Action = $var[$key].Actions + @($Action) | Sort-Object -Unique
    }
    else {
        $var[$key] = @{
            FileName = $FileName
            FileSize = $FileSize
            Hash     = $Hash
            Tags     = @($Tag)
            Actions  = @($Action)
        }
    }
}

function Exit-Script {
    [CmdletBinding()]
    param (
        [int] $ExitCode = 0,
        [switch] $Immediate = $NoPauseOnExit,
        [switch] $BypassLog,
        [System.Diagnostics.Stopwatch] $ScriptTimer = $scriptTimer,
        [System.ConsoleColor] $OriginalBackgroundColor = $OriginalBackgroundColor
    )

    $ScriptTimer.Stop()

    $argList = @{
        Message   = ""
        BypassLog = $BypassLog
    }
    Write-Custom @argList

    $argList = @{
        Message   = "Elapsed time: "
        BypassLog = $BypassLog
        NoNewLine = $true
    }
    Write-Custom @argList

    $argList = @{
        Message        = "$(Write-PrettyTimeSpan $ScriptTimer.Elapsed)"
        BypassLog      = $BypassLog
        NoJustifyRight = $true
    }
    Write-CustomInfo @argList

    if ($multiFactorErrorFlag) {
        Write-CustomError @(
            ""
            "One or more errors were encountered that could be caused by any one of a variety of factors, including (but not limited to) antivirus interference, failing/unstable hardware, or a lack of free space available on the drive."
            ""
            "Please try the script again to confirm any issues are repeatable, then report any recurring errors on the Nexus Mods mod page (https://www.nexusmods.com/fallout4/mods/57782) or the GitHub project (https://github.com/rux616/biraitbec-workbase-improved). When you do so, please also upload the `"install.current.log`" file in the `"$(($dir.Logs).Split("\")[-1])`" folder to a website like TextUploader.com (https://textuploader.com/) or Pastebin (https://pastebin.com/), and include the link."
        ) -NoJustifyRight -BypassLog
        If (-not $BypassLog) {
            Write-CustomLog "", "Multi Factor Error Flag: $true"
        }
    }

    if (-not $Immediate) {
        Write-Custom "" -BypassLog
        Wait-KeyPress
    }
    if (-not $BypassLog) {
        Write-CustomLog "", "Exit Code: $ExitCode"
    }

    # reset things
    if (
        -not $SkipFinalCleanup -and
        -not $null -eq $repackTag -and
        -not $repackTag.Custom -and
        -not $null -eq $dir.patchedFiles -and
        (Test-Path -LiteralPath $dir.patchedFiles)
    ) {
        Remove-Item -LiteralPath $dir.patchedFiles -Force -Recurse -ErrorAction SilentlyContinue
    }
    $Host.UI.RawUI.BackgroundColor = $OriginalBackgroundColor
    $env:PATH = $originalPath

    exit $ExitCode
}

function Get-Fallout4DataFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [string] $DiscoveryMethod
    )

    switch -exact ($DiscoveryMethod) {
        "Registry" {
            # attempt to get the install path of Fallout 4 from the registry
            $fallout4RegistryFolder = (Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Bethesda Softworks\Fallout4" -ErrorAction SilentlyContinue)."installed path"
            if (-not $fallout4RegistryFolder -or -not (Test-Path -LiteralPath "$fallout4RegistryFolder\Fallout4.exe")) { return "" }
            # if the Fallout 4 executable exists, set the location of the Fallout 4 folder
            $fallout4Folder = $fallout4RegistryFolder
            break
        }
        "Steam" {
            # attempt to get steam install path from the registry
            $steamDir = (Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Valve\Steam" -ErrorAction SilentlyContinue).InstallPath
            if (-not $steamDir) { return "" }
            # set the location of the file that has the configuration of Steam's library folders
            $steamLibraryFile = "$steamDir\config\libraryfolders.vdf"
            if (-not (Test-Path -LiteralPath $steamLibraryFile)) { return "" }
            # search the steam library file for the game ID of Fallout 4
            #   (Select-String "^\s+`"377160`"" -LiteralPath $steamLibraryFile)
            # get the line number it's found at
            #   .LineNumber
            $fallout4EntryLineNumber = (Select-String "^\s+`"377160`"" -LiteralPath $steamLibraryFile).LineNumber
            if (-not $fallout4EntryLineNumber) { return "" }
            # search for "path" entries in the steam library file, making sure it's an array
            #   (@(Select-String "^\s+`"path`"" -LiteralPath $steamLibraryFile)
            # find the path entry just before the fallout 4 ID, will be an entry similar to '       "path"      "C:\Foo"'
            #   .Where({$_.LineNumber -lt $fallout4EntryLineNumber}, "Last")
            # split the line using " as a delimiter
            #   .Line -split "`"")
            # trim any whitespace from the resulting array entries
            #   .Trim()
            # get the last entry that's not an empty string, which should be the location of the steam library where Fallout 4 is
            #   .Where({$_}, "Last")
            $steamLibraryPath = (@(Select-String "^\s+`"path`"" -LiteralPath $steamLibraryFile).Where({ $_.LineNumber -lt $fallout4EntryLineNumber }, "Last").Line -split "`"").Trim().Where({ $_ }, "Last")
            if (-not $steamLibraryPath) { return "" }
            # set the location of the Fallout 4 folder gotten through this method
            $fallout4SteamFolder = "$steamLibraryPath\steamapps\common\Fallout 4"
            if (-not (Test-Path -LiteralPath $fallout4SteamFolder)) { return "" }
            # if the Fallout 4 executable exists, set the location of the Fallout 4 folder
            $fallout4Folder = $fallout4SteamFolder
            break
        }
        "SteamFallback" {
            # attempt to get steam install path from the registry
            $steamDir = (Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Valve\Steam" -ErrorAction SilentlyContinue).InstallPath
            if (-not $steamDir) { return "" }
            # set the location of the file that has the configuration of Steam's library folders
            $steamLibraryFile = "$steamDir\config\libraryfolders.vdf"
            if (-not (Test-Path -LiteralPath $steamLibraryFile)) { return "" }
            # search for "path" entries in the steam library file, making sure it's an array
            #   (@(Select-String "^\s+`"path`"" -LiteralPath $steamLibraryFile)
            # split the line using " as a delimiter
            #   .Line -split "`"")
            # trim any whitespace from the resulting array entries
            #   .Trim()
            # get entries that are not an empty string and not equal to "path", which should be steam library locations
            #   .Where({ $_ -and $_ -ne "path" })
            $steamLibraryPaths = (@(Select-String "^\s+`"path`"" -LiteralPath $steamLibraryFile).Line -split "`"").Trim().Where({ $_ -and $_ -ne "path" })
            if (-not $steamLibraryPaths) { return "" }
            # test potential locations of the Fallout 4 folder gotten through this method
            foreach ($library in $steamLibraryPaths) {
                $fallout4SteamFolder = "$library\steamapps\common\Fallout 4"
                if (Test-Path -LiteralPath "$fallout4SteamFolder\Fallout4.exe") { break } else { $fallout4SteamFolder = "" }
            }
            if (-not $fallout4SteamFolder) { return "" }
            # if the Fallout 4 executable exists, set the location of the Fallout 4 folder
            $fallout4Folder = $fallout4SteamFolder
            break
        }
        default {
            throw "Invalid discovery method `"$DiscoveryMethod`" specified."
        }
    }
    # set the location of the fallout 4 data folder
    $fallout4DataFolder = [IO.Path]::GetFullPath("$fallout4Folder\Data")
    if (-not (Test-Path -LiteralPath $fallout4DataFolder)) { return "" }
    # if it exists, return the location of the fallout 4 data folder
    return $fallout4DataFolder
}

function Get-FileHash {
    [CmdletBinding(DefaultParameterSetName = "Path")]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "Path", Position = 0)]
        [PSObject] $Path,

        [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "LiteralPath", Position = 0)]
        [PSObject] $LiteralPath,

        [ValidateSet("SHA1", "SHA256", "SHA384", "SHA512", "MD5", "CRC32", "XXH3", "XXH32", "XXH64", "XXH128")]
        [string] $Algorithm = "SHA256"
    )

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

        # break down the list of all files into sub-lists of files whose cumulative path lengths are no longer than 8000 characters
        $fileLists = New-Object System.Collections.Generic.List[PSObject]
        $fileList = New-Object System.Collections.Generic.List[System.Management.Automation.PathInfo]
        $allFiles | ForEach-Object {
            $cumulativeFileNameLength += $_.Path.Length + 1
            if ($cumulativeFileNameLength -le 8000) {
                $fileList.Add($_)
            }
            else {
                $fileLists.Add($fileList)
                $fileList = New-Object System.Collections.Generic.List[string]
                $fileList.Add($_)
                $cumulativeFileNameLength = $_.Path.Length
            }
        }
        if ($fileList) { $fileLists.Add($fileList) }

        # provided there are files to work on, do the hashing
        foreach ($fileList in $fileLists) {
            switch ($Algorithm.ToUpper()) {
                # the built-in Get-FileHash cmdlet handles SHA{1,256,384,512} and MD5 hashing
                { @("SHA1", "SHA256", "SHA384", "SHA512", "MD5") -contains $_ } {
                    $argList = @{
                        $(if ($Path) { "Path" } else { "LiteralPath" }) = $fileList
                        Algorithm                                       = $_
                    }
                    # collect results
                    $results = Microsoft.PowerShell.Utility\Get-FileHash @argList
                    # repackage the results into basic PSCustomObjects
                    $results | ForEach-Object {
                        [PSCustomObject]@{
                            Algorithm = $_.Algorithm
                            Hash      = $_.Hash
                            Path      = $_.Path
                        }
                    }
                }
                # CRC32 hashing is handled by a bundled C# script
                "CRC32" {
                    foreach ($file in $fileList) {
                        # adapted from https://gist.github.com/r3t3ch/86c944ac14a69bccbd81bff698050b83
                        # create a new instance of a crc32 object
                        $crc32 = New-Object DamienG.Security.Cryptography.Crc32
                        if ($null -eq $crc32) { continue }

                        # open the file and have the crc32 object hash it, closing the file when done or an error is encountered
                        $stream = New-Object System.IO.FileStream($file, [System.IO.FileMode]::Open)
                        if ($null -eq $stream) { continue }

                        try {
                            $rawHash = $crc32.ComputeHash($stream)
                        }
                        finally {
                            $stream.Close()
                        }

                        # format the raw hash into one fit for display or consumption
                        $hash = foreach ($byte in $rawHash) {
                            $byte.toString('X2')
                        }
                        $hash = $hash -join ""

                        [PSCustomObject] @{
                            Algorithm = "$_"
                            Hash      = "$hash"
                            Path      = "$file"
                        }
                    }
                }
                # xxHashing is handled by the bundled xxhsum.exe program
                { @("XXH3", "XXH32", "XXH64", "XXH128") -contains $_ } {
                    # remove the first two characters from $_ and set that as the algorithm
                    $xxhAlgorithm = $_[2..$($_.Length)] -join ''
                    # if the xxhsum command completes successfully, the .Where portion of the command may generate an error.
                    # as such, whatever the current error action preference is is stored, changed to silently continue,
                    # the xxhsum command is ran, then the error action preference is changed back to the stored value
                    $errorActionPreferenceSaved = $ErrorActionPreference
                    $ErrorActionPreference = "SilentlyContinue"
                    $stdout, $stderr = (xxhsum.exe -$xxhAlgorithm $fileList 2>&1).Where({ $_ -is [string] -and $_ -ne "" }, "Split")
                    $ErrorActionPreference = $errorActionPreferenceSaved

                    # xxhsum will actually kick back real exceptions, so emit them
                    $stderr = $stderr | Where-Object { $_.TargetObject -and $_.TargetObject.Trim() } | ForEach-Object { Write-Error $_ }

                    foreach ($line in $stdout) {
                        # hashing done with the XXH3 algorithm has a slightly different output format compared to the other algorithms
                        if ($_ -eq "XXH3") {
                            # format: "XXH3 (<path>) = <hash>"
                            $hash = $line.Split(" ") | Select-Object -Last 1
                            $file = $line.Substring(6, $line.Length - 20 - 6)
                        }
                        else {
                            # format: "<hash>  <path>"
                            $splitLine = $line.Split(" ")
                            $hash = $splitLine | Select-Object -First 1
                            $file = ($splitLine | Select-Object -Skip 2) -join " "
                        }

                        [PSCustomObject]@{
                            Algorithm = "$_"
                            Hash      = "$($hash.ToUpper())"
                            Path      = "$file"
                        }
                    }
                }
                Default { Write-Error "Unknown hashing algorithm: `"$_`"." }
            }
        }
    }
}

function Get-Folder {
    [CmdletBinding()]
    param (
        [Parameter()] [string] $Description = "",
        [Parameter()] [string] $InitialDirectory = (Get-Location),
        [Parameter()] [string] $RootFolder = "MyComputer"
    )

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $folderDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderDialog.Description = $Description
    $folderDialog.RootFolder = $RootFolder
    $folderDialog.SelectedPath = $InitialDirectory

    if ($folderDialog.ShowDialog() -eq "OK") {
        $folder += $folderDialog.SelectedPath
    }
    return $folder
}

function Get-ExistingPatchedFilesFolderChoice {
    Add-Type -AssemblyName PresentationFramework

    [xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    Title="BiRaitBec WorkBase Improved" ResizeMode="NoResize" WindowStartupLocation="CenterOwner" SizeToContent="WidthAndHeight">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition/>
            <ColumnDefinition/>
            <ColumnDefinition/>
            <ColumnDefinition/>
        </Grid.ColumnDefinitions>
        <Label Grid.Column="0" Grid.Row="0" Grid.ColumnSpan="4" Margin="10,10,10,10" Padding="0,0,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Top" VerticalAlignment="Stretch">
            <TextBlock TextWrapping="Wrap" Text="An existing PatchedFiles folder already exists, what would you like to do with it?"/>
        </Label>
        <Button x:Name="ButtonRename" Grid.Column="0" Grid.Row="1" Content="_Rename" Margin="20,10,20,10" Padding="5,1,5,1" IsDefault="True"/>
        <Button x:Name="ButtonIgnore" Grid.Column="1" Grid.Row="1" Content="_Ignore" Margin="20,10,20,10" Padding="5,1,5,1"/>
        <Button x:Name="ButtonDelete" Grid.Column="2" Grid.Row="1" Content="_Delete" Margin="20,10,20,10" Padding="5,1,5,1"/>
        <Button x:Name="ButtonCancel" Grid.Column="3" Grid.Row="1" Content="Cancel" Margin="20,10,20,10" Padding="5,1,5,1" IsCancel="True"/>
    </Grid>
</Window>
"@

    $reader = New-Object System.Xml.XmlNodeReader $xaml
    $window = [Windows.Markup.XamlReader]::Load($reader)

    $buttonRename = $window.FindName("ButtonRename")
    $buttonIgnore = $window.FindName("ButtonIgnore")
    $buttonDelete = $window.FindName("ButtonDelete")

    $script:buttonClicked = $null
    $buttonRename.Add_Click({ $script:buttonClicked = "rename"; $window.DialogResult = $true; $window.Close() })
    $buttonIgnore.Add_Click({ $script:buttonClicked = "ignore"; $window.DialogResult = $true; $window.Close() })
    $buttonDelete.Add_Click({ $script:buttonClicked = "delete"; $window.DialogResult = $true; $window.Close() })

    $window.ShowDialog() | Out-Null

    $script:buttonClicked
}

function Get-PathSize {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [string[]] $Path
    )

    process {
        foreach ($item in $Path) {
            [pscustomobject]@{
                Path = $item
                Size = [long](Get-ChildItem -LiteralPath $item -File -Recurse -ErrorAction SilentlyContinue | Measure-Object -Sum Length).Sum
            }
        }
    }
}

function Get-OriginalBa2File {
    [CmdletBinding()]
    param (
        [Parameter()] [string] $FileName,
        [Parameter()] [string] $FolderOriginal = $dir.originalBa2,
        [Parameter()] [string] $FolderRegistry = $dir.fallout4DataRegistry,
        [Parameter()] [string] $FolderSteam = $dir.fallout4DataSteam,
        [Parameter()] [string] $FolderSteamFallback = $dir.fallout4DataSteamFallback
    )

    $toReturn = "$FolderOriginal\$FileName"
    $folderList = @(
        $FolderOriginal
        $FolderRegistry
        $FolderSteam
        $FolderSteamFallback
    )
    foreach ($folder in $folderList) {
        if (Test-Path -LiteralPath "$folder\$FileName") {
            $toReturn = "$folder\$FileName"
            break
        }
    }
    return $toReturn
}

function Get-WindowsVersion {
    $regKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
    return @(
        Get-ItemPropertyValue -Path $regKey -Name "ProductName"
        Get-ItemPropertyValue -Path $regKey -Name "DisplayVersion"
        "(Version"
        (Get-ItemPropertyValue -Path $regKey -Name "ReleaseId") + ","
        "OS Build"
        (Get-ItemPropertyValue -Path $regKey -Name "CurrentBuild") + "." + (Get-ItemPropertyValue -Path $regKey -Name "UBR") + ")"
    ) -join " "
}

function Invoke-HashActions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [string] $VariableName,
        [Parameter(Mandatory)] [string] $Hash
    )

    $var = (Get-Variable -Name $VariableName -ErrorAction Stop).Value
    if (-not $var.ContainsKey($Hash)) { return } # hash does not exist in variable
    $var.$Hash.Actions | ForEach-Object {
        $action = $_ -split "|"
        switch ($action[0]) {
            ResetRepackFlags {
                $repackFlags.Keys | ForEach-Object { $repackFlags.$_ = $false }
            }
            SetRepackFlag {
                $repackFlags.$action[1] = $action[2]
            }
            Default {}
        }
    }
}

<#
.SYNOPSIS
    Run the specified script block over each object in $InputObject in parallel (wrapper for Invoke-ParallelActual)
#>
function Invoke-Parallel {
    [CmdletBinding()]
    param (
        # This is the object containing the objects that will be worked on in parallel
        [Parameter(Mandatory, ValueFromPipeline)] [AllowNull()] [PSObject] $InputObject,
        # This is the script block that will run in parallel
        [Parameter(Mandatory, Position = 0)] [ScriptBlock] $ScriptBlock,
        # This is the hashtable of parameters for the script block
        [Parameter()] [hashtable] $ParameterTable,
        # This is the name of the variable used to reference the particular input object being operated on in the script block, defaults to 'Object'
        [Parameter()] [string] $InputObjectParameterName = 'Object',
        # This is the directory to start in, defaults to the current folder
        [Parameter()] [ValidateScript({ Test-Path -LiteralPath $_ -PathType Container })] [string] $StartingDirectory = (Get-Location),
        # This is the number of items to send to each invocation of Invoke-ParallelActual. If you experience memory pressure, lower this number.
        [Parameter()] [UInt64] $RunspacePoolJobLimit = [UInt64]::MaxValue,
        # The minimum number of threads, defaults to 1
        [Parameter()] [ValidateRange(1, 255)] [int] $MinThreads = 1,
        # The maximum number of threads, defaults to the number of logical processors
        [Parameter()] [ValidateRange(1, 255)] [int] $MaxThreads = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
    )

    begin {
        # set up list to capture all input objects
        $allInputObjects = New-Object System.Collections.Generic.List[PSObject]
    }

    process {
        # capture all input objects
        $InputObject | ForEach-Object { $allInputObjects.Add($_) }
    }

    end {
        # set up base hashtable
        $argList = @{
            InputObject              = $null
            ScriptBlock              = $ScriptBlock
            ParameterTable           = $ParameterTable
            InputObjectParameterName = $InputObjectParameterName
            StartingDirectory        = $StartingDirectory
            MinThreads               = $MinThreads
            MaxThreads               = $MaxThreads
        }
        # send a number of input objects equal to the runspace pool job limit to the Invoke-ParallelActual function
        for ($index = 0; $index -le $allInputObjects.Count; $index += $RunspacePoolJobLimit) {
            $indexEnd = [Math]::Min($index + $RunspacePoolJobLimit, $allInputObjects.Count) - 1
            $argList.InputObject = $allInputObjects[$index .. $indexEnd]
            Invoke-ParallelActual @argList
        }
    }
}

# Run the specified script block over each object in $InputObject in parallel. Intended to be wrapped by Invoke-Parallel
function Invoke-ParallelActual {
    [CmdletBinding()]
    param (
        [PSObject] $InputObject,
        [ScriptBlock] $ScriptBlock,
        [hashtable] $ParameterTable,
        [string] $InputObjectParameterName,
        [string] $StartingDirectory,
        [int] $MinThreads,
        [int] $MaxThreads
    )

    begin {
        # if the minimum number of threads is greater than the maximum number of threads, swap them
        if ($MinThreads -gt $MaxThreads) {
            $temp = $MinThreads
            $MinThreads = $MaxThreads
            $MaxThreads = $temp
        }

        # set up a runspace pool
        $runspacePool = [RunspaceFactory]::CreateRunspacePool($MinThreads, $MaxThreads)
        $runspacePool.Open()

        # set up a variable to collect all the jobs
        $jobs = New-Object System.Collections.Generic.List[hashtable]
    }

    process {
        # engage all the threads and collect everything into $jobs
        $InputObject | ForEach-Object {
            $powerShell = [PowerShell]::Create()
            $powerShell.RunspacePool = $runspacePool
            # set the location of the powershell object to the current directory so relative paths work
            $powerShell.AddCommand("Set-Location").AddArgument($StartingDirectory) | Out-Null
            # add the script block to the powershell instance and give it the proper parameters
            $powerShell.AddScript($ScriptBlock).AddParameters(@{ $InputObjectParameterName = $_ } + $ParameterTable) | Out-Null
            $jobs.Add(@{ PowerShell = $powerShell; Handle = $powerShell.BeginInvoke() })
        }
    }

    end {
        # check once per second if all the jobs are completed
        while ($jobs.Handle.IsCompleted -contains $false) { Start-Sleep -Seconds 1 }

        # make a list for capturing error records so that all the different threads can get cleaned up without interruption
        $errorRecords = New-Object System.Collections.Generic.List[System.Management.Automation.ErrorRecord]

        try {
            # collect the results of all the jobs and clean up the powershell instances
            $results = $jobs | ForEach-Object {
                # capture any non-terminating errors that occurred
                $_.PowerShell.Streams.Error | ForEach-Object { $errorRecords.Add($_) }

                # attempt to gather results from the PowerShell instance
                try {
                    $_.PowerShell.EndInvoke($_.Handle)
                }
                catch {
                    # if an inner exception exists, capture the inner most exception's ErrorRecord property
                    if ($_.Exception.InnerException) {
                        $exception = $_.Exception
                        while ($exception.InnerException) { $exception = $exception.InnerException }
                        $errorRecords.Add($exception.ErrorRecord)
                    }
                    # otherwise just capture the initial ErrorRecord
                    else {
                        $errorRecords.Add($_)
                    }
                }
                finally {
                    # clean up the PowerShell instance
                    $_.PowerShell.Dispose()
                }
            }
        }
        finally {
            # clean up the jobs list and runspace pool
            $jobs.Clear()
            $runspacePool.Close()
            $runspacePool.Dispose()
        }

        # express all the error records captured earlier
        $errorRecords | ForEach-Object { Write-Error $_ }

        $results
    }
}

function Out-WrapLine {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)] [string[]] $Message = "",
        [char[]] $Delimiters = [char[]] @(" ", "`t", "-", ",", ".", ":", "/", "\"),
        [int] $Width = $LineWidth,
        [switch] $NoTrim
    )

    process {
        $toReturn = New-Object System.Collections.Generic.List[string]
        $Message | ForEach-Object {
            $_ -split "`n" | ForEach-Object {
                $temp = $_
                while ($temp.Length -gt $Width) {
                    $wrapPoint = $temp.LastIndexOfAny($Delimiters, $Width - 1)
                    # if a delimiter isn't found to the left of the wrap width, check to the right
                    if ($wrapPoint -lt 0) { $wrapPoint = $temp.IndexOfAny($Delimiters, $Width - 1) }
                    # if a delimiter still isn't found, break and just add the whole line
                    if ($wrapPoint -lt 0) { break }
                    $tempString = $temp.Substring(0, $wrapPoint + 1)
                    if (-not $NoTrim) { $tempString = $tempString.TrimEnd() }
                    $toReturn.Add($tempString) | Out-Null
                    $temp = $temp.Substring($wrapPoint + 1)
                    if (-not $NoTrim) { $temp = $temp.TrimStart() }
                }
                $toReturn.Add($temp) | Out-Null
            }
        }
        $toReturn
    }
}

function Resolve-PathAnyway {
    param (
        [Parameter(Position = 0)]
        [string] $Path
    )

    # square brackets break non-literal-paths but are allowed in normal filenames, so check for them directly
    if ($Path.IndexOfAny(@('[', ']')) -gt -1) {
        $fileName = Resolve-Path -LiteralPath $Path -ErrorAction SilentlyContinue -ErrorVariable resolvePathError
    }
    else {
        $fileName = Resolve-Path -Path $Path -ErrorAction SilentlyContinue -ErrorVariable resolvePathError
    }

    if (-not $fileName) {
        $fileName = $resolvePathError[0].TargetObject
    }
    elseif ($fileName.GetType().Name -eq "PathInfo" ) {
        $fileName = $fileName.Path
    }

    return $fileName
}

function Wait-KeyPress {
    [CmdletBinding()]
    param (
        [Parameter()] [string] $Message = "Press any key to continue . . . ",
        [switch] $NoPadding
    )
    Write-Custom $Message -NoNewLine -BypassLog
    [Void][System.Console]::ReadKey($true)
    if (-not $NoPadding) {
        Write-Custom "", "" -BypassLog
    }
}

function Write-Custom {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)] [AllowEmptyString()] [string[]] $Message,
        [switch] $NoNewline,
        [switch] $BypassLog,
        [string] $Prefix = $null,
        [switch] $JustifyRight,
        [switch] $JustifyCenter,
        [int] $LineWidth = $LineWidth,
        [switch] $UseErrorStream,
        [int] $SnippetLength = 0,
        [PSObject] $Color = $null,
        [ref] $PreviousLineLength = [ref] $writeCustomPrevNoNewLineLength,
        [switch] $TrimBeforeDisplay,
        [switch] $KeepCursorPosition
    )

    process {
        # break apart any multi-line strings contained in $Message and attach the given $Prefix
        $splitMessage = New-Object Collections.Generic.List[String]
        $Message | Out-WrapLine -Width ($LineWidth - $Prefix.Length) | ForEach-Object {
            $splitMessage.Add("$Prefix$_") | Out-Null
        }
        $Message = $splitMessage

        if ($UseErrorStream) {
            $stream = [Console]::Error
        }
        else {
            $stream = [Console]::Out
        }

        if ($null -ne $Color -and $Color.GetType().FullName -eq "System.ConsoleColor") {
            [Console]::ForegroundColor = $Color
        }

        $savedCursorPosition = $Host.UI.RawUI.CursorPosition
        $savedLineLength = $PreviousLineLength.Value

        $doSnip = $Message.Count -gt $SnippetLength * 2 -and $SnippetLength -gt 0

        for ($index = 0; $index -lt $Message.Count; $index++) {
            $line = $Message[$index]
            if ($doSnip -and $index -eq $SnippetLength) {
                $line = "--- snip ---"
                $index = $Message.Count - $SnippetLength - 1
            }
            if ($JustifyRight) {
                $formatString = "{0,$($LineWidth - $PreviousLineLength.Value)}"
            }
            elseif ($JustifyCenter) {
                $formatString = "{0,$([int](($LineWidth - $PreviousLineLength.Value) / 2.0 + $line.Length / 2.0))}"
            }
            else {
                $formatString = "{0}"
            }
            if ($TrimBeforeDisplay) {
                $outputString = $line.Trim()
            }
            else {
                $outputString = $line
            }
            if ($NoNewline) {
                $stream.Write($formatString, $outputString)
                $PreviousLineLength.Value = $Host.UI.RawUI.CursorPosition.X
            }
            else {
                $stream.WriteLine($formatString, $outputString)
                $PreviousLineLength.Value = 0
            }
            if ($KeepCursorPosition) {
                $Host.UI.RawUI.CursorPosition = $savedCursorPosition
                $PreviousLineLength.Value = $savedLineLength
            }
        }

        if ($null -ne $Color -and $Color.GetType().FullName -eq "System.ConsoleColor") {
            [Console]::ResetColor()
        }

        if (-not $BypassLog) {
            Write-CustomLog $Message
        }
    }
}

function Write-CustomError {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [AllowEmptyString()] [string[]] $ExtraContext = $null,
        [switch] $BypassLog,
        [switch] $NoJustifyRight,
        [switch] $NoNewline,
        [switch] $NoTrimBeforeDisplay,
        [string] $Prefix = $null,
        [int] $SnippetLength = 0
    )

    if ($ExtraContext) {
        $Message = $Message + @(
            "-" * 10
            $ExtraContext
        )
    }
    $hashArguments = @{
        Message           = $Message
        BypassLog         = $BypassLog
        JustifyRight      = -not $NoJustifyRight
        NoNewLine         = $NoNewline
        TrimBeforeDisplay = -not $NoTrimBeforeDisplay
        Prefix            = $Prefix
        SnippetLength     = $SnippetLength
        Color             = [System.ConsoleColor]::Red
    }
    Write-Custom @hashArguments
}

function Write-CustomInfo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $BypassLog,
        [switch] $NoJustifyRight,
        [switch] $NoNewline,
        [switch] $NoTrimBeforeDisplay,
        [string] $Prefix = $null
    )

    $hashArguments = @{
        Message           = $Message
        BypassLog         = $BypassLog
        JustifyRight      = -not $NoJustifyRight
        NoNewLine         = $NoNewline
        TrimBeforeDisplay = -not $NoTrimBeforeDisplay
        Prefix            = $Prefix
        Color             = [System.ConsoleColor]::Blue
    }
    Write-Custom @hashArguments
}

function Write-CustomLog {
    [CmdletBinding()]
    param (
        # note: having $Message be a PSObject type allows stdout and stderr output to be processed correctly
        [Parameter(Mandatory)] [AllowEmptyString()] [PSObject] $Message,
        [AllowEmptyString()] [string[]] $ExtraContext = $null,
        [string] $Log = "install",
        [string] $LogStartTime = $RunStartTime,
        [string] $Prefix = $null
    )

    $timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

    if ($ExtraContext) {
        $Message = @(
            "-" * 10
            $ExtraContext
            "-" * 10
        ) + $Message
    }

    $splitMessage = New-Object Collections.Generic.List[String]
    foreach ($line in $Message) {
        $line -split "`n" | ForEach-Object {
            $splitMessage.Add("[$timestamp] $Prefix$(if ($Prefix){$_.TrimStart()} else {$_})".TrimEnd()) | Out-Null
        }
    }
    $Message = $splitMessage

    if ($(Test-Path -LiteralPath $dir.logs) -eq $false) {
        New-Item $dir.logs -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    Write-Output $Message | Out-File -LiteralPath "$($dir.logs)\${Log}_$LogStartTime.log" -Append
    Write-Output $Message | Out-File -LiteralPath "$($dir.logs)\current.${Log}.log" -Append
}

function Write-CustomSuccess {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $BypassLog,
        [switch] $NoJustifyRight,
        [switch] $NoNewline,
        [switch] $NoTrimBeforeDisplay,
        [string] $Prefix = $null
    )

    $hashArguments = @{
        Message           = $Message
        BypassLog         = $BypassLog
        JustifyRight      = -not $NoJustifyRight
        NoNewLine         = $NoNewline
        TrimBeforeDisplay = -not $NoTrimBeforeDisplay
        Prefix            = $Prefix
        Color             = [System.ConsoleColor]::Green
    }
    Write-Custom @hashArguments
}

function Write-PrettyTimeSpan {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [System.TimeSpan] $TimeSpan
    )

    $formatString = @(
        "$(if ($TimeSpan.TotalDays -ge 1) {"d\d"})"
        "$(if ($TimeSpan.TotalHours -ge 1) {"h\h"})"
        "$(if ($TimeSpan.TotalMinutes -ge 1) {"m\m"})"
        "$(if ($TimeSpan.TotalSeconds) {"s\.f\s"})"
    ).Where{ $_ } -join "\ "
    return [System.TimeSpan]::FromSeconds([Math]::Round($TimeSpan.TotalSeconds, 1)).ToString($formatString)
}

function Write-PrettySize {
    param (
        [Parameter(Mandatory, ValueFromPipeline)] [long] $Size,
        [Parameter()] [int] $RoundToDigits = 2,
        [Parameter()] [switch] $UseUnitFullForm,
        [Parameter()] [switch] $JoinUnit
    )
    switch ($Size) {
        { $_ -ge 1PB } { $prettySize = $_ / 1PB; $prefix = if ($UseUnitFullForm) { "peta" } else { "P" }; break }
        { $_ -ge 1TB } { $prettySize = $_ / 1TB; $prefix = if ($UseUnitFullForm) { "tera" } else { "T" }; break }
        { $_ -ge 1GB } { $prettySize = $_ / 1GB; $prefix = if ($UseUnitFullForm) { "giga" } else { "G" }; break }
        { $_ -ge 1MB } { $prettySize = $_ / 1MB; $prefix = if ($UseUnitFullForm) { "mega" } else { "M" }; break }
        { $_ -ge 1KB } { $prettySize = $_ / 1KB; $prefix = if ($UseUnitFullForm) { "kilo" } else { "K" }; break }
        Default { $prettySize = $_ }
    }
    $prettySize = [Math]::Round($prettySize, $RoundToDigits)
    $unit = $prefix + $(if ($UseUnitFullForm) { "byte" } else { "B" })
    @(
        $prettySize.ToString("f$RoundToDigits")
        "$unit$(if ($UseUnitFullForm -and $prettySize -ne 1) {"s"})"
    ) -join $(if ($JoinUnit) { "" } else { " " })
}

function Write-CustomWarning {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $BypassLog,
        [switch] $NoJustifyRight,
        [switch] $NoNewline,
        [switch] $NoTrimBeforeDisplay,
        [string] $Prefix = $null
    )

    $hashArguments = @{
        Message           = $Message
        BypassLog         = $BypassLog
        JustifyRight      = -not $NoJustifyRight
        NoNewLine         = $NoNewline
        TrimBeforeDisplay = -not $NoTrimBeforeDisplay
        Prefix            = $Prefix
        Color             = [System.ConsoleColor]::Yellow
    }
    Write-Custom @hashArguments
}
