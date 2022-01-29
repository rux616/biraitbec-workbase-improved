# functions
# ---------

function Add-Hash {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [string] $VariableName,
        [Parameter(Mandatory)] [string] $Hash,
        [Parameter(Mandatory)] [string] $FileName,
        [Parameter(Mandatory)] [string] $Tag
    )

    $var = (Get-Variable -Name $VariableName -ErrorAction Stop).Value
    if ($var.ContainsKey($Hash)) {
        if ($var[$Hash].FileName -ne $FileName) {
            Write-Error "Assigning file `"$FileName`" to hash `"$Hash`" failed because that hash is already in use by file `"$($var[$Hash].FileName)`"."
            Exit-Script 1
        }
        $var[$Hash].Tags = $var[$Hash].Tags + @($Tag) | Sort-Object -Unique
    }
    else {
        $var[$Hash] = @{
            FileName = $FileName
            Tags = @($Tag)
        }
    }
}

function Exit-Script {
    [CmdletBinding()]
    param (
        [int] $ExitCode = 0,
        [switch] $Immediate
    )

    $script:scriptTimer.Stop()
    Write-Custom "","Elapsed time: $(Write-TimeSpan $script:scriptTimer.Elapsed)"

    if (-not $Immediate) {
        Write-Custom "" -BypassLog
        Wait-KeyPress
    }
    Write-Log "","Exit Code: $ExitCode"
    exit $ExitCode
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
        Write-Custom "","" -BypassLog
    }
}

function Write-Error {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $NoJustifyRight,
        [string]$Prefix = $null,
        [int]$SnippetLength = 0
    )

    $hashArguments = @{
        Message = $Message
        JustifyRight = -not $NoJustifyRight
        Prefix = $Prefix
        SnippetLength = $SnippetLength
        Color = [System.ConsoleColor]::Red
    }
    Write-Custom @hashArguments
}

[int] $writeCustomPrevNoNewLineLength = 0
function Write-Custom {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $NoNewLine,
        [switch] $BypassLog,
        [string] $Prefix = $null,
        [switch] $JustifyRight,
        [int] $LineWidth = $LineWidth,
        [switch] $UseErrorStream,
        [int] $SnippetLength = 0,
        [PSObject] $Color = $null
    )

    if ($UseErrorStream) {
        $stream = [Console]::Error
    }
    else {
        $stream = [Console]::Out
    }

    if ($null -ne $Color -and $Color.GetType().FullName -eq "System.ConsoleColor") {
        [Console]::ForegroundColor = $Color
    }

    $doSnip = $Message.Length -gt $SnippetLength * 2 -and $SnippetLength -gt 0

    for ($index = 0; $index -lt $Message.Length; $index++) {
        $line = $Message[$index]
        if ($doSnip -and $index -eq $SnippetLength) {
            $line = $Prefix + "--- snip ---"
            $index = $Message.Length - $SnippetLength - 1
        }
        if ($NoNewLine) {
            if ($JustifyRight) {
                $stream.Write("{0,$LineWidth}", $Prefix + $line)
                $script:writeCustomPrevNoNewLineLength = $LineWidth
            }
            else {
                $stream.Write("{0}", $Prefix + $line)
                $script:writeCustomPrevNoNewLineLength = $Prefix.Length + $line.Length
            }
        }
        else {
            if ($JustifyRight) {
                $stream.WriteLine("{0,$($LineWidth - $script:writeCustomPrevNoNewLineLength)}", $Prefix + $line)
            }
            else {
                $stream.WriteLine("{0}", $Prefix + $line)
            }
            $script:writeCustomPrevNoNewLineLength = 0
        }
    }

    if ($null -ne $Color -and $Color.GetType().FullName -eq "System.ConsoleColor") {
        [Console]::ResetColor()
    }

    if (-not $BypassLog) {
        Write-Log $Message
    }
}

function Write-Log {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [PSObject] $Message,
        [string] $Log = "install",
        [switch] $NoTimestamp
    )

    if ($(Test-Path -Path $dir.logs) -eq $false) {
        New-Item -Path $dir.logs -ItemType "directory" -ErrorAction Stop | Out-Null
    }
    if ($NoTimestamp) {
        Write-Output $Message | Out-File "$($dir.logs)\${Log}_$RunTimestamp.log" -Append
    }
    else {
        Write-Output $Message | ForEach-Object {"[$((Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ"))] $_".Trim()} | Out-File "$($dir.logs)\${Log}_$RunTimestamp.log" -Append
    }
}

function Write-Success {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $NoJustifyRight,
        [string] $Prefix = $null
    )

    $hashArguments = @{
        Message = $Message
        JustifyRight = -not $NoJustifyRight
        Prefix = $Prefix
        Color = [System.ConsoleColor]::Green
    }
    Write-Custom @hashArguments
}

function Write-TimeSpan {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.TimeSpan]
        $TimeSpan
    )

    $formatString = @(
        "$(if ($TimeSpan.TotalDays -ge 1) {"d\d"})"
        "$(if ($TimeSpan.TotalHours -ge 1) {"h\h"})"
        "$(if ($TimeSpan.TotalMinutes -ge 1) {"m\m"})"
        "$(if ($TimeSpan.TotalSeconds) {"s\.f\s"})"
    ).Where{$_} -join "\ "
    return [System.TimeSpan]::FromSeconds([Math]::Round($TimeSpan.TotalSeconds, 1)).ToString($formatString)
}

function Write-Warning {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Message,
        [switch] $NoJustifyRight,
        [string] $Prefix = $null
    )

    $hashArguments = @{
        Message = $Message
        JustifyRight = -not $NoJustifyRight
        Prefix = $Prefix
        Color = [System.ConsoleColor]::Yellow
    }
    Write-Custom @hashArguments
}
