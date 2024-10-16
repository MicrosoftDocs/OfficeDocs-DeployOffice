---
title: "Monitor adoption"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier1
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Instructions for tracking usage of new Outlook for Windows by users in organizations."
ms.date: 08/23/2024
---

# Monitor adoption of new Outlook for Windows in your organization

You might be interested in viewing new Outlook usage in your organization. We're working on adding usage reporting in the Microsoft 365 admin center to enable organizations to monitor usage and migration from classic to new Outlook for Windows. In the meantime, a workaround to offer these insights is available through Microsoft Entra ID reporting.

## View new Outlook usage with Microsoft Entra ID reporting

Microsoft Entra ID reporting can be filtered to the application ID in this dashboard. You must have a Microsoft Azure subscription and a **Report reader** role to view the report.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com/#home).
1. Select **Identity** > **Monitoring & health** > **Sign-in logs**.
1. Under **Sign-in events**, select **User sign-ins (non-interactive)**.
1. Select **Add filters**, and in the Pick a field window, select **Application**, and then select **Apply**.
1. In the Application window, enter **Microsoft Outlook** and select **Apply**. The results show all login events for new Outlook.
1. To ensure these entries are for new Outlook, select an entry from the list of results. In the **Active Details: Sign-ins** pop-out, scroll to find the **Application ID**. The Application ID showing **5d661950-3475-41cd-a2c3-d671a3162bc1** is the ID for new Outlook, and it confirms the user signed-in using new Outlook.

    :::image type="content" source="media/outlook-entra-signindetails.png" alt-text="Screenshot of Activity Details: Sign-ins window showing Application and Application ID entries.":::

Results are limited to 100,000 items. If the results exceed that, you can filter to a shorter time period using the **Date** filter.

### Check what version of new Outlook is being used

To identify which versions of new Outlook users in your organization are running, do the following in **Identity** > **Monitoring & health** > **Sign-in logs**:

1. Under **Sign-in events**, select **User sign-ins (interactive)**.
1. Select **Add filters**. In the Pick a field window select **User**, and then select **Apply**.
1. In the User window, enter the name of the user you want to filter to, and select **Apply**. The returned results show all sign-in events for a particular user.
1. Select a sign-in entry from the list of results. In **Activity Details: Sign-ins**, under the **Basic info** tab, scroll down to **User agent**.
1. Note the version number used for OneOutlook. This number should match the user's new Outlook version. To see what version they're using, open new Outlook on the user's device and select **Settings** > **General** > **About Outlook**.