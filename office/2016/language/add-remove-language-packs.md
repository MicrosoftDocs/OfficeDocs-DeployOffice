---
title: "Add or remove language packs after deployment of Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Identify installed languages, and add or remove Office 2016 language packs by modifying an existing installation or by deploying them as separate products."
ms.date: 04/19/2024
---

# Add or remove language packs after deployment of Office 2016

 **Summary:** Identify installed languages, and add or remove Office 2016 language packs by modifying an existing installation or by deploying them as separate products. 
  
  
You can add or remove language packs for an existing Office 2016 installation. This article describes the two methods that you can use to complete these tasks and how to view a list of the languages that are installed.
  
> [!IMPORTANT]
> This article describes methods of deploying and managing language packs for versions of Office 2016 that use the Windows Installer (MSI) installation technology, which are available for enterprises through volume licensing. If you have an Office subscription and you're deploying Microsoft 365 Apps, which uses the Click-to-Run installation technology, see [Overview of deploying languages for Microsoft 365 Apps](../../deploy/overview-office-deployment-tool.md). 
  

    
<a name="BKMK_Overview"> </a>
## Overview

Office 2016 language packs enable Office applications to display menus, dialog boxes, Help articles, and other text in the user interface in multiple languages. Although the most frequently deployed languages for Office 2016 are released at the same time as the product is released, many other Office 2016 Language Packs are released over time. The Office 2016 Multi-Language Pack, which includes all available language packs, isn't released until after all the individual language packs are released. However, if you upgrade your multilingual organization to Office 2016 before all the language packs are released, you can always add or remove other languages at any time. The Office Multilanguage Pack and proofing tools for Office 2016 are available through Microsoft Volume Licensing programs. For more information, see [Download language packs, language interface packs, and proofing tools for volume license versions of Office](customize-language-setup-settings.md#DownloadLIPandProofTools).
  
There are two methods that you can use to add languages after you deploy Office 2016:
  
- **Modify an existing installation.** When you use this recommended method, a language is treated as another feature to add to a deployment of Office 2016. This method involves combining the language resources with the source of the original installed Office 2016 product, changing the Config.xml file to add the appropriate languages, and rerunning Setup.exe from the Office 2016 installation source. This method installs only the necessary language parts for the products that are installed on the user's computer. For example, if you add Japanese to a basic installation of Office 2016 that doesn't include Visio 2016, the Visio 2016 resources for Japanese aren't installed. 
    
    However, if the computer has both Office 2016 and Visio 2016 installed on it, you must add the Japanese resources for each product through two separate operations because there are two separate installation sources, one for Office 2016, and the other for Visio 2016.
    
- **Deploy language packs as separate products.** This method involves running the language pack's setup file so that the full Language Pack is installed on the computer rather than modifying an existing installation of Office 2016. If you need to add languages to Office 2016 after its initial deployment, deploy language packs. This approach is useful when you're unsure about which Office 2016 products users installed on their computers. To use this method, you must have at least one Office 2016 product installed on the computer. 
    
> [!NOTE]
> Language-specific elements for Project 2016 and Visio 2016 are installed separately. You must rerun the Language Pack setup for these products. For more information, see [Deploy language packs](add-remove-language-packs.md#deploylangpack) later in this article. 
  
<a name="BKMK_Before"> </a>
## Before you begin

Identify the languages to be used at the start of your deployment. If you modify users' configurations after the initial deployment, you might include other languages in your customizations. Before modifying user configurations, first copy all the Office 2016 Language Packs you wish to deploy. Place them at the network installation point where the Office product files are stored. For example, \\\server\share\Office2016. A static list of the products that are contained in the installation source is built only during the initial creation of a customization .msp file. If you later add more languages to the installation source, the existing .msp file isn't updated to reflect this change. Addressing this issue involves the following steps: 
  
1. Create a new customization file by using the Office Customization Tool (OCT).
    
2. Import your existing customization .msp file by using the File \| Import command in the OCT.
    
3. Make any extra customizations that you want and then save the .msp file.
    
4. After you update the installation source with other languages, deploy the new .msp file to users.
    
If you don't create and deploy a new .msp file, unexpected behavior might occur. This behavior happens because changes made to an existing customization .msp file don't apply to newly added languages. If you don't create a new .msp file and import the existing .msp file into that file, your deployment could test correctly in your lab. But users might not see the new language in their Office 2016 applications, or they might see only a subset of the language features. For more information, see [To import a customization .msp file to add languages to an existing installation](/previous-versions/office/office-2010/ee681791(v=office.14)#BKMK_ImportMSO_AddLanguage) and [Change users' configurations after installing Office 2013](/previous-versions/office/office-2013-resource-kit/cc179141(v=office.15)). (Although these articles are for earlier versions of Office, the information also applies to Office 2016.)
  
For information about how to create a network installation point with multiple languages, see [Customize language setup and settings for Office 2016](customize-language-setup-settings.md).
  
<a name="BKMK_IdentifyInstalledLanguages"> </a>
## Identify installed languages

During the initial installation of Office 2016 or when installing a separate language pack, you can find a list of installed languages. This list is available at the following registry key and shows the LCID for each enabled language:
  
 **HKCU\Software\Microsoft\Office\16.0\Common\LanguageResources\EnabledLanguages**
  
You can view the user interface (UI) language and fallback languages at the following registry key:
  
 **HKCU\Software\Microsoft\Office\16.0\Common\LanguageResources**
  
Although all applications in the Office 2016 use a shared set of registry data to determine their UI language, they don't necessarily all appear in the same UI language. Applications in the Office 2016 usually appear with the UI language that is indicated in the **UILanguage** value of this registry key. However, there are circumstances where the usual UI language setting might not be applied. For example, some deployments might have Word 2016 and Excel 2016 installed in French, but another Office application that is installed in a different language. In this case, the other application examines the **UIFallback** list in this registry key, and uses the first language that works with its installed configuration. 
  
### To identify installed languages

1. Open the registry.
    
2. Expand the registry key **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\LanguageResources\EnabledLanguages**. 
    
3. The LCID for the language is displayed. To identify the language, see [Language identifiers](language-identifiers-optionstate-id-values.md#BKMK_LanguageIdentifiers).
    
4. To view the UI language, view the following registry key values and refer to [Language identifiers](language-identifiers-optionstate-id-values.md#BKMK_LanguageIdentifiers).
    
   - **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\LanguageResources\HelpLanguage**
    
   - **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\LanguageResources\UILanguage**
    
5. To view the fallback languages, view the registry key value for **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\LanguageResources\UIFallback**. To identify the language, see [Language identifiers and OptionState ID values in Office 2016](language-identifiers-optionstate-id-values.md).
    
<a name="BKMK_ModifyExisting"> </a>
## Modify an existing installation

The recommended method for adding languages to an existing installation of Office 2016 is to run setup again and modify the existing Office installation. Because you're only modifying the original installation, no new entry appears in **Add or Remove Programs** in **Control Panel**.
  
You can't replace the language of the shell user interface (Shell UI) that was installed during the initial installation. The Shell UI includes core elements of Office that register with the operating system, such as file name extensions, Tool Tips, and right-click menu items.
  
When you update a multilanguage installation, you can specify that the new language matches the user locale that is set on the local computer. For example, if your organization includes both English-speaking and Russian-speaking users, you might first deploy English to everyone. Later, when the Russian language pack becomes available, you can add the following line to Config.xml:
  
```xml
<AddLanguage Id="match" />
```

In this case, setup installs Russian language elements on any computer that has the user locale set to Russian. Users who have an English user locale aren't affected.
  
### To deploy other languages after Office is installed

1. Copy the files and folders in the new language packs from the source media to the original network installation point. When you're prompted to overwrite setup files, choose **No**.
    
    Each language pack includes language-specific elements for every product in Office 2016. However, setup installs language-specific elements only for the Office product that you're updating.
    
2. In the core product folder for the product that you're updating, locate the Config.xml file. 
    
    For example, if you're adding languages to an installation of Office Professional Plus 2016, find the Config.xml file in the ProPlus.WW folder.
    
3. Open Config.xml in a text editor, such as Notepad. 
    
4. Find the \<AddLanguage\> element. Uncomment the line by deleting the opening  \<\!-- and closing  --> tags. 
    
5. Set the value of the  ID attribute to the language tag that corresponds to the language that you want to install. You can specify more than one language by including more \<AddLanguage\> elements and attributes. 
    
    For example, to add the Russian language pack, the line should resemble the following example: 
    
   ```xml
   <AddLanguage Id="ru-ru" />
   ```

6. If you add more than one language in Config.xml, you must specify one language as the language for the Shell UI. For example:
    
   ```xml
   <AddLanguage Id="ru-ru" ShellTransform="yes" />
   <AddLanguage Id="en-us" />
   ```

    You must specify a ShellUI language, even though setup doesn't change the ShellUI language that was set for the initial installation.
    
7. Save the Config.xml file. Run Setup.exe and specify the path of your modified Config.xml file. 
    
    You must use a full qualified path. For example: **\\\server\share\Office2016\setup.exe /config \\\server\share\Office2016\ProPlus.WW\Config.xml**
    
    where **Office2016** is the root of the network installation point. 
    
    Because set up also recognizes language packs as separate products, make sure that you specify the Config.xml file for the Office product that you're updating, and not the language pack.
    
To deploy these languages for new Office 2016 installations, see [Specify which languages to install](customize-language-setup-settings.md#BKMK_SpecifyLanguagesToInstall) and import existing customization .msp files into a new customization .msp file. A static list of the products contained in the installation source is built only during the initial creation of a customization file. If you later add more languages to the installation source, the existing customization file isn't updated to reflect this change. For more information, see [To import a customization .msp file to add languages to an existing installation](/previous-versions/office/office-2010/ee681791(v=office.14)#BKMK_ImportMSO_AddLanguage). (Although this article is for an earlier version of Office, the information also applies to Office 2016.) 
  
## Deploy language packs
<a name="deploylangpack"> </a>

If you deployed multiple Office 2016 products in your organization and you must add more language support, you can deploy language packs as separate products. In this case, setup installs language-specific elements for every product in Office 2016. No matter which products users install, they can access other language versions.
  
For this deployment method to work, there must be at least one Office 2016 product installed on the computer that you're deploying to.
  
When you deploy language packs separately, you must consider the disk space that is required on users' computers. Language pack requirements range from 800 MB to 1.5 GB of hard disk space that is needed.
  
Language-specific elements for Project 2016 and Visio 2016 are installed separately. In each language pack, the core product folder for Project 2016 is PMUI._ll_-_cc_. The core product folder for Visio 2016 is VisMUI._ll_-_cc_.
  
You must follow these steps for each language that you want to install.
  
### To deploy language packs

1. Copy all files and folders in the new language pack from the source media to a location on the network. If you're using an Office 2016 Multi-Language Pack, you can copy just the files and folders for the languages that you want to install. When you're prompted to overwrite setup files, choose **No**.
    
2. In the core product folder for the language pack that you're installing, locate the Config.xml file.
    
    For example, if you're installing the Russian language pack, find the Config.xml file in the OMUI.ru-ru folder.
    
3. Start by running the language pack setup at the network installation point's root for either the Office 2016 Multi-Language Pack or Office 2016 Language Pack. Then, on the command line, specify the path to the Config.xml file. For example:
    
    **\\\server\share\Office2016\LP\Setup.exe /Config** **\\\server\share\Office2016\LP\RU\OMUI.ru-ru\Config.xml**
    
    where **Office2016\LP** is the root of the network installation point for the language packs and **RU** is the language folder name. 
    
To deploy these languages for new Office 2016 installations, see [Specify which languages to install](customize-language-setup-settings.md#BKMK_SpecifyLanguagesToInstall) and import existing customization .msp files into a new customization .msp file. A static list of the products contained in the installation source is built only during the initial creation of a customization file. If you later add more languages to the installation source, the existing customization file isn't updated to reflect this change. For more information, see [To import a customization .msp file to add languages to an existing installation](/previous-versions/office/office-2010/ee681791(v=office.14)#BKMK_ImportMSO_AddLanguage). (Although this article is for an earlier version of Office, the information also applies to Office 2016.)
  
<a name="BKMK_RemoveLanguagePacks"> </a>
## Remove language packs


If the Office 2016 Language Packs were deployed as separate products, they can be removed by using Windows Add or Remove Programs.
  
If the Office 2016 Language Packs were deployed with Office 2016 and not as separate products, the procedure to remove them resembles the deployment of the Language Packs. Instead of using the \<AddLanguage\> tag, use the \<RemoveLanguage\> tag. 
  
You must follow these steps for each language that you want to remove.
  
### To remove language packs

1. If the language was deployed with the Office product (not as a separate product), locate the Config.xml file in the core product folder for the product that you're updating.
    
    For example, if you're removing languages from an installation of Office Professional Plus 2016, find the Config.xml file in the ProPlus.WW folder.
    
2. Open Config.xml in a text editor, such as Notepad.
    
3. Find the \<Display\> element. Uncomment the line by deleting the opening  \<\!-- and closing  --> tags. 
    
4. Set the value of the Level to **basic** or **none**, CompletionNotice to **yes**, SuppressModal to **yes**, and AcceptEula to **yes**.
    
    The line should resemble the following example: 
    
   ```xml
   <Display Level="basic" CompletionNotice="yes" SuppressModal="yes" AcceptEula="yes" />
   ```

5. Find the \<AddLanguage\> element. If it is in the file, comment out the line by adding opening  \<\!-- and closing  --> tags around the element. 
    
    The line should resemble the following example:
    
   ```xml
   <!-- <AddLanguage Id="ru-ru" /> -->
   ```

6. Add the \<RemoveLanguage\> element. 
    
7. Set the value of the ID attribute to the language tag that corresponds to the language that you want to remove. 
    
    For example, to remove the Russian language pack, the line should resemble the following example: 
    
   ```xml
   <RemoveLanguage Id="ru-ru" />
   ```

8. Save the Config.xml file. 
    
9. If you edited the Config.xml file in the core product folder, run Setup.exe and specify the path of your modified Config.xml file.
    
    You must use a fully qualified path. For example: 
    
    **\\\server\share\Office2016\Setup.exe /Config** **\\\server\share\Office2016\ProPlus.WW\Config.xml**
    
    where **Office2016** is the root of the network installation point. 
    
    **\\\server\share\Office2016\LP\Setup.exe /Config** **\\\server\share\Office2016\LP\RU\OMUI.ru-ru\Config.xml**
    
    where **Office2016\LP** is the root of the network installation point for the language packs and **RU** is the language folder name. 
    
    You must complete the previous steps for each language that you want to remove.
    
## Related articles
[Language identifiers and OptionState ID values in Office 2016](language-identifiers-optionstate-id-values.md)
  
[Customize language setup and settings for Office 2016](customize-language-setup-settings.md)
  
[Plan for multilanguage deployment of Office 2016](plan-multilanguage-deployment.md)