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

Set-Variable "HashesVersion" -Value $(New-Object "System.Version" -ArgumentList @(1, 17, 0)) -Option Constant


# repack hashes
# -------------

$repack7zHashes = @{}; $var = "repack7zHashes"
$tag = "Performance"
Add-Hash -VariableName $var -Hash "A3F51AFFF865E12C82754BD6B4CFE140" -Tag $tag -FileName $repackFiles.Performance[0] -FileSize 10009580533
$tag = "Main"
Add-Hash -VariableName $var -Hash "F76DE0B8D27B0E95E724C964BD62CD46" -Tag $tag -FileName $repackFiles.Main[0] -FileSize 6461194212
Add-Hash -VariableName $var -Hash "EE83E4AAB02BB5193C7290D79A24B555" -Tag $tag -FileName $repackFiles.Main[1] -FileSize 8090229305
Add-Hash -VariableName $var -Hash "ED4F25B2082905995E9813B09EB17D41" -Tag $tag -FileName $repackFiles.Main[2] -FileSize 3100799827
$tag = "Quality"
Add-Hash -VariableName $var -Hash "AF0CC5FB5A7FE9D8552E7C024427690B" -Tag $tag -FileName $repackFiles.Quality[0] -FileSize 6992674100
Add-Hash -VariableName $var -Hash "4824ED1AEA87C5BEDBE6BFCB05FC10C4" -Tag $tag -FileName $repackFiles.Quality[1] -FileSize 8734052599
$tag = "Vault Fix"
Add-Hash -VariableName $var -Hash "462CCB5F588AB927D1DCDDD8CFB37D9E" -Tag $tag -FileName $repackFiles."Vault Fix"[0] -FileSize 38494714
$tag = "Restyle"
Add-Hash -VariableName $var -Hash "E56C4AEC102852351754E8E0A18F073B" -Tag $tag -FileName $repackFiles.Restyle[0] -FileSize 642218542


# original ba2 hashes
# -------------------

$originalBa2Hashes = @{}; $var = "originalBa2Hashes"
# vanilla v1.10.163.0 (steam build ID 4460038)
$tag = "Vanilla v1.10.163.0-4460038"
Add-Hash -VariableName $var -Hash "77197092BF0489AF49B36B30BE68D351" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "CBF1F969E35F5EFC796B822F03D6835D" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "C4F444B9006200C40C2B8009751B00A9" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218569835
Add-Hash -VariableName $var -Hash "E6A95CB6D79512E37F7B314147EA3B22" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23234600
Add-Hash -VariableName $var -Hash "263B4AFA89E4C6F9C6D4FED91F3D7CD3" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "876055AE7B3978CC3DFE9D780967BA39" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "8CF77A407E51D4A5B5CB5EFA944EBE64" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2703605715
Add-Hash -VariableName $var -Hash "FB4F8B0F792CF35F3D44206CA5BD54C2" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2410629991
Add-Hash -VariableName $var -Hash "BD3A5E523C3FB29AE5350B85C1450460" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2101083744
Add-Hash -VariableName $var -Hash "567309F67E9356239A37E5EE54EE68A1" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 1999988681
Add-Hash -VariableName $var -Hash "32A541DA99A4868B3B32501A29D26FDE" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 1963767149
Add-Hash -VariableName $var -Hash "3EF465B58F3450A04BC38285CAB528C2" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1382855876
Add-Hash -VariableName $var -Hash "74F68AFE1B2E0AE118990FF7EC047C8E" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "5CC90CF3AFD30681C2901B0C187C162C" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "20697A2177195BBB0C86BAD7A6697CC3" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 864524837


# alternate original ba2 hashes
# -----------------------------

$alternateOriginalBa2Hashes = @{}; $var = "alternateOriginalBa2Hashes"

# luxor - https://www.nexusmods.com/fallout4/mods/52423
$tag = "Luxor HD v1.3"
Add-Hash -VariableName $var -Hash "D00B19398BCA98AEEDE5506FD492CAC8" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3931242963
Add-Hash -VariableName $var -Hash "3EE610C53F2D42C037676823C100BB6C" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 11835631688
Add-Hash -VariableName $var -Hash "AFC3A69FA1287D540D2B001437EA87D5" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 13182263248
Add-Hash -VariableName $var -Hash "1D0FB033EA67525AB9E46DCDE988CD90" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9923952890
Add-Hash -VariableName $var -Hash "D27CC736ED407EB29693C4146014726D" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8957936482
Add-Hash -VariableName $var -Hash "3C0D0FA500234B09BDF69FE696B4DF6E" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 6158553137
Add-Hash -VariableName $var -Hash "61A13DCDA8A28776D0F36B7CCB4E41F8" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 4007090596
$tag = "Luxor HD v1.2.2"
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "85A94D3DD71EA2F59E994085280F52F1" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 2828619274
$tag = "Luxor HD v1.2.1"
Add-Hash -VariableName $var -Hash "BBE4BD41D4622B1F8EE0D1CFDAEEFD20" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6177772631
$tag = "Luxor HD v1.2"
Add-Hash -VariableName $var -Hash "CF894CD2875396220E17596A00E81893" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 969911298
Add-Hash -VariableName $var -Hash "8498356E901F2354861B71CC629DCE8C" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 97174815
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413

# luxor 2k - https://www.nexusmods.com/fallout4/mods/65720
$tag = "Luxor HD 2k v1.01"
Add-Hash -VariableName $var -Hash "7F99E585BDBD6E59C3D3BA79F0712279" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7318298500
Add-Hash -VariableName $var -Hash "AB506DD6E8D124AEABFD9F04D9689874" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7844726751
$tag = "Luxor HD 2k v1.0"
Add-Hash -VariableName $var -Hash "8A461E55E6D2D0C26790454D45201A32" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2759899146
Add-Hash -VariableName $var -Hash "3FC77EF1D7FF04172A75F2E1107A2778" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 4431369170
Add-Hash -VariableName $var -Hash "A9A94E0975C2E2B0CE8AEEB33E56535E" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 759263226
Add-Hash -VariableName $var -Hash "E60E4CAC0B481C768C9FDCA2391CCD04" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 91455361
Add-Hash -VariableName $var -Hash "C12E5588698B844C6604E6136FA097B6" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 416458978
Add-Hash -VariableName $var -Hash "000FDE77A478A9087E35C739FF07D1C9" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 415789573
Add-Hash -VariableName $var -Hash "FE15E913E5541CCA4A10B512FFCCB37C" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 6597723809
Add-Hash -VariableName $var -Hash "AD3A1ACF58506F62F67C4215CC3A8B9B" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 5826142618
Add-Hash -VariableName $var -Hash "35366B7CBDB481BE6D4987899D4A3597" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3961376510
Add-Hash -VariableName $var -Hash "86CC31A6CA9FF1660F41EAA65FB18AC0" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3439025621
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "BA5F7DC96C805E91C02DC158A15655F4" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1517261752

# phyop - https://www.nexusmods.com/fallout4/mods/27038
# phyop custom
$tag = "PhyOp (Custom) v1.2a"
Add-Hash -VariableName $var -Hash "6BC488BBFF163EC3213DAF7967741DAB" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 512633081
Add-Hash -VariableName $var -Hash "4D2483329177ACB98243EADA2CB96893" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 780732486
Add-Hash -VariableName $var -Hash "22BB3AC4D1A0A3D7A701A7460813F150" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 110632688
Add-Hash -VariableName $var -Hash "B92690AF9A799C36A23815992073B5AA" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 9105437
Add-Hash -VariableName $var -Hash "FF97AD55107DFC6BBA182A494D5E73D6" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 52828904
Add-Hash -VariableName $var -Hash "230C7FD536D578489A0ADC46ABC5E59D" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 66139601
Add-Hash -VariableName $var -Hash "1DCD9A9BA7DC00CC62BE30336FEB048B" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 762439623
Add-Hash -VariableName $var -Hash "DECE0E0ABF66E0EB9C66AE6AC4A94313" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 771352465
Add-Hash -VariableName $var -Hash "A77B62E4F3BD2B84A33AA11A18F0E250" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 771707003
Add-Hash -VariableName $var -Hash "6CD5DB3DDBCA3092723A506B7ABAE274" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 771557172
Add-Hash -VariableName $var -Hash "CD6FFD08190D6C289352DF132CAE75EC" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 780478809
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop custom fixes
$tag = "PhyOp (Custom) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "D514A8F6A8F0E884780B130AE3D44D76" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 779539562
$tag = "PhyOp (Custom) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "FB67DC324B833A1DAD7F51CC5435A66E" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 771509760
$tag = "PhyOp (Custom) Street Sign Fix v1.2a"
Add-Hash -VariableName $var -Hash "413FB3DB9A9F35834A04909F31C31490" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 771391071
# phyop custom optionals
$tag = "PhyOp (Custom) Original Pip-boy v1.2a"
Add-Hash -VariableName $var -Hash "57C16358912D754701C4E9E991A5DDFA" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 764231243
$tag = "PhyOp (Custom) Original Weapon Colors v1.2a"
Add-Hash -VariableName $var -Hash "A3CA8011A767D2B97FED1D17D3121458" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 513577925
Add-Hash -VariableName $var -Hash "8555BC8AC272ED0B0171E42F7D4497A5" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 783384665
Add-Hash -VariableName $var -Hash "823150DCA345D87EEE01EC22878AF543" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 111206336
Add-Hash -VariableName $var -Hash "A9E8E501075F7A758311639A8D1A2729" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790984461

# phyop custom performance
$tag = "PhyOp (Custom) Performance v1.2a"
Add-Hash -VariableName $var -Hash "1B36B2B445B95E9CD20713D4920ABDD8" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 444334531
Add-Hash -VariableName $var -Hash "CC81165AAF9E05495BFB191D5B723331" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 737482911
Add-Hash -VariableName $var -Hash "D0B8B0AB67A2EDD8A9BD6F3B4698AFF7" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 103911911
Add-Hash -VariableName $var -Hash "76F41F560B461F749E32571227E1B0FA" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6122918
Add-Hash -VariableName $var -Hash "CFB66B3FEB29983BADB1DB9A1DCCE21A" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 50896734
Add-Hash -VariableName $var -Hash "089DA6F421F3EFE9C16981D048B541D7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 58442562
Add-Hash -VariableName $var -Hash "0211D811B46C4B6BC695D4C0CD566064" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 578760410
Add-Hash -VariableName $var -Hash "EC5A857B39C6E9D2931EE1E7E8250006" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 578759404
Add-Hash -VariableName $var -Hash "05F6C45EDF3BF7F7F952AC2829301004" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 578542512
Add-Hash -VariableName $var -Hash "F1249626175E6728814F5EC7D03D2298" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 574065007
Add-Hash -VariableName $var -Hash "C7DB418013E4A1A656798754F45D8DFA" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 578570569
Add-Hash -VariableName $var -Hash "943A647F638537749204E2F1410BF65B" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 574898400
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop custom performance fixes
$tag = "PhyOp (Custom) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "EDB02F168D8159708C2BEDB69BA9AC47" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 586210313
$tag = "PhyOp (Custom) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "86EBCD012751EFCC8DAE471E51527479" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 578183976
# phyop custom performance optionals
$tag = "PhyOp (Custom) Performance Original Pip-boy v1.2a"
Add-Hash -VariableName $var -Hash "5A617CE9649DDDC31353FC8350067B0A" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 579247007

# phyop dark
$tag = "PhyOp (Dark) v1.2a"
Add-Hash -VariableName $var -Hash "4BF0C1286297DC4056CB9BC7B8CAF2DA" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 517274776
Add-Hash -VariableName $var -Hash "B959FF2C832B3280E5E727B372ADDDE7" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 787068439
Add-Hash -VariableName $var -Hash "8925BF32AAA2500BAB17D44DA687B290" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 112291371
Add-Hash -VariableName $var -Hash "A7BFA69D4A584E5B5ECE1A298B6697C3" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 9114240
Add-Hash -VariableName $var -Hash "DE566E3A2FED2AC26EEBEE222E2BF6CC" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 53068669
Add-Hash -VariableName $var -Hash "230C7FD536D578489A0ADC46ABC5E59D" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 66139601
Add-Hash -VariableName $var -Hash "EB0429ADBB6003C5742FBC260BF69537" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 768319999
Add-Hash -VariableName $var -Hash "2C3C1E0A0C0352DAB72990E53B4CE70C" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 777073114
Add-Hash -VariableName $var -Hash "596EB7E170C60DA3E4B05F22FBA8A203" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 776977378
Add-Hash -VariableName $var -Hash "C482CAC8076AB416C7BCD1F7D28231C4" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 776966421
Add-Hash -VariableName $var -Hash "634C5A23750D73D471F761D617EC2E32" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 783536775
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop dark fixes
$tag = "PhyOp (Dark) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "80D772F003E7AF9E0FC36C3CB94E94EC" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 784283020
$tag = "PhyOp (Dark) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "6A5C7251028CF6D4055E90DF5103F6BB" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 775855328
$tag = "PhyOp (Dark) Street Sign Fix v1.2a"
Add-Hash -VariableName $var -Hash "2A0A8722D60FA94FBB73FB1FBC20A7DC" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 776224807

# phyop dark performance
$tag = "PhyOp (Dark) Performance v1.2a"
Add-Hash -VariableName $var -Hash "8047F084F6E52C601D73A76DB3728153" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 448985169
Add-Hash -VariableName $var -Hash "C277BEE77D54273F6E125CF69DFC138D" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 743818864
Add-Hash -VariableName $var -Hash "582EA3088709BFF205BCD5EBEC4BD487" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 105570594
Add-Hash -VariableName $var -Hash "4DEB347EAF5219DB6082D259BFA89B07" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6131721
Add-Hash -VariableName $var -Hash "E10893C519C48684534B945690DBE852" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 51136499
Add-Hash -VariableName $var -Hash "089DA6F421F3EFE9C16981D048B541D7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 58442562
Add-Hash -VariableName $var -Hash "276DB84129088ED986618E862D56FEE7" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 582903646
Add-Hash -VariableName $var -Hash "C30F7DD5B2D648EDC8A18E1191F9CCA7" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 582654477
Add-Hash -VariableName $var -Hash "C8E1BB2EF28D9AA84265435814615F2C" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 582773715
Add-Hash -VariableName $var -Hash "378220BA997686ADC1D784647AD6AA12" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 578372318
Add-Hash -VariableName $var -Hash "E34920089749018603CD7576A68161F9" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 582987647
Add-Hash -VariableName $var -Hash "444EFB2C4D54B96AF2A80BF9A5577B3B" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 576430430
Add-Hash -VariableName $var -Hash "3411C44228D0877E91165491CF0DFBA9" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 468883260
# phyop dark performance fixes
$tag = "PhyOp (Dark) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "530E676CBCD1300249FED04906C4AC8B" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 590800088
$tag = "PhyOp (Dark) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "59DF389440E649967F29B92E5EDC30EE" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 582985481

# phyop light
$tag = "PhyOp (Light) v1.2a"
Add-Hash -VariableName $var -Hash "EA833F01B383A792EC406F1CDE8D559A" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 524576192
Add-Hash -VariableName $var -Hash "D5F5CF5961EEFB8478172683668A48DD" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 790056884
Add-Hash -VariableName $var -Hash "956ED80304291D1C725D0DA94F684BD5" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 113614388
Add-Hash -VariableName $var -Hash "B53628A7AC55CC7B37A3291F2DA74555" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 9537120
Add-Hash -VariableName $var -Hash "C4588A05148DE97BDA3C5508423F64D9" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 53820727
Add-Hash -VariableName $var -Hash "97D99D0303CAF39C5463FFAE1A61C6A7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 67472808
Add-Hash -VariableName $var -Hash "6DE68A9F2D8C8CFFA825EEB3D3E51A1A" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 723149180
Add-Hash -VariableName $var -Hash "28EB4345A67D7C07150B5C0F3097E7C2" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 731983789
Add-Hash -VariableName $var -Hash "581B912E08834E4294A2FD68D8FD25F5" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 730642914
Add-Hash -VariableName $var -Hash "C7D2294A07D32D2C2A73BF2EBA3F12B7" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 731416887
Add-Hash -VariableName $var -Hash "353EB3696AA60490C3D4AFE3061788B0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 731890643
Add-Hash -VariableName $var -Hash "2781E24536957119D13E1D0B17C58A1E" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 733365393
Add-Hash -VariableName $var -Hash "7DA61F4705765169D4FA1BF9E82FA800" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 469334706
# phyop light fixes
$tag = "PhyOp (Light) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "84BF041BB093082E1F739ED7A8F52A6C" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 739535126
$tag = "PhyOp (Light) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "B0DFAEA0721F53EAD469D5D33B4C5285" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 731919830

# phyop light performance
$tag = "PhyOp (Light) Performance v1.2a"
Add-Hash -VariableName $var -Hash "68D30536D31748AC291283BC679C433A" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 447696180
Add-Hash -VariableName $var -Hash "5474424AC0925E33E5C3321E899AC522" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 733354731
Add-Hash -VariableName $var -Hash "4D709CD71FC72E8E010449FB5BAA74AF" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 106647866
Add-Hash -VariableName $var -Hash "12C41DD7FA19EA41E9EB48CCB4557035" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6205809
Add-Hash -VariableName $var -Hash "C12D6006523EDCA9BB804795820CC722" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 51814475
Add-Hash -VariableName $var -Hash "2023DB20CB1ED663BCC645C184F6DDCE" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 59393188
Add-Hash -VariableName $var -Hash "21C70A674B56AED89CD883C695D1A55E" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 535874000
Add-Hash -VariableName $var -Hash "9577833AF228E7D43109D701124443E5" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 557412803
Add-Hash -VariableName $var -Hash "4F8BA96E23EEDFBB975B6C1F5BEF6311" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 556997111
Add-Hash -VariableName $var -Hash "4696B06B380CDD4BDF6135DED498B9CE" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 557792514
Add-Hash -VariableName $var -Hash "8ED07CE0D10334E87BDA17CC8EB2F976" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 557828422
Add-Hash -VariableName $var -Hash "D3BF8D5376EBA735C3A32F8B0EE0EA84" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 555878981
Add-Hash -VariableName $var -Hash "7DA61F4705765169D4FA1BF9E82FA800" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 469334706
# phyop light performance fixes
$tag = "PhyOp (Light) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "9A1369818CF348493F7E754AB3F1835E" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 565509374
$tag = "PhyOp (Light) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "99E0F2352AD734B3C26E9FB9089913F5" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 558010589

# phyop light potato
$tag = "PhyOp (Light) Potato v1.2a"
Add-Hash -VariableName $var -Hash "1B8F1D243010B68E9D38327635C556C1" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 341890958
Add-Hash -VariableName $var -Hash "DE4B7177A4134717CB02705B2C23A069" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 663941597
Add-Hash -VariableName $var -Hash "74BD3100A17E48790AEA6C8A8D6D28BA" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 62890762
Add-Hash -VariableName $var -Hash "12C41DD7FA19EA41E9EB48CCB4557035" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 6205809
Add-Hash -VariableName $var -Hash "CDC7971591EE0B2A4160D84CF1FE7709" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 48841304
Add-Hash -VariableName $var -Hash "EAFEAEBBA5260BF0B2B0A2FEC4C29EFB" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 58758258
Add-Hash -VariableName $var -Hash "A7325F7F823926B9627929578C896B4C" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 438227066
Add-Hash -VariableName $var -Hash "F22C71566EF14B95B42B8B3933BE1467" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 438197635
Add-Hash -VariableName $var -Hash "430C67D6BA2343F15A6F65BBD126F84E" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 437998976
Add-Hash -VariableName $var -Hash "B41CD06E1BC5CD5EC1C0CDFEC22D88B7" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 436958006
Add-Hash -VariableName $var -Hash "2DF07220B2A1D552F4D5AA3A899D30C6" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 438236013
Add-Hash -VariableName $var -Hash "253727141173E54C3CB628E6AE1EAE81" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 438068769
Add-Hash -VariableName $var -Hash "F17EB015E43EB344FB033AB39B02A0CD" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 436891898
Add-Hash -VariableName $var -Hash "7DA61F4705765169D4FA1BF9E82FA800" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 469334706
# phyop light potato fixes
$tag = "PhyOp (Light) Potato Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "EEB2DEC0B53178F91E64088C3BADC60A" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 438217732


# old alternate original ba2 hashes
# ---------------------------------

# note that in this case, 'old' means previous versions of alternate original BA2s

$oldAlternateOriginalBa2Hashes = @{}; $var = "oldAlternateOriginalBa2Hashes"

# luxor
$tag = "OLD - Luxor HD v1.2.2"
Add-Hash -VariableName $var -Hash "6D2F84F66FB10D4E99836358BCAF9A5B" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3821808828
Add-Hash -VariableName $var -Hash "DC58AD877A67202863C1079B7036CBD4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 11516956397
Add-Hash -VariableName $var -Hash "47D58B9797E1844A05C10CE4CAB0D42D" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 13098781334
Add-Hash -VariableName $var -Hash "95FB332A83C3D942D87ECB7D9BBE3FEC" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9795778864
Add-Hash -VariableName $var -Hash "BDB44D931032035ED428A46D8E8E57F0" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8917789555
Add-Hash -VariableName $var -Hash "95DDC341DA9314B498017D7FCECABE0B" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 6143455834
Add-Hash -VariableName $var -Hash "B19D8E7AE7CDE87D415EE2BA60B61A24" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3974712646
$tag = "OLD - Luxor HD v1.2.1"
Add-Hash -VariableName $var -Hash "0CC257DF59D36C5546E7FB3B47A29FAF" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3811217607
$tag = "OLD - Luxor HD v1.2"
Add-Hash -VariableName $var -Hash "83A4A077F089D3602DCB891EE2F18697" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3797888798
Add-Hash -VariableName $var -Hash "BBE4BD41D4622B1F8EE0D1CFDAEEFD20" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6177772631
Add-Hash -VariableName $var -Hash "CF894CD2875396220E17596A00E81893" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 969911298
Add-Hash -VariableName $var -Hash "8498356E901F2354861B71CC629DCE8C" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 97174815
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413
Add-Hash -VariableName $var -Hash "CB4C9F4FD462C2785873600A74371B1E" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 11491115571
Add-Hash -VariableName $var -Hash "293536BD59D9718628A010016DF3FBD8" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 13083071438
Add-Hash -VariableName $var -Hash "F7927B794AB2D2FA5AA4C28CC2E1C3AB" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9644627792
Add-Hash -VariableName $var -Hash "410FCE43A47607F7BAAC3D58740AE6F9" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8893336806
Add-Hash -VariableName $var -Hash "95DDC341DA9314B498017D7FCECABE0B" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 6143455834
Add-Hash -VariableName $var -Hash "A95EA7CD078049F90D62FD9BD2AA1782" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3965416485
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "85A94D3DD71EA2F59E994085280F52F1" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 2828619274
$tag = "OLD - Luxor HD v1.1"
Add-Hash -VariableName $var -Hash "99A5ED22EEFB9B66D0592817AF6B1FEC" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3797812759
Add-Hash -VariableName $var -Hash "F038C72799A1DE28C61C4C980F468AA6" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6078554867
Add-Hash -VariableName $var -Hash "9FF8D58DDBEB65596878F0A7F88C43EF" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 881055258
Add-Hash -VariableName $var -Hash "26C5AC5B8FB8511DD715F46A895DB855" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 87785806
Add-Hash -VariableName $var -Hash "CE8E5FF60A28B47B58F5F719BC5B7F01" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 10677631428
Add-Hash -VariableName $var -Hash "D06CA9021C777DC116DC08D7F468295F" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 12278683726
Add-Hash -VariableName $var -Hash "836297C3D1A0FC925722B31A06FF932E" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9350385956
Add-Hash -VariableName $var -Hash "64FFE96D2724CF94A3AD3F6B4AFB56C0" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8607956859
Add-Hash -VariableName $var -Hash "FB788B7A68C77844F432E062C23181B8" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 6044966705
Add-Hash -VariableName $var -Hash "01B5CEA715DFE4EE744DB445F68F782F" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3848383044
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861
$tag = "OLD - Luxor HD v1.0"
Add-Hash -VariableName $var -Hash "964BA5ECFE155C349BEE8CCF9603024F" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3554621390
Add-Hash -VariableName $var -Hash "E67D3C67FF8B5ADEE9C633604BC264C0" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 4814582039
Add-Hash -VariableName $var -Hash "6DCD10EF721B8B0F05AB2C23E270C887" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 687344609
Add-Hash -VariableName $var -Hash "E330CBDF4A1A9745D95BAE26C049F2A8" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 82037945
Add-Hash -VariableName $var -Hash "CC3D7E65F4169164CC4D62D13A406DBE" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 435151965
Add-Hash -VariableName $var -Hash "3C655BE725A16CA08BCA732AF3DA74A0" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513736014
Add-Hash -VariableName $var -Hash "C93749CA4B84E86E4005E4E4899BFD14" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 8301831165
Add-Hash -VariableName $var -Hash "EAC0E30D96FBA800772581D548510ECD" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 9418687634
Add-Hash -VariableName $var -Hash "12C5A99210643E6C09FF7A05C1EBCC90" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 6949921110
Add-Hash -VariableName $var -Hash "786869D18828C5A0043198CA66DE7205" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 6143472577
Add-Hash -VariableName $var -Hash "0BA1F5778E0908256C5A1B2DF6010EE2" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 4920398010
Add-Hash -VariableName $var -Hash "3DA2B99F59A5BD5E2E640BA19703A4FC" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3050679922
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "5BB07A3A424D7727D863EDB207415B31" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 998505865
$tag = "OLD - Luxor HD v1.01"
Add-Hash -VariableName $var -Hash "5D38C5B935505B05368738F4C8C74C2F" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 8342753508
Add-Hash -VariableName $var -Hash "6548B84AA6920FAAEECF6C3576A9CE09" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 9447590468
Add-Hash -VariableName $var -Hash "4C24E3B62B5B6F66233C8659E7E7AC6C" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 6974153452
$tag = "OLD - Luxor HD v1.02"
Add-Hash -VariableName $var -Hash "CEC3D8979C333D9B99F3F3562E1010F8" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 8670903433
Add-Hash -VariableName $var -Hash "87C89ADD7D4B0FFF9BD325440B9DFE7C" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 7046129794
$tag = "OLD - Luxor HD v1.03"
Add-Hash -VariableName $var -Hash "C2BC6122C2F4449BBE75F788EA6DF4BE" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3830282750
Add-Hash -VariableName $var -Hash "F038C72799A1DE28C61C4C980F468AA6" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6078554867
Add-Hash -VariableName $var -Hash "B1D37F1024CC46EA6037DDEF40394DA4" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 816375969
Add-Hash -VariableName $var -Hash "26C5AC5B8FB8511DD715F46A895DB855" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 87785806
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413
Add-Hash -VariableName $var -Hash "4CE8A6FDA8335B81BB2D64D21B5863B3" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 9908839789
Add-Hash -VariableName $var -Hash "A81D5C9081EE0599024CA4754E987626" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 11944505236
Add-Hash -VariableName $var -Hash "3D8668E7C9FBABB7AAC88F24224CD598" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9263801651
Add-Hash -VariableName $var -Hash "50C09B08530487A67296D6BDC631CBEA" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8320531104
Add-Hash -VariableName $var -Hash "2DD20CD4FC4C0E9EA0ED360C5655D926" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 5425337665
Add-Hash -VariableName $var -Hash "68EE37873ED5036714A1DFE39533C06A" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3671418492
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861
$tag = "OLD - Luxor HD v1.04"
Add-Hash -VariableName $var -Hash "C2BC6122C2F4449BBE75F788EA6DF4BE" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 3830282750
Add-Hash -VariableName $var -Hash "F038C72799A1DE28C61C4C980F468AA6" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 6078554867
Add-Hash -VariableName $var -Hash "B1D37F1024CC46EA6037DDEF40394DA4" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 816375969
Add-Hash -VariableName $var -Hash "26C5AC5B8FB8511DD715F46A895DB855" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 87785806
Add-Hash -VariableName $var -Hash "4A802640F610E8165D1171D4D0211B58" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 486840325
Add-Hash -VariableName $var -Hash "DBD758FE9183387A05F578D6595B5ED7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 513805413
Add-Hash -VariableName $var -Hash "6D653CEC227B462B18949F4C6ED52ED7" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 10117948940
Add-Hash -VariableName $var -Hash "E18588771CC5CE6107C20FF22BE57A82" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 12005788128
Add-Hash -VariableName $var -Hash "3D8668E7C9FBABB7AAC88F24224CD598" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9263801651
Add-Hash -VariableName $var -Hash "1F7623779E6E7C9EBF15B0F6C0F143A9" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8321765801
Add-Hash -VariableName $var -Hash "2DD20CD4FC4C0E9EA0ED360C5655D926" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 5425337665
Add-Hash -VariableName $var -Hash "4F8A89C53E67D465B797816BB085B1A6" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3750472759
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861
$tag = "OLD - Luxor HD v1.05"
Add-Hash -VariableName $var -Hash "618E79945AFE194898CA5C2062410643" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 10322256740
Add-Hash -VariableName $var -Hash "E30E85EE061C0B4E1FEE03897E866BBD" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 12091729319
Add-Hash -VariableName $var -Hash "9218D2B391687E0144508E1CDE228114" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 9281200727
Add-Hash -VariableName $var -Hash "35C81F90CFEA54A53C2F5E2C50209F75" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 8328782125
Add-Hash -VariableName $var -Hash "C74478F6A9162711B168CCC6EF49FB06" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 5983559576
Add-Hash -VariableName $var -Hash "1BB6534401083F04046F0B0D0B513DCE" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 3751726279
Add-Hash -VariableName $var -Hash "EBE8F44787EB83E5EBD4386116D33132" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "00CD48C075095F2174D5186425522B7D" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0482C3CAF17057CD74296644CA8E9FFC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 2820836861

# luxor 2k
$tag = "OLD - Luxor HD 2k v1.0"
Add-Hash -VariableName $var -Hash "7F99E585BDBD6E59C3D3BA79F0712279" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7318298500
Add-Hash -VariableName $var -Hash "AB506DD6E8D124AEABFD9F04D9689874" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7844726751

# phyop custom
$tag = "OLD - PhyOp (Custom) v1.2a"
Add-Hash -VariableName $var -Hash "5264C543B5CF8699C3C4DDA5EF8429D9" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 771646967
Add-Hash -VariableName $var -Hash "3EC43A1556FA4CF66A857EAD2E72BCDD" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 771487174
Add-Hash -VariableName $var -Hash "FCEF3118FD3063E2F56D8C4B86BA3DE0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 771220043

# phyop custom performance
$tag = "OLD - PhyOp (Custom) Performance v1.2a"
Add-Hash -VariableName $var -Hash "BCC027A3FFECB070AC1EEEDB0D1ED41E" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 578317718
Add-Hash -VariableName $var -Hash "DA065F3F3B831FB8ADBD2EF433A1140D" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 578161390

# phyop dark
$tag = "OLD - PhyOp (Dark) v1.2a"
Add-Hash -VariableName $var -Hash "C65F17AAD522B6F0E2DCBFE13E3F2F71" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 776399487
Add-Hash -VariableName $var -Hash "001D86D6FC7F5A872B1A0181AD324988" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 775832742
Add-Hash -VariableName $var -Hash "7DBBE85CAB73B1C777EE1AFB49E75928" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 776053779

# phyop dark performance
$tag = "OLD - PhyOp (Dark) Performance v1.2a"
Add-Hash -VariableName $var -Hash "95505D38F7E38F640707F0492206C296" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 582916555
Add-Hash -VariableName $var -Hash "8CBA74B813D41AC0C8B37194DBE78174" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 582962895

# phyop light
$tag = "OLD - PhyOp (Light) v1.2a"
Add-Hash -VariableName $var -Hash "60E4F3B42A377EC3F8EE5BC369A88A35" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 731629511
Add-Hash -VariableName $var -Hash "71E684B0FF29136548CE6419C640055E" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 731897244

# phyop light performance
$tag = "OLD - PhyOp (Light) Performance v1.2a"
Add-Hash -VariableName $var -Hash "E2DDD3BE054E056370F2B21F0DB55722" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 557603759
Add-Hash -VariableName $var -Hash "BB1EF2F8440E2209B8BB883F60B894A4" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 557988003

# phyop light potato
$tag = "OLD - PhyOp (Light) Potato v1.2a"
Add-Hash -VariableName $var -Hash "2604AABAB4FC200548D4AC63697A1664" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 438195146


# known bad file hashes
# ---------------------

$badPatchedFileHashes = @{}; $var = "badPatchedFileHashes"; $tag = "bad_file"
# # template
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName ($dir.patchedFiles + "")

# SavrenX HD 1K Buildings and Interior v1.00 - https://www.nexusmods.com/fallout4/mods/40534
# some of these files are in the BRB main repack file 2, some are not
Add-Hash -VariableName $var -Hash "6AE384A193AE6E6D466CB0ABAC97FD08" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\BldgTrimDamage01_d.DDS")
Add-Hash -VariableName $var -Hash "CB1ED197717A163045BC977A4971C8DA" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\CinderBlockRustStains01_d.DDS")
Add-Hash -VariableName $var -Hash "04B41FE48A25E2E7903E157131B93EA9" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\Roofing01_d.DDS")
Add-Hash -VariableName $var -Hash "6A1151DA6441BF3479A187CC93AAC788" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\RoofMetal02_d.DDS")
Add-Hash -VariableName $var -Hash "20C91BFD175F52BAC62B1D79D7318E17" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01.DDS")
Add-Hash -VariableName $var -Hash "298C650731620C5E307139D50BADCFD9" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_d.DDS")
Add-Hash -VariableName $var -Hash "589DAAC0E33C037D2C8A18449E61FCD7" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_n.DDS")
Add-Hash -VariableName $var -Hash "278D57975A9572F4066C18F11ED65B20" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_s.DDS")
Add-Hash -VariableName $var -Hash "BDCFB6CE1859BF3B222EB84EEEA7FCF4" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02.DDS")
Add-Hash -VariableName $var -Hash "3390239EB8F41E27E522737227FB6691" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_d.DDS")
Add-Hash -VariableName $var -Hash "161AB0AAB2FDD2CB44C19F5CEB628436" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_n.DDS")
Add-Hash -VariableName $var -Hash "54708AFFC4E2CD2859D3A6E84CB95E22" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_s.DDS")
Add-Hash -VariableName $var -Hash "5A2DD81C1F4CE7E7FC2D2E774A0AAAF4" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01.DDS")
Add-Hash -VariableName $var -Hash "461CD4AB9F78E708D34AB547C0C807A5" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_d.DDS")
Add-Hash -VariableName $var -Hash "CD7A66AD3F27A7B21C3EA4A73BAB2B35" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_n.DDS")
Add-Hash -VariableName $var -Hash "C007E1CE88093DBBDA5E8284014628DD" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_s.DDS")
Add-Hash -VariableName $var -Hash "E884F2AB4DCBCB7A67DA97642160BC9B" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Shacks\ShackPlywood02_d.DDS")
Add-Hash -VariableName $var -Hash "BAD67BDAD66B49FDBF4FADBA69063C37" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Unique\BunkerHillMonument\BHMarbleEdgeTrim01_d.DDS")
Add-Hash -VariableName $var -Hash "4F1B2317C37F7215E134153D621F72CC" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\Building\bldconcdamagegross02_d.DDS")
Add-Hash -VariableName $var -Hash "572572661D0B616E1E8F420CB835BCDE" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\Building\BldWindow01_d.DDS")
Add-Hash -VariableName $var -Hash "1AA02AB528F54AB1719E4EE895389AEB" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\Institute\InstitutePanel03_d.DDS")
Add-Hash -VariableName $var -Hash "A2B3925F18DB61443075CF9E8C5C6845" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled02Clinic_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "BEBC719323C6281B4EF78A0AC427C07B" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled04School02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "96B4F8E106106E6F723AACB60EAC4D88" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled04School_DAMAGE_d.DDS")
Add-Hash -VariableName $var -Hash "CA90F664E74D35EEDE6E140BA937AD14" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "FFDE1FE2E0DDB9D8B50E7071B361AF39" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "0C46868804B37655244E8809AAD5B263" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence03_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "4A48489BBD79FFB0C2585CFBFF75D31E" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence04_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "AB3565F31F6C134C257B10AE75152927" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence05Vintage_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "FDA55B29E309FBD76351BB20909E949B" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled06AdminBlue_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "3BA80A4C733D958A06778B1458761BC0" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "AC7F5A745C9C3C4BF78E6C5C2E878C70" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "77F46E76156F983D07CA675ED89D9B91" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "0171020D16828443A6BA230AC6B77BD3" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria03_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "2EED1F8C4261C56C88FE40EF07BCDCFD" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltSecretWindow01_d.DDS")


# patched ba2 hashes
# ------------------

$patchedBa2Hashes = @{}; $var = "patchedBa2Hashes"

# unchanged
$tag = @("Unchanged") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FD0E073FB252687D4F483DCCAE2A83F2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "AF8584E084EA13E59F78E4F52FA86241" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "1DEA43D8DA82F7A9BA69BD73D08DD4F1" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218569835
Add-Hash -VariableName $var -Hash "10E4310661A033C5823D32FB894D101C" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23234600
Add-Hash -VariableName $var -Hash "A8CEA2B208CCCC211FE7CEB311D39370" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "C9A120A41A0EA8A6D84D267A62B599C0" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "F9E05C8E3B14E01A578FFF2921C5AB56" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2703605715
Add-Hash -VariableName $var -Hash "CBCD5C02D4A3E1266ED41F94A50B2AC1" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2410629991
Add-Hash -VariableName $var -Hash "D194C02D10EF621659D6D3129950795B" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2101083744
Add-Hash -VariableName $var -Hash "BCF18D080BA2B778B847B9493A8E9F98" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 1999988681
Add-Hash -VariableName $var -Hash "6F19880F85CCA324F4017ECD6E7CBCAC" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 1963767149
Add-Hash -VariableName $var -Hash "DDD6F3140E39FC64F7B388243354D117" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1382855876
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "36931517A5A3748DFCCB5BBC6A6DCD6F" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 864524837

# performance
$tag = @("Performance") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "91F8F701330E78EECDE374C0130A31B3" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2566482954
Add-Hash -VariableName $var -Hash "56B0D0056C4B47ADF83B1ADB5F9A0E77" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2608707491
Add-Hash -VariableName $var -Hash "C05C84E6D5D9D3B2519FFD27B6EF6E00" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2206604163
Add-Hash -VariableName $var -Hash "4CA935AE3D89FFE035D47C84F9844E21" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 2213053441
Add-Hash -VariableName $var -Hash "D9DECE1D9D4BCC6572838DA2CFDC0044" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2022006071
Add-Hash -VariableName $var -Hash "796228A4F34B43FDD408CD7446F94BF4" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1497954300
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# main
$tag = @("Main") -join $TagJoiner
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "B0810EBD63C3BAEBC2E480B1E837E00B" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4502607073
Add-Hash -VariableName $var -Hash "80B5336EF659199E6CD4D1FFF15F8DD0" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3346703874
Add-Hash -VariableName $var -Hash "D0C2C4EEADD6C79E9BB67683634365E2" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3009575483
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "54096313C087EFD771EF0E84FEB6FB6C" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1753195643
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# quality
$tag = @("Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "A46CA2674EDAA4DFFF47BCF7ABBDF62F" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 6961403753
Add-Hash -VariableName $var -Hash "D92A9E691C9766D7C5E60F39F239A078" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5787544100
Add-Hash -VariableName $var -Hash "FB23D9DC4895C76D0F510176DF0C6A1B" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4210132333
Add-Hash -VariableName $var -Hash "E1187423B08EB9F15CD2C3AF0B744987" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3746824357
Add-Hash -VariableName $var -Hash "B186726FD4FFDE260DCF90F868A504AD" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3324943551
Add-Hash -VariableName $var -Hash "72994760471A887345044322E7E7D394" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2034225086
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# restyle
$tag = @("Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FD0E073FB252687D4F483DCCAE2A83F2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1335731328
Add-Hash -VariableName $var -Hash "AF8584E084EA13E59F78E4F52FA86241" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2348553100
Add-Hash -VariableName $var -Hash "1DEA43D8DA82F7A9BA69BD73D08DD4F1" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218569835
Add-Hash -VariableName $var -Hash "10E4310661A033C5823D32FB894D101C" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 23234600
Add-Hash -VariableName $var -Hash "A8CEA2B208CCCC211FE7CEB311D39370" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 169146799
Add-Hash -VariableName $var -Hash "C9A120A41A0EA8A6D84D267A62B599C0" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208483596
Add-Hash -VariableName $var -Hash "F9E05C8E3B14E01A578FFF2921C5AB56" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2703605715
Add-Hash -VariableName $var -Hash "9EC1830F41E8C734EC9A87C36AAE04BC" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2455179317
Add-Hash -VariableName $var -Hash "AB046B87EB1326937E08D1A1C7FF82AD" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2305624116
Add-Hash -VariableName $var -Hash "3B2C7A384FB64E735E855A836962A308" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 2004215272
Add-Hash -VariableName $var -Hash "5560DDE11343953367264D3BE60ACA9C" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 1963657319
Add-Hash -VariableName $var -Hash "DFDC9EE401E0A543EC8D4490E554DCF5" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1389122918
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "36931517A5A3748DFCCB5BBC6A6DCD6F" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 864524837

# performance + main
$tag = @("Performance", "Main") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "F985EC30D91919F9ACB0307F1D388685" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4517660475
Add-Hash -VariableName $var -Hash "49489A7419F6C87DA4D11BD524052175" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3353601846
Add-Hash -VariableName $var -Hash "F419BF55F6D35CB198DD21311A656015" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3006946752
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "FDDC104CB62618445E78A0715D430131" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1810688101
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + quality
$tag = @("Performance", "Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "6322CBC230456EFED8236BA875CA8DF6" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7024138721
Add-Hash -VariableName $var -Hash "103434A85E2665C6009958CEFE31881B" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5958514979
Add-Hash -VariableName $var -Hash "500AAE9DE86C31F6CC4C1C43C2443269" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4300430149
Add-Hash -VariableName $var -Hash "457AD01686A90BA1B5A83E2C861424DB" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3875680603
Add-Hash -VariableName $var -Hash "60042CFAF4BD9759B94DF7B2DC62606E" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3337787537
Add-Hash -VariableName $var -Hash "17BD3762FD4AABF94B06C1043293C9E6" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2169499248
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# performance + vault fix
$tag = @("Performance", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "9A2DECECACAB91E7A8FFC14A14E4D98D" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2574239238
Add-Hash -VariableName $var -Hash "56B0D0056C4B47ADF83B1ADB5F9A0E77" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2608707491
Add-Hash -VariableName $var -Hash "C05C84E6D5D9D3B2519FFD27B6EF6E00" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2206604163
Add-Hash -VariableName $var -Hash "EDC4E52BE43916582022C6318A93764A" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 2214953285
Add-Hash -VariableName $var -Hash "D9DECE1D9D4BCC6572838DA2CFDC0044" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2022006071
Add-Hash -VariableName $var -Hash "F310DDB3C1DF7FE54C98D61C217ECD59" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1527622376
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# performance + restyle
$tag = @("Performance", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "91F8F701330E78EECDE374C0130A31B3" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2566482954
Add-Hash -VariableName $var -Hash "5970F36B70F8127E1FEE485CCA1000F7" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2649125881
Add-Hash -VariableName $var -Hash "681EACEB7F6B249773F83BEEF2BD9DD9" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2395632882
Add-Hash -VariableName $var -Hash "84FECF77FF6079F804AFF67D6D6CC8BF" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 2213833218
Add-Hash -VariableName $var -Hash "A5EC733C950CEE6F12A984E3A9B749AE" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2021896241
Add-Hash -VariableName $var -Hash "FFEB1BF7057F1B50B0A4C5BA9B9D2B0E" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1503767805
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# main + quality
$tag = @("Main", "Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "365F18A6738B62BA946858F9EDDE7B20" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7884075404
Add-Hash -VariableName $var -Hash "5215B3E63D8A84A4531E6485A27880B0" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7430056887
Add-Hash -VariableName $var -Hash "F231E9FE16E475ED9D149E359C114DB8" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5034642158
Add-Hash -VariableName $var -Hash "D52E8ECA33D287C68510F9923E2E989C" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4423582229
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "61C7BC2EC1BC7D9BC686CCE8A22B63FA" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2399116039
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# main + vault fix
$tag = @("Main", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "B0810EBD63C3BAEBC2E480B1E837E00B" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4502607073
Add-Hash -VariableName $var -Hash "80B5336EF659199E6CD4D1FFF15F8DD0" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3346703874
Add-Hash -VariableName $var -Hash "D0C2C4EEADD6C79E9BB67683634365E2" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3009575483
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "54096313C087EFD771EF0E84FEB6FB6C" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1753195643
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# main + restyle
$tag = @("Main", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "9524FDB3A22503A49F04EBF47A97B8C0" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4519689016
Add-Hash -VariableName $var -Hash "5832299B6C199CDF693EE980B16B6139" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3505516684
Add-Hash -VariableName $var -Hash "E2CA479A2AD2FE52C3A78F303D03C385" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3008410465
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "4276907D3A4A584E8C9E4CBB2E971552" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1757861584
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# quality + vault fix
$tag = @("Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "ADA7A975C0F6603BECBB5EC5E0861E45" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 6965120183
Add-Hash -VariableName $var -Hash "D92A9E691C9766D7C5E60F39F239A078" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5787544100
Add-Hash -VariableName $var -Hash "FB23D9DC4895C76D0F510176DF0C6A1B" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4210132333
Add-Hash -VariableName $var -Hash "9E774ECE6888480E2E319F8513EC49C4" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3748998816
Add-Hash -VariableName $var -Hash "B186726FD4FFDE260DCF90F868A504AD" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3324943551
Add-Hash -VariableName $var -Hash "18D2EAA9B886CE48447156B52BC798C9" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2066060086
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# quality + restyle
$tag = @("Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "A46CA2674EDAA4DFFF47BCF7ABBDF62F" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 6961403753
Add-Hash -VariableName $var -Hash "37173460A7B481E93ED128E2C3C928D5" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5826160152
Add-Hash -VariableName $var -Hash "C9AD008871E02C82564A3263C96C9877" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4414672705
Add-Hash -VariableName $var -Hash "0906C29791130CFA0DE21332D155F9E8" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3751050948
Add-Hash -VariableName $var -Hash "5F13071E9E388D26683146A2094A4388" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3324833721
Add-Hash -VariableName $var -Hash "6E56C1064E9D07141889E607D71A215C" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2040492128
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# performance + main + quality
$tag = @("Performance", "Main", "Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "CEC8E1A6A9D5B311C9A484355A7DB8FA" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7911030079
Add-Hash -VariableName $var -Hash "D24F8864C79275ACFF9EE31E9041431C" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7444751159
Add-Hash -VariableName $var -Hash "2DDD13A4417E11438746C79DEF185B49" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5041135506
Add-Hash -VariableName $var -Hash "BF6E7D931C5E247B3AEC5ED33AE23AC5" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4423868672
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "ACA08549321E443ED6B603ED12FFF34C" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2456425165
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# performance + main + vault fix
$tag = @("Performance", "Main", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "F985EC30D91919F9ACB0307F1D388685" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4517660475
Add-Hash -VariableName $var -Hash "49489A7419F6C87DA4D11BD524052175" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3353601846
Add-Hash -VariableName $var -Hash "F419BF55F6D35CB198DD21311A656015" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3006946752
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "FDDC104CB62618445E78A0715D430131" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1810688101
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + main + restyle
$tag = @("Performance", "Main", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "5EDCCFBA77D25DEE3561FCDE85C72BAD" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4534742418
Add-Hash -VariableName $var -Hash "D266E4FA75746A78876B029627C9F4BB" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3512414656
Add-Hash -VariableName $var -Hash "53C9854D49B66BA3CEAEA7ED0531AAB7" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3005781734
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "37DDD5873F908192EFB771785E5A7FA5" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1815354042
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + quality + vault fix
$tag = @("Performance", "Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "2F65BBC9B06D166ADFE180632B42B3A4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7027820199
Add-Hash -VariableName $var -Hash "103434A85E2665C6009958CEFE31881B" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5958514979
Add-Hash -VariableName $var -Hash "500AAE9DE86C31F6CC4C1C43C2443269" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4300430149
Add-Hash -VariableName $var -Hash "454910A3EAB2C34FAE9C07202CE3A38E" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3877580447
Add-Hash -VariableName $var -Hash "60042CFAF4BD9759B94DF7B2DC62606E" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3337787537
Add-Hash -VariableName $var -Hash "08E2B5B7AB74C1E9DA10BBC80258CA57" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2199167324
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# performance + quality + restyle
$tag = @("Performance", "Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "6322CBC230456EFED8236BA875CA8DF6" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7024138721
Add-Hash -VariableName $var -Hash "96B9C27B55A28037507335A73A358FC4" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5993449226
Add-Hash -VariableName $var -Hash "BC37205FEFE1C03466C68340827061F8" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4489458868
Add-Hash -VariableName $var -Hash "1631496FCE5FD541714CE5D81B1D2324" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3876460380
Add-Hash -VariableName $var -Hash "CC426AF777FD5480EE83353966142F71" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3337677707
Add-Hash -VariableName $var -Hash "459F31B524A3F1E8028D1DCBEC0D2201" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2175312753
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# performance + vault fix + restyle
$tag = @("Performance", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FCD7619DF35825F20DD69ED65A7029C5" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1008136558
Add-Hash -VariableName $var -Hash "C1C533EA00CC2724326E6F830207740B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1096613402
Add-Hash -VariableName $var -Hash "0BA5A0D72EC7D03AB7B44515D20B6FCC" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 164817935
Add-Hash -VariableName $var -Hash "8E5823A3C7DDF252D3A6EE7C13D4EA91" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 19119478
Add-Hash -VariableName $var -Hash "AF6BAEC283936AAD20078EC8C4488FB2" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 167809116
Add-Hash -VariableName $var -Hash "13A58926567680D665DDD77B2BF98B1A" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 53645974
Add-Hash -VariableName $var -Hash "9A2DECECACAB91E7A8FFC14A14E4D98D" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 2574239238
Add-Hash -VariableName $var -Hash "5970F36B70F8127E1FEE485CCA1000F7" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 2649125881
Add-Hash -VariableName $var -Hash "681EACEB7F6B249773F83BEEF2BD9DD9" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 2395632882
Add-Hash -VariableName $var -Hash "84FECF77FF6079F804AFF67D6D6CC8BF" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 2213833218
Add-Hash -VariableName $var -Hash "A5EC733C950CEE6F12A984E3A9B749AE" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2021896241
Add-Hash -VariableName $var -Hash "5EFDF6B470F0E34534BBAFDDA04D8C37" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1533435881
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "B8D3242176D94C1BAE32A187362533CE" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1046980722

# main + quality + vault fix
$tag = @("Main", "Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "862F4878EE06209263CA8B0426ABB84D" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7886183113
Add-Hash -VariableName $var -Hash "5215B3E63D8A84A4531E6485A27880B0" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7430056887
Add-Hash -VariableName $var -Hash "F231E9FE16E475ED9D149E359C114DB8" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5034642158
Add-Hash -VariableName $var -Hash "D52E8ECA33D287C68510F9923E2E989C" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4423582229
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "61C7BC2EC1BC7D9BC686CCE8A22B63FA" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2399116039
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# main + quality + restyle
$tag = @("Main", "Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "365F18A6738B62BA946858F9EDDE7B20" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7884075404
Add-Hash -VariableName $var -Hash "6CCBB568C22F37D42226A159CB37A16A" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7442390044
Add-Hash -VariableName $var -Hash "5F3A55D494630C4D0E71F883BF479063" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5193454968
Add-Hash -VariableName $var -Hash "8CE1763F1623346B05B04702F6380A31" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4422417211
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "EC78E514A44ED66D2CA8B4B4F2DB1742" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2403781980
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# main + vault fix + restyle
$tag = @("Main", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "72CEC051C29D97A62AD2FE122605A448" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2200539678
Add-Hash -VariableName $var -Hash "E631EC212EB05BD1A8C2E7E3544DA915" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2923363368
Add-Hash -VariableName $var -Hash "AEA8084591FB722B9DA1A5C9B9F1D414" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 324714827
Add-Hash -VariableName $var -Hash "91F3AB61CA0C5826D3892AE3D5CAFD06" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36950876
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "01CA1E1636F03834FC8EA7D794A6BE46" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 211643946
Add-Hash -VariableName $var -Hash "F4B6B85132559DD67731DD8319EB57F5" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3795610647
Add-Hash -VariableName $var -Hash "9524FDB3A22503A49F04EBF47A97B8C0" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4519689016
Add-Hash -VariableName $var -Hash "5832299B6C199CDF693EE980B16B6139" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3505516684
Add-Hash -VariableName $var -Hash "E2CA479A2AD2FE52C3A78F303D03C385" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3008410465
Add-Hash -VariableName $var -Hash "02B84D96C9089AA31C476D54AE05F525" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2819721696
Add-Hash -VariableName $var -Hash "4276907D3A4A584E8C9E4CBB2E971552" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1757861584
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "0D7C1845F3654576DF03EFEE1A6B78B8" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1123507144

# quality + vault fix + restyle
$tag = @("Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "D48499A3A506B52DF0A7FB49E98AE9A2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1656799217
Add-Hash -VariableName $var -Hash "E6E48266550EDD66479CC8A721B2B0AE" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2764634880
Add-Hash -VariableName $var -Hash "A72ABEDC244C9B9BF708A28AF780F6B6" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 232308379
Add-Hash -VariableName $var -Hash "C80F8AAB0ED2E7AB024188E875839B33" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 24022529
Add-Hash -VariableName $var -Hash "AD8B202F908E089EE003DF119D15DA9F" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 172990018
Add-Hash -VariableName $var -Hash "E06BD7D0516E1C8DDBA9908DE87A14F5" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 212399520
Add-Hash -VariableName $var -Hash "ADA7A975C0F6603BECBB5EC5E0861E45" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 6965120183
Add-Hash -VariableName $var -Hash "37173460A7B481E93ED128E2C3C928D5" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5826160152
Add-Hash -VariableName $var -Hash "C9AD008871E02C82564A3263C96C9877" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4414672705
Add-Hash -VariableName $var -Hash "0906C29791130CFA0DE21332D155F9E8" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3751050948
Add-Hash -VariableName $var -Hash "5F13071E9E388D26683146A2094A4388" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3324833721
Add-Hash -VariableName $var -Hash "AD598B2AE13D499DA04ACFBDD551AC0B" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2072327128
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "748CC72F5A31079987E93F9E230B047D" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 878895990

# performance + main + quality + vault fix
$tag = @("Performance", "Main", "Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "42BBF431F36ACC89C1E5FC9FA29700BE" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7913137788
Add-Hash -VariableName $var -Hash "D24F8864C79275ACFF9EE31E9041431C" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7444751159
Add-Hash -VariableName $var -Hash "2DDD13A4417E11438746C79DEF185B49" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5041135506
Add-Hash -VariableName $var -Hash "BF6E7D931C5E247B3AEC5ED33AE23AC5" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4423868672
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "ACA08549321E443ED6B603ED12FFF34C" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2456425165
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# performance + main + quality + restyle
$tag = @("Performance", "Main", "Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "CEC8E1A6A9D5B311C9A484355A7DB8FA" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7911030079
Add-Hash -VariableName $var -Hash "A319C74D45F702D0DA9A5326E5BD4F70" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7457084316
Add-Hash -VariableName $var -Hash "7A634961574C33C42E515433B67E5D11" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5199948316
Add-Hash -VariableName $var -Hash "C0B685D16DCD8BDDA3FE8395E09A5F76" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4422703654
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "3366A379355298C46F50134751F600FC" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2461091106
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042

# performance + main + vault fix + restyle
$tag = @("Performance", "Main", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "FB6B17E96151EEFDA4D1B1411C402814" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2141656414
Add-Hash -VariableName $var -Hash "102B6112894E7C8DB7F5E26682EC86C5" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 2783892847
Add-Hash -VariableName $var -Hash "65E320BEBD368FF220915FC7E9E9D40B" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302284550
Add-Hash -VariableName $var -Hash "CE184787F17E26F60F4E72B6F8D4EF38" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 36652439
Add-Hash -VariableName $var -Hash "5825DA871AEFAF2DE3A8B70A886BC623" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 210221142
Add-Hash -VariableName $var -Hash "1FA5DC19A511553CEEBC30370310E7A9" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 208811143
Add-Hash -VariableName $var -Hash "656335CABA7B5E22997725A18172CEB4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 3822024693
Add-Hash -VariableName $var -Hash "5EDCCFBA77D25DEE3561FCDE85C72BAD" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 4534742418
Add-Hash -VariableName $var -Hash "D266E4FA75746A78876B029627C9F4BB" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 3512414656
Add-Hash -VariableName $var -Hash "53C9854D49B66BA3CEAEA7ED0531AAB7" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3005781734
Add-Hash -VariableName $var -Hash "583E968D74417F7DA9A19BFA85191D40" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 2812250435
Add-Hash -VariableName $var -Hash "37DDD5873F908192EFB771785E5A7FA5" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 1815354042
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "429E93294DAD3F8F71A507E2A141B292" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1305963029

# performance + quality + vault fix + restyle
$tag = @("Performance", "Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "DD492A1EE7AE340BC825066A50525146" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 1516511120
Add-Hash -VariableName $var -Hash "2D12239EBB3060208326891B6ECE7F1D" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 1970161435
Add-Hash -VariableName $var -Hash "8A251FBAEAED2BA5D6CE010A6DA63172" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 218637247
Add-Hash -VariableName $var -Hash "4FD64B31DB35FC1A9C9E7EDA31A0FE43" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 20866395
Add-Hash -VariableName $var -Hash "E6E4ECFABC2C61189630E140DB045471" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 171652335
Add-Hash -VariableName $var -Hash "2DF41831EE8C55986DB715D0D6BD01C3" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 106127060
Add-Hash -VariableName $var -Hash "2F65BBC9B06D166ADFE180632B42B3A4" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7027820199
Add-Hash -VariableName $var -Hash "96B9C27B55A28037507335A73A358FC4" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 5993449226
Add-Hash -VariableName $var -Hash "BC37205FEFE1C03466C68340827061F8" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 4489458868
Add-Hash -VariableName $var -Hash "1631496FCE5FD541714CE5D81B1D2324" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 3876460380
Add-Hash -VariableName $var -Hash "CC426AF777FD5480EE83353966142F71" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3337677707
Add-Hash -VariableName $var -Hash "D73AA2676C4F65E415DD3418498A8DEF" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2204980829
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "41D2EFF28A0023561A4B8676B99EBADC" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1061349213

# main + quality + vault fix + restyle
$tag = @("Main", "Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "E00CCBA14FEBFFB603FBFD2E803405E2" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2121628884
Add-Hash -VariableName $var -Hash "DFF7994BB0BFCFCFB39EC1954B0C7582" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3161950363
Add-Hash -VariableName $var -Hash "2617439A43583FE7D15E0A6E6C53A3C5" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 302687730
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "F786FBA5A5733C8DA5C7A16315B13C72" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 189455556
Add-Hash -VariableName $var -Hash "862F4878EE06209263CA8B0426ABB84D" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7886183113
Add-Hash -VariableName $var -Hash "6CCBB568C22F37D42226A159CB37A16A" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7442390044
Add-Hash -VariableName $var -Hash "5F3A55D494630C4D0E71F883BF479063" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5193454968
Add-Hash -VariableName $var -Hash "8CE1763F1623346B05B04702F6380A31" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4422417211
Add-Hash -VariableName $var -Hash "8E3C10E8222F6BAE061CB462AD5666C8" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3806106861
Add-Hash -VariableName $var -Hash "EC78E514A44ED66D2CA8B4B4F2DB1742" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2403781980
Add-Hash -VariableName $var -Hash "306DB3E6891756E751C7666E173015ED" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 545959220
Add-Hash -VariableName $var -Hash "A5D2485D4569CC1E3364B949416E0F19" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 602176127
Add-Hash -VariableName $var -Hash "288E9D0E6A1A19840B741ED5EC2037E5" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1132459819

# performance + main + quality + vault fix + restyle
$tag = @("Performance", "Main", "Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "990BB5B22EDB3E239C632F329A981C14" -Tag $tag -FileName $ba2Files.dlcCoastTextures -FileSize 2097016436
Add-Hash -VariableName $var -Hash "883C68BB06570639F2A5C68F38AB00EF" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures -FileSize 3105490893
Add-Hash -VariableName $var -Hash "5D092A6410FADD30C671037CA3F745C0" -Tag $tag -FileName $ba2Files.dlcRobotTextures -FileSize 301070795
Add-Hash -VariableName $var -Hash "54DA93B6785B5C72A9A44A33AC0025EF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures -FileSize 35920716
Add-Hash -VariableName $var -Hash "0E19FCD79E3A024F23A6723085374B06" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures -FileSize 213100442
Add-Hash -VariableName $var -Hash "99A9DAE9D0DA66C6B8CF6765BA9E4A6F" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures -FileSize 187790820
Add-Hash -VariableName $var -Hash "42BBF431F36ACC89C1E5FC9FA29700BE" -Tag $tag -FileName $ba2Files.fallout4Textures1 -FileSize 7913137788
Add-Hash -VariableName $var -Hash "A319C74D45F702D0DA9A5326E5BD4F70" -Tag $tag -FileName $ba2Files.fallout4Textures2 -FileSize 7457084316
Add-Hash -VariableName $var -Hash "7A634961574C33C42E515433B67E5D11" -Tag $tag -FileName $ba2Files.fallout4Textures3 -FileSize 5199948316
Add-Hash -VariableName $var -Hash "C0B685D16DCD8BDDA3FE8395E09A5F76" -Tag $tag -FileName $ba2Files.fallout4Textures4 -FileSize 4422703654
Add-Hash -VariableName $var -Hash "37CF352A053869DA9E5A19A48ABB4A96" -Tag $tag -FileName $ba2Files.fallout4Textures5 -FileSize 3804958810
Add-Hash -VariableName $var -Hash "3366A379355298C46F50134751F600FC" -Tag $tag -FileName $ba2Files.fallout4Textures6 -FileSize 2461091106
Add-Hash -VariableName $var -Hash "024CAE9A6D712A8EB1CF9921B1C0A2F0" -Tag $tag -FileName $ba2Files.fallout4Textures7 -FileSize 722009972
Add-Hash -VariableName $var -Hash "2577CE83B7FBD3C5061517B209A23428" -Tag $tag -FileName $ba2Files.fallout4Textures8 -FileSize 790042919
Add-Hash -VariableName $var -Hash "BC7B54A33AC96F36ACC326FD275BAE61" -Tag $tag -FileName $ba2Files.fallout4Textures9 -FileSize 1314913042
