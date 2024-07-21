---
title: "Deploy Microsoft 365 Apps by using Remote Desktop Services"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Provides guidance and steps for Office admins for running Microsoft 365 Apps on Remote Desktop Services."
ms.date: 04/19/2024
---

# Deploy Microsoft 365 Apps by using Remote Desktop Services

If you use Remote Desktop Services (RDS) to provide shared computers to users in your organization, you can install Microsoft 365 Apps on those computers. But, you have to use the Office Deployment Tool and enable [shared computer activation](../licensing-activation/overview-shared-computer-activation.md) to do the installation.

The following are two common RDS scenarios:

- Install Microsoft 365 Apps on an RDS server.

- Install Microsoft 365 Apps on a shared virtual machine.

## What you need to get started
<a name="Started"> </a>

The following is a list of prerequisites that you need to deploy Microsoft 365 Apps or the Project and Visio desktop apps with RDS:

- One of the following plans:
  - A Microsoft 365 (or Office 365) plan that includes Microsoft 365 Apps for enterprise.
  - A Microsoft 365 Business Premium plan that includes Microsoft 365 Apps for business.
  - For the Project and Visio desktop apps, a subscription plan that includes those products.
- The Office Deployment Tool, which is available on the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065). 
- A separate user account for each user who signs in to the shared computer.
- An [eligible license assigned](/microsoft-365/admin/manage/assign-licenses-to-users) to each user account.
- A version of Windows listed in the [Microsoft 365 plans for business, education, and government system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources#areaheading-oc60f6).
- Reliable connectivity between the shared computer and the internet.

> [!NOTE]
> - The ability to enable shared computer activation is a Microsoft 365 Business Premium entitlement and not a feature of Microsoft 365 Apps for business in general.
> - The reliable internet connectivity  is required because the shared computer must be able to contact the Office Licensing Service on the internet to obtain a license for each user who uses the Microsoft 365 Apps on the computer and then activate Microsoft 365 Apps. Internet connectivity is also needed to renew the license, which occurs every few days.

## Install Microsoft 365 Apps on an RDS server
<a name="Server"> </a>

> [!NOTE]
> - Microsoft 365 Apps is supported on Windows Server 2019 and Windows Server 2016 only until October 2025.
> - Microsoft 365 Apps (Version 2302 or later) is supported on Windows Server 2022 only until October 2026.
> - Microsoft 365 Apps isn’t supported on Windows Server 2008 R2, Windows Server 2012, or Windows Server 2012 R2.
> - For recommendations on client hosting solutions to move to, see [Microsoft 365 Apps migration from Windows Server](../end-of-support/windows-server-migration.md).

In this scenario, you install Microsoft 365 Apps on a computer configured as a Remote Desktop Session Host server, allowing multiple users to connect remotely. Each user can simultaneously run Microsoft 365 programs like Word or Excel. The process is identical for Project and Visio desktop apps.

Here are the basic steps of how to install Microsoft 365 Apps on an RDS server:

1. Install and configure Windows Server.

2. Install and configure the Remote Desktop Session Host role service.

    For example, [follow these steps to install Remote Desktop Session Host](/windows-server/remote/remote-desktop-services/rds-deploy-infrastructure) on Windows Server.

    For users to be able to connect remotely to the server to use Microsoft 365 Apps, their accounts must be members of the Remote Desktop Users group on the RD Session Host server.

3. Use the [Office Customization Tool](https://config.office.com/deploymentsettings) to create a configuration file. Make sure to tick the **Shared Computer** box in the **Licensing and activation** section. Export the resulting configuration file and save it to the same location as the extracted Office Deployment Tool.

    You can also [create a configuration file](office-deployment-tool-configuration-options.md) using a text editor. Make sure that it includes the following line:

    ````
   <Property Name="SharedComputerLicensing" Value="1" />
    ````

    You use the SharedComputerLicensing setting to enable [shared computer activation](../licensing-activation/overview-shared-computer-activation.md), which is required to use Microsoft 365 Apps on a shared computer.

4. Use the [Office Deployment Tool](overview-office-deployment-tool.md) and the configuration file to install Microsoft 365 Apps on the RD Session Host server.

At this point, users can connect to the RD Session Host server and use Microsoft 365 Apps. Users can connect to the server by using Remote Desktop Connection, which is available in Windows, or by using other [Remote Desktop clients](/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients).

## Install Microsoft 365 Apps on a shared virtual machine
<a name="VM"> </a>

In this scenario, you install Microsoft 365 Apps as part of a client operating system image, such as one running Windows 10. Then, you use RDS and Hyper-V to create a group of virtual machines based on that image. These virtual machines are shared with multiple users. In RDS, this is known as either a virtual desktop pool or a pooled virtual desktop collection, depending on which version of RDS that you're using.

> [!NOTE]
> You can also use RDS to assign a virtual machine to a specific user. RDS calls that a personal virtual desktop. In that scenario, you don't use shared computer activation, because the virtual machine isn't shared among multiple users. 

Here are the basic steps of how to configure RDS to deploy Microsoft 365 Apps on a shared virtual machine:

1. Create the operating system image:

   - Follow the instructions to [Deploy Microsoft 365 Apps as part of an operating system image](deploy-microsoft-365-apps-operating-system-image.md). In Step 2 of the instructions, make sure that your configuration.xml file also includes the following line to enable shared computer activation:

   ```xml
   <Property Name="SharedComputerLicensing" Value="1" />
   ```

   - You also need to [make some RDS-specific changes on the virtual machine](/windows-server/remote/remote-desktop-services/rds-prepare-vms), such as enabling Remote Desktop.

2. Install and configure Windows Server.

3. Install and configure RDS.

    For example, [follow these steps to deploy a virtual desktop collection](/windows-server/remote/remote-desktop-services/rds-create-collection) on Windows Server.

After you complete all the RDS configuration steps, users can connect to any of the virtual machines and run Microsoft 365 Apps.

## Related articles
<a name="VM"> </a>

- [Overview of shared computer activation for Microsoft 365 Apps](../licensing-activation/overview-shared-computer-activation.md)
- [Troubleshoot issues with shared computer activation for Microsoft 365 Apps](../licensing-activation/troubleshoot-shared-computer-activation.md)
- [Remote Desktop Services](/windows-server/remote/remote-desktop-services/welcome-to-rds)
