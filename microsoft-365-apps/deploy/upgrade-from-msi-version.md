---
title: "Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Provides information for IT Pros about how to use the RemoveMSI element when upgrading to Microsoft 365 Apps from an MSI version of Office"
ms.date: 06/21/2024
---

# Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps

We recommend that you uninstall any previous versions of Office before installing Microsoft 365 Apps. Use the Office Deployment Tool and specify the RemoveMSI element in your configuration.xml file to uninstall Office versions that use Windows Installer (MSI).

There are several ways that you can use the RemoveMSI element when installing Microsoft 365 Apps.

- Uninstall all Office products on the computer.
- Identify any existing language resources, like language packs, and install the same languages.
- Keep some Office products and uninstall all other Office products on the computer.

RemoveMSI can be used to uninstall 2007, 2010, 2013, or 2016 versions of Office, Visio, or Project that were installed using Windows Installer (MSI).

> [!NOTE]
> RemoveMSI doesn’t uninstall prior versions of Office, including Visio and Project, that use Click-to-Run as the installation technology. You can uninstall those versions of Office through Control Panel or by running the Office Deployment Tool and using the [Remove element](office-deployment-tool-configuration-options.md#remove-element) in your configuration.xml file.

## Requirements for using RemoveMSI

The following are requirements for using the RemoveMSI element in your configuration.xml file:

- You must be using at least version 16.0.12827.20268 (setup.exe version 16.0.12827.20258) of the Office Deployment Tool, which you can download from [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065). We recommend that you always download and use the most current version of the Office Deployment Tool. To check the version of the Office Deployment Tool, right-click on setup.exe, choose **Properties**, and then choose **Details**.
- You must be installing at least Version 1803 of Microsoft 365 Apps. Version 1803 or later is available in Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), and Semi-Annual Enterprise Channel.
- You must be installing Microsoft 365 Apps on a computer running at least Windows 7 Service Pack 1 (SP1) or newer.

> [!NOTE]
> Support for Windows 7 ended on January 14, 2020. For more information, see [Windows 7 end of support and Microsoft 365 Apps](../end-of-support/windows-7-support.md).
 
## Uninstall all Office products

To uninstall all versions of Office, including Visio and Project, that are already installed on the computer, add \<RemoveMSI /> to your configuration.xml file. Language resources – for example, language packs, language interface packs, or proofing tools – are also removed.

Here’s an example of a configuration.xml file. It installs the 64-bit Current Channel version of Microsoft 365 Apps for enterprise in English from the Office Content Delivery Network (CDN). It also uninstalls any Windows Installer (MSI) versions of Office.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current" >
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
  </Add>
  <RemoveMSI />
</Configuration>
```


## Install the same language resources

If there are language resources – for example, language packs, language interface packs, or proofing tools – already installed on the computer, you can get Click-to-Run versions of the same language resources installed when you install Microsoft 365 Apps. To install the same language resources, add \<Language ID="MatchPreviousMSI" /> to your configuration.xml file. 

Here’s an example of a configuration.xml file. It installs the 64-bit Monthly Enterprise Channel version of Microsoft 365 Apps for enterprise in English. It also includes any existing languages on the computer. The installation is from the Office Content Delivery Network (CDN). Additionally, it uninstalls any Windows Installer (MSI) versions of Office.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="MonthlyEnterprise" >
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
         <Language ID="MatchPreviousMSI" />
      </Product>
  </Add>
  <RemoveMSI />
</Configuration>
```

The following are some other details about using MatchPreviousMSI in your configuration.xml file.
- You must include the RemoveMSI element.
- You must specify at least one language ID. For example, en-us.
- The setting isn’t product specific. For example, if you have Office Professional Plus 2013 in French and Visio Standard 2013 in German installed, you get both French and German when you install Microsoft 365 Apps. Any other language IDs you specified are also included.
 
> [!IMPORTANT]
> If you’re installing Microsoft 365 Apps from a location on your local network, such as a shared folder, make sure you’ve downloaded all the possible language files to that folder. If any of the languages needed to install aren't available in that folder, the installation will continue but without those languages being installed. To avoid this situation, we recommend that you include [AllowCdnFallback="True"](office-deployment-tool-configuration-options.md#allowcdnfallback-attribute-part-of-add-element) in your configuration.xml file. This will use the Office Content Delivery Network (CDN) on the internet as a backup source from which to install the language files.


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

The ID isn't version specific. All versions found on the computer are kept. For example, if you specify VisPro, both Visio Professional 2016 and Visio Professional 2013 are kept. Language resources for those versions are also kept. For example, language packs, language interface packs, or proofing tools. 

Only full product removals are supported. For example, if you have Office Professional Plus 2013 installed, you can't uninstall everything except Excel. You either must keep or uninstall the entire product. You can only keep a previous installation of Excel if it was installed as a standalone product, not installed as part of an Office suite, like Office Professional Plus.

Here’s an example of a configuration.xml file. It installs the 64-bit Monthly Enterprise Channel version of Microsoft 365 Apps for enterprise in English from the Office Content Delivery Network (CDN). It also uninstalls any Windows Installer (MSI) versions of Office on the computer, except for Visio Professional.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="MonthlyEnterprise">
      <Product ID="O365ProPlusRetail ">
         <Language ID="en-us" />
      </Product>
  </Add>
  <RemoveMSI>
    <IgnoreProduct ID="VisPro" />
  </RemoveMSI>
</Configuration>
```

## Other products that can be removed

Installations of the following products are removed by using the RemoveMSI element unless you use IgnoreProduct:

- SharePoint Designer. The product ID is SharePointDesigner.
- InfoPath. The product ID is either InfoPath (for volume licensed versions) or InfoPathR (for retail versions).
- Lync 2013 or later. 
> [!NOTE]
> Lync 2010 can't be removed by using the RemoveMSI element.
- Office products that were installed separately and not as part of an Office suite. For example, a standalone installation of Access.
- Access 2010 Runtime or later. The product ID is AccessRT.
- Access Database Engine 2010 Redistributable or later. The product ID is AceRedist.

> [!NOTE]
> Access Database Engine is most commonly included as part of other applications which are interacting with Access data sources, and uninstalling Access Database Engine could impact functionality of these applications. Before removing Access Database Engine, ensure that any applications which require this component are removed or no longer needed.

## Additional information about using RemoveMSI

The following are some other details about using the RemoveMSI element in your configuration.xml file.
- You can also use these settings if you’re installing any of the following products:
   - The subscription version of the Project desktop app that comes with Project Plan 3 or Project Plan 5. 
   - The subscription version of the Visio desktop app that comes with Visio Plan 2. 
   - Microsoft 365 Apps for business, which is the version of Office that comes with some Microsoft 365 business plans, such as Microsoft 365 Business Premium.
   - Office LTSC Professional Plus 2021 or Office LTSC Standard 2021.
   - A volume licensed version of Office 2019, such as Office Professional Plus 2019.
- User settings, preferences, and documents are retained, even if you’re uninstalling all Office products.
- You can use the RemoveMSI element with the MSICondition attribute. That attribute allows you to control the installation of an Office product based on whether a particular MSI-based product is already installed on the device. For example, only install Project Online Desktop Client if Project Professional is already installed on the device. For more information, see [MSICondition attribute](office-deployment-tool-configuration-options.md#msicondition-attribute-part-of-product-element) or watch [Upgrading to Microsoft 365 Apps with MSICondition and RemoveMSI](https://youtu.be/7zHi6MRveRc).
- Some previous versions of Office, Visio, and Project must be uninstalled before installing Microsoft 365 Apps. For example, Office Professional Plus 2016. If they aren’t uninstalled beforehand, the installation of Microsoft 365 Apps fail. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md). 
- A reboot is required to finish uninstalling the Windows Installer (MSI) versions of Office, but the reboot isn’t enforced. You can reboot after the Microsoft 365 Apps installation is finished.
- Removing a product might fail if the product is open on the user's device. This failure can happen if the [Level attribute](office-deployment-tool-configuration-options.md#level-attribute-part-of-display-element) or the Display element in your configuration.xml file is set to None. If you set the Level attribute to Full, the user is prompted to close the program so the removal can continue. You can use the [FORCEAPPSHUTDOWN property](office-deployment-tool-configuration-options.md#forceappshutdown-property-part-of-property-element), but that could result in data loss.
- If you use RemoveMSI on a Windows 7 SP1 computer, pinned shortcuts created by the user might sometimes remain. This can happen even if the previous version of Office and all its other shortcuts have been removed. To remove the pinned shortcut, select it, and you'll be prompted to remove it. Or, sign in as the user who created the pinned shortcut, and then run the Office Deployment Tool to upgrade to Microsoft 365 Apps.

## Related articles
- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)
