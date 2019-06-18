---
title: "Remove existing MSI versions of Office when upgrading to Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Provides information for IT Pros about how to use the RemoveMSI element when upgrading to Office 365 ProPlus from an MSI version of Office"
---

# Remove existing MSI versions of Office when upgrading to Office 365 ProPlus

We recommend that you uninstall any previous versions of Office before installing Office 365 ProPlus. To help you uninstall versions of Office that use Windows Installer (MSI) as the installation technology, you can use the Office Deployment Tool and specify the RemoveMSI element in your configuration.xml file.

There are several ways that you can use the RemoveMSI element when installing Office 365 ProPlus.

- Uninstall all Office products on the computer.
- Identify any existing language resources, like language packs, and install the same languages.
- Keep some Office products and uninstall all other Office products on the computer.

RemoveMSI can be used to uninstall 2010, 2013, or 2016 versions of Office, Visio, or Project that were installed using Windows Installer (MSI).

## Requirements for using RemoveMSI

The following are requirements for using the RemoveMSI element in your configuration.xml file:

- You must be using at least version 16.0.10306.33602 of the Office Deployment Tool, which you can download from [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065). To check the version of the Office Deployment Tool, right-click on setup.exe, choose **Properties**, and then choose **Details**.
- You must be installing at least Version 1803 of Office 365 ProPlus. Version 1803 or later is available in Monthly Channel, Semi-Annual Channel (Targeted), and Semi-Annual Channel.
- You must be installing Office 365 ProPlus on a computer running at least Windows 7 Service Pack 1 (SP1) or above.
 
## Uninstall all Office products

To uninstall all versions of Office, including Visio and Project, that are already installed on the computer, add \<RemoveMSI /> to your configuration.xml file. Language resources – for example, language packs, language interface packs, or proofing tools – will also be removed.

Here’s an example of a configuration.xml file that installs the 64-bit Monthly Channel version of Office 365 ProPlus in English from the Office Content Delivery Network (CDN) on the Internet and uninstalls any Windows Installer (MSI) versions of Office on the computer.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Monthly" >
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
  </Add>
  <RemoveMSI />
</Configuration>
```


## Install the same language resources

If there are language resources – for example, language packs, language interface packs, or proofing tools – already installed on the computer, you can get Click-to-Run versions of the same language resources installed when you install Office 365 ProPlus. To do this, add \<Language ID="MatchPreviousMSI" /> to your configuration.xml file. 

Here’s an example of a configuration.xml file that installs the 64-bit Semi-Annual Channel (Targeted) version of Office 365 ProPlus in English, along with any existing languages on the computer, from the Office Content Delivery Network (CDN) on the Internet and uninstalls any Windows Installer (MSI) versions of Office on the computer.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Targeted" >
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
         <Language ID="MatchPreviousMSI" />
      </Product>
  </Add>
  <RemoveMSI />
</Configuration>
```

The following are some additional details about using MatchPreviousMSI in your configuration.xml file.
- You must include the RemoveMSI element.
- You must specify at least one language ID. For example, en-us.
- The setting isn’t product specific. For example, if Office Professional Plus 2013 in French and Visio Standard 2013 in German are installed, you will get both French and German, along with any other language IDs you have specified, when you install Office 365 ProPlus.
 
> [!IMPORTANT]
> If you’re installing Office 365 ProPlus from a location on your local network, such as a shared folder, make sure you’ve downloaded all the possible language files to that folder. If any of the languages needed to install aren't available in that folder, the installation will fail and the previous version of Office will have been removed. To avoid this situation, we recommend that you include [AllowCdnFallback="True"](configuration-options-for-the-office-2016-deployment-tool.md#allowcdnfallback-attribute-part-of-add-element) in your configuration.xml file. This will use the Office Content Delivery Network (CDN) on the internet as a backup source from which to install the language files.


## Keep some Office products and uninstall all other Office products 

We recommend that you uninstall any previous versions of Office, including Visio and Project, before installing the newer version. But, in a few cases, such as for application compatibility testing, you might need to keep a previous version installed for a limited time while you transition to the new version.

To keep a particular Office product, you add an IgnoreProduct line to your configuration.xml file and you specify its product ID. 

The following are examples of supported IDs for Project and Visio:
- PrjStd
- PrjPro
- VisStd
- VisPro
- PrjStdR
- PrjProR
- VisStdR
- VisProR

> [!NOTE]
> The product ID is the Setup ID that is found in the Setup.xml file in the *{product}*.WW folder of the installation files for your previous version of Office. For example, the Setup.xml file for Office Professional Plus 2010 is found in the ProPlus.WW folder. 

The ID isn't version specific. All versions found on the computer will be kept. For example, if you specify VisPro, both Visio Professional 2016 and Visio Professional 2013 will be kept. Language resources for those versions are also kept. For example, language packs, language interface packs, or proofing tools. 

Only full product removals are supported. For example, if you have Office Professional Plus 2013 installed, you can't uninstall everything except Excel. You either must keep or uninstall the entire product. You can only keep a previous installation of Excel if it was installed as a standalone product, not installed as part of an Office suite, like Office Professional Plus.

Here’s an example of a configuration.xml file that installs the 64-bit Semi-Annual Channel (Targeted) version of Office 365 ProPlus in English from the Office Content Delivery Network (CDN) on the Internet and uninstalls any Windows Installer (MSI) versions of Office, except for Visio Professional, on the computer.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Targeted">
      <Product ID="O365ProPlusRetail ">
         <Language ID="en-us" />
      </Product>
  </Add>
  <RemoveMSI>
    <IgnoreProduct ID="VisPro" />
  </RemoveMSI>
</Configuration>
```

## Additional information about using RemoveMSI

The following are some additional details about using the RemoveMSI element in your configuration.xml file.
- You can also use these settings if you’re installing any of the following:
   - Project Online Desktop Client
   - Visio Online Plan 2, which is the subscription version of Visio that was previously named Visio Pro for Office 365.
   - Office 365 Business, which is the version of Office that comes with some Office 365 plans, such as Business Premium.
   - A volume licensed version of Office 2019, such as Office Professional Plus 2019.
- Installations of the following products will also be removed unless you use IgnoreProduct:
   - SharePoint Designer. The product ID is SharePointDesigner.
   - InfoPath. The product ID is either InfoPath (for volume licensed versions) or InfoPathR (for retail versions).
   - Lync 2013 or later. Lync 2010 can't be removed by using the RemoveMSI element.
   - Office products that were installed separately and not as part of an Office suite. For example, a standalone installation of Access.
   - Access 2010 Runtime or later. The product ID is AccessRT.
- Access Database Engine (ACE) 2010 Redistributable or later can't be removed by using the RemoveMSI element. This is by design, as the Access Database Engine is most commonly bundled with other applications which are interacting with Access databases. Uninstalling the ACE could break the functionality of such applications. An admin should review the impact of removing ACE first. It can be removed by using the following command: msiexec /x aceredist.msi.
- User settings, preferences, and documents are retained, even if you’re uninstalling all Office products.
- Some previous versions of Office, Visio, and Project must be uninstalled before installing Office 365 ProPlus. For example, Office Professional Plus 2016. If they aren’t uninstalled beforehand, the installation of Office 365 ProPlus will fail. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md). 
- A reboot is required to finish uninstalling the Windows Installer (MSI) versions of Office, but the reboot isn’t enforced. You can reboot after the Office 365 ProPlus installation is finished.
- RemoveMSI doesn’t uninstall prior versions of Office, including Visio and Project, that use Click-to-Run as the installation technology. You can uninstall those versions of Office through Control Panel or by running the Office Deployment Tool and using the [Remove element](configuration-options-for-the-office-2016-deployment-tool.md#remove-element) in your configuration.xml file.
- If you're using RemoveMSI on a Windows 7 SP1 computer, pinned shortcuts that the user created might sometimes remain even though the previous version of Office and all of its other shortcuts have been removed. To remove the pinned shortcut, simply click on it and you'll be prompted to remove it. Or, log in as the user who created the pinned shortcut, and then run the Office Deployment Tool to upgrade to Office 365 ProPlus.

## Related topics
- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
