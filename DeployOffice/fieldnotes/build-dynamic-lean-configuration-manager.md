---
title: Build dynamic collections for Microsoft 365 Apps with Configuration Manager
author: manoth-msft
ms.author: manoth
manager: laurawi
audience: ITPro 
ms.topic: article 
ms.service: o365-proplus-itpro
localization_priority: Normal
description: "Field best practices: Build dynamic collections for Microsoft 365 Apps with Configuration Manager"
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_FieldNotes
ms.collection: 
- Ent_O365
- M365-modern-desktop
---

# Best practices from the field: Build dynamic collections for Microsoft 365 Apps with Configuration Manager

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Office.

As an admin, you often have to manage more than one [update channel](../deployoffice/overview-update-channels.md) for the Microsoft 365 Apps in your organization. Or you are planning to move devices to a new channel and need a way to manage/see devices by channel with minimal management overhead and effort.
This article will walk you through the steps to implement [dynamic collections](https://docs.microsoft.com/mem/configmgr/core/clients/manage/collections/create-collections) in Microsoft Endpoint Configuration Manager to achieve the following goals:
- Establish collections which will automatically add/remove devices based on the installed update channel of the Microsoft 365 Apps.
- Establish a collection which will automatically add/remove all devices running Microsoft 365 Apps for easier targeting of updates.
- Establish a collection which will contain all devices on update channels that you as IT does not support in your environment.
For dynamic collections, Configuration Manager will automatically evaluate the membership of devices based on rules and queries, so there is no manual work required to keep these collections up-to-date.
Such an implementation will enable you to:
- Easily identify and target devices based on their currently installed update channel.
- When devices switch update channels, you can easily monitor progress just by looking at the number of devices per collection.
- Identify devices which are on channels which your IT department has not approved for internal use and implement actions against such configuration drift.
- Reduce admin effort by targeting the right devices with updates automatically.
This article will provide an example as well as step-by-step instructions on how to set up dynamic collections.

## Example

Let’s assume your organization has deployed Microsoft 365 Apps to several thousand devices. You run a mix of [Semi-Annual Enterprise Channel (Preview)](../deployoffice/overview-update-channels.md#preview-upcoming-new-features-of-semi-annual-enterprise-channel) (SAEC-P) and [Semi-Annual Enterprise Channel](../deployoffice/overview-update-channels#semi-annual-enterprise-channel-overview.md) (SAEC) and want to adopt the recently introduced [Monthly Enterprise Channel](../deployoffice/overview-update-channels.md#monthly-enterprise-channel-overview) (MEC). You are also aware that a couple of devices run Current Channel, despite the fact this is not supported by your IT department.
In this example, we would implement five dynamic collections in Configuration Manager:
- Three collections will add devices as members when the device is running a specific update channel. In this case SAEC-P, SAEC and one for future MEC devices.
- One collection which catches all devices running Microsoft 365 Apps. This collection can be used to make updates available to all channels. Devices will automatically pick and download only matching updates.
- One collection which will capture devices running any other update channel. This collection can be used to catch any rogue devices and re-align them with what IT is supporting in your organization.
Once created, we can deploy Configuration Manager applications and updates to these collections:
- To the SAEC and SAEC-P collections we can deploy applications which will trigger a channel change to MEC. Once the channel change has been performed, devices will automatically move over to the MEC collection.
- The collection which catches all Microsoft 365 App installation can be used to deploy updates for all supported channels. As Configuration Manager will deem updates which are not matching the update channel of the device as not applicable, devices will only download updates matching their currently assigned channel. Devices which are about to change the channel, will be able to perform the required update as well automatically.
- The collection which catches "rogue" devices can be used to force such devices back onto updates channels supported by IT.
## Implement collections which catch devices on a certain update channel

1.	Navigate to **Assets and Compliance**, click on **Device Collections** and on the **Create Device Collection** button in the **Home** menu.
2.	Provide a name and select a limiting collection. Click **Next**.
3.	Click on **Add Rule** and select **Query Rule**. Provide a **Name** and click on **Edit Query Statement**. Click on **Show Query Language**.
4.	Copy paste the text below into the editor window.
```
select *  from SMS_R_System inner join SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS on SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS.ResourceId = SMS_R_System.ResourceId where SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS. cfgUpdateChannel = "ReplaceThis"
```
5.	Replace the string **ReplaceThis** with the matching Update Channel Value for the channel you want to capture in this collection from the table below:

|Update Channel                           |Update Channel Value                                                  |
|:----------------------------------------|:---------------------------------------------------------------------|
|Beta Channel                             |http://officecdn.microsoft.com/pr/5440fd1f-7ecb-4221-8110-145efaa6372f|
|Current Channel (Preview)                |http://officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be|
|Current Channel                          |http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60|
|Monthly Enterprise Channel               |http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6|
|Semi-Annual Enterprise Channel (Preview) |http://officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf|
|Semi-Annual Enterprise Channel           |http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114|

6.	The final query should look like on the screenshots below. Make sure to keep the quote signs.
7.	Click **OK**, **OK**. We recommend to tick the box for incremental updates, but this is optional.
8. Click **Summary**, **Next** and **Close** to finish the wizard.

Repeat the steps for each update channel you want to be captured in a separate collection. The result will look like this:

## Implement a collection which catches all devices running Microsoft 365 Apps

1.	Navigate to **Assets and Compliance**, click on **Device Collections** and on the **Create Device Collection** button in the **Home** menu.
2.	Provide a name and select a limiting collection. Click **Next**.
3.	Click on **Add Rule** and select **Query Rule**. Provide a **Name** and click on **Edit Query Statement**. Click on **Show Query Language**.
4.	Copy paste the text below into the editor window.
```
select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System inner join SMS_G_System_OFFICE_PRODUCTINFO on SMS_G_System_OFFICE_PRODUCTINFO.ResourceID = SMS_R_System.ResourceId where SMS_G_System_OFFICE_PRODUCTINFO.IsProPlusInstalled = 1
```
> [!NOTE]
>The query is provided as-is and based on engagements in the field. The above query checks for Microsoft 365 Apps for enterprise, you might want to adjust the query for other SKUs.
5.	Click **OK**, **OK**. We recommend to tick the box for incremental updates, but this is optional.
6.	Click **Summary**, **Next** and **Close** to finish the wizard.
The result is a collection which will automatically add all devices running any servicing channel for Microsoft 365 Apps.

## Implement a collection which catches all devices running other servicing channels

After you created collections for the updates channels you are supporting as IT, you can also craft one which is catching all devices running other channels. This can help to identify any configuration drift and implement measures to re-establish the desired configuration on those devices.
1.	Navigate to **Assets and Compliance**, click on **Device Collections** and on the **Create Device Collection** button in the **Home** menu.
2.	Provide a name and select a limiting collection. Click **Next**.
3.	Click on **Add Rule** and select **Include Collections**. Select the collection you created to catch all devices running Microsoft 365 Apps. Click **OK**.
4.	Click on **Add Rule** again and **Select Exclude Collections**. Select the collections you created which are catching devices on supported servicing channels. Click **OK**.
5.	Click **OK** again. We recommend to tick the box for incremental updates, but this is optional.
6.	Click **Summary**, **Next** and **Close** to finish the wizard.

This collection will now automatically add all devices which have Microsoft 365 Apps installed, but are not a member of one of the other collections we just created. As a result, the collection will catch all devices which are running on an update channels you have not created a separate collection for.

## Deploy applications and updates

The focus of this article is to provide you the steps to build dynamic collection using Configuration Manager. Based on the example above, next steps could be:
- Deploy an application which instruct the device to [perform a channel change](../deployoffice/change-update-channels.md#change-the-update-channel-with-configuration-manager) to Monthly Enterprise Channel as "available" to the collection holding SAEC and SAEC-P devices. This enabled users to switch the channel onto a faster cadence for themselves. You as an admin will see the device transitioning to the new collection automatically.
- Deploy an application which allows a user to revert back from e.g. Monthly Enterprise Channel to Semi-Annual Enterprise Channel in case of any issues. If your devices are receiving updates from the Office CDN, you can use the same approach as described above. If you manage updates using Configuration Manager, you must offer a re-install of the Microsoft 365 Apps to the users as Configuration Manager [cannot perform a downgrade](../deployoffice/change-update-channels.md#considerations-when-changing-channels) when it comes to the installed build version.
- [Deploy updates](../deployoffice/manage-microsoft-365-apps-updates-configuration-manager.md) from all update channels you support to the collection holding all devices running Microsoft 365 Apps. It is important to not deploy updates to the individual collections, as devices performing a channel change must have access to the target update to complete the transition. Devices will only download applicable updates, so if a device is offered SEAC, SAEC-P and MEC updates, it will only download the delta from the update channel the device is currently on or instructed to switch to.
- Deploy an application which re-install the desired Microsoft 365 Apps configuration (e.g. Monthly Enterprise Channel) to the collection which holds all devices with a configuration drift.

## Notes

- If the configuration of a device is changed, there are two timers which are relevant on the Configuration Manager side:
    - First, the device must upload the [Hardware Inventory](https://docs.microsoft.com/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory.md) which includes the information about the selected update channel.
    - Second, the Configuration Manager infrastructure must re-calculate the memberships of the collections in question.
- The term "update channel supported by IT" in this article refers to what the IT supports as an approved configuration in the organization. The created collection will not catch devices which are running an unsupported build of the Microsoft 365 Apps.
