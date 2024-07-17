---
title: "Identify COM add-ins in your organization"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier3
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "This article offers a detailed overview of Microsoft COM add-ins in classic Outlook, detailing their functionality, limitations, and the transition to web add-ins in the new Outlook for Windows."
ms.date: 04/16/2024
---

# Identify COM add-ins in your organization

This article helps you determine whether your organization and its users still rely on Microsoft COM add-ins. With these add-ins now in maintenance mode, it's important to evaluate their use within your systems. This article will assist you in identifying active COM add-ins, understanding their functions, and planning for future replacements to ensure compatibility and enhanced functionality with newer Microsoft Office technologies.

> [!NOTE]
> These COM add-ins are in maintenance mode and no new development will be done for these. The [new Outlook for Windows](https://support.microsoft.com/office/656bb8d9-5a60-49b2-a98b-ba7822bc7627) doesn't support COM add-ins, but it does support Office web add-ins. To learn more about Office Add-ins, see [Office Add-ins platform overview](/office/dev/add-ins/overview/office-add-ins).
>
> For guidance on migrating COM add-ins to web add-ins, see [Migrate from COM to web add-ins](migrate-com-to-web-addins.md).

## View installed COM add-ins

You can view the COM add-ins installed for your organization’s users via the Microsoft 365 Apps health dashboard in the [Microsoft 365 Apps admin center](https://config.office.com). To locate your installed apps, follow the instructions in [Microsoft 365 Apps health](/DeployOffice/admincenter/microsoft-365-apps-health#add-in-health.md), ensuring you filter for only the Outlook add-ins.

Individual users can find what COM add-ins are installed on their devices by navigating to **File** > **Options** > **Add-ins** in Outlook.

## Microsoft COM add-ins

The following table describes some of the most widely used COM add-ins and lists their replacements that are supported in the new Outlook for Windows. Replacements are in the form of Office web add-ins or native Outlook capabilities. For COM add-ins that are deprecated, alternative solutions are provided, if available.

| Add-in                                        | Details |
|-----------------------------------------------|---------|
| **Microsoft Teams add-in**                    | This add-in, installed by Microsoft Teams, enables the scheduling of Teams meetings from Outlook Desktop. The new Outlook for Windows features native Teams integration, allowing users to turn a meeting into a Teams meeting by activating the toggle.<br> :::image type="content" source="../get-started/media/state-of-micrososoft-com-add-ins/calendar-event-creation.small.png" alt-text="Screenshot of the Outlook calendar event creation interface. It shows options to add a title, invite attendees, set the date from February 6, 2024, at 11:00 PM to 11:30 PM, mark as an in-person event, and insert a Teams meeting." lightbox="../get-started/media/state-of-micrososoft-com-add-ins/calendar-event-creation.large.png"::: <br>Additionally, the new Outlook for Windows supports the Share to Teams web add-in that allows users to share email conversations in Teams.<br> :::image type="content" source="../get-started/media/state-of-micrososoft-com-add-ins/share-to-teams-button.png" alt-text="Close-up screenshot of a 'Share to Teams' button, illustrating the icon and functionality to share content directly to Microsoft Teams." lightbox="../get-started/media/state-of-micrososoft-com-add-ins/share-to-teams-button.png":::|
| **OneNote Notes about Outlook Items**         | This COM add-in enables the Send to OneNote feature, allowing users to transfer Outlook content, such as calendar events, emails, and contacts, to OneNote for Windows. Use cases only supported by the COM add-in include:<ul><li>Sending Outlook content to OneNote on classic Outlook while user’s device is offline.</li><li>Accessing the original Meeting Details layout that excludes integrated Microsoft 365 features, like meeting collateral and Loop Meeting Notes. The updated Meeting Details experience is available in the OneNote web add-in starting April 2024.</li><li>Opening content in OneNote for Windows after sending it from classic Outlook to OneNote. Currently, the web add-in doesn't respect app defaults.</li></ul>|
| **Microsoft Azure Information Protection (AIP)** | This add-in is being replaced with native Office integration – new Outlook for Windows supports native sensitivity labels. For more information, see [Manage sensitivity labels in Office apps](/purview/sensitivity-labels-office-apps). This COM add-in, installed with the AIP Unified Labeling client for Office, allows users to label and protect documents directly from the Office ribbon. The labeling client also offers labeling and protection for file types not covered by Azure Rights Management. Files that Office apps can't open due to protection require a separate viewer. This viewer includes features to track and revoke access to protected files. The AIP Unified Labeling add-in for Office was retired on April 11, 2024. Customers need to migrate to built-in labeling for Office apps. |
| **Dynamics 365**                              | This COM add-in was deprecated in favor of its web add-in in 2020. |
| **Microsoft Exchange Add-in**                 | This add-in supports these scenarios:<ul><li>Unified Messages: Unified Messages combine voice messaging and email messaging into one mailbox that can be accessed from many different devices.</li><li>Legacy Room Finder Protect-Before-Send Outlook protection rules: [Exchange 2013 Help](https://techcommunity.microsoft.com).</li></ul>|
| **Microsoft SharePoint Server Colleague Import Add-in** | This add-in scans your Sent Items folder to determine which colleagues are being offered on the *Add Colleagues* page on a user’s SharePoint My Site. It reached end-of-support in October 2020, and we don't expect organizations to currently rely on this add-in. |
| **Outlook Social Connector**                  | This add-in no longer works to connect to LinkedIn and other social networks. However, it still supports the scenario of keeping local contact information in sync with GAL (Global Address Library) when a user copies a contact from it into their local Contacts. This add-in isn't needed in the new Outlook for Windows because the sync issue is now natively fixed. |
| **Microsoft VBA for Outlook Addin**           | This add-in provides support for writing and managing scripts/macros within classic Outlook for Windows to run VBA. It typically invokes the Outlook Object Model. The easiest way to determine if you're using macros is to open the editor and see if anything is there. If your organization isn't using Macros in Outlook, this add-in isn't relevant. **Note**: The new Outlook for Windows doesn't support VBA. |
| **Microsoft Access Outlook Add-in for Data Collection and Publishing** | This add-in enables users to sync emails and contacts with Access. If your organization isn't using Access integration with Outlook, this add-in isn't relevant for you. |
| **Skype Meeting Add-in for Microsoft Office** | When you install Skype for Business (included with Microsoft 365 ProPlus), this add-in activates integration features, such as the New Skype Meeting button in the Calendar. Although Skype for Business Online was deprecated in 2021, on-premises organizations could continue using Skype. For organizations using Teams, this add-in is no longer relevant. |
| **Microsoft IME Outlook アドイン**              | This add-in generates the IME Dictionary for Japanese phonetic to kanji conversion. This function isn't supported in the classic Outlook for Windows in versions 1806 or later. If your organization’s users are on these versions, they don't have a dependency on this add-in when they switch to the new Outlook for Windows. |
| **Conversation History Add-in for Microsoft Office** | This add-in is required to see Skype chat items in Conversation History. If your organization is using Teams, this add-in is no longer relevant. |
