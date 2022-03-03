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
# get patched archive hashes from a run (linux): foo=($(iconv -f utf-16 -t utf-8 "$(ls -1 install* | tail -n 1)" | grep '    Hash: ')); for ((index=0; index<${#foo[@]}; index++)); do if [[ $((($index + 1) % 6)) -eq 0 ]]; then echo ${foo[$index]}; fi; done

Write-Host "Loading hashes..."

Set-Variable "HashesVersion" -Value $(New-Object "System.Version" -ArgumentList @(1, 3, 0)) -Option Constant


# repack hashes
# -------------

$repack7zHashes = @{}; $var = "repack7zHashes"
$tag = "Performance"
Add-Hash -VariableName $var -Hash "CB0C484C4034777E29694B0F128F49B1BA6EFA4CCE93298C34F04AA9EF847C93" -Tag $tag -FileName $repackFiles.Performance[0]
$tag = "Main"
Add-Hash -VariableName $var -Hash "6801F7E691F25731BE6F5C50E84E760970C7DAD487462C92EFF873EEFE636C09" -Tag $tag -FileName $repackFiles.Main[0]
Add-Hash -VariableName $var -Hash "458C0BC2A429191F6B585ADC302C405C847BCCBA732B0C59C1AAEA301D4E0D8A" -Tag $tag -FileName $repackFiles.Main[1]
Add-Hash -VariableName $var -Hash "FA336DA13E06418810A946594CB66018BAFDA13727ED55EE8CD32A271A6CD62B" -Tag $tag -FileName $repackFiles.Main[2]
$tag = "Quality"
Add-Hash -VariableName $var -Hash "4B77A1219B754B085B29AD92F4ACBA95ED7A28A60D161563C42F047AB5EB19AC" -Tag $tag -FileName $repackFiles.Quality[0]
Add-Hash -VariableName $var -Hash "4483D4D77E1BBD266301A975F2DC7C92C0321215027F7FB83C271D9CF434B513" -Tag $tag -FileName $repackFiles.Quality[1]
$tag = "Vault Fix"
Add-Hash -VariableName $var -Hash "8B7F6F9D19244629F9C43C88C64F93E9659CC8DAF377AEAFB914D737BB6ED0CD" -Tag $tag -FileName $repackFiles."Vault Fix"[0]
$tag = "Restyle"
Add-Hash -VariableName $var -Hash "8ED930478DDB5DAC02A03461F860250D5E7EF4E9993DAE9710253C218EF73D5B" -Tag $tag -FileName $repackFiles.Restyle[0]


# original ba2 hashes
# -------------------

$originalBa2Hashes = @{}; $var = "originalBa2Hashes"
# vanilla v1.10.163.0 (steam build ID 4460038)
$tag = "Vanilla v1.10.163.0-4460038"
Add-Hash -VariableName $var -Hash "D800B065414007F5060879D199D1961C8F36489841BB61B34E8C560E99B1C6B4" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "3FE2C787F0D4D88B043EC5580982A5DD728BD7F031633C72D27D89B0D9F1351E" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "AE3801E98EA5AA8C8925A0DC9DC17227F46855F77AA05DE5B8EB2156667E1FE6" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "083A617C29C7817009B79819661869AB9BD2ADF683897F0BF7EDB62D65770ECD" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "F960E81C8EB081F694E4DE4B293463D255A8052AF12110D2F6D90801E1ACBDEF" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "525DF4C7368BA99EDD65A6607530AB8C5E92EBB8FE96DDF6CAB33C18FC2762C0" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "0EF01DCC41167AEAA7C259C15FD3EE7792F36AB151A4907F220206A7A354C593" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "CC76EB25C1B2882B31B941E0E4C7E5A536028A0641FD7B8072DCCC3C3D5007E3" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "0A4B65B8779842DFDA4997FFDC8F05CE7C557871D413DB24FA356445ECE3BD11" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "066C50791A7FAC5C64FE109BDF4986EF82D15E6378D658812BEC19751FDA8C45" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "35F8F2EE70BC3D4BF387C94460EC89F9B99FAC2C04FDDC9DD42645A7EB60A1BC" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "3407A0184BC871567DD1AA5B9E120A5B93AD035BDA961D7728441CC104E46CF2" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "06299876A2FDBA48C2FC707C34314047FE423163A84CFE1E70986177E6C053B4" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "BBA344ED3DA7A4ED9EC8CA8ABAD77CDFBF9756FC1C2B17F4F6B221368EF37374" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "1F4DD1E0BC003195C8B4C39819B4657194E3196CDFA758DE57BF4D6A0B8E8A4D" -Tag $tag -FileName $ba2Files.fallout4Textures9


# alternate original ba2 hashes
# -----------------------------

$alternateOriginalBa2Hashes = @{}; $var = "alternateOriginalBa2Hashes"

# luxor
$tag = "Luxor HD v1.0"
Add-Hash -VariableName $var -Hash "A40C5078CB2970B78DDB91AE43256D0B29AC438EDA95A3423F9FCD9E5E29BE9C" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "7A9CF210B5FC7D5A5ABE64FD8DD9450C65E6A928672D87DDC5DD56EFBBC82941" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "D8F59AD57DB4DFE1008D03C7B2C9FC16C348027724A50FBEB06EF5972E6B073E" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "4AD20EB67FA6530516ED95EBA6F14F6DAF32B0ACAB21BAC8B842DBA8C00A0666" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "C25446189A96E9A2D2716ECD51FBA6D9A1990189B21A9A49F308C79D316FBF58" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "44A8426606AAF1827E5C42E921742DEADAC2C5532F562890A0BF8A53EA71BD78" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "68C05A16ADD10AB3D08488215AA0C3E04965016BFC4B21F3ACA9EA9DD099D898" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "888FEDDD322C754E957A260BEE2D39E493DF95B5F977C9D851DEED8E06859255" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "B207442F6599933B7FC2ACA13917FFC9769070E4EB8C72A2C988EFA8A79490B2" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "67D36F7ADF81762B73A452288677FCAD8676C37D7CF94ABF5D939342E72765E8" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "0CFDB7ABFCF51BB60D83729A0D610375751814EC9080A6363723BD46A0AD239A" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "B5EAA4EFABFCC8FECF76870C7CEF837A4442843278E59EF1ACCCE69E001B821D" -Tag $tag -FileName $ba2Files.fallout4Textures9
# luxor fixes
$tag = "Luxor HD v1.01"
Add-Hash -VariableName $var -Hash "9045EE5D72FA855D1487499BEA92164881E29F2A18EBCA9ED6BD41809C5D1BFF" -Tag $tag -FileName $ba2Files.fallout4Textures2
$tag = "Luxor HD v1.02"
Add-Hash -VariableName $var -Hash "6D8A9519804BB0A52FBC87E82CB93B68F499B10DB7D8715E38CADAFDC9855FF6" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "E859958B1246357152741A716A191B309B9327AF208F47F17EC271ECE0E06EFF" -Tag $tag -FileName $ba2Files.fallout4Textures3

# phyop custom
$tag = "PhyOp (Custom) v1.2a"
Add-Hash -VariableName $var -Hash "427395F246578F4CF0BAE368915E6120FCFAB43AE6E867A0DA38356E734E4BCF" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "E7BEAC413D1DB17FC4D283BAA4830FA66B10D0514726FFD2F5AD768AAB42385A" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "B856F44D4C5E08E4057C697C2B3B0B6F432C304F1EB4226782AFE76419541B66" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "87925DE2312B5103A0029FF46CFF72D2FFF0B9FBE60E9017F0402021D057A95B" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "835E5219922DFD6BE519DBEA386751E1C8CB15F4C11871B72382383CB0478234" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "D20B3236DC9E6035892A34FBF0CD8B0F1AF6806F240C36E62251FFA1E0084D78" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "95872998A86B8344F9C2CE0A9913C1A490D737AB1D567F627209EC8993E3FDB7" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "C333402B21500CAF2F87C6312BB9EC4CC226D1C6FF653D937DBC76D98D4FC3D7" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "AAFDEA1C54E21FD7D5E7659BE03234101C0679E6EC8C9E2B2FD934D2B364A3C9" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "8D5E0086A8209DD5B34B3EA91B0BB32CB6AEAC8A4AB987C50225C6F91F546B32" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "72510AFF24C91B5A1072EDB46190D90683630AF7BCCDB42EDF6CB2AC3F8714A0" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "80D67F0855381EA1FD18E7ECC336785B8C301CC5CD742C1A155B1863F6381785" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop custom fixes
$tag = "PhyOp (Custom) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "162AFB885D2E9D6E729D395BA8391C3F69FDC9EC9143939D2EAB8C55BFB44C49" -Tag $tag -FileName $ba2Files.fallout4Textures1
$tag = "PhyOp (Custom) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "3CDDE54C0AF5479256BBEA209BF885FF9DAD150577645A67F97075DE85EE7203" -Tag $tag -FileName $ba2Files.fallout4Textures4
$tag = "PhyOp (Custom) Street Sign Fix v1.2a"
Add-Hash -VariableName $var -Hash "162C0EC5B2931381C119EB3464E1F1BCB221995B5D010703300ECE0C563884DC" -Tag $tag -FileName $ba2Files.fallout4Textures7
# phyop custom optionals
$tag = "PhyOp (Custom) Original Pip-boy v1.2a"
Add-Hash -VariableName $var -Hash "34A779723637CDECE4B3271B256D938B3EBB9E06706FF4E434719CA3F4661C07" -Tag $tag -FileName $ba2Files.fallout4Textures2
$tag = "PhyOp (Custom) Original Weapon Colors v1.2a"
Add-Hash -VariableName $var -Hash "650C5F9F53BD9B6F22C61277614D5D00B71E7AB64E9F428553DF7060E46C7F73" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "25E91D88D4D4AA2E501E98DAB46B60DF38F1536C94ABBFF37569FE49E022C7F2" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "043A9352C75478BA70523D7E777FBC03183E16D464470B550BC38D7B2265363C" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "B56FBE53BFE21A7C91FC890EE3B1B809F17B00CB3D7CCA764A25FF787213C3A6" -Tag $tag -FileName $ba2Files.fallout4Textures8

# phyop custom performance
$tag = "PhyOp (Custom) Performance v1.2a"
Add-Hash -VariableName $var -Hash "F5939C5BD9FA9C7FC2BA5268840ED98DA103030FCE4F3DEA2E8F6A050F282902" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "B7B02A1D83F8E231EC802CFB3BEFF26A8A7A2F3F10BD546F9F5829D1C473AAF6" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "DE69659B157876ED43FBB0F0C909BA622FEE3CA7DD84246135E9EF00A1456213" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "68E77584E711E7DF9FE71D7F7F9DA855C0848B62365EECF27B514C3D34C189F9" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "63F8BE0EB4EFE34C6B08BEA650BB8735C018033AAAF3343811EC15E4F2166AC8" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "C8890BDB8305CF043FC095542DF572CD377267FA87334C48091AA0CCCACA9CC5" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "43CDA0FA2E11240AE4DCF1C3C017B9FE3A7DCDE96D1E92A2AC5B1ED05B2CDD81" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "A0ACC1B1DD32275BC3F3306D51182C64014E30144D5B8BDC8BFD5451645D1FDE" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "89EE4800F8874AF13D7A6669F6077453CD3C747F7322F815F58C71B29399DF67" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "57D1A8932026F2DC4A29C7FFA99BE9032CEDE05EFB75771402F5A8770CD28147" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "B0B1C6EF548565747783A9430EA37C952ED975354E575D751634AE3E5D987EDB" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "42AE814E9B24B1E20953D56004C42ADDC99D6BC5CB1B1861491ECCBAB2A18B09" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "80D67F0855381EA1FD18E7ECC336785B8C301CC5CD742C1A155B1863F6381785" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop custom performance fixes
$tag = "PhyOp (Custom) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "9AC1580C987E75990E6BCEC612FAE78C085CBEBA062E9496C2489BF7AEC9A979" -Tag $tag -FileName $ba2Files.fallout4Textures1
$tag = "PhyOp (Custom) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "F8EDCA3C759E82BB0CD292C23239BD429AC1367D2BC94D4251EAF1A75C206D35" -Tag $tag -FileName $ba2Files.fallout4Textures4
# phyop custom performance optionals
$tag = "PhyOp (Custom) Performance Original Pip-boy v1.2a"
Add-Hash -VariableName $var -Hash "976B2FC8D9128DB51FEF3E1138E5994F45E76D5A3E0E4BB5E65699A3D0AF5B93" -Tag $tag -FileName $ba2Files.fallout4Textures2

# phyop dark
$tag = "PhyOp (Dark) v1.2a"
Add-Hash -VariableName $var -Hash "30954E88F7B7937FB8CEF60670B5B83D069470F5B7C2257DC19739ED095CF9B3" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "44B68E0D11DE7F1525441390F99304E16DEA96F1F1874A8431F4A48591AB660E" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "A48F280257A9F016C21EB5C90817A01DBB49511F2405FE319FFF2C1FEF828701" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "363520A48CC5B04334D739B3DE2924B1294F15D9F6B5889A5DB6D3D56F6E975A" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "C68D9047151E6C09E4CD1FBFFC7CA8B778119FBBDDDEE32E16A8659DA3B68F04" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "D20B3236DC9E6035892A34FBF0CD8B0F1AF6806F240C36E62251FFA1E0084D78" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "54252E77DF04D6C67CBCC543A7E7F8BA31A18070599B291288B581CE93B62BAA" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "7EBA4D00F1211F6E10983E6BA773FF58C14537E4CF88A1EDBC67C795B7494CFE" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "D9B5E74BCF2BEFC90DF7C969EF610910642BC828BF65E215F30A59C650116665" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "7D2BCC0BB153155211BD06C2C4A3EDF4F036DB7B6209E640EB1E960614B146A5" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "52F99F6D318D768DF6E8D7B054280E978B5677AA2FB792E0A02D249BB4359938" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "80D67F0855381EA1FD18E7ECC336785B8C301CC5CD742C1A155B1863F6381785" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop dark fixes
$tag = "PhyOp (Dark) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "AEC9DA62A5479D637C9561ACED4750880B062788C3DCE42C5F7F112BDD64380A" -Tag $tag -FileName $ba2Files.fallout4Textures1
$tag = "PhyOp (Dark) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "E625592389BA3E762667027109F632026632C99D865A0F4506B61929FCBF4C1E" -Tag $tag -FileName $ba2Files.fallout4Textures4
$tag = "PhyOp (Dark) Street Sign Fix v1.2a"
Add-Hash -VariableName $var -Hash "7C29100F295F32FF92F14E6823B919806DDBFADD9BF0A6DAA536261977DBB803" -Tag $tag -FileName $ba2Files.fallout4Textures7

# phyop dark performance
$tag = "PhyOp (Dark) Performance v1.2a"
Add-Hash -VariableName $var -Hash "75A9003E0C5F47113CE77E9EC655D2BA75A6510044F2646C11CC3A5CEA130846" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "86FB13A1E319DAB9B2472B7BF553D44B7FE0E56BF71C1592029C0BC04B819FB8" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "7D5605DA11B2C55E08A756B5267F6BC1F79D3E0DC8451F2BA291C846D3A2284F" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "C4FF8D76A41CFE8E43528479BDCFD45CEFF52D3F775B2C8AC76BF167C14BAD8A" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "6DD53014755A6988AEC8CBF255574921C9BC9597DC745ED52775E5006AB6895D" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "C8890BDB8305CF043FC095542DF572CD377267FA87334C48091AA0CCCACA9CC5" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "93300DA55EFE75C66384D909C7A4CAF34E820668658425104AD9A8FAF85CC22E" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "970B511FFFD41DB7D1D3387FB4857383B8F7F704F83568465BD63566A2272983" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "D2350D1C61D44C192642977DECEE7D6DF500121D5877C246D367A41727034FBF" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "A0757340B3557AA832DC7BAF401851988B88CE7162042497BD015A1BC7E514F0" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "5E6D3181222C9247C986C375A26981C74442746AF3DC7EA865E3F6FD34F6517A" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "E2E421FD9DD2D7DA5EDE92C83F28836BB24E4A6D2D1FF29768101E1A2FE54987" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "80D67F0855381EA1FD18E7ECC336785B8C301CC5CD742C1A155B1863F6381785" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop dark performance fixes
$tag = "PhyOp (Dark) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "5405F40EF945BFF9F035282A7F026C36D04EE7588A715E45E613790C1F47A737" -Tag $tag -FileName $ba2Files.fallout4Textures1
$tag = "PhyOp (Dark) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "B84696B03BD0718A13640423855CA59D5FD4CE50AD1DAE8BB6A9B36E8F6E0EFF" -Tag $tag -FileName $ba2Files.fallout4Textures4

# phyop light
$tag = "PhyOp (Light) v1.2a"
Add-Hash -VariableName $var -Hash "86B99F810CCF0EDCA71924FCC314FCDBFFB4AD748E5B3F23A4D16718370804FF" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "06D8AC656252B36F299D5570B2E0412CCC7734C889CE07E7BE329C84945C2A9F" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "A2B0DDC1772287B5F791F37F7AC55B788892EFBC3C17DB7DA74D93971FC8B13C" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "F8DA9A5EB547E31BE260F647A15158B946D25CD0A26CFC20E06C65B9B165F178" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "54F127585008682FBB216CA69C0099C89B511929133564724C7FCDC10A1091DB" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "94A06FA7FC4DC855E9478F994FD2DC144D5349C2030FEA26F1E87E405BE291D8" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "C3A8759A10F8DA57C302F0455C627799741F833444B10B34987C071409BCA3FE" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "E914225FF7B700E7F5E31D247A07FBA2CC6132856537234F0B5DD56275150AC2" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "557D1200AD4F52BAA920459380A0DF90D419DBFDD68C7346622B7E6B329E83DE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "985E8AF0D4376D04FEC69BB0E2FD928917A0E886C4C142251FFD01B246DECE63" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "5F461B362C5A3EDE5DB763581071C276C92A3F9DF6DDE92F1E0F760CD389E248" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "BE907F2C69BFA030C4E781E560B4C39B0166C8F9DD5A6C60DCB92877DA55A239" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D6510E42825960734C318D1400E2288D64CBC540F9943AA90CF46AF3682DCBCC" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop light fixes
$tag = "PhyOp (Light) Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "4B0B91729122D0368BCD263A8CBC921F5C455BC2CEBA249B176BBF531AA48F3E" -Tag $tag -FileName $ba2Files.fallout4Textures1
$tag = "PhyOp (Light) Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "A97F5FF8CA4AFD5581067942D7ABB180E6C807B5968C68BAC45420120094A3B1" -Tag $tag -FileName $ba2Files.fallout4Textures4

# phyop light performance
$tag = "PhyOp (Light) Performance v1.2a"
Add-Hash -VariableName $var -Hash "2542E15160C353AB902C6249755BAA43953C10478FCD0E1A284B89FE2C67E2C6" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "1F7B16CFACD53D69B48D409BD4285A8CFA7D0CF21CE4F55F0889C34384EB08DD" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "1119271B707AFD98DECE3EF3757780DAE41EFB37836C273E3C9B118CCE18A6B4" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "AAA05C2428A77F25314B96B74C5D749940976F063656F3622655A5E27D1C780B" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "DAF0D6213AF6896C3BBC5F5B69038C15096E7C4564DCF4187859E9B2C0EB132F" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "73560E783CAB71DA0030DA231E75735ADCC7AA53612A473DB655014EB2FB1F7A" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "13104917819D0E1C8EDADF36219B7C52B8979BD15AACF2B78D53755902754AC2" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "0DA22B21D84F16D0B3BC23D21CE271C44E2343A9A10C98CA7C385C4055AE478A" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "F434E87DE6E9AC0B9CC08B9ECA2C3AD2C5C0D32D8436CF610D1827DE2D3F47D8" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "07114A3D12216A2A3F73B7C3AC3530E620E3B84F148716FC170C99CD6ED15CEA" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "77E70B8BFAD1769BFA6247B9991FCF73FD99DFABFA0AA78C9535CA5A32E341D6" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "E9E9EACF023779D03858B59A6FC146DF12E8B2BBF4210C3A1A89EE3B914F5435" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D6510E42825960734C318D1400E2288D64CBC540F9943AA90CF46AF3682DCBCC" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop light performance fixes
$tag = "PhyOp (Light) Performance Brahmin Pack Fix v1.2a"
Add-Hash -VariableName $var -Hash "3F135341D403BD185349E52EF0072131CDFDD61047AB94B1ECC57316FB1818A6" -Tag $tag -FileName $ba2Files.fallout4Textures1
$tag = "PhyOp (Light) Performance Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "BBEE6919CDC404F2A0D9A785B93118953404491255C90BFB5F560EEE66E56FB8" -Tag $tag -FileName $ba2Files.fallout4Textures4

# phyop light potato
$tag = "PhyOp (Light) Potato v1.2a"
Add-Hash -VariableName $var -Hash "3893685E360BD2FD24467205AAADADC28A4C6FAABD293F5DE6ED3B5B53E08854" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "C0D70FBE02551F295880BA91AEE233C55B271941D628D7F63A27785C5A9869F8" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "108F7DAEC9C7895FCFB0A839D675CB7F7B3E35E1081A561420D7A526DF091EA3" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "AAA05C2428A77F25314B96B74C5D749940976F063656F3622655A5E27D1C780B" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "B575C0EDE2D5194DEE5F4426D7641C1BE0EFDB48401A9615421091C58D284734" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "A4BA20057BE64B0BED0CD1EC59A7598A71488A7613A4F433664800D161F169F7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "B5DB65B87E5DA020A0259B64F8096383B1F66E383E5AAE46818D6145157A9FCD" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "7C6A7A27D71EF64C040DAD64650330CD945B343D5E972C67B2916AD7CF49DF39" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "55E483F6A1F74E19C03EF78761BE547BD296E539F2BAF42D4A264E3CA8338D0A" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "EC6ADD903C05BCF9DDB78DBEFBB543E1F9FE8E07DCD3E4A00DD2340A15E9FBE3" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "829D448F9B4DC90095EE616288C3D59D9C061A8B153A97E1614553B29655C9CD" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "B3BC300D60667EC9EDE55C0A7B788759FD1196AE8A8AE71FE54AA02EE0EF9174" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "4A75B49BCBA3DF13BA4CB29A488DC2B54A01C6C2F23302B643ACB7F227DEF579" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D6510E42825960734C318D1400E2288D64CBC540F9943AA90CF46AF3682DCBCC" -Tag $tag -FileName $ba2Files.fallout4Textures9
# phyop light potato fixes
$tag = "PhyOp (Light) Potato Face Sculpting Fix v1.2a"
Add-Hash -VariableName $var -Hash "467900A3DEBA3652F93DDD9124E97FFDFA3794B3120757A548E2B9BC2CB01A50" -Tag $tag -FileName $ba2Files.fallout4Textures4


# known bad file hashes
# ---------------------

$badPatchedFiles = @{}; $var = "badPatchedFiles"; $tag = "corrupt"
# # template
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName ($dir.patchedFiles + "")

# SavrenX HD 1K Buildings and Interior v1.00 - https://www.nexusmods.com/fallout4/mods/40534
Add-Hash -VariableName $var -Hash "89AF2BD3620A2B849D8FC6266E71D6BBC34455CDB32C481C350F864ECDD7C67C" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\BldgTrimDamage01_d.DDS")
Add-Hash -VariableName $var -Hash "0A03536FDE70266F5C311D5EC03C0653CAF5396B2E8BFEBE6F2E83C1D987B3F9" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Buildings\RoofMetal02_d.DDS")
Add-Hash -VariableName $var -Hash "9B54AB02F67799AE580043647331EBC293FB90C12B6092EF32D14F1B49B71F20" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01.DDS")
Add-Hash -VariableName $var -Hash "8ABAF770C1708FB162375CB566267D0BD6DE7E9AB1DFBA1A6CA5D9C4DD9B5821" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_d.DDS")
Add-Hash -VariableName $var -Hash "CF9A38E2A4A4E38605EA8C27343F61F2209304A430A90E54993302231AFF994D" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_n.DDS")
Add-Hash -VariableName $var -Hash "35560375E99066066FA1E84AAC067EC6D636574A615EA7D9F74802BAC86DB719" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondMetalTrims01_s.DDS")
Add-Hash -VariableName $var -Hash "02AADFF4006FDDA59CA58EB9956C01CB05D228A25037973484F1C0FB67A251F5" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02.DDS")
Add-Hash -VariableName $var -Hash "B329807B569FDB2F393E446D2E4D7ABF7176F03740FEFB4E9B24F239F335FD04" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_d.DDS")
Add-Hash -VariableName $var -Hash "794186BAED5D0492A12AFF82BFC3F7776B02F9724F2AF69671F0701E2682C802" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_n.DDS")
Add-Hash -VariableName $var -Hash "71EF1D44A67202C52168E1C90999E14D7D83C6889F0BF52B33CF3183CFEA6651" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondRVPanel02_s.DDS")
Add-Hash -VariableName $var -Hash "519CF66BE7295864B99744FBDB2BE0EB8A4984D6E0109401B19C3C60CF4935A3" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01.DDS")
Add-Hash -VariableName $var -Hash "A6C4AD71F80DCB7E8C2A37F0983B03864B5CB7F9134985313442287D84936594" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_d.DDS")
Add-Hash -VariableName $var -Hash "27223F90A501B18340FCA431F218902A5483F94B0BA1AEBCAE50036D3A56EADD" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_n.DDS")
Add-Hash -VariableName $var -Hash "6BAC4E1456BAC8182CD81CD7CC364AE52A138C8A0FD12A5816969CFE8AA65602" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\diamondcity\DiamondWood01_s.DDS")
Add-Hash -VariableName $var -Hash "2A82B4AD9633CA9232155DD4C46F22BBB714AAF02D217217D54C7E44128629C4" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Shacks\ShackPlywood02_d.DDS")
Add-Hash -VariableName $var -Hash "1384FEB18A5EB3F196E4E07E793A8FBE259F89E6EE4DFF181C760BA56E5C1155" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\Architecture\Unique\BunkerHillMonument\BHMarbleEdgeTrim01_d.DDS")
Add-Hash -VariableName $var -Hash "705A84DFA0DD34DC823E3ACDE6C0D25F4D485279871D5BFCF109909D2C8B78E6" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\Building\bldconcdamagegross02_d.DDS")
Add-Hash -VariableName $var -Hash "1DA79D97698301F6361045FF34E70CBE13CE61C670002D6810D113989B8FD224" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\Building\BldWindow01_d.DDS")
Add-Hash -VariableName $var -Hash "A006521449A7410F38627C81EE30883D62391DE6E2B9C2F2D305819930F7832D" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\Institute\InstitutePanel03_d.DDS")
Add-Hash -VariableName $var -Hash "21649EE3EACC112F8927A9B5B97464394A34859D6A4E5DD4F1CCF18B07065B8E" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled02Clinic_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "DE8FCE93C4620A2D66AA29C5219E60F7C4BC3DF51DAF4AF40840A18B4A5B20E4" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled04School02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "52E7F09AC9F4C0989D2E22B9252CAB3EB09B63FA6E2E10B03204E1EBA8CB9F65" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled04School_DAMAGE_d.DDS")
Add-Hash -VariableName $var -Hash "57A171BA3820D50D4DC661A878BD792C00D18CA39417B9D32E6F08C1AE85BC25" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "C85DA1BF814C115DD9ACA9F7120F9A076CE2DFE0C23162DFBEBA1F05D4E8E5C3" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "B456EEECEF272D8350F7E62E90F15A4C0ECAD3119A7052AF49EC4B01620DC8C3" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence03_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "8341D85234A4BCB282C1C23AC1BCA1F8AD289E1C744184DCEEE2E0B134DEA6A1" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence04_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "AB6BD58E0625A5326B7D462933BB24F380842F97C23B7ED63B9AEC51670D30F3" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled05Residence05Vintage_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "CE0DD44FE3B1446FF85B6834978684F5F4644233A08B814E28CDC8DD42D5E2AE" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled06AdminBlue_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "A54288D4CCCF49426BF512A4C3A29C70B84ADB913DAD8A9B8152B7CBD1EA92D1" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria01_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "D108E62A549845BBEF746986E801BB183B139A0245A8B99139DD635D51AAB25C" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "A501200BBF2AE3CF095E8880436E78AC569612D7352DF362087701ED33EF8ECD" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltHallResPaneled07Cafeteria03_Damage_d.DDS")
Add-Hash -VariableName $var -Hash "6E72CFD69EC64BAF1AB5AFE5B3E23F31BD81B8639F3E91F500EB77D68C14CDFB" -Tag $tag -FileName ($dir.patchedFiles + "\Textures\interiors\vault\VltSecretWindow01_d.DDS")

# TODO BiRaitBec bad file hashes


# patched ba2 hashes
# ------------------

# notes:
# when 'main' is used without 'performance', Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS is deleted
# when 'main' is used with 'performance', Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS from 'performance' is used instead
$patchedBa2Hashes = @{}; $var = "patchedBa2Hashes"
# # template
# $tag = ""
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.dlcCoastTextures
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.dlcRobotTextures
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures1
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures2
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures3
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures4
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures5
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures6
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures7
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures8
# Add-Hash -VariableName $var -Hash "" -Tag $tag -FileName $ba2Files.fallout4Textures9

# unchanged
$tag = "Unchanged"
Add-Hash -VariableName $var -Hash "2C5C0DAACEE8AA2ACB1322BB240EB96FE0CABDA7CB43A3FACB6B18B164DE0887" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "70D42CEAE56037AFB351FC171FE9D19BFE4C1FB1AFC90E1BE3DEDBA8D1C2FEDD" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "4153CD0C9974E8E7F26D4899CF578A874C3A6EFAEB4FCD41D1EB50781AAFA4EF" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "DFC9715CDE4B528CC3A4EC26D56E98F62461BD7F1474D63C0980778D5581C455" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "6D492F019132611ECDCEB29816F42FBD6A525693C6CCD4CB9C33D2A0A08AE559" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "48BCD1C76EBA6FD6B36602B693ED868152FC1623C5BBF6D7C2522EC5EE521733" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "F3E4FEFAFD1D9ED929B0DB1D0DFD7DAB55A0B549F81CC4304E0E557A4B74E83C" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "3B9465A676238A4BA69456C330ED2A3EA8EE21EA1FFA706B6DB7ED90AF354995" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "02F18F8DD1239F99F57ADE052415871E82581AE2E3459494FD61E93649B21C7F" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "6C40BFE12136CEDAE3DBB59E0D2ECF27C01D8E8526D72416067E022AB0B370FE" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "CD64B7DFEECBD1B7BCAA7AAA790D3C83C19D4C8C13911E915BDA8E03CBE030E4" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "E338B0337B896C857AAB0551C6DD3B9386222B213AD24663AA3D08A7953071AB" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "052C4865016F66A48082E5F797794FD630245543149BDD9A9E2E4A0ED4EB027C" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance
$tag = "Performance"
Add-Hash -VariableName $var -Hash "0A882B277317972031F5BA25B87560531E6690B94ECBAF480CD7CEE1D5BFBF5C" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "FDFF9E7E81DE92EAAAFD879B636935C0AC0894548741D953785AAAA8D5F9B22B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "2CB71A295E516060E993798FD97A60BFE70D98BE52AABF638F8CAFEC05FEB095" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "970293AEEAFD086ACEEFD91906CD553E385719956E2FFACD777F2B72144E0BFF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "C14634C150F7AD246A486C34E428C08320268396F9CB8A0E3ADC74F00C43FF7D" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "5D7B4F437B369EA89EC6EAD4ECA18A2F382E34973D55DE34002CAB29C779B5CC" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "1EAA3EA29F7FE76DAA3BCFD03E1515ACD5D1FCA7573AC9C04C4651B037CE8B3A" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "82BE43E5E5FB4034308B5A8686CC725B4ABD88F78DC07ED989DF546AC38AA362" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "74E8E170914EC865C719F10D7FB02C9245D5E72153403D48FDC669A0F6D74B5A" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "CCD303B4BD471677643313978C3BB941DC17FA44CD9E3890F8CF8CEC8D0DF827" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "D8FFB47F36FE993E9507DEE9B1C80F67AE3125AA65C41D6BE0F38DBD83C8475A" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "D454CA269E61CBB29E5D3BED9BC99B40825E71C1E8FA8B87CDE9F99C2914FE04" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "BFB4A12811F1D1CFADFD6D4D76EEF3D01F2D688284A46EB0433D74494CD9ED08" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main
$tag = "Main"
Add-Hash -VariableName $var -Hash "1C1509C393CFFE7DB4FCAD5D3EFF9214DC884CB7019B365C43DFC4093E527312" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "2D173730BBEC6D4DEB8F0076CDA3F9DAC6FCCB79284220D86119AD8F69A7CCCC" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "EC9B04A5A7612A8BC6BDF5FE02058DB35858725ECC6723626163A27C3B63D933" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "897A7977EB543EC9619A7017D9221CCC24A990E25AF093BBFD5CAAA7AD922EA2" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "600CBC9E4B389AE34EE5C9CE895D507CAB6A3FDE2E3F1944F2C02ADBEDB4210B" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "689172BEDA07D8F9255F59B680F9A20ED94E06B97D11189D46D44A5176D912B8" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "3E09D6916A2C406F4B901D3AA2C0B6E9E4375E8567FEE53ADA5D82453C9FC5BA" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "6C465881223725AD91DBAF922FF7407F109E4CEA00E92E09353E3C668599F5A4" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "EB8E87BF036767A61E3302FDAD9A611EACC7FC3AA14BEBC8287F65C3DA4C414D" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "F3B2E5470968D1BD54ED4A4723F311B85EDB5E4508DB1B2E84135118D01BFA81" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "38D9B726FEB6403B5EA2DD20C6E034EC35CFBAF8B94A13DA7BC3B4CEAADD6123" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "C749A686FE03A1EFABC6918978E7A27FAF98E91C62EA89D126A9FDAA2A2276AA" -Tag $tag -FileName $ba2Files.fallout4Textures9

# quality
$tag = "Quality"
Add-Hash -VariableName $var -Hash "34F486BFD7D70A7DB09A951E9B95D9C7558B41C1C31DBAE495A660A8E98F2015" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "ABA12B913CD9FCB225BD22F8A46E924BB6988BC6D8E06D5E74D94CDEC47ECE60" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "B2C1EFBFBADA664479B3645068AFF8F85626112D9928104B27A00241228189A4" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "A21C993869620B40739C5309D2C1665B1BF96D297DC9D6952D9CCC1B50851CE8" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "53889AB7794D9E0C2820A206FB5E1D7E71B522EE47F956D33DC1B657D7F2D5E7" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "8374E414B2E0E53640911467B7D00915A3A82B61C5F1F7E08D30E675C9801D59" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "4AB4F1305AEC452239E0CCE7DC31A228A2A9A3BB68DFF641A5017A622FAAE0C5" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "BCE648B2D1B66EA17EE16AE41CE31CA4377074AE6E341B0204E1169EC5E8C1FE" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "E6850A0AF2E26B9F771BAF835AAB74E9C5A072DA5AE9AEE6729119E69BC462D1" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "555351A1CC36A30ADBBA3CAA35DB7FE1FD14D5F5802E0D54521F9410D94D3EC3" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "A4674F10F52261144D58A10B9221C40BC9EB38461BC818DDA05AC4BC1B9E7295" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "DEA4AD5666065E4DDC6EE44EEAF92A426F69ED691296EBF459C6A5DC33FDA9A4" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "189EBC0EE508DE83FBBB99788E2EC31A8A148EE260800998C8A1680CA1993470" -Tag $tag -FileName $ba2Files.fallout4Textures9

# restyle
$tag = "Restyle"
Add-Hash -VariableName $var -Hash "2C5C0DAACEE8AA2ACB1322BB240EB96FE0CABDA7CB43A3FACB6B18B164DE0887" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "70D42CEAE56037AFB351FC171FE9D19BFE4C1FB1AFC90E1BE3DEDBA8D1C2FEDD" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "4153CD0C9974E8E7F26D4899CF578A874C3A6EFAEB4FCD41D1EB50781AAFA4EF" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "DFC9715CDE4B528CC3A4EC26D56E98F62461BD7F1474D63C0980778D5581C455" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "6D492F019132611ECDCEB29816F42FBD6A525693C6CCD4CB9C33D2A0A08AE559" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "48BCD1C76EBA6FD6B36602B693ED868152FC1623C5BBF6D7C2522EC5EE521733" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "F3E4FEFAFD1D9ED929B0DB1D0DFD7DAB55A0B549F81CC4304E0E557A4B74E83C" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "000CC6B8B046D32AF263B82A7E43BAE68BC7E21BA22ADEF47CC5CBC1E97D6AD4" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "7B84ACFE3D415D9E37DC234F8AB48336A58A06AD4207933EB4144B4FCCD0DF52" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "1DE2CC159D1D4FBD5FA9C3A50F2DB2BBCFF903DCD582589981C726D9DA797C70" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "50EC7C15B2A99F1123EE3E9F788116D3187D1AAC68DC3D6469B398062E18BFD5" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "63F8C62108E4815CAD91FD7327AEFF75084FADF93C68FE96F42DC7FA2FB8A478" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "052C4865016F66A48082E5F797794FD630245543149BDD9A9E2E4A0ED4EB027C" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main
$tag = @("Performance", "Main") -join $TagJoiner
Add-Hash -VariableName $var -Hash "F6978CC6A06718ED784C89EFC82181B28BEA350218485429A86D1C7A29ACD549" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "1935EC880BC3729F8A8D35CD926445E2216441BCA0CCC3EC63D609BF4EEDC3AB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "9F754D6A677C9F6E571D221A85C5318BDE4527946477B1A2AD0BD88FD89909DA" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "CFD1D5D93900362D7417C48C8595F487CC58B9D71DBF88BE740C326CD17BA86A" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "CD305518C5F0921BEC36213837CC8667E4E38860F57BAF97B338BB8973A2EC99" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "6028C82526AAA86F8A05E74DA9C145BAA712DECBEB0A63EF37F6485B039BB670" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "3F6109B7CBB12570CDED146C82298DB67A5C97196645FA0D63A02D319A22305C" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "0F71F9AB662E5A016A3ED009C4E09AE2DA77953898947651B39EA9DC5B5A9073" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "0C8FE52C7E68F76CB8D097F83E432577542A80774F9DAD28A7307F97BC06C424" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "9315D29B1C48C64FB41AB52920CCCD2CD708F6E538FD62E78F019263D0A903E3" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "0936E4CC23236203876766D5A995B360AE10CCA75FAD0B62E4C50CB5A0ED59E4" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "9F857EAEE1712308889FCC656F4B4128B5D3309C4CB0299A009634EABDC4F32E" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + quality
$tag = @("Performance", "Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "7CEC8DBE43313D8923843314B2902AA58EDC0B85A9C504D35FF0AC20D64DF6A1" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "CD42D1F85EE44CE0BF49203A07F451B36758727CDAA35A7F7603FDA49499F6A3" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "5FAF066CA92587554A42EC56DDBB50B3CB8F5FC12E5F1C33DFB71ACC15564BC6" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "E40B34678151D3B4927AF90E70004104EDA0A70E91479C9FC6B50A1E9CA44675" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4368A831A4A9BE1504B128E84D5D62EA5E16E9BC7090E633CBE21A4BF91F9D9A" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "15FEE74C880BEE5E5FBC0865A30985DAC4CD8D3470129E66F20B2E02CB307FE7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "7674D2BF7835230EFB9B7BD91F38535FD07771BDCEB2675A97E77237511724B9" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "5659F77322A6358169DE27D6118D037ED1447537CD6C17186AD8AAB062D3DC81" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "81E8C96EBFA81AEE0DBF1F7DAFD6865801A8C2C3A24FAD180D3F6B836D493977" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "F534041321A8E3305DCCB15B52982CC26B87F74167C4953E6EF2B94C4268B6DA" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "A1D732D6BC4820AB0B69AC3C89251606FF419BFE53FC062529E4DB6BCC68CFEF" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "206D526F5BE881A2207F7848B87EB0B2E1790ED880470A99AD79B1F706B0C793" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "29D5FFD16862CCE29054DF71B043643C8FEB6CB73EE27F88E87FC76C4FB5F87B" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + vault fix
$tag = @("Performance", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "0A882B277317972031F5BA25B87560531E6690B94ECBAF480CD7CEE1D5BFBF5C" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "FDFF9E7E81DE92EAAAFD879B636935C0AC0894548741D953785AAAA8D5F9B22B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "2CB71A295E516060E993798FD97A60BFE70D98BE52AABF638F8CAFEC05FEB095" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "970293AEEAFD086ACEEFD91906CD553E385719956E2FFACD777F2B72144E0BFF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "C14634C150F7AD246A486C34E428C08320268396F9CB8A0E3ADC74F00C43FF7D" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "5D7B4F437B369EA89EC6EAD4ECA18A2F382E34973D55DE34002CAB29C779B5CC" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "CD3BF0D63517F415ACAAD7D3B9AC7E510C0EEF07EF1B4DCE32F83C21869859CB" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "82BE43E5E5FB4034308B5A8686CC725B4ABD88F78DC07ED989DF546AC38AA362" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "74E8E170914EC865C719F10D7FB02C9245D5E72153403D48FDC669A0F6D74B5A" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "50B678C9366A807B622EB5F4FC8179B4606B78E618760F88A015561D878CFFB9" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "D8FFB47F36FE993E9507DEE9B1C80F67AE3125AA65C41D6BE0F38DBD83C8475A" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "E9B1FB348EA480CEC8F624E79BC49ECDD3B58EAEF7924C5AA696117CA7280BE5" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "BFB4A12811F1D1CFADFD6D4D76EEF3D01F2D688284A46EB0433D74494CD9ED08" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + restyle
$tag = @("Performance", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "0A882B277317972031F5BA25B87560531E6690B94ECBAF480CD7CEE1D5BFBF5C" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "FDFF9E7E81DE92EAAAFD879B636935C0AC0894548741D953785AAAA8D5F9B22B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "2CB71A295E516060E993798FD97A60BFE70D98BE52AABF638F8CAFEC05FEB095" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "970293AEEAFD086ACEEFD91906CD553E385719956E2FFACD777F2B72144E0BFF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "C14634C150F7AD246A486C34E428C08320268396F9CB8A0E3ADC74F00C43FF7D" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "5D7B4F437B369EA89EC6EAD4ECA18A2F382E34973D55DE34002CAB29C779B5CC" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "1EAA3EA29F7FE76DAA3BCFD03E1515ACD5D1FCA7573AC9C04C4651B037CE8B3A" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "0A225C468CD36429C69B0A19730E748DBAB3373CCE3E8278E1EC6B2C30FD70B5" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "42EE52BB696DC843354E023B0A83C15024BD7C7B8595391406BBC516D0A33995" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "A4BC19407A5567CF43A77F4DA970B194D3B7B2FC8FECEDE082C0C8133929D462" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "DE29E61BCB021B88DF9F43C910833C0CDBE111F5D0AD375A8B272111B5CDA3BE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "DA96C00455960502A87D3FBC9C62A7937200E8D94BD3DA5C7B067A00AE738230" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "BFB4A12811F1D1CFADFD6D4D76EEF3D01F2D688284A46EB0433D74494CD9ED08" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + quality
$tag = @("Main", "Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "8ACC2CB649575D8F68D296B053FBB9D007A41317CAFA9C7A424A560FA73DF6DD" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "886200F0BF7B6BEA8CC939A907163CD45636CF416F603B9D38C152307AB2A6EB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "83283D012B29822569CD28D40ABA7BF87D1164D68FC8927E342897F54B69A2AB" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "C26CE6411DBB26FFE7B6776DB3836113740260F70D864336240327133A057757" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "DB59CFF1F08E809FD4D6662106DA5C2F543F1C08BE4F43EB46DF398AA9890A16" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "47780ACD503DFE6414322E1B3E3DED35B3B1088451AC78EAB844D8F24D38EFAF" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "B2A212A509CDA1E505F93808459A7E40C265ECD3041473EF1C697A24D2C75650" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "704758115D8292420EC69118C224F488401A9407BA8FC0E865434ECF1AD4AAAF" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "44C58287C25A2AB2BE99224CABBCFE649AE91291394C1B028A64ABD3975E88FE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "473734DC40E1BDD0CE38F08A3220861A56380D9EC1705C018ACED25A27B28E92" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "B2BBAE534CB65A27C268CFC0394968BEA7B547E90E8A170E325D79485492F6FC" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + vault fix
$tag = @("Main", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "1C1509C393CFFE7DB4FCAD5D3EFF9214DC884CB7019B365C43DFC4093E527312" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "2D173730BBEC6D4DEB8F0076CDA3F9DAC6FCCB79284220D86119AD8F69A7CCCC" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "EC9B04A5A7612A8BC6BDF5FE02058DB35858725ECC6723626163A27C3B63D933" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "897A7977EB543EC9619A7017D9221CCC24A990E25AF093BBFD5CAAA7AD922EA2" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "600CBC9E4B389AE34EE5C9CE895D507CAB6A3FDE2E3F1944F2C02ADBEDB4210B" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "689172BEDA07D8F9255F59B680F9A20ED94E06B97D11189D46D44A5176D912B8" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "3E09D6916A2C406F4B901D3AA2C0B6E9E4375E8567FEE53ADA5D82453C9FC5BA" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "6C465881223725AD91DBAF922FF7407F109E4CEA00E92E09353E3C668599F5A4" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "EB8E87BF036767A61E3302FDAD9A611EACC7FC3AA14BEBC8287F65C3DA4C414D" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "F3B2E5470968D1BD54ED4A4723F311B85EDB5E4508DB1B2E84135118D01BFA81" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "38D9B726FEB6403B5EA2DD20C6E034EC35CFBAF8B94A13DA7BC3B4CEAADD6123" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "C749A686FE03A1EFABC6918978E7A27FAF98E91C62EA89D126A9FDAA2A2276AA" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + restyle
$tag = @("Main", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "1C1509C393CFFE7DB4FCAD5D3EFF9214DC884CB7019B365C43DFC4093E527312" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "2D173730BBEC6D4DEB8F0076CDA3F9DAC6FCCB79284220D86119AD8F69A7CCCC" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "EC9B04A5A7612A8BC6BDF5FE02058DB35858725ECC6723626163A27C3B63D933" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "897A7977EB543EC9619A7017D9221CCC24A990E25AF093BBFD5CAAA7AD922EA2" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "600CBC9E4B389AE34EE5C9CE895D507CAB6A3FDE2E3F1944F2C02ADBEDB4210B" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "689172BEDA07D8F9255F59B680F9A20ED94E06B97D11189D46D44A5176D912B8" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "AE80EA0F28B0871EF7C1626C57017CC0B7753F3AD43B43A841B869B1D78FF957" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "3320BD16DA9642BE69C5BB0E733AE0995BCD1D0B5955AEE4B020D856BAE2F2C6" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "71BE395A1481008B446D1DFC7E0DFA9C3D1A2C80FDF2ACE44A61231AE8D1FC8C" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "F3B2E5470968D1BD54ED4A4723F311B85EDB5E4508DB1B2E84135118D01BFA81" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "42C0ED22E9E948EC6E0A568FC57E52E541EC39F48D61F88D48CD565DB764849D" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "C749A686FE03A1EFABC6918978E7A27FAF98E91C62EA89D126A9FDAA2A2276AA" -Tag $tag -FileName $ba2Files.fallout4Textures9

# quality + vault fix
$tag = @("Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "34F486BFD7D70A7DB09A951E9B95D9C7558B41C1C31DBAE495A660A8E98F2015" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "ABA12B913CD9FCB225BD22F8A46E924BB6988BC6D8E06D5E74D94CDEC47ECE60" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "B2C1EFBFBADA664479B3645068AFF8F85626112D9928104B27A00241228189A4" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "A21C993869620B40739C5309D2C1665B1BF96D297DC9D6952D9CCC1B50851CE8" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "53889AB7794D9E0C2820A206FB5E1D7E71B522EE47F956D33DC1B657D7F2D5E7" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "8374E414B2E0E53640911467B7D00915A3A82B61C5F1F7E08D30E675C9801D59" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "AB9C4088193F7C8E39F163C8CA13BAF3589B4353C29F7BE1E970A1671DADEFB1" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "BCE648B2D1B66EA17EE16AE41CE31CA4377074AE6E341B0204E1169EC5E8C1FE" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "E6850A0AF2E26B9F771BAF835AAB74E9C5A072DA5AE9AEE6729119E69BC462D1" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "4EF83145CB444F4DA925F380F49805D77578358667D23A21DEC34BBCF3520D89" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "A4674F10F52261144D58A10B9221C40BC9EB38461BC818DDA05AC4BC1B9E7295" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "EDE007B18CF31ACCD69C977464C3B19B2239D21BEA6F70A74A2E2EB51FC2BE12" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "189EBC0EE508DE83FBBB99788E2EC31A8A148EE260800998C8A1680CA1993470" -Tag $tag -FileName $ba2Files.fallout4Textures9

# quality + restyle
$tag = @("Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "34F486BFD7D70A7DB09A951E9B95D9C7558B41C1C31DBAE495A660A8E98F2015" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "ABA12B913CD9FCB225BD22F8A46E924BB6988BC6D8E06D5E74D94CDEC47ECE60" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "B2C1EFBFBADA664479B3645068AFF8F85626112D9928104B27A00241228189A4" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "A21C993869620B40739C5309D2C1665B1BF96D297DC9D6952D9CCC1B50851CE8" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "53889AB7794D9E0C2820A206FB5E1D7E71B522EE47F956D33DC1B657D7F2D5E7" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "8374E414B2E0E53640911467B7D00915A3A82B61C5F1F7E08D30E675C9801D59" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "4AB4F1305AEC452239E0CCE7DC31A228A2A9A3BB68DFF641A5017A622FAAE0C5" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "DEC76FB6579CF0B6FD0D1EEEC501EFDDEF4738D7D91CAE0DF9F0C852EFC1B867" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "37730D222973D0BED4C8A2D9825C08011BC16F68A080D21B3715A01F15C38365" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "184234EA582BAEAB47733D5C6FFD46FDAE87D60096BE5D060B4C50FB49027107" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "4CFFD0C03EF84490F6295A6D6D7210D5ECF735B8CFA4CEC9492139B4384E9FD2" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "D9FC97DD378EF3DB205CB7244DD73D6647EAC62DC61D6BDEE6788A50BAAD87E9" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "189EBC0EE508DE83FBBB99788E2EC31A8A148EE260800998C8A1680CA1993470" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + quality
$tag = @("Performance", "Main", "Quality") -join $TagJoiner
Add-Hash -VariableName $var -Hash "BC61C83C915196BAC3B1570E665C657FB7D7D8FAA379DEB42D472A0398B29016" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "40628728C62307E86AF0243E0EAB448D12255094C8BD73A005679B87DC3D564E" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "66E30153209FE9AED21F1FE593EBECCCB52B7167C5DE6F3637E591BD7D747BDD" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "F0CCD11D2DFDA389D470EC75D947BDCA53B405CCBB7131CB28EE137CED2620F2" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "CDD33131D35B1ACCA65E9F40DCD938F1E7E44F89C2EF31EFEEF80D4E8088E00A" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "C4E14094811210695AC0446FEA2EC32FC5329E878F526FE47A7D9F3FCFE23CCE" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "2277C1AD4B8A08B07D9A1564A7D54FC59FC7E5C23A172CA408E3AECC7C16022F" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "1689FB862B7A595F220E8E469B44CBB67C138EFB6127364C15CEA54B634F3BBB" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "4139381282347E97A2B0921B9A4C26BB20B83D02023FC2F698C136CDC438DCF8" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "499E94C47680A8E7AC02FCF69349D42BF78018380ECA931A425CEB1E26BC9B15" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D422789209B67839D479DEA076D386AECC22903D71F692A0A02BB4E38E6FDC11" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + vault fix
$tag = @("Performance", "Main", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "F6978CC6A06718ED784C89EFC82181B28BEA350218485429A86D1C7A29ACD549" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "1935EC880BC3729F8A8D35CD926445E2216441BCA0CCC3EC63D609BF4EEDC3AB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "9F754D6A677C9F6E571D221A85C5318BDE4527946477B1A2AD0BD88FD89909DA" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "CFD1D5D93900362D7417C48C8595F487CC58B9D71DBF88BE740C326CD17BA86A" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "CD305518C5F0921BEC36213837CC8667E4E38860F57BAF97B338BB8973A2EC99" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "6028C82526AAA86F8A05E74DA9C145BAA712DECBEB0A63EF37F6485B039BB670" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "3F6109B7CBB12570CDED146C82298DB67A5C97196645FA0D63A02D319A22305C" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "0F71F9AB662E5A016A3ED009C4E09AE2DA77953898947651B39EA9DC5B5A9073" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "0C8FE52C7E68F76CB8D097F83E432577542A80774F9DAD28A7307F97BC06C424" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "9315D29B1C48C64FB41AB52920CCCD2CD708F6E538FD62E78F019263D0A903E3" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "0936E4CC23236203876766D5A995B360AE10CCA75FAD0B62E4C50CB5A0ED59E4" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "9F857EAEE1712308889FCC656F4B4128B5D3309C4CB0299A009634EABDC4F32E" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + restyle
$tag = @("Performance", "Main", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "F6978CC6A06718ED784C89EFC82181B28BEA350218485429A86D1C7A29ACD549" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "1935EC880BC3729F8A8D35CD926445E2216441BCA0CCC3EC63D609BF4EEDC3AB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "9F754D6A677C9F6E571D221A85C5318BDE4527946477B1A2AD0BD88FD89909DA" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "CFD1D5D93900362D7417C48C8595F487CC58B9D71DBF88BE740C326CD17BA86A" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "CD305518C5F0921BEC36213837CC8667E4E38860F57BAF97B338BB8973A2EC99" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "6028C82526AAA86F8A05E74DA9C145BAA712DECBEB0A63EF37F6485B039BB670" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "9E517B55EB878E50C7D8D4887F32D0B90A20F56DFFE10E0EB99157B8758732E4" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "F6ED2A2221E3A21DD0D5655F72465DD956EA779A1AAB52038231D32ECFFD9872" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "E7BBF62EE6EDCD4562CBA52795B807A6CD1AD744CC385DE57AEAF353A2BABA61" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "9315D29B1C48C64FB41AB52920CCCD2CD708F6E538FD62E78F019263D0A903E3" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "AAB67DB46106EED6F8C5A909695DD47E0622113B451932BB77681FC1CC47DD54" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "9F857EAEE1712308889FCC656F4B4128B5D3309C4CB0299A009634EABDC4F32E" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + quality + vault fix
$tag = @("Performance", "Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "7CEC8DBE43313D8923843314B2902AA58EDC0B85A9C504D35FF0AC20D64DF6A1" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "CD42D1F85EE44CE0BF49203A07F451B36758727CDAA35A7F7603FDA49499F6A3" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "5FAF066CA92587554A42EC56DDBB50B3CB8F5FC12E5F1C33DFB71ACC15564BC6" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "E40B34678151D3B4927AF90E70004104EDA0A70E91479C9FC6B50A1E9CA44675" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4368A831A4A9BE1504B128E84D5D62EA5E16E9BC7090E633CBE21A4BF91F9D9A" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "15FEE74C880BEE5E5FBC0865A30985DAC4CD8D3470129E66F20B2E02CB307FE7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "2DB129A6AAB280A8CFC21260B710D54F5768FCA9807C7F86AD7436AE39C27B28" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "5659F77322A6358169DE27D6118D037ED1447537CD6C17186AD8AAB062D3DC81" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "81E8C96EBFA81AEE0DBF1F7DAFD6865801A8C2C3A24FAD180D3F6B836D493977" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "51B0128E0353482D27A27AE56CD0C29DB28DF49F6F879FC539C7808554D550AF" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "A1D732D6BC4820AB0B69AC3C89251606FF419BFE53FC062529E4DB6BCC68CFEF" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "EEDB1E0385664F00F5F8F9591075ED204BB6AE3F0E9A3DB125880E7D0C03342C" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "29D5FFD16862CCE29054DF71B043643C8FEB6CB73EE27F88E87FC76C4FB5F87B" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + quality + restyle
$tag = @("Performance", "Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "7CEC8DBE43313D8923843314B2902AA58EDC0B85A9C504D35FF0AC20D64DF6A1" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "CD42D1F85EE44CE0BF49203A07F451B36758727CDAA35A7F7603FDA49499F6A3" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "5FAF066CA92587554A42EC56DDBB50B3CB8F5FC12E5F1C33DFB71ACC15564BC6" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "E40B34678151D3B4927AF90E70004104EDA0A70E91479C9FC6B50A1E9CA44675" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4368A831A4A9BE1504B128E84D5D62EA5E16E9BC7090E633CBE21A4BF91F9D9A" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "15FEE74C880BEE5E5FBC0865A30985DAC4CD8D3470129E66F20B2E02CB307FE7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "7674D2BF7835230EFB9B7BD91F38535FD07771BDCEB2675A97E77237511724B9" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "CBE111F1F80BFEE360E6178D1D21B199AA33B287279F2B689871923C8BB0F311" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "44E8EA855E0C789B4074FFD9C9E8CA76BAD3141FC72BCD483B8187C6F1D0108F" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "C60AC9F975D5BB53735E59043F80B9342A3151AEB2D509827C375ED9AB5FC6CC" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "9EF93D83E2D7B40AAB22F6BBECF2C39C974C5197F229D19B5BED81EE5E3E7A3B" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "089D31B02E086C1C8D2CEFA06336A07D6158FBB0A55B4F838C7FDE021331E772" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "29D5FFD16862CCE29054DF71B043643C8FEB6CB73EE27F88E87FC76C4FB5F87B" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + vault fix + restyle
$tag = @("Performance", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "0A882B277317972031F5BA25B87560531E6690B94ECBAF480CD7CEE1D5BFBF5C" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "FDFF9E7E81DE92EAAAFD879B636935C0AC0894548741D953785AAAA8D5F9B22B" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "2CB71A295E516060E993798FD97A60BFE70D98BE52AABF638F8CAFEC05FEB095" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "970293AEEAFD086ACEEFD91906CD553E385719956E2FFACD777F2B72144E0BFF" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "C14634C150F7AD246A486C34E428C08320268396F9CB8A0E3ADC74F00C43FF7D" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "5D7B4F437B369EA89EC6EAD4ECA18A2F382E34973D55DE34002CAB29C779B5CC" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "CD3BF0D63517F415ACAAD7D3B9AC7E510C0EEF07EF1B4DCE32F83C21869859CB" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "0A225C468CD36429C69B0A19730E748DBAB3373CCE3E8278E1EC6B2C30FD70B5" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "42EE52BB696DC843354E023B0A83C15024BD7C7B8595391406BBC516D0A33995" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "A4BC19407A5567CF43A77F4DA970B194D3B7B2FC8FECEDE082C0C8133929D462" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "DE29E61BCB021B88DF9F43C910833C0CDBE111F5D0AD375A8B272111B5CDA3BE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "B0B4630DFF9FEFFA7B58B66A6D987A0A79871727E7CE89EA0C3BFBDA5D33582E" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "BFB4A12811F1D1CFADFD6D4D76EEF3D01F2D688284A46EB0433D74494CD9ED08" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + quality + vault fix
$tag = @("Main", "Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "8ACC2CB649575D8F68D296B053FBB9D007A41317CAFA9C7A424A560FA73DF6DD" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "886200F0BF7B6BEA8CC939A907163CD45636CF416F603B9D38C152307AB2A6EB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "83283D012B29822569CD28D40ABA7BF87D1164D68FC8927E342897F54B69A2AB" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "C26CE6411DBB26FFE7B6776DB3836113740260F70D864336240327133A057757" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "D83A07AC5C68B0AE05100663E7C868EF2BDAAAF21CBA6D9C1F36BA742CF12094" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "47780ACD503DFE6414322E1B3E3DED35B3B1088451AC78EAB844D8F24D38EFAF" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "B2A212A509CDA1E505F93808459A7E40C265ECD3041473EF1C697A24D2C75650" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "704758115D8292420EC69118C224F488401A9407BA8FC0E865434ECF1AD4AAAF" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "44C58287C25A2AB2BE99224CABBCFE649AE91291394C1B028A64ABD3975E88FE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "473734DC40E1BDD0CE38F08A3220861A56380D9EC1705C018ACED25A27B28E92" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "B2BBAE534CB65A27C268CFC0394968BEA7B547E90E8A170E325D79485492F6FC" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + quality + restyle
$tag = @("Main", "Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "8ACC2CB649575D8F68D296B053FBB9D007A41317CAFA9C7A424A560FA73DF6DD" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "886200F0BF7B6BEA8CC939A907163CD45636CF416F603B9D38C152307AB2A6EB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "83283D012B29822569CD28D40ABA7BF87D1164D68FC8927E342897F54B69A2AB" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "C26CE6411DBB26FFE7B6776DB3836113740260F70D864336240327133A057757" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "DB59CFF1F08E809FD4D6662106DA5C2F543F1C08BE4F43EB46DF398AA9890A16" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "61F6D23CF7CE640D5B96A8AAFA89DD036F22B77EE11753DC88C975428A6533EB" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "C48C7459FC2AE0F2FF12F5E4B913A460495D8156B9DA603996FF082364813797" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "D4D523C77743038840EF0C83AD9924FFF94BCD49A4CA27991FD91B6EF687DDDA" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "44C58287C25A2AB2BE99224CABBCFE649AE91291394C1B028A64ABD3975E88FE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "4DFA7CF25D9BC94446D3FAFE50E054B6E16063C5EB5A7BF2145E711DF93BC313" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "B2BBAE534CB65A27C268CFC0394968BEA7B547E90E8A170E325D79485492F6FC" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + vault fix + restyle
$tag = @("Main", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "1C1509C393CFFE7DB4FCAD5D3EFF9214DC884CB7019B365C43DFC4093E527312" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "2D173730BBEC6D4DEB8F0076CDA3F9DAC6FCCB79284220D86119AD8F69A7CCCC" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "EC9B04A5A7612A8BC6BDF5FE02058DB35858725ECC6723626163A27C3B63D933" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "897A7977EB543EC9619A7017D9221CCC24A990E25AF093BBFD5CAAA7AD922EA2" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "600CBC9E4B389AE34EE5C9CE895D507CAB6A3FDE2E3F1944F2C02ADBEDB4210B" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "689172BEDA07D8F9255F59B680F9A20ED94E06B97D11189D46D44A5176D912B8" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "AE80EA0F28B0871EF7C1626C57017CC0B7753F3AD43B43A841B869B1D78FF957" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "3320BD16DA9642BE69C5BB0E733AE0995BCD1D0B5955AEE4B020D856BAE2F2C6" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "71BE395A1481008B446D1DFC7E0DFA9C3D1A2C80FDF2ACE44A61231AE8D1FC8C" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "F3B2E5470968D1BD54ED4A4723F311B85EDB5E4508DB1B2E84135118D01BFA81" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "42C0ED22E9E948EC6E0A568FC57E52E541EC39F48D61F88D48CD565DB764849D" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "C749A686FE03A1EFABC6918978E7A27FAF98E91C62EA89D126A9FDAA2A2276AA" -Tag $tag -FileName $ba2Files.fallout4Textures9

# quality + vault fix + restyle
$tag = @("Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "34F486BFD7D70A7DB09A951E9B95D9C7558B41C1C31DBAE495A660A8E98F2015" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "ABA12B913CD9FCB225BD22F8A46E924BB6988BC6D8E06D5E74D94CDEC47ECE60" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "B2C1EFBFBADA664479B3645068AFF8F85626112D9928104B27A00241228189A4" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "A21C993869620B40739C5309D2C1665B1BF96D297DC9D6952D9CCC1B50851CE8" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "53889AB7794D9E0C2820A206FB5E1D7E71B522EE47F956D33DC1B657D7F2D5E7" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "8374E414B2E0E53640911467B7D00915A3A82B61C5F1F7E08D30E675C9801D59" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "AB9C4088193F7C8E39F163C8CA13BAF3589B4353C29F7BE1E970A1671DADEFB1" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "DEC76FB6579CF0B6FD0D1EEEC501EFDDEF4738D7D91CAE0DF9F0C852EFC1B867" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "37730D222973D0BED4C8A2D9825C08011BC16F68A080D21B3715A01F15C38365" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "184234EA582BAEAB47733D5C6FFD46FDAE87D60096BE5D060B4C50FB49027107" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "4CFFD0C03EF84490F6295A6D6D7210D5ECF735B8CFA4CEC9492139B4384E9FD2" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "50EDA5A46BE78DB1124A34D53AC552D09FEFD7A1E2855F8688A4DF5C6B5616A7" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "189EBC0EE508DE83FBBB99788E2EC31A8A148EE260800998C8A1680CA1993470" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + quality + vault fix
$tag = @("Performance", "Main", "Quality", "Vault Fix") -join $TagJoiner
Add-Hash -VariableName $var -Hash "BC61C83C915196BAC3B1570E665C657FB7D7D8FAA379DEB42D472A0398B29016" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "40628728C62307E86AF0243E0EAB448D12255094C8BD73A005679B87DC3D564E" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "66E30153209FE9AED21F1FE593EBECCCB52B7167C5DE6F3637E591BD7D747BDD" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "F0CCD11D2DFDA389D470EC75D947BDCA53B405CCBB7131CB28EE137CED2620F2" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "38FA1FF29DA1B834BA361FEA5DA94FA95584131EFB0E7D78C1DB67EDF1A6711B" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "C4E14094811210695AC0446FEA2EC32FC5329E878F526FE47A7D9F3FCFE23CCE" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "2277C1AD4B8A08B07D9A1564A7D54FC59FC7E5C23A172CA408E3AECC7C16022F" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "1689FB862B7A595F220E8E469B44CBB67C138EFB6127364C15CEA54B634F3BBB" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "4139381282347E97A2B0921B9A4C26BB20B83D02023FC2F698C136CDC438DCF8" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "499E94C47680A8E7AC02FCF69349D42BF78018380ECA931A425CEB1E26BC9B15" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D422789209B67839D479DEA076D386AECC22903D71F692A0A02BB4E38E6FDC11" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + quality + restyle
$tag = @("Performance", "Main", "Quality", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "BC61C83C915196BAC3B1570E665C657FB7D7D8FAA379DEB42D472A0398B29016" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "40628728C62307E86AF0243E0EAB448D12255094C8BD73A005679B87DC3D564E" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "66E30153209FE9AED21F1FE593EBECCCB52B7167C5DE6F3637E591BD7D747BDD" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "F0CCD11D2DFDA389D470EC75D947BDCA53B405CCBB7131CB28EE137CED2620F2" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "CDD33131D35B1ACCA65E9F40DCD938F1E7E44F89C2EF31EFEEF80D4E8088E00A" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "2A3FE5E6B184ED2360E9768F1482C44EB8DE8899E609D59814CBB959D7E07E19" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "E3972F6FB8E88955E81B670F02A53EE7FAC3BDFD6E8A696FF770C4D7EBBBEE32" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "ECB9DB35306F6EC6BF525684A2142D29AE4789139B20D41B1AE530B7EE1809EC" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "4139381282347E97A2B0921B9A4C26BB20B83D02023FC2F698C136CDC438DCF8" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "3297CBFC155CBD9FB01435C6A65A0345FABDB1492CD91C91ED3B9D213AA4EB42" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D422789209B67839D479DEA076D386AECC22903D71F692A0A02BB4E38E6FDC11" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + vault fix + restyle
$tag = @("Performance", "Main", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "F6978CC6A06718ED784C89EFC82181B28BEA350218485429A86D1C7A29ACD549" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "1935EC880BC3729F8A8D35CD926445E2216441BCA0CCC3EC63D609BF4EEDC3AB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "9F754D6A677C9F6E571D221A85C5318BDE4527946477B1A2AD0BD88FD89909DA" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "CFD1D5D93900362D7417C48C8595F487CC58B9D71DBF88BE740C326CD17BA86A" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "58B6857277E707F0F96B5EFA1252759481C75D7FF24C904F72C5A2EB9872C4C1" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "CD305518C5F0921BEC36213837CC8667E4E38860F57BAF97B338BB8973A2EC99" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "6028C82526AAA86F8A05E74DA9C145BAA712DECBEB0A63EF37F6485B039BB670" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "9E517B55EB878E50C7D8D4887F32D0B90A20F56DFFE10E0EB99157B8758732E4" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "F6ED2A2221E3A21DD0D5655F72465DD956EA779A1AAB52038231D32ECFFD9872" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "E7BBF62EE6EDCD4562CBA52795B807A6CD1AD744CC385DE57AEAF353A2BABA61" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "9315D29B1C48C64FB41AB52920CCCD2CD708F6E538FD62E78F019263D0A903E3" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "AAB67DB46106EED6F8C5A909695DD47E0622113B451932BB77681FC1CC47DD54" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "9F857EAEE1712308889FCC656F4B4128B5D3309C4CB0299A009634EABDC4F32E" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + quality + vault fix + restyle
$tag = @("Performance", "Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "7CEC8DBE43313D8923843314B2902AA58EDC0B85A9C504D35FF0AC20D64DF6A1" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "CD42D1F85EE44CE0BF49203A07F451B36758727CDAA35A7F7603FDA49499F6A3" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "5FAF066CA92587554A42EC56DDBB50B3CB8F5FC12E5F1C33DFB71ACC15564BC6" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "E40B34678151D3B4927AF90E70004104EDA0A70E91479C9FC6B50A1E9CA44675" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4368A831A4A9BE1504B128E84D5D62EA5E16E9BC7090E633CBE21A4BF91F9D9A" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "15FEE74C880BEE5E5FBC0865A30985DAC4CD8D3470129E66F20B2E02CB307FE7" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "2DB129A6AAB280A8CFC21260B710D54F5768FCA9807C7F86AD7436AE39C27B28" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "CBE111F1F80BFEE360E6178D1D21B199AA33B287279F2B689871923C8BB0F311" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "44E8EA855E0C789B4074FFD9C9E8CA76BAD3141FC72BCD483B8187C6F1D0108F" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "C60AC9F975D5BB53735E59043F80B9342A3151AEB2D509827C375ED9AB5FC6CC" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "9EF93D83E2D7B40AAB22F6BBECF2C39C974C5197F229D19B5BED81EE5E3E7A3B" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "AFD4E8DA792D2665C75254F759165A64AE03BBD4CB60CEFFAA41945EB089BC21" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "29D5FFD16862CCE29054DF71B043643C8FEB6CB73EE27F88E87FC76C4FB5F87B" -Tag $tag -FileName $ba2Files.fallout4Textures9

# main + quality + vault fix + restyle
$tag = @("Main", "Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "8ACC2CB649575D8F68D296B053FBB9D007A41317CAFA9C7A424A560FA73DF6DD" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "886200F0BF7B6BEA8CC939A907163CD45636CF416F603B9D38C152307AB2A6EB" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "83283D012B29822569CD28D40ABA7BF87D1164D68FC8927E342897F54B69A2AB" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "C26CE6411DBB26FFE7B6776DB3836113740260F70D864336240327133A057757" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "D83A07AC5C68B0AE05100663E7C868EF2BDAAAF21CBA6D9C1F36BA742CF12094" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "61F6D23CF7CE640D5B96A8AAFA89DD036F22B77EE11753DC88C975428A6533EB" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "C48C7459FC2AE0F2FF12F5E4B913A460495D8156B9DA603996FF082364813797" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "D4D523C77743038840EF0C83AD9924FFF94BCD49A4CA27991FD91B6EF687DDDA" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "44C58287C25A2AB2BE99224CABBCFE649AE91291394C1B028A64ABD3975E88FE" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "4DFA7CF25D9BC94446D3FAFE50E054B6E16063C5EB5A7BF2145E711DF93BC313" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "03A335F9B4FE21A3A28656D135AD638E74A0998E464606A4EAA6AD85D9D53765" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "1BFADF070877224D8E961811626A0CECE7A564771158C0272A6E971D951FC55E" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "B2BBAE534CB65A27C268CFC0394968BEA7B547E90E8A170E325D79485492F6FC" -Tag $tag -FileName $ba2Files.fallout4Textures9

# performance + main + quality + vault fix + restyle
$tag = @("Performance", "Main", "Quality", "Vault Fix", "Restyle") -join $TagJoiner
Add-Hash -VariableName $var -Hash "BC61C83C915196BAC3B1570E665C657FB7D7D8FAA379DEB42D472A0398B29016" -Tag $tag -FileName $ba2Files.dlcCoastTextures
Add-Hash -VariableName $var -Hash "40628728C62307E86AF0243E0EAB448D12255094C8BD73A005679B87DC3D564E" -Tag $tag -FileName $ba2Files.dlcNukaWorldTextures
Add-Hash -VariableName $var -Hash "66E30153209FE9AED21F1FE593EBECCCB52B7167C5DE6F3637E591BD7D747BDD" -Tag $tag -FileName $ba2Files.dlcRobotTextures
Add-Hash -VariableName $var -Hash "236CB14A11123407707A69DBD5998775F4BBF71D257038BC048B22A613639073" -Tag $tag -FileName $ba2Files.dlcWorkshop1Textures
Add-Hash -VariableName $var -Hash "4FD022F8DCDB022C886064C0EB1198D4C64404DDF2A196456CF5FB9875511C59" -Tag $tag -FileName $ba2Files.dlcWorkshop2Textures
Add-Hash -VariableName $var -Hash "F0CCD11D2DFDA389D470EC75D947BDCA53B405CCBB7131CB28EE137CED2620F2" -Tag $tag -FileName $ba2Files.dlcWorkshop3Textures
Add-Hash -VariableName $var -Hash "38FA1FF29DA1B834BA361FEA5DA94FA95584131EFB0E7D78C1DB67EDF1A6711B" -Tag $tag -FileName $ba2Files.fallout4Textures1
Add-Hash -VariableName $var -Hash "2A3FE5E6B184ED2360E9768F1482C44EB8DE8899E609D59814CBB959D7E07E19" -Tag $tag -FileName $ba2Files.fallout4Textures2
Add-Hash -VariableName $var -Hash "E3972F6FB8E88955E81B670F02A53EE7FAC3BDFD6E8A696FF770C4D7EBBBEE32" -Tag $tag -FileName $ba2Files.fallout4Textures3
Add-Hash -VariableName $var -Hash "ECB9DB35306F6EC6BF525684A2142D29AE4789139B20D41B1AE530B7EE1809EC" -Tag $tag -FileName $ba2Files.fallout4Textures4
Add-Hash -VariableName $var -Hash "4139381282347E97A2B0921B9A4C26BB20B83D02023FC2F698C136CDC438DCF8" -Tag $tag -FileName $ba2Files.fallout4Textures5
Add-Hash -VariableName $var -Hash "3297CBFC155CBD9FB01435C6A65A0345FABDB1492CD91C91ED3B9D213AA4EB42" -Tag $tag -FileName $ba2Files.fallout4Textures6
Add-Hash -VariableName $var -Hash "F481C1B1E236602DF14C06D6697918A3CE951CA7ABD8432489C4B42107816B82" -Tag $tag -FileName $ba2Files.fallout4Textures7
Add-Hash -VariableName $var -Hash "8C33901A7EFB29DACF297CE9A16F0B1B3BE95E240E945D2A82E0AFEB373EA4A9" -Tag $tag -FileName $ba2Files.fallout4Textures8
Add-Hash -VariableName $var -Hash "D422789209B67839D479DEA076D386AECC22903D71F692A0A02BB4E38E6FDC11" -Tag $tag -FileName $ba2Files.fallout4Textures9
