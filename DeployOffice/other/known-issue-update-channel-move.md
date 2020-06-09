---
title: "(Known Issue) Some Semi-Annual Enterprise Channel devices moved to Current Channel if receiving updates from Configuration Manager"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
---

# (Known Issue) Some Semi-Annual Enterprise Channel devices moved to Current Channel if receiving updates from Configuration Manager

> [!IMPORTANT]
> - The information in this article only applies to organizations that received [Message center](https://go.microsoft.com/fwlink/p/?linkid=2070717) post MC215291 on June 4, 2020.
> - If you don’t use Configuration Manager to deploy updates for Microsoft 365 Apps by using Windows Server Update Services (WSUS) and Office COM, or if you're using Group Policy to specify an update channel for your devices, then this issue doesn’t apply to your organization and no action is needed on your part.

In the last few months, we contacted you about helping you move certain devices in your organization from Semi-Annual Enterprise Channel to Current Channel. We intended to move only devices configured to get updates directly from the Office Content Delivery Network (CDN) on the internet and only when **Current Channel** was selected on the **Office software download settings** page in the Microsoft 365 admin center. 

While we were able to assist you in moving those devices to Current Channel, we recently identified an issue with some devices that are configured to receive updates from Configuration Manager. For those devices, we might have inadvertently moved those devices in your organization from Semi-Annual Enterprise Channel to Current Channel.

> [!NOTE]
> Prior to June 9, 2020, Current Channel was named Monthly Channel and Semi-Annual Enterprise Channel was named Semi-Annual Channel.

We’re contacting you to let you know about this issue. We're providing you with steps to help you identify devices that shouldn't have been moved. Also, while Current Channel is our recommended update channel, we're providing you with the steps to bring those devices back to their original update channel (Semi-Annual Enterprise Channel) or to another update channel of your choosing.

We’ve made the appropriate changes to our code so that this issue doesn’t affect you or any other customers in the future.

## Which devices are affected by this issue?

This issue only affects devices that are configured to receive updates for Microsoft 365 Apps by using Microsoft Endpoint Configuration Manager in conjunction with Windows Server Update Services (WSUS).

For Configuration Manager to be able to manage these updates, an Office COM object needs to be enabled on the device where Microsoft 365 Apps is installed. The Office COM object takes commands from Configuration Manager to download and install the updates.

Also, not all devices that get updates from Configuration Manager are affected. For example, if you use Group Policy to specify an update channel for your devices, then those devices are not affected by this issue.

## What is the impact of this issue?

This issue could affect devices in your organization in two possible ways:

- Devices could be moved inadvertently from Semi-Annual Enterprise Channel to Current Channel.
- Devices could get stuck trying to move to Current Channel, and in doing so, ***stop receiving any updates, including security updates***. These devices will still appear to be on Semi-Annual Enterprise Channel.

> [!IMPORTANT]
> We recommend that you identify, as soon as possible, any of the devices that are stuck trying to move to Current Channel and aren’t currently receiving any updates. It’s important that you identify these devices and fix the issue so that those devices can start receiving updates again, especially security updates. Tuesday June 9, 2020 is the next date when we plan to release security updates for Microsoft 365 Apps.

## How to determine if a device is affected by this issue

To determine if a device is affected by this issue, you need to look at several locations in the registry on the device on which Microsoft 365 Apps is installed. A device is affected by this issue only if ***ALL*** of the following conditions are true:

- HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration
  - Key: UnmanagedUpdateURL does exist

***and***

- HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate
  - Key: officemgmtcom does exist and the value is 1
  - Key: updatepath does NOT exist
  - Key: updatetargetversion does NOT exist
  - Key: updatebranch does NOT exist

 ***and***

- HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cloud\Office\16.0\common\officeupdate does NOT exist

## How to resolve this issue on devices that are affected

There are three options available to you for resolving this issue:

- [Keep the devices on Current Channel](#how-to-keep-the-devices-on-current-channel)
- [Move the devices to Monthly Enterprise Channel](#how-to-move-the-devices-to-monthly-enterprise-channel)
- [Move the devices back to Semi-Annual Enterprise Channel](#how-to-move-the-devices-back-to-semi-annual-enterprise-channel)


For more information about each of these update channels, see [Overview of update channels for Microsoft 365 Apps](../overview-update-channels.md).

### How to keep the devices on Current Channel

If you want to keep the devices on Current Channel, we recommend that you stop using Configuration Manager to manage updates to Microsoft 365 Apps. Instead, we recommend that you allow these devices to receive updates directly from the Office Content Delivery Network (CDN) on the internet.

To do receive updates directly from the Office CDN, you need to disable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).

After you disable the Office COM object, the device will start receiving updates directly from the Office CDN instead of from Configuration Manager.

### How to move the devices to Monthly Enterprise Channel

If you want to move the devices to Monthly Enterprise Channel, we recommend that you stop using Configuration Manager to manage updates to Microsoft 365 Apps. Instead, we recommend that you allow these devices to receive updates directly from the Office Content Delivery Network (CDN) on the internet.

To move a device to Monthly Enterprise Channel, do the following steps:

1. Enable the Update Channel policy setting and select Monthly Enterprise Channel. For more information, [Change the update channel with Group Policy](../change-update-channels.md#change-the-update-channel-with-group-policy). *(If you have Microsoft 365 Apps for business installed, [change the update channel with the Office Deployment Tool](../change-update-channels.md#change-the-update-channel-with-the-office-deployment-tool-odt).)*
2. Disable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).

After you disable the Office COM object, the device will start receiving updates for Monthly Enterprise Channel directly from the Office CDN instead of receiving updates from Configuration Manager.

If you want to move a device to Monthly Enterprise Channel and continue to use Configuration Manager to manage updates, do the following steps:

1. Enable the Update Channel policy setting and select Monthly Enterprise Channel. For more information, [Change the update channel with Group Policy](../change-update-channels.md#change-the-update-channel-with-group-policy). *(If you have Microsoft 365 Apps for business installed, [change the update channel with the Office Deployment Tool](../change-update-channels.md#change-the-update-channel-with-the-office-deployment-tool-odt).)*
2. Disable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).
3. Allow the device to update to Monthly Enterprise Channel.
4. After the device is updated to Monthly Enterprise Channel, re-enable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).

### How to move the devices back to Semi-Annual Enterprise Channel

If you want to move the devices back to Semi-Annual Enterprise Channel and start using the Office CDN to provide updates instead of using Configuration Manager, do the following steps:

1. Enable the Update Channel policy setting and select Semi-Annual Enterprise Channel. For more information, [Change the update channel with Group Policy](../change-update-channels.md#change-the-update-channel-with-group-policy). *(If you have Microsoft 365 Apps for business installed, [change the update channel with the Office Deployment Tool](../change-update-channels.md#change-the-update-channel-with-the-office-deployment-tool-odt).)*
2. Disable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).

After you disable the Office COM object, the device will start receiving updates for Semi-Annual Enterprise Channel directly from the Office CDN instead of receiving updates from Configuration Manager.

If you want to move the devices back to Semi-Annual Enterprise Channel and continue to use Configuration Manager to manage updates, do the following steps:

1. Enable the Update Channel policy setting and select Semi-Annual Enterprise Channel. For more information, [Change the update channel with Group Policy](../change-update-channels.md#change-the-update-channel-with-group-policy). *(If you have Microsoft 365 Apps for business installed, [change the update channel with the Office Deployment Tool](../change-update-channels.md#change-the-update-channel-with-the-office-deployment-tool-odt).)*
2. Disable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).
3. Allow the device to update to Semi-Annual Enterprise Channel.
4. After the device is updated to Semi-Annual Enterprise Channel, re-enable the Office COM object. For more information, see [How to disable or re-enable the Office COM object](#how-to-disable-or-re-enable-the-office-com-object).

### How to disable or re-enable the Office COM object

You can disable and re-enable the Office COM object either through Group Policy or through Configuration Manager. Which one you use depends on which one you originally used to enable the Office COM object.

Whichever option you use, you must restart the service named Microsoft Office Click-to-Run Service after you have made a change.

#### Configure Office COM object by using Group Policy

To disable the Office COM object by using Group Policy, use the Group Policy Management console and disable the *Management of Microsoft 365 Apps for enterprise* policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

To re-enable the Office COM object after the devices have updated to the desired update channel, enable the *Management of Microsoft 365 Apps for enterprise* policy setting.

#### Configure Office COM object by using Configuration Manager

To disable the Office COM object by using Configuration Manager, do the following steps:

1. In the Configuration Manager console, go to **Administration** > **Overview** > **Client Settings**.
2. Open the appropriate device settings to enable the client agent. For more information about default and custom client settings, see [How to configure client settings in Microsoft Endpoint Configuration Manager](https://docs.microsoft.com/mem/configmgr/core/clients/deploy/configure-client-settings).
3. Choose **Software Updates** and select **No** for the **Enable management of the Office 365 Client Agent** setting.

To re-enable the Office COM object after the devices have updated to the desired update channel, set **Enable management of the Office 365 Client Agent setting** back to **Yes**.

## Related topics

- [Manage updates to Microsoft 365 Apps with Microsoft Endpoint Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md)
- [Overview of update channels for Microsoft 365 Apps](../overview-update-channels.md)
- [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date)
- [Release notes for Microsoft 365 Apps Security Updates](https://docs.microsoft.com/officeupdates/microsoft365-apps-security-updates)