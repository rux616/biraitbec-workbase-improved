# file hashes
# -----------

Write-Host "Loading hashes..."

Set-Variable "HashesVersion" -Value $(New-Object "System.Version" -ArgumentList @(1, 0, 0))

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
$tag = "Restyle"
Add-Hash -VariableName $var -Hash "8ED930478DDB5DAC02A03461F860250D5E7EF4E9993DAE9710253C218EF73D5B" -Tag $tag -FileName $repackFiles.Restyle[0]

$originalBa2Hashes = @{}; $var = "originalBa2Hashes"
# game version 1.10.163.0 (steam build ID 4460038)
$tag = "1.10.163.0-4460038"
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

# notes:
# when 'main' is used without 'performance', Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS is deleted
# when 'main' is used with 'performance', Textures\interiors\vault\VltHallResPaneled07Cafeteria02_Damage_d.DDS from 'performance' is used instead
$patchedBa2Hashes = @{}; $var = "patchedBa2Hashes"
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
$tag = "Performance${TagJoiner}Main"
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
$tag = "Performance${TagJoiner}Quality"
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

# performance + restyle
$tag = "Performance${TagJoiner}Restyle"
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
$tag = "Main${TagJoiner}Quality"
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

# main + restyle
$tag = "Main${TagJoiner}Restyle"
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

# quality + restyle
$tag = "Quality${TagJoiner}Restyle"
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
$tag = "Performance${TagJoiner}Main${TagJoiner}Quality"
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

# performance + main + restyle
$tag = "Performance${TagJoiner}Main${TagJoiner}Restyle"
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

# performance + quality + restyle
$tag = "Performance${TagJoiner}Quality${TagJoiner}Restyle"
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

# main + quality + restyle
$tag = "Main${TagJoiner}Quality${TagJoiner}Restyle"
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

# performance + main + quality + restyle
$tag = "Performance${TagJoiner}Main${TagJoiner}Quality${TagJoiner}Restyle"
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
