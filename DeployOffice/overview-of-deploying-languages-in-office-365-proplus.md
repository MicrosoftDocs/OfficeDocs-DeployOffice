---
title: "Overview of deploying languages in Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
---

# Overview of deploying languages in Office 365 ProPlus

This article describes how to deploy multiple languages for Office 365 ProPlus, including our best practice recommendations. 

> [!NOTE]
> This article assumes you're using the Office Customization Tool to create configuration files for the Office Deployment Tool or for System Center Configuration Manager. For more details on how to use these tools, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md).

## Install languages from the Office 365 portal

If your organization allows it, users can install Office 365 ProPlus languages directly from the Office 365 portal. When users install Office from the **Software** page, they select a language from the **Language** drop-down box. If a user need an additional language, they can just re-run the process for each required language. The setup will add the selected language to the user's device.

## Install multiple languages as part of deploying Office

If your users don't have permission to install Office languages from the Office 365 portal, you can use the Office Deployment Tool to install Office 365 ProPlus in multiple languages. To do so, use the [Office Customization Tool](https://config.office.com/) to add multiple languages. 

> [!NOTE]
> The primary language selected in the Office Customization Tool determines the Shell UI language. The Shell UI is the language that is used to display shortcuts, right-click context menus, and tooltips. If you decide that you want to change the Shell UI language after an initial installation, you have to uninstall Office and reinstall it. 
    
## Add languages to existing installations of Office 365 ProPlus

After installing Office, you can install additional languages for Office 365 ProPlus. To do so, use the same tools you used to deploy Office, such as Configuration Manager or the Office Deployment Tool. When creating the configuration file in the Office Customization Tool, select **Language Pack** as the Additional Product in the Products section. In the Language section, select the additional languages you want to install.

> [!NOTE]
> By default, the ODT will install the languages from the same location that Office gets updates from. If you want to install the languages from a different source location, specify the source path in the configuration file. 

## Install proofing tools

Each language version of Office 365 ProPlus includes proofing tools for a set of companion languages. For example, when you deploy the English version of Office, users receive proofing tools for English, Spanish, and French. These proofing tools include spelling and grammar checkers, thesauruses, and hyphenators. They might also include language-specific editing features such as Language AutoDetect, AutoSummarize, and Intelligent AutoCorrect.

If you want to deploy proofing tools in additional languages beyond the companion languages, you can deploy the full language pack for that additional language or you can deploy just the proofing tools for that additional language. Many administrators choose to deploy just the proofing tools to conserve bandwidth on the network and speed up installation on client computers.

To install just the proofing tools, use the same tools you used to deploy Office, such as Configuration Manager or the ODT. When creating the configuration file, you use "ProofingTools" as the Product ID, along with the appropriate Language IDs, as shown in the example. You can include proofing tools in the initial deployment of Office or you can add them later to an existing deployment. In either case, make sure that the additional proofing tools are the same version (32-bit or 64-bit) and channel as Office.

> [!NOTE]
> If you deploy languages from a local source (as shown in the example below), you must download the proofing tools to that source first. To do that, use the ODT with the configuration file, but run it in download mode. For more details on how to do that, see [Download the installation files for Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#download-the-installation-files-for-office-365-proplus). Whenever you use a local source, you can use the Office CDN as a backup source for language packs and proofing tools by including the "AllowCdnFallback" attribute in the configuration file, as shown in the example. 

For details on how to edit the configuration file, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

### Example

This configuration file installs the 64-bit version of proofing tools from German and Italian. Because the installation is from a local source, the proofing tools should be downloaded to that local source before they can be installed on client computers. If the tools aren't found at the local source, the "AllowCdnFallback" setting tells the ODT to install the tools directly from the Office CDN.

```
<Configuration>
 <Add SourcePath="\\Server\Share" 
     OfficeClientEdition="64"
     Channel="Broad" 
     AllowCdnFallback="True">
  <Product ID="ProofingTools">
     <Language ID="de-de"/>
     <Language ID="it-it"/>
  </Product>
 </Add>  
</Configuration>
```

## Install matching languages

When deploying Office with the Office Deployment Tool (ODT), you can automatically install the same languages that are in use by the operating system or by an existing version of Office. To match the operation system langauge, use "MatchOS" as the Language ID. To match the language used by the existing version of Office, use "MatchInstalled" as the language ID. 

MatchInstalled can be used when deploying a specific Office app, such as Visio, to devices with Office already installed. In that case, using MatchInstalled automatically installs Visio in the languages used by the existing version of Office.

When MatchOS is used, the ODT will install the base language of the operating system and all active display languages for user profiles on the device. MatchOS can be used in combination with a fixed list of languages. For example, you can use Language ID = "MatchOS" and Language ID = "en-us" to install both English and any matching languages.

MatchOS and MatchInstalled cannot install a langauge if Office doesn't support that language or if the ODT cannot find the correct language pack in the local source files. To help address this issue, we recommend that you specify a backup language and and a backup source location for the language pack:

- To specify a fallback language, include the "Fallback" attribute in the configuration file, as shown in the example. The fallback language will be installed if one of the detected languages isn't supported by Office. If you use MatchOS or MatchInstalled and do not include a fallback language, the ODT will use en-us as a default fallback. 

- To use the Office CDN as a backup source for language packs, include the "AllowCdnFallback" attribute in the configuration file, as shown in the example. When installing languages, the ODT looks first for source files in the location specified in the SourcePath attribute. If the language pack isn't available at that location **and** the AllowCdnFallback setting is included, then the ODT will use source files from the Office CDN.

For details on how to edit the configuration file, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

### Example
```
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" 
     AllowCdnFallback="True">
  <Product ID="O365ProPlusRetail">
     <Language ID="MatchInstalled"  />
     <Language ID="MatchOS" Fallback="en-us" />
  </Product>
</Add>  
```

## Install the same languages from a previous MSI installation

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources--for example, language packs, language interface packs, or proofing tools--installed when you install Office 365 ProPlus. For more information, see [Remove existing MSI versions of Office when upgrading to Office 365 ProPlus](upgrade-from-msi-version.md).

## Conserve network bandwidth when adding language packs

When you use the Office Deployment Tool (ODT) to download the installation files for Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

## Language resources for Office 365 ProPlus

Resources for Office 365 ProPlus are packaged similarly to the way standard Office MSI resources are organized. Language-neutral product resources are packaged into a single file that contains all the neutral resources. Language-specific resources are packaged into language-specific files such as en-us for English (United States) resources.

You can install the following language resources for Office 365 ProPlus:

- Language Interface Packs: Translated User Interface that installs over a copy of a Click-to-Run installation. You can download and install a Language Interface Pack for free. After you install it, you can use Microsoft Excel, OneNote, Microsoft Outlook, PowerPoint, and Word features in a different language. You can use the **Office Language Preferences** dialog after installation to change a language and see a translated user interface. For information about how to change the editing, display or Help language for Office applications, see [Enable the use of other languages in your Office programs](https://go.microsoft.com/fwlink/p/?LinkId=281959). To set Office language options on a computer that is running Windows 10, type "Office Language" at the **Start** screen, and select **Office Language Preferences** to open the **Microsoft Office Language Preferences** dialog box.
    
- Proofing Tools: Localized language versions of Office include proofing tools for a set of companion langauges. For more details, see [Proofing Tools for Office 365 ProPlus](proofing-tools-for-office-365-proplus.md).
    
- ScreenTip Language: Translations that show the text of display elements such as buttons, menus, and dialog boxes in another language. You can download [Microsoft Office ScreenTip Language 2013](https://go.microsoft.com/fwlink/p/?LinkId=281983) from the Microsoft Download Center. ScreenTip Language installs over a Click-to-Run installation.


## Languages, culture codes, and companion proofing languages

The following table lists all the supported languages for Office 365 ProPlus, along with culture codes and companion proofing languages.

| **Language**                             | **Culture (ll-cc)** | **Companion proofing languages**                                          |
|------------------------------------------|---------------------|---------------------------------------------------------------------------|
| Afrikaans                                | af-za               |                                                                           |
| Albanian                                 | sq-al               |                                                                           |
| Arabic                                   | ar-sa               | Arabic, English, French                                                   |
| Armenian                                 | hy-am               |                                                                           |
| Assamese                                 | as-in               |                                                                           |
| Azerbaijani (Latin)                      | az-Latn-az          |                                                                           |
| Bangla (Bangladesh)                      | bn-bd               |                                                                           |
| Bangla (Bengali India)                   | bn-in               |                                                                           |
| Basque (Basque)                          | eu-es               |                                                                           |
| Bosnian (Latin)                          | bs-latn-ba          |                                                                           |
| Bulgarian                                | bg-bg               | Bulgarian, English, German, Russian                                       |
| Catalan                                  | ca-es               |                                                                           |
| Catalan (Valencia)                       | ca-es-valencia      |                                                                           |
| Chinese (Simplified)                     | zh-cn               | Chinese (Simplified), English                                             |
| Chinese (Traditional)                    | zh-tw               | Chinese (Traditional), English                                            |
| Croatian                                 | hr-hr               | Croatian, English, German, Serbian, Italian                               |
| Czech                                    | cs-cz               | Czech, English, German, Slovak                                            |
| Danish                                   | da-dk               | Danish, English, German, Swedish                                          |
| Dutch                                    | nl-nl               | Dutch, English, French, German                                            |
| English                                  | en-us               | English, French, Spanish                                                  |
| Estonian                                 | et-ee               | Estonian, English, German, Russian, Finnish,                              |
| Finnish                                  | fi-fi               | Finnish, English, Swedish, German, Russian                                |
| French                                   | fr-fr               | French, English, German, Dutch, Arabic, Spanish                           |
| Galician                                 | gl-es               |                                                                           |
| Georgian                                 | ka-ge               |                                                                           |
| German                                   | de-de               | German, English, French, Italian                                          |
| Greek                                    | el-gr               | Greek, English, French, German                                            |
| Gujarati                                 | gu-in               |                                                                           |
| Hausa                                    | ha-Latn-ng          |                                                                           |
| Hebrew                                   | he-il               | Hebrew, English, French, Arabic, Russian                                  |
| Hindi                                    | hi-in               | Hindi, English, Tamil, Telegu, Marathi, Kannada, Guajarati, Punjabi, Urdu |
| Hungarian                                | hu-hu               | Hungarian, English, German                                                |
| Icelandic                                | is-is               |                                                                           |
| Igbo                                     | ig-ng               |                                                                           |
| Indonesian                               | id-id               | Indonesian, English                                                       |
| Irish                                    | ga-ie               |                                                                           |
| isiXhosa                                 | xh-za               |                                                                           |
| isiZulu                                  | zu-za               |                                                                           |
| Italian                                  | it-it               | Italian, English, French, German                                          |
| Japanese                                 | ja-jp               | Japanese, English                                                         |
| Kannada                                  | kn-in               |                                                                           |
| Kazakh                                   | kk-kz               | Kazakh, English, Russian                                                  |
| Kinyarwanda                              | rw-rw               |                                                                           |
| KiSwahili                                | sw-ke               |                                                                           |
| Konkani                                  | kok-in              |                                                                           |
| Korean                                   | ko-kr               | Korean, English                                                           |
| Kyrgyz                                   | ky-kg               |                                                                           |
| Latvian                                  | lv-lv               | Latvian, English, German, Russian                                         |
| Lithuanian                               | lt-lt               | Lithuanian, English, German, Russian, Polish                              |
| Luxembourgish                            | lb-lu               |                                                                           |
| Macedonian (FYRO Macedonia )             | mk-mk               |                                                                           |
| Malay (Latin)                            | ms-my               | Malay, English, Chinese (Simplified)                                      |
| Malayalam                                | ml-in               |                                                                           |
| Maltese                                  | mt-mt               |                                                                           |
| Maori                                    | mi-nz               |                                                                           |
| Marathi                                  | mr-in               |                                                                           |
| Nepali                                   | ne-np               |                                                                           |
| Norwegian Bokmål                         | nb-no               | Norwegian (Bk), English, German, Norwegian (Ny)                           |
| Norwegian Nynorsk                        | nn-no               | Norwegian (Bk), English, German, Norwegian (Ny)                           |
| Odia                                     | or-in               |                                                                           |
| Pashto                                   | ps-af               |                                                                           |
| Persian (Farsi)                          | fa-ir               |                                                                           |
| Polish                                   | pl-pl               | Polish, English, German                                                   |
| Portuguese (Portugal)                    | pt-pt               | Portuguese, English, French, Spanish                                      |
| Portuguese (Brazil)                      | pt-br               | Brazilian, English, Spanish                                               |
| Punjabi (Gurmukhi)                       | pa-in               |                                                                           |
| Romanian                                 | ro-ro               | Romanian, English, French                                                 |
| Romansh                                  | rm-ch               |                                                                           |
| Russian                                  | ru-ru               | Russian, English, Ukrainian, German                                       |
| Scottish Gaelic                          | gd-gb               |                                                                           |
| Serbian (Cyrillic, Serbia)               | sr-cyrl-rs          |                                                                           |
| Serbian (Latin, Serbia)                  | sr-latn-rs          | Serbian (Latin), English, German, French, Croatian                        |
| Serbian (Cyrillic, Bosnia & Herzegovina) | sr-cyrl-ba          |                                                                           |
| Sesotho sa Leboa                         | nso-za              |                                                                           |
| Setswana                                 | tn-za               |                                                                           |
| Sinhala                                  | si-lk               |                                                                           |
| Slovak                                   | sk-sk               | Slovak, English, Czech, Hungarian, German                                 |
| Slovenian                                | sl-si               | Slovenian, English, German, Italian, Croatian                             |
| Spanish                                  | es-es               | Spanish, English, French, Basque (Basque), Catalan, Galician, Brazilian   |
| Swedish                                  | sv-se               | Swedish, English, Finnish, German                                         |
| Tamil                                    | ta-in               |                                                                           |
| Tatar (Cyrillic)                         | tt-ru               |                                                                           |
| Telugu                                   | te-in               |                                                                           |
| Thai                                     | th-th               | Thai, English, French                                                     |
| Turkish                                  | tr-tr               | Turkish, English, French, German                                          |
| Ukrainian                                | uk-ua               | Ukrainian, English, Russian, German                                       |
| Urdu                                     | ur-pk               |                                                                           |
| Uzbek (Latin)                            | uz-Latn-uz          |                                                                           |
| Vietnamese                               | vi-vn               | Vietnamese, English, French                                               |
| Welsh                                    | cy-gb               |                                                                           |
| Wolof                                    | wo-sn               |                                                                           |
| Yoruba                                   | yo-ng               |

## Related topics

- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
