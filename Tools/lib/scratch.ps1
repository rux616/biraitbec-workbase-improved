# scratch script

. ".\Functions.ps1"

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

$originalBa2Hashes = @{}; $var = "originalBa2Hashes"

# fallout 4 v1.10.163.0 (steam build ID 4460038), BA2 v1 DDS
$tags = "Fallout 4 v1.10.163.0-4460038"
Add-Hash -VariableName $var -Hash "77197092BF0489AF49B36B30BE68D351" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "CBF1F969E35F5EFC796B822F03D6835D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "C4F444B9006200C40C2B8009751B00A9" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218569835
Add-Hash -VariableName $var -Hash "E6A95CB6D79512E37F7B314147EA3B22" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23234600
Add-Hash -VariableName $var -Hash "263B4AFA89E4C6F9C6D4FED91F3D7CD3" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "876055AE7B3978CC3DFE9D780967BA39" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "8CF77A407E51D4A5B5CB5EFA944EBE64" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2703605715
Add-Hash -VariableName $var -Hash "FB4F8B0F792CF35F3D44206CA5BD54C2" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2410629991
Add-Hash -VariableName $var -Hash "BD3A5E523C3FB29AE5350B85C1450460" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2101083744
Add-Hash -VariableName $var -Hash "567309F67E9356239A37E5EE54EE68A1" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 1999988681
Add-Hash -VariableName $var -Hash "32A541DA99A4868B3B32501A29D26FDE" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1963767149
Add-Hash -VariableName $var -Hash "3EF465B58F3450A04BC38285CAB528C2" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1382855876
Add-Hash -VariableName $var -Hash "74F68AFE1B2E0AE118990FF7EC047C8E" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "5CC90CF3AFD30681C2901B0C187C162C" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "20697A2177195BBB0C86BAD7A6697CC3" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 864524837

# # fallout 4 v1.10.163.0 (steam build ID 4460038), BA2 v1 DDS, wabbajack-downgraded
# # Far Harbor (DLCCoast), Nuka World (DLCNukaWorld), Workshop 2 (DLCWorkshop2), and Workshop 3 (DLCWorkshop3) are not downgraded
# $tags = @("Fallout 4 v1.10.163.0-4460038", "Wabbajack Downgraded", "BA2 v1 DDS")
# Add-Hash -VariableName $var -Hash "1E5B057648112DF4329234A1F231CBB0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 216126831
# Add-Hash -VariableName $var -Hash "91146C6DAA56E642CBC276F6F320922E" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 22913130
# Add-Hash -VariableName $var -Hash "CA51D3499A75CD04F04F3311928E1DF6" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2675011799
# Add-Hash -VariableName $var -Hash "FFFD0FF762378849E92B3DEA5F86A4B9" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2385848777
# Add-Hash -VariableName $var -Hash "42F7C4240547384F7AC3F45292E65233" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2089863928
# Add-Hash -VariableName $var -Hash "3CA8CFA9A68668DA19B3034D8B53A8F7" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 1983062951
# Add-Hash -VariableName $var -Hash "E7E124F09CD7A2A765FA5547146C4BD7" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1951133480
# Add-Hash -VariableName $var -Hash "77530E0D9092B5C2FC8DE7BDDE956EF8" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1361757538
# Add-Hash -VariableName $var -Hash "DBDB5E4E932355BB182A58328CEB1E11" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 506911995
# Add-Hash -VariableName $var -Hash "8C3DFAF2FD8CF3011E6CFCAF4DBC686E" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 573414119
# Add-Hash -VariableName $var -Hash "D7E3FBF7422B1BECBF7B8DE688DDB4A2" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 836989019

# fallout 4 v1.10.163.0 (steam build ID 4460038), BA2 v1 DDS, wabbajack-downgraded v3.7.0+
# Far Harbor (DLCCoast), Nuka World (DLCNukaWorld), Workshop 2 (DLCWorkshop2), and Workshop 3 (DLCWorkshop3) are not downgraded
$tags = @("Fallout 4 v1.10.163.0-4460038", "Wabbajack Downgraded", "BA2 v1 DDS")
Add-Hash -VariableName $var -Hash "1E5B057648112DF4329234A1F231CBB0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 216126831
Add-Hash -VariableName $var -Hash "91146C6DAA56E642CBC276F6F320922E" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 22913130
Add-Hash -VariableName $var -Hash "34C7E6288F8FC02BDE88FB21F68DF0D1" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2675012019
Add-Hash -VariableName $var -Hash "0FBE911AA50439BA66E3F1E43829F562" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2385852487
Add-Hash -VariableName $var -Hash "8D044753E0856E5692708FD6C1CA53B4" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2089867073
Add-Hash -VariableName $var -Hash "4337CB01226879CCF107D9A95EC6C9F3" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 1983061327
Add-Hash -VariableName $var -Hash "811A961CD1CE91334E14E4B57F90D0B0" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1951038239
Add-Hash -VariableName $var -Hash "F84A69E1A261F0A134FFD70EFBE4820F" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1361712040
Add-Hash -VariableName $var -Hash "867B847495798956F20EBBE705D9A5CC" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 506911915
Add-Hash -VariableName $var -Hash "E5BDC01055F14E87A1F06F0C020B26EB" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 573393942
Add-Hash -VariableName $var -Hash "08081AB4BDB7B8785440C41D2076493F" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 836989038

# fallout 4 v1.10.980.0 (steam build ID 14160910), mix of BA2 v1 DDS and BA2 v7 DDS
# fallout 4 v1.10.984.0 (steam build ID 14349213), mix of BA2 v1 DDS and BA2 v7 DDS
$tags = @("Fallout 4 v1.10.980.0-14160910", "Fallout 4 v1.10.984.0-14349213", "BA2 v1 DDS")
Add-Hash -VariableName $var -Hash "77197092BF0489AF49B36B30BE68D351" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "CBF1F969E35F5EFC796B822F03D6835D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "263B4AFA89E4C6F9C6D4FED91F3D7CD3" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "876055AE7B3978CC3DFE9D780967BA39" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
$tags = @("Fallout 4 v1.10.980.0-14160910", "Fallout 4 v1.10.984.0-14349213", "BA2 v7 DDS")
Add-Hash -VariableName $var -Hash "C3A43DFD3BF6C09ADA9D89A285180A4E" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218554028
Add-Hash -VariableName $var -Hash "BEB76BF2D75349412501F84F41F6CB5A" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23240011
Add-Hash -VariableName $var -Hash "CB6FE2806E5B77B6D8C61EC5B1291817" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2709070014
Add-Hash -VariableName $var -Hash "542E2AA8C05791B192894C5AADD9F7B0" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2420982983
Add-Hash -VariableName $var -Hash "6807B2B5D67B5D8D6ACFE275FE7FE019" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2095724697
Add-Hash -VariableName $var -Hash "294E9393D6B607B323735D7DBEF9227D" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2005844637
Add-Hash -VariableName $var -Hash "6824F2C78B0DA120687E32FF23AC7155" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1965886787
Add-Hash -VariableName $var -Hash "6073B1E472BC454D17D06C1BCE186D76" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1399972840
Add-Hash -VariableName $var -Hash "ADBA32858CFC0BE55F970ACDD52B0E8A" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "06399E66F8E7A57313B9B673781E270F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "6E45F916E30EE33685D5B32990DAA022" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 866812818

$originalBa2Hashes.Keys | ForEach-Object {
    Write-Output "-----"
    Write-Output "$($_)"
    $originalBa2Hashes[$_] | ForEach-Object {
        $value = $_
        Write-Output "Hash: $($value.Hash)"
        Write-Output "Tags:"
        $value.Tags.GetEnumerator() | ForEach-Object { Write-Output "  $($_)" }
        Write-Output "FileName: $($value.FileName)"
        Write-Output "FileSize: $($value.FileSize)"
        Write-Output "Versions:"
        $value.Versions.GetEnumerator() | ForEach-Object { Write-Output "  $($_)" }
    }
}
