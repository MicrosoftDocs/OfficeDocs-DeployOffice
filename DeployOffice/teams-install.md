---
title: "Deploy Microsoft Teams with Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overview of how Microsoft Teams will be automatically installed with Office 365 ProPlus."
---

# Deploy Microsoft Teams with Office 365 ProPlus

Currently, Microsoft Teams is a separate installation from Office 365 ProPlus. But, starting in late February 2019, Teams will be installed by default for ***new*** installations of Office 365 ProPlus, starting with Version 1902 in Monthly Channel.

Existing installations of Office 365 ProPlus won’t be affected at this time. If Skype for Business is already installed, Skype for Business won’t be removed and will continue to function as before. Also, Skype for Business will continue to be installed by default when you install Office 365 ProPlus.

## When will Microsoft Teams start being installed by default with Office 365 ProPlus?

The date when Teams starts being installed by default with **new** installations of Office 365 ProPlus depends on which update channel you’re using. The following table shows the forecasted schedule, which is subject to change.

| **Update channel** |**Version** |**Date**  |
|---------|---------|---------|
|Monthly Channel |Version 1902 | March 4, 2019  |
|Semi-Annual Channel (Targeted)| Version 1902   | March 12, 2019  |
|Semi-Annual Channel| Version 1902  |*July 9, 2019* |

> [!NOTE]
> Teams is already installed by default for **new** installations of the following:
> - Office 365 Business, starting with Version 1901, which was released on January 31, 2019. Office 365 Business is the version of Office that is included with the Office 365 Business and Office 365 Business Premium plans.
> - Office for Mac, starting with Version 16.21, which was released on January 16, 2019. Office for Mac comes with any plan that includes Office 365 Business or Office 365 ProPlus. For more information, see [Microsoft Teams installations on a Mac](#microsoft-teams-installations-on-a-mac).

## How to exclude Microsoft Teams from being installed by default on devices running Windows

If you don’t want Teams installed by default when you install Office 365 ProPlus on devices running Windows, you'll need to use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) and use the [ExcludeApp element](https://docs.microsoft.com/DeployOffice/configuration-options-for-the-office-2016-deployment-tool#excludeapp-element) in your configuration.xml file, as shown in the following example.

> [!IMPORTANT]
> To exclude Teams from being installed, even if you're just installing Project or Visio, you need to include the ExcludeApp element for each Office product you're installing. But, you don't need to include the ExcludeApp element in the section of your configuration.xml file where you specify language packs or proofing tools. This is a known issue with the installation process that currently requires including the ExcludeApp element for Teams in multiple places in the configuration.xml file. We're working on a fix for this issue so that repeating the ExcludeApp element for Teams in several places won't be necessary. We'll update this article when this known issue has been fixed.

```xml
<Configuration>
   <Add OfficeClientEdition="64" Channel="Monthly">
      <Product ID="O365ProPlusRetail">
       <Language ID="en-us" />
       <ExcludeApp ID="Teams" />
      </Product>
      <Product ID="VisioProRetail">
       <Language ID="en-us" />
       <ExcludeApp ID="Teams" />
      </Product>
      <Product ID="ProjectProRetail">
       <Language ID="en-us" />
       <ExcludeApp ID="Teams" />
      </Product>
      <Product ID="LanguagePack">
       <Language ID="de-de" />
      </Product>
    </Add>
</Configuration>
```

> [!TIP]
> Instead of using a text editor to create your configuration.xml, we recommend that you use the [Office Customization Tool (OCT)](https://config.office.com). The OCT provides a web-based interface for making your selections and creating your configuration.xml file to be used with the Office Deployment Tool. For more information, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md).

If you’re deploying Office 365 ProPlus by using the Office 365 Client Installation wizard in System Center Configuration Manager (Current Branch), you’ll be able to set “Teams” to “Off” in the configuration UI.

If you’re letting your users install Office 365 ProPlus for themselves from the Office 365 portal, you can’t exclude Teams from being installed by default.

If you want to remove Teams after it’s been installed, you can go to **Control Panel** > **Uninstall** a program. Select **Microsoft Teams** and then choose **Uninstall**. If you’re logged in with local administrator permissions on the computer, Teams will be uninstalled for all users. If you’re only logged in with user permissions, Teams is only uninstalled for that user.

The guidance above in this section also applies to Office 365 Business.

## What about existing installations of Office?

If Office is already installed on a device running Windows, and you initiate any other sort of installation, such as installing additional languages or installing a subscription version of Project or Visio, then Teams will get installed by default as part of that installation process, if the update channel and version you're using supports the default installation of Teams.

To exclude Teams from being installed when you add a language pack or an application, such as Project, to an existing installation of Office, you must include the ExcludeApp element as shown in the following example. This example shows a configuration.xml file that can be used to add Project and the Japanese language pack to an existing installation of Office 365 ProPlus.

> [!IMPORTANT]
> There is a known issue with the installation process that currently requires including the ExcludeApp element for Teams in multiple places in the configuration.xml file. We're working on a fix for this issue so that repeating the ExcludeApp element for Teams in several places won't be necessary. We'll update this article when this known issue has been fixed.

```xml
<Configuration>
   <Add OfficeClientEdition="64" Channel="Monthly">
      <Product ID="O365ProPlusRetail">
       <ExcludeApp ID="Teams" />
      </Product>
      <Product ID="ProjectProRetail">
       <Language ID="en-us" />
       <ExcludeApp ID="Teams" />
      </Product>
      <Product ID="LanguagePack">
       <Language ID="ja-jp" />
      </Product>
    </Add>
</Configuration>
```


If you're just applying the regular feature and quality updates for an existing installation of Office, and you don't install another product or language pack, then your existing installation of Office won’t be affected at this time. 

Also, in some situations, doing an Online Repair results in Teams being installed. For example, if Office is configured to get updates from the Office Content Delivery Network (CDN) and the update channel you're using supports the default installation of Teams.

Later this year, the plan is to add Teams to existing installations of Office as part of a regularly scheduled update. We'll provide more information about this closer to when that actually happens.

## Feature and quality updates for Microsoft Teams

After Teams is installed, it's automatically updated approximately every two weeks with new features and quality updates. This update process for Teams is different than the update process for the other Offices apps, such as Word and Excel. How often those apps get feature and quality updates depends on which [update channel](https://docs.microsoft.com/DeployOffice/overview-of-update-channels-for-office-365-proplus) they’re on.

## Microsoft Teams installations on a Mac

As of January 16, 2019, if you're using Version 16.21, or later, of the Office suite install package to deploy on a Mac, Teams will be installed by default.

If you don’t want Teams installed by default, there is an Office suite install package available that doesn't include Teams. You can also use the install packages for individual applications, such as Word or Excel. For links to the most current install packages, see [Update history for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac).  

If you’re letting your users install Office for themselves on a Mac, such as from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads), you can’t exclude Teams from being installed by default.

To uninstall Teams on a Mac, quit Teams by right-clicking the Teams app in the dock, then hold down Option and choose **Force Quit**. Open the **Application Folder**, select **Microsoft Teams**, and move it to the **Trash**.

## What about Office 365 plans that don’t include Microsoft Teams?

Some Office 365 plans include Office, but don’t include the Teams service. For example, the Office 365 Business plan. In that case, a free trial version of Teams that’s valid for 1 year is available. Your users can start using it when they sign in to Teams. For more information about this free trial version and providing your users access to it, see [Manage the Microsoft Teams Commercial Cloud Trial offer](https://docs.microsoft.com/microsoftteams/iw-trial-teams).

## Additional information about installing Microsoft Teams

- There is no change to new or existing installations of Office 2019, such as Office Professional Plus 2019.
- Teams is installed with Office 365 ProPlus in the same way that Teams is installed if you use the [MSI-based installer for Teams](https://docs.microsoft.com/MicrosoftTeams/msi-deployment). For each new user that signs into the device, the Teams installer runs and the Teams application is installed in the user's AppData folder.
- If you want to install Teams to an existing installation of Office on Windows, you can have your users install Teams for themselves from [https://teams.microsoft.com/downloads](https://teams.microsoft.com/downloads), or you can deploy it for them by [following these instructions](https://docs.microsoft.com/MicrosoftTeams/msi-deployment).
- For more information for IT Pros about Microsoft Teams, see [Microsoft Teams documentation and practical guidance](https://docs.microsoft.com/MicrosoftTeams/Microsoft-Teams).
- You can also use PowerShell to remove Teams from a device running Windows, as shown in this [script sample](https://docs.microsoft.com/microsoftteams/scripts/powershell-script-teams-deployment-clean-up).
