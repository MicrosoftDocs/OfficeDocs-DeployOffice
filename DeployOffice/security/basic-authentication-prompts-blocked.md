---
title: "Basic authentication sign-in prompts are blocked by default in Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: tier1
ms.localizationpriority: medium
description: "Provides guidance for admins about how Office blocks Basic authentication sign-in prompts."
ms.date: 08/30/2022
---

# Basic authentication sign-in prompts are blocked by default in Microsoft 365 Apps

> [!NOTE]
> The information in this article is related to Message center post MC454810, which was published in the [Microsoft 365 admin center](https://admin.microsoft.com/AdminPortal/Home#/MessageCenter) on November 1, 2022 and updated on November 16, 2022.

Apps such as Word and Excel allow users to use Basic authentication to connect to resources on web servers by sending usernames and passwords with each request. These credentials are often stored on the servers, making it easier for attackers to capture them and reuse them against other endpoints or services.

Basic authentication is an outdated industry standard and doesn't support more robust security features, such as multifactor authentication. The threats posed by it have only increased and there are better and more effective user authentication alternatives. For example, modern authentication, which supports multifactor authentication, smart cards, and certificate-based authentication.

Therefore, to help improve security in Microsoft 365 Apps, we’re changing its default behavior to block sign-in prompts from Basic authentication.

With this change, if users try to open files on servers that only use Basic authentication, they won't see any Basic authentication sign-in prompts. Instead, they'll see a message that the file has been blocked because it uses a sign-in method that may be unsecure. The message will include a link that takes users to an article that contains information about the security risks of Basic authentication.

> [!NOTE]
> - File shares hosted on Windows aren't affected by this change because the authentication method used is NTLM.
> - SharePoint Online, OneDrive, and on-premises SharePoint Server (configured for modern authentication) aren't affected by this change.
> - On-premises SharePoint Server configured for Basic authentication is affected by this change.

## Versions of Microsoft 365 Apps affected by this change

This change affects the following apps only on devices running Windows:

- Access
- Excel
- OneNote
- Outlook
- PowerPoint
- Project
- Publisher
- Visio
- Word

> [!NOTE]
> - This change doesn’t affect Outlook connecting to on-premises Exchange Server using Basic authentication.
> - This change doesn’t affect Outlook connecting to Exchange Online using Basic authentication. There is a separate effort to deprecate Basic authentication with Exchange Online. For more information, see [Basic authentication deprecation in Exchange Online](../endofsupport/microsoft-365-services-connectivity.md#basic-authentication-deprecation-in-exchange-online).

As part of the rollout, users will initially get a warning message if they try to access a file using Basic authentication. After that warning period, the user will be blocked from opening the file and will see a message telling them the source uses a sign-in method that may be unsecure.

The following table shows the version, for each update channel, in which the warning and blocking changes will be implemented. Information in italics is subject to change.

| Update channel                           | Warning version                                | Blocking version                                  |
|-------------------------------------------|-------------------------------------------------|----------------------------------------------------|
| Current Channel (Preview)                | Version 2212<br/> (released December 8, 2022)  | *Version 2304* <br/> *(first half of April 2023)* |
| Current Channel                          | Version 2301 <br/> (released January 26, 2023) | *Version 2305* <br/> *(second half of May 2023)*  |
| Monthly Enterprise Channel               | *Version 2301* <br/> *(March 14, 2023)*        | *Version 2305* <br/> *(July 11, 2023)*            |
| Semi-Annual Enterprise Channel (Preview) | *Version 2308* <br/> *(September 12, 2023)*    | *Version 2402* <br/> *(March 12, 2024)*           |
| Semi-Annual Enterprise Channel           | *Version 2308* <br/> *(January 9, 2024)*       | *Version 2402* <br/> *(July 9, 2024)*             |

> [!NOTE]
> - This change will also affect retail versions of Office 2021, Office 2019, and Office 2016. They're on the same schedule as Current Channel.
> - This change won't affect volume licensed versions of Office, such as Office LTSC Professional Plus 2021 or Office Standard 2019.

## How Microsoft 365 Apps determines whether to show Basic authentication prompts

The following flowchart graphic shows how Microsoft 365 Apps determines whether to open a file if the server uses Basic authentication.

![Flowchart diagram that shows how Microsoft 365 Apps determines whether to show Basic authentication prompts](../images/security/basic-auth-flow.png)

The following steps explain the information in the flowchart graphic.

1. A user tries to open a file that is stored on a web server.

2. If the server is using Basic authentication proxy authentication, Microsoft 365 Apps evaluates the state of the [Allow Basic Authentication prompts from network proxies](#allow-basic-authentication-prompts-from-network-proxies) policy.
   - If the policy is set to Enabled, the user is prompted to provide a username and password to open the file.
   - Otherwise, the user doesn't see a sign-in prompt and the file is blocked from opening. Instead, the user will see a message that the file has been blocked because it uses a sign-in method that may be unsecure.

3. If the server isn't using Basic authentication, the file opens. If the server uses Basic authentication, Microsoft 365 Apps will check if a policy exists to allow Basic authentication prompts.

4. If the server is authenticating directly with Basic authentication, Microsoft 365 Apps evaluates the state of the [Allow specified hosts to show Basic Authentication prompts to Office apps](#allow-specified-hosts-to-show-basic-authentication-prompts-to-office-apps) policy.
   - If the policy is set to Enabled and the server is specified, the user is prompted to provide a username and password to open the file.
   - Otherwise, the user doesn't see a sign-in prompt and the file is blocked from opening. Instead, the user will see a message that the file has been blocked because it uses a sign-in method that may be unsecure.

## Use policies to manage Basic authentication prompts

If you need to provide Basic authentication prompts for certain hosts or from network proxies, you can configure the following policies:

- [Allow specified hosts to show Basic Authentication prompts to Office apps](#allow-specified-hosts-to-show-basic-authentication-prompts-to-office-apps)
- [Allow Basic Authentication prompts from network proxies](#allow-basic-authentication-prompts-from-network-proxies)

> [!IMPORTANT]
> - We don't recommend allowing Basic authentication prompts for certain hosts or from network proxies, because using Basic authentication isn't secure.
> - But you can use these policies if you need to provide these prompts temporarily while you move those servers to more secure authentication methods.

These policies can be found in the Group Policy Management Console under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings.

> [!NOTE]
> - To use these policies, download at least version 5359.1000 of the [Group Policy Administrative Template files (ADMX/ADML) for Microsoft 365 Apps](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center. That version was released on August 11, 2022.
> - You can also implement these policies by using Cloud Policy. For more information, see [Overview of Cloud Policy service for Microsoft 365](../admincenter/overview-cloud-policy.md).

### Allow specified hosts to show Basic Authentication prompts to Office apps

This policy allows you to specify which hosts can show Basic authentication sign-in prompts to apps such as Word and Excel.

The following table shows the level of protection you get with each state of the policy.

|Icon|Protection level|Policy state|Description|
|-----|---------|---------|---------|
|![Green circle with white check mark](../images/security/icon-protected.png)| Protected |Enabled </br>(no hosts specified) |Users will be blocked from opening files located on web servers that use Basic authentication. |
|![Orange circle with white check mark](../images/security/icon-partially-protected.png)|Partially protected|Enabled </br>(hosts specified)| Basic authentication prompts will be allowed only from the hosts specified. </br></br> If you specify multiple hosts, separate them by a semi-colon.|
|![Green circle with white check mark](../images/security/icon-protected.png)| Protected |Disabled |Users will be blocked from opening files located on web servers that use Basic authentication. |
|![Green circle with white check mark](../images/security/icon-protected.png)| Protected</br> **[recommended]**|Not Configured |Users will be blocked from opening files located on web servers that use Basic authentication. |

### Allow Basic Authentication prompts from network proxies

This policy controls whether network proxies are allowed to show Basic authentication prompts.

The following table shows the level of protection you get with each state of the policy.

|Icon|Protection level|Policy state|Description|
|-----|---------|---------|---------|
|![Green circle with white check mark](../images/security/icon-protected.png)| Protected |Disabled | Network proxies won't show Basic authentication prompts.|
|![Red circle with white X](../images/security/icon-not-protected.png)| Not protected|Enabled|Network proxies will show Basic authentication prompts. |
|![Green circle with white check mark](../images/security/icon-protected.png)| Protected </br>**[recommended]**|Not Configured |Network proxies won't show Basic authentication prompts. |