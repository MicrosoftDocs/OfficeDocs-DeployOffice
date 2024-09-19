---
title: "Deployment guide for Visio"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Provides Office admins with an overview of how to deploy subscription and volume licensed versions of Visio to users in their organization."
ms.date: 09/19/2024
---

# Deployment guide for Visio

How you deploy Visio to the users in your organization depends on which version of Visio you purchase. A common purchase option for organizations is one of the following versions of Visio:
  
- Visio desktop app that comes with a Visio Plan 2 subscription.
- Visio LTSC Professional 2024 or Visio LTSC Standard 2024, available as a one-time purchase through a volume licensing agreement.
- Visio LTSC Professional 2021 or Visio LTSC Standard 2021, available as a one-time purchase through a volume licensing agreement.
- Visio Professional 2019 or Visio Standard 2019, available as a one-time purchase through a volume licensing agreement.
- Visio Professional 2016 or Visio Standard 2016, available as a one-time purchase through a volume licensing agreement.

Before you deploy, be sure to [review the system requirements](https://support.microsoft.com/topic/9e73a4c7-f110-473b-9223-1ab62769ec59) for the version of Visio that you plan to deploy to the users in your organization.
  
> [!IMPORTANT]
> There are some combinations of Office, Visio, and Project that can't be installed together on the same device. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md).

## Deploy Visio

The following sections provide guidance on how to deploy different versions of Visio.

### Deploy a subscription version of Visio

Here are the general steps to deploy a subscription version of Visio to users in your organization:

1. Purchase Visio Plan 2, with enough licenses for all of your Visio users.
2. Sign in to the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center) and [assign licenses](/microsoft-365/admin/manage/assign-licenses-to-users) for Visio to those users.
3. Have your users sign in to [Office.com](https://www.office.com) and install Visio from the **Apps & devices** section of [My account](https://portal.office.com/account). Users have to be local administrators on their devices to install Visio.

If you want to have more control over how the subscription version of Visio is deployed to your users, you can do the following instead:

1. [Download](https://www.microsoft.com/download/details.aspx?id=49117) the Office Deployment Tool from the Microsoft Download Center.
2. Create a [configuration.xml file](office-deployment-tool-configuration-options.md) to use with the Office Deployment Tool to install the subscription version of Visio.
   - We recommend using the [Office Customization Tool](https://config.office.com/officeSettings/configurations) in the [Microsoft 365 Apps admin center](https://config.office.com) to create the configuration file. Leave the **Office Suite** field empty and choose your version in the **Visio** dropdown.
   - We also recommend reviewing the [Build dynamic, lean, and universal packages for Microsoft 365 Apps](../best-practices/build-dynamic-lean-universal-packages.md) article on how to optimize your configuration file. This step is optional.
3. Use the [Office Deployment Tool](overview-office-deployment-tool.md) to deploy the subscription version Visio to the users in your organization.
   - We recommend installing Visio without downloading the source files beforehand. This reduces the overall network utilization and removes the need to maintain the source files.

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy the subscription version of Visio.

### Deploy Visio LTSC 2024

To deploy Visio LTSC Professional 2024 or Visio LTSC Standard 2024 to users in your organization, follow these general steps:

1. Purchase Visio LTSC 2024 as part of a volume licensing agreement.
2. Use the Office Deployment Tool and a configuration.xml file to install Visio LTSC 2024 from the Office Content Delivery Network (CDN) on the internet. For more information, see [Deploy Office LTSC 2024](/office/ltsc/2024/deploy)
   - It’s recommended to install Visio directly without downloading the source files beforehand. This approach reduces overall network utilization and eliminates the need to maintain the source files.

If you use other tools, such as Microsoft Configuration Manager, to deploy software to your users, you can integrate the Office Deployment Tool with those tools to deploy Visio LTSC 2024.

> [!NOTE]
> - Visio LTSC 2024 is available directly from the Office CDN.
> - Visio LTSC 2024 is installed using Click-to-Run rather than Windows Installer (MSI).
> - The Office Customization Tool (OCT) used for Windows Installer (MSI) versions of Visio is not applicable for Visio LTSC 2024.

### Deploy Visio LTSC 2021

Here are the general steps to deploy Visio LTSC Professional 2021 or Visio LTSC Standard 2021 to users in your organization:

1. Purchase Visio LTSC 2021 as part of a volume licensing agreement.
2. Use the Office Deployment Tool and a configuration.xml file to install Visio LTSC 2021 from the Office Content Delivery Network (CDN) on the internet. For more information, see [Deploy Office LTSC 2021](/office/ltsc/2021/deploy).
   - We recommend using the [Office Customization Tool](https://config.office.com/officeSettings/configurations) in the [Microsoft 365 Apps admin center](https://config.office.com) to create the configuration file. Leave the **Office Suite** field empty and choose your version in the **Visio** dropdown.
   - We recommend installing Visio without downloading the source files beforehand. This reduces the overall network utilization and removes the need to maintain the source files.

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy Visio LTSC 2021.

> [!NOTE]
> - Visio LTSC 2021 is available directly from the Office CDN.
> - Visio LTSC 2021 is installed by using Click-to-Run instead of by using Windows Installer (MSI).
> - The Office Customization Tool (OCT) that's used for Windows Installer (MSI) versions of Visio isn't used with Visio LTSC 2021.

### Deploy a volume licensed version of Visio 2019

Here are the general steps to deploy a volume licensed version of Visio Professional 2019 or Visio Standard 2019 to users in your organization:

1. Purchase Visio 2019 as part of a volume licensing agreement.
2. Use the Office Deployment Tool and a configuration.xml file to install Visio 2019 from the Office Content Delivery Network (CDN) on the internet. For more information, see [Deploy Office 2019 (for IT Pros)](/office/2019/deploy).
   - We recommend using the [Office Customization Tool](https://config.office.com/officeSettings/configurations) in the [Microsoft 365 Apps admin center](https://config.office.com) to create the configuration file. Leave the **Office Suite** field empty and choose your version in the **Visio** dropdown.
   - We recommend installing Visio without downloading the source files beforehand. This reduces the overall network utilization and removes the need to maintain the source files.

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy volume licensed versions of Visio.

> [!NOTE]
> - Volume licensed versions of Visio 2019 are available directly from the Office CDN.
> - Volume licensed versions of Visio 2019 are installed by using Click-to-Run instead of by using Windows Installer (MSI).
> - The Office Customization Tool (OCT) that's used for Windows Installer (MSI) versions of Visio isn't used with volume licensed versions of Visio 2019.

### Deploy a volume licensed version of Visio 2016

Here are the general steps to deploy a volume licensed version of Visio Professional 2016 or Visio Standard 2016 to users in your organization:

1. Purchase Visio 2016 as part of a volume licensing agreement.
2. To download your version of Visio 2016, go to [Microsoft 365 admin center](https://admin.microsoft.com/) > **Billing** > **Your products** > **Volume licensing** > **Download and keys**.
3. If you want to configure user settings for when Visio is installed, you can use the [Office Customization Tool (OCT)](/office/customization-tool/oct-2016-help-overview).
4. Deploy Visio 2016 to your users. For example, you can send your users a script to run that installs Visio from a network share on your local network.

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Customization Tool (OCT) along with those tools to deploy Visio.

> [!NOTE]
> The Office Customization Tool (OCT) is only available for versions of Visio 2016 that are purchased as part of a volume licensing agreement. The OCT can't be used for retail versions of Visio 2016, such as versions bought at a retail store or online.
  
## Configure user settings for Visio by using Group Policy

If you want to specify and maintain certain user settings for your Visio installations, you can [download the Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) and use them to configure Group Policy settings. Group Policy can be used only with devices joined to a domain.
  
The same Group Policy settings work for the subscription version of the Visio desktop app, and volume licensed versions of Visio.
  
## End user resources for Visio

To help your users get started with Visio, here are some resources to share with them:
  
- [What's new in Visio 2024](https://support.microsoft.com/office/0295be56-187c-4254-9463-1b67dd6e0eb1)
- [Beginner tutorial for Visio](https://support.microsoft.com/office/bc1605de-d9f3-4c3a-970c-19876386047c)
- [Visio help & learning](https://support.microsoft.com/visio)

## Related articles

- [Plans and pricing information](https://www.microsoft.com/microsoft-365/visio/microsoft-visio-plans-and-pricing-compare-visio-options)
- [Visio licensing](https://www.microsoft.com/microsoft-365/visio/microsoft-visio-volume-licensing-visio-for-multiple-users)
