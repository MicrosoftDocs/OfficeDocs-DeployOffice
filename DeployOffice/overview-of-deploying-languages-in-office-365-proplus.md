---
title: "Overview of deploying languages in Office 365 ProPlus"
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

# Overview of deploying languages in Office 365 ProPlus

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

This article covers the options for deploying languages for Microsoft 365 Apps, including what method to use, where to deploy languages from, how to deploy proofing tools, and best practices. We recommend using this article as part of [planning your Office deployment](plan-office-365-proplus.md). 

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
- When adding languages to an existing deployment of Office, you can [deploy just the language packs](#deploy-languages-to-existing-installations-of-office-365-proplus), rather than the full version of Office.
- If you upgrade from a Windows Installer (MSI) version of Office, you can [automatically install the same languages as a previous MSI installation](#install-the-same-languages-as-a-previous-msi-installation). 
- When building Office packages to deploy, [include all the language packs you plan to deploy in each package](plan-office-365-proplus.md#step-4---define-your-source-files). Creating separate packages for different language sets can make the Office deployment  difficult to manage.
- If you deploy a subscription version of the Project or Visio desktop app to a device that already has Office installed, you can [automatically deploy them in the same languages as the installed version of Office](#deploy-visio-or-project-in-the-same-languages-as-an-existing-version-of-office-365-proplus).
- If you use some languages only as editing tools, you can [deploy just the proofing tools](#deploy-proofing-tools) instead of full language packs to conserve network bandwidth.

This article also includes [the list of supported languages](#languages-culture-codes-and-companion-proofing-languages) and details on how Office [conserves network bandwidth when downloading language packs](#conserve-network-bandwidth-when-adding-language-packs) for deployment.

## Install languages from the Office 365 portal

If your organization allows it, users can install Microsoft 365 Apps languages directly from the Office 365 portal. When users install Office from the **Software** page, they select a language from the **Language** drop-down box. If a user needs an additional language, they can just re-run the process for each required language. The setup will add the selected language to the user's device.

## Deploy multiple languages as part of deploying Office

To deploy Microsoft 365 Apps in multiple languages, you just need to include the additional languages in the Office packages you create. To do so, select the languages you want to deploy in the Language section when creating the configuration file in the [Office Customization Tool](https://config.office.com/).

If you deploy Office from a local source on your network, you must download your languages to that source, in the same way that you download the Office package. For more details, see [Download the installation files for Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#download-the-installation-files-for-office-365-proplus). When deploying from a local source, we recommend that you [use the Office Content Delivery Network (CDN) as a backup source for language packs](#use-the-office-cdn-as-a-backup-source-for-language-packs). 

For more details on standard deployments, see [Plan your enterprise deployment of Office 365 ProPlus](plan-office-365-proplus.md).

The primary language selected in the Office Customization Tool determines the Shell UI language. The Shell UI is the language that is used to display shortcuts, right-click context menus, and tooltips. If you decide that you want to change the Shell UI language after an initial installation, you must uninstall Office and reinstall it. 

## Deploy languages to existing installations of Office 365 ProPlus

After deploying Microsoft 365 Apps, you can deploy additional languages for Office. To do so, use the same process and tools you used to deploy Office, such as Configuration Manager or the Office Deployment Tool. 

1. If you're deploying languages from a local source, make sure the languages are available at that source. For more details, see [Download the installation files for Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#download-the-installation-files-for-office-365-proplus). 
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
2. If you deploy languages from a local source, you must download the proofing tools to that source first. For more details, see [Download the installation files for Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#download-the-installation-files-for-office-365-proplus).  
3. If you use a local source, we recommend that you use the Office CDN as a backup source for language packs and proofing tools by including the AllowCdnFallback attribute in the configuration file, as shown in the example. 

For details on how to edit the configuration file in a text editor, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

### Example

This configuration file installs proofing tools for German and Italian using the Semi-Annual Channel on a device with Office already installed. If the original installation of Office was from a local source, make sure to download the proofing tools to that source. If the tools aren't found at the local source, the AllowCdnFallback setting installs the tools directly from the Office CDN. 

```xml
<Configuration>
  <Add Channel="Broad" AllowCdnFallback="TRUE">
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

## Deploy Visio or Project in the same languages as an existing version of Office 365 ProPlus

You can automatically deploy Visio and Project in the languages that are in use by an existing version of Microsoft 365 Apps. To do so, use the same process and tools you used to deploy Office, such as Configuration Manager or the Office Deployment Tool. 

> [!NOTE]
> You cannot use the Office Customization Tool to create the configuration file, because this feature is not yet available in that tool. Instead, you must edit the configuration file in a text editor. 

If you're adding to an existing deployment, the ODT will automatically use the same architecture (32 bit or 64 bit) and source location (Office CDN or local source) as the existing installation of Microsoft 365 Apps. Because of this, you do not need to specify these values when creating the configuration file, which means you can use a single configuration file to deploy to multiple deployment groups.

1. When creating the configuration file in a text editor, use "MatchInstalled" as the Language ID, as shown in the example below. 
2. In some cases, using Match Installed can change the Shell UI language. To avoid that, we recommend including "MatchOS" or a specific language as the first Language ID, as show in the example below.  
3. Optionally, you can include the TargetProduct as an attribute of the Language element, as shown in the example below. By doing so, you can specify which existing Office product should be used to determine which languages to install. For example, if you set TargetProduct = "O365ProPlusRetail", the Office products you're deploying will be installed in the same languages as Microsoft 365 Apps for enterprise, if that product is installed on the client computer. 
4. If you deploy languages from a local source, you must download any possible matched languages to that source first. For more details, see [Download the installation files for Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#download-the-installation-files-for-office-365-proplus).  

You can also use MatchInstalled as the Language ID when adding Office apps to or removing them from an existing installation of Office. 

For details on how to edit the configuration file in a text editor, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

### Example
```xml
<Configuration>
 <Add Channel="Broad" AllowCdnFallback="True"> 
  <Product ID="VisioProRetail">
     <Language ID="MatchOS" />
     <Language ID="MatchInstalled" TargetProduct="O365ProPlusRetail" />
  </Product>
 </Add>  
</Configuration>
```

## Install the same languages as a previous MSI installation

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources — for example, language packs, language interface packs, or proofing tools — installed when you install Microsoft 365 Apps. For more information, see [Remove existing MSI versions of Office when upgrading to Office 365 ProPlus](upgrade-from-msi-version.md).

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
| Hindi                                    | hi-in               | Hindi, English, Tamil, Telegu, Marathi, Kannada, Gujarati, Punjabi, Urdu |
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
| Macedonian (North Macedonia)            | mk-mk               |                                                                           |
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

- [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md)
- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
- [Plan your enterprise deployment of Office 365 ProPlus](plan-office-365-proplus.md)
