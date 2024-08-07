---
title: "Troubleshoot shared mailboxes in new Outlook"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection:
- Tier3
- deploy-new-outlook
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides steps to troubleshoot and enable shared mailbox in new Outlook using OWAMailboxPolicy settings and PowerShell commands"
ms.date: 02/06/2024
---

# Troubleshoot shared mailboxes in new Outlook

Shared mailboxes are used when multiple people need access to the same mailbox. This setup is useful for emails dedicated to company information, support, reception desk, or other functions that multiple people share. An administrator can grant users permission to send email from the shared mailbox. This feature is useful for help and support mailboxes, allowing emails to be sent from "Contoso Support" or "Building A Reception Desk."

For more information about shared mailboxes, see [About shared mailboxes](/microsoft-365/admin/email/about-shared-mailboxes)

## Use default OWAMailboxPolicy

This example enables the new Outlook for Windows for all mailboxes, including shared mailboxes in the organization:
```powershell
Get-OwaMailboxPolicy | Set-OwaMailboxPolicy -OneWinNativeOutlookEnabled $true
```

For detailed syntax and parameter information, see [Get-OwaMailboxPolicy](/powershell/module/exchange/get-owamailboxpolicy) and [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy).

## Use custom OWAMailboxPolicy

If only a subset of users within your organization use new Outlook and shared mailboxes, you need to create a custom OWAMailboxPolicy. For more information, see [Create a mailbox policy in Exchange Online for Outlook on the web and the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/create-outlook-web-app-mailbox-policy)

## PowerShell

Create the policy by using the following syntax:
```powershell
New-OwaMailboxPolicy -Name "<Unique Name>"
```

This example creates a mailbox policy for Outlook on the web and the new Outlook for Windows named SharedMailboxPolicy.

```powershell
New-OwaMailboxPolicy -SharedMailboxPolicy
```

Enable OneWinNativeOutlookEnable:
```powershell
Set-OWAMailboxPolicy “SharedMailboxPolicy” -OneWinNativeOutlookEnable $true
```

Confirm OneWinNativeOutlookEnable is applied to the new policy:
```powershell
Get-OWAMailboxPolicy SharedMailboxesPolicy | FL *onewin*
```

Apply the new OWAMailboxPolicy on the shared mailbox: 
```powershell
Set-CASMailbox -<sharedmailbox Identity> -OWAMailboxPolicy “SharedMailboxPolicy”
```

With this newly applied OWAMailboxPolicy, users can access and add shared mailboxes using new Outlook.
