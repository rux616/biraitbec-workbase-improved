Set-Variable "RunStartTime" -Value "$((Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ"))" -Option Constant

$dir = @{}
$dir.logs = ".\Logs"
$dir.patchedBa2 = ".\PatchedBa2"
$dir.repack7z = ".\Repack7z"

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

$allKeyCombinations = @(
    @(""),
    @("Performance"),
    @("Main"),
    @("Quality"),
    @("Restyle"),
    @("Performance", "Main"),
    @("Performance", "Quality"),
    @("Performance", "Vault Fix"),
    @("Performance", "Restyle"),
    @("Main", "Quality"),
    @("Main", "Vault Fix"),
    @("Main", "Restyle"),
    @("Quality", "Vault Fix"),
    @("Quality", "Restyle"),
    @("Performance", "Main", "Quality"),
    @("Performance", "Main", "Vault Fix"),
    @("Performance", "Main", "Restyle"),
    @("Performance", "Quality", "Vault Fix"),
    @("Performance", "Quality", "Restyle"),
    @("Performance", "Vault Fix", "Restyle"),
    @("Main", "Quality", "Vault Fix"),
    @("Main", "Quality", "Restyle"),
    @("Main", "Vault Fix", "Restyle"),
    @("Quality", "Vault Fix", "Restyle"),
    @("Performance", "Main", "Quality", "Vault Fix"),
    @("Performance", "Main", "Quality", "Restyle"),
    @("Performance", "Main", "Vault Fix", "Restyle"),
    @("Performance", "Quality", "Vault Fix", "Restyle"),
    @("Main", "Quality", "Vault Fix", "Restyle"),
    @("Performance", "Main", "Quality", "Vault Fix", "Restyle")
)

# initial reset
"*************", "initial reset", "*************"
foreach ($key in  $repackFiles.Keys) {
    foreach ($file in $repackFiles.$key) {
        if (Test-Path -LiteralPath "$($dir.repack7z)\$file.disabled") {
            Rename-Item -LiteralPath "$($dir.repack7z)\$file.disabled" -NewName "$file"
        }
    }
}

foreach ($keySet in $allKeyCombinations) {
    # prep
    "****", "prep", "****"
    $inverseKeySet = $repackFiles.Keys | Where-Object { $_ -notin $keySet }
    foreach ($key in $inverseKeySet) {
        foreach ($file in $repackFiles.$key) {
            Rename-Item -LiteralPath "$($dir.repack7z)\$file" -NewName "$file.disabled"
        }
    }

    # execute
    "*******", "execute", "*******"
    .\Installer.ps1 -SkipRepackHashing -SkipExistingPatchedHashing -SkipChoosingPatchedBa2Dir -NoPauseOnExit -NoClearScreen

    # log
    "***", "log", "***"
    "# $(($keySet -join " + ").ToLower())" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append
    "`$tag = @(`"$($keySet -join "``", ``"")`") -join `$TagJoiner" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append
    foreach ($file in $ba2Files.GetEnumerator()) {
        $hash = (Get-FileHash -LiteralPath "$($dir.patchedBa2)\$($file.Value)").Hash
        $size = (Get-ChildItem -LiteralPath "$($dir.patchedBa2)\$($file.Value)").Length
        "Add-Hash -VariableName `$var -Hash `"$hash`" -Tag `$tag -FileName `$ba2Files.$($file.Key) -FileSize $size" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append
    }
    "" | Out-File -LiteralPath "$($dir.logs)\generate_hashes_$RunStartTime.log" -Append

    # reset
    "*****", "reset", "*****"
    foreach ($key in $inverseKeySet) {
        foreach ($file in $repackFiles.$key) {
            Rename-Item -LiteralPath "$($dir.repack7z)\$file.disabled" -NewName "$file"
        }
    }
}
