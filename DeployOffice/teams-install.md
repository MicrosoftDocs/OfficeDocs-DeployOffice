---
title: "Deploy Microsoft Teams with Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overview of how Microsoft Teams is automatically installed with Office 365 ProPlus."
---

# Deploy Microsoft Teams with Office 365 ProPlus

In the past, Microsoft Teams was a separate installation from Office 365 ProPlus. But, starting in March 2019 with Version 1902, Teams is included as part of ***new*** installations of Office 365 ProPlus. If Teams is already installed on the device, no changes are made to that installation of Teams.

If Skype for Business is already installed on the device, Skype for Business won’t be removed and will continue to function as before. Also, Skype for Business will continue to be installed with new installations of Office 365 ProPlus, unless you configure your installation to exclude it.

> [!IMPORTANT]
> Starting in the second half of June 2019, if you're using Monthly Channel, then Teams will be added to ***existing*** installations of Office 365 ProPlus (and Office 365 Business) when you update your existing installation to the latest version. For more information, see [What about existing installations of Office?](#what-about-existing-installations-of-office)


## When will Microsoft Teams start being installed with Office 365 ProPlus?

The date when Teams starts being installed with ***new*** installations of Office 365 ProPlus depends on which update channel you’re using. The following table shows the schedule, which is subject to change.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Monthly Channel |Version 1902 | March 4, 2019  |
|Semi-Annual Channel (Targeted)| Version 1902   | March 12, 2019  |
|Semi-Annual Channel| Version 1902  |*July 9, 2019* |

If you're ready to deploy Teams to the users in your organization, you don't have to wait until you deploy Version 1902 of Office 365 ProPlus. If you want to install Teams to an existing installation of Office 365 ProPlus, you can have your users install Teams for themselves from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads), or you can deploy it for them by [following these instructions](https://docs.microsoft.com/MicrosoftTeams/msi-deployment).

> [!NOTE]
> Teams is already installed by default for ***new*** installations of the following:
> - Office 365 Business, starting with Version 1901, which was released on January 31, 2019. Office 365 Business is the version of Office that is included with the Office 365 Business and Office 365 Business Premium plans.
> - Office for Mac, starting with Version 16.21, which was released on January 16, 2019. Office for Mac comes with any plan that includes Office 365 Business or Office 365 ProPlus. For more information, see [Microsoft Teams installations on a Mac](#microsoft-teams-installations-on-a-mac).

## How to exclude Microsoft Teams from being installed with Office 365 ProPlus on devices running Windows

If you don’t want Teams installed when you install Office 365 ProPlus on devices running Windows, you need to use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) and use the [ExcludeApp element](configuration-options-for-the-office-2016-deployment-tool.md#excludeapp-element) in your configuration.xml file, as shown in the following example.

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

If you’re letting your users install Office 365 ProPlus for themselves from the Office 365 portal, you can’t exclude Teams from being installed by default.

If you want to remove Teams after it’s been installed, you can go to **Control Panel** > **Uninstall** a program. Select **Microsoft Teams** and then choose **Uninstall**. If you’re logged in with local administrator permissions on the computer, Teams will be uninstalled for all users. If you’re only logged in with user permissions, Teams is only uninstalled for that user.

The guidance above in this section also applies to Office 365 Business.

## What about existing installations of Office 365 ProPlus on devices running Windows?

Starting in the second half of June 2019, if you're using Monthly Channel, then Teams will be added to ***existing*** installations of Office 365 ProPlus (and Office 365 Business) when you update your existing installation to the latest version.

For example, if you're using Version 1904 in Monthly Channel and you update to Version 1906 in July, Teams will be installed on the device as part of the update to Version 1905.

The date when Teams starts being added to ***existing*** installations of Office 365 ProPlus depends on which update channel you’re using. The following table shows the forecasted schedule, which is subject to change.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Monthly Channel |Version 1906<sup>*</sup> | *Late June 2019*  |
|Semi-Annual Channel (Targeted)| *To be determined*  | *September 2019*  |
|Semi-Annual Channel| *To be determined*  |*January 2020* |

<sup>*</sup> For Office 365 Business, Teams will be added starting with Version 1905 in the 2nd half of June 2019.

If you don't want Teams to be added to ***existing*** installations of Office 365 ProPlus when you update to a new version, use the Office Deployment Tool and the following configuration.xml. You need to run the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) in /configure mode on each device before you update to the new version.

```xml
<Configuration>
   <Add Version="MatchInstalled">
      <Product ID="O365ProPlusRetail">
       <Language ID="MatchInstalled" TargetProduct="O365ProPlusRetail" />
       <ExcludeApp ID="Teams" />
      </Product>
   </Add>
</Configuration>
```

> [!IMPORTANT]
> - Be sure you're using the most current version of the Office Deployment Tool available on the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117).
> - If your existing installation of Office 365 ProPlus has excluded other apps, such as Access, you need to include a line in your configuration.xmi file for each of those excluded apps. Otherwise, those apps will be installed on the device.
> - We are working on a policy setting that you can use with Group Policy or the [Office cloud policy service](overview-office-cloud-policy-service.md) to make it easier to exclude Teams from being installed as part of an update. We'll update this article with more information about that policy setting once it's available.

Also, in some situations, doing an Online Repair results in Teams being installed. For example, if Office is configured to get updates from the Office Content Delivery Network (CDN) and the update channel you're using supports the default installation of Teams.

## Feature and quality updates for Microsoft Teams

After Teams is installed, it's automatically updated approximately every two weeks with new features and quality updates. This update process for Teams is different than the update process for the other Offices apps, such as Word and Excel. How often those apps get feature and quality updates depends on which [update channel](overview-of-update-channels-for-office-365-proplus.md) they’re on.

## Microsoft Teams installations on a Mac

If you're using Version 16.21, or later, of the Office suite install package to deploy on a Mac, Teams will be installed by default.

If you don’t want Teams installed by default, there is an Office suite install package available that doesn't include Teams. You can also use the install packages for individual applications, such as Word or Excel. For links to the most current install packages, see [Update history for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac).  

If you’re letting your users install Office for themselves on a Mac, such as from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads), you can’t exclude Teams from being installed by default.

To uninstall Teams on a Mac, quit Teams by right-clicking the Teams app in the dock, then hold down Option and choose **Force Quit**. Open the **Application Folder**, select **Microsoft Teams**, and move it to the **Trash**.

## What about Office 365 plans that don’t include Microsoft Teams?

Some Office 365 plans include Office, but don’t include the Teams service. For example, the Office 365 Business plan. In that case, a free trial version of Teams that’s valid for 1 year is available. Your users can start using it when they sign in to Teams. For more information about this free trial version and providing your users access to it, see [Manage the Microsoft Teams Commercial Cloud Trial offer](https://docs.microsoft.com/microsoftteams/iw-trial-teams).

## Additional information about installing Microsoft Teams

- There is no change to new or existing installations of Office 2019, such as Office Professional Plus 2019.
- Teams is installed with Office 365 ProPlus in the same way that Teams is installed if you use the [MSI-based installer for Teams](https://docs.microsoft.com/MicrosoftTeams/msi-deployment). For each new user that signs into the device, the Teams installer runs and the Teams application is installed in the user's AppData folder.
- The architecture (sometimes referred to as the *bitness*) of Teams and Office 365 ProPlus installed on the device don't have to match. For example, you can install the 32-bit version of Teams on a device running the 64-bit versions of Office 365 ProPlus. To change the architecture of Teams, for example from 32-bit to 64-bit, you need to uninstall the 32-bit version of Teams and then install the 64-bit version of Teams.
- For more information for IT Pros about Microsoft Teams, see [Microsoft Teams documentation](https://docs.microsoft.com/MicrosoftTeams/Microsoft-Teams).
- You can also use PowerShell to remove Teams from a device running Windows, as shown in this [script sample](https://docs.microsoft.com/microsoftteams/scripts/powershell-script-teams-deployment-clean-up).
