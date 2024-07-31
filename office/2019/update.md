---
title: "Update Office 2019 (for IT Pros)"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides IT admins with information on how to update Office 2019."
ms.date: 04/19/2024
---

# Update Office 2019 (for IT Pros)
 
  
After you deploy volume licensed versions of Office 2019, including Project and Visio, you’ll want to keep it updated because Microsoft releases security updates and quality updates, such as updates that provide stability or performance improvements for Office. Office 2019 is updated approximately once a month, usually on the second Tuesday of the month. 

> [!NOTE]
> Office 2019 doesn't receive new features. If you want to get new Office features on an on-going basis, you should consider moving to an Office 365 (or Microsoft 365) plan that includes Office.

Volume licensed versions of Office 2019 now use Click-to-Run, instead of Windows Installer (MSI), as the technology used to install and update Office.


## How Office 2019 gets updated

Click-to-Run handles updates differently than Windows Installer (MSI). The following provides information about how updates work for Office 2019.

- When there are updates for Office 2019, Microsoft releases a new build of Office 2019 on the Office Content Delivery Network (CDN) on the internet. This new build includes all the latest security and quality updates.
- By default, Office 2019 is configured to receive updates automatically and directly from the Office CDN, although that can be changed. For more information, see [Configure where Office 2019 gets updates from](#configure-where-office-2019-gets-updates-from).
- There's a scheduled task named “Office Automatic Updates 2.0 ” on the computer on which Office 2019 is installed that checks for updates regularly.
- If updates are available, Office begins downloading the updates automatically. The user doesn’t have to do anything. As part of this process, Office also figures out what’s different between the latest version of Office 2019 up on the Office CDN and the version of Office 2019 that’s installed on the computer. Based on that, it only downloads what’s needed to update Office 2019 to the latest version.
- While the updates are being downloaded, users can continue to use Office apps, such as Word. After the updates are downloaded, the updates are installed. If any Office apps are open, users are prompted to save their work and close the apps, so that the updates can be installed.
- After the updates are installed, users can go back to working in their Office apps.


## How updates are different in Office 2019

Since Click-to-Run handles updates differently than Windows Installer (MSI), there are some changes you need to be aware of.

- There are no separate downloads for security or quality updates. Updates are already included as part of a new build of Office 2019 that’s posted on the Office CDN.
- Updates are cumulative, so the latest version of Office 2019 available on the Office CDN includes all the security and quality updates from all the previous versions of Office 2019.
- When you download and install Office 2019 from the Office CDN, it’s up to date already. You don’t have to download and apply any updates or service packs after you install Office 2019.
- Since updates are cumulative and already included in the latest version of Office 2019 on the Office CDN, you don’t use Microsoft Updates or Windows Server Updates Services (WSUS) to update Office 2019. But you can use Microsoft Configuration Manager to help you deploy and manage updates to Office 2019, including controlling when and from where updates are applied. 

## Configure where Office 2019 gets updates from

If network connectivity and other considerations based on your organizational requirements aren’t an issue, we recommend that Office 2019 is updated automatically from the Office CDN. Updating from the Office CDN is the default, so there’s nothing extra you need to do and it’s an easy way to keep Office 2019 up to date. 

If you don’t want computers installed with Office 2019 to connect to the Office CDN to get updates, you can configure Office 2019 to get updates from a shared folder from within your internal network. You still need a least one computer to have access to the Office CDN to be able to download the latest version of Office 2019 to the shared folder on your internal network.

Keep in mind that installing and updating Office 2019 from a shared folder on your local network requires significantly more administrative effort and more disk space. For example, you have to keep track of when new builds of Office 2019 are available and then download the updated version of Office 2019 to your network. Downloading to a shared folder on your local network will always download a full copy of the updated version of Office.

You can also use enterprise software deployment tools, such as Microsoft Configuration Manager, to help you update Office 2019.

The location where Office 2019 looks for updates is specified in the configuration.xml file that you use to deploy Office 2019 with the Office Deployment Tool.  For more information, see [Deploy Office 2019 (for IT Pros)](deploy.md). You can also use [Group Policy](#use-group-policy-to-specify-update-settings).

## Check for updates for Office 2019

Instead of waiting for the scheduled task to run to check for updates, you can manually check for updates. To do that, open any Office app, such as Word, and go to **File** > **Account** > **Update Options** > **Update Now**.

This causes the Click-to-Run service to go look for updates at the location that you’ve configured Office to look for updates. For example, directly from the Office CDN on the internet. If updates are available, Office begins the process to download.

## Size of updates for Office 2019

The size of the updates that are downloaded to the user's computer from the update location varies depending on several factors, including how long it’s been since you last updated Office 2019 and how many security and quality updates there are.

To minimize the size of the updates that need to be downloaded, we recommend that you keep Office 2019 up to date. Office uses a technology called binary delta compression to help reduce the size of the updates that need to be applied to the user's computer. But binary delta compression is only available if you're updating from a recent version of Office. For example, if you're updating from the September or October version to the November version. But if you're updating a much older version of Office, such as from the June to November version, binary delta compression isn't available.

## Update channel for Office 2019

Office uses the concept of update channels to determine which updates an installed version of Office receives. The update channel is specified in the configuration.xml file that is used by the Office Deployment Tool. You should always explicitly specify the update channel. For more information, see [Deploy Office 2019 (for IT Pros)](deploy.md).

“PerpetualVL2019” is the **only** supported update channel for Office Professional Plus 2019 and Office Standard 2019. It's also the default update channel for volume licensed versions of Project 2019 and Visio 2019, although they can be installed with any update channel, such as Current Channel or Semi-Annual Enterprise Channel.

Update channel is a computer-wide setting. Which update channel you use should be determined by which version of the Office suite that you’re deploying. If you’re deploying Project and Visio along with Office, they must use the same update channel as the Office suite. This shouldn’t be an issue if all the versions of Office, Project, and Visio are the 2019 volume licensed versions.
 
If you’re deploying a volume licensed version of Project 2019 or Visio 2019 along with Microsoft 365 Apps, you should specify the same update channel for Project 2019 and Visio 2019 that you’re using for Microsoft 365 Apps. For example, "Current" for Current Channel or “SemiAnnual” for Semi-Annual Enterprise Channel. For more information, see [Supported scenarios for installing different versions of Office, Project, and Visio on the same computer](/microsoft-365-apps/deploy/install-different-office-visio-and-project-versions-on-the-same-computer).


## Use Group Policy to specify update settings

If you have Windows Server and Active Directory Domain Services (AD DS) deployed in your organization, you can configure update settings for volume licensed versions of Office 2019 by using Group Policy. To do this, download the most current [Administrative Template files (ADMX/ADML for Office)](https://www.microsoft.com/download/details.aspx?id=49030), which include the policy settings for Office 2019.

After you copy the Administrative Template files to AD DS, you'll find the update policy settings under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\ Updates in the Group Policy Management Console. You'll also find a description of how to configure each policy setting. For example,  you can use the “Update path” Group Policy setting to specify where Office 2019 should look for updates.


## Related articles

- [Overview of Office 2019 (for IT Pros)](overview.md)
- [Deploy Office 2019 (for IT Pros)](deploy.md)
