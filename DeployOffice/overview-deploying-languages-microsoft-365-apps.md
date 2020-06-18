---
title: "Overview of deploying languages for Microsoft 365 Apps"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
---

# Overview of deploying languages for Microsoft 365 Apps

This article covers the options for deploying languages for Microsoft 365 Apps, including what method to use, where to deploy languages from, how to deploy proofing tools, and best practices. We recommend using this article as part of [planning your Office deployment](plan-microsoft-365-apps.md). 

The guidance in this article applies to the following Office products:

- Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus), which comes with many Office 365 and Microsoft 365 enterprise plans.
- Microsoft 365 Apps for business (previously named Office 365 Business), which comes with some Microsoft 365 business plans.
- The subscription version of the Project desktop app that comes with Project Plan 3 or Project Plan 5. 
- The subscription version of the Visio desktop app that comes with Visio Plan 2. 

You can't use language resources for Windows Installer (MSI) versions of Office with Microsoft 365 Apps, which uses Click-to-Run. For example, you can't use language packs downloaded from the Volume Licensing Service Center (VLSC) with Microsoft 365 Apps.  

In general, you deploy languages for Microsoft 365 Apps with the same process and tools that you use to deploy Office itself. You can deploy multiple languages by including those languages directly in the Office packages, or you can deploy languages as a separate package, after Office is already installed. The steps in this article assume that you're deploying with Configuration Manager or the Office Deployment Tool, and that you use the Office Customization Tool (OCT) to create the configuration files for your deployment. If a setting is not yet available in the OCT, steps are given for creating the configuration file in a text editor.

## Best practices for deploying languages

When deploying multiple languages in a large organization, we recommend these best practices:

- Automatically [install the same languages as the operating system](#install-the-same-languages-as-the-operating-system).
- If you deploy Office from a local source on your network, [use the Office Content Delivery Network (CDN) as a backup source for language packs](#use-the-office-cdn-as-a-backup-source-for-language-packs) that might not be available at that local source.
- When adding languages to an existing deployment of Office, you can [deploy just the language packs](#deploy-languages-to-existing-installations-of-microsoft-365-apps), rather than the full version of Office.
- If you upgrade from a Windows Installer (MSI) version of Office, you can [automatically install the same languages as a previous MSI installation](#install-the-same-languages-as-a-previous-msi-installation). 
- When building Office packages to deploy, [include all the language packs you plan to deploy in each package](plan-microsoft-365-apps.md#step-4---define-your-source-files). Creating separate packages for different language sets can make the Office deployment  difficult to manage.
- If you deploy a subscription version of the Project or Visio desktop app to a device that already has Office installed, you can [automatically deploy them in the same languages as the installed version of Office](#deploy-visio-or-project-in-the-same-languages-as-an-existing-version-of-microsoft-365-apps).
- If you use some languages only as editing tools, you can [deploy just the proofing tools](#deploy-proofing-tools) instead of full language packs to conserve network bandwidth.

This article also includes [the list of supported languages](#languages-culture-codes-and-companion-proofing-languages) and details on how Office [conserves network bandwidth when downloading language packs](#conserve-network-bandwidth-when-adding-language-packs) for deployment.

## Install languages from the Office 365 portal

If your organization allows it, users can install Microsoft 365 Apps languages directly from the Office 365 portal. When users install Office from the **Software** page, they select a language from the **Language** drop-down box. If a user needs an additional language, they can just re-run the process for each required language. The setup will add the selected language to the user's device.

## Deploy multiple languages as part of deploying Office

To deploy Microsoft 365 Apps in multiple languages, you just need to include the additional languages in the Office packages you create. To do so, select the languages you want to deploy in the Language section when creating the configuration file in the [Office Customization Tool](https://config.office.com/).

If you deploy Office from a local source on your network, you must download your languages to that source, in the same way that you download the Office package. For more details, see [Download the installation files for Microsoft 365 Apps](overview-office-deployment-tool.md#download-the-installation-files-for-microsoft-365-apps). When deploying from a local source, we recommend that you [use the Office Content Delivery Network (CDN) as a backup source for language packs](#use-the-office-cdn-as-a-backup-source-for-language-packs). 

For more details on standard deployments, see [Plan your enterprise deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md).

The primary language selected in the Office Customization Tool determines the Shell UI language. The Shell UI is the language that is used to display shortcuts, right-click context menus, and tooltips. If you decide that you want to change the Shell UI language after an initial installation, you must uninstall Office and reinstall it. 

## Deploy languages to existing installations of Microsoft 365 Apps

After deploying Microsoft 365 Apps, you can deploy additional languages for Office. To do so, use the same process and tools you used to deploy Office, such as Configuration Manager or the Office Deployment Tool. 

1. If you're deploying languages from a local source, make sure the languages are available at that source. For more details, see [Download the installation files for Microsoft 365 Apps](overview-office-deployment-tool.md#download-the-installation-files-for-microsoft-365-apps). 
2. If you use a local source, we recommend that you [use the Office Content Delivery Network (CDN) as a backup source for language packs](#use-the-office-cdn-as-a-backup-source-for-language-packs). 
3. When creating the configuration file in the [Office Customization Tool](https://config.office.com/), select **Language Pack** as the Additional Product in the Products section. 
4. In the Language section, select the additional languages you want to install.
5. Deploy the languages using the same process you use to deploy Office.

When you add to an existing deployment, the ODT can automatically use the same architecture (32 bit or 64 bit) and source location (Office CDN or local source) as the existing installation of Microsoft 365 Apps. Because of this, you do not need to specify these values when creating the configuration file, which means you can use a single configuration file to deploy to multiple deployment groups. The Office Customization Tool, however, requires that you specify all these values, so you can only use this feature if you create the configuration file in a text editor. 

## Deploy proofing tools

Each language version of Microsoft 365 Apps includes proofing tools for a set of companion languages. For example, when you deploy the English version of Office, users receive proofing tools for English, Spanish, and French. These proofing tools include spelling and grammar checkers, thesauruses, and hyphenators. They might also include language-specific editing features such as Language AutoDetect, AutoSummarize, and Intelligent AutoCorrect.

If you want to deploy proofing tools in additional languages beyond the companion languages, you can deploy the full language pack for that additional language or you can deploy just the proofing tools for that additional language. Many administrators choose to deploy just the proofing tools to conserve bandwidth on the network and speed up installation on client computers.

To deploy just the proofing tools, use the same tools you used to deploy Office, such as Configuration Manager or the ODT. You can include proofing tools in the initial deployment of Office, or you can add them later to an existing deployment. 

> [!NOTE]
> To install proofing tools, you must be using at least Version 1803 of Microsoft 365 Apps. You must also be using the latest version of the Office Deployment Tool, which you can download from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065). In addition, you cannot use the Office Customization Tool to create the configuration file, because this feature is not yet available in that tool. Instead, you must edit the configuration file in a text editor. 

If you're adding to an existing deployment, the ODT will automatically use the same architecture (32 bit or 64 bit) and source location (Office CDN or local source) as the existing installation of Microsoft 365 Apps. Because of this, you do not need to specify these values when creating the configuration file, which means you can use a single configuration file to deploy to multiple deployment groups.

1. When creating the configuration file in a text editor, use "ProofingTools" as the Product ID, along with the appropriate Language IDs, as shown in the example. 
2. If you deploy languages from a local source, you must download the proofing tools to that source first. For more details, see [Download the installation files for Microsoft 365 Apps](overview-office-deployment-tool.md#download-the-installation-files-for-microsoft-365-apps).  
3. If you use a local source, we recommend that you use the Office CDN as a backup source for language packs and proofing tools by including the AllowCdnFallback attribute in the configuration file, as shown in the example. 

For details on how to edit the configuration file in a text editor, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

### Example

This configuration file installs proofing tools for German and Italian using Monthly Enterprise Channel on a device with Office already installed. If the original installation of Office was from a local source, make sure to download the proofing tools to that source. If the tools aren't found at the local source, the AllowCdnFallback setting installs the tools directly from the Office CDN. 

```xml
<Configuration>
  <Add Channel="MonthlyEnterprise" AllowCdnFallback="TRUE">
    <Product ID="ProofingTools">
      <Language ID="de-de" />
      <Language ID="it-it" />
    </Product>
  </Add>
</Configuration>
```

## Install the same languages as the operating system

When deploying Office, you can automatically install the same languages that are in use by the operating system. To do so, include the steps below when deploying Office with your standard process and tools: 

1. When creating the configuration file in the [Office Customization Tool](https://config.office.com/), select **Match Operating System** as the primary language. 
2. If you use a local source, we recommend that you use the Office CDN as a backup source for language packs. To do so, select **Fallback to the CDN for missing languages** in the Installation section. 

When Match Operating System is used, the base language of the operating system and all active display languages for user profiles on the device are installed. Match Operating System can be used in combination with a fixed list of languages. 

## Deploy Visio or Project in the same languages as an existing version of Microsoft 365 Apps

You can automatically deploy Visio and Project in the languages that are in use by an existing version of Microsoft 365 Apps. To do so, use the same process and tools you used to deploy Office, such as Configuration Manager or the Office Deployment Tool. 

> [!NOTE]
> You cannot use the Office Customization Tool to create the configuration file, because this feature is not yet available in that tool. Instead, you must edit the configuration file in a text editor. 

If you're adding to an existing deployment, the ODT will automatically use the same architecture (32 bit or 64 bit) and source location (Office CDN or local source) as the existing installation of Microsoft 365 Apps. Because of this, you do not need to specify these values when creating the configuration file, which means you can use a single configuration file to deploy to multiple deployment groups.

1. When creating the configuration file in a text editor, use "MatchInstalled" as the Language ID, as shown in the example below.
2. Optionally, you can include the TargetProduct as an attribute of the Language element, as shown in the example below. By doing so, you can specify which existing Office product should be used to determine which languages to install. For example, if you set TargetProduct = "O365ProPlusRetail", the Office products you're deploying will be installed in the same languages as Microsoft 365 Apps for enterprise, if that product is installed on the client computer. If you want to match all installed languages, you can specify TargetProduct="All".
3. If you deploy languages from a local source, you must download any possible matched languages to that source first. For more details, see [Download the installation files for Microsoft 365 Apps](overview-office-deployment-tool.md#download-the-installation-files-for-microsoft-365-apps). You can not use the /download switch for ODT on a configuration file which contains the MatchInstalled keyword. You have to use a separate configuration file for this. 

You can also use MatchInstalled as the Language ID when adding Office apps to or removing them from an existing installation of Office. 

For details on how to edit the configuration file in a text editor, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

### Example
```xml
<Configuration>
 <Add Channel="MonthlyEnterprise" AllowCdnFallback="True"> 
  <Product ID="VisioProRetail">
     <Language ID="MatchInstalled" TargetProduct="O365ProPlusRetail" />
  </Product>
 </Add>  
</Configuration>
```

Learn more about [how to use MatchInstalled in second-install scenarios](fieldnotes/build-dynamic-lean-universal-packages.md).

## Install the same languages as a previous MSI installation

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources — for example, language packs, language interface packs, or proofing tools — installed when you install Microsoft 365 Apps. For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).

## Remove languages packs or proofing tools

To remove a language pack or proofing tool, you can use the **Remove** element, just as you would for a product. For product ID, specify **LanguagePack** or **ProofingTools**. In the example, the German language pack is removed across all installed products:

### Example
```xml
<Configuration>
  <Remove>
    <Product ID="LanguagePack">
      <Language ID="de-de" />
    </Product>
  </Remove>
</Configuration>
```

## Use the Office CDN as a backup source for language packs

If you deploy Office from a local source on your network, you can use the Office CDN as a backup source for language packs that might not be available at that local source. To do so, use the same process and tools you used to deploy Office, such as Configuration Manager or the Office Deployment Tool. 

When creating the configuration file in the [Office Customization Tool](https://config.office.com/), select **Fallback to the CDN for missing languages** in the installation settings of the Office Customization Tool. 

When installing languages, the ODT looks first for source files in the source path location. If the language pack isn't available at that location **and** the Fallback setting is selected, then the ODT will use source files from the Office CDN.

## Conserve network bandwidth when adding language packs

When you use the Office Deployment Tool (ODT) to download the installation files for Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

## Languages, culture codes, and companion proofing languages

Language-neutral product resources for Microsoft 365 Apps are packaged into a single file that contains all the neutral resources. Language-specific resources are packaged into language-specific files such as en-us for English (United States) resources. 

The following table lists all the supported languages for Microsoft 365 Apps, along with culture codes and companion proofing languages.

| **Language**                             | **Culture (ll-CC)** | **Companion proofing languages**                                          |
|------------------------------------------|---------------------|---------------------------------------------------------------------------|
| Afrikaans                                | af-ZA               |                                                                           |
| Albanian                                 | sq-AL               |                                                                           |
| Arabic                                   | ar-SA               | Arabic, English, French                                                   |
| Armenian                                 | hy-AM               |                                                                           |
| Assamese                                 | as-IN               |                                                                           |
| Azerbaijani (Latin)                      | az-Latn-AZ          |                                                                           |
| Bangla (Bangladesh)                      | bn-BD               |                                                                           |
| Bangla (Bengali India)                   | bn-IN               |                                                                           |
| Basque (Basque)                          | eu-ES               |                                                                           |
| Bosnian (Latin)                          | bs-latn-BA          |                                                                           |
| Bulgarian                                | bg-BG               | Bulgarian, English, German, Russian                                       |
| Catalan                                  | ca-ES               |                                                                           |
| Catalan (Valencia)                       | ca-ES-valencia      |                                                                           |
| Chinese (Simplified)                     | zh-CN               | Chinese (Simplified), English                                             |
| Chinese (Traditional)                    | zh-TW               | Chinese (Traditional), English                                            |
| Croatian                                 | hr-HR               | Croatian, English, German, Serbian, Italian                               |
| Czech                                    | cs-CZ               | Czech, English, German, Slovak                                            |
| Danish                                   | da-DK               | Danish, English, German, Swedish                                          |
| Dutch                                    | nl-NL               | Dutch, English, French, German                                            |
| English                                  | en-US               | English, French, Spanish                                                  |
| Estonian                                 | et-EE               | Estonian, English, German, Russian, Finnish,                              |
| Finnish                                  | fi-FI               | Finnish, English, Swedish, German, Russian                                |
| French                                   | fr-FR               | French, English, German, Dutch, Arabic, Spanish                           |
| Galician                                 | gl-ES               |                                                                           |
| Georgian                                 | ka-GE               |                                                                           |
| German                                   | de-DE               | German, English, French, Italian                                          |
| Greek                                    | el-GR               | Greek, English, French, German                                            |
| Gujarati                                 | gu-IN               |                                                                           |
| Hausa                                    | ha-Latn-NG          |                                                                           |
| Hebrew                                   | he-IL               | Hebrew, English, French, Arabic, Russian                                  |
| Hindi                                    | hi-IN               | Hindi, English, Tamil, Telegu, Marathi, Kannada, Gujarati, Punjabi, Urdu |
| Hungarian                                | hu-HU               | Hungarian, English, German                                                |
| Icelandic                                | is-IS               |                                                                           |
| Igbo                                     | ig-NG               |                                                                           |
| Indonesian                               | id-ID               | Indonesian, English                                                       |
| Irish                                    | ga-IE               |                                                                           |
| isiXhosa                                 | xh-ZA               |                                                                           |
| isiZulu                                  | zu-ZA               |                                                                           |
| Italian                                  | it-IT               | Italian, English, French, German                                          |
| Japanese                                 | ja-JP               | Japanese, English                                                         |
| Kannada                                  | kn-IN               |                                                                           |
| Kazakh                                   | kk-KZ               | Kazakh, English, Russian                                                  |
| Kinyarwanda                              | rw-RW               |                                                                           |
| KiSwahili                                | sw-KE               |                                                                           |
| Konkani                                  | kok-IN              |                                                                           |
| Korean                                   | ko-KR               | Korean, English                                                           |
| Kyrgyz                                   | ky-KG               |                                                                           |
| Latvian                                  | lv-LV               | Latvian, English, German, Russian                                         |
| Lithuanian                               | lt-LT               | Lithuanian, English, German, Russian, Polish                              |
| Luxembourgish                            | lb-LU               |                                                                           |
| Macedonian (North Macedonia)            | mk-MK               |                                                                           |
| Malay (Latin)                            | ms-MY               | Malay, English, Chinese (Simplified)                                      |
| Malayalam                                | ml-IN               |                                                                           |
| Maltese                                  | mt-MT               |                                                                           |
| Maori                                    | mi-NZ               |                                                                           |
| Marathi                                  | mr-IN               |                                                                           |
| Nepali                                   | ne-NP               |                                                                           |
| Norwegian Bokmål                         | nb-NO               | Norwegian (Bk), English, German, Norwegian (Ny)                           |
| Norwegian Nynorsk                        | nn-NO               | Norwegian (Bk), English, German, Norwegian (Ny)                           |
| Odia                                     | or-IN               |                                                                           |
| Pashto                                   | ps-AF               |                                                                           |
| Persian (Farsi)                          | fa-IR               |                                                                           |
| Polish                                   | pl-PR               | Polish, English, German                                                   |
| Portuguese (Portugal)                    | pt-PT               | Portuguese, English, French, Spanish                                      |
| Portuguese (Brazil)                      | pt-BR               | Brazilian, English, Spanish                                               |
| Punjabi (Gurmukhi)                       | pa-IN               |                                                                           |
| Romanian                                 | ro-RO               | Romanian, English, French                                                 |
| Romansh                                  | rm-CH               |                                                                           |
| Russian                                  | ru-RU               | Russian, English, Ukrainian, German                                       |
| Scottish Gaelic                          | gd-GB               |                                                                           |
| Serbian (Cyrillic, Serbia)               | sr-cyrl-RS          |                                                                           |
| Serbian (Latin, Serbia)                  | sr-latn-RS          | Serbian (Latin), English, German, French, Croatian                        |
| Serbian (Cyrillic, Bosnia & Herzegovina) | sr-cyrl-BA          |                                                                           |
| Sesotho sa Leboa                         | nso-ZA              |                                                                           |
| Setswana                                 | tn-ZA               |                                                                           |
| Sinhala                                  | si-LK               |                                                                           |
| Slovak                                   | sk-SK               | Slovak, English, Czech, Hungarian, German                                 |
| Slovenian                                | sl-SI               | Slovenian, English, German, Italian, Croatian                             |
| Spanish                                  | es-ES               | Spanish, English, French, Basque (Basque), Catalan, Galician, Brazilian   |
| Swedish                                  | sv-SE               | Swedish, English, Finnish, German                                         |
| Tamil                                    | ta-IN               |                                                                           |
| Tatar (Cyrillic)                         | tt-RU               |                                                                           |
| Telugu                                   | te-IN               |                                                                           |
| Thai                                     | th-TH               | Thai, English, French                                                     |
| Turkish                                  | tr-TR               | Turkish, English, French, German                                          |
| Ukrainian                                | uk-UA               | Ukrainian, English, Russian, German                                       |
| Urdu                                     | ur-PK               |                                                                           |
| Uzbek (Latin)                            | uz-Latn-UZ          |                                                                           |
| Vietnamese                               | vi-VN               | Vietnamese, English, French                                               |
| Welsh                                    | cy-GB               |                                                                           |
| Wolof                                    | wo-SN               |                                                                           |
| Yoruba                                   | yo-NG               |

## Related topics

- [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md)
- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)
- [Plan your enterprise deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md)
