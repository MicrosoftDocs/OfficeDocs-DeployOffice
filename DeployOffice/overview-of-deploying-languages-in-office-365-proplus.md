---
title: "Overview of deploying languages in Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 7/19/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- DeployProPlus
- DeployProPlus_SOConly
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: 6467979c-3430-45c2-a28f-f9ac995731a5

---

# Overview of deploying languages in Office 365 ProPlus
If you purchased an Office 365 subscription, you can use it to install Office in multiple languages. You do not have to buy a Language Pack. Resources for Click-to-Run for Office 365 products are packaged similarly to the way standard Office 2016 Windows Installer (MSI) resources are organized. Language-neutral product resources are packaged into a single file that contains all the neutral resources. Language-specific resources are packaged into language-specific files such as en-us for English (United States) resources.

## Install languages from the Office 365 portal
If your organization allows it, users can install Office 365 ProPlus languages directly from the [Office 365 portal](https://go.microsoft.com/fwlink/p/?LinkID=212232). When users install Office from the **software** page, they select a language from the **Language** drop-down box. If an user need an additional language, they can just re-run the process for each required language. The setup will add the selected language to the user's device.

## Install a fixed set of languages in a managed environment
In managed enterprise environments, end-users may not have permission to install software from the Office 365 portal. If you are configuring an on-premises deployment of Office 365 Click-to-Run applications for users in your organization, you can use the Office Deployment Tool *(suggestion: Add Link to ODT docs page)* to install Click-to-Run in multiple languages. 

The language elements *(suggestion: add link to language section in the ODT reference)* that you specify in the configuration file for the Office Deployment Tool determine which languages will be installed. Administrators must specify the languages they want to install. The first language determines the Shell UI language. The Shell UI is the language that is used to display shortcuts, right-click context menus, and tooltips.

If you decide that you want to change the Shell UI language after an initial installation, you have to uninstall Click-to-Run and reinstall it. Add the language that you want to set for the Shell UI as the first language in the custom Configuration.xml file.

Additional language tools that you can install for Click-to-Run products include the following:

- Language Interface Packs: Translated User Interface that installs over a copy of a Click-to-Run installation. You can download and install a Language Interface Pack for free. After you install it, you can use Microsoft Excel, OneNote, Microsoft Outlook, PowerPoint, and Word features in a different language. You can use the **Office Language Preferences** dialog after installation to change a language and see a translated user interface. For information about how to change the editing, display or Help language for Office applications, see [Enable the use of other languages in your Office programs](https://go.microsoft.com/fwlink/p/?LinkId=281959). To set Office 2016 language options on a computer that is running Windows 10, type "Office 2016" at the **Start** screen, and select **Office 2016 Language Preferences** to open the **Microsoft Office 2016 Language Preferences** dialog box.
    
- Proofing Tools: Localized language versions of Office include proofing tools for a set of companion langauges. For more details and links to proofing tool downloads for each language, see [Proofing Tools for Office 365 ProPlus](proofing-tools-for-office-365-proplus.md).
    
- ScreenTip Language: Translations that show the text of display elements such as buttons, menus, and dialog boxes in another language. You can download [Microsoft Office ScreenTip Language 2013](https://go.microsoft.com/fwlink/p/?LinkId=281983) from the Microsoft Download Center. ScreenTip Language installs over a Click-to-Run installation.
    
For information about how to use the Configuration.xml file to specify language installation options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md). 

## Install an adaptive set of languages in a managed environment

When deploying Office with the Office Deployment Tool (ODT), you can automatically install the same languages as the operating system and any user on the client device uses. To do so, use "MatchOS" as the Language ID in the configuration file for the ODT, as shown in the example. 

When "MatchOS" is specified, the installation will add the base language of the operating system as well as any actived display language of all user profiles on the device to the list of to-be-installed languages. MatchOS can be used in combination with a fixed list of languages.

When using MatchOS, there are times when the ODT cannot install the operating system languages, either because Office doesn't support that language or because the ODT cannot find the correct language pack in the local source files. To help address this issue, we recommend that you specify a backup language and and a backup source location for the language pack:

- To specify a fallback language, include the "Fallback" attribute in the configuration file, as shown in the example. The fallback language will be installed if one of the detected languages isn't supported by Office. If you use MatchOS and do not include a fallback language, the ODT will use en-us as a default fallback. 

- To specify the Office CDN as a backup source for language packs, include the "AllowCDNFallBack" attribute in the configuration file, as shown in the example. When installing languages, the ODT looks first for source files in the location specified in the SourcePath attribute. If the language pack isn't available at that location, the AllowCDNFallBack setting allows the ODT to use source files from the Office CDN. Otherwise the install will abort due to missing source files.

For details on how to edit the configuration file, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

> [!NOTE]
> MatchOS installs all the operating system languages that are installed and being used by at least one user on the client device.  

### Example
```
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" 
     AllowCDNFallback="True">
  <Product ID="O365ProPlusRetail">
     <Language ID="MatchOS" Fallback="en-us" />
  </Product>
</Add>  
```


## Related topics

- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
- [Proofing Tools for Office 365 ProPlus](proofing-tools-for-office-365-proplus.md)

