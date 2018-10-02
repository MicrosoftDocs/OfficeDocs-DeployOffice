---
title: "Supported scenarios for installing different versions of Office, Project, and Visio on the same computer"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
description: "Provides IT admins with information about which versions of Office, Project, and Visio can be installed together on the same computer."
---

# Supported scenarios for installing different versions of Office, Project, and Visio on the same computer

In many cases, you can install Office, Project, and Visio on the same computer. But, there are some combinations of Office, Project, and Visio that can't be installed together on the same computer.
The two main things that determine whether Office, Project, and Visio can be installed together on the same computer are the [version](#office-releases-and-their-version-number) of the product and the [installation technology](#installation-technologies-used-by-office) used to install the product. What governs whether an installation scenario is supported are these two rules:

- You can’t install two products together that have the same version but use different installation technologies.
- You can’t install two products of different versions together if both products use Click-to-Run as the installation technology and those products have overlapping Office applications.

See the [example installation scenarios](#example-installation-scenarios) section for several examples of installation scenarios that are supported and not supported, along with an explanation of why they are or aren’t supported, based on the rules listed above.

## Office releases and their version number

The following table shows Office releases that are currently supported by Microsoft, their associated version, and all the possible [installation technology](#installation-technologies-used-by-office). The information listed in the table also applies to releases of Project and Visio. For example, Project Online Desktop Client or Visio Professional 2016.


|Office release  |Version<sup>1</sup>  |Installation technologies  |
|---------|---------|---------|
|Office 365  | 16.0 | Click-to-Run <br/> Microsoft Store  |
|Office 2019 | 16.0 | Click-to-Run <br/> Microsoft Store        |
|Office 2016 | 16.0 | Click-to-Run <br/> Windows Installer (MSI) <br/>Microsoft Store        |
|Office 2013 | 15.0 | Click-to-Run <br/> Windows Installer (MSI)        |
|Office 2010 | 14.0 | Windows Installer (MSI)  |


<sup>1</sup> You can find this version information by going to **Control Panel** > **Programs** > **Programs and Features**. You can also find this version in the **About** dialog for the Office app. For example, open Word, and go to **File** > **Account** > **About Word**. On the top line of the **About Microsoft Word** dialog box, you will see the version number. For example, Microsoft Word 2019 MSO (16.0.10336.20044) 32-bt. For steps to find this version in different Office releases, see [Find details for other versions of Office](https://support.office.com/article/8e83dd74-3b83-4528-bda6-6ff6118f8293). 

> [!IMPORTANT]
> Office 365, Office 2019, and Office 2016 all have the same version: 16.0


## Installation technologies used by Office

There are different ways to purchase Office, Project, and Visio. For example, you can purchase them as part of an Office 365 plan, as a one-time purchase from a retail store, or thorough a volume licensing agreement. How you purchase them, along with which Office release you purchased – for example, Office 365 or Office 2016 – determines what installation technology is used to install Office.

The three installation technologies are:

- Click-to-Run
- Windows Installer (MSI)
- Microsoft Store

In newer releases of Office, you can go to **File** > **Account** in any Office app, such as Word, and the type of installation technology is listed under the **Product Information** section.

Another way to tell which installation technology was used to install Office is to **File** > **Account** in any Office app. Under the **Product Information** section, if you see an **Update Options** choice, Office was installed by using Click-to-Run. If you don’t see an **Update Options** choice, and you don’t see any mention of Microsoft Store, then Office was installed by using Windows Installer (MSI).

The Microsoft Store installation technology is only used when you purchase and install Office from the online [Microsoft Store](https://www.microsoft.com/store/). 

You can’t rely on just the product name and release to determine the installation technology used by Office. For example, if you purchase Visio Standard 2016 from a retail store, it uses Click-to-Run. But, if you purchase Visio Standard 2016 through a volume licensing agreement, it uses Windows Installer (MSI).


## Example installation scenarios

Here are some example installation scenarios, whether they’re supported, and an explanation of why they are or aren’t supported.


|Products to install  |Supported?  |Explanation  |
|---------|---------|---------|
| Office 365 ProPlus <br/> <br/>Project Professional 2013 (volume licensed) |   Yes      |They use different installation technologies (Click-to-Run and MSI) and they are different versions (16.0 and 15.0)         |
| Office 365 ProPlus <br/><br/>  Access 2013 (retail purchase) |   No      | They both use Click-to-Run and they are different versions (16.0 and 15.0), but Office 365 ProPlus already includes Access.        |
| Office 365 ProPlus  <br/><br/> Visio Professional 2013 (retail purchase) |   Yes      |They both use Click-to-Run, they are different versions (16.0 and 15.0), and there is no overlap in applications.         |
| Office Professional Plus 2019 (volume licensed) <br/><br/> Visio Professional 2016 (volume licensed)   |   No      | They use different installation technologies (Click-to-Run and MSI), but they are the same version (16.0).        |
| Office Standard 2019 (volume licensed) <br/><br/>Visio Standard 2013 (volume licensed)   |   Yes      |They use different installation technologies (Click-to-Run and MSI) and they are different versions (16.0 and 15.0).         |
|Office 365 ProPlus  <br/><br/> Visio Professional 2016 (volume licensed)  |   No, but there is an alternative installation method available. | They use different installation technologies (Click-to-Run and MSI), but they are the same version (16.0). <br/><br/> For more information about the alternative installation method that’s available, see [Use the Office Deployment Tool to install volume licensed versions of Project 2016 and Visio 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).        |
|Office 365 ProPlus  <br/><br/> Project Professional 2019 (volume licensed)  |   Yes, but with a caveat. <sup>2</sup>   | They both use Click-to-Run and are the same version (16.0).         |
| Office 365 ProPlus  <br/><br/> Visio Standard 2019 (retail) |   Yes, but with a caveat. <sup>2</sup>  | They both use Click-to-Run and are the same version (16.0).         |



<sup>2</sup> You must be using at least Version 1808 of Office 365 ProPlus, because that’s the earliest version that recognizes Office 2019 products, including Project and Visio. Version 1808 is currently available in Monthly Channel and Semi-Annual Channel (Targeted). Version 1808 is scheduled to be available in Semi-Annual Channel in January 2019. For Office 365 ProPlus release information, see [Update history for Office 365 ProPlus (by version)](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-version).


## Additional information

- All installed products must be either the 32-bit version or the 64-bit version. For example, you can’t install a 32-bit version of Visio on the same computer with a 64-bit version of Office.
- Even though a particular installation scenario is supported, it might not be recommended. For example, we don’t recommend having two different versions of Office installed on the same computer, such as Office 2013 (MSI) and Office 2019 (Click-to-Run).
- Volume licensed versions of Office 2013 and Office 2016 use Windows Installer (MSI). Volume licensed versions of Office 2019 use Click-to-Run. The same is true for volume licensed versions of Project and Visio.
- For Office 365 and Office 2019 products, all products installed on the computer must be using the same [update channel](overview-of-update-channels-for-office-365-proplus.md). For example, the volume licensed version of Office Professional Plus 2019 can only use the PerpetualVL2019 update channel. Therefore, it can’t be installed on the same computer that has Project Online Desktop Client using Semi-Annual Channel or on the same computer that has Visio Online Plan 2 (the subscription version of Visio that was formerly named Visio Pro for Office 365) using Monthly Channel.



## Related topics

- [Deployment guide for Project](deployment-guide-for-project.md)
- [Deployment guide for Visio](deployment-guide-for-visio.md)
  


