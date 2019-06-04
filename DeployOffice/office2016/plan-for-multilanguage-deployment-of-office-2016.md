---
title: "Plan for multilanguage deployment of Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 11/26/2015
audience: ITPro
ms.topic: get-started-article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ms.assetid: f458a0cb-a3a5-4d4a-9f98-a4a81a17ee3a
description: "Plan for multilanguage setup, and customization and proofing tools for Office 2016."
---

# Plan for multilanguage deployment of Office 2016

 **Summary:** Plan for multilanguage setup, and customization and proofing tools for Office 2016. 
  
  
Support for multiple languages and languages other than the default are provided through language accessory packs (LAPs) and language interface packs (LIPs) that you install. Language accessory packs (LAPs) let you see ribbon or menu items, commands, Help, and proofing tools like the spelling checker, grammar checker, and thesaurus in a translated version of Office for all Office applications. Language interface packs (LIPs) only change the language for the ribbon and commands for some Office applications.

To deploy Office 2016 in multiple languages, you must plan carefully. This article discusses the planning considerations for setup and the customizations that you can make when you install language packs or proofing tools.
  
> [!IMPORTANT]
> This article describes methods of deploying and managing language packs for versions of Office 2016 that use the Windows Installer (MSI) installation technology, which are available for enterprises through volume licensing. If you have an Office subscription and you're deploying Office 365 ProPlus, which uses the Click-to-Run installation technology, see [Overview of deploying languages in Office 365 ProPlus](../overview-of-deploying-languages-in-office-365-proplus.md). 
  
  
<a name="BKMK_PlanSetup"> </a>
## Plan setup of Office 2016 multilanguage deployment

The language-neutral design of Office 2016 helps simplify the deployment of Office products in multiple languages. Instead of creating a series of installations, you enable setup to coordinate a single installation of multiple language versions.
  
All language-specific components for a particular language are contained in an Office 2016 Language Pack. Each Office 2016 Language Pack includes language-specific folders for all Office 2016 products that are available in that language. Folders are identified by a language tag that is appended to the folder name. For a complete list of language tags, see [Language identifiers and OptionState Id values in Office 2016](language-identifiers-and-optionstate-id-values-in-office-2016.md).
  
 You install all the Office 2016 Language Packs that you want at the same time by copying them to a network installation point that contains at least one complete Office 2016 product. By default, setup automatically installs the language version that matches the Windows user locale that is set on each user's computer. Or, you can override this default behavior and manage the distribution of multiple language versions manually. For example, you can perform any of the following tasks: 
  
- Install more than one language on a single computer
    
- Specify which languages to install on users' computers, regardless of the language of the operating system that is specified by the user locale
    
- Specify custom settings once and then apply them to all language versions that you deploy in your organization
    
- Deploy different languages to different groups of users
    
- Deploy the Microsoft Office 2016 proofing tools for additional languages
    
Each Office 2016 Language Pack contains the proofing tools for one or more additional languages. For example, the Office 2016 Language Pack - Danish contains the proofing tools for English and German, in addition to Danish. All Office 2016 Language Packs contain the proofing tools for English. For more information about proofing tools, see [Plan for Office proofing tools](plan-for-multilanguage-deployment-of-office-2016.md#BKMK_PlanProofingTools). To determine which companion proofing languages are included in an Office 2016 Language Pack, see [Companion proofing languages for Office 2016](companion-proofing-languages-for-office-2016.md). 
  
Before setup installs a language version of an Office 2016 product, setup determines whether the user has the required operating system support for that language. Setup stops the installation if there is no support. For example, if a user has not enabled support for East Asian languages, setup does not install the Japanese version of Office 2016.
  
Determine the languages that you want before you begin your deployment. There are special steps that you must take to include additional languages if you have to change users' configurations after the initial deployment. For more information, see [Add or remove language packs after deployment of Office 2016](add-or-remove-language-packs-after-deployment-of-office-2016.md). 
  
<a name="BKMK_Overview"> </a>
### Understanding the setup logic for Shell UI language

When you deploy the Office 2016 from a network installation point that contains more than one language version, setup must determine which language to use for the setup user interface. By default, setup uses that same language for the Office 2016 installation language and for the shell user interface (Shell UI). The Shell UI includes core elements of Office 2016 that register with the operating system, such as file name extensions, Tool Tips, and right-click menu items.
  
Setup always installs Office 2016 in the language of the Shell UI, in addition to any other installation languages. For example, if the Shell UI is set to French, the user can select additional installation languages on the **Languages** tab. However, the user cannot remove French. You specify the language for the Shell UI by modifying a configuration file, Config.xml. 
  
If you want to install only one language version of Office 2016 on each client computer and if you do not specify any additional languages in the configuration file, setup uses the following logic to determine which language to use:
  
- Setup matches the language of the user locale.
    
- If there is no match, setup looks for a close match. For example, if the user locale is set to English (Canada), setup installs Office 2016 in English (U.S).
    
- If there is no close match, setup looks for a language in the following subkey in the Windows registry:
    
    **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\LanguageResources**
    
    If the **InstallLanguage** entry has not been added to the **LanguageResources** subkey and set to a particular language (LCID), setup either prompts the user to select a language during an interactive installation, or it stops a silent installation. 
    
If you are installing multiple languages, the language of the setup user interface follows the logic described previously. However, the languages that are installed on the computer and the language of the Shell UI are determined by the entries you specify in Config.xml. 
  
For specific steps on how to customize setup for different scenarios, including how to modify Config.xml, see applicable sections in [Customize language setup and settings for Office 2016](customize-language-setup-and-settings-for-office-2016.md):
  
- [Deploy a default language version of Office](customize-language-setup-and-settings-for-office-2016.md#BKMK_DeployDefaultLanguageVersionOfOffice)
    
- [Specify which languages to install](customize-language-setup-and-settings-for-office-2016.md#BKMK_SpecifyLanguagesToInstall)
    
- [Deploy different languages to different groups of users](customize-language-setup-and-settings-for-office-2016.md#BKMK_DeployDifferentLanguages)
    
<a name="BKMK_PlanCustomizations"> </a>
## Plan language customizations for Office

When a user starts an Office 2016 application for the first time, setup applies default settings that match the language that is installed on the computer and the language that is specified by the Windows user locale setting.
  
Four main language settings affect the way users work with Office 2016:
  
- **Primary editing language** When more than one language version of Office 2016 is installed on the computer, this setting determines the language in which users work with Office applications and documents. 
    
- **Enabled editing languages** Users can specify more than one language for editing Office 2016 documents. Depending on the languages selected, this setting might require the user to install additional proofing tools. 
    
- **User interface language** This setting determines the language in which the user interface is displayed. 
    
- **Help language** This setting determines the language in which users view Help topics. 
    
You can configure these language settings for users in advance. If you specify custom language settings when you install Office, by applying a setup customization file (.msp file) or by setting policies, Office 2016 does not overwrite your settings with the default settings when users start the applications for the first time.
  
### Customizing language settings for Office

You configure language settings by using one of the following methods:
  
- **Group Policy** Group Policy settings enforce default language settings. Users in your organization cannot permanently change settings that are managed by Group Policy. The settings are reapplied every time that the user logs on. 
    
- **Office Customization Tool (OCT)** You use the OCT to create a setup customization file (.msp file) that setup applies during the installation. Settings specified in the OCT are the default settings. Users can change the settings after the installation. 
    
- **Language Settings tool** If you do not enforce language settings by policy, users who work in Office 2016 applications can use the Language Settings tool to change their language settings. 
    
For specific steps on how to use these tools to customize Office 2016 for multiple language deployments, see [Customize language settings](customize-language-setup-and-settings-for-office-2016.md#BKMK_CustomizeLanguageSettings).
  
You can also configure language-specific settings, such as number format, that are related to user locale. For more information, see [Customize language-specific settings that are related to user locale](customize-language-setup-and-settings-for-office-2016.md#BKMK_LangatUserLocale).
  
<a name="BKMK_PlanProofingTools"> </a>
## Plan for Office proofing tools

Proofing tools let users edit documents in 52 languages. Depending on the language, these editing tools might include spelling and grammar checkers, thesauruses, and hyphenators. Proofing tools might also include language-specific editing features such as Language AutoDetect, AutoSummarize, and Intelligent AutoCorrect.
  
The Proofing Tools 2016 ISO provides a single resource from which you can install any of the proofing tools. You can install proofing tools on a local computer or deploy tools to a group of users. You can also customize and install the tools for one user or all users in your organization.
  
<a name="methodprooftools"> </a>
### Determining the method to deploy proofing tools

You can deploy additional proofing tools for users who have to edit documents in languages other than those that are already installed on their computers. You can deploy additional proofing tools from either of these sources:
  
- **Office 2016 Language Pack** Use this option if users want both the user interface and the proofing tools for a specific language. Often, one language pack can provide all the proofing tool languages that you want. The companion proofing tool languages that are contained in a language pack mirror those of what's contained in language versions of Office 2016. You can also use the Office Multilanguage Pack which contains all of the Office language packs. 
    
    For a list of companion languages, see [Companion proofing languages for Office 2016](companion-proofing-languages-for-office-2016.md). If a language pack has all the proofing tool languages that you want, deploy a language pack by using the instructions that fit your scenario in [Customize language setup and settings for Office 2016](customize-language-setup-and-settings-for-office-2016.md).
    
- **Proofing Tools 2016** This product contains the proofing tools for all languages that are available with Office 2016. Use this option if you have to have proofing tools that are not included in the set of companion languages for any languages that are installed or included in an additional language pack that you could install. 
    
The hard disk space requirement to install proofing tools is 1 gigabyte (GB). However, the overall disk space depends on whether you deploy proofing tools from a language pack or from the proofing tools. As with most products in the Office 2016, the complete Proofing Tools 2016 package is cached to the local installation source (LIS). 
  
Proofing tools do not include bilingual dictionaries or word breakers. Those tools are part of the language version or language pack.
  
 Individual Office Language Packs, the Office Multilanguage Pack, and Proofing Tools 2016 are available through Microsoft Volume Licensing programs. 
  
For instructions on downloading language packs and proofing tools, see [Download language packs, language interface packs, and proofing tools for volume license versions of Office](customize-language-setup-and-settings-for-office-2016.md#DownloadLIPandProofTools).
  
<a name="precache"> </a>
### Precaching the local installation source for the Office 2016 proofing tools


When you deploy the Office 2016 proofing tools, setup creates a local installation source on the user's computer — a copy of the compressed source files for the Office 2016 proofing tools. After the files are copied to the user's computer, setup completes the installation from the local installation source. You can minimize the load on the network by deploying the local installation source separately, before you deploy the Office 2016 proofing tools. For information about how to cache the local installation source for the Office proofing tools, see [Precache the local installation source for Office 2010](https://technet.microsoft.com/library/cc179231.aspx). (Although this article is for an earlier version of Office, the information also applies to Office 2016.) Use the Setup.exe and Config.xml files from the ProofKit.WW folder from the Proofing Tools 2016 ISO. For instructions on downloading the Proofing Tools 2016 ISO, see [Download language packs, language interface packs, and proofing tools for volume license versions of Office](customize-language-setup-and-settings-for-office-2016.md#DownloadLIPandProofTools).
  
## Related topics
[Language identifiers and OptionState Id values in Office 2016](language-identifiers-and-optionstate-id-values-in-office-2016.md)
  
[Companion proofing languages for Office 2016](companion-proofing-languages-for-office-2016.md)
  
[Customize language setup and settings for Office 2016](customize-language-setup-and-settings-for-office-2016.md)
  
[Add or remove language packs after deployment of Office 2016](add-or-remove-language-packs-after-deployment-of-office-2016.md)

