---
title: "Accounts in the new Outlook for Windows"
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
description: "Provides an overview of supported accounts in the new Outlook for Windows"
ms.date: 11/09/2023
---

# Accounts in the new Outlook for Windows 

When users toggle into the new Outlook for Windows from the classic Outlook or from Windows Mail and Calendar apps, they'll see their list of accounts. If supported, they can authenticate these accounts in new Outlook. Users coming from the classic Outlook for Windows see supported accounts only from the primary profile. If users have secondary profiles, accounts in those profiles can be manually added to the new Outlook. Users might need to re-sign into accounts that can't be automatically authenticated via Windows Single Sign On.

## Supported account types 

The preview version of the new Outlook for Windows supports the following account types: 

- **Microsoft 365 work and school accounts (Exchange Online)** 
- **Outlook.com / Hotmail** 
- **Gmail** 
- **Yahoo** 
- **iCloud** 
- **Other accounts connecting via IMAP** 

:::image type="content" source="../get-started/media/supported-account-types/add-email-accounts.png" alt-text="Screenshot of the list of supported email accounts." lightbox="../get-started/media/supported-account-types/add-email-accounts-lb.png":::

Currently, POP and on-premises Exchange accounts aren't supported. When attempting to add an account that isn't supported, an error message is displayed: **We couldn’t reach the email server. Please try again.** 

Accounts associated with SKUs that don't carry licenses for Outlook client apps are also not supported. If users attempt to add those accounts, they see an error: **This account is not supported in Outlook for Windows due to the license provided by your work or school. Try to login with another account or go to [Outlook on the web](https://outlook.office.com/)**.

Shared and delegated mailboxes can be opened from the folder list. Right click on the account name with shared mailbox permission, and select **Add shared folder or mailbox** to open.

## Protecting organization data 

The new Outlook doesn't currently support functionality that enables users to move or copy items between accounts, including: 

- Move or copy item between accounts 
- Reply or forward message from a different account 
- Attach files from document/file storage from a different account 

When you compose a new email, if you change the ‘From:’ field to another mailbox, then a new compose window opens using the newly selected account. This design is intended to prevent accidentally performing an action on the wrong account in new Outlook. 

Cross-account functionality is being planned, including the functionality mentioned previously. These actions are manageable by organizations who want to enable adding of multiple accounts but want to disable cross-account functionality. These capabilities will be announced, along with their corresponding admin controls, ahead of rollout in the app.

## Prevent adding personal accounts 

Prevent end users from adding personal accounts once their work or school account is added in the new Outlook for Windows by setting the “PersonalAccountsEnabled” OwaMailboxPolicy parameter to `$false`. For more information, see [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy#-personalaccountsenabled).

Any personal accounts that have already been added by end users remain connected. We're working on a change to place these accounts into a disconnected state, based on the same “PersonalAccountsEnabled” parameter (no new parameter needs to be set).

## Policy management with multiple accounts 

Admins can use Exchange PowerShell cmdlets and Cloud Policy to configure features and policies for multiple mailbox accounts in their organization. To manage app-wide settings, the designated account must be set as primary. While features like Focused Inbox and Loop are specific to each account, disabling in-product feedback for any account makes it unavailable for all accounts.
For more information, see [Policy management](/DeployOffice/outlook/manage/policy-management#accounts-and-policies).
