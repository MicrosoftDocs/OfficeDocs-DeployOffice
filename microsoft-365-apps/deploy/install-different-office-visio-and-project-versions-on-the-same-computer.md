---
title: "Supported scenarios for installing different versions of Office, Project, and Visio on the same computer"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Provides IT admins with information about which versions of Office, Project, and Visio can be installed together on the same computer."
ms.date: 05/29/2024
---

# Supported scenarios for installing different versions of Office, Project, and Visio on the same computer

In many cases, you can install Office, Project, and Visio on the same computer. But, there are some combinations of Office, Project, and Visio that can't be installed together on the same computer.

The two main things that determine whether Office, Project, and Visio can be installed together on the same computer are the [version](#office-releases-and-their-version-number) of the product and the [installation technology](#installation-technologies-used-by-office) used to install the product. What governs whether an installation scenario is supported are these two rules:

- You can't install two products together that have the same version but use different installation technologies.
- You can't install two products of different versions together if both products use Click-to-Run as the installation technology and those products have overlapping Office applications.

See the [example installation scenarios](#example-installation-scenarios) section for several examples of installation scenarios that are supported and not supported, along with an explanation of why it is or isn't supported, based on these rules.

## Office releases and their version number

The following table shows Office releases that Microsoft currently supports, their associated version, and all the possible [installation technology](#installation-technologies-used-by-office). The information listed in the table also applies to releases of Project and Visio. For example, the subscription version of the Project desktop app or Visio Professional 2016.

|Office release  |Version |Installation technologies  |
|---------|---------|---------|
|Microsoft 365 <br/>   | 16.0 | Click-to-Run <br/> Microsoft Store  |
|Office LTSC 2021<br/>Office 2021|16.0|Click-to-Run |
|Office 2019 | 16.0 | Click-to-Run <br/> Microsoft Store        |
|Office 2016 | 16.0 | Click-to-Run <br/> Windows Installer (MSI) <br/>Microsoft Store        |

You can find this version information by going to **Control Panel** > **Programs** > **Programs and Features**. You can also find this version in the **About** dialog for the Office app. For example, open Word, and go to **File** > **Account** > **About Word**. On the top line of the **About Microsoft Word** dialog box, you see the version number. For example, Microsoft Word 2019 MSO (16.0.10336.20044) 32-bit. For steps to find this version in different Office releases, see [Find details for other versions of Office](https://support.microsoft.com/office/8e83dd74-3b83-4528-bda6-6ff6118f8293).

> [!NOTE]
> - Microsoft 365, Office LTSC 2021, Office 2021, Office 2019, and Office 2016 all have the same version: 16.0
> - Office 2013, which is no longer supported, had a version of 15.0. Retail versions used Click-to-Run as the installation technology; volume licensed versions used Windows Installer (MSI).
> - Office 2010, which is no longer supported, had a version of 14.0 and used Windows Installer (MSI) as the installation technology.

## Installation technologies used by Office

There are different ways to purchase Office, Project, and Visio. For example, you can purchase them as part of a Microsoft 365 plan, as a one-time purchase from a retail store, or through a volume licensing agreement. How you purchase them, along with which Office release you purchased – for example, Microsoft 365 or Office 2016 – determines what installation technology is used to install Office.

The three installation technologies are:

- Click-to-Run
- Windows Installer (MSI)
- Microsoft Store

In newer releases of Office, you can go to **File** > **Account** in any Office app, such as Word, and the type of installation technology is listed under the **Product Information** section.

Another way to tell which installation technology was used to install Office is to **File** > **Account** in any Office app. Under the **Product Information** section, if you see an **Update Options** choice, Office was installed by using Click-to-Run. If you don't see an **Update Options** choice, and you don't see any mention of Microsoft Store, then Office was installed by using Windows Installer (MSI).

The Microsoft Store installation technology is only used when you purchase and install Office from the online [Microsoft Store](https://www.microsoft.com/store/).

You can't rely on just the product name and release to determine the installation technology used by Office. For example, if you purchase Visio Standard 2016 from a retail store, it uses Click-to-Run. But, if you purchase Visio Standard 2016 through a volume licensing agreement, it uses Windows Installer (MSI).

## Example installation scenarios

Here are some example installation scenarios, whether they're supported, and an explanation of why they're or aren't supported.

|Products to install  |Supported?  |Explanation  |
|---------|---------|---------|
| Office Professional Plus 2019 (volume licensed) <br/><br/> Visio Professional 2016 (volume licensed)   |   No, but there's an alternative installation method available.   | They use different installation technologies (Click-to-Run and MSI), but they're the same version (16.0).  <br/><br/> For more information about the alternative installation method that's available, see [Use the Office Deployment Tool to install volume licensed versions of Project 2016 and Visio 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).         |
|Microsoft 365 Apps  <br/><br/> Visio Professional 2016 (volume licensed)  |   No, but there's an alternative installation method available. | They use different installation technologies (Click-to-Run and MSI), but they're the same version (16.0). <br/><br/> For more information about the alternative installation method that's available, see [Use the Office Deployment Tool to install volume licensed versions of Project 2016 and Visio 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).        |
|Microsoft 365 Apps  <br/><br/> Project Professional 2019 (volume licensed)  |   Yes, but with a caveat. <sup>1</sup>   | They both use Click-to-Run and are the same version (16.0).         |
| Microsoft 365 Apps  <br/><br/> Visio Standard 2019 (retail) |   Yes, but with a caveat. <sup>1</sup>  | They both use Click-to-Run and are the same version (16.0).         |
|Microsoft 365 Apps  <br/><br/> Visio LTSC Professional 2021 (volume licensed)  |   Yes, but with a caveat. <sup>2</sup>   | They both use Click-to-Run and are the same version (16.0).         |
| Microsoft 365 Apps  <br/><br/> Project Standard 2021 (retail) |   Yes, but with a caveat. <sup>2</sup>  | They both use Click-to-Run and are the same version (16.0).         |

> [!NOTE]
> <sup>1</sup> You must be using at least Version 1808 of Microsoft 365 Apps, because that's the earliest version that recognizes Office 2019 products, including Project and Visio. Version 1808 or later is available in all update channels.
><sup>2</sup> You must be using at least Version 2108 of Microsoft 365 Apps, because that's the earliest version that recognizes Project 2021, Visio LTSC 2021, and Visio 2021. Version 2108 or later is available in all update channels.

## Additional information

- All installed products must be either the 32-bit version or the 64-bit version. For example, you can't install a 32-bit version of Visio on the same computer with a 64-bit version of Office.

- Volume licensed versions of Office 2016 use Windows Installer (MSI). Volume licensed versions of Office LTSC 2021 and Office 2019 use Click-to-Run. The same is true for volume licensed versions of Project and Visio.

- *(For Microsoft 365, Office LTSC 2021, and Office 2019 products)* All products installed on the computer must be using the same [update channel](../updates/overview-update-channels.md). 
  - For example, the volume licensed version of Office Professional Plus 2019 can only use the PerpetualVL2019 update channel. 
  - Therefore, it can't be installed on the same computer that has the subscription version of the Project desktop app using Semi-Annual Enterprise Channel. 
  - Or, on the same computer that has the subscription version of the Visio desktop app using Current Channel.

- *(For Project 2021, Project 2019, Visio LTSC 2021, and Visio 2019)* If you're installing these volume licensed versions of Project or Visio after you've installed Microsoft 365 Apps on the device, they must be configured to use the same update channel as Microsoft 365 Apps.
  - For example, if Microsoft 365 Apps is using Monthly Enterprise Channel, then Project 2021 or Visio 2019 must be installed using Monthly Enterprise Channel.
  - These volume licensed versions of Project and Visio support all the same update channels that Microsoft 365 Apps supports. For example, Current Channel, Monthly Enterprise Channel, and Semi-Annual Enterprise Channel.
  - We provide that support so that you can use these volume licensed versions of Project and Visio with whichever update channel you've configured Microsoft 365 Apps to use.
  - Regardless of which update channel you select for these volume licensed versions of Project and Visio, they won't get any new features. Only subscription versions of Project and Visio get new features regularly.

## Related articles

- [Deployment guide for Project](deployment-guide-for-project.md)
- [Deployment guide for Visio](deployment-guide-for-visio.md)
