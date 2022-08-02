[CmdletBinding(DefaultParameterSetName = "Path")]
param (
    [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "Path", Position = 0)]
    [PSObject] $Path,

    [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = "LiteralPath", Position = 0)]
    [PSObject] $LiteralPath,

    # [Parameter(Mandatory)]
    [string] $NexusAPIKey = "foo",

    # [Parameter(Mandatory)]
    [string] $GameDomain = "fallout4"
)

begin {
    # $ErrorActionPreference = 'Stop'

    $dir = @{}
    $dir.currentDirectory = $pwd.Path
    $dir.scriptDirectory = Split-Path $MyInvocation.MyCommand.Path -Parent
    $dir.logs = "..\..\Logs"
    $dir.temp = "..\..\Temp"
    $dir.tools = "..\..\Tools"
    $dir

    $apiBase = "https://api.nexusmods.com/v1"
    $apiValidate = "${apiBase}/users/validate.json"
    $apiModsBase = "${apiBase}/games/$($GameDomain.ToLower())/mods"

    # validate API key
    Invoke-RestMethod -Uri $apiValidate -Headers @{ apikey = $NexusAPIKey } -ErrorVariable "ValidateRestError" | Out-Null
    if ($ValidateRestError) { exit 1 }

    # 7-Zip 64-bit v22.01 (2022-07-15) by Igor Pavlov
    # https://www.7-zip.org/
    # $env:PATH = (Resolve-Path -LiteralPath "$($dir.tools)\7-zip").Path + ";" + $env:PATH

    # xxhsum v0.8.1 by cyan4973
    # https://cyan4973.github.io/xxHash/
    # $env:PATH = (Resolve-Path -LiteralPath "$($dir.tools)\xxHash").Path + ";" + $env:PATH
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
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "MD5" -Value $Hash.ToLower()
        try {
            $response = Invoke-RestMethod -Uri "${apiModsBase}/md5_search/$($hash.ToLower()).json" -Headers @{ apikey = $NexusAPIKey }
        }
        catch { $response = $null }
        if ($null -eq $response) {
            $modName = $null
            $modID = $null
            $fileName = $null
        }
        else {
            $modName = $response.mod.name
            $modID = $response.mod.mod_id
            $fileName = $response.file_details.file_name
        }
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "ModName" -Value $modName
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "ModID" -Value $modID
        Add-Member -InputObject $modObject -MemberType NoteProperty -Name "FileName" -Value $fileName
        $modObject
    }
}
