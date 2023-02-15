---
title: "Microsoft 365 Apps migration from Windows Server "
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: tier1
ms.localizationpriority: medium
recommendations: false
description: "Provides guidance to Office admins on moving from Microsoft 365 Apps on Windows Server to either Windows 365 or Azure Virtual Desktop."
ms.date: 05/31/2022
---

# Microsoft 365 Apps migration from Windows Server

> [!NOTE]
> The information in this article is for organizations who are hosting Microsoft 365 Apps on Windows Server 2016, 2019, or 2022.

Microsoft 365 Apps is supported on Windows Server only until the following dates:

- Windows Server 2016: October 2025
- Windows Server 2019: October 2025
- Windows Server 2022: October 2026

> [!NOTE]
> Only Version 2302 or later of Microsoft 365 Apps is supported on Windows Server 2022. (*For more information, see [Windows Server end of support and Microsoft 365 Apps](windows-server-support.md#windows-server-2022)*.)

If you've deployed Microsoft 365 Apps to these versions of Windows Server, you'll need to migrate to another hosting solution before that support ends. This migration is required to stay current and maintain support as described in the [Modern Lifecycle Policy](/lifecycle/policies/modern).

There are migration paths available that may better meet your technical and business requirements. To maintain support for Microsoft 365 Apps, we recommend moving from Windows Server to one of the following client hosting solutions:

- [Windows 365](#windows-365)
- [Azure Virtual Desktop](#azure-virtual-desktop)

## Windows 365

[Windows 365](https://www.microsoft.com/windows-365) is a complete software-as-service (SaaS) solution that securely streams your Windows experience (including your personalized apps, content, and settings) from the Microsoft cloud to any device.

The Windows 365 service hosts [Cloud PCs](/windows-365/overview#what-is-a-cloud-pc), which are highly available, optimized, and scalable virtual machines that can provide your users with a rich Windows desktop experience.

For more information on Windows 365 plans, and Cloud PC configurations available, visit the [Windows 365 Plans and Pricing](https://www.microsoft.com/windows-365/business/compare-plans-pricing) page.

Windows 365 requires no virtualization expertise and enables you to do the following:

- Manage Cloud PCs in Microsoft Intune like other supported devices, including Microsoft 365 Apps.

- Choose pre-configured Cloud PCs (including RAM, CPU, and storage), and then use [resize](/windows-365/enterprise/resize-cloud-pc) as needs change.

- Automatically provision on-demand Cloud PCs using standard gallery images or custom images.

- Request assistance from Microsoft on application issues with [App Assure](/windows-365/enterprise/app-assure) at no additional cost.

- Purchase Windows 365 licenses per user for a fixed monthly fee.

For more information about Windows 365 Enterprise, see the following resources:

- [Windows 365 frequently asked questions](https://www.microsoft.com/windows-365/faq)  
- [Requirements for Windows 365](/windows-365/enterprise/requirements)
- [Planning guide for Windows 365](/windows-365/enterprise/planning-guide)

## Azure Virtual Desktop

[Azure Virtual Desktop](https://azure.microsoft.com/services/virtual-desktop/) is a highly flexible desktop and app virtualization service that runs on the cloud. It provides you with full control, via the Azure portal, to customize virtual desktop management and deployment based on your organization’s needs.

Azure Virtual Desktop enables you to do the following:

- Create a full desktop virtualization environment in your Azure subscription without running any gateway servers.

- Reduce costs and operating system overhead with the new Windows 11 and Windows 10 Enterprise [multi-session capability](/azure/virtual-desktop/windows-10-multisession-faq).

- Maintain full control over management and deployment, plus options for [Citrix](https://azure.microsoft.com/services/virtual-desktop/citrix-virtual-apps-desktops-for-azure/) and [VMware](https://azure.microsoft.com/services/virtual-desktop/vmware-horizon-cloud/) integration.

- Use standard gallery images or create custom images.

- Request assistance from Microsoft on application issues with [App Assure](/fasttrack/products-and-capabilities#app-assure) at no additional cost.

- Pay only for what you use on the service (consumption-based pricing).

For more information, see the following resources:

- [What is Azure Virtual Desktop?](/azure/virtual-desktop/overview)
- [Prerequisites for Azure Virtual Desktop](/azure/virtual-desktop/prerequisites)
- [Deploy Azure Virtual Desktop with the getting started feature](/azure/virtual-desktop/getting-started-feature)

If an on-premises session host deployment is required, Azure Virtual Desktop for Azure Stack HCI (currently in preview) lets you deploy Azure Virtual Desktop session hosts to your on-premises Azure Stack HCI infrastructure. This configuration can help address compliance requirements for on-premises data storage. Also, you can improve performance for Azure Virtual Desktop users in areas with poor connectivity to the Azure public cloud. For more information, see [Azure Virtual Desktop for Azure Stack HCI (preview)](/azure/virtual-desktop/azure-stack-hci-overview).

## Additional information

### End of support dates for Windows Server

Support for Windows Server itself isn't impacted. Here are the end of support dates for Windows Server:

- Windows Server 2016: January 2027
- Windows Server 2019: January 2029
- Windows Server 2022: October 2031

For more information, go to the [Search Product and Services Lifecycle Information](/lifecycle/products/) page.

### Support for virtual Windows client devices on Windows Server

Using Windows Server to host virtual Windows client devices installed with Microsoft 365 Apps will continue to be supported as long as the version of Windows Server is supported.
