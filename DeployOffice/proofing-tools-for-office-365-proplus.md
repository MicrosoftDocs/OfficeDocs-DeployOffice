---
title: "Proofing Tools for Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 10/11/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DeployProPlus
- DeployProPlus_SOConly
- Ent_Office_ProPlus
ms.assetid: 21c562f2-2e54-452d-8ef5-e39c236bfaf1
description: "Each language version of Office 2016 includes proofing tools for a set of companion languages. For example, when you deploy the English version of Office, users receive proofing tools for English, Spanish, and French. These proofing tools include spelling and grammar checkers, thesauruses, and hyphenators. They might also include language-specific editing features such as Language AutoDetect, AutoSummarize, and Intelligent AutoCorrect."
---

# Proofing tools for Office 365 ProPlus

Each language version of Office 2016 includes proofing tools for a set of companion languages. For example, when you deploy the English version of Office, users receive proofing tools for English, Spanish, and French. These proofing tools include spelling and grammar checkers, thesauruses, and hyphenators. They might also include language-specific editing features such as Language AutoDetect, AutoSummarize, and Intelligent AutoCorrect.
  
If you want to deploy proofing tools in additional languages beyond the companion languages, you can deploy the full language pack for that additional language or you can deploy just the proofing tools in that additional language. Many administrators choose to deploy just the proofing tools to conserve bandwidth on the network and speed up installation on client computers.
  
## Download proofing tools for Office 2016

Download the proofing tools in the languages you want from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=52668). There's a separate executable (exe) file for each language. To see the full list of links to the available languages, see [Links to downloads for proofing tools](proofing-tools-for-office-365-proplus.md#BKMK_LinksToDownloadsForProofingTools) at the end of this article.
  
## Deploy proofing tools for Office 2016 to client computers

After deploying Office 2016 to your client computers, you can deploy proofing tools for additional languages. To do so, you can use the same products and processes you used to deploy Office, such as System Center Configuration Manager or a network installation share.
  
To install the Proofing Tools on a single computer, you can run the setup.exe directly. To install the Proofing Tools with more controls, you can run the setup.exe from the command line with the following parameters:
  
|**Command**|**Description**|
|:-----|:-----|
| `setup.exe /extract` <br/> |Extracts the contents of the package to the same folder as setup.exe.  <br/> |
| `setup.exe /log:[path to log file]` <br/> |Turns on verbose logging and stores it in the specified file. Example:  `\\server\log.txt` <br/> |
| `setup.exe /quiet` <br/> |Installs the update without displaying the user interface during the install. The Microsoft Software License Terms are accepted automatically.  <br/> |
| `setup.exe /passive` <br/> |Installs the update without requesting any interaction from the user. The Microsoft Software License Terms are accepted automatically.  <br/> |
   
## Update proofing tools after installation

After deploying proofing tools in additional languages, we recommend keeping them updated by enabling Microsoft Update on your client computers or by using your software distribution product, such as System Center Configuration Manager, to distribute updates.
  
## Companion proofing languages for Office

The following table lists companion proofing languages for each primary language in Office 2016.
  
|**Primary language**|**Companion proofing languages**|
|:-----|:-----|
|Arabic  <br/> |Arabic, English, French  <br/> |
|Brazilian  <br/> |Brazilian, English, Spanish  <br/> |
|Bulgarian  <br/> |Bulgarian, English, German, Russian  <br/> |
|Chinese (Simplified)  <br/> |Chinese (Simplified), English  <br/> |
|Chinese (Traditional)  <br/> |Chinese (Traditional), English  <br/> |
|Croatian  <br/> |Croatian, English, German, Serbian, Italian  <br/> |
|Czech  <br/> |Czech, English, German, Slovak  <br/> |
|Danish  <br/> |Danish, English, German, Swedish  <br/> |
|Dutch  <br/> |Dutch, English, French, German  <br/> |
|English  <br/> |English, French, Spanish  <br/> |
|Estonian  <br/> |Estonian, English, German, Russian, Finnish,  <br/> |
|Finnish  <br/> |Finnish, English, Swedish, German, Russian  <br/> |
|French  <br/> |French, English, German, Dutch, Arabic, Spanish  <br/> |
|German  <br/> |German, English, French, Italian  <br/> |
|Greek  <br/> |Greek, English, French, German  <br/> |
|Hebrew  <br/> |Hebrew, English, French, Arabic, Russian  <br/> |
|Hindi  <br/> |Hindi, English, Tamil, Telegu, Marathi, Kannada, Guajarati, Punjabi, Urdu  <br/> |
|Hungarian  <br/> |Hungarian, English, German  <br/> |
|Indonesian  <br/> |Indonesian, English  <br/> |
|Italian  <br/> |Italian, English, French, German  <br/> |
|Japanese  <br/> |Japanese, English  <br/> |
|Kazakh  <br/> |Kazakh, English, Russian  <br/> |
|Korean  <br/> |Korean, English  <br/> |
|Latvian  <br/> |Latvian, English, German, Russian  <br/> |
|Lithuanian  <br/> |Lithuanian, English, German, Russian, Polish  <br/> |
|Malay  <br/> |Malay, English, Chinese (Simplified)  <br/> |
|Norwegian (Bk)  <br/> |Norwegian (Bk), English, German, Norwegian (Ny)  <br/> |
|Polish  <br/> |Polish, English, German  <br/> |
|Portuguese  <br/> |Portuguese, English, French, Spanish  <br/> |
|Romanian  <br/> |Romanian, English, French  <br/> |
|Russian  <br/> |Russian, English, Ukrainian, German  <br/> |
|Serbian (Latin)  <br/> |Serbian (Latin), English, German, French, Croatian  <br/> |
|Slovak  <br/> |Slovak, English, Czech, Hungarian, German  <br/> |
|Slovenian  <br/> |Slovenian, English, German, Italian, Croatian  <br/> |
|Spanish  <br/> |Spanish, English, French, Basque (Basque), Catalan, Galician, Brazilian  <br/> |
|Swedish  <br/> |Swedish, English, Finnish, German  <br/> |
|Thai  <br/> |Thai, English, French  <br/> |
|Turkish  <br/> |Turkish, English, French, German  <br/> |
|Ukrainian  <br/> |Ukrainian, English, Russian, German  <br/> |
|Vietnamese  <br/> |Vietnamese, English, French  <br/> |
   
## Links to downloads for proofing tools
<a name="BKMK_LinksToDownloadsForProofingTools"> </a>

The following table lists the link for the proofing tool download in all available languages and editions.
  
|**Language**|**Culture (ll-cc)**|**Download links**|
|:-----|:-----|:-----|
|Afrikaans  <br/> |af-za  <br/> |[x86](https://download.microsoft.com/download/3/B/F/3BFB8496-03FF-43AA-B992-CCCA81C222C0/proofingtools2016_af-za-x86.exe), [x64](https://download.microsoft.com/download/3/B/F/3BFB8496-03FF-43AA-B992-CCCA81C222C0/proofingtools2016_af-za-x64.exe) <br/> |
|Albanian  <br/> |sq-al  <br/> |[x86](https://download.microsoft.com/download/9/F/5/9F50A654-7AB4-417C-BA28-487CCB48D4DD/proofingtools2016_sq-al-x86.exe), [x64](https://download.microsoft.com/download/9/F/5/9F50A654-7AB4-417C-BA28-487CCB48D4DD/proofingtools2016_sq-al-x64.exe) <br/> |
|Arabic  <br/> |ar-sa  <br/> |[x86](https://download.microsoft.com/download/1/2/2/1229B8D7-1EEC-4DBD-AEBA-AC301AE1B8F8/proofingtools2016_ar-sa-x86.exe), [x64](https://download.microsoft.com/download/1/2/2/1229B8D7-1EEC-4DBD-AEBA-AC301AE1B8F8/proofingtools2016_ar-sa-x64.exe) <br/> |
|Armenian  <br/> |hy-am  <br/> |[x86](https://download.microsoft.com/download/A/B/A/ABA51FD2-1CD2-4945-8614-6BC1750AEDE1/proofingtools2016_hy-am-x86.exe), [x64](https://download.microsoft.com/download/A/B/A/ABA51FD2-1CD2-4945-8614-6BC1750AEDE1/proofingtools2016_hy-am-x64.exe) <br/> |
|Assamese  <br/> |as-in  <br/> |[x86](https://download.microsoft.com/download/7/F/C/7FC6FD83-F9CF-4045-938F-FC079C0AD9BC/proofingtools2016_as-in-x86.exe), [x64](https://download.microsoft.com/download/7/F/C/7FC6FD83-F9CF-4045-938F-FC079C0AD9BC/proofingtools2016_as-in-x64.exe) <br/> |
|Azerbaijani (Latin)  <br/> |az-Latn-az  <br/> |[x86](https://download.microsoft.com/download/7/1/9/719D14CF-8493-4331-AC34-B8BCEE61D2A3/proofingtools2016_az-latn-az-x86.exe), [x64](https://download.microsoft.com/download/7/1/9/719D14CF-8493-4331-AC34-B8BCEE61D2A3/proofingtools2016_az-latn-az-x64.exe) <br/> |
|Bangla (Bangladesh)  <br/> |bn-bd  <br/> |[x86](https://download.microsoft.com/download/1/E/E/1EEF5DD1-8BDB-4E31-9DD0-ADA4B99DD987/proofingtools2016_bn-bd-x86.exe), [x64](https://download.microsoft.com/download/1/E/E/1EEF5DD1-8BDB-4E31-9DD0-ADA4B99DD987/proofingtools2016_bn-bd-x64.exe) <br/> |
|Bangla (Bengali India)  <br/> |bn-in  <br/> |[x86](https://download.microsoft.com/download/5/9/E/59E0E372-3393-4F08-8588-30DC933D93B1/proofingtools2016_bn-in-x86.exe), [x64](https://download.microsoft.com/download/5/9/E/59E0E372-3393-4F08-8588-30DC933D93B1/proofingtools2016_bn-in-x64.exe) <br/> |
|Basque (Basque)  <br/> |eu-es  <br/> |[x86](https://download.microsoft.com/download/4/5/C/45C79C95-DF53-4426-B14C-BC4BB575078B/proofingtools2016_eu-es-x86.exe), [x64](https://download.microsoft.com/download/4/5/C/45C79C95-DF53-4426-B14C-BC4BB575078B/proofingtools2016_eu-es-x64.exe) <br/> |
|Bosnian (Latin)  <br/> |bs-Latn-ba or bs-BA  <br/> |[x86](https://download.microsoft.com/download/1/A/7/1A796609-5733-4AD7-8BE4-41634D2011E1/proofingtools2016_bs-latn-ba-x86.exe), [x64](https://download.microsoft.com/download/1/A/7/1A796609-5733-4AD7-8BE4-41634D2011E1/proofingtools2016_bs-latn-ba-x64.exe) <br/> |
|Bulgarian  <br/> |bg-bg  <br/> |[x86](https://download.microsoft.com/download/2/E/8/2E85747E-6EBF-400E-AE06-B8840CF3EFEE/proofingtools2016_bg-bg-x86.exe), [x64](https://download.microsoft.com/download/2/E/8/2E85747E-6EBF-400E-AE06-B8840CF3EFEE/proofingtools2016_bg-bg-x64.exe) <br/> |
|Catalan  <br/> |ca-es  <br/> |[x86](https://download.microsoft.com/download/8/B/6/8B6577C3-81B3-41F1-85FB-CF608D18C089/proofingtools2016_ca-es-x86.exe), [x64](https://download.microsoft.com/download/8/B/6/8B6577C3-81B3-41F1-85FB-CF608D18C089/proofingtools2016_ca-es-x64.exe) <br/> |
|Chinese (Simplified)  <br/> |zh-cn  <br/> |[x86](https://download.microsoft.com/download/4/C/0/4C0B7037-2E7F-4024-8BEC-4F151A910923/proofingtools2016_zh-cn-x86.exe), [x64](https://download.microsoft.com/download/4/C/0/4C0B7037-2E7F-4024-8BEC-4F151A910923/proofingtools2016_zh-cn-x64.exe) <br/> |
|Chinese (Traditional)  <br/> |zh-tw  <br/> |[x86](https://download.microsoft.com/download/9/5/3/953B4F05-F95E-4E6F-A650-10B6527493E8/proofingtools2016_zh-tw-x86.exe), [x64](https://download.microsoft.com/download/9/5/3/953B4F05-F95E-4E6F-A650-10B6527493E8/proofingtools2016_zh-tw-x64.exe) <br/> |
|Croatian  <br/> |hr-hr  <br/> |[x86](https://download.microsoft.com/download/0/5/7/05798269-56BE-482A-ACB6-05024501F165/proofingtools2016_hr-hr-x86.exe), [x64](https://download.microsoft.com/download/0/5/7/05798269-56BE-482A-ACB6-05024501F165/proofingtools2016_hr-hr-x64.exe) <br/> |
|Czech  <br/> |cs-cz  <br/> |[x86](https://download.microsoft.com/download/1/4/0/1406C260-59F7-4CE9-96B0-CFBC418FA09F/proofingtools2016_cs-cz-x86.exe), [x64](https://download.microsoft.com/download/1/4/0/1406C260-59F7-4CE9-96B0-CFBC418FA09F/proofingtools2016_cs-cz-x64.exe) <br/> |
|Danish  <br/> |da-dk  <br/> |[x86](https://download.microsoft.com/download/F/C/8/FC841CB4-B84E-47DE-A454-6B45894BCFFC/proofingtools2016_da-dk-x86.exe), [x64](https://download.microsoft.com/download/F/C/8/FC841CB4-B84E-47DE-A454-6B45894BCFFC/proofingtools2016_da-dk-x64.exe) <br/> |
|Dutch  <br/> |nl-nl  <br/> |[x86](https://download.microsoft.com/download/B/B/0/BB0D89B0-F109-4233-8822-E059EDDC1D0B/proofingtools2016_nl-nl-x86.exe), [x64](https://download.microsoft.com/download/B/B/0/BB0D89B0-F109-4233-8822-E059EDDC1D0B/proofingtools2016_nl-nl-x64.exe) <br/> |
|English  <br/> |en-us  <br/> |[x86](https://download.microsoft.com/download/9/5/A/95A40083-4ADA-4173-BE42-0C9F88AD8C0F/proofingtools2016_en-us-x86.exe), [x64](https://download.microsoft.com/download/9/5/A/95A40083-4ADA-4173-BE42-0C9F88AD8C0F/proofingtools2016_en-us-x64.exe) <br/> |
|Estonian  <br/> |et-ee  <br/> |[x86](https://download.microsoft.com/download/7/C/B/7CB8D19E-07C9-4783-9E7B-62CAB2D2E7B4/proofingtools2016_et-ee-x86.exe), [x64](https://download.microsoft.com/download/7/C/B/7CB8D19E-07C9-4783-9E7B-62CAB2D2E7B4/proofingtools2016_et-ee-x64.exe) <br/> |
|Finnish  <br/> |fi-fi  <br/> |[x86](https://download.microsoft.com/download/7/E/F/7EF2DBF6-3DCE-422A-B310-9EBE11F1EFBE/proofingtools2016_fi-fi-x86.exe), [x64](https://download.microsoft.com/download/7/E/F/7EF2DBF6-3DCE-422A-B310-9EBE11F1EFBE/proofingtools2016_fi-fi-x64.exe) <br/> |
|French  <br/> |fr-fr  <br/> |[x86](https://download.microsoft.com/download/6/F/B/6FB241AB-E2C5-4668-AB0B-98628915EC3B/proofingtools2016_fr-fr-x86.exe), [x64](https://download.microsoft.com/download/6/F/B/6FB241AB-E2C5-4668-AB0B-98628915EC3B/proofingtools2016_fr-fr-x64.exe) <br/> |
|Galician  <br/> |gl-es  <br/> |[x86](https://download.microsoft.com/download/5/A/A/5AAD14B7-65CE-40EB-9EEC-95526BEE393B/proofingtools2016_gl-es-x86.exe), [x64](https://download.microsoft.com/download/5/A/A/5AAD14B7-65CE-40EB-9EEC-95526BEE393B/proofingtools2016_gl-es-x64.exe) <br/> |
|Georgian  <br/> |ka-ge  <br/> |[x86](https://download.microsoft.com/download/F/4/3/F4378696-38E3-4218-BBDB-03E801862B5A/proofingtools2016_ka-ge-x86.exe), [x64](https://download.microsoft.com/download/F/4/3/F4378696-38E3-4218-BBDB-03E801862B5A/proofingtools2016_ka-ge-x64.exe) <br/> |
|German  <br/> |de-de  <br/> |[x86](https://download.microsoft.com/download/6/B/0/6B062E3D-412B-4E21-AF4D-1FA1E4610C57/proofingtools2016_de-de-x86.exe), [x64](https://download.microsoft.com/download/6/B/0/6B062E3D-412B-4E21-AF4D-1FA1E4610C57/proofingtools2016_de-de-x64.exe) <br/> |
|Greek  <br/> |el-gr  <br/> |[x86](https://download.microsoft.com/download/E/5/6/E5640562-A233-4143-AE45-E74DD323CBA9/proofingtools2016_el-gr-x86.exe), [x64](https://download.microsoft.com/download/E/5/6/E5640562-A233-4143-AE45-E74DD323CBA9/proofingtools2016_el-gr-x64.exe) <br/> |
|Gujarati  <br/> |gu-in  <br/> |[x86](https://download.microsoft.com/download/A/1/1/A11FAA12-F877-4D92-8325-0FA319F0B35A/proofingtools2016_gu-in-x86.exe), [x64](https://download.microsoft.com/download/A/1/1/A11FAA12-F877-4D92-8325-0FA319F0B35A/proofingtools2016_gu-in-x64.exe) <br/> |
|Hausa  <br/> |ha-Latn-ng  <br/> |[x86](https://download.microsoft.com/download/3/7/1/37136A5F-005F-4788-B5BC-ED8FD6A1591F/proofingtools2016_ha-latn-ng-x86.exe), [x64](https://download.microsoft.com/download/3/7/1/37136A5F-005F-4788-B5BC-ED8FD6A1591F/proofingtools2016_ha-latn-ng-x64.exe) <br/> |
|Hebrew  <br/> |he-il  <br/> |[x86](https://download.microsoft.com/download/C/F/3/CF33E691-22E5-4E02-9093-A995F6CF577C/proofingtools2016_he-il-x86.exe), [x64](https://download.microsoft.com/download/C/F/3/CF33E691-22E5-4E02-9093-A995F6CF577C/proofingtools2016_he-il-x64.exe) <br/> |
|Hindi  <br/> |hi-in  <br/> |[x86](https://download.microsoft.com/download/7/7/9/7795F624-CC70-478B-8078-8130784715C9/proofingtools2016_hi-in-x86.exe), [x64](https://download.microsoft.com/download/7/7/9/7795F624-CC70-478B-8078-8130784715C9/proofingtools2016_hi-in-x64.exe) <br/> |
|Hungarian  <br/> |hu-hu  <br/> |[x86](https://download.microsoft.com/download/3/4/4/34482994-23A9-40F1-8597-BE5FE88A0DFF/proofingtools2016_hu-hu-x86.exe), [x64](https://download.microsoft.com/download/3/4/4/34482994-23A9-40F1-8597-BE5FE88A0DFF/proofingtools2016_hu-hu-x64.exe) <br/> |
|Icelandic  <br/> |is-is  <br/> |[x86](https://download.microsoft.com/download/2/A/D/2AD16E2A-C36B-4615-A066-F8D4B85F888D/proofingtools2016_is-is-x86.exe), [x64](https://download.microsoft.com/download/2/A/D/2AD16E2A-C36B-4615-A066-F8D4B85F888D/proofingtools2016_is-is-x64.exe) <br/> |
|Igbo  <br/> |ig-ng  <br/> |[x86](https://download.microsoft.com/download/9/1/A/91AF892D-A2C4-455E-B44C-7A62B73F7E31/proofingtools2016_ig-ng-x86.exe), [x64](https://download.microsoft.com/download/9/1/A/91AF892D-A2C4-455E-B44C-7A62B73F7E31/proofingtools2016_ig-ng-x64.exe) <br/> |
|Indonesian  <br/> |id-id  <br/> |[x86](https://download.microsoft.com/download/2/F/F/2FFDFCE6-8714-4084-8645-C196E2502EAB/proofingtools2016_id-id-x86.exe), [x64](https://download.microsoft.com/download/2/F/F/2FFDFCE6-8714-4084-8645-C196E2502EAB/proofingtools2016_id-id-x64.exe) <br/> |
|Irish  <br/> |ga-ie  <br/> |[x86](https://download.microsoft.com/download/5/F/C/5FC510CF-1F1A-4233-AE4A-40FFC72B8539/proofingtools2016_ga-ie-x86.exe), [x64](https://download.microsoft.com/download/5/F/C/5FC510CF-1F1A-4233-AE4A-40FFC72B8539/proofingtools2016_ga-ie-x64.exe) <br/> |
|isiXhosa  <br/> |xh-za  <br/> |[x86](https://download.microsoft.com/download/8/F/8/8F835563-F26D-4FDE-842B-5EE2497B7E91/proofingtools2016_xh-za-x86.exe), [x64](https://download.microsoft.com/download/8/F/8/8F835563-F26D-4FDE-842B-5EE2497B7E91/proofingtools2016_xh-za-x64.exe) <br/> |
|isiZulu  <br/> |zu-za  <br/> |[x86](https://download.microsoft.com/download/9/8/1/981E5779-8A34-4443-922D-372DC7DDAD4F/proofingtools2016_zu-za-x86.exe), [x64](https://download.microsoft.com/download/9/8/1/981E5779-8A34-4443-922D-372DC7DDAD4F/proofingtools2016_zu-za-x64.exe) <br/> |
|Italian  <br/> |it-it  <br/> |[x86](https://download.microsoft.com/download/B/6/F/B6F3A0E0-8540-4EC7-A97F-50EA1C47EDFC/proofingtools2016_it-it-x86.exe), [x64](https://download.microsoft.com/download/B/6/F/B6F3A0E0-8540-4EC7-A97F-50EA1C47EDFC/proofingtools2016_it-it-x64.exe) <br/> |
|Japanese  <br/> |ja-jp  <br/> |[x86](https://download.microsoft.com/download/7/4/5/745809A6-D0B4-4FCC-B1D4-E75570695C39/proofingtools2016_ja-jp-x86.exe), [x64](https://download.microsoft.com/download/7/4/5/745809A6-D0B4-4FCC-B1D4-E75570695C39/proofingtools2016_ja-jp-x64.exe) <br/> |
|Kannada  <br/> |kn-in  <br/> |[x86](https://download.microsoft.com/download/1/8/3/183DC332-CD83-4911-919C-EF29C3E327DC/proofingtools2016_kn-in-x86.exe), [x64](https://download.microsoft.com/download/1/8/3/183DC332-CD83-4911-919C-EF29C3E327DC/proofingtools2016_kn-in-x64.exe) <br/> |
|Kazakh  <br/> |kk-kz  <br/> |[x86](https://download.microsoft.com/download/A/F/2/AF2AA7EC-EA6B-4355-BB2C-BA6B028CB009/proofingtools2016_kk-kz-x86.exe), [x64](https://download.microsoft.com/download/A/F/2/AF2AA7EC-EA6B-4355-BB2C-BA6B028CB009/proofingtools2016_kk-kz-x64.exe) <br/> |
|Kinyarwanda  <br/> |rw-rw  <br/> |[x86](https://download.microsoft.com/download/4/C/4/4C41C36B-BA0D-4F51-96AD-71B184342506/proofingtools2016_rw-rw-x86.exe), [x64](https://download.microsoft.com/download/4/C/4/4C41C36B-BA0D-4F51-96AD-71B184342506/proofingtools2016_rw-rw-x64.exe) <br/> |
|KiSwahili  <br/> |sw-ke  <br/> |[x86](https://download.microsoft.com/download/F/C/D/FCD45769-5148-4128-924F-762E8E3DEBBD/proofingtools2016_sw-ke-x86.exe), [x64](https://download.microsoft.com/download/F/C/D/FCD45769-5148-4128-924F-762E8E3DEBBD/proofingtools2016_sw-ke-x64.exe) <br/> |
|Konkani  <br/> |kok-in  <br/> |[x86](https://download.microsoft.com/download/4/7/1/471635C7-1B63-4F3A-A0A6-8A6F34C995F6/proofingtools2016_kok-in-x86.exe), [x64](https://download.microsoft.com/download/4/7/1/471635C7-1B63-4F3A-A0A6-8A6F34C995F6/proofingtools2016_kok-in-x64.exe) <br/> |
|Korean  <br/> |ko-kr  <br/> |[x86](https://download.microsoft.com/download/4/6/C/46CF642E-CD03-4B05-8121-2515D64B5F95/proofingtools2016_ko-kr-x86.exe), [x64](https://download.microsoft.com/download/4/6/C/46CF642E-CD03-4B05-8121-2515D64B5F95/proofingtools2016_ko-kr-x64.exe) <br/> |
|Kyrgyz  <br/> |ky-kg  <br/> |[x86](https://download.microsoft.com/download/4/4/D/44D5B1F7-2BC1-4A04-A147-EF9E790DCB31/proofingtools2016_ky-kg-x86.exe), [x64](https://download.microsoft.com/download/4/4/D/44D5B1F7-2BC1-4A04-A147-EF9E790DCB31/proofingtools2016_ky-kg-x64.exe) <br/> |
|Latvian  <br/> |lv-lv  <br/> |[x86](https://download.microsoft.com/download/5/3/4/534BC983-4588-4EBB-A035-BE834F6635C5/proofingtools2016_lv-lv-x86.exe), [x64](https://download.microsoft.com/download/5/3/4/534BC983-4588-4EBB-A035-BE834F6635C5/proofingtools2016_lv-lv-x64.exe) <br/> |
|Lithuanian  <br/> |lt-lt  <br/> |[x86](https://download.microsoft.com/download/6/D/D/6DD6269A-CFC6-461B-B3AA-61530A12FF50/proofingtools2016_lt-lt-x86.exe), [x64](https://download.microsoft.com/download/6/D/D/6DD6269A-CFC6-461B-B3AA-61530A12FF50/proofingtools2016_lt-lt-x64.exe) <br/> |
|Luxembourgish  <br/> |lb-lu  <br/> |[x86](https://download.microsoft.com/download/3/B/4/3B4A5DD5-C55C-4B3B-BC17-FA83E2E739D8/proofingtools2016_lb-lu-x86.exe), [x64](https://download.microsoft.com/download/3/B/4/3B4A5DD5-C55C-4B3B-BC17-FA83E2E739D8/proofingtools2016_lb-lu-x64.exe) <br/> |
|Macedonian (FYRO Macedonia )  <br/> |mk-mk  <br/> |[x86](https://download.microsoft.com/download/4/1/D/41D0EFD1-B02F-48D4-8B7F-9AAB8218D630/proofingtools2016_mk-mk-x86.exe), [x64](https://download.microsoft.com/download/4/1/D/41D0EFD1-B02F-48D4-8B7F-9AAB8218D630/proofingtools2016_mk-mk-x64.exe) <br/> |
|Malay (Latin)  <br/> |ms-my  <br/> |[x86](https://download.microsoft.com/download/F/C/8/FC81EC17-F044-4F00-B51B-B1F782855967/proofingtools2016_ms-my-x86.exe), [x64](https://download.microsoft.com/download/F/C/8/FC81EC17-F044-4F00-B51B-B1F782855967/proofingtools2016_ms-my-x64.exe) <br/> |
|Malayalam  <br/> |ml-in  <br/> |[x86](https://download.microsoft.com/download/5/7/6/576F35DF-DE8C-432D-A410-B08FD076157D/proofingtools2016_ml-in-x86.exe), [x64](https://download.microsoft.com/download/5/7/6/576F35DF-DE8C-432D-A410-B08FD076157D/proofingtools2016_ml-in-x64.exe) <br/> |
|Maltese  <br/> |mt-mt  <br/> |[x86](https://download.microsoft.com/download/8/5/A/85ABC7BE-921A-4480-BA3D-2C51BCB25972/proofingtools2016_mt-mt-x86.exe), [x64](https://download.microsoft.com/download/8/5/A/85ABC7BE-921A-4480-BA3D-2C51BCB25972/proofingtools2016_mt-mt-x64.exe) <br/> |
|Maori  <br/> |mi-nz  <br/> |[x86](https://download.microsoft.com/download/0/0/4/00493C0C-2CE0-4F98-A048-23FE0ED788B4/proofingtools2016_mi-nz-x86.exe), [x64](https://download.microsoft.com/download/0/0/4/00493C0C-2CE0-4F98-A048-23FE0ED788B4/proofingtools2016_mi-nz-x64.exe) <br/> |
|Marathi  <br/> |mr-in  <br/> |[x86](https://download.microsoft.com/download/9/6/C/96CA4369-C827-4E8F-92A7-9376780415E5/proofingtools2016_mr-in-x86.exe), [x64](https://download.microsoft.com/download/9/6/C/96CA4369-C827-4E8F-92A7-9376780415E5/proofingtools2016_mr-in-x64.exe) <br/> |
|Nepali  <br/> |ne-np  <br/> |[x86](https://download.microsoft.com/download/7/2/A/72A53473-9DC4-40FF-A417-01FD4BB88861/proofingtools2016_ne-np-x86.exe), [x64](https://download.microsoft.com/download/7/2/A/72A53473-9DC4-40FF-A417-01FD4BB88861/proofingtools2016_ne-np-x64.exe) <br/> |
|Norwegian Bokmål  <br/> |nb-no  <br/> |[x86](https://download.microsoft.com/download/8/C/7/8C75568F-CD19-4D9A-A231-93F00D8BD5C6/proofingtools2016_nb-no-x86.exe), [x64](https://download.microsoft.com/download/8/C/7/8C75568F-CD19-4D9A-A231-93F00D8BD5C6/proofingtools2016_nb-no-x64.exe) <br/> |
|Norwegian Nynorsk  <br/> |nn-no  <br/> |[x86](https://download.microsoft.com/download/5/4/2/542A4BE5-8FC2-4624-969D-0D7E18D33539/proofingtools2016_nn-no-x86.exe), [x64](https://download.microsoft.com/download/5/4/2/542A4BE5-8FC2-4624-969D-0D7E18D33539/proofingtools2016_nn-no-x64.exe) <br/> |
|Odia  <br/> |or-in  <br/> |[x86](https://download.microsoft.com/download/C/8/9/C89DCC82-5F9B-47A8-A756-35A06045DD0D/proofingtools2016_or-in-x86.exe), [x64](https://download.microsoft.com/download/C/8/9/C89DCC82-5F9B-47A8-A756-35A06045DD0D/proofingtools2016_or-in-x64.exe) <br/> |
|Pashto  <br/> |ps-af  <br/> |[x86](https://download.microsoft.com/download/C/9/B/C9B8C543-4D08-4AD3-8348-B8D6CC3B9C2C/proofingtools2016_ps-af-x86.exe), [x64](https://download.microsoft.com/download/C/9/B/C9B8C543-4D08-4AD3-8348-B8D6CC3B9C2C/proofingtools2016_ps-af-x64.exe) <br/> |
|Persian (Farsi)  <br/> |fa-ir  <br/> |[x86](https://download.microsoft.com/download/E/C/F/ECF7490C-1879-4412-9668-CEECCD892E9E/proofingtools2016_fa-ir-x86.exe), [x64](https://download.microsoft.com/download/E/C/F/ECF7490C-1879-4412-9668-CEECCD892E9E/proofingtools2016_fa-ir-x64.exe) <br/> |
|Polish  <br/> |pl-pl  <br/> |[x86](https://download.microsoft.com/download/7/1/E/71EC2141-4781-4766-841C-6C5DF3085F4C/proofingtools2016_pl-pl-x86.exe), [x64](https://download.microsoft.com/download/7/1/E/71EC2141-4781-4766-841C-6C5DF3085F4C/proofingtools2016_pl-pl-x64.exe) <br/> |
|Portuguese (Portugal)  <br/> |pt-pt  <br/> |[x86](https://download.microsoft.com/download/1/2/B/12B2F314-C901-4947-A005-6CA1CCD317DD/proofingtools2016_pt-pt-x86.exe), [x64](https://download.microsoft.com/download/1/2/B/12B2F314-C901-4947-A005-6CA1CCD317DD/proofingtools2016_pt-pt-x64.exe) <br/> |
|Portuguese (Brazil)  <br/> |pt-br  <br/> |[x86](https://download.microsoft.com/download/C/9/6/C96FF7FE-2B8B-4D55-BFAF-A3497F70EAB3/proofingtools2016_pt-br-x86.exe), [x64](https://download.microsoft.com/download/C/9/6/C96FF7FE-2B8B-4D55-BFAF-A3497F70EAB3/proofingtools2016_pt-br-x64.exe) <br/> |
|Punjabi (Gurmukhi)  <br/> |pa-in  <br/> |[x86](https://download.microsoft.com/download/E/C/D/ECDE79C2-46A0-44A2-A6DD-D8F2AD7298B1/proofingtools2016_pa-in-x86.exe), [x64](https://download.microsoft.com/download/E/C/D/ECDE79C2-46A0-44A2-A6DD-D8F2AD7298B1/proofingtools2016_pa-in-x64.exe) <br/> |
|Romanian  <br/> |ro-ro  <br/> |[x86](https://download.microsoft.com/download/9/F/9/9F911231-FC5B-4046-8A27-6A6F20B59E94/proofingtools2016_ro-ro-x86.exe), [x64](https://download.microsoft.com/download/9/F/9/9F911231-FC5B-4046-8A27-6A6F20B59E94/proofingtools2016_ro-ro-x64.exe) <br/> |
|Romansh  <br/> |rm-ch  <br/> |[x86](https://download.microsoft.com/download/9/F/0/9F083CEA-E12A-4E11-8973-8436FFD78653/proofingtools2016_rm-ch-x86.exe), [x64](https://download.microsoft.com/download/9/F/0/9F083CEA-E12A-4E11-8973-8436FFD78653/proofingtools2016_rm-ch-x64.exe) <br/> |
|Russian  <br/> |ru-ru  <br/> |[x86](https://download.microsoft.com/download/A/1/D/A1D0C574-D661-4FA7-9ED7-386A222F786B/proofingtools2016_ru-ru-x86.exe), [x64](https://download.microsoft.com/download/A/1/D/A1D0C574-D661-4FA7-9ED7-386A222F786B/proofingtools2016_ru-ru-x64.exe) <br/> |
|Scottish Gaelic  <br/> |gd-gb  <br/> |[x86](https://download.microsoft.com/download/4/7/9/4793661A-506A-4B40-8874-701FC77F9A96/proofingtools2016_gd-gb-x86.exe), [x64](https://download.microsoft.com/download/4/7/9/4793661A-506A-4B40-8874-701FC77F9A96/proofingtools2016_gd-gb-x64.exe) <br/> |
|Serbian (Cyrillic, Serbia)  <br/> |sr-cyrl-rs  <br/> |[x86](https://download.microsoft.com/download/9/E/7/9E71790F-C8D5-4914-A7D4-2957364D5B80/proofingtools2016_sr-cyrl-rs-x86.exe), [x64](https://download.microsoft.com/download/9/E/7/9E71790F-C8D5-4914-A7D4-2957364D5B80/proofingtools2016_sr-cyrl-rs-x64.exe) <br/> |
|Serbian (Latin, Serbia)  <br/> |sr-latn-rs  <br/> |[x86](https://download.microsoft.com/download/5/F/0/5F09A211-6C6A-4A32-88AE-1C0E2E5218E3/proofingtools2016_sr-latn-rs-x86.exe), [x64](https://download.microsoft.com/download/5/F/0/5F09A211-6C6A-4A32-88AE-1C0E2E5218E3/proofingtools2016_sr-latn-rs-x64.exe) <br/> |
|Serbian (Cyrillic, Bosnia &amp; Herzegovina)  <br/> |sr-cyrl-ba  <br/> |[x86](https://download.microsoft.com/download/4/3/F/43FA0DE8-3F95-4914-9B4C-4A169D9E3C69/proofingtools2016_sr-cyrl-ba-x86.exe), [x64](https://download.microsoft.com/download/4/3/F/43FA0DE8-3F95-4914-9B4C-4A169D9E3C69/proofingtools2016_sr-cyrl-ba-x64.exe) <br/> |
|Sesotho sa Leboa  <br/> |nso-za  <br/> |[x86](https://download.microsoft.com/download/6/D/2/6D2AFAE0-58EA-483F-A7C4-7961D0B05C5F/proofingtools2016_nso-za-x86.exe), [x64](https://download.microsoft.com/download/6/D/2/6D2AFAE0-58EA-483F-A7C4-7961D0B05C5F/proofingtools2016_nso-za-x64.exe) <br/> |
|Setswana  <br/> |tn-za  <br/> |[x86](https://download.microsoft.com/download/4/3/D/43D0FA88-7047-4A2B-B375-39FB819F89D1/proofingtools2016_tn-za-x86.exe), [x64](https://download.microsoft.com/download/4/3/D/43D0FA88-7047-4A2B-B375-39FB819F89D1/proofingtools2016_tn-za-x64.exe) <br/> |
|Sinhala  <br/> |si-lk  <br/> |[x86](https://download.microsoft.com/download/A/E/E/AEEDC357-2CB3-4175-8F20-2BCFEC6BD395/proofingtools2016_si-lk-x86.exe), [x64](https://download.microsoft.com/download/A/E/E/AEEDC357-2CB3-4175-8F20-2BCFEC6BD395/proofingtools2016_si-lk-x64.exe) <br/> |
|Slovak  <br/> |sk-sk  <br/> |[x86](https://download.microsoft.com/download/3/6/0/36015517-7814-4340-B20C-D3B180574F8D/proofingtools2016_sk-sk-x86.exe), [x64](https://download.microsoft.com/download/3/6/0/36015517-7814-4340-B20C-D3B180574F8D/proofingtools2016_sk-sk-x64.exe) <br/> |
|Slovenian  <br/> |sl-si  <br/> |[x86](https://download.microsoft.com/download/A/E/D/AEDBA997-46B4-4BBE-91F1-96F607BEBA47/proofingtools2016_sl-si-x86.exe), [x64](https://download.microsoft.com/download/A/E/D/AEDBA997-46B4-4BBE-91F1-96F607BEBA47/proofingtools2016_sl-si-x64.exe) <br/> |
|Spanish  <br/> |es-es  <br/> |[x86](https://download.microsoft.com/download/2/2/C/22C8AD6A-6D87-4C89-9905-53F325CAD071/proofingtools2016_es-es-x86.exe), [x64](https://download.microsoft.com/download/2/2/C/22C8AD6A-6D87-4C89-9905-53F325CAD071/proofingtools2016_es-es-x64.exe) <br/> |
|Swedish  <br/> |sv-se  <br/> |[x86](https://download.microsoft.com/download/9/5/5/955DB0B4-0DBF-4924-A636-4B42801F1379/proofingtools2016_sv-se-x86.exe), [x64](https://download.microsoft.com/download/9/5/5/955DB0B4-0DBF-4924-A636-4B42801F1379/proofingtools2016_sv-se-x64.exe) <br/> |
|Tamil  <br/> |ta-in  <br/> |[x86](https://download.microsoft.com/download/6/D/2/6D25FBE2-D82A-4A80-96B9-0226C39055F4/proofingtools2016_ta-in-x86.exe), [x64](https://download.microsoft.com/download/6/D/2/6D25FBE2-D82A-4A80-96B9-0226C39055F4/proofingtools2016_ta-in-x64.exe) <br/> |
|Tatar (Cyrillic)  <br/> |tt-ru  <br/> |[x86](https://download.microsoft.com/download/B/B/7/BB783B34-2CD6-40CC-8160-2EFBB34A6054/proofingtools2016_tt-ru-x86.exe), [x64](https://download.microsoft.com/download/B/B/7/BB783B34-2CD6-40CC-8160-2EFBB34A6054/proofingtools2016_tt-ru-x64.exe) <br/> |
|Telugu  <br/> |te-in  <br/> |[x86](https://download.microsoft.com/download/B/4/3/B4301105-7D4F-402D-AB82-AD4283E2A5AD/proofingtools2016_te-in-x86.exe), [x64](https://download.microsoft.com/download/B/4/3/B4301105-7D4F-402D-AB82-AD4283E2A5AD/proofingtools2016_te-in-x64.exe) <br/> |
|Thai  <br/> |th-th  <br/> |[x86](https://download.microsoft.com/download/E/2/8/E28F8C68-40D5-440E-8557-611D56134A2E/proofingtools2016_th-th-x86.exe), [x64](https://download.microsoft.com/download/E/2/8/E28F8C68-40D5-440E-8557-611D56134A2E/proofingtools2016_th-th-x64.exe) <br/> |
|Turkish  <br/> |tr-tr  <br/> |[x86](https://download.microsoft.com/download/8/4/A/84A17221-5466-4CE9-96B2-B8B78548668E/proofingtools2016_tr-tr-x86.exe), [x64](https://download.microsoft.com/download/8/4/A/84A17221-5466-4CE9-96B2-B8B78548668E/proofingtools2016_tr-tr-x64.exe) <br/> |
|Ukrainian  <br/> |uk-ua  <br/> |[x86](https://download.microsoft.com/download/A/7/8/A7870796-B1B2-4162-A98E-AC8898985AD4/proofingtools2016_uk-ua-x86.exe), [x64](https://download.microsoft.com/download/A/7/8/A7870796-B1B2-4162-A98E-AC8898985AD4/proofingtools2016_uk-ua-x64.exe) <br/> |
|Urdu  <br/> |ur-pk  <br/> |[x86](https://download.microsoft.com/download/9/E/4/9E4544E3-9530-45AE-B16F-3B912870D622/proofingtools2016_ur-pk-x86.exe), [x64](https://download.microsoft.com/download/9/E/4/9E4544E3-9530-45AE-B16F-3B912870D622/proofingtools2016_ur-pk-x64.exe) <br/> |
|Uzbek (Latin)  <br/> |uz-Latn-uz  <br/> |[x86](https://download.microsoft.com/download/E/E/3/EE30D59A-1682-4D64-8A10-77612BC72034/proofingtools2016_uz-latn-uz-x86.exe), [x64](https://download.microsoft.com/download/E/E/3/EE30D59A-1682-4D64-8A10-77612BC72034/proofingtools2016_uz-latn-uz-x64.exe) <br/> |
|Vietnamese  <br/> |vi-vn  <br/> |[x86](https://download.microsoft.com/download/B/7/F/B7F58237-9A45-4AFE-BD73-F8C52A555A17/proofingtools2016_vi-vn-x86.exe), [x64](https://download.microsoft.com/download/B/7/F/B7F58237-9A45-4AFE-BD73-F8C52A555A17/proofingtools2016_vi-vn-x64.exe) <br/> |
|Welsh  <br/> |cy-gb  <br/> |[x86](https://download.microsoft.com/download/9/B/B/9BB9E4CF-B639-4C9A-964C-2C1579CB9959/proofingtools2016_cy-gb-x86.exe), [x64](https://download.microsoft.com/download/9/B/B/9BB9E4CF-B639-4C9A-964C-2C1579CB9959/proofingtools2016_cy-gb-x64.exe) <br/> |
|Wolof  <br/> |wo-sn  <br/> |[x86](https://download.microsoft.com/download/C/9/3/C93F4B91-2897-4B0D-B84F-1A39692746E8/proofingtools2016_wo-sn-x86.exe), [x64](https://download.microsoft.com/download/C/9/3/C93F4B91-2897-4B0D-B84F-1A39692746E8/proofingtools2016_wo-sn-x64.exe) <br/> |
|Yoruba  <br/> |yo-ng  <br/> |[x86](https://download.microsoft.com/download/1/D/B/1DBAEB2B-7648-47A5-8F26-7B9F9814E959/proofingtools2016_yo-ng-x86.exe), [x64](https://download.microsoft.com/download/1/D/B/1DBAEB2B-7648-47A5-8F26-7B9F9814E959/proofingtools2016_yo-ng-x64.exe) <br/> |
   
## Related Topics

- [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md)
  

