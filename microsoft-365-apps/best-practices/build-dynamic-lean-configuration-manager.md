---
title: Build dynamic collections for Microsoft 365 Apps with Configuration Manager
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Build dynamic collections for Microsoft 365 Apps with Configuration Manager"
ms.date: 05/25/2024
---

# Build dynamic collections for Microsoft 365 Apps with Configuration Manager

> [!NOTE]
> Authored by the Microsoft 365 Apps Rangers, this article outlines common practices observed across customer implementations. We advise assessing the relevance of this guidance for your organization and adapting the approach as necessary.

Managing Microsoft 365 Apps in larger organizations can be a complex task. You might have to support multiple update channels, have multiple Office releases in your environment at the same time, or have to identify and remediate devices that are showing a configuration drift. This article will share some best practices on how to use Microsoft Configuration Manager's [dynamic collections](/mem/configmgr/core/clients/manage/collections/create-collections) to simplify management. For dynamic collections, Configuration Manager will add and remove devices to and from collections based on a set of rules and queries. These dynamic collections update themselves automatically and always provide a current view into your environment.

This article covers the following scenarios:

- [Set up collections that automatically add and remove devices based on installed update channel](build-dynamic-lean-configuration-manager.md#catch-devices-on-specific-update-channels). This helps you to quickly identify how many devices are running on a given channel.
- [Set up a collection that automatically captures all devices running Microsoft 365 Apps](build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps). This helps you to easily target Microsoft 365 Apps updates, especially if you support multiple update channels in your organization. If you have a mixed environment, such as with devices still running Office 2016, this makes proper targeting to Microsoft 365 Apps only easier as well.
- [Set up a collection that captures all devices on update channels which your IT department doesn't support](build-dynamic-lean-configuration-manager.md#catch-devices-on-other-update-channels). In case you don't support all available update channels in your organization, this implementation helps you to quickly identify and mitigate any configuration drift.
- [Set up a collection that captures all devices running outdated builds](build-dynamic-lean-configuration-manager.md#catch-devices-on-builds-below-a-certain-threshold). This collection will show all devices that are running a release of the Microsoft 365 Apps below a certain build. This can be used to quickly identify devices that are lacking updates or must be updated to a certain minimum build.

For each scenario, you'll find a detailed step-by-step guide as well as some notes on how these collections can be put to work.

## Catch devices on specific update channels

Follow these steps to create a dynamic collection that will capture devices that run Office on a specific update channel. After the collection is set up, devices will be added and dropped automatically. This enables you to see and target all devices on a certain channel easily. We recommend that you set up one collection per update channel that you manage.

Once those collections are set up, you can use them to publish applications which allow users to initiate an [update channel change](../updates/change-update-channels.md#change-the-update-channel-with-configuration-manager). You can also deploy the application as required, in case you want to switch away from an update channel completely. For example, you can move from [Semi-Annual Enterprise Channel (Preview)](../updates/overview-update-channels.md#preview-upcoming-new-features-of-semi-annual-enterprise-channel) and [Semi-Annual Enterprise Channel](../updates/overview-update-channels.md#semi-annual-enterprise-channel-overview) to [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview). We also have [detailed guidance for switching to Monthly Enterprise Channel](switch-to-monthly-enterprise-channel.md) available.

Here's how to implement these collections:

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

   :::image type="content" source="./media/build-dynamic-lean-configuration-manager/build-dynamic-lean-configuration-manager-1.png" alt-text="A screenshot from Configuration Manager Wizard showing the query editor.":::

7. Select **OK** and then **OK** again. We recommend that you select the incremental updates check box, but this is optional.
8. Select **Summary**, **Next**, and then **Close** to complete the wizard.

Repeat these steps for each update channel that you want to be captured in a separate collection. The result might look like this:

:::image type="content" source="./media/build-dynamic-lean-configuration-manager/build-dynamic-lean-configuration-manager-2.png" alt-text="A screenshot from Configuration Manager showing three collections.":::

## Catch devices running Microsoft 365 Apps

Follow these steps to create a dynamic collection that will add all devices that have Microsoft 365 Apps for enterprise installed. After the collection is set up, devices will be added and dropped automatically. For example, when you're currently migrating to Microsoft 365 Apps, there's no need for manual maintenance of such a collection anymore.

It's a common practice to use this collection for deploying [Microsoft 365 Apps updates](../updates/manage-microsoft-365-apps-updates-configuration-manager.md) for all channels supported by your organization. This allows each device to fetch the matching update, but ignore (and not download) updates from other channels. This will also cover the scenario that a device is switching channels. In this state, the device is still on the previous channel, but must be able to access the latest update from the targeted channel to finalize transition. Deploying updates to the individual, per-channel collections would break such scenarios. During download, the device will use delta compression, so only required chunks will be downloaded, not the complete update source.

Here's how to implement this collection:

1. Navigate to **Assets and Compliance**, select **Device Collections** and then **Create Device Collection** on the **Home** menu.
2. Provide a name and choose a limiting collection. Select **Next**.
3. Select **Add Rule** and choose **Query Rule**. Provide a **Name** and select **Edit Query Statement**. Then select **Show Query Language**.
4. Paste the following sample query into the editor window.

   ```sql
   select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System inner join SMS_G_System_OFFICE_PRODUCTINFO on SMS_G_System_OFFICE_PRODUCTINFO.ResourceID = SMS_R_System.ResourceId where SMS_G_System_OFFICE_PRODUCTINFO.IsProPlusInstalled = 1
   ```
   > [!NOTE]
   > This sample query checks for Microsoft 365 Apps for enterprise. You might want to adjust the query for other licenses.

5. Select **OK** and then **OK** again. We recommend that you select the incremental updates check box, but this is optional.
6. Select **Summary**, **Next**, and then **Close** to complete the wizard.

The result is a collection that will automatically add all devices that are running Microsoft 365 Apps for enterprise regardless of their update channel.

## Catch devices on other update channels

After you created collections for the update channels that you support, you might also want to create one to catch all devices that are running other channels. This can help you identify and remediate configuration drift. For this we use the collections from above. We take all devices running Microsoft 365 Apps and subtract the devices that are on update channels that you support internally. This leaves all devices that are on other update channels in this collection. You can then use this collection to deploy, for example a required application which performs a reinstallation of Microsoft 365 Apps to get the device back onto an approved update channel.

1. Navigate to **Assets and Compliance**. Select **Device Collections** and then **Create Device Collection** on the **Home** menu.
2. Provide a name and select a limiting collection. Select **Next**.
3. Select **Add Rule** and choose **Include Collections**. Select the collection that you created to [catch all devices running Microsoft 365 Apps](build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps). Select **OK**.
4. Select **Add Rule** again and choose **Select Exclude Collections**. Select the collections you created that [catch devices on supported update channels](build-dynamic-lean-configuration-manager.md#catch-devices-on-specific-update-channels). Select **OK**.

   :::image type="content" source="./media/build-dynamic-lean-configuration-manager/build-dynamic-lean-configuration-manager-3.png" alt-text="A screenshot from Configuration Manager showing the wizard to include and exclude collections with previously created collections.":::

5. Select **OK** again. We recommend that you select the incremental updates check box, but this is optional.
6. Select **Summary**, **Next**, and then **Close** to complete the wizard.

This collection will now automatically add all devices that have Microsoft 365 Apps installed but aren't a member of one of the other collections that we created. This collection will catch all devices that are running on an update channel that you haven't created a separate collection for.

## Catch Devices on builds below a certain threshold

Follow these steps to create a dynamic collection that will capture devices that run a release of the Microsoft 365 Apps below a certain version. After the collection is set up, devices will be added and dropped automatically. This enables you to see and target e.g. outdated devices for updates or if you need to ensure that all devices are above a certain build, e.g. to enable new features.

Here's how to implement this collection:
1.	Navigate to **Assets and Compliance**, select **Device Collections** and then **Create Device Collection** on the **Home** menu.
2.	Provide a name and choose a limiting collection. Select **Next**.
3.	Select **Add Rule** and choose **Query Rule**. Provide a **Name** and select **Edit Query Statement**. Then select **Show Query Language**.
4.	Paste the following sample query into the editor window.

   ```sql
    select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from SMS_R_System inner join SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS on SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS.ResourceID = SMS_R_System.ResourceId where SMS_G_System_OFFICE365PROPLUSCONFIGURATIONS.VersionToReport < "16.0.13127.21064"
   ```
5.	Adjust the build number to fit your needs. Refer to the [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date) to identify the minimum build you're interested in. The **Update history** page lists builds without the leading "16.0.", ensure to add this to the value you want to use in your query. So it should always be in the format of 16.0.xxxxx.yyyyy.

   > [!NOTE]
   > Devices on Semi-Annual Enterprise Channel might have a far lower build number than devices on Current Channel, even when running the latest build. You can exclude devices on Semi-Annual Enterprise Channel by adding the collection holding these devices as an exclusion.

6.	Select **OK** and then **OK** again. We recommend that you select the incremental updates check box, but this is optional.
7.	Select **Summary**, **Next**, and then **Close** to complete the wizard.

After the membership calculation has finished, you can easily see all devices running a build lower the configured threshold. You can now use this collection to e.g. deploy Microsoft 365 Apps client updates to it, trigger Client Policy cycles or investigate why those devices aren't updating to the latest version.

## Notes

- If the configuration of a device is changed, there are two timers that are relevant on the Configuration Manager side:
    - First, the device must upload the [hardware inventory](/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory), which includes the information about the selected update channel.
    - Second, the Configuration Manager infrastructure must recalculate the memberships of the collections.
- "Update channels supported by the IT department" in this article refers to channels that the IT department supports as approved configurations in the organization. The created collection won't catch devices that are running a build which is no longer supported by Microsoft.
