---
title: "Language versions and language interface packs in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Learn about the language packs and language interface packs that are available for Office."
ms.date: 04/19/2024
---

# Language versions and language interface packs in Office 2016

 **Summary:** Learn about the language packs and language interface packs that are available for Office. 
  
  
An installation of Office 2016 can include applications or user interface elements in more than one language because some Office 2016 products aren't available in every language. 
  
This article covers three key aspects of Office 2016's language capabilities. Firstly, it lists the language versions available for certain Office 2016 applications. Secondly, it identifies the Office 2016 applications compatible with Language Interface Packs. Lastly, it provides recommendations on the base languages to install for the Office 2016 Language Interface Packs.
  
> [!IMPORTANT]
> This article describes methods of deploying and managing language packs for versions of Office 2016 that use the Windows Installer (MSI) installation technology, which are available for enterprises through volume licensing. If you have an Office subscription and you're deploying Microsoft 365 Apps, which uses the Click-to-Run installation technology, see [Overview of deploying languages for Microsoft 365 Apps](..//microsoft-365-apps/deploy/overview-office-deployment-tool). 
  
    
<a name="BKMK_ApplicationsLanguageAvailability"> </a>
## Applications and language availability

In some non-English language versions of Office 2016, a specific Office 2016 application might not be available. For example, Access 2016 isn't available in Hindi. Therefore, the Hindi language version of Office 2016 is installed in English.
  
Some Office applications aren't available in some languages. Project 2016 and Visio 2016 are available in a subset of languages, as shown in the following table.
  
**Language availability for the 2016 versions of Project and Visio**

|**Language**|**Project 2016**|**Visio 2016**|
|:-----|:-----|:-----|
|Arabic  <br/> |yes  <br/> |yes  <br/> |
|Brazilian  <br/> |yes  <br/> |yes  <br/> |
|Bulgarian  <br/> |no  <br/> |no  <br/> |
|Chinese - Simple  <br/> |yes  <br/> |yes  <br/> |
|Chinese - Traditional  <br/> |yes  <br/> |yes  <br/> |
|Croatian  <br/> |no  <br/> |no  <br/> |
|Czech  <br/> |yes  <br/> |yes  <br/> |
|Danish  <br/> |yes  <br/> |yes  <br/> |
|Dutch  <br/> |yes  <br/> |yes  <br/> |
|English  <br/> |yes  <br/> |yes  <br/> |
|Finnish  <br/> |yes  <br/> |yes  <br/> |
|French  <br/> |yes  <br/> |yes  <br/> |
|German  <br/> |yes  <br/> |yes  <br/> |
|Greek  <br/> |yes  <br/> |yes  <br/> |
|Hebrew  <br/> |yes  <br/> |yes  <br/> |
|Hindi  <br/> |no  <br/> |no  <br/> |
|Hungarian  <br/> |yes  <br/> |yes  <br/> |
|Italian  <br/> |yes  <br/> |yes  <br/> |
|Japanese  <br/> |yes  <br/> |yes  <br/> |
|Korean  <br/> |yes  <br/> |yes  <br/> |
|Norwegian (Bokmål)  <br/> |yes  <br/> |yes  <br/> |
|Polish  <br/> |yes  <br/> |yes  <br/> |
|Portuguese (European)  <br/> |yes  <br/> |yes  <br/> |
|Romanian  <br/> |no  <br/> |no  <br/> |
|Russian  <br/> |yes  <br/> |yes  <br/> |
|Serbian (Latin)  <br/> |no  <br/> |no  <br/> |
|Slovak  <br/> |yes  <br/> |yes  <br/> |
|Slovenian  <br/> |yes  <br/> |yes  <br/> |
|Spanish  <br/> |yes  <br/> |yes  <br/> |
|Swedish  <br/> |yes  <br/> |yes  <br/> |
|Thai  <br/> |no  <br/> |no  <br/> |
|Turkish  <br/> |yes  <br/> |yes  <br/> |
|Ukrainian  <br/> |yes  <br/> |yes  <br/> |
   
<a name="BKMK_LanguageInterfacePacks"> </a>
## Language Interface Packs

For some languages, Microsoft localizes only some Office 2016 applications and releases them as Language Interface Packs (LIPs). These LIPs localize the user interface only, and not the Help content. Administrators must first install a fully localized base language version (see the table later in this section) of Office 2016, and then install the LIP. Users can then work in their preferred language in the following applications and features: 
  
- Excel 2016
    
- OneNote 2016
    
- Outlook 2016
    
- PowerPoint 2016
    
- Shared Office features
    
- Word 2016
    
- Skype for Business 2016, but only for the following languages:
    
  - Albanian: sq-SQ
    
  - Azerbaijani (Latin): az-Latn-AZ
    
  - Basque: eu-ES
    
  - Belarusian: be-BE
    
  - Catalan: ca-ES
    
  - Persian: fa-IR
    
  - Filipino: fil-PH
    
  - Galician: gl-ES
    
  - Macedonian (North Macedonia): mk-MK
    
  - Serbian (Cyrillic): sr-Cyrl-RS
    
  - Uzbek (Latin): uz-Latn-UZ
    
The remaining Office applications appear in the base Office 2016 installation language. The following table lists the base language for each LIP language.
  
**Base languages available for Language Interface Packs**

|**LIP language**|**Base language**|
|:-----|:-----|
|Afrikaans  <br/> |English  <br/> |
|Albanian  <br/> |English  <br/> |
|Amharic  <br/> |English  <br/> |
|Armenian  <br/> |English  <br/> |
|Assamese  <br/> |English  <br/> |
|Azerbaijani - Latin script  <br/> |English  <br/> |
|Bangla (Bangladesh)  <br/> |English  <br/> |
|Basque (Basque)  <br/> |Spanish  <br/> |
|Belarusian  <br/> |Russian  <br/> |
|Bengali - India  <br/> |English or Hindi  <br/> |
|Bosnian - Latin script  <br/> |English  <br/> |
|Catalan  <br/> |Spanish  <br/> |
|Dari  <br/> |English  <br/> |
|Filipino  <br/> |English  <br/> |
|Galician  <br/> |Spanish  <br/> |
|Georgian  <br/> |English  <br/> |
|Gujarati  <br/> |English  <br/> |
|Icelandic  <br/> |English  <br/> |
|Irish  <br/> |English  <br/> |
|Kannada  <br/> |English  <br/> |
|Khmer  <br/> |English  <br/> |
|Kiswahili  <br/> |English  <br/> |
|Konkani  <br/> |English  <br/> |
|Krygyz  <br/> |Russian  <br/> |
|Luxembourgish  <br/> |French  <br/> |
|Macedonian (North Macedonia)  <br/> |English  <br/> |
|Malayalam  <br/> |English  <br/> |
|Maltese  <br/> |English  <br/> |
|Maori  <br/> |English  <br/> |
|Marathi  <br/> |English  <br/> |
|Mongolian - Cyrillic script  <br/> |English  <br/> |
|Nepali  <br/> |English  <br/> |
|Norwegian (Nynorsk)  <br/> |Norwegian (Bokmål)  <br/> |
|Odia  <br/> |English  <br/> |
|Persian  <br/> |English  <br/> |
|Punjabi (India)  <br/> |English  <br/> |
|Quechua (Peru)  <br/> |Spanish  <br/> |
|Scottish Gaelic  <br/> |English  <br/> |
|Serbian - Cyrillic script  <br/> |Serbian (Latin)  <br/> |
|Serbian - Cyrillic script (Bosnia and Herzegovina)  <br/> |English  <br/> |
|Sindhi (Pakistan)  <br/> |English  <br/> |
|Sinhala  <br/> |English  <br/> |
|Tamil (India)  <br/> |English  <br/> |
|Tatar  <br/> |Russian  <br/> |
|Telugu  <br/> |English  <br/> |
|Turkmen  <br/> |Russian  <br/> |
|Urdu  <br/> |English  <br/> |
|Uyghur  <br/> |Chinese (Simplified)  <br/> |
|Uzbek - Latin script  <br/> |English or Russian  <br/> |
|Valencian  <br/> |Spanish  <br/> |
|Welsh  <br/> |English  <br/> |
   
For information about how to obtain the LIP you need for your deployment, see [Download language packs, language interface packs, and proofing tools for volume license versions of Office](customize-language-setup-settings.md#DownloadLIPandProofTools).
  
## Related articles
[Plan for multilanguage deployment of Office 2016](plan-multilanguage-deployment.md)
  
[Customize language setup and settings for Office 2016](customize-language-setup-settings.md)

