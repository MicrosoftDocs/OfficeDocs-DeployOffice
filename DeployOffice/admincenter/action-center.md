---
title: "Action Center"
ms.author: dhirenb
author: dhirendra-bhupati
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
---

# Action Center

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

Action Center allows you to perform management actions such as setting the Target Version for devices with Microsoft 365 Apps in your organization.

<!-- 
## Requirements for using Action Center

The following are the requirements for using Action Center with Microsoft 365 Apps for enterprise:

* 
-->

## Steps for setting a Target version

1. Sign into the [portal](https://aka.ms/o365clientmgmt).
2. Under **Servicing**, choose **Action Center**
3. On the **Action Center** page, select **Target version**
    - Enter a name.
    - Select a Targeted channel.
    - Select a Targeted version. If you select Latest, the device will update to the latest version of this channel when new versions are released. If you select a specific version, the device will stay on this version.
    - Enter a user or AAD group name to target.
        - Note: Only [Azure AD device security groups](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal#group-types) are supported currently.
    - Select **Apply**.

## Viewing an action

The table in Action Center shows details on the action including the number of devices targeted, the channel and target version, and the progress.

To view more detailed information:

1. Select the task name.
2. View the devices targeted and the status of each device.
3. Export the devices.

<!-- 

## Limitations

>