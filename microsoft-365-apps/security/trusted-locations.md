---
title: "Trusted Locations for Office files"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
description: "Provides guidance to Office admins about Trusted Locations in Office apps."
ms.date: 05/24/2024
---

# Trusted Locations for Office files

***Applies to:*** *Microsoft 365 Apps, Office LTSC 2021, Office 2019, and Office 2016*

Trusted Locations is a feature of Office where files contained in these folders are assumed safe, such as files you create yourself or saved from a trustworthy source. These files bypass threat protection services, bypass file block settings, and all active content is enabled. This means files saved in Trusted Locations aren't opened in [Protected View](https://support.microsoft.com/topic/d6f09ac7-e6b9-4495-8e43-2bbcdbcb6653) or [Application Guard](https://support.microsoft.com/topic/9e0fb9c2-ffad-43bf-8ba3-78f785fdba46).

[Active content](https://support.microsoft.com/office/b7ff2e8a-4055-47d4-8c7d-541e19f62bea) can include unsigned add-ins, VBA macros, connections to external data and more. Ensure you trust the original source of the file before saving it to a Trusted Location. It's important as all active content is enabled, and users don't receive notifications about potential security risks. The following diagram shows the trust workflow for opening Office files.

:::image type="content" source="../security/media/trusted-locations/trusted-locations-flowchart.png" alt-text="A screenshot of a flowchart detailing the process and conditions for opening files from trusted locations and managing active content based on various policies.":::

As shown in Step 2, files in Trusted Locations bypass all other security and policy checks. Therefore, Trusted Locations should be used rarely, for unique situations and only for select users. In the [security baseline](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/bg-p/Microsoft-Security-Baselines) for Microsoft 365 Apps for enterprise, the guidance is to disable network-based Trusted Locations. Then, if needed, control Trusted Locations centrally through policy and don't allow users to set Trusted Locations themselves.

## Planning steps for Trusted Locations

Trusted Locations enable all content within a file, including add-ins, ActiveX controls, hyperlinks, links to data sources and media, and VBA macros. Files that are opened from Trusted Locations skip file validation checks, File Block checks, and don't open in Protected View or Application Guard. There are different levels of trust you can allow in your organization for Trusted Locations:

- Allow end users to create Trusted Locations on their device or network themselves
- Use policy to prevent users from creating Trusted Locations
- Use policy to centrally manage Trusted Locations
- Disable Trusted Locations

It’s important to choose the scenarios that are best for your organization and its security risk tolerance.

> [!NOTE]
> Some Trusted Locations are created by default when Office is installed. For a list of those Trusted Locations, see [Default Trusted Locations for Office apps](#default-trusted-locations-for-office-apps).

To implement Trusted Locations, you must determine:

- The Office apps for which you want to configure Trusted Locations.
- The folders that you want to designate as Trusted Locations.
- The folder sharing and folder security settings that you want to apply to your Trusted Locations.
- The restrictions that you want to apply to Trusted Locations.

### Determine the Office apps for which you want to configure Trusted Locations

You can view the list of Trusted Locations by going to **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Trusted Locations** in the following Office apps:

- Access
- Excel
- PowerPoint
- Visio
- Word

Policies are available to manage Trusted Locations for each of these Office apps. For more information, see [Use policy to manage Trusted Locations](#use-policy-to-manage-trusted-locations).

> [!NOTE]
> Policies are also available for Project, but Project doesn't have **Trusted Locations** settings in the Trust Center.

### Determine the folders to designate as Trusted Locations

Here are some considerations to keep in mind when determining which folders to use as Trusted Locations:

- Unless blocked by policy, users can create and modify Trusted Locations in the Trust Center for their Office app. For more information, see [Add, remove, or change a trusted location](https://support.microsoft.com/office/7ee1cdc2-483e-4cbb-bcb3-4e7c67147fb4).

- By default, only Trusted Locations local to the user's device are allowed. Network locations can also be set as a Trusted Location, but not recommended.

- We don't recommend that users specify root folders as Trusted Locations. For example, the C: drive or the My Documents folder. Instead, create a subfolder within those folders and specify only that folder as a Trusted Location.

- One or more applications can use the same Trusted Location.

- You can use the [Trusted Location #1](#trusted-location-1-policy) policy to designate Trusted Locations for your users.

### Determine folder sharing and folder security settings for Trusted Location folders

All folders that you specify as Trusted Locations must be secured to prevent malicious users from adding or modifying files in a Trusted Location.

If a folder is shared, configure sharing permissions so that only authorized users have access to the shared folder.

Be sure to use the principle of least privilege and grant permissions that are appropriate to a user. Grant Read permission to users who don't need to modify files in Trusted Locations. Give Full Control permission to users who must edit files.

## Use policy to manage Trusted Locations

There are several policies that you can use to manage Trusted Locations in your organization.
- [Trusted Location #1](#trusted-location-1-policy)
- [Allow Trusted Locations on the network](#allow-trusted-locations-on-the-network-policy)
- [Disable all trusted locations](#disable-all-trusted-locations-policy)

You can use Cloud Policy, the Microsoft Intune admin center, or the Group Policy Management Console to configure and deploy policy settings to users in your organization. For more information, see [Tools available to manage policies](internet-macros-blocked.md#tools-available-to-manage-policies).

> [!NOTE]
> For volume licensed versions of Office 2016, such as Office Professional Plus 2016, you can use the Office Customization Tool (OCT) to configure Trusted Locations. For more information, see [Office Customization Tool (OCT) 2016 Help: Office security settings](../customization-tool/oct-2016-help-office-security-settings.md).

There are separate policies for Trusted Locations for each Office application. The following table shows where each policy can be found in the Group Policy Management Console under User Configuration\Policies\Administrative Templates.

|Application|Policy location |
|---------|---------|
|Access|Microsoft Access 2016\Application Settings\Security\Trust Center\Trusted Locations|
|Excel|Microsoft Excel 2016\Excel Options\Security\Trust Center\Trusted Locations|
|PowerPoint|Microsoft PowerPoint 2016\PowerPoint Options\Security\Trust Center\Trusted Locations|
|Project|Microsoft Project 2016\Project Options\Security\Trust Center|
|Visio|Microsoft Visio 2016\Visio Options\Security\Trust Center|
|Word|Microsoft Word 2016\Word Options\Security\Trust Center\Trusted Locations|

Configure the [Allow mix of policy and user locations](#allow-mix-of-policy-and-user-locations-policy) policy to determine whether both users and admins, or only admins, can define Trusted Locations.

### "Trusted Location #1" policy

You can use this policy to specify the path for a Trusted Location for users in your organization. There are 20 instances of this policy. For example, Trusted Location #1, Trusted Location #2, Trusted Location #3, etc.

By default, these policies are blank. To add a Trusted Location, enable the policy and specify the path to the Trusted Location. Make sure that the location that you specify is secured, by setting permissions so that only the appropriate users can add Office files to that location.

Trusted Locations that you specify with this policy appear under the **Policy Locations** section under **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Trusted Locations**.

> [!NOTE]
> - You can use environment variables when specifying a Trusted Location.
> - These 20 policies are also available under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings\Trust Center. If you use this version of the policy, the policy applies to all the apps that support Trusted Locations.

### "Allow Trusted Locations on the network" policy

This policy controls whether Trusted Locations on the network can be used.

By default, Trusted Locations on network locations are disabled. But users can change this setting by going to **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Trusted Locations** and selecting the **Allow Trusted Locations on my network (not recommended)** checkbox.

Which state you choose for the policy determines the level of protection you're providing. The following table shows the level of protection you get with each state.

|Icon|Protection level|Policy state|Description|
|-----|---------|---------|---------|
|:::image type="content" source="./media/trusted-locations/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::| Protected **[recommended]**|Disabled | Blocks Trusted Locations on network locations, including any configured by the admin (for example, by using the "Trusted Location #1" policy). </br></br> Ignores any network locations set by users as Trusted Locations in the Trust Center, and prevents users from adding more.|
|:::image type="content" source="./media/trusted-locations/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected|Enabled|Allows network locations as Trusted Locations to be set both by users and by policy.|
|:::image type="content" source="./media/trusted-locations/icon-partially-protected.png" alt-text="A screenshot of an orange icon with a checkmark indicating that the content is partially protected.":::| Partially protected |Not Configured|By default, users are blocked from adding network locations as Trusted Locations, but could enable this setting by selecting the **Allow Trusted Locations on my network (not recommended)** checkbox in the Trust Center |

We recommend setting this policy to **Disabled** as part of the [security baseline](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/bg-p/Microsoft-Security-Baselines) for Microsoft 365 Apps for enterprise. You should disable this policy for most users and only make exceptions for certain users as needed.

You can specify web folders as Trusted Locations. But only those web folders that support Web Distributed Authoring and Versioning (WebDAV) or FrontPage Server Extensions Remote Procedure Call (FPRPC) protocols are recognized as Trusted Locations.

### "Disable all trusted locations" policy

This policy can be used to disable all Trusted Locations.

By default, Trusted Locations are available, and users can designate any location as a Trusted Location and a device can have any combination of user-created and admin-configured Trusted Locations.

Which state you choose for the policy determines the level of protection you're providing. The following table shows the level of protection you get with each state.

|Icon|Protection level|Policy state|Description|
|-----|---------|---------|---------|
|:::image type="content" source="./media/trusted-locations/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::| Protected |Enabled |All Trusted Locations are blocked.|
|:::image type="content" source="./media/trusted-locations/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected|Disabled|A user or device can have a combination of Trusted Locations created by the user or configured by the admin (for example, by policy). |
|:::image type="content" source="./media/trusted-locations/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected |Not Configured|This setting is the Office default. Provides the same behavior as **Disabled**.|

Organizations that have a highly restrictive security environment typically set this policy to **Enabled**.

### "Allow mix of policy and user locations" policy

This policy controls whether Trusted Locations can be defined by users and by admins (for example, by policy), or if Trusted Locations can only be defined by policy.

This policy can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings\Trust Center in the Group Policy Management Console.

Which state you choose for the policy determines the level of protection you're providing. The following table shows the level of protection you get with each state.

|Icon|Protection level|Policy state|Description|
|-----|---------|---------|---------|
|:::image type="content" source="./media/trusted-locations/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::| Protected **[recommended]**|Disabled |Only Trusted Locations defined by policy are allowed. |
|:::image type="content" source="./media/trusted-locations/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected|Enabled|A user or device can have a combination of Trusted Locations created by the user or configured by the admin (for example, by policy).  |
|:::image type="content" source="./media/trusted-locations/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected |Not Configured|This setting is the Office default. Provides the same behavior as **Enabled**. |

We recommend setting this policy to **Disabled** as part of the [security baseline](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/bg-p/Microsoft-Security-Baselines) for Microsoft 365 Apps for enterprise. You should disable this policy for most users and only make exceptions for certain users as needed.

## Default Trusted Locations for Office apps

Several folders are designated as default Trusted Locations in an installation of Office. The default Trusted Locations are listed in tables for the following applications.

- [Access](#default-trusted-locations-for-access)
- [Excel](#default-trusted-locations-for-excel)
- [PowerPoint](#default-trusted-locations-for-powerpoint)
- [Word](#default-trusted-locations-for-word)

There are no default Trusted Locations for Project or for Visio.

You can see these folders by going to **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Trusted Locations**.

### Default Trusted Locations for Access

The following table lists the default Trusted Locations for Access and whether the subfolders are also trusted.
  
|**Default trusted location**|**Folder description**|**Subfolders trusted?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office\Root\Office16\ACCWIZ |Wizard databases  |No (Disallowed)  |

### Default Trusted Locations for Excel

The following table lists which folders are the default Trusted Locations for Excel and whether the subfolders are also trusted.
  
|**Default trusted locations**|**Folder description**|**Subfolders trusted?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office\Root\Templates  |Application templates  |Yes (Allowed)  |
|Users\\_user_name_\Appdata\Roaming\Microsoft\Templates  |User templates  |No (Disallowed)  |
|Program Files\Microsoft Office\Root\Office16\XLSTART  |Excel startup  |Yes (Allowed)  |
|Users\\_user_name_\Appdata\Roaming\Microsoft\Excel\XLSTART  |User startup  |No (Disallowed)  |
|Program Files\Microsoft Office\Root\Office16\STARTUP  |Office startup  |Yes (Allowed)  |
|Program Files\Microsoft Office\Root\Office16\Library  |Add-ins  |Yes (Allowed)  |

### Default Trusted Locations for PowerPoint

The following table lists the default Trusted Locations for PowerPoint and whether the subfolders are also trusted.
  
|**Default trusted locations**|**Folder description**|**Subfolders trusted?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office\Root\Templates  |Application templates  |Yes (Allowed)  |
|Users\\_user_name_\Appdata\Roaming\Microsoft\Templates  |User templates  |Yes (Allowed)  |
|Users\\_user_name_\Appdata\Roaming\Microsoft\Addins  |Add-ins  |No (Disallowed)  |
|Program Files\Microsoft Office\Root\Document Themes 16  |Application themes  |Yes (Allowed)  |

### Default Trusted Locations for Word

The following table lists the default Trusted Locations for Word and whether the subfolders are also trusted.
  
|**Default trusted locations**|**Folder description**|**Subfolders trusted?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office\Root\Templates  |Application templates  |Yes (Allowed)  |
|Users\\_user_name_\Appdata\Roaming\Microsoft\Templates  |User templates  |No (Disallowed)  |
|Users\\_user_name_\Appdata\Roaming\Microsoft\Word\Startup  |User startup  |No (Disallowed)  |