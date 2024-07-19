---
title: "Manage Microsoft 365 installation options in the Microsoft 365 admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Provides admins with information to help them configure Microsoft 365 installation options in the Microsoft 365 admin center."
ms.date: 01/25/2024
---

# Manage Microsoft 365 installation options in the Microsoft 365 admin center

As a Microsoft 365 admin, you can choose to do the following tasks on the **Microsoft 365 installation options** page in the Microsoft 365 admin center:

- [Choose how often to get feature updates for Office](#choose-how-often-to-get-feature-updates-for-office)
- [Manage which version of Office is installed](#manage-which-version-of-office-is-installed), including
  - [Roll back to a previous version](#roll-back-to-a-previous-version)
  - [Skip an upcoming version](#skip-an-upcoming-version)
- [Choose whether users can install Office on their own devices](#choose-whether-users-can-install-office-on-their-own-devices) 

If you don't want users installing Office themselves, you can [manually deploy Office to your users](#manually-deploy-office-to-your-users).

> [!TIP]
> To get to **Microsoft 365 installation options**, sign in to the Microsoft 365 admin center with your admin account, and then go to **Show all** > **Settings** > **Org settings** > **Services**.

## Choose how often to get feature updates for Office

You can choose how often you want your users to get feature updates for the Office apps installed on devices running Windows. For example, you can provide new features as soon as they're ready, or once a month (on the second Tuesday of the month), or twice a year (in January and July, on the second Tuesday).

We recommend Current Channel, because it provides your users with the newest Office features as soon as they're ready. If you need more predictability of when new Office features are released, we recommend Monthly Enterprise Channel with a [cloud update](../microsoft-365-apps/admin-center/cloud-update.md). By using cloud update, you automatically deliver monthly Office updates for specific users or groups in waves, limiting the effect on your network. In those cases where you selected devices that require extensive testing before receiving new features, we recommend Semi-Annual Enterprise Channel.

For more information, see [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md).

> [!NOTE]
> You won't see an option to choose Semi-Annual Enterprise Channel if your tenant was created after January 15, 2023. Semi-Annual Enterprise Channel is still available. You can move devices to that channel by using other methods, such as the Office Deployment Tool or Group Policy. For more information, see [Change the Microsoft 365 Apps update channel for devices in your organization](../updates/change-update-channels.md).

After you select an update channel under **Feature updates** and choose **Save**, your choice of update channel will apply to both new and existing installations of Office in your organization. You can change your channel selection at any time.

For *new* installations, your update channel selection applies to any new installations of Office that are initiated by your users at [My account](https://portal.office.com/account) > **Apps & devices**.

For *existing* installations of Office, your selection is applied to devices within 12 hours. Devices will automatically get the latest build from the selected update channel the next time they check for Office updates. Office is updated directly from the Office Content Delivery Network (CDN) on the internet.

Keep in mind that moving to a different update channel can also change which features are available to your users. For more information about which features are available in each update channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). 

> [!NOTE]
> - Your choice under **Feature updates** won't apply if you're already using some other method to manage Office on devices in your organization.
>
> - For example, if you’re using Office policy settings (with Group Policy or Cloud Policy), Microsoft Configuration Manager, Microsoft Intune, or the Office Deployment Tool (the UpdatePath attribute in the [Updates element](office-deployment-tool-configuration-options.md#updates-element)). You’ll need to use that method to change the update channel on those devices instead of using **Microsoft 365 installation options**.
>
> - If you’re using the Office Deployment Tool in a different way (for example, specifying the Channel attribute in the [Add element](office-deployment-tool-configuration-options.md#add-element) or in the [Updates element](office-deployment-tool-configuration-options.md#updates-element)), and not any of the other methods mentioned in the previous bullet point, then your choice under **Feature updates** will apply to those devices.
>
> - Also, if you're using the [Microsoft 365 Apps admin center](https://config.office.com), and the device is included in the [inventory](../admin-center/inventory.md) or is managed by  [cloud update](../admin-center/cloud-update.md), then your choice under **Feature updates** won't apply.
>
> - Your choice under **Feature updates** applies *only to new*, but not existing, installations if you have one of the following plans: Office 365 operated by 21Vianet, Office 365 GCC, or Office 365 GCC High and DoD.

## Manage which version of Office is installed

You can also, in certain situations, roll back devices in your organization to a previous version of Office or skip an upcoming version. 

This capability is available to you on the **Version management** tab in the Microsoft 365 admin center, under **Settings** > **Org settings** > **Services** > **Microsoft 365 installation options**. The **Version management** tab is only shown if you chose Monthly Enterprise Channel for feature updates on the **Installation options** tab. You can only manage versions of Office that are installed on devices running Windows.

> [!NOTE]
> - Your choices on the **Version management** tab won't apply if you're already using some other method to manage Office on devices in your organization. For example, if you’re using Office policy settings (with Group Policy or Cloud Policy), Microsoft Configuration Manager, or Microsoft Intune.
>
> - If you’re using the Office Deployment Tool to manage Office on devices in your organization, but none of the other methods mentioned in the previous bullet point, then your choices on the **Version management** tab will apply to devices in your organization.
>
> - The **Version management** tab isn't available if you have one of the following plans: Office 365 operated by 21Vianet, Office 365 GCC, or Office 365 GCC High and DoD.

On the **Version management** tab, you can see your current version, your previous version, and your next scheduled version of Office for Monthly Enterprise Channel. Updates to Monthly Enterprise Channel are released on the second Tuesday of each month.

### Roll back to a previous version

If you’re having a problem with the current version of Office, you can roll back devices in your organization to a previous version of Monthly Enterprise Channel.

If you decide to roll back to a previous version, devices in your organization will roll back to that previous version the next time Office checks for updates. Also, the information on the **Version management** tab is updated to show that the previous version is now the current version for devices in your organization.

If you want to stay on that previous version beyond the next version update, you’ll also need to choose **Skip this version**. Otherwise, your organization's devices automatically update to the latest version starting from the second Tuesday of the month. That update comes directly from the Office Content Delivery Network (CDN) on the internet.

We don’t recommend staying on a version that is no longer supported and that is no longer receiving security updates.

### Skip an upcoming version

If you want to stay on your current version of Office, you can skip the next scheduled version for Monthly Enterprise Channel. But, you can only skip one version at a time. 

If you want to skip more than one upcoming version, you need to go to the **Version management** tab before the second Tuesday of the month, and once again choose **Skip this version**. If you don’t choose **Skip this version**, devices in your organization are updated to the most recent version available starting on the second Tuesday of the month. That update comes directly from the Office Content Delivery Network (CDN) on the internet.

If you skip a version, you can't roll back to that version at a later time. The information displayed on the **Version management** tab  always shows you which version you can roll back to.

We don’t recommend staying on a version that is no longer supported and that is no longer receiving security updates.

## Choose whether users can install Office on their own devices

As an admin, you can control which Office software your users can download and install from [My account](https://portal.office.com/account) > **Apps & devices**. Whichever choices you make, they apply to all users in your organization.

If you choose to make some software unavailable to your users, they see a message on their **Apps & devices** page instead of an **Install** button. For example, if you choose to make Office unavailable, users see this message: 
  
&nbsp;&nbsp;&nbsp; Your admin turns off Office installs. Contact your admin for more information about how to get Office in your organization.

> [!NOTE]
> - Users have to be local administrators on their devices to install Office software. If users aren't local administrators, you'll have to install Office for them. For more information, see [Manually deploy the Office apps](#manually-deploy-the-office-apps).
> - For users to be able to install Office, you need to [assign them a license](/microsoft-365/admin/manage/assign-licenses-to-users).
> - By default, Office installs all the apps that are included in your version of Office on the user's device. If you want some users to get only certain apps, such as only Word and PowerPoint, you can use the Office Deployment Tool to deploy Office to your users with only those apps.

## Manually deploy Office to your users

From the **Manually deploy apps to users** page, you can download the installation packages for Skype for Business or Office for Mac. For more information about deploying Office for Mac, see [Deployment guide for Office for Mac](../mac/deployment-guide-for-office-for-mac.md).

### Manually deploy the Office apps

If you don't want your users to install software themselves from [My account](https://portal.office.com/account) > **Apps & devices**, there are several ways you can deploy Office to devices running Windows in your organization.
  
One way you can deploy Office to your users is by using the Office Deployment Tool, which you can download for free from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117). You can use the Office Deployment Tool on its own or with your existing software deployment tools and processes. For more information, see [Overview of the Office Deployment Tool](overview-office-deployment-tool.md).

You can use the Office Deployment Tool to configure your deployments of Office, whether you’re installing Office directly from the Office Content Delivery Network (CDN) on the internet or from a shared folder on your network. As part of the installation, you can, for example, specify an update channel, include more languages, or exclude certain applications from being installed, such as Access or Publisher. 

If available to your organization, you can also use Microsoft Configuration Manager or Microsoft Intune to deploy Office to your users. For more information, see [Manage Microsoft 365 Apps with Configuration Manager](/mem/configmgr/sum/deploy-use/manage-office-365-proplus-updates) and [Add Microsoft 365 apps to Windows 10 devices using Microsoft Intune](/mem/intune/apps/apps-add-office365).
  
### Manually deploy InfoPath 2013 and SharePoint Designer 2013

In addition to Office, you can download InfoPath 2013 and SharePoint Designer 2013 in order to deploy them to your users. You can download them from the Microsoft Download Center by using the following links:
  
- [InfoPath 2013](https://go.microsoft.com/fwlink/p/?LinkID=626623) (32-bit and 64-bit versions) 
    
- [SharePoint Designer 2013](https://go.microsoft.com/fwlink/p/?LinkID=626622) (32-bit and 64-bit versions) 
    
After you download the software, you can use your existing software deployment tools and processes to deploy InfoPath or SharePoint Designer to your users.

> [!NOTE]
> If you want your users to install InfoPath 2013 or SharePoint Designer 2013 for themselves, there are links to the downloads on [My account](https://portal.office.com/account) > **Tools & add-ins**.


## Related articles

- [Overview of the Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center)
