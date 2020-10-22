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

As an admin, you often have to manage more than one [update channel](../overview-update-channels.md) for Microsoft 365 Apps in your organization. Or you may have to move devices to a new channel and need a way to see and manage devices by channel with minimal overhead and effort. This article shows how to implement [dynamic collections](https://docs.microsoft.com/mem/configmgr/core/clients/manage/collections/create-collections) in Microsoft Endpoint Configuration Manager to:
- Set up collections that automatically add and remove devices based on the installed update channel.
- Set up a collection that automatically add all devices running Microsoft 365 Apps for easier update targeting.
- Set up a collection that hold all devices on update channels that your IT department doesn't support.

For dynamic collections, Configuration Manager automatically evaluates the membership of devices based on rules and queries. No manual work is required to keep these collections up to date. This implementation will enable you to:
- Easily identify and target devices based on their currently installed update channel.
- When devices switch update channels, you can easily check progress just by looking at the number of devices per collection.
- Identify devices that are on undesired update channels and implement actions to correct configuration drift.
- Reduce admin effort by targeting the right set of devices with updates automatically.

This article includes an example as well as step-by-step instructions to set up dynamic collections.

## Example

Let’s assume that your organization has deployed Microsoft 365 Apps to several thousand devices. You run a mix of [Semi-Annual Enterprise Channel (Preview)](../overview-update-channels.md#preview-upcoming-new-features-of-semi-annual-enterprise-channel) (SAEC-P) and [Semi-Annual Enterprise Channel](../overview-update-channels.md#semi-annual-enterprise-channel-overview) (SAEC), and you want to adopt the recently introduced [Monthly Enterprise Channel](../overview-update-channels.md#monthly-enterprise-channel-overview) (MEC). A few devices in your environment run Current Channel, even though it's not supported by your IT department.

In this scenario, we would implement five dynamic collections in Configuration Manager:
- Three collections to add devices as members when the device is running a specific update channel, one each for SAEC-P, SAEC, and MEC.
- One collection to catch all devices running Microsoft 365 Apps to make deploying updates for all update channels easier. Devices will download matching updates only.
- One collection to capture devices running any update channel other than the three that are supported by the IT department.

We'll use these collections to deploy Configuration Manager applications and updates:
- To the SAEC and SAEC-P collections, we'll deploy applications that will trigger a channel change to MEC. Once the channel change has been done, the devices will automatically leave the old collection and get added to the MEC collection.
- The collection that catches all Microsoft 365 App installations can be used to deploy updates for all supported channels. Configuration Manager will deem updates that don't match the update channel of the device as not applicable, so devices will only download matching updates. Devices that are about to change channels will also be able to perform the required update to the new channel automatically.
- The collection that catches devices that have configuration drift can be used to force such devices back to update channels that are supported by IT.

## Implement collections that catch devices on a certain update channel

Follow these steps to create a dynamic collection that will add devices based on a specific, installed update channel. After the collection is set up, devices will be added and dropped automatically. This enables you to see and target all devices on a certain channel easily.

1. Navigate to **Assets and Compliance**, select **Device Collections** and then **Create Device Collection** on the **Home** menu.
2. Provide a name and choose a limiting collection. Select **Next**.
3. Select **Add Rule** and choose **Query Rule**. Provide a **Name** and select **Edit Query Statement**. Then select **Show Query Language**.
4. Paste the following sample query into the editor window.
   ```sql
   select * from SMS_R_System inner join SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS on SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS.ResourceId = SMS_R_System.ResourceId where SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS.cfgUpdateChannel = "ReplaceThis"
   ```

5. Replace the ***ReplaceThis*** string in the query with the matching update channel value for the channel that you want to capture in this collection from the following table:

   |Update channel                           |Update channel value                                                  |
   |:----------------------------------------|:---------------------------------------------------------------------|
   |Beta Channel                             |http://officecdn.microsoft.com/pr/5440fd1f-7ecb-4221-8110-145efaa6372f|
   |Current Channel (Preview)                |http://officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be|
   |Current Channel                          |http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60|
   |Monthly Enterprise Channel               |http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6|
   |Semi-Annual Enterprise Channel (Preview) |http://officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf|
   |Semi-Annual Enterprise Channel           |http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114|

   The final query should look similar to the following screenshot. Make sure to keep the quotation marks.

   ![Screenshot from Configuration Manager Wizard showing the query editor](../images/fieldnotes/dyncollection-1.png)

7. Select **OK** and then **OK** again. We recommend that you select the incremental updates check box, but this is optional.
8. Select **Summary**, **Next**, and then **Close** to complete the wizard.

Repeat these steps for each update channel that you want to be captured in a separate collection. The result will look like this:

![Screenshot from Configuration Manager showing three collections](../images/fieldnotes-dyncollection-2.png)

## Implement a collection that catches all devices running Microsoft 365 Apps

Follow these steps to create a dynamic collection that will add all devices that have Microsoft 365 Apps for enterprise installed. After the collection is set up, devices will be added and dropped automatically. This enables you to target Microsoft 365 Apps client updates easily.

1. Navigate to **Assets and Compliance**, select **Device Collections** and then **Create Device Collection** on the **Home** menu.
2. Provide a name and choose a limiting collection. Select **Next**.
3. Select **Add Rule** and choose **Query Rule**. Provide a **Name** and select **Edit Query Statement**. Then select **Show Query Language**.
4. Paste the following sample query into the editor window.

   ```sql
   select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier,      SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System inner join SMS_G_System_OFFICE_PRODUCTINFO on SMS_G_System_OFFICE_PRODUCTINFO.ResourceID = SMS_R_System.ResourceId where SMS_G_System_OFFICE_PRODUCTINFO.IsProPlusInstalled = 1
   ```
   > [!NOTE]
   > This sample query checks for Microsoft 365 Apps for enterprise. You might want to adjust the query for other licenses.

5. Select **OK** and then **OK** again. We recommend that you select the incremental updates check box, but this is optional.
6. Select **Summary**, **Next**, and then **Close** to complete the wizard.

The result is a collection that will automatically add all devices that are running Microsoft 365 Apps regardless of their update channel.

## Implement a collection that catches all devices running other update channels

After you create collections for the update channels that you support, you might also want to create one to catch all devices that are running other channels. This can help you find configuration drift and implement measures to reestablish the desired configuration on those devices.

1. Navigate to **Assets and Compliance**. Select **Device Collections** and then **Create Device Collection** on the **Home** menu.
2. Provide a name and select a limiting collection. Select **Next**.
3. Select **Add Rule** and choose **Include Collections**. Select the collection that you created to catch all devices running Microsoft 365 Apps. Select **OK**.
4. Select **Add Rule** again and choose **Select Exclude Collections**. Select the collections you created that catch devices on supported update channels. Select **OK**.

   ![Screenshot from Configuration Manager showing the wizard to include and exclude collections with previously created collections](../images/fieldnotes-dyncollection-3.png)

5. Select **OK** again. We recommend that you select the incremental updates check box, but this is optional.
6. Select **Summary**, **Next**, and then **Close** to complete the wizard.

This collection will now automatically add all devices that have Microsoft 365 Apps installed but are not a member of one of the other collections that we created. This collection will catch all devices that are running on an update channel that you haven't created a separate collection for.

## Deploy applications and updates

Based on our example scenario, the next steps could be:
- Deploy an application that instructs the device to [perform a channel change](../change-update-channels.md#change-the-update-channel-with-configuration-manager) to Monthly Enterprise Channel as "available" to the collection that holds SAEC and SAEC-P devices. This enables users to switch channels on their own terms and at their own pace. You'll see the devices transitioning to the new collection automatically.
- Deploy an application that allows a user to revert from, for example, Monthly Enterprise Channel to Semi-Annual Enterprise Channel in case there are problems. If your devices are receiving updates from the Office CDN, you can use the same approach as described previously. If you manage updates by using Configuration Manager, you must offer a reinstall of Microsoft 365 Apps to users, because Configuration Manager [can't perform a downgrade](../change-update-channels.md#considerations-when-changing-channels) for the installed build version.
- [Deploy updates](../manage-microsoft-365-apps-updates-configuration-manager.md) from all the update channels that you support to the collection that holds all devices running Microsoft 365 Apps. It's important to *not* deploy updates to the individual collections, because devices that are undergoing performing a channel change must have access to the target update to complete the transition. Devices will only download applicable updates. So if a device is offered SEAC, SAEC-P and MEC updates, it will only download the delta from the update channel that the device is currently on or is instructed to switch to. Updates from other channels won't be downloaded.
- Deploy an application that reinstalls the desired Microsoft 365 Apps configuration (for example, Monthly Enterprise Channel) to the collection that holds all devices that have configuration drift.

>[!Note]
>- If the configuration of a device is changed, there are two timers that are relevant on the Configuration Manager side:
>
>   - First, the device must upload the [hardware inventory](https://docs.microsoft.com/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory), which includes the information about the selected update channel.
>
>    - Second, the Configuration Manager infrastructure must recalculate the memberships of the collections.
>
> - "Update channels supported by the IT department" in this article refers to channels that the IT department supports as approved configurations in the organization. The created collection will not catch devices that are running an unsupported build of the Microsoft 365 Apps.
