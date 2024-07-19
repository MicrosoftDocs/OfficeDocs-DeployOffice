---
title: "Language identifiers and OptionState ID values in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Find language identifier and OptionState ID values for identifying and customizing Office 2016 language and proofing tools installations."
ms.date: 04/19/2024
---

# Language identifiers and OptionState ID values in Office 2016

 **Summary:** Find language identifier and OptionState ID values for identifying and customizing Office 2016 language and proofing tools installations. 
  
  
Use the values in the Language Identifier and OptionState ID tables to configure setup for Office 2016 or for Office proofing tools, or to identify currently installed languages. The provided values are necessary for completing procedures described in the following articles:
  
- [Add or remove language packs after deployment of Office 2016](add-remove-language-packs.md)
    
- [Customize language setup and settings for Office 2016](customize-language-setup-settings.md)
    
- [Plan for multilanguage deployment of Office 2016](plan-multilanguage-deployment.md)
    
> [!IMPORTANT]
> This article describes methods of deploying and managing language packs for versions of Office 2016 that use the Windows Installer (MSI) installation technology, which are available for enterprises through volume licensing. If you have an Office subscription and you're deploying Microsoft 365 Apps, which uses the Click-to-Run installation technology, see [Overview of deploying languages for Microsoft 365 Apps](../../deploy/overview-office-deployment-tool.md). 
  
<a name="BKMK_LanguageIdentifiers"> </a>
## Language identifiers

Office 2016 is available in many languages. In an international setting, you can deploy multiple language versions of Office 2016 in a single installation process. Setup combines a language-neutral core product with one or more language-specific packages to create a complete product. 
  
On the source media, language-specific packages are organized into separate folders. Each folder name has a language tag appended to it, in the form  _ll-cc_. That tag identifies the language and culture. For example, U.S. English language folders are identified by the folder name extension **en-us**. The language tags help you determine the folders that you have to copy to the network installation point. 
  
The language folders that are included in a fully localized version of an Office 2016 product are the same as the language folders that are included in the Microsoft Office 2016 Language Pack for a specific language. For example, the same Outlook.ar-sa folder is used in the Arabic language version of Office 2016, the Arabic language version of Outlook 2016, and the Office 2016 Language Pack - Arabic.
  
> [!NOTE]
> Language tags are also referred to and used as "language IDs" for some procedures. 
  
Office 2016 offers localized versions in all the languages that are listed in the following table. The language tag shown in the table identifies the folders for the language-specific components. The Windows operating system uses locale identifiers (LCIDs) to identify languages in the Windows registry.
  
In addition to the fully localized languages listed here, Office 2016 offers Language Interface Packs (LIPs). These packs include a subset of language-specific components and should be installed alongside a logical parent language. Elements that aren't localized in the LIP language appear in the parent language. For more information about LIPs, see [Language Interface Packs](language-versions-language-interface-packs.md#BKMK_LanguageInterfacePacks).
  
**Language tags (language IDs), and LCIDs available in Office 2016**

|**Language**|**Geographic area**|**Language tag  _(ll-CC)_<sup>1</sup>**|**LCID**|
|:-----|:-----|:-----|:-----|
|Arabic  <br/> |Saudi Arabia  <br/> |ar-SA  <br/> |1025  <br/> |
|Bulgarian  <br/> |Bulgaria  <br/> |bg-BG  <br/> |1026  <br/> |
|Chinese (Simplified)  <br/> |People's Republic of China  <br/> |zh-CN  <br/> |2052  <br/> |
|Chinese  <br/> |Taiwan  <br/> |zh-TW  <br/> |1028  <br/> |
|Croatian  <br/> |Croatia  <br/> |hr-HR  <br/> |1050  <br/> |
|Czech  <br/> |Czech Republic  <br/> |cs-CZ  <br/> |1029  <br/> |
|Danish  <br/> |Denmark  <br/> |da-DK  <br/> |1030  <br/> |
|Dutch  <br/> |Netherlands  <br/> |nl-NL  <br/> |1043  <br/> |
|English  <br/> |United States  <br/> |en-US  <br/> |1033  <br/> |
|Estonian  <br/> |Estonia  <br/> |et-EE  <br/> |1061  <br/> |
|Finnish  <br/> |Finland  <br/> |fi-FI  <br/> |1035  <br/> |
|French  <br/> |France  <br/> |fr-FR  <br/> |1036  <br/> |
|German  <br/> |Germany  <br/> |de-DE  <br/> |1031  <br/> |
|Greek  <br/> |Greece  <br/> |el-GR  <br/> |1032  <br/> |
|Hebrew  <br/> |Israel  <br/> |he-IL  <br/> |1037  <br/> |
|Hindi  <br/> |India  <br/> |hi-IN  <br/> |1081  <br/> |
|Hungarian  <br/> |Hungary  <br/> |hu-HU  <br/> |1038  <br/> |
|Indonesian  <br/> |Indonesia  <br/> |id-ID  <br/> |1057  <br/> |
|Italian  <br/> |Italy  <br/> |it-IT  <br/> |1040  <br/> |
|Japanese  <br/> |Japan  <br/> |ja-JP  <br/> |1041  <br/> |
|Kazakh  <br/> |Kazakhstan  <br/> |kk-KZ  <br/> |1087  <br/> |
|Korean  <br/> |Korea  <br/> |ko-KR  <br/> |1042  <br/> |
|Latvian  <br/> |Latvia  <br/> |lv-LV  <br/> |1062  <br/> |
|Lithuanian  <br/> |Lithuania  <br/> |lt-LT  <br/> |1063  <br/> |
|Malay  <br/> |Malaysia  <br/> |ms-MY  <br/> |1086  <br/> |
|Norwegian (Bokmål)  <br/> |Norway  <br/> |nb-NO  <br/> |1044  <br/> |
|Polish  <br/> |Poland  <br/> |pl-PL  <br/> |1045  <br/> |
|Portuguese  <br/> |Brazil  <br/> |pt-BR  <br/> |1046  <br/> |
|Portuguese  <br/> |Portugal  <br/> |pt-PT  <br/> |2070  <br/> |
|Romanian  <br/> |Romania  <br/> |ro-RO  <br/> |1048  <br/> |
|Russian  <br/> |Russia  <br/> |ru-RU  <br/> |1049  <br/> |
|Serbian (Latin)  <br/> |Serbia  <br/> |sr-latn-RS  <br/> |2074  <br/> |
|Slovak  <br/> |Slovakia  <br/> |sk-SK  <br/> |1051  <br/> |
|Slovenian  <br/> |Slovenia  <br/> |sl-SI  <br/> |1060  <br/> |
|Spanish  <br/> |Spain  <br/> |es-ES  <br/> |3082  <br/> |
|Swedish  <br/> |Sweden  <br/> |sv-SE  <br/> |1053  <br/> |
|Thai  <br/> |Thailand  <br/> |th-TH  <br/> |1054  <br/> |
|Turkish  <br/> |Türkiye  <br/> |tr-TR  <br/> |1055  <br/> |
|Ukrainian  <br/> |Ukraine  <br/> |uk-UA  <br/> |1058  <br/> |
|Vietnamese  <br/> |Vietnam  <br/> |vi-VN  <br/> |1066  <br/> |

<sup>1</sup> Language tag is sometimes referred to as the language ID.
   
<a name="BKMK_OptionStateID"> </a>
## Proofing Tools Config.xml OptionState ID values

The following table provides the OptionState ID values for the Office proofing tools. Use these values to modify the Config.xml file in the ProofKit.WW folder when you customize the setup of the Office proofing tools. For more information about proofing tools, see [Plan for Office proofing tools](plan-multilanguage-deployment.md#BKMK_PlanProofingTools). For instructions on how to customize proofing tools, see [Customize and install the Office proofing tools](customize-language-setup-settings.md#BKMK_CustomizeProofingTools).
  
**OptionState IDs for each Proofing Tools language in Office 2016**

|**OptionState ID**|**Proofing tools language**|
|:-----|:-----|
|ProofingTools_1025  <br/> |Arabic  <br/> |
|ProofingTools_1069  <br/> |Basque (Basque)  <br/> |
|ProofingTools_1026  <br/> |Bulgarian  <br/> |
|ProofingTools_1027  <br/> |Catalan  <br/> |
|ProofingTools_2052  <br/> |Chinese (People's Republic of China)  <br/> |
|ProofingTools_3076  <br/> |Chinese (Hong Kong SAR)  <br/> |
|ProofingTools_1028  <br/> |Chinese (Taiwan)  <br/> |
|IMEMain_1028  <br/> |Chinese Traditional Input Method Editor (IME)  <br/> |
|ProofingTools_1050  <br/> |Croatian  <br/> |
|ProofingTools_1029  <br/> |Czech  <br/> |
|ProofingTools_1030  <br/> |Danish  <br/> |
|ProofingTools_1043  <br/> |Dutch  <br/> |
|ProofingTools_1033  <br/> |English  <br/> |
|ProofingTools_1061  <br/> |Estonian  <br/> |
|ProofingTools_1035  <br/> |Finnish  <br/> |
|ProofingTools_1036  <br/> |French  <br/> |
|ProofingTools_1110  <br/> |Galician  <br/> |
|ProofingTools_1031  <br/> |German  <br/> |
|ProofingTools_1032  <br/> |Greek  <br/> |
|ProofingTools_1095  <br/> |Gujarati  <br/> |
|ProofingTools_1037  <br/> |Hebrew  <br/> |
|ProofingTools_1081  <br/> |Hindi  <br/> |
|ProofingTools_1038  <br/> |Hungarian  <br/> |
|ProofingTools_1040  <br/> |Italian  <br/> |
|ProofingTools_1041  <br/> |Japanese  <br/> |
|IMEMain_1041  <br/> |Japanese IME  <br/> |
|ProofingTools_1099  <br/> |Kannada  <br/> |
|ProofingTools_1087  <br/> |Kazakh  <br/> |
|ProofingTools_1042  <br/> |Korean  <br/> |
|IMEMain_1042  <br/> |Korean IME  <br/> |
|ProofingTools_1062  <br/> |Latvian  <br/> |
|ProofingTools_1063  <br/> |Lithuanian  <br/> |
|ProofingTools_1102  <br/> |Marathi  <br/> |
|ProofingTools_1044  <br/> |Norwegian (Bokmål)  <br/> |
|ProofingTools_2068  <br/> |Norwegian (Nynorsk)  <br/> |
|IMEMain_2052  <br/> |Pinyin IME  <br/> |
|ProofingTools_1045  <br/> |Polish  <br/> |
|ProofingTools_1046  <br/> |Portuguese (Brazil)  <br/> |
|ProofingTools_2070  <br/> |Portuguese (Portugal)  <br/> |
|ProofingTools_1094  <br/> |Punjabi  <br/> |
|ProofingTools_1048  <br/> |Romanian  <br/> |
|ProofingTools_1049  <br/> |Russian  <br/> |
|ProofingTools_2074  <br/> |Serbian (Latin)  <br/> |
|ProofingTools_1051  <br/> |Slovak  <br/> |
|ProofingTools_1060  <br/> |Slovenian  <br/> |
|ProofingTools_3082  <br/> |Spanish  <br/> |
|ProofingTools_1053  <br/> |Swedish  <br/> |
|ProofingTools_1097  <br/> |Tamil  <br/> |
|ProofingTools_1098  <br/> |Telugu  <br/> |
|ProofingTools_1054  <br/> |Thai  <br/> |
|ProofingTools_1055  <br/> |Turkish  <br/> |
|ProofingTools_1058  <br/> |Ukrainian  <br/> |
|ProofingTools_1056  <br/> |Urdu  <br/> |
   
## Related articles
[Plan for multilanguage deployment of Office 2016](plan-multilanguage-deployment.md)
  
[Customize language setup and settings for Office 2016](customize-language-setup-settings.md)
  
[Language versions and language interface packs in Office 2016](language-versions-language-interface-packs.md)

