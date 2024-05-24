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


# file hashes
# -----------

# notes:
# power set maker: https://www.mathsisfun.com/sets/power-set-maker.html
# all hashes are created using the XXH128 hashing algorithm: https://github.com/Cyan4973/xxHash

Set-Variable "HashesVersion" -Value $(New-Object "System.Version" -ArgumentList @(1, 19, 0)) -Option Constant


# repack hashes
# -------------

$repack7zHashes = @{}; $var = "repack7zHashes"
$tags = "Performance"
Add-Hash -VariableName $var -Hash "A3F51AFFF865E12C82754BD6B4CFE140" -Tags $tags -FileName $repackFiles.Performance[0] -FileSize 10009580533
$tags = "Main"
Add-Hash -VariableName $var -Hash "F76DE0B8D27B0E95E724C964BD62CD46" -Tags $tags -FileName $repackFiles.Main[0] -FileSize 6461194212
Add-Hash -VariableName $var -Hash "EE83E4AAB02BB5193C7290D79A24B555" -Tags $tags -FileName $repackFiles.Main[1] -FileSize 8090229305
Add-Hash -VariableName $var -Hash "ED4F25B2082905995E9813B09EB17D41" -Tags $tags -FileName $repackFiles.Main[2] -FileSize 3100799827
$tags = "Quality"
Add-Hash -VariableName $var -Hash "AF0CC5FB5A7FE9D8552E7C024427690B" -Tags $tags -FileName $repackFiles.Quality[0] -FileSize 6992674100
Add-Hash -VariableName $var -Hash "4824ED1AEA87C5BEDBE6BFCB05FC10C4" -Tags $tags -FileName $repackFiles.Quality[1] -FileSize 8734052599
$tags = "VaultFix"
Add-Hash -VariableName $var -Hash "462CCB5F588AB927D1DCDDD8CFB37D9E" -Tags $tags -FileName $repackFiles.VaultFix[0] -FileSize 38494714
$tags = "Restyle"
Add-Hash -VariableName $var -Hash "E56C4AEC102852351754E8E0A18F073B" -Tags $tags -FileName $repackFiles.Restyle[0] -FileSize 642218542


# original ba2 hashes
# -------------------

$originalBa2Hashes = @{}; $var = "originalBa2Hashes"

# fallout 4 v1.10.163.0 (steam build ID 4460038), BA2 v1 DDS
$tags = @("Fallout 4 v1.10.163.0-4460038", "BA2 v1 DDS")
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

# fallout 4 v1.10.980.0 (steam build ID 14160910), downgraded archives
# fallout 4 v1.10.984.0 (steam build ID 14349213), downgraded archives
$tags = @("Fallout 4 v1.10.980.0-14160910", "Fallout 4 v1.10.984.0-14349213", "BA2 v1 DDS", "Archive Version Downgraded")
Add-Hash -VariableName $var -Hash "75289D96376A5059575F15EE95F40450" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218554028
Add-Hash -VariableName $var -Hash "D3483D6BC2D6B35C7FC7829C6CF2FBE8" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23240011
Add-Hash -VariableName $var -Hash "C99173ACF2275E409C411990D8A699E8" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2709070014
Add-Hash -VariableName $var -Hash "537F8EFB19BD7547642133FA1EA3828E" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2420982983
Add-Hash -VariableName $var -Hash "72FD60ABEE93C198A186EA2F5178D1A7" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2095724697
Add-Hash -VariableName $var -Hash "3DDADE1C09703682DA4262ED77B957E4" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2005844637
Add-Hash -VariableName $var -Hash "4E51171FE30F63B8FFC1A394DE6D7F8B" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1965886787
Add-Hash -VariableName $var -Hash "AEC86F6579F9292C826E9DF446B6E032" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1399972840
Add-Hash -VariableName $var -Hash "8B3745FF9BAB0884D459B4CA146C58CE" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "6659D79B9814231DA94CFD4E760AECF6" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "75EB48577844CA671A44AF40DF38987A" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 866812818


# alternate original ba2 hashes
# -----------------------------

$alternateOriginalBa2Hashes = @{}; $var = "alternateOriginalBa2Hashes"

# 4estgimp savrenx hd textures performance - https://www.nexusmods.com/fallout4/mods/72917
$tags = "4estGimp SavrenX HD Textures Performance v0.95"
Add-Hash -VariableName $var -Hash "09D35D26ED14DABCA46864B5E145D012" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2061961053
Add-Hash -VariableName $var -Hash "BDF52167EAB8CDEEF606D79A287D22AD" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2900367182
Add-Hash -VariableName $var -Hash "5F5C689F79183453B84D778A4E1A44E0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324716608
Add-Hash -VariableName $var -Hash "D600F147631DF0B7D3F02E56F3FDC95B" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950422
Add-Hash -VariableName $var -Hash "533A6DEB6C9D1EBD973730EEE9335E03" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "4CCE06449C78BF895BF605F69655F107" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "7FFD4699556C2A4369C973F1C90ECF24" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3646072952
Add-Hash -VariableName $var -Hash "7223C25EBB3671D072BD73EC022541FC" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4245009316
Add-Hash -VariableName $var -Hash "428632BF2FA07C9FC44BD0E5508A8D8D" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3319801089
Add-Hash -VariableName $var -Hash "5BE7BC97CD4267C84DA1F188B601059E" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2940848502
Add-Hash -VariableName $var -Hash "AEA09D714B8FEB5F2D36246E0865CAA5" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2627705549
Add-Hash -VariableName $var -Hash "A66FF81606E206EE531D669C3CEFA802" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1738122728
Add-Hash -VariableName $var -Hash "04AC9A6A498A847F85A2664877B19A3A" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "8D8C020721F88DE6CEE234643A4E853D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "0DC977C8DF66029CA50F54A533832E28" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1123053257

# luxor - https://www.nexusmods.com/fallout4/mods/52423
$tags = "Luxor HD v1.3"
Add-Hash -VariableName $var -Hash "D00B19398BCA98AEEDE5506FD492CAC8" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3931242963
Add-Hash -VariableName $var -Hash "3EE610C53F2D42C037676823C100BB6C" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 11835631688
Add-Hash -VariableName $var -Hash "AFC3A69FA1287D540D2B001437EA87D5" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 13182263248
Add-Hash -VariableName $var -Hash "1D0FB033EA67525AB9E46DCDE988CD90" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9923952890
Add-Hash -VariableName $var -Hash "D27CC736ED407EB29693C4146014726D" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8957936482
Add-Hash -VariableName $var -Hash "3C0D0FA500234B09BDF69FE696B4DF6E" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 6158553137
Add-Hash -VariableName $var -Hash "61A13DCDA8A28776D0F36B7CCB4E41F8" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 4007090596
$tags = "Luxor HD v1.2.2"
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "85A94D3DD71EA2F59E994085280F52F1" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 2828619274
$tags = "Luxor HD v1.2.1"
Add-Hash -VariableName $var -Hash "BBE4BD41D4622B1F8EE0D1CFDAEEFD20" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6177772631
$tags = "Luxor HD v1.2"
Add-Hash -VariableName $var -Hash "CF894CD2875396220E17596A00E81893" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 969911298
Add-Hash -VariableName $var -Hash "8498356E901F2354861B71CC629DCE8C" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 97174815
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413

# luxor 2k - https://www.nexusmods.com/fallout4/mods/65720
$tags = "Luxor HD 2k v1.01"
Add-Hash -VariableName $var -Hash "7F99E585BDBD6E59C3D3BA79F0712279" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7318298500
Add-Hash -VariableName $var -Hash "AB506DD6E8D124AEABFD9F04D9689874" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7844726751
$tags = "Luxor HD 2k v1.0"
Add-Hash -VariableName $var -Hash "8A461E55E6D2D0C26790454D45201A32" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2759899146
Add-Hash -VariableName $var -Hash "3FC77EF1D7FF04172A75F2E1107A2778" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 4431369170
Add-Hash -VariableName $var -Hash "A9A94E0975C2E2B0CE8AEEB33E56535E" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 759263226
Add-Hash -VariableName $var -Hash "E60E4CAC0B481C768C9FDCA2391CCD04" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 91455361
Add-Hash -VariableName $var -Hash "C12E5588698B844C6604E6136FA097B6" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 416458978
Add-Hash -VariableName $var -Hash "000FDE77A478A9087E35C739FF07D1C9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 415789573
Add-Hash -VariableName $var -Hash "FE15E913E5541CCA4A10B512FFCCB37C" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 6597723809
Add-Hash -VariableName $var -Hash "AD3A1ACF58506F62F67C4215CC3A8B9B" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 5826142618
Add-Hash -VariableName $var -Hash "35366B7CBDB481BE6D4987899D4A3597" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3961376510
Add-Hash -VariableName $var -Hash "86CC31A6CA9FF1660F41EAA65FB18AC0" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3439025621
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "BA5F7DC96C805E91C02DC158A15655F4" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1517261752

# phyop - https://www.nexusmods.com/fallout4/mods/27038
# phyop custom
$tags = "PhyOp (Custom) v1.2a"
Add-Hash -VariableName $var -Hash "6BC488BBFF163EC3213DAF7967741DAB" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 512633081
Add-Hash -VariableName $var -Hash "4D2483329177ACB98243EADA2CB96893" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 780732486
Add-Hash -VariableName $var -Hash "22BB3AC4D1A0A3D7A701A7460813F150" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 110632688
Add-Hash -VariableName $var -Hash "B92690AF9A799C36A23815992073B5AA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 9105437
Add-Hash -VariableName $var -Hash "FF97AD55107DFC6BBA182A494D5E73D6" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 52828904
Add-Hash -VariableName $var -Hash "230C7FD536D578489A0ADC46ABC5E59D" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 66139601
Add-Hash -VariableName $var -Hash "1DCD9A9BA7DC00CC62BE30336FEB048B" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 762439623
Add-Hash -VariableName $var -Hash "DECE0E0ABF66E0EB9C66AE6AC4A94313" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 771352465
Add-Hash -VariableName $var -Hash "A77B62E4F3BD2B84A33AA11A18F0E250" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 771707003
Add-Hash -VariableName $var -Hash "6CD5DB3DDBCA3092723A506B7ABAE274" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 771557172
Add-Hash -VariableName $var -Hash "CD6FFD08190D6C289352DF132CAE75EC" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 780478809
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop custom fixes
$tags = "PhyOp (Custom) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "D514A8F6A8F0E884780B130AE3D44D76" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 779539562
$tags = "PhyOp (Custom) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "FB67DC324B833A1DAD7F51CC5435A66E" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 771509760
$tags = "PhyOp (Custom) Street Sign Fix v1.2a"
Add-Hash -VariableName $var -Hash "413FB3DB9A9F35834A04909F31C31490" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 771391071
# phyop custom optionals
$tags = "PhyOp (Custom) Original Pip-boy v1.2a"
Add-Hash -VariableName $var -Hash "57C16358912D754701C4E9E991A5DDFA" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 764231243
$tags = "PhyOp (Custom) Original Weapon Colors v1.2a"
Add-Hash -VariableName $var -Hash "A3CA8011A767D2B97FED1D17D3121458" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 513577925
Add-Hash -VariableName $var -Hash "8555BC8AC272ED0B0171E42F7D4497A5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 783384665
Add-Hash -VariableName $var -Hash "823150DCA345D87EEE01EC22878AF543" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 111206336
Add-Hash -VariableName $var -Hash "A9E8E501075F7A758311639A8D1A2729" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790984461

# phyop custom performance
$tags = "PhyOp (Custom) Performance v1.2a"
Add-Hash -VariableName $var -Hash "1B36B2B445B95E9CD20713D4920ABDD8" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 444334531
Add-Hash -VariableName $var -Hash "CC81165AAF9E05495BFB191D5B723331" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 737482911
Add-Hash -VariableName $var -Hash "D0B8B0AB67A2EDD8A9BD6F3B4698AFF7" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 103911911
Add-Hash -VariableName $var -Hash "76F41F560B461F749E32571227E1B0FA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6122918
Add-Hash -VariableName $var -Hash "CFB66B3FEB29983BADB1DB9A1DCCE21A" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 50896734
Add-Hash -VariableName $var -Hash "089DA6F421F3EFE9C16981D048B541D7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 58442562
Add-Hash -VariableName $var -Hash "0211D811B46C4B6BC695D4C0CD566064" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 578760410
Add-Hash -VariableName $var -Hash "EC5A857B39C6E9D2931EE1E7E8250006" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 578759404
Add-Hash -VariableName $var -Hash "05F6C45EDF3BF7F7F952AC2829301004" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 578542512
Add-Hash -VariableName $var -Hash "F1249626175E6728814F5EC7D03D2298" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 574065007
Add-Hash -VariableName $var -Hash "C7DB418013E4A1A656798754F45D8DFA" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 578570569
Add-Hash -VariableName $var -Hash "943A647F638537749204E2F1410BF65B" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 574898400
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop custom performance fixes
$tags = "PhyOp (Custom) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "EDB02F168D8159708C2BEDB69BA9AC47" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 586210313
$tags = "PhyOp (Custom) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "86EBCD012751EFCC8DAE471E51527479" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 578183976
# phyop custom performance optionals
$tags = "PhyOp (Custom) Performance Original Pip-boy v1.2a"
Add-Hash -VariableName $var -Hash "5A617CE9649DDDC31353FC8350067B0A" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 579247007

# phyop dark
$tags = "PhyOp (Dark) v1.2a"
Add-Hash -VariableName $var -Hash "4BF0C1286297DC4056CB9BC7B8CAF2DA" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 517274776
Add-Hash -VariableName $var -Hash "B959FF2C832B3280E5E727B372ADDDE7" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 787068439
Add-Hash -VariableName $var -Hash "8925BF32AAA2500BAB17D44DA687B290" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 112291371
Add-Hash -VariableName $var -Hash "A7BFA69D4A584E5B5ECE1A298B6697C3" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 9114240
Add-Hash -VariableName $var -Hash "DE566E3A2FED2AC26EEBEE222E2BF6CC" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 53068669
Add-Hash -VariableName $var -Hash "230C7FD536D578489A0ADC46ABC5E59D" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 66139601
Add-Hash -VariableName $var -Hash "EB0429ADBB6003C5742FBC260BF69537" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 768319999
Add-Hash -VariableName $var -Hash "2C3C1E0A0C0352DAB72990E53B4CE70C" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 777073114
Add-Hash -VariableName $var -Hash "596EB7E170C60DA3E4B05F22FBA8A203" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 776977378
Add-Hash -VariableName $var -Hash "C482CAC8076AB416C7BCD1F7D28231C4" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 776966421
Add-Hash -VariableName $var -Hash "634C5A23750D73D471F761D617EC2E32" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 783536775
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop dark fixes
$tags = "PhyOp (Dark) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "80D772F003E7AF9E0FC36C3CB94E94EC" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 784283020
$tags = "PhyOp (Dark) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "6A5C7251028CF6D4055E90DF5103F6BB" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 775855328
$tags = "PhyOp (Dark) Street Sign Fix v1.2a"
Add-Hash -VariableName $var -Hash "2A0A8722D60FA94FBB73FB1FBC20A7DC" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 776224807

# phyop dark performance
$tags = "PhyOp (Dark) Performance v1.2a"
Add-Hash -VariableName $var -Hash "8047F084F6E52C601D73A76DB3728153" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 448985169
Add-Hash -VariableName $var -Hash "C277BEE77D54273F6E125CF69DFC138D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 743818864
Add-Hash -VariableName $var -Hash "582EA3088709BFF205BCD5EBEC4BD487" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 105570594
Add-Hash -VariableName $var -Hash "4DEB347EAF5219DB6082D259BFA89B07" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6131721
Add-Hash -VariableName $var -Hash "E10893C519C48684534B945690DBE852" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 51136499
Add-Hash -VariableName $var -Hash "089DA6F421F3EFE9C16981D048B541D7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 58442562
Add-Hash -VariableName $var -Hash "276DB84129088ED986618E862D56FEE7" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 582903646
Add-Hash -VariableName $var -Hash "C30F7DD5B2D648EDC8A18E1191F9CCA7" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 582654477
Add-Hash -VariableName $var -Hash "C8E1BB2EF28D9AA84265435814615F2C" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 582773715
Add-Hash -VariableName $var -Hash "378220BA997686ADC1D784647AD6AA12" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 578372318
Add-Hash -VariableName $var -Hash "E34920089749018603CD7576A68161F9" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 582987647
Add-Hash -VariableName $var -Hash "444EFB2C4D54B96AF2A80BF9A5577B3B" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 576430430
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop dark performance fixes
$tags = "PhyOp (Dark) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "530E676CBCD1300249FED04906C4AC8B" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 590800088
$tags = "PhyOp (Dark) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "59DF389440E649967F29B92E5EDC30EE" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 582985481

# phyop light
$tags = "PhyOp (Light) v1.2a"
Add-Hash -VariableName $var -Hash "EA833F01B383A792EC406F1CDE8D559A" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 524576192
Add-Hash -VariableName $var -Hash "D5F5CF5961EEFB8478172683668A48DD" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 790056884
Add-Hash -VariableName $var -Hash "956ED80304291D1C725D0DA94F684BD5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 113614388
Add-Hash -VariableName $var -Hash "B53628A7AC55CC7B37A3291F2DA74555" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 9537120
Add-Hash -VariableName $var -Hash "C4588A05148DE97BDA3C5508423F64D9" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 53820727
Add-Hash -VariableName $var -Hash "97D99D0303CAF39C5463FFAE1A61C6A7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 67472808
Add-Hash -VariableName $var -Hash "6DE68A9F2D8C8CFFA825EEB3D3E51A1A" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 723149180
Add-Hash -VariableName $var -Hash "28EB4345A67D7C07150B5C0F3097E7C2" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 731983789
Add-Hash -VariableName $var -Hash "581B912E08834E4294A2FD68D8FD25F5" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 730642914
Add-Hash -VariableName $var -Hash "C7D2294A07D32D2C2A73BF2EBA3F12B7" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 731416887
Add-Hash -VariableName $var -Hash "353EB3696AA60490C3D4AFE3061788B0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 731890643
Add-Hash -VariableName $var -Hash "2781E24536957119D13E1D0B17C58A1E" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 733365393
Add-Hash -VariableName $var -Hash "7DA61F4705765169D4FA1BF9E82FA800" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 469334706
# phyop light fixes
$tags = "PhyOp (Light) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "84BF041BB093082E1F739ED7A8F52A6C" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 739535126
$tags = "PhyOp (Light) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "B0DFAEA0721F53EAD469D5D33B4C5285" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 731919830

# phyop light performance
$tags = "PhyOp (Light) Performance v1.2a"
Add-Hash -VariableName $var -Hash "68D30536D31748AC291283BC679C433A" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 447696180
Add-Hash -VariableName $var -Hash "5474424AC0925E33E5C3321E899AC522" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 733354731
Add-Hash -VariableName $var -Hash "4D709CD71FC72E8E010449FB5BAA74AF" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 106647866
Add-Hash -VariableName $var -Hash "12C41DD7FA19EA41E9EB48CCB4557035" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6205809
Add-Hash -VariableName $var -Hash "C12D6006523EDCA9BB804795820CC722" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 51814475
Add-Hash -VariableName $var -Hash "2023DB20CB1ED663BCC645C184F6DDCE" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 59393188
Add-Hash -VariableName $var -Hash "21C70A674B56AED89CD883C695D1A55E" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 535874000
Add-Hash -VariableName $var -Hash "9577833AF228E7D43109D701124443E5" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 557412803
Add-Hash -VariableName $var -Hash "4F8BA96E23EEDFBB975B6C1F5BEF6311" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 556997111
Add-Hash -VariableName $var -Hash "4696B06B380CDD4BDF6135DED498B9CE" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 557792514
Add-Hash -VariableName $var -Hash "8ED07CE0D10334E87BDA17CC8EB2F976" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 557828422
Add-Hash -VariableName $var -Hash "D3BF8D5376EBA735C3A32F8B0EE0EA84" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 555878981
Add-Hash -VariableName $var -Hash "7DA61F4705765169D4FA1BF9E82FA800" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 469334706
# phyop light performance fixes
$tags = "PhyOp (Light) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "9A1369818CF348493F7E754AB3F1835E" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 565509374
$tags = "PhyOp (Light) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "99E0F2352AD734B3C26E9FB9089913F5" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 558010589

# phyop light potato
$tags = "PhyOp (Light) Potato v1.2a"
Add-Hash -VariableName $var -Hash "1B8F1D243010B68E9D38327635C556C1" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 341890958
Add-Hash -VariableName $var -Hash "DE4B7177A4134717CB02705B2C23A069" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 663941597
Add-Hash -VariableName $var -Hash "74BD3100A17E48790AEA6C8A8D6D28BA" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 62890762
Add-Hash -VariableName $var -Hash "12C41DD7FA19EA41E9EB48CCB4557035" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6205809
Add-Hash -VariableName $var -Hash "CDC7971591EE0B2A4160D84CF1FE7709" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 48841304
Add-Hash -VariableName $var -Hash "EAFEAEBBA5260BF0B2B0A2FEC4C29EFB" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 58758258
Add-Hash -VariableName $var -Hash "A7325F7F823926B9627929578C896B4C" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 438227066
Add-Hash -VariableName $var -Hash "F22C71566EF14B95B42B8B3933BE1467" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 438197635
Add-Hash -VariableName $var -Hash "430C67D6BA2343F15A6F65BBD126F84E" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 437998976
Add-Hash -VariableName $var -Hash "B41CD06E1BC5CD5EC1C0CDFEC22D88B7" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 436958006
Add-Hash -VariableName $var -Hash "2DF07220B2A1D552F4D5AA3A899D30C6" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 438236013
Add-Hash -VariableName $var -Hash "253727141173E54C3CB628E6AE1EAE81" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 438068769
Add-Hash -VariableName $var -Hash "F17EB015E43EB344FB033AB39B02A0CD" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 436891898
Add-Hash -VariableName $var -Hash "7DA61F4705765169D4FA1BF9E82FA800" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 469334706
# phyop light potato fixes
$tags = "PhyOp (Light) Potato Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "EEB2DEC0B53178F91E64088C3BADC60A" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 438217732


# old alternate original ba2 hashes
# ---------------------------------

# note that in this case, 'old' means previous versions of alternate original BA2s

$oldAlternateOriginalBa2Hashes = @{}; $var = "oldAlternateOriginalBa2Hashes"

# luxor
$tags = "OLD - Luxor HD v1.2.2"
Add-Hash -VariableName $var -Hash "6D2F84F66FB10D4E99836358BCAF9A5B" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3821808828
Add-Hash -VariableName $var -Hash "DC58AD877A67202863C1079B7036CBD4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 11516956397
Add-Hash -VariableName $var -Hash "47D58B9797E1844A05C10CE4CAB0D42D" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 13098781334
Add-Hash -VariableName $var -Hash "95FB332A83C3D942D87ECB7D9BBE3FEC" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9795778864
Add-Hash -VariableName $var -Hash "BDB44D931032035ED428A46D8E8E57F0" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8917789555
Add-Hash -VariableName $var -Hash "95DDC341DA9314B498017D7FCECABE0B" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 6143455834
Add-Hash -VariableName $var -Hash "B19D8E7AE7CDE87D415EE2BA60B61A24" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3974712646
$tags = "OLD - Luxor HD v1.2.1"
Add-Hash -VariableName $var -Hash "0CC257DF59D36C5546E7FB3B47A29FAF" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3811217607
$tags = "OLD - Luxor HD v1.2"
Add-Hash -VariableName $var -Hash "83A4A077F089D3602DCB891EE2F18697" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3797888798
Add-Hash -VariableName $var -Hash "BBE4BD41D4622B1F8EE0D1CFDAEEFD20" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6177772631
Add-Hash -VariableName $var -Hash "CF894CD2875396220E17596A00E81893" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 969911298
Add-Hash -VariableName $var -Hash "8498356E901F2354861B71CC629DCE8C" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 97174815
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413
Add-Hash -VariableName $var -Hash "CB4C9F4FD462C2785873600A74371B1E" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 11491115571
Add-Hash -VariableName $var -Hash "293536BD59D9718628A010016DF3FBD8" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 13083071438
Add-Hash -VariableName $var -Hash "F7927B794AB2D2FA5AA4C28CC2E1C3AB" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9644627792
Add-Hash -VariableName $var -Hash "410FCE43A47607F7BAAC3D58740AE6F9" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8893336806
Add-Hash -VariableName $var -Hash "95DDC341DA9314B498017D7FCECABE0B" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 6143455834
Add-Hash -VariableName $var -Hash "A95EA7CD078049F90D62FD9BD2AA1782" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3965416485
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "85A94D3DD71EA2F59E994085280F52F1" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 2828619274
$tags = "OLD - Luxor HD v1.1"
Add-Hash -VariableName $var -Hash "99A5ED22EEFB9B66D0592817AF6B1FEC" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3797812759
Add-Hash -VariableName $var -Hash "F038C72799A1DE28C61C4C980F468AA6" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6078554867
Add-Hash -VariableName $var -Hash "9FF8D58DDBEB65596878F0A7F88C43EF" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 881055258
Add-Hash -VariableName $var -Hash "26C5AC5B8FB8511DD715F46A895DB855" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 87785806
Add-Hash -VariableName $var -Hash "CE8E5FF60A28B47B58F5F719BC5B7F01" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 10677631428
Add-Hash -VariableName $var -Hash "D06CA9021C777DC116DC08D7F468295F" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 12278683726
Add-Hash -VariableName $var -Hash "836297C3D1A0FC925722B31A06FF932E" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9350385956
Add-Hash -VariableName $var -Hash "64FFE96D2724CF94A3AD3F6B4AFB56C0" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8607956859
Add-Hash -VariableName $var -Hash "FB788B7A68C77844F432E062C23181B8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 6044966705
Add-Hash -VariableName $var -Hash "01B5CEA715DFE4EE744DB445F68F782F" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3848383044
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861
$tags = "OLD - Luxor HD v1.0"
Add-Hash -VariableName $var -Hash "964BA5ECFE155C349BEE8CCF9603024F" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3554621390
Add-Hash -VariableName $var -Hash "E67D3C67FF8B5ADEE9C633604BC264C0" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 4814582039
Add-Hash -VariableName $var -Hash "6DCD10EF721B8B0F05AB2C23E270C887" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 687344609
Add-Hash -VariableName $var -Hash "E330CBDF4A1A9745D95BAE26C049F2A8" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 82037945
Add-Hash -VariableName $var -Hash "CC3D7E65F4169164CC4D62D13A406DBE" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 435151965
Add-Hash -VariableName $var -Hash "3C655BE725A16CA08BCA732AF3DA74A0" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513736014
Add-Hash -VariableName $var -Hash "C93749CA4B84E86E4005E4E4899BFD14" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 8301831165
Add-Hash -VariableName $var -Hash "EAC0E30D96FBA800772581D548510ECD" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 9418687634
Add-Hash -VariableName $var -Hash "12C5A99210643E6C09FF7A05C1EBCC90" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 6949921110
Add-Hash -VariableName $var -Hash "786869D18828C5A0043198CA66DE7205" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 6143472577
Add-Hash -VariableName $var -Hash "0BA1F5778E0908256C5A1B2DF6010EE2" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 4920398010
Add-Hash -VariableName $var -Hash "3DA2B99F59A5BD5E2E640BA19703A4FC" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3050679922
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "5BB07A3A424D7727D863EDB207415B31" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 998505865
$tags = "OLD - Luxor HD v1.01"
Add-Hash -VariableName $var -Hash "5D38C5B935505B05368738F4C8C74C2F" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 8342753508
Add-Hash -VariableName $var -Hash "6548B84AA6920FAAEECF6C3576A9CE09" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 9447590468
Add-Hash -VariableName $var -Hash "4C24E3B62B5B6F66233C8659E7E7AC6C" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 6974153452
$tags = "OLD - Luxor HD v1.02"
Add-Hash -VariableName $var -Hash "CEC3D8979C333D9B99F3F3562E1010F8" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 8670903433
Add-Hash -VariableName $var -Hash "87C89ADD7D4B0FFF9BD325440B9DFE7C" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 7046129794
$tags = "OLD - Luxor HD v1.03"
Add-Hash -VariableName $var -Hash "C2BC6122C2F4449BBE75F788EA6DF4BE" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3830282750
Add-Hash -VariableName $var -Hash "F038C72799A1DE28C61C4C980F468AA6" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6078554867
Add-Hash -VariableName $var -Hash "B1D37F1024CC46EA6037DDEF40394DA4" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 816375969
Add-Hash -VariableName $var -Hash "26C5AC5B8FB8511DD715F46A895DB855" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 87785806
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413
Add-Hash -VariableName $var -Hash "4CE8A6FDA8335B81BB2D64D21B5863B3" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 9908839789
Add-Hash -VariableName $var -Hash "A81D5C9081EE0599024CA4754E987626" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 11944505236
Add-Hash -VariableName $var -Hash "3D8668E7C9FBABB7AAC88F24224CD598" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9263801651
Add-Hash -VariableName $var -Hash "50C09B08530487A67296D6BDC631CBEA" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8320531104
Add-Hash -VariableName $var -Hash "2DD20CD4FC4C0E9EA0ED360C5655D926" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 5425337665
Add-Hash -VariableName $var -Hash "68EE37873ED5036714A1DFE39533C06A" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3671418492
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861
$tags = "OLD - Luxor HD v1.04"
Add-Hash -VariableName $var -Hash "C2BC6122C2F4449BBE75F788EA6DF4BE" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 3830282750
Add-Hash -VariableName $var -Hash "F038C72799A1DE28C61C4C980F468AA6" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6078554867
Add-Hash -VariableName $var -Hash "B1D37F1024CC46EA6037DDEF40394DA4" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 816375969
Add-Hash -VariableName $var -Hash "26C5AC5B8FB8511DD715F46A895DB855" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 87785806
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413
Add-Hash -VariableName $var -Hash "6D653CEC227B462B18949F4C6ED52ED7" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 10117948940
Add-Hash -VariableName $var -Hash "E18588771CC5CE6107C20FF22BE57A82" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 12005788128
Add-Hash -VariableName $var -Hash "3D8668E7C9FBABB7AAC88F24224CD598" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9263801651
Add-Hash -VariableName $var -Hash "1F7623779E6E7C9EBF15B0F6C0F143A9" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8321765801
Add-Hash -VariableName $var -Hash "2DD20CD4FC4C0E9EA0ED360C5655D926" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 5425337665
Add-Hash -VariableName $var -Hash "4F8A89C53E67D465B797816BB085B1A6" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3750472759
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861
$tags = "OLD - Luxor HD v1.05"
Add-Hash -VariableName $var -Hash "618E79945AFE194898CA5C2062410643" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 10322256740
Add-Hash -VariableName $var -Hash "E30E85EE061C0B4E1FEE03897E866BBD" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 12091729319
Add-Hash -VariableName $var -Hash "9218D2B391687E0144508E1CDE228114" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 9281200727
Add-Hash -VariableName $var -Hash "35C81F90CFEA54A53C2F5E2C50209F75" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 8328782125
Add-Hash -VariableName $var -Hash "C74478F6A9162711B168CCC6EF49FB06" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 5983559576
Add-Hash -VariableName $var -Hash "1BB6534401083F04046F0B0D0B513DCE" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 3751726279
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861

# luxor 2k
$tags = "OLD - Luxor HD 2k v1.0"
Add-Hash -VariableName $var -Hash "7F99E585BDBD6E59C3D3BA79F0712279" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7318298500
Add-Hash -VariableName $var -Hash "AB506DD6E8D124AEABFD9F04D9689874" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7844726751

# phyop custom
$tags = "OLD - PhyOp (Custom) v1.2a"
Add-Hash -VariableName $var -Hash "5264C543B5CF8699C3C4DDA5EF8429D9" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 771646967
Add-Hash -VariableName $var -Hash "3EC43A1556FA4CF66A857EAD2E72BCDD" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 771487174
Add-Hash -VariableName $var -Hash "FCEF3118FD3063E2F56D8C4B86BA3DE0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 771220043

# phyop custom performance
$tags = "OLD - PhyOp (Custom) Performance v1.2a"
Add-Hash -VariableName $var -Hash "BCC027A3FFECB070AC1EEEDB0D1ED41E" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 578317718
Add-Hash -VariableName $var -Hash "DA065F3F3B831FB8ADBD2EF433A1140D" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 578161390

# phyop dark
$tags = "OLD - PhyOp (Dark) v1.2a"
Add-Hash -VariableName $var -Hash "C65F17AAD522B6F0E2DCBFE13E3F2F71" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 776399487
Add-Hash -VariableName $var -Hash "001D86D6FC7F5A872B1A0181AD324988" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 775832742
Add-Hash -VariableName $var -Hash "7DBBE85CAB73B1C777EE1AFB49E75928" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 776053779

# phyop dark performance
$tags = "OLD - PhyOp (Dark) Performance v1.2a"
Add-Hash -VariableName $var -Hash "95505D38F7E38F640707F0492206C296" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 582916555
Add-Hash -VariableName $var -Hash "8CBA74B813D41AC0C8B37194DBE78174" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 582962895

# phyop light
$tags = "OLD - PhyOp (Light) v1.2a"
Add-Hash -VariableName $var -Hash "60E4F3B42A377EC3F8EE5BC369A88A35" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 731629511
Add-Hash -VariableName $var -Hash "71E684B0FF29136548CE6419C640055E" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 731897244

# phyop light performance
$tags = "OLD - PhyOp (Light) Performance v1.2a"
Add-Hash -VariableName $var -Hash "E2DDD3BE054E056370F2B21F0DB55722" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 557603759
Add-Hash -VariableName $var -Hash "BB1EF2F8440E2209B8BB883F60B894A4" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 557988003

# phyop light potato
$tags = "OLD - PhyOp (Light) Potato v1.2a"
Add-Hash -VariableName $var -Hash "2604AABAB4FC200548D4AC63697A1664" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 438195146


# known bad file hashes
# ---------------------

$badPatchedFileHashes = @{}; $var = "badPatchedFileHashes"; $tags = "bad_file"
# # template
# Add-Hash -VariableName $var -Hash "" -Tags $tags -FileName ($dir.patchedFiles + "")

# SavrenX HD 1K Buildings and Interior v1.00 - https://www.nexusmods.com/fallout4/mods/40534
# some of these files are in the BRB main repack file 2, some are not
Add-Hash -VariableName $var -Hash "6AE384A193AE6E6D466CB0ABAC97FD08" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\BldgTrimDamage01_d.DDS")
Add-Hash -VariableName $var -Hash "CB1ED197717A163045BC977A4971C8DA" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\CinderBlockRustStains01_d.DDS")
Add-Hash -VariableName $var -Hash "04B41FE48A25E2E7903E157131B93EA9" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\Roofing01_d.DDS")
Add-Hash -VariableName $var -Hash "6A1151DA6441BF3479A187CC93AAC788" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\RoofMetal02_d.DDS")
Add-Hash -VariableName $var -Hash "20C91BFD175F52BAC62B1D79D7318E17" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01.DDS")
Add-Hash -VariableName $var -Hash "298C650731620C5E307139D50BADCFD9" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_d.DDS")
Add-Hash -VariableName $var -Hash "589DAAC0E33C037D2C8A18449E61FCD7" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_n.DDS")
Add-Hash -VariableName $var -Hash "278D57975A9572F4066C18F11ED65B20" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_s.DDS")
Add-Hash -VariableName $var -Hash "BDCFB6CE1859BF3B222EB84EEEA7FCF4" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02.DDS")
Add-Hash -VariableName $var -Hash "3390239EB8F41E27E522737227FB6691" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_d.DDS")
Add-Hash -VariableName $var -Hash "161AB0AAB2FDD2CB44C19F5CEB628436" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_n.DDS")
Add-Hash -VariableName $var -Hash "54708AFFC4E2CD2859D3A6E84CB95E22" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_s.DDS")
Add-Hash -VariableName $var -Hash "5A2DD81C1F4CE7E7FC2D2E774A0AAAF4" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01.DDS")
Add-Hash -VariableName $var -Hash "461CD4AB9F78E708D34AB547C0C807A5" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_d.DDS")
Add-Hash -VariableName $var -Hash "CD7A66AD3F27A7B21C3EA4A73BAB2B35" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_n.DDS")
Add-Hash -VariableName $var -Hash "C007E1CE88093DBBDA5E8284014628DD" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_s.DDS")
Add-Hash -VariableName $var -Hash "E884F2AB4DCBCB7A67DA97642160BC9B" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\Shacks\ShackPlywood02_d.DDS")
Add-Hash -VariableName $var -Hash "BAD67BDAD66B49FDBF4FADBA69063C37" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\Architecture\Unique\BunkerHillMonument\BHMarbleEdgeTrim01_d.DDS")
Add-Hash -VariableName $var -Hash "4F1B2317C37F7215E134153D621F72CC" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\Building\bldconcdamagegross02_d.DDS")
Add-Hash -VariableName $var -Hash "572572661D0B616E1E8F420CB835BCDE" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\Building\BldWindow01_d.DDS")
Add-Hash -VariableName $var -Hash "1AA02AB528F54AB1719E4EE895389AEB" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\Institute\InstitutePanel03_d.DDS")
Add-Hash -VariableName $var -Hash "A2B3925F18DB61443075CF9E8C5C6845" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled02Clinic_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "BEBC719323C6281B4EF78A0AC427C07B" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled04School02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "96B4F8E106106E6F723AACB60EAC4D88" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled04School_DAMAGE_d.DDS")
Add-Hash -VariableName $var -Hash "CA90F664E74D35EEDE6E140BA937AD14" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "FFDE1FE2E0DDB9D8B50E7071B361AF39" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "0C46868804B37655244E8809AAD5B263" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence03_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "4A48489BBD79FFB0C2585CFBFF75D31E" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence04_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "AB3565F31F6C134C257B10AE75152927" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence05Vintage_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "FDA55B29E309FBD76351BB20909E949B" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled06AdminBlue_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "3BA80A4C733D958A06778B1458761BC0" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "AC7F5A745C9C3C4BF78E6C5C2E878C70" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "77F46E76156F983D07CA675ED89D9B91" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "0171020D16828443A6BA230AC6B77BD3" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria03_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "2EED1F8C4261C56C88FE40EF07BCDCFD" -Tags $tags -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltSecretWindow01_d.DDS")


# patched ba2 hashes
# ------------------

$patchedBa2Hashes = @{}; $var = "patchedBa2Hashes"
$ba2Version = "BA2 v1 DDS"

# fallout 4 v1.10.163.0 (steam build ID 4460038)
$fo4Versions = @("Fallout 4 v1.10.163.0-4460038")

# unchanged
$tags = $fo4Versions + @($ba2Version, (@("Unchanged") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FD0E073FB252687D4F483DCCAE2A83F2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "AF8584E084EA13E59F78E4F52FA86241" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "1DEA43D8DA82F7A9BA69BD73D08DD4F1" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218569835
Add-Hash -VariableName $var -Hash "10E4310661A033C5823D32FB894D101C" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23234600
Add-Hash -VariableName $var -Hash "A8CEA2B208CCCC211FE7CEB311D39370" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "C9A120A41A0EA8A6D84D267A62B599C0" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "F9E05C8E3B14E01A578FFF2921C5AB56" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2703605715
Add-Hash -VariableName $var -Hash "CBCD5C02D4A3E1266ED41F94A50B2AC1" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2410629991
Add-Hash -VariableName $var -Hash "D194C02D10EF621659D6D3129950795B" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2101083744
Add-Hash -VariableName $var -Hash "BCF18D080BA2B778B847B9493A8E9F98" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 1999988681
Add-Hash -VariableName $var -Hash "6F19880F85CCA324F4017ECD6E7CBCAC" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1963767149
Add-Hash -VariableName $var -Hash "DDD6F3140E39FC64F7B388243354D117" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1382855876
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "36931517A5A3748DFCCB5BBC6A6DCD6F" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 864524837

# performance
$tags = $fo4Versions + @($ba2Version, (@("Performance") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "91F8F701330E78EECDE374C0130A31B3" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2566482954
Add-Hash -VariableName $var -Hash "56B0D0056C4B47ADF83B1ADB5F9A0E77" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2608707491
Add-Hash -VariableName $var -Hash "C05C84E6D5D9D3B2519FFD27B6EF6E00" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2206604163
Add-Hash -VariableName $var -Hash "4CA935AE3D89FFE035D47C84F9844E21" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2213053441
Add-Hash -VariableName $var -Hash "D9DECE1D9D4BCC6572838DA2CFDC0044" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2022006071
Add-Hash -VariableName $var -Hash "796228A4F34B43FDD408CD7446F94BF4" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1497954300
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# main
$tags = $fo4Versions + @($ba2Version, (@("Main") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "B0810EBD63C3BAEBC2E480B1E837E00B" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4502607073
Add-Hash -VariableName $var -Hash "80B5336EF659199E6CD4D1FFF15F8DD0" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3346703874
Add-Hash -VariableName $var -Hash "D0C2C4EEADD6C79E9BB67683634365E2" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3009575483
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "54096313C087EFD771EF0E84FEB6FB6C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1753195643
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# quality
$tags = $fo4Versions + @($ba2Version, (@("Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "A46CA2674EDAA4DFFF47BCF7ABBDF62F" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6961403753
Add-Hash -VariableName $var -Hash "D92A9E691C9766D7C5E60F39F239A078" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5787544100
Add-Hash -VariableName $var -Hash "FB23D9DC4895C76D0F510176DF0C6A1B" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4210132333
Add-Hash -VariableName $var -Hash "E1187423B08EB9F15CD2C3AF0B744987" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3746824357
Add-Hash -VariableName $var -Hash "B186726FD4FFDE260DCF90F868A504AD" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3324943551
Add-Hash -VariableName $var -Hash "72994760471A887345044322E7E7D394" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2034225086
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# restyle
$tags = $fo4Versions + @($ba2Version, (@("Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FD0E073FB252687D4F483DCCAE2A83F2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "AF8584E084EA13E59F78E4F52FA86241" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "1DEA43D8DA82F7A9BA69BD73D08DD4F1" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218569835
Add-Hash -VariableName $var -Hash "10E4310661A033C5823D32FB894D101C" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23234600
Add-Hash -VariableName $var -Hash "A8CEA2B208CCCC211FE7CEB311D39370" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "C9A120A41A0EA8A6D84D267A62B599C0" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "F9E05C8E3B14E01A578FFF2921C5AB56" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2703605715
Add-Hash -VariableName $var -Hash "9EC1830F41E8C734EC9A87C36AAE04BC" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2455179317
Add-Hash -VariableName $var -Hash "AB046B87EB1326937E08D1A1C7FF82AD" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2305624116
Add-Hash -VariableName $var -Hash "3B2C7A384FB64E735E855A836962A308" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2004215272
Add-Hash -VariableName $var -Hash "5560DDE11343953367264D3BE60ACA9C" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1963657319
Add-Hash -VariableName $var -Hash "DFDC9EE401E0A543EC8D4490E554DCF5" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1389122918
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "36931517A5A3748DFCCB5BBC6A6DCD6F" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 864524837

# performance + main
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "F985EC30D91919F9ACB0307F1D388685" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4517660475
Add-Hash -VariableName $var -Hash "49489A7419F6C87DA4D11BD524052175" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3353601846
Add-Hash -VariableName $var -Hash "F419BF55F6D35CB198DD21311A656015" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3006946752
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "FDDC104CB62618445E78A0715D430131" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1810688101
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + quality
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "6322CBC230456EFED8236BA875CA8DF6" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7024138721
Add-Hash -VariableName $var -Hash "103434A85E2665C6009958CEFE31881B" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5958514979
Add-Hash -VariableName $var -Hash "500AAE9DE86C31F6CC4C1C43C2443269" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4300430149
Add-Hash -VariableName $var -Hash "457AD01686A90BA1B5A83E2C861424DB" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3875680603
Add-Hash -VariableName $var -Hash "60042CFAF4BD9759B94DF7B2DC62606E" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3337787537
Add-Hash -VariableName $var -Hash "17BD3762FD4AABF94B06C1043293C9E6" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2169499248
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# performance + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "9A2DECECACAB91E7A8FFC14A14E4D98D" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2574239238
Add-Hash -VariableName $var -Hash "56B0D0056C4B47ADF83B1ADB5F9A0E77" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2608707491
Add-Hash -VariableName $var -Hash "C05C84E6D5D9D3B2519FFD27B6EF6E00" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2206604163
Add-Hash -VariableName $var -Hash "EDC4E52BE43916582022C6318A93764A" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2214953285
Add-Hash -VariableName $var -Hash "D9DECE1D9D4BCC6572838DA2CFDC0044" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2022006071
Add-Hash -VariableName $var -Hash "F310DDB3C1DF7FE54C98D61C217ECD59" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1527622376
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# performance + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "91F8F701330E78EECDE374C0130A31B3" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2566482954
Add-Hash -VariableName $var -Hash "5970F36B70F8127E1FEE485CCA1000F7" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2649125881
Add-Hash -VariableName $var -Hash "681EACEB7F6B249773F83BEEF2BD9DD9" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2395632882
Add-Hash -VariableName $var -Hash "84FECF77FF6079F804AFF67D6D6CC8BF" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2213833218
Add-Hash -VariableName $var -Hash "A5EC733C950CEE6F12A984E3A9B749AE" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2021896241
Add-Hash -VariableName $var -Hash "FFEB1BF7057F1B50B0A4C5BA9B9D2B0E" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1503767805
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# main + quality
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "365F18A6738B62BA946858F9EDDE7B20" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7884075404
Add-Hash -VariableName $var -Hash "5215B3E63D8A84A4531E6485A27880B0" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7430056887
Add-Hash -VariableName $var -Hash "F231E9FE16E475ED9D149E359C114DB8" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5034642158
Add-Hash -VariableName $var -Hash "D52E8ECA33D287C68510F9923E2E989C" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4423582229
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "61C7BC2EC1BC7D9BC686CCE8A22B63FA" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2399116039
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# main + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Main", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "B0810EBD63C3BAEBC2E480B1E837E00B" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4502607073
Add-Hash -VariableName $var -Hash "80B5336EF659199E6CD4D1FFF15F8DD0" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3346703874
Add-Hash -VariableName $var -Hash "D0C2C4EEADD6C79E9BB67683634365E2" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3009575483
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "54096313C087EFD771EF0E84FEB6FB6C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1753195643
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# main + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "9524FDB3A22503A49F04EBF47A97B8C0" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4519689016
Add-Hash -VariableName $var -Hash "5832299B6C199CDF693EE980B16B6139" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3505516684
Add-Hash -VariableName $var -Hash "E2CA479A2AD2FE52C3A78F303D03C385" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3008410465
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "4276907D3A4A584E8C9E4CBB2E971552" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1757861584
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "ADA7A975C0F6603BECBB5EC5E0861E45" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6965120183
Add-Hash -VariableName $var -Hash "D92A9E691C9766D7C5E60F39F239A078" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5787544100
Add-Hash -VariableName $var -Hash "FB23D9DC4895C76D0F510176DF0C6A1B" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4210132333
Add-Hash -VariableName $var -Hash "9E774ECE6888480E2E319F8513EC49C4" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3748998816
Add-Hash -VariableName $var -Hash "B186726FD4FFDE260DCF90F868A504AD" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3324943551
Add-Hash -VariableName $var -Hash "18D2EAA9B886CE48447156B52BC798C9" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2066060086
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "A46CA2674EDAA4DFFF47BCF7ABBDF62F" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6961403753
Add-Hash -VariableName $var -Hash "37173460A7B481E93ED128E2C3C928D5" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5826160152
Add-Hash -VariableName $var -Hash "C9AD008871E02C82564A3263C96C9877" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4414672705
Add-Hash -VariableName $var -Hash "0906C29791130CFA0DE21332D155F9E8" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3751050948
Add-Hash -VariableName $var -Hash "5F13071E9E388D26683146A2094A4388" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3324833721
Add-Hash -VariableName $var -Hash "6E56C1064E9D07141889E607D71A215C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2040492128
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# performance + main + quality
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "CEC8E1A6A9D5B311C9A484355A7DB8FA" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7911030079
Add-Hash -VariableName $var -Hash "D24F8864C79275ACFF9EE31E9041431C" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7444751159
Add-Hash -VariableName $var -Hash "2DDD13A4417E11438746C79DEF185B49" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5041135506
Add-Hash -VariableName $var -Hash "BF6E7D931C5E247B3AEC5ED33AE23AC5" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4423868672
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "ACA08549321E443ED6B603ED12FFF34C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2456425165
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# performance + main + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "F985EC30D91919F9ACB0307F1D388685" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4517660475
Add-Hash -VariableName $var -Hash "49489A7419F6C87DA4D11BD524052175" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3353601846
Add-Hash -VariableName $var -Hash "F419BF55F6D35CB198DD21311A656015" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3006946752
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "FDDC104CB62618445E78A0715D430131" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1810688101
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + main + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "5EDCCFBA77D25DEE3561FCDE85C72BAD" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4534742418
Add-Hash -VariableName $var -Hash "D266E4FA75746A78876B029627C9F4BB" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3512414656
Add-Hash -VariableName $var -Hash "53C9854D49B66BA3CEAEA7ED0531AAB7" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3005781734
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "37DDD5873F908192EFB771785E5A7FA5" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1815354042
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "2F65BBC9B06D166ADFE180632B42B3A4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7027820199
Add-Hash -VariableName $var -Hash "103434A85E2665C6009958CEFE31881B" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5958514979
Add-Hash -VariableName $var -Hash "500AAE9DE86C31F6CC4C1C43C2443269" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4300430149
Add-Hash -VariableName $var -Hash "454910A3EAB2C34FAE9C07202CE3A38E" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3877580447
Add-Hash -VariableName $var -Hash "60042CFAF4BD9759B94DF7B2DC62606E" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3337787537
Add-Hash -VariableName $var -Hash "08E2B5B7AB74C1E9DA10BBC80258CA57" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2199167324
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# performance + quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "6322CBC230456EFED8236BA875CA8DF6" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7024138721
Add-Hash -VariableName $var -Hash "96B9C27B55A28037507335A73A358FC4" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5993449226
Add-Hash -VariableName $var -Hash "BC37205FEFE1C03466C68340827061F8" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4489458868
Add-Hash -VariableName $var -Hash "1631496FCE5FD541714CE5D81B1D2324" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3876460380
Add-Hash -VariableName $var -Hash "CC426AF777FD5480EE83353966142F71" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3337677707
Add-Hash -VariableName $var -Hash "459F31B524A3F1E8028D1DCBEC0D2201" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2175312753
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# performance + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "9A2DECECACAB91E7A8FFC14A14E4D98D" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2574239238
Add-Hash -VariableName $var -Hash "5970F36B70F8127E1FEE485CCA1000F7" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2649125881
Add-Hash -VariableName $var -Hash "681EACEB7F6B249773F83BEEF2BD9DD9" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2395632882
Add-Hash -VariableName $var -Hash "84FECF77FF6079F804AFF67D6D6CC8BF" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2213833218
Add-Hash -VariableName $var -Hash "A5EC733C950CEE6F12A984E3A9B749AE" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2021896241
Add-Hash -VariableName $var -Hash "5EFDF6B470F0E34534BBAFDDA04D8C37" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1533435881
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# main + quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "862F4878EE06209263CA8B0426ABB84D" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7886183113
Add-Hash -VariableName $var -Hash "5215B3E63D8A84A4531E6485A27880B0" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7430056887
Add-Hash -VariableName $var -Hash "F231E9FE16E475ED9D149E359C114DB8" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5034642158
Add-Hash -VariableName $var -Hash "D52E8ECA33D287C68510F9923E2E989C" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4423582229
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "61C7BC2EC1BC7D9BC686CCE8A22B63FA" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2399116039
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# main + quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "365F18A6738B62BA946858F9EDDE7B20" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7884075404
Add-Hash -VariableName $var -Hash "6CCBB568C22F37D42226A159CB37A16A" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7442390044
Add-Hash -VariableName $var -Hash "5F3A55D494630C4D0E71F883BF479063" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5193454968
Add-Hash -VariableName $var -Hash "8CE1763F1623346B05B04702F6380A31" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4422417211
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "EC78E514A44ED66D2CA8B4B4F2DB1742" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2403781980
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# main + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "9524FDB3A22503A49F04EBF47A97B8C0" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4519689016
Add-Hash -VariableName $var -Hash "5832299B6C199CDF693EE980B16B6139" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3505516684
Add-Hash -VariableName $var -Hash "E2CA479A2AD2FE52C3A78F303D03C385" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3008410465
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "4276907D3A4A584E8C9E4CBB2E971552" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1757861584
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "ADA7A975C0F6603BECBB5EC5E0861E45" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6965120183
Add-Hash -VariableName $var -Hash "37173460A7B481E93ED128E2C3C928D5" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5826160152
Add-Hash -VariableName $var -Hash "C9AD008871E02C82564A3263C96C9877" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4414672705
Add-Hash -VariableName $var -Hash "0906C29791130CFA0DE21332D155F9E8" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3751050948
Add-Hash -VariableName $var -Hash "5F13071E9E388D26683146A2094A4388" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3324833721
Add-Hash -VariableName $var -Hash "AD598B2AE13D499DA04ACFBDD551AC0B" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2072327128
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# performance + main + quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "42BBF431F36ACC89C1E5FC9FA29700BE" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7913137788
Add-Hash -VariableName $var -Hash "D24F8864C79275ACFF9EE31E9041431C" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7444751159
Add-Hash -VariableName $var -Hash "2DDD13A4417E11438746C79DEF185B49" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5041135506
Add-Hash -VariableName $var -Hash "BF6E7D931C5E247B3AEC5ED33AE23AC5" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4423868672
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "ACA08549321E443ED6B603ED12FFF34C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2456425165
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# performance + main + quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "CEC8E1A6A9D5B311C9A484355A7DB8FA" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7911030079
Add-Hash -VariableName $var -Hash "A319C74D45F702D0DA9A5326E5BD4F70" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7457084316
Add-Hash -VariableName $var -Hash "7A634961574C33C42E515433B67E5D11" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5199948316
Add-Hash -VariableName $var -Hash "C0B685D16DCD8BDDA3FE8395E09A5F76" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4422703654
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "3366A379355298C46F50134751F600FC" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2461091106
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# performance + main + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "5EDCCFBA77D25DEE3561FCDE85C72BAD" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4534742418
Add-Hash -VariableName $var -Hash "D266E4FA75746A78876B029627C9F4BB" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3512414656
Add-Hash -VariableName $var -Hash "53C9854D49B66BA3CEAEA7ED0531AAB7" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3005781734
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "37DDD5873F908192EFB771785E5A7FA5" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1815354042
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "2F65BBC9B06D166ADFE180632B42B3A4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7027820199
Add-Hash -VariableName $var -Hash "96B9C27B55A28037507335A73A358FC4" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5993449226
Add-Hash -VariableName $var -Hash "BC37205FEFE1C03466C68340827061F8" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4489458868
Add-Hash -VariableName $var -Hash "1631496FCE5FD541714CE5D81B1D2324" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3876460380
Add-Hash -VariableName $var -Hash "CC426AF777FD5480EE83353966142F71" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3337677707
Add-Hash -VariableName $var -Hash "D73AA2676C4F65E415DD3418498A8DEF" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2204980829
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# main + quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "862F4878EE06209263CA8B0426ABB84D" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7886183113
Add-Hash -VariableName $var -Hash "6CCBB568C22F37D42226A159CB37A16A" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7442390044
Add-Hash -VariableName $var -Hash "5F3A55D494630C4D0E71F883BF479063" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5193454968
Add-Hash -VariableName $var -Hash "8CE1763F1623346B05B04702F6380A31" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4422417211
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "EC78E514A44ED66D2CA8B4B4F2DB1742" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2403781980
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# performance + main + quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "42BBF431F36ACC89C1E5FC9FA29700BE" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7913137788
Add-Hash -VariableName $var -Hash "A319C74D45F702D0DA9A5326E5BD4F70" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7457084316
Add-Hash -VariableName $var -Hash "7A634961574C33C42E515433B67E5D11" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5199948316
Add-Hash -VariableName $var -Hash "C0B685D16DCD8BDDA3FE8395E09A5F76" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4422703654
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "3366A379355298C46F50134751F600FC" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2461091106
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# fallout 4 v1.10.980.0 (steam build ID 14160910)
# fallout 4 v1.10.984.0 (steam build ID 14349213)
$fo4Versions = @("Fallout 4 v1.10.980.0-14160910", "Fallout 4 v1.10.984.0-14349213")

# unchanged
$tags = $fo4Versions + @($ba2Version, (@("Unchanged") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FD0E073FB252687D4F483DCCAE2A83F2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "AF8584E084EA13E59F78E4F52FA86241" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "881862AD63608D7D208751B94FF9824F" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218554028
Add-Hash -VariableName $var -Hash "ABA6B0EA3F9DC7847CBF0A6638F4254E" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23240011
Add-Hash -VariableName $var -Hash "A8CEA2B208CCCC211FE7CEB311D39370" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "C9A120A41A0EA8A6D84D267A62B599C0" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "72ECA7D674D53D8517E2CAAC6611543B" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2709070014
Add-Hash -VariableName $var -Hash "37F66E222F8E92145F998CE06F8A8330" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2420982983
Add-Hash -VariableName $var -Hash "8ABF2F209A4BCBE59D3640EF551DBB9B" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2095724697
Add-Hash -VariableName $var -Hash "2CC378B0C7DA6F82A94F70FEE3E6DD6E" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2005844637
Add-Hash -VariableName $var -Hash "129316EEC37EFAAE0B7B753D56E63406" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1965886787
Add-Hash -VariableName $var -Hash "579E135D0BF26EE4CA060BBBFAB27D9A" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1399972840
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "9F3A975238B5FEB32F357CDBA87A3009" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 866812818

# performance
$tags = $fo4Versions + @($ba2Version, (@("Performance") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "3604E00931BCBE5DDF40519B4A93CA24" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164804315
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "DABBFF3C73FBD05B3B019B7CEEFAB6E9" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2573090562
Add-Hash -VariableName $var -Hash "C760E9D6A51D3371EBDD0200FE1CD630" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2619086798
Add-Hash -VariableName $var -Hash "31CDAEAA10C3652500E2D1966152A642" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2202574582
Add-Hash -VariableName $var -Hash "81CD60D47E8A842C776E40E9AC3702CA" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2218838230
Add-Hash -VariableName $var -Hash "7DA7558B97AF069EB117A5E7FB686868" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2024070108
Add-Hash -VariableName $var -Hash "B2B86BE9FE2EF685B9F229812C3C45BC" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1513602913
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "D3CDDA735E7C3D00B68CBCFD8196A075" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1049968729

# main
$tags = $fo4Versions + @($ba2Version, (@("Main") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AE8C3AC3ED647F3BD740E0B857F45B82" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324716608
Add-Hash -VariableName $var -Hash "70C9DF27F539131912F771EE3A85BBBA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950422
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "21E3826D3B3A82795195BE3B96654D98" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3805452544
Add-Hash -VariableName $var -Hash "BD0E32D720191A4F7E46835F3197A8A2" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4513963786
Add-Hash -VariableName $var -Hash "8135DE490908FB09F58AD8814DE118E7" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3354837608
Add-Hash -VariableName $var -Hash "D78DE101A368EA69C0EE5E76A0F6171A" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2999003848
Add-Hash -VariableName $var -Hash "4CD035E1ED6EDBE16E10F573F8B065D1" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2821688740
Add-Hash -VariableName $var -Hash "4D64C2E13413E7334568581F1343E78D" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1770742920
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "7F4140B5C7B2BCB3A5FE1A91B526EC32" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1125780647

# quality
$tags = $fo4Versions + @($ba2Version, (@("Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "D356453A98E67EDBAD81348585AD0C02" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232275340
Add-Hash -VariableName $var -Hash "D20A23DA94F1FB35BF352953BB271FEA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24027073
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "846882AB52AFB49B0B5BAEAC7F24FBF4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6983850722
Add-Hash -VariableName $var -Hash "9ED416030C9ED3D7AC9A59F46EC86E35" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5791592365
Add-Hash -VariableName $var -Hash "D4D9FF6718D47C6F8AFEC2BD36F7E957" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4215666084
Add-Hash -VariableName $var -Hash "B242F12B48107B58CAB803F07DF5F4E5" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3732414358
Add-Hash -VariableName $var -Hash "551BE3FE0464456E833466A396400FB6" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3323421888
Add-Hash -VariableName $var -Hash "6361B2A8EF30E12CB84720F58DB53B2D" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2055169817
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "330B01B07C88E7824719D42DC54A6937" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 881177246

# restyle
$tags = $fo4Versions + @($ba2Version, (@("Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FD0E073FB252687D4F483DCCAE2A83F2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "AF8584E084EA13E59F78E4F52FA86241" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "881862AD63608D7D208751B94FF9824F" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218554028
Add-Hash -VariableName $var -Hash "ABA6B0EA3F9DC7847CBF0A6638F4254E" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23240011
Add-Hash -VariableName $var -Hash "A8CEA2B208CCCC211FE7CEB311D39370" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "C9A120A41A0EA8A6D84D267A62B599C0" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "72ECA7D674D53D8517E2CAAC6611543B" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2709070014
Add-Hash -VariableName $var -Hash "CAE57C48420D5E1E7887820C8EAB8712" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2465599486
Add-Hash -VariableName $var -Hash "4D23E15A2AA77627198EF72790D1FC94" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2300548821
Add-Hash -VariableName $var -Hash "565E9348169D1F929DE60C5C97903DF2" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2010074907
Add-Hash -VariableName $var -Hash "3101A8914F3270E4AEE1D73B67FC2189" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 1965774440
Add-Hash -VariableName $var -Hash "3B952F9CCD65FBBEA67D3CD7B80933A6" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1406265426
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "9F3A975238B5FEB32F357CDBA87A3009" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 866812818

# performance + main
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "39935F56BACFFC85E14710FD925BCAC5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302285253
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "DA80B18FF984F9F139D6D0E6DF95714A" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3831873536
Add-Hash -VariableName $var -Hash "D4E9F1A34D5B579CD045CB754B40C315" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4529015308
Add-Hash -VariableName $var -Hash "87D4182BF64D8F44EA2858D6F2877790" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3361737154
Add-Hash -VariableName $var -Hash "801DF70BD11E9481468B4F5BCA024E1F" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2996380447
Add-Hash -VariableName $var -Hash "8F472E91C28590A0CB281392E813FAA3" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2814316100
Add-Hash -VariableName $var -Hash "FC663FAEDD2006F5524B0701C42158AE" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1826319101
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6DC230496C13BD8433BD0274620B76CC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1308936558

# performance + quality
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "AA58A873A0AAB337D55AC8366566A05D" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218623627
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "AD57E5CDAA7D00565AE5B85E38E02A4F" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7047216443
Add-Hash -VariableName $var -Hash "E7D0EDFE6FD42E38839B3D8985D77B71" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5962463218
Add-Hash -VariableName $var -Hash "25486BC58502858DEDF7469E3CB81452" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4307247943
Add-Hash -VariableName $var -Hash "523ECCBA86D4C02ABF7D765A2C242A3D" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3860741775
Add-Hash -VariableName $var -Hash "3EF154119DC1EEFD2902B4852C6330E4" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3336283550
Add-Hash -VariableName $var -Hash "F105F4E09B63AD89CE1107C30C1474A2" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2188695687
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "A25DD3D9FABDE3ADBF3840EBFEAD509A" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1064330495

# performance + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "3604E00931BCBE5DDF40519B4A93CA24" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164804315
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "C6676396F3D1D2BCD210C67462DAB017" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2580846846
Add-Hash -VariableName $var -Hash "C760E9D6A51D3371EBDD0200FE1CD630" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2619086798
Add-Hash -VariableName $var -Hash "31CDAEAA10C3652500E2D1966152A642" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2202574582
Add-Hash -VariableName $var -Hash "CB9C60A522FF7C27B4280A8A679AAB1C" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2220738074
Add-Hash -VariableName $var -Hash "7DA7558B97AF069EB117A5E7FB686868" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2024070108
Add-Hash -VariableName $var -Hash "A27DE61E24AACB104072E937DCDB7F91" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1543270989
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "D3CDDA735E7C3D00B68CBCFD8196A075" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1049968729

# performance + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "3604E00931BCBE5DDF40519B4A93CA24" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164804315
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "DABBFF3C73FBD05B3B019B7CEEFAB6E9" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2573090562
Add-Hash -VariableName $var -Hash "2D361FD3ED6D5D8577D0E55FFA8CAA19" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2659505188
Add-Hash -VariableName $var -Hash "1E363CF410ADCCE547E167DB9DBAD604" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2391603166
Add-Hash -VariableName $var -Hash "CBA09D1EC7ACC141690DD129AFC79ED7" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2219618007
Add-Hash -VariableName $var -Hash "DA6215EB3693A36BC0A878EF413E5263" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2023960278
Add-Hash -VariableName $var -Hash "62DFFDEED69C6ED230045960060D2518" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1519416418
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "D3CDDA735E7C3D00B68CBCFD8196A075" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1049968729

# main + quality
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "A174C482A80CEC02600813811AA00A41" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302685884
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "924FB8DF6EDEFDD3A07282DB9A3A8603" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7909681841
Add-Hash -VariableName $var -Hash "3E8B39317F005D0EB5228F1D2D580EC7" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7435245332
Add-Hash -VariableName $var -Hash "53963E08B5772F32D5DE92F90F51B521" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5050237575
Add-Hash -VariableName $var -Hash "BFB2D6541D156852C1CC21280EA6F2CB" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4395991142
Add-Hash -VariableName $var -Hash "694512B8B6D1C388D19454361300A1C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804450494
Add-Hash -VariableName $var -Hash "8AD68A2A438B266E7DFDE24289B7BA01" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2420198165
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "FF6A2B404940EF7E326636EEE97B5344" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1134728918

# main + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Main", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AE8C3AC3ED647F3BD740E0B857F45B82" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324716608
Add-Hash -VariableName $var -Hash "70C9DF27F539131912F771EE3A85BBBA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950422
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "21E3826D3B3A82795195BE3B96654D98" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3805452544
Add-Hash -VariableName $var -Hash "BD0E32D720191A4F7E46835F3197A8A2" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4513963786
Add-Hash -VariableName $var -Hash "8135DE490908FB09F58AD8814DE118E7" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3354837608
Add-Hash -VariableName $var -Hash "D78DE101A368EA69C0EE5E76A0F6171A" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2999003848
Add-Hash -VariableName $var -Hash "4CD035E1ED6EDBE16E10F573F8B065D1" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2821688740
Add-Hash -VariableName $var -Hash "4D64C2E13413E7334568581F1343E78D" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1770742920
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "7F4140B5C7B2BCB3A5FE1A91B526EC32" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1125780647

# main + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AE8C3AC3ED647F3BD740E0B857F45B82" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324716608
Add-Hash -VariableName $var -Hash "70C9DF27F539131912F771EE3A85BBBA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950422
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "21E3826D3B3A82795195BE3B96654D98" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3805452544
Add-Hash -VariableName $var -Hash "E304A170CCC08E5D03EBE11B5840F355" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4531045729
Add-Hash -VariableName $var -Hash "51E1C23D3B2ED4BE988DCBD9B65708EB" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3513650418
Add-Hash -VariableName $var -Hash "370E74F6AEA4A4C075C6DCE5CBA4BB7A" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2997838830
Add-Hash -VariableName $var -Hash "4CD035E1ED6EDBE16E10F573F8B065D1" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2821688740
Add-Hash -VariableName $var -Hash "FC2DCC39A202A0FABAA04F7658BF3D2C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1775408861
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "7F4140B5C7B2BCB3A5FE1A91B526EC32" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1125780647

# quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "D356453A98E67EDBAD81348585AD0C02" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232275340
Add-Hash -VariableName $var -Hash "D20A23DA94F1FB35BF352953BB271FEA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24027073
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "6EA5D5A0C22D27FA97521D6AE7EBD901" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6987567241
Add-Hash -VariableName $var -Hash "9ED416030C9ED3D7AC9A59F46EC86E35" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5791592365
Add-Hash -VariableName $var -Hash "D4D9FF6718D47C6F8AFEC2BD36F7E957" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4215666084
Add-Hash -VariableName $var -Hash "B1DEAFA2B55C00E8B00099B0E8F5F9FA" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3734586489
Add-Hash -VariableName $var -Hash "551BE3FE0464456E833466A396400FB6" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3323421888
Add-Hash -VariableName $var -Hash "A30353812E6DCBE06FE313D0FD900FAE" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2087001642
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "330B01B07C88E7824719D42DC54A6937" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 881177246

# quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "D356453A98E67EDBAD81348585AD0C02" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232275340
Add-Hash -VariableName $var -Hash "D20A23DA94F1FB35BF352953BB271FEA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24027073
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "846882AB52AFB49B0B5BAEAC7F24FBF4" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6983850722
Add-Hash -VariableName $var -Hash "E57054A9AC6E7A601A80A8FBF2525C44" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5830271960
Add-Hash -VariableName $var -Hash "B6C4687574B28B30290BA09D6896DAD5" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4420490208
Add-Hash -VariableName $var -Hash "EEA2ADAAE7984E9418DC9039320CEFC9" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3736644628
Add-Hash -VariableName $var -Hash "D791D15EE80CC5BC14953CBE8C9BC1DE" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3323309541
Add-Hash -VariableName $var -Hash "B4402C336718D3524FEFDA7FFF3A0D33" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2061462403
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "330B01B07C88E7824719D42DC54A6937" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 881177246

# performance + main + quality
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "148848D694E60CEF9F1606E7E7FBE07B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301071498
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "0A561774F052DE728935D4CC48B7AD6E" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7936642593
Add-Hash -VariableName $var -Hash "C1CBCF9381CBB75561B3F4078107F037" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7449945986
Add-Hash -VariableName $var -Hash "5D156FDB984190DD8894B1ED143FA8AA" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5056731462
Add-Hash -VariableName $var -Hash "F893E43064C6434FA734B16897FFD6DB" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4396280455
Add-Hash -VariableName $var -Hash "BB1A08A3049B5F08F852C0E43373E865" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3803446881
Add-Hash -VariableName $var -Hash "B6AF92AD21A4AD24FDA4BAE62BF39951" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2475599970
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6EC11D5F95152CB82040800EF4FA1B29" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1317882167

# performance + main + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "39935F56BACFFC85E14710FD925BCAC5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302285253
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "DA80B18FF984F9F139D6D0E6DF95714A" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3831873536
Add-Hash -VariableName $var -Hash "D4E9F1A34D5B579CD045CB754B40C315" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4529015308
Add-Hash -VariableName $var -Hash "87D4182BF64D8F44EA2858D6F2877790" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3361737154
Add-Hash -VariableName $var -Hash "801DF70BD11E9481468B4F5BCA024E1F" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2996380447
Add-Hash -VariableName $var -Hash "8F472E91C28590A0CB281392E813FAA3" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2814316100
Add-Hash -VariableName $var -Hash "FC663FAEDD2006F5524B0701C42158AE" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1826319101
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6DC230496C13BD8433BD0274620B76CC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1308936558

# performance + main + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "39935F56BACFFC85E14710FD925BCAC5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302285253
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "DA80B18FF984F9F139D6D0E6DF95714A" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3831873536
Add-Hash -VariableName $var -Hash "362C045D79984D6EE5A69C635606A3E8" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4546097251
Add-Hash -VariableName $var -Hash "DCB23C5634FC7197305B473DB6367328" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3520549964
Add-Hash -VariableName $var -Hash "90076AB7E3DC0E2B6001FC391F1DFE63" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2995215429
Add-Hash -VariableName $var -Hash "8F472E91C28590A0CB281392E813FAA3" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2814316100
Add-Hash -VariableName $var -Hash "3CD47C12081E61E6C2E56699E1B0F2DD" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1830985042
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6DC230496C13BD8433BD0274620B76CC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1308936558

# performance + quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "AA58A873A0AAB337D55AC8366566A05D" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218623627
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "4CB10BBC005F0913C784603207D79758" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7050897921
Add-Hash -VariableName $var -Hash "E7D0EDFE6FD42E38839B3D8985D77B71" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5962463218
Add-Hash -VariableName $var -Hash "25486BC58502858DEDF7469E3CB81452" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4307247943
Add-Hash -VariableName $var -Hash "276D50362436BABE7DE511B73B253659" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3862641619
Add-Hash -VariableName $var -Hash "3EF154119DC1EEFD2902B4852C6330E4" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3336283550
Add-Hash -VariableName $var -Hash "2F2382912C8AF6EC5264CBE772899F7D" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2218363763
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "A25DD3D9FABDE3ADBF3840EBFEAD509A" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1064330495

# performance + quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "AA58A873A0AAB337D55AC8366566A05D" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218623627
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "AD57E5CDAA7D00565AE5B85E38E02A4F" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7047216443
Add-Hash -VariableName $var -Hash "157E668588E394111420E37D35D7D42E" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5997397465
Add-Hash -VariableName $var -Hash "049EA8BB6469B109A8D671C31E15FBA3" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4496276527
Add-Hash -VariableName $var -Hash "044E63E99B8226D766BAF2B0ADBC6738" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3861521552
Add-Hash -VariableName $var -Hash "A1AAB65DA080F37BF49E25E65A2EEA99" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3336173720
Add-Hash -VariableName $var -Hash "88CCB5A3080D4FE0EB32AD3ECB8FFBF0" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2194509192
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "A25DD3D9FABDE3ADBF3840EBFEAD509A" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1064330495

# performance + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "3604E00931BCBE5DDF40519B4A93CA24" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 164804315
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "C6676396F3D1D2BCD210C67462DAB017" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 2580846846
Add-Hash -VariableName $var -Hash "2D361FD3ED6D5D8577D0E55FFA8CAA19" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 2659505188
Add-Hash -VariableName $var -Hash "1E363CF410ADCCE547E167DB9DBAD604" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 2391603166
Add-Hash -VariableName $var -Hash "CBA09D1EC7ACC141690DD129AFC79ED7" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2219618007
Add-Hash -VariableName $var -Hash "DA6215EB3693A36BC0A878EF413E5263" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2023960278
Add-Hash -VariableName $var -Hash "85B3F27FD98DD6C5082B21953D9D081B" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1549084494
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "D3CDDA735E7C3D00B68CBCFD8196A075" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1049968729

# main + quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "A174C482A80CEC02600813811AA00A41" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302685884
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "64D02DEE098483E5D9D57479DE337F60" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7911789550
Add-Hash -VariableName $var -Hash "3E8B39317F005D0EB5228F1D2D580EC7" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7435245332
Add-Hash -VariableName $var -Hash "53963E08B5772F32D5DE92F90F51B521" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5050237575
Add-Hash -VariableName $var -Hash "BFB2D6541D156852C1CC21280EA6F2CB" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4395991142
Add-Hash -VariableName $var -Hash "694512B8B6D1C388D19454361300A1C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804450494
Add-Hash -VariableName $var -Hash "8AD68A2A438B266E7DFDE24289B7BA01" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2420198165
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "FF6A2B404940EF7E326636EEE97B5344" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1134728918

# main + quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "A174C482A80CEC02600813811AA00A41" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302685884
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "924FB8DF6EDEFDD3A07282DB9A3A8603" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7909681841
Add-Hash -VariableName $var -Hash "6C444E94B8BD5099002379D2965139ED" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7447578489
Add-Hash -VariableName $var -Hash "EF9A55879AB563219922AB01776097B3" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5209050385
Add-Hash -VariableName $var -Hash "44FFF77CC9B05C072D3BF61E946F28EC" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4394826124
Add-Hash -VariableName $var -Hash "694512B8B6D1C388D19454361300A1C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804450494
Add-Hash -VariableName $var -Hash "B1DCCBC36F84BB28DF12A4EBA154DFA9" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2424864106
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "FF6A2B404940EF7E326636EEE97B5344" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1134728918

# main + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AE8C3AC3ED647F3BD740E0B857F45B82" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 324716608
Add-Hash -VariableName $var -Hash "70C9DF27F539131912F771EE3A85BBBA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950422
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "21E3826D3B3A82795195BE3B96654D98" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3805452544
Add-Hash -VariableName $var -Hash "E304A170CCC08E5D03EBE11B5840F355" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4531045729
Add-Hash -VariableName $var -Hash "51E1C23D3B2ED4BE988DCBD9B65708EB" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3513650418
Add-Hash -VariableName $var -Hash "370E74F6AEA4A4C075C6DCE5CBA4BB7A" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2997838830
Add-Hash -VariableName $var -Hash "4CD035E1ED6EDBE16E10F573F8B065D1" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2821688740
Add-Hash -VariableName $var -Hash "FC2DCC39A202A0FABAA04F7658BF3D2C" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1775408861
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "7F4140B5C7B2BCB3A5FE1A91B526EC32" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1125780647

# quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "D356453A98E67EDBAD81348585AD0C02" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 232275340
Add-Hash -VariableName $var -Hash "D20A23DA94F1FB35BF352953BB271FEA" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24027073
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "6EA5D5A0C22D27FA97521D6AE7EBD901" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 6987567241
Add-Hash -VariableName $var -Hash "E57054A9AC6E7A601A80A8FBF2525C44" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5830271960
Add-Hash -VariableName $var -Hash "B6C4687574B28B30290BA09D6896DAD5" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4420490208
Add-Hash -VariableName $var -Hash "EEA2ADAAE7984E9418DC9039320CEFC9" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3736644628
Add-Hash -VariableName $var -Hash "D791D15EE80CC5BC14953CBE8C9BC1DE" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3323309541
Add-Hash -VariableName $var -Hash "E4A261336C1D790387058B2F8A26E917" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2093294228
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "330B01B07C88E7824719D42DC54A6937" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 881177246

# performance + main + quality + vault fix
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality", "VaultFix") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "148848D694E60CEF9F1606E7E7FBE07B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301071498
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "9651DD4CE6FF3414B262DA729FAB6BAD" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7938750302
Add-Hash -VariableName $var -Hash "C1CBCF9381CBB75561B3F4078107F037" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7449945986
Add-Hash -VariableName $var -Hash "5D156FDB984190DD8894B1ED143FA8AA" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5056731462
Add-Hash -VariableName $var -Hash "F893E43064C6434FA734B16897FFD6DB" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4396280455
Add-Hash -VariableName $var -Hash "BB1A08A3049B5F08F852C0E43373E865" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3803446881
Add-Hash -VariableName $var -Hash "B6AF92AD21A4AD24FDA4BAE62BF39951" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2475599970
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6EC11D5F95152CB82040800EF4FA1B29" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1317882167

# performance + main + quality + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "148848D694E60CEF9F1606E7E7FBE07B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301071498
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "0A561774F052DE728935D4CC48B7AD6E" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7936642593
Add-Hash -VariableName $var -Hash "6F24D5381DC11396B04AFB6C7E4AF916" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7462279143
Add-Hash -VariableName $var -Hash "2A6ECF7ED31F481F9C13B1DCBFD502F3" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5215544272
Add-Hash -VariableName $var -Hash "422D3E81E1E07EB5B437B96C1537F89B" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4395115437
Add-Hash -VariableName $var -Hash "BB1A08A3049B5F08F852C0E43373E865" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3803446881
Add-Hash -VariableName $var -Hash "C0430D39F2B552FA31E606A8BD8BCB2E" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2480265911
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6EC11D5F95152CB82040800EF4FA1B29" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1317882167

# performance + main + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "39935F56BACFFC85E14710FD925BCAC5" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302285253
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "DA80B18FF984F9F139D6D0E6DF95714A" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 3831873536
Add-Hash -VariableName $var -Hash "362C045D79984D6EE5A69C635606A3E8" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 4546097251
Add-Hash -VariableName $var -Hash "DCB23C5634FC7197305B473DB6367328" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 3520549964
Add-Hash -VariableName $var -Hash "90076AB7E3DC0E2B6001FC391F1DFE63" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 2995215429
Add-Hash -VariableName $var -Hash "8F472E91C28590A0CB281392E813FAA3" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 2814316100
Add-Hash -VariableName $var -Hash "3CD47C12081E61E6C2E56699E1B0F2DD" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 1830985042
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6DC230496C13BD8433BD0274620B76CC" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1308936558

# performance + quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "AA58A873A0AAB337D55AC8366566A05D" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 218623627
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "4CB10BBC005F0913C784603207D79758" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7050897921
Add-Hash -VariableName $var -Hash "157E668588E394111420E37D35D7D42E" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 5997397465
Add-Hash -VariableName $var -Hash "049EA8BB6469B109A8D671C31E15FBA3" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 4496276527
Add-Hash -VariableName $var -Hash "044E63E99B8226D766BAF2B0ADBC6738" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 3861521552
Add-Hash -VariableName $var -Hash "A1AAB65DA080F37BF49E25E65A2EEA99" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3336173720
Add-Hash -VariableName $var -Hash "CA640A9BC8110BFFB0999EF49CB36E94" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2224177268
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "A25DD3D9FABDE3ADBF3840EBFEAD509A" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1064330495

# main + quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Main", "Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "A174C482A80CEC02600813811AA00A41" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 302685884
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "64D02DEE098483E5D9D57479DE337F60" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7911789550
Add-Hash -VariableName $var -Hash "6C444E94B8BD5099002379D2965139ED" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7447578489
Add-Hash -VariableName $var -Hash "EF9A55879AB563219922AB01776097B3" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5209050385
Add-Hash -VariableName $var -Hash "44FFF77CC9B05C072D3BF61E946F28EC" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4394826124
Add-Hash -VariableName $var -Hash "694512B8B6D1C388D19454361300A1C8" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3804450494
Add-Hash -VariableName $var -Hash "B1DCCBC36F84BB28DF12A4EBA154DFA9" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2424864106
Add-Hash -VariableName $var -Hash "D4BDF4329A065DFA338DB7F64EC2A2AF" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 547749609
Add-Hash -VariableName $var -Hash "CA04F0A551E60341965B9E5C29E6410D" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 603820524
Add-Hash -VariableName $var -Hash "FF6A2B404940EF7E326636EEE97B5344" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1134728918

# performance + main + quality + vault fix + restyle
$tags = $fo4Versions + @($ba2Version, (@("Performance", "Main", "Quality", "VaultFix", "Restyle") -join $TagJoiner))
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tags $tags -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tags $tags -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "148848D694E60CEF9F1606E7E7FBE07B" -Tags $tags -FileName $ba2Files.dlcRobotTextures -FileSize 301071498
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tags $tags -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tags $tags -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tags $tags -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "9651DD4CE6FF3414B262DA729FAB6BAD" -Tags $tags -FileName $ba2Files.fallout4Textures1 -FileSize 7938750302
Add-Hash -VariableName $var -Hash "6F24D5381DC11396B04AFB6C7E4AF916" -Tags $tags -FileName $ba2Files.fallout4Textures2 -FileSize 7462279143
Add-Hash -VariableName $var -Hash "2A6ECF7ED31F481F9C13B1DCBFD502F3" -Tags $tags -FileName $ba2Files.fallout4Textures3 -FileSize 5215544272
Add-Hash -VariableName $var -Hash "422D3E81E1E07EB5B437B96C1537F89B" -Tags $tags -FileName $ba2Files.fallout4Textures4 -FileSize 4395115437
Add-Hash -VariableName $var -Hash "BB1A08A3049B5F08F852C0E43373E865" -Tags $tags -FileName $ba2Files.fallout4Textures5 -FileSize 3803446881
Add-Hash -VariableName $var -Hash "C0430D39F2B552FA31E606A8BD8BCB2E" -Tags $tags -FileName $ba2Files.fallout4Textures6 -FileSize 2480265911
Add-Hash -VariableName $var -Hash "A12D2140FB116BB8947550E4BE100E46" -Tags $tags -FileName $ba2Files.fallout4Textures7 -FileSize 724661727
Add-Hash -VariableName $var -Hash "DCA6A49B3DB896809B1EF4DE08A3D89F" -Tags $tags -FileName $ba2Files.fallout4Textures8 -FileSize 792318550
Add-Hash -VariableName $var -Hash "6EC11D5F95152CB82040800EF4FA1B29" -Tags $tags -FileName $ba2Files.fallout4Textures9 -FileSize 1317882167
