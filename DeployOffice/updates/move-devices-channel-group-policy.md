---
title: Copilot - Move a subset of devices to Current Channel with Group Policies
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Guide for admins on switching devices to Current Channel for Microsoft 365 Apps using group policies"
ms.date: 08/31/2023
---

# Move devices to Current Channel using Group Policies

## Overview
At this time, participants of the [Microsoft 365 Copilot Early Access Program (EAP)](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/) must be on the latest supported release of Current Channel for Microsoft 365 Apps. This article provides configuration guidance and best practices on how to prepare Microsoft 365 Apps for the Copilot EAP using Active Direct-based group policies.

> [!NOTE]
> This article is solely focused on preparing your Microsoft 365 Apps for the Copilot Early Access Program (EAP). Other Copilot initiatives are not covered by this documentation.

> [!NOTE]
> The policies and configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Scope
This article covers how to move a subset of devices to Current Channel for Microsoft 365 Apps, using Active Directory-based group policies. Using the Office Cloud Policy service isn't possible, as this service doesn't support machine-wide settings. If you're managing your Microsoft 365 Apps updates through other technologies, refer to the articles on [Intune](move-devices-channel-intune.md), [Configuration Manager](move-devices-channel-ConfigMgr.md) or [Servicing Profiles](move-devices-channel-servicingprofiles.md).

If you are managing your Microsoft 365 Apps updates through other technologies, please refer to the articles on Intune, Configuration Manager or Servicing Profiles.

## Pre-Checks
Before you begin, confirm that you have addressed the following requirements:
1.	Keep up to date with the latest version of the[ ADMX templates for Microsoft 365 Apps](https://www.microsoft.com/en-us/download/details.aspx?id=49030).
2.	There are no conflicting policies being applied through other group policy objects or Intune configuration profiles.

## Implementation
### Create a security group
Create a security group as described in [Create a Group Account in Active Directory](/windows/security/operating-system-security/network-security/windows-firewall/create-a-group-account-in-active-directory). Add all computer objects that should move to Current Channel. You have to specify computer objects, using user objects doesn't work, as the group policy settings are applied on machine level.

### Create a new Group Policy Object
Create a new Group Policy Object with the settings to switch Microsoft 365 Apps to Current Channel. 
1.	Open the Group Policy Management console.
2.	Create a new Group Policy Object and give it a name (for example, Microsoft 365 Apps – Current Channel).
3.	Edit the policy and navigate to: **Computer Configuration > Policies > Administrative Templates > Microsoft Office 2016 (Machine) > Updates**.
4.	Configure the following settings:

|**Setting Name**  |**Configuration**  |
|:---|:---|
|Enable Automatic Updates|Enabled|
|Hide option to enable or disable updates|Enabled|
|Hide update notifications|Disabled|
|Office 365 Client Management|Disabled|
|Update Channel|Enabled → Current Channel|
|Update Deadline|Enabled → 1|
|Update Path|Enabled → `http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60`|
|Target Version|Disabled|

5.	Close the editor and review the **Settings** tab for your new GPO.

## Apply Security Filtering
Next apply security filtering to ensure that only in-scope devices are targeted. Otherwise other devices might switch to Current Channel as well.
1.	Open the Group Policy Management console.
2.	Select the GPO that you created
3.	Select the **Scope** tab to view the GPO's scope.
4.	Under the **Security Filtering** section, remove any entries that aren't the security group that you want to filter the GPO by.
5.	Add the security group that you have created previously.

## Linking to OU and Link order
Finally, link the group policy object to an Organizational Unit (OU) which contains all targeted devices.
1.	Navigate to the desired OU, to which you want to link a GPO.
2.	Right click on this OU and select **Link an existing GPO**.
3.	In the **Select GPO** dialog under Group Policy Objects, select the GPO and Select **OK**.
4.	Review the Linked Group Policy Objects and review the Link Order.
5.	Review if the newly added GPO has the highest possible Link Order (for example, **Link Order** equals 1). This way other policies with potentially conflicting settings are overruled.

## Validation
The final step is to test the GPO's application and if the update channel switches to Current Channel automatically.
1.	Boot or reboot a computer that belongs to the security group.
2.	Sign-in to the device, open a command prompt and run the "gpupdate /force" command to refresh the group policy settings.
3.	Open the Registry Editor and navigate to Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\ office\16.0\Common\officeupdate and verify if keys like updatebranch and updatepath exist and have the desired values.
4.	Open the Task Scheduler, navigate to Microsoft\Office and run the Office Automatic Update 2.0 task manually.
5.	Switch back to the registry and navigate to Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration.
6.	The value UpdateChannelChanged should have switched to True, indicating that the Update Engine is aware of the pending update channel change.

The Microsoft 365 Apps perform the full update channel switch within the next 24 hours. Devices switch from any channel to the latest build released into the Current Channel. Other apps like Visio, Project or Access Runtime are migrated to Current Channel as well and are updated in the same pass.

## More resources
Microsoft 365 Copilot
- [Introducing the Microsoft 365 Copilot Early Access Program and new capabilities in Copilot](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](./change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube
