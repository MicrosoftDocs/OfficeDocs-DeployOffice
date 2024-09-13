---
title: "Deployment options for admins for Office for Mac"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: true
description: "Provides information to admins on how to download and deploy Office for Mac to users in their organization"
ms.date: 09/18/2024
---

# Deployment options for admins for Office for Mac

***Applies to:*** *Microsoft 365 for Mac, Office Long Term Service Channel (LTSC) for Mac 2024, LTSC for Mac 2021*

There are two basic ways that you, as an admin, can deploy Office to Mac users in your organization:
  
- Provide your Mac users with the installer package file, and have them install Office for themselves

- Download the installer package file to your local network, and then use your software distribution tools to deploy Office to Mac devices

If you have a Microsoft 365 plan, you can provide your Mac users with instructions on [how to download and install Office](https://support.microsoft.com/office/4414eaaf-0478-48be-9c42-23adc4716658?#InstallSteps=Install_on_a_Mac) themselves. To install Office on a Mac, a user has to be an administrator on the device or know an administrator account name and password.

> [!TIP] 
> If your users are familiar with the process for downloading and installing Mac apps, you can simply send them the direct link to the Office Content Delivery Network.
  
If you use software distribution tools, you have more control over which users get Office and when. For example, you can automatically install Office apps as part of automated device enrollment. To plan your deployment, review the following information.

> [!NOTE]
> For information about upgrades, see [Upgrade an installation of Office for Mac](#upgrade-an-installation-of-office-for-mac).
  
## Download Office for Mac to your local network

The easiest way to download Office for Mac, and ensure you're always getting the most current version and build, is to download directly from the Office Content Delivery Network (CDN) on the internet. Here are the links to the installer packages for the Office suite, which contains all the applications.

- [Microsoft 365 for Mac](https://go.microsoft.com/fwlink/p/?linkid=2009112)
- [Office LTSC for Mac 2024]()
- [Office LTSC for Mac 2021](https://go.microsoft.com/fwlink/p/?linkid=2244846) (volume license)

The same installer package can be used for Microsoft 365 subscriptions, Office LTSC for Mac 2024, and Office LTSC for Mac 2021. How you activate the product determines which features are available to your users.

> [!NOTE]
> - If you have a Microsoft Services Provider License Agreement (SPLA), [review this information](/office/ltsc/spla).
> - Support for Office 2019 for Mac ended on October 13<sup>th</sup>, 2023. For more information, see [End of support for Office 2019 for Mac](https://support.microsoft.com/office/f2cbba0a-0773-4b2c-b417-b20b5bb2c757).
> - Support for Office 2016 for Mac ended on October 10<sup>th</sup>, 2023. For more information, see [End of support for Office 2016 for Mac](https://support.microsoft.com/office/e944a907-bbc8-4be5-918d-a514068d0056)

## Deploy Office for Mac to users in your organization

Office for Mac uses the Apple Installer technology for installation. That means you can use the software distribution tools that you normally use to deploy software to Mac users. Some of the most common tools are [Jamf Pro](https://www.jamf.com/products/jamf-pro/), [Microsoft Intune](/mem/intune/), [Munki](https://www.munki.org/), and [AutoPkg](https://github.com/autopkg/autopkg). You can also use [Apple Remote Desktop](https://www.apple.com/remotedesktop/).
  
> [!IMPORTANT]
> To help improve security, Office for Mac implements Apple app sandboxing guidelines. This means that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. Even though you can't customize app bundles, you can [configure preferences](deploy-preferences-for-office-for-mac.md) for each app.
  
## Additional deployment information for Office for Mac

Whichever deployment method you decide to use, the following information can help you plan your Office for Mac deployment.
  
#### Side-by-side installations

You can't have two different versions of Office installed on a Mac. For example, you can't install Office LTSC for Mac 2024 on the same Mac where Microsoft 365 for Mac is already installed.

#### Deploying individual apps

Installer package files for individual applications, such as Word or Excel, are available to download from the Office Content Delivery Network (CDN). For links to those files, see [Most current packages for Office for Mac](/officeupdates/update-history-office-for-mac#most-current-packages-for-office-for-mac).

> [!TIP]
> The Office for Mac installer package, also known as the *suite* installer, is much smaller than the combined size of the individual app installers.
> This is because the suite installer includes a common set of fonts, frameworks, and proofing tools that are copied into each app bundle during installation. 

#### Microsoft Teams

Teams is included as part of the installer packages for Microsoft 365 for Mac. If you don't want Teams included as part of the installation, you can [download this installer package](https://go.microsoft.com/fwlink/p/?linkid=525133), which doesn't include Teams.

#### Activation

To use Office on a Mac, Office needs to be activated. Before you deploy, review the information about [how activation works](overview-of-activation-for-office-for-mac.md) for Office for Mac.

#### Internet access

After downloading the installer package, internet access isn’t required to install, activate, or use Office LTSC for Mac 2024 or Office LTSC for Mac 2021.  

#### Uninstalling

If you need to uninstall Office from a Mac, you can [follow these steps to completely remove Office](https://support.microsoft.com/office/ec3aa66e-6a76-451f-9d35-cba2e14e94c0). Unfortunately, there is no program to uninstall Office from a Mac automatically.

## Upgrade an installation of Office for Mac

You can upgrade an existing installation of Office on a Mac to a newer version without uninstalling the current version. For example, you can upgrade a volume-licensed version of Office 2019 for Mac to Office LTSC for Mac 2024. You can also switch from a volume-licensed version of Office, such as Office LTSC for Mac 2024, to a subscription version of Office for Mac.

#### Upgrade to Microsoft 365 for Mac (subscription version)

If you're a volume-licensed customer of Office LTSC for Mac 2024 or Office LTSC for Mac 2021, you can upgrade to Microsoft 365 for Mac without uninstalling your current version. Follow these steps:

1. Install the latest Office updates on each Mac where Office is installed.
2. Have users open any Office app and sign in with their Microsoft 365 account.

> [!TIP]
> When multiple license types are present on the device, apps such as Word, Excel, PowerPoint, and Outlook will prefer to use a subscription license.
> If the user signs out of their Microsoft 365 account, the apps will revert to the volume license.

#### Upgrade to Office LTSC for Mac 2024 (volume license)

If you're a volume licensed customer, you can upgrade to Office LTSC for Mac 2024 without having to uninstall Office for Mac 2021. Just follow these steps:

1. Install the latest Office updates on each Mac where Office is installed. Office must be updated to at least Version 16.89.
2. Download the [Volume License (VL) Serializer](volume-license-serializer.md) for Office LTSC for Mac 2024 from the [Microsoft 365 admin center](https://admin.microsoft.com/).
3. Run the VL Serializer on each Mac where Office is installed.

## Related articles

- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
