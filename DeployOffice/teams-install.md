---
title: "Deploy Microsoft Teams with Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overview of how Microsoft Teams is automatically installed with Microsoft 365 Apps."
---

# Deploy Microsoft Teams with Microsoft 365 Apps

> [!IMPORTANT]
> - Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**, starting with Version 2004. To learn more, [read this article](name-change.md). In our documentation, we'll usually just refer to it as Microsoft 365 Apps.
> - We’re making some changes to the update channels for Microsoft 365 Apps, including adding a new update channel (Monthly Enterprise Channel) and changing the names of the existing update channels. To learn more, [read this article](update-channels-changes.md).


In the past, Microsoft Teams was a separate installation from Microsoft 365 Apps. But starting with Version 1902, Teams is included as part of ***new*** installations of Microsoft 365 Apps. If Teams is already installed on the device, no changes are made to that installation of Teams.

Teams is also being added to ***existing*** installations of Microsoft 365 Apps on devices running Windows. For more information about when that occurs, see [What about existing installations of Microsoft 365 Apps?](#what-about-existing-installations-of-microsoft-365-apps).

> [!NOTE]
> To complete the installation of Teams on new or existing installations of Microsoft 365 Apps, either restart the device or have the user log off and log back on.

If Skype for Business is already installed on the device, Skype for Business won't be removed and will continue to function as before. Skype for Business will continue to be installed with new installations of Microsoft 365 Apps, unless you configure your installation to exclude it.

You don't have to wait if you're ready now to deploy Teams to the users in your organization. You can deploy Teams for your users by [following these instructions](https://docs.microsoft.com/MicrosoftTeams/msi-deployment) or you can have your users install Teams for themselves from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads).

We also have the steps you can take to exclude Teams from [new](#how-to-exclude-microsoft-teams-from-new-installations-of-microsoft-365-apps) or [existing](#what-about-existing-installations-of-microsoft-365-apps) installations of Microsoft 365 Apps if your organization isn't ready to deploy Teams.

> [!IMPORTANT]
> If you're in a GCC High or DoD environment, currently you need to exclude Teams from being installed with Microsoft 365 Apps. Instead, you need to install Teams by using the separate MSI-based installer. For links to the correct version of the MSI-based installer for your environment, see [Install Microsoft Teams using Microsoft Endpoint Configuration Manager](https://docs.microsoft.com/MicrosoftTeams/msi-deployment). In the future, you'll be able to install Teams along with Microsoft 365 Apps in GCC High or DoD environments without needing to use the separate MSI-based installer.

If you're using Office for Mac, see [Microsoft Teams installations on a Mac](#microsoft-teams-installations-on-a-mac).

If you're using shared computers or Virtual Desktop Infrastructure (VDI), see [Shared computer and VDI environments with Microsoft Teams](#shared-computer-and-vdi-environments-with-microsoft-teams).


## When will Microsoft Teams start being included with new installations of Microsoft 365 Apps?

The date when Teams starts being installed with ***new*** installations of Microsoft 365 Apps depends on which [update channel](overview-update-channels.md) you're using. The following table shows the schedule.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Current Channel |Version 1902 | March 4, 2019  |
|Monthly Enterprise Channel |Version 2003 | May 12, 2020  |
|Semi-Annual Enterprise Channel (Preview)| Version 1902   | March 12, 2019  |
|Semi-Annual Enterprise Channel| Version 1902  |July 9, 2019 |

> [!NOTE]
> Teams is also included with the following ***new*** installations:
> - Microsoft 365 Apps for business, starting with Version 1901, which was released on January 31, 2019. Microsoft 365 Apps for business is the version of Office that is included with some Microsoft 365 business plans, such as Microsoft 365 Business Premium.
> - Office for Mac, starting with Version 16.21, which was released on January 16, 2019. Office for Mac comes with any plan that includes Microsoft 365 Apps. For more information, see [Microsoft Teams installations on a Mac](#microsoft-teams-installations-on-a-mac).

## How to exclude Microsoft Teams from new installations of Microsoft 365 Apps

If you don't want Teams included when you install Microsoft 365 Apps on devices running Windows, you can use [Group Policy](#use-group-policy-to-control-the-installation-of-microsoft-teams) or the Office Deployment Tool. Or, as an alternative, you can let Teams be installed, but use Group Policy to [prevent Teams from automatically starting](#use-group-policy-to-prevent-microsoft-teams-from-starting-automatically-after-installation) when the user signs in to the device.

If you want to use the [Office Deployment Tool](overview-office-deployment-tool.md), you can use the [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration.xml file, as shown in the following example.

```xml
<Configuration>
   <Add OfficeClientEdition="64" Channel="Current">
      <Product ID="O365ProPlusRetail">
       <Language ID="en-us" />
       <ExcludeApp ID="Teams" />
      </Product>
      <Product ID="VisioProRetail">
       <Language ID="en-us" />
      </Product>
      <Product ID="ProjectProRetail">
       <Language ID="en-us" />
      </Product>
      <Product ID="LanguagePack">
       <Language ID="de-de" />
      </Product>
    </Add>
</Configuration>
```

> [!TIP]
> Instead of using a text editor to create your configuration.xml, we recommend that you use the [Office Customization Tool (OCT)](https://config.office.com). The OCT provides a web-based interface for making your selections and creating your configuration.xml file to be used with the Office Deployment Tool. For more information, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md).

If you're deploying Microsoft 365 Apps by using the Office 365 Client Installation wizard in Microsoft Endpoint Configuration Manager (current branch), you can set **Teams** to the **Off** position in the configuration UI.

If you're deploying Microsoft 365 Apps by using Microsoft Intune, there is a checkbox to exclude Teams on the **Configure App Suite** pane.  

If you're letting your users install Microsoft 365 Apps for themselves from the Office 365 portal, you can't exclude Teams from being included as part of the installation, unless you use [Group Policy](#use-group-policy-to-control-the-installation-of-microsoft-teams).

To remove Teams after it's been installed, go to **Control Panel** > **Uninstall a program** and uninstall **Microsoft Teams** and any instances of **Teams Machine-Wide Installer**. If you previously installed Teams separately from installing Microsoft 365 Apps, you might see multiple instances of **Teams Machine-Wide Installer**. You can also use PowerShell to remove Teams as shown in this [script sample](https://docs.microsoft.com/microsoftteams/scripts/powershell-script-teams-deployment-clean-up).


## What about existing installations of Microsoft 365 Apps?

Teams is also being added to ***existing*** installations of Microsoft 365 Apps on devices running Windows as part of the normal update process. There is no change to existing installations of Mac.

Whether Teams gets added to an existing installation of Microsoft 365 Apps is determined by what version is installed, what version you're updating to, and some other factors. Version 1906 that was released in Current Channel in July is the first version that started including Teams as part of the update process. But not all devices updating to Version 1906 or later have received Teams as part of the update process because the rollout has been a gradual process over several months. So if you've updated a device to the latest version of Microsoft 365 Apps, but Teams hasn't been installed, that is probably expected and not necessarily an error. It's likely a future update will install Teams. If you want Teams on that device now, you can install it manually from https://teams.microsoft.com/downloads.

> [!IMPORTANT]
> If you're updating your existing installation of Microsoft 365 Apps to Version 1908 (Build 11929.20300) or later, Teams will be added. To complete the installation of Teams after the update, either restart the device or have the user log off and log back on.

The date when Teams can start being added to ***existing*** installations of Microsoft 365 Apps depends on which update channel you're using. The following table shows the schedule.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Current Channel |Version 1906 | July 9, 2019  |
|Monthly Enterprise Channel |Version 2003 | May 12, 2020  |
|Semi-Annual Enterprise Channel (Preview)| Version 1908  | September 10, 2019  |
|Semi-Annual Enterprise Channel| Version 1908  | January 14, 2020 |

If you don't want Teams to be added to ***existing*** installations of Microsoft 365 Apps when you update to a newer version, you can use [Group Policy](#use-group-policy-to-control-the-installation-of-microsoft-teams) or the Office Deployment Tool. Or, as an alternative, you can let Teams be added, but use Group Policy to [prevent Teams from automatically starting](#use-group-policy-to-prevent-microsoft-teams-from-starting-automatically-after-installation) when the user signs in to the device.

If you want to use the [Office Deployment Tool](overview-office-deployment-tool.md), you need to run the Office Deployment Tool in /configure mode on each device before you update to the new version of Microsoft 365 Apps. The following is a configuration.xml file you can use with the Office Deployment Tool to exclude Teams from being added to your existing installation of Microsoft 365 Apps for enterprise.

```xml
<Configuration>
   <Add Version="MatchInstalled">
      <Product ID="O365ProPlusRetail">
       <Language ID="MatchInstalled" TargetProduct="All" />
       <ExcludeApp ID="Teams" />
      </Product>
   </Add>
   <Display Level="None" />
</Configuration>
```

> [!NOTE]
> - Be sure you're using the most current version of the Office Deployment Tool available on the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117).
> - If your existing installation of Microsoft 365 Apps has excluded other apps, such as Access, you need to include a line in your configuration.xmi file for each of those excluded apps. Otherwise, those apps will be installed on the device.
> - If you have Microsoft 365 Apps for business installed, use O365BusinessRetail for the Product ID in your configuration.xml file.

Also, in some situations, doing an Online Repair results in Teams being installed. For example, if Microsoft 365 Apps is configured to get updates from the Office Content Delivery Network (CDN) and the update channel or version you're using includes Teams as part of the installation.

## Use Group Policy to control the installation of Microsoft Teams

If your organization isn't ready to deploy Teams and you use Group Policy, you can enable the *Don't install Microsoft Teams with new installations or updates of Office* policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

> [!NOTE]
> - This policy setting only applies if you are installing or updating to Version 1905 or later of Microsoft 365 Apps.
> - To use this policy setting, download at least version 4882.1000 of the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030), which were released on July 9, 2019.

If you enable this policy setting, Teams won't be installed in the following scenarios for Version 1905 or later:

- New installations of Microsoft 365 Apps
- Updates to existing installations of Microsoft 365 Apps
- Users installing Microsoft 365 Apps for themselves from the Office 365 portal
- An Online Repair of an existing installation of Microsoft 365 Apps

If you have Microsoft 365 Apps for business or can't use Group Policy for some other reason, you can add the preventteamsinstall value to the HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\common\officeupdate key in the registry. The type for preventteamsinstall is REG_DWORD and the value should be set to 1 if you don't want Teams installed.

## Use Group Policy to prevent Microsoft Teams from starting automatically after installation

If you want Teams to be installed, but don't want Teams to start automatically for the user after it's installed, you can use Group Policy and enable the *Prevent Microsoft Teams from starting automatically after installation* policy setting. You can find this policy setting under User Configuration\Policies\Administrative Templates\Microsoft Teams.

By enabling this policy setting ***before Teams is installed***, Teams won't start automatically when the user logs in to the device. Once a user signs in to Teams for the first time, Teams is configured to start automatically the next time the user logs into the device. The user can configure Teams to not start automatically by configuring user settings within Teams or by clearing the **Open Teams on startup** check box on the sign in screen for Teams.

> [!TIP]
> If you've already installed Teams but you want to use this policy setting to prevent Teams from starting automatically, enable this policy setting and then [run this script](https://docs.microsoft.com/MicrosoftTeams/scripts/powershell-script-teams-reset-autostart) on a per-user basis to reset the autostart setting for Teams.

But even if you enable this policy setting so that Teams doesn't start automatically, an icon for Microsoft Teams will appear on the user's desktop.

> [!IMPORTANT]
> - This policy setting only applies if you are installing or updating to the following versions of Microsoft 365 Apps:
>    - Version 1906 or later of Current Channel
>    - Version 1902 (Build 11328.20368) or later of Semi-Annual Enterprise Channel or Semi-Annual Enterprise Channel (Preview)
>    - Version 2003 or later of Monthly Enterprise Channel
> - To use this policy setting, download at least version 4882.1000 of the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030), which were released on July 9, 2019.

If you have Microsoft 365 Apps for business or can't use Group Policy for some other reason, you can add the PreventFirstLaunchAfterInstall value to the HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Teams key in the registry. The type for PreventFirstLaunchAfterInstall is REG_DWORD and the value should be set to 1 if you don't want Teams to automatically start after installation.

## Shared computer and VDI environments with Microsoft Teams

If devices in your organization are shared by multiple users, be aware that Teams is installed separately for each user that signs into that device. Installations of Teams average about 500 mb, so hard disk space, as well network bandwidth for updates, might become an issue for these shared devices installed with Teams. In cases where shared devices are used by a significant number of users, you might want to consider not installing Teams on those shared devices.

If you plan to use Teams in a Virtual Desktop Infrastructure (VDI) environment, see [Teams for Virtualized Desktop Infrastructure](https://docs.microsoft.com/microsoftteams/teams-for-vdi). Teams installed with Microsoft 365 Apps as described in this article is ***NOT*** currently supported in VDI environments.

## Feature and quality updates for Microsoft Teams

After Teams is installed, it's automatically updated approximately every two weeks with new features and quality updates. This update process for Teams is different than the update process for the other Office apps, such as Word and Excel. For more information, see [Teams update process](https://docs.microsoft.com/microsoftteams/teams-client-update).

## Microsoft Teams installations on a Mac

If you're using Version 16.21, or later, of the Office suite install package to deploy on a Mac, Teams will be included as part of the installation.

If you don't want Teams included as part of the installation, there is an Office suite install package available that doesn't include Teams. You can also use the install packages for individual applications, such as Word or Excel. For links to the most current install packages, see [Update history for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac).  

If you're letting your users install Office for themselves on a Mac, such as from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads), you can't exclude Teams from being included as part of the installation.

To uninstall Teams on a Mac, quit Teams by right-clicking the Teams app in the dock, then hold down Option and choose **Force Quit**. Open the **Application Folder**, select **Microsoft Teams**, and move it to the **Trash**.

## What about Office 365 plans that don't include Microsoft Teams?

Some Office 365 plans include Microsoft 365 Apps, but don't include the Teams service. Even if a plan doesn't include the Teams service, Teams will still be installed with Microsoft 365 Apps, as described earlier in this article. To prevent Teams from being installed, follow the steps outlined earlier in this article.

For Office 365 plans that don't include the Teams service, a free trial version of Teams that's valid for 1 year is available. Your users can start using it when they sign in to Teams. For more information about this free trial version and providing your users access to it, see [Manage the Microsoft Teams Commercial Cloud Trial offer](https://docs.microsoft.com/microsoftteams/iw-trial-teams).

## Additional information about installing Microsoft Teams

- There is no change to new or existing installations of Office 2019, such as Office Professional Plus 2019.
- Teams is installed with Microsoft 365 Apps in the same way that Teams is installed if you use the [MSI-based installer for Teams](https://docs.microsoft.com/MicrosoftTeams/msi-deployment). For each new user that signs into the device, the Teams installer runs and the Teams application is installed in the user's AppData folder.
- The architecture (sometimes referred to as the *bitness*) of Teams and Microsoft 365 Apps installed on the device don't have to match. For example, you can install the 32-bit version of Teams on a device running the 64-bit versions of Microsoft 365 Apps. To change the architecture of Teams, for example from 32-bit to 64-bit, you need to uninstall the 32-bit version of Teams and then install the 64-bit version of Teams.
- For more information for IT Pros about Microsoft Teams, see [Microsoft Teams documentation](https://docs.microsoft.com/MicrosoftTeams/Microsoft-Teams).
