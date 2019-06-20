---
title: "Deploy Microsoft Teams with Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overview of how Microsoft Teams is automatically installed with Office 365 ProPlus."
---

# Deploy Microsoft Teams with Office 365 ProPlus

In the past, Microsoft Teams was a separate installation from Office 365 ProPlus. But starting with Version 1902, Teams is included as part of ***new*** installations of Office 365 ProPlus. If Teams is already installed on the device, no changes are made to that installation of Teams.

If Skype for Business is already installed on the device, Skype for Business won’t be removed and will continue to function as before. Also, Skype for Business will continue to be installed with new installations of Office 365 ProPlus, unless you configure your installation to exclude it.

> [!IMPORTANT]
> Starting in July 2019, if you're using Monthly Channel, then Teams will be added to ***existing*** installations of Office 365 ProPlus (and Office 365 Business) on devices running Windows when you update your existing installation to the latest version. For more information, see [What about existing installations of Office 365 ProPlus?](#what-about-existing-installations-of-office-365-proplus)
> 
> This upcoming change doesn't apply to existing installations of Office for Mac.


If you're ready to deploy Teams to the users in your organization, you don't have to wait for this rollout schedule. Instead, you can deploy Teams now for your users by [following these instructions](https://docs.microsoft.com/MicrosoftTeams/msi-deployment) or you can have your users install Teams for themselves from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads).

If your organization isn't ready to deploy Teams, we have the steps you can take to exclude Teams from [new](#how-to-exclude-microsoft-teams-from-new-installations-of-office-365-proplus) or [existing](#what-about-existing-installations-of-office-365-proplus) installations of Office 365 ProPlus.

If you're using Office for Mac, see [Microsoft Teams installations on a Mac](#microsoft-teams-installations-on-a-mac).


## When will Microsoft Teams start being included with new installations of Office 365 ProPlus?

The date when Teams starts being installed with ***new*** installations of Office 365 ProPlus depends on which update channel you’re using. The following table shows the schedule, which is subject to change.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Monthly Channel |Version 1902 | March 4, 2019  |
|Semi-Annual Channel (Targeted)| Version 1902   | March 12, 2019  |
|Semi-Annual Channel| Version 1902  |*July 9, 2019* |

> [!NOTE]
> Teams is also included with the following ***new*** installations:
> - Office 365 Business, starting with Version 1901, which was released on January 31, 2019. Office 365 Business is the version of Office that is included with certain business plans, such as the Microsoft 365 Business plan and the Office 365 Business Premium plan.
> - Office for Mac, starting with Version 16.21, which was released on January 16, 2019. Office for Mac comes with any plan that includes Office 365 Business or Office 365 ProPlus. For more information, see [Microsoft Teams installations on a Mac](#microsoft-teams-installations-on-a-mac).

## How to exclude Microsoft Teams from new installations of Office 365 ProPlus

If you don’t want Teams included when you install Office 365 ProPlus on devices running Windows, you can use [Group Policy](#use-group-policy-to-control-the-installation-of-microsoft-teams) or the Office Deployment Tool. Or, as an alternative, you can let Teams be installed, but use Group Policy to [prevent Teams from automatically starting](#use-group-policy-to-prevent-microsoft-teams-from-starting-automatically-after-installation) when the user signs in to the device.

If you want to use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md), you can use the [ExcludeApp element](configuration-options-for-the-office-2016-deployment-tool.md#excludeapp-element) in your configuration.xml file, as shown in the following example.

```xml
<Configuration>
   <Add OfficeClientEdition="64" Channel="Monthly">
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

If you’re deploying Office 365 ProPlus by using the Office 365 Client Installation wizard in System Center Configuration Manager (Current Branch), you can set **Teams** to the **Off** position in the configuration UI.

If you're deploying Office 365 ProPlus by using Microsoft Intune, there is a checkbox to exclude Teams on the **Configure App Suite** pane.  

If you’re letting your users install Office 365 ProPlus for themselves from the Office 365 portal, you can’t exclude Teams from being included as part of the installation, unless you use [Group Policy](#use-group-policy-to-control-the-installation-of-microsoft-teams).

If you want to remove Teams after it’s been installed, you can go to **Control Panel** > **Uninstall** a program. Select **Microsoft Teams** and then choose **Uninstall**. If you’re logged in with local administrator permissions on the computer, Teams will be uninstalled for all users. If you’re only logged in with user permissions, Teams is only uninstalled for that user.

The guidance above in this section also applies to Office 365 Business.

## What about existing installations of Office 365 ProPlus?

Starting in July 2019, if you're using Monthly Channel, then Teams will be added to ***existing*** installations of Office 365 ProPlus (and Office 365 Business) when you update your existing installation to the latest version on devices running Windows.

For example, if you're using Version 1904 in Monthly Channel and you update to Version 1906 in July, Teams will be installed on the device as part of the update to Version 1906.

The date when Teams starts being added to ***existing*** installations of Office 365 ProPlus depends on which update channel you’re using. The following table shows the forecasted schedule, which is subject to change.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Monthly Channel |*Version 1906* | *July 9, 2019*  |
|Semi-Annual Channel (Targeted)| *To be determined*  | *September 10, 2019*  |
|Semi-Annual Channel| *To be determined*  | *January 2020* |

<sup>*</sup> *If you're using Monthly Channel (Targeted), Teams will be added with an update to Version 1906 starting on approximately June 25, 2019.*

If you don't want Teams to be added to ***existing*** installations of Office 365 ProPlus when you update to a new version, you can use [Group Policy](#use-group-policy-to-control-the-installation-of-microsoft-teams) or the Office Deployment Tool. Or, as an alternative, you can let Teams be added, but use Group Policy to [prevent Teams from automatically starting](#use-group-policy-to-prevent-microsoft-teams-from-starting-automatically-after-installation) when the user signs in to the device.

If you want to use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md), you need to run the Office Deployment Tool in /configure mode on each device before you update to the new version of Office 365 ProPlus. The following is a configuration.xml file you can use with the Office Deployment Tool to exclude Teams from being added to your existing installation of Office 365 ProPlus.

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
> - If your existing installation of Office 365 ProPlus has excluded other apps, such as Access, you need to include a line in your configuration.xmi file for each of those excluded apps. Otherwise, those apps will be installed on the device.
> - If you have Office 365 Business installed, use O365BusinessRetail for the Product ID in your configuration.xml file.

Also, in some situations, doing an Online Repair results in Teams being installed. For example, if Office is configured to get updates from the Office Content Delivery Network (CDN) and the update channel or version you're using includes Teams as part of the installation.

## Use Group Policy to control the installation of Microsoft Teams

If your organization isn't ready to deploy Teams and you use Group Policy, you can enable the *Don't install Microsoft Teams with new installations or updates of Office* policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

If you enable this policy setting, Teams won't be installed in the following scenarios:

- New installations of Office 365 ProPlus
- Updates to existing installations of Office 365 ProPlus
- Users installing Office 365 ProPlus for themselves from the Office 365 portal
- An Online Repair of an existing installation of Office 365 ProPlus

> [!NOTE]
> - This policy setting only applies if you are installing or updating to Version 1905 or later.
> - Be sure you're using at least version 4873.1000 of the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030), which were released on June 13, 2019.

If you have Office 365 Business or can't use Group Policy for some other reason, you can add the preventteamsinstall value to the HKEY_LOCAL__MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate key in the registry. The type for preventteamsinstall is REG_DWORD and the value should be set to 1 if you don't want Teams installed.

## Use Group Policy to prevent Microsoft Teams from starting automatically after installation

If you want Teams to be installed, but don't want Teams to start automatically for the user after it's installed, you can use Group Policy and enable the *Prevent Microsoft Teams from starting automatically after installation* policy setting. By enabling this policy setting before Teams is installed, Teams doesn't start automatically when the user logs in to the device. Once a user starts Teams for the first time, Teams is configured to start automatically the next time the user logs into the device. The user can configure Teams not to start automatically by configuring user settings within Teams.

> [!IMPORTANT]
> This policy setting will be available soon in the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030) download. We'll update this section when it's available for download.

If you have Office 365 Business or can't use Group Policy for some other reason, you can add the PreventFirstLaunchAfterInstall value to the HKEY_CURRENT__USER\SOFTWARE\Policies\Microsoft\office\16.0\Teams key in the registry. The type for PreventFirstLaunchAfterInstall is REG_DWORD and the value should be set to 1 if you don't want Teams to automatically start after installation.


## Feature and quality updates for Microsoft Teams

After Teams is installed, it's automatically updated approximately every two weeks with new features and quality updates. This update process for Teams is different than the update process for the other Offices apps, such as Word and Excel. How often those apps get feature and quality updates depends on which [update channel](overview-of-update-channels-for-office-365-proplus.md) they’re on.

## Microsoft Teams installations on a Mac

If you're using Version 16.21, or later, of the Office suite install package to deploy on a Mac, Teams will be included as part of the installation.

If you don’t want Teams included as part of the installation, there is an Office suite install package available that doesn't include Teams. You can also use the install packages for individual applications, such as Word or Excel. For links to the most current install packages, see [Update history for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac).  

If you’re letting your users install Office for themselves on a Mac, such as from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads), you can’t exclude Teams from being included as part of the installation.

To uninstall Teams on a Mac, quit Teams by right-clicking the Teams app in the dock, then hold down Option and choose **Force Quit**. Open the **Application Folder**, select **Microsoft Teams**, and move it to the **Trash**.

## What about Office 365 plans that don’t include Microsoft Teams?

Some Office 365 plans include Office, but don’t include the Teams service. For example, the Office 365 Business plan. In that case, a free trial version of Teams that’s valid for 1 year is available. Your users can start using it when they sign in to Teams. For more information about this free trial version and providing your users access to it, see [Manage the Microsoft Teams Commercial Cloud Trial offer](https://docs.microsoft.com/microsoftteams/iw-trial-teams).

## Additional information about installing Microsoft Teams

- There is no change to new or existing installations of Office 2019, such as Office Professional Plus 2019.
- Teams is installed with Office 365 ProPlus in the same way that Teams is installed if you use the [MSI-based installer for Teams](https://docs.microsoft.com/MicrosoftTeams/msi-deployment). For each new user that signs into the device, the Teams installer runs and the Teams application is installed in the user's AppData folder.
- To complete the installation of Teams, either restart the device or have the user log off and log back on.
- The architecture (sometimes referred to as the *bitness*) of Teams and Office 365 ProPlus installed on the device don't have to match. For example, you can install the 32-bit version of Teams on a device running the 64-bit versions of Office 365 ProPlus. To change the architecture of Teams, for example from 32-bit to 64-bit, you need to uninstall the 32-bit version of Teams and then install the 64-bit version of Teams.
- For more information for IT Pros about Microsoft Teams, see [Microsoft Teams documentation](https://docs.microsoft.com/MicrosoftTeams/Microsoft-Teams).
- You can also use PowerShell to remove Teams from a device running Windows, as shown in this [script sample](https://docs.microsoft.com/microsoftteams/scripts/powershell-script-teams-deployment-clean-up).
