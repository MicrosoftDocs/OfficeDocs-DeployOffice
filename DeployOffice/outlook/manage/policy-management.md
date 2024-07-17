---
title: "Policy Management"
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
description: "Provides guidelines for configuring and managing mailbox accounts and features in Microsoft 365 using Exchange PowerShell cmdlets and Cloud Policy."
ms.date: 11/09/2023
---

# Policy Management
Admins can provide Windows users in your organization with a standard set of policies for New Outlook that are essential for maintaining security, productivity, and data integrity within an organization by using Exchange PowerShell cmdlets and Cloud Policy. 

Most policies configure the features that are available for the mailbox accounts in their organization and help protect company data and customize the user experience. These policies affect the configuration of any Outlook app where the organization mailbox is present. 

You can manage most features with Exchange PowerShell cmdlets. However, for features that span multiple Microsoft 365 experiences, like Loop and in-product Feedback, as well as settings for Diagnostic Data and Connected Experiences, you should use Cloud Policy. 

> [!IMPORTANT]
> Several App-wide settings, including Theme, Text Size and Spacing, and Diagnostic Data and Connected Experiences are associated with the first account added in new Outlook. This account is considered as the primary account. 
>
> While policies can be applied to any organization account in new Outlook, management of app-wide settings like Theme, Diagnostic Data, and Connected Experiences requires the designated account to be set as primary. 

> [!IMPORTANT]
> Most features like Focused Inbox and Loop are specific to each account. If you disable these features, they turn off only for that account. However, in new Outlook, other features are disabled at the organization level, for example, if any account has in-product feedback disabled, the feature becomes unavailable for all accounts. 

> [!IMPORTANT]
> Most of the mailbox policies are applicable for both OWA and Monarch, so you can’t have them enabled on one client but not the other.  


## Allow only corporate mailboxes to be added 

There are two Mailbox Policies that should be used to allow only corporate mailboxes to be added to the new Outlook: 

With the `AllowedOrganizationAccountDomains` parameter, admins can specify one or more domains, which are allowed to be added in Outlook. Check the syntax at [Set-OwaMailboxPolicy - AllowedOrganizationAccountDomains](/powershell/module/exchange/set-owamailboxpolicy#-allowedorganizationaccountdomains).

Moreover, the `PersonalAccountsEnabled` parameter specifies whether to allow users to add their personal accounts. Check the syntax at [Set-owamailboxpolicy - PersonalAccountsEnabled](/powershell/module/exchange/set-owamailboxpolicy#-personalaccountsenabled). 

## Set Primary Account 
Users can change the primary account in Settings > Accounts > Email accounts > Manage for the account they want to designate as primary.

:::image type="content" source="../manage/media/policy-management/policy-email-accounts-settings.png" alt-text="Screenshot that shows how to change the primary account in Email accounts Settings." lightbox="../manage/media/policy-management/policy-email-accounts-settings-lb.png":::

We’re rolling out a new policy, *ChangeSettingsAccountEnabled* in the `OwaMailboxPolicy` cmdlet that allows organizations to set the organization account as primary so companies can ensure their policies will be applied. For more information about this policy, see [Set-OwaMailboxPolicy - ChangeSettingsAccountEnabled](/powershell/module/exchange/set-owamailboxpolicy#-changesettingsaccountenabled).

## Disable automatic updating of weather location
The Weather Enabled parameter specifies whether to enable or disable weather information in the calendar in Outlook on the web. Check the syntax at [Set-owamailboxpolicy - WeatherEnabled](/powershell/module/exchange/set-owamailboxpolicy#-weatherenabled).

## Disable Focused Inbox
The `Set-organizationconfig: FocusedInboxOn`  cmdlet turns Focused Inbox Off in your organization. However, it doesn't block the availability of the feature for your users. If they want, they can still re-enable Focused Inbox again on each of their clients. For more information, see [Configure Focused Inbox for everyone in your organization](/microsoft-365/admin/setup/configure-focused-inbox).  

## Configure Junk settings
Junk Mail Configuration is another cmdlet on the organizational-level management that allows companies to foster an agile and adaptable IT infrastructure that is well-equipped to meet the diverse needs of a modern workforce.<br>
Admins should use the Microsoft Defender portal to [configure spam filter policies](/defender-office-365/anti-spam-policies-configure) adjusting bulk mail thresholds and configure safe senders and blocked lists using the junk email settings on Exchange Online mailboxes.<br> 
For more information, see [Set-MailboxJunkEmailConfiguration](/defender-office-365/configure-junk-email-settings-on-exo-mailboxes).
 
## Disable signatures
If admins want to prevent users from creating signatures manually, they should use Exchange PowerShell to apply the policy to the users. Setting the `-SignaturesEnabled` parameter to false disables signatures for all users in OWA. See [Set-OwaMailboxPolicy (ExchangePowerShell)](/powershell/module/exchange/set-owamailboxpolicy). 

Another option to achieve the same result is to use the Exchange administrator dashboard to edit the [Outlook Web App policies](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/create-outlook-web-app-mailbox-policy) and uncheck the ‘Email signature’ feature. <br>
In EAC, select > **Roles** > **Owa web app policies**. Open each policy details and select **Manage Features** > **User Experience** > **Uncheck Email signature** and save changes.  

## Specify calendar first day of week

`Set-MailboxCalendarConfiguration` is another cmdlet for managing various features and capabilities for Calendar, including:
- Working Hours, Work Week, Shorten appointments and meetings, etc. <br>
For more information, see [Set-MailboxCalendarConfiguration](/powershell/module/exchange/set-mailboxcalendarconfiguration). 

## Automatically configure account based on Active Directory Primary SMTP address (coming soon)
Admins are advised to configure the new policy for an easier account setup process on managed devices and to guarantee that company policies are always respected. 

Admins can set the policy *Automatically configure accounts based on Active Directory Primary SMTP* through the [Microsoft Intune admin center](https://intune.microsoft.com/) > **Apps** > **Policies for Office Apps** with the SMTP address that should be automatically configured. 

If this policy is enabled, the primary SMTP address used to sign in to Windows is suggested the first time a user adds their account to new Outlook for Windows and the user can't change it. 

By default, no default email address will be suggested.  

## Specify what attachments can be downloaded
By default, new Outlook for Windows allows you to open attached Word, Excel, PowerPoint, text files, and many media files directly. The files you open vary depending on the account settings. Admins can configure the list of file name extensions that you can open in new Outlook for Windows using the cmdlets [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy)  - `AllowedFileTypes` and `BlockedFileTypes`. 

## Disable Third party online attachments
	
The `AdditionalStorageProvidersAvailable` parameter specifies whether to allow additional storage providers (for example, Box, Dropbox, Facebook, Google Drive, Egnyte, personal OneDrive) attachments in Outlook on the web. For more information, see [Set-OwaMailboxPolicy- AdditionalStorageProvidersAvailable](/powershell/module/exchange/set-owamailboxpolicy#-additionalstorageprovidersavailable). 

## Disable Offline mode
The `OfflineEnabledWin` parameter specifies whether to allow the new Outlook for Windows to be used offline.<br> 
For more information see, [Set-OwaMailboxPolicy - OfflineEnabledWin](/powershell/module/exchange/set-owamailboxpolicy#-offlineenabledwin).

## Enable Location Suggestions
The `PlacesEnabled` parameter specifies whether to enable or disable Places in Outlook on the web. Places lets users search, share, and map location details by using Bing. <br> For more information, see [Set-OwaMailboxPolicy - PlacesEnabled](/powershell/module/exchange/set-owamailboxpolicy#-placesenabled). 

## Enable a default Theme
A theme defines the colors, fonts, and images that are displayed to users in the new Outlook for Windows and on the web. Admins can check more information on how to [Create a theme for Outlook on the web in Exchange Server | Microsoft Learn](/exchange/clients/outlook-on-the-web/themes#default-outlook-on-the-web-themes-in-exchange-2016) and then use the cmdlet [Set-OwaMailboxPolicy - DefaultTheme](/powershell/module/exchange/set-owamailboxpolicy#-defaulttheme) to set the default value.  

##  Disable Suggested Replies
`OrganizationConfig` is a cmdlet that supports a seamless user experience, as employees can transition effortlessly between devices and platforms without encountering discrepancies in functionality or accessibility for the following features:
[Set-OrganizationConfig – WebSuggestedRepliesDisabled](/powershell/module/exchange/set-organizationconfig#-websuggestedrepliesdisabled).


## Disable Microsoft Loop
[Loop components in Outlook](https://support.microsoft.com/office/use-loop-components-in-outlook-9b47c279-011d-4042-bd7f-8bbfca0cb136) are portable, editable pieces of content that stay in sync across all the places they’re shared.

For more information, see [Manage Loop components in OneDrive and SharePoint](/microsoft-365/loop/loop-components-configuration).

## Disable Diagnostic Data and Connected Experiences
Organizations can control whether connected experiences or diagnostic data can be sent from the new Outlook for Windows. This capability is part of our commitment to giving you the information and controls over your privacy.

:::image type="content" source="../manage/media/policy-management/policy-privacy-settings.png" alt-text="Screenshot that shows how to turn on optional connected experiences in privacy settings." lightbox="../manage/media/policy-management/policy-privacy-settings-lb.png":::

For more information, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](/deployoffice/privacy/manage-privacy-controls).

## Disable In-product feedback
New Outlook provides [in-product feedback](/microsoft-365/admin/misc/feedback-user-control#in-product-feedback) that can be managed as part of Microsoft 365 wide settings for Feedback in Cloud Policy:

:::image type="content" source="../manage/media/policy-management/policy-feeback.png" alt-text="Screenshot that shows how to provide in-product feedback through Feedback to Microsoft." lightbox="../manage/media/policy-management/policy-feeback-lb.png":::

For more information, see [Manage Microsoft feedback for your organization](/microsoft-365/admin/manage/manage-feedback-ms-org).

## Disable Contact Support in the new Outlook for Windows
This can be configured via Cloud policy (https://learn.microsoft.com/en-us/deployoffice/admincenter/overview-cloud-policy) for a Microsoft 365 organization, at https://config.office.com or more specifically at: https://config.office.com/officeSettings/officePolicies (direct link)

When you choose to 'Create' a policy, after providing a name and setting a scope, you can search for ’new outlook’ when you’re at 'Policies' screen, it will bring up all the available policies for new Outlook for Windows, one of those policies is 'Allow access to Contact Support in the new Outlook'. This policy can be configured as ‘Disabled’ to disable 'Contact Support' option under Help menu in new Outlook.

## Disable toggle from classic Outlook for Windows
Some organizations could use a policy to block the toggle from appearing in the classic Outlook for Windows until they’re ready to migrate. For guidance on this policy, see [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

While this policy hides the toggle within the application, it doesn’t block the mailbox from being added to the new Outlook for Windows. A separate Exchange policy can be used to block organization mailboxes from being added to new Outlook. For guidance on this policy, see [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-new-outlook-for-windows-for-an-individual-mailbox).

Users can enable new Outlook via the toggle from the Mail and Calendar application that ship with Windows. To block new Outlook from these applications, organizations can block users from downloading and/or installing new Outlook using Intune or other management solutions.

Organizations can also block the user of Mail and Calendar with organization accounts via the `UniversalOutlookEnabled` parameter in CASMailbox: [Set-CASMailbox](/powershell/module/exchange/set-casmailbox).
