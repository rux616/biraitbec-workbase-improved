$zipFolder = "D:\Modding\Wabbajack Downloads\Fallout 4"
$patchedFiles = "D:\Modding\temp\Fallout 4\WorkBase Copy\PatchedFiles"
$7z = "${env:ProgramFiles}\7-zip\7z.exe"
$step = @{}
$step.performance = [PSCustomObject]@{
    Name = "Performance"
    Commands = @(
        "$7z x -y -o$patchedFiles `"$zipFolder\1. Performance Overhaul-23556-1-0-1565601510.7z`""
    )
}
$step.main = [PSCustomObject]@{
    Name = "Main"
    Commands = @(
        "$7z x -y -o$patchedFiles `"$zipFolder\2a. Main Repack - Part One-23556-1-0-1565616028.7z`""
        "$7z x -y -o$patchedFiles `"$zipFolder\2b. Main Repack - Part Two-23556-1-0-1565980979.7z`""
        "$7z x -y -o$patchedFiles `"$zipFolder\2c. Main Reapack - Part Three-23556-1-0-1565605113.7z`""
    )
}
$step.mainNoCorrupt = [PSCustomObject]@{
    Name = "Main (No Corrupted DDS)"
    Commands = @(
        "$7z x -y -o$patchedFiles `"$zipFolder\2a. Main Repack - Part One-23556-1-0-1565616028.7z`""
        "$7z x -y -o$patchedFiles `"$zipFolder\2b. Main Repack - Part Two-23556-1-0-1565980979.7z`""
        "$7z x -y -o$patchedFiles `"$zipFolder\2c. Main Reapack - Part Three-23556-1-0-1565605113.7z`""
        "Remove-Item `"$patchedFiles\Interiors\Vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS`""
    )
}
$step.quality = [PSCustomObject]@{
    Name = "Quality"
    Commands = @(
        "$7z x -y -o$patchedFiles `"$zipFolder\2a. Quality Addon - Part One-23556-1-0-1565546826.7z`""
        "$7z x -y -o$patchedFiles `"$zipFolder\2b. Quality Overhaul - Part Two-23556-1-0-1565980973.7z`""
    )
}
#todo define different restyle packs
#create patchedfiles folder
#run matrix
    #hash all the thingsdi
