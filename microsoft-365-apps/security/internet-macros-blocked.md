---
title: "Macros from the internet are blocked by default in Office "
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
description: "Provides guidance for admins about how Office blocks macros in files from the internet."
ms.date: 09/20/2024
---

# Macros from the internet are blocked by default in Office

VBA macros are a common way for malicious actors to gain access to deploy malware and ransomware. Therefore, to help improve security in Office, we’re changing the default behavior of Office applications to block macros in files from the internet.

This change affects how users interact with files from the internet, like email attachments containing macros. Now, when users open such a file, they see the following message:

:::image type="content" source="./media/internet-macros-blocked/vba-security-risk-banner.png" alt-text="A screenshot of a security risk banner indicating that Microsoft blocked macros from running because the source of the file is untrusted.":::


The **Learn More** button goes to an [article for end users and information workers](https://support.microsoft.com/topic/0952faa0-37e7-4316-b61d-5b5ed6024216) that contains information about the security risk of bad actors using macros, safe practices to prevent phishing and malware, and instructions on how to enable these macros (if needed).

In some cases, users also see the message if the file is from a location within your intranet and isn't identified as being trusted. For example, if users are accessing files on a network share by using the share's IP address. For more information, see [Files centrally located on a network share or trusted website](#files-centrally-located-on-a-network-share-or-trusted-website).

> [!IMPORTANT]
> Even before this change we're introducing, organizations could use the [Block macros from running in Office files from the Internet](#block-macros-from-running-in-office-files-from-the-internet) policy to prevent users from inadvertently opening files from the internet that contain macros. We recommend enabling this policy as part of the [security baseline](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/bg-p/Microsoft-Security-Baselines) for Microsoft 365 Apps for enterprise. If you do configure the policy, your organization won’t be affected by this default change.
>
> For more information, see [Use policies to manage how Office handles macros](#use-policies-to-manage-how-office-handles-macros).

## Prepare for this change

Prepare for this change by working with the business units in your organization that utilize macros in Office files. These files are often opened from locations like intranet network shares or intranet websites. You want to identify those macros and determine what [steps to take](#steps-to-take-to-allow-vba-macros-to-run-in-files-that-you-trust) to keep using those macros. Work with independent software vendors (ISVs) that provide macros in Office files from those locations. For example, to see if they can digitally sign their code and you can treat them as a trusted publisher.

Also, review the following information:

|Preparation action|More information|
|---------|---------|
|Understand which version in each update channel has this change |[Versions of Office affected by this change](#versions-of-office-affected-by-this-change)|
|See a flow chart of the process Office takes to determine whether to run macros in a file| [How Office determines whether to run macros in files from the internet](#how-office-determines-whether-to-run-macros-in-files-from-the-internet) |
|Learn about policies that you can use to control VBA macro execution |[Use policies to manage how Office handles macros](#use-policies-to-manage-how-office-handles-macros)|

## Steps to take to allow VBA macros to run in files that you trust

How you allow VBA macros to run in files that you trust depends on where those files are located or the type of file.

The following table list different common scenarios and possible approaches to take to unblock VBA macros and allow them to run. You don't have to do all possible approaches for a given scenario. In the cases where we list multiple approaches, pick the one that best suits your organization.

|Scenario|Possible approaches to take|
|---------|---------|
|Individual files <br/>  |• Select the **Unblock** checkbox on the **General** tab of the **Properties** dialog for the file <br/> • Use the [Unblock-File](/powershell/module/microsoft.powershell.utility/unblock-file) cmdlet in PowerShell <br/><br/> For more information, see [Remove Mark of the Web from a file](#remove-mark-of-the-web-from-a-file). |
|Files centrally located on a network share or trusted website|Unblock the file using an approach listed under "Individual files."<br/><br/> If there isn't an **Unblock** checkbox and you want to trust all files in that network location: <br/>• Designate the location as a Trusted site<br/> • Add the location to the **Local intranet** zone <br/><br/> For more information, see [Files centrally located on a network share or trusted website](#files-centrally-located-on-a-network-share-or-trusted-website).|
|Files stored on OneDrive or SharePoint, including a site used by a Teams channel|• Have users directly open the file by using the **Open in Desktop App** option <br/> • If users download the file locally before opening it, remove Mark of the Web from the local copy of the file *(see the approaches under "Individual files")*<br/>• Designate the location as a Trusted site <br/> <br/> For more information, see [Files on OneDrive or SharePoint](#files-on-onedrive-or-sharepoint). |
|Macro-enabled template files for Word, PowerPoint, and Excel|If the template file is stored on the user's device:<br/> • Remove Mark of the Web from the template file *(see the approaches under "Individual files")*  <br/>• Save the template file to a Trusted Location <br/><br/>If the template file is stored on a network location: <br/>• Use a digital signature and trust the publisher  <br/>• Trust the template file *(see the approaches under "Files centrally located on a network share or trusted website")* <br/><br/>For more information, see [Macro-enabled template files for Word, PowerPoint, and Excel](#macro-enabled-template-files-for-word-powerpoint-and-excel).|
|Macro-enabled add-in files for PowerPoint|• Remove Mark of the Web from the Add-in file  <br/> • Use a digital signature and trust the publisher <br/>• Save the Add-in file to a Trusted Location <br/><br/>For more information, see [Macro-enabled add-in files for PowerPoint and Excel](#macro-enabled-add-in-files-for-powerpoint-and-excel).|
|Macro-enabled add-in files for Excel|• Remove Mark of the Web from the Add-in file  <br/>• Save the Add-in file to a Trusted Location <br/><br/>For more information, see [Macro-enabled add-in files for PowerPoint and Excel](#macro-enabled-add-in-files-for-powerpoint-and-excel).|
|Macros that are signed by a trusted publisher|• *[recommended]* Deploy the public code-signing certificate for the trusted publisher to your users and prevent your users from adding trusted publishers themselves.  <br/>• Remove Mark of the Web from the file, and have the user add the publisher of the macro as a trusted publisher. <br/><br/>For more information, see [Macros that are signed by a trusted publisher](#macros-that-are-signed-by-a-trusted-publisher).|
|Groups of files saved to folders on the user’s device |Designate the folder a Trusted Location <br/><br/> For more information, see [Trusted Locations](#trusted-locations).|

## Versions of Office affected by this change

This change only affects Office on devices running Windows and only affects the following applications: Access, Excel, PowerPoint, Project, Publisher, Visio, and Word.

The following table shows when this change became available in each update channel for Access, Excel, PowerPoint, Visio, and Word.

|Update channel  |Version  |Date  |
|---------|---------|---------|
|Current Channel (Preview)|Version 2203|Started rolling out on April 12, 2022|
|Current Channel|Version 2206|Started rolling out on July 27, 2022|
|Monthly Enterprise Channel|Version 2208|October 11, 2022|
|Semi-Annual Enterprise Channel (Preview)|Version 2208|October 11, 2022|
|Semi-Annual Enterprise Channel |Version 2208|January 10, 2023|

The following table shows when this change became available in each update channel for Publisher.

|Update channel  |Version  |Date  |
|---------|---------|---------|
|Current Channel|Version 2301|February 14, 2023|
|Monthly Enterprise Channel|Version 2212|February 14, 2023|
|Monthly Enterprise Channel|Version 2211|February 14, 2023|
|Semi-Annual Enterprise Channel (Preview)|Version 2208|February 14, 2023|
|Semi-Annual Enterprise Channel |Version 2208|February 14, 2023|
|Semi-Annual Enterprise Channel |Version 2202|February 14, 2023|
|Semi-Annual Enterprise Channel |Version 2108|February 14, 2023|

The following table shows when this change became available in each update channel for Project.

|Update channel  |Version  |Date  |
|---------|---------|---------|
|Current Channel|Version 2407|August 13, 2024|
|Monthly Enterprise Channel|Version 2406|August 13, 2024|
|Monthly Enterprise Channel|Version 2405|August 13, 2024|
|Semi-Annual Enterprise Channel (Preview)|Version 2402|August 13, 2024|
|Semi-Annual Enterprise Channel |Version 2402|August 13, 2024|
|Semi-Annual Enterprise Channel |Version 2308|August 13, 2024|
|Semi-Annual Enterprise Channel |Version 2302|August 13, 2024|

The change doesn’t affect Office on a Mac, Office on Android or iOS devices, or Office on the web.

## How Office determines whether to run macros in files from the internet

The following flowchart graphic shows how Office determines whether to run macros in a file from the internet.

:::image type="content" source="./media/internet-macros-blocked/vba-macro-flowchart.png" alt-text="A screenshot of a flowchart detailing the process and conditions for enabling or blocking VBA macros in files with MOTW attributes.":::


The following steps explain the information in the flowchart graphic, except for Excel Add-in files. For more information about those files, see [Macro-enabled add-in files for PowerPoint and Excel](#macro-enabled-add-in-files-for-powerpoint-and-excel). Also, if a file is located on a network share that isn’t in the **Local intranet** zone or isn’t a trusted site, macros are blocked in that file.

1. A user opens an Office file containing macros obtained from the internet. For example, an email attachment. The file has Mark of the Web (MOTW).

   > [!NOTE]
   > - Mark of the Web is added by Windows to files from an untrusted location, such as the internet or Restricted Zone. For example, browser downloads or email attachments. For more information, see [Mark of the Web and zones](#mark-of-the-web-and-zones).
   > - Mark of the Web only applies to files saved on an NTFS file system, not files saved to FAT32 formatted devices.

2. If the file is from a Trusted Location, the file is opened with the macros enabled. If the file isn't from a Trusted Location, the evaluation continues.

3. If the macros have a digital signature and your device has the corresponding Trusted Publisher certificate, the file opens with the macros enabled. If not, then the evaluation continues.

4. Policies are checked to see if macros are allowed or blocked. If the policies are set to Not Configured, the evaluation continues to Step 6.

5. (a) If macros are blocked by policy, the macros are blocked. </br>
   (b) If the macros are enabled by policy, the macros are enabled.

6. If the user previously opened the file, before this change in default behavior, and selected **Enable content** from the Trust Bar, then the macros are enabled because the file is considered trusted.

   > [!NOTE]
   > - For more information, see [New security hardening policies for Trusted Documents](https://techcommunity.microsoft.com/t5/office-365-blog/new-security-hardening-policies-for-trusted-documents/ba-
       p/3023465). 
   > - For perpetual versions of Office, such as Office LTSC 2021 or Office 2019, this step occurs after Step 3 and before Step 4, and isn’t affected by the change to the default behavior.

7. This step is where the change to the default behavior of Office takes effect. With this change, macros in files from the internet are blocked and users see the **Security Risk** banner when they open the file.

   > [!NOTE]
   > Previously, before this change in default behavior, the app would check to see if the [VBA Macro Notification Settings](#vba-macro-notification-settings) policy was enabled and how it was configured.
   > If the policy was set to Disabled or Not Configured, then the app would check the settings under **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Macro Settings**. The default 
     is set to "Disable all macros with notification," which allows users to enable content in the Trust Bar.

## Guidance on allowing VBA macros to run in files you trust

### Remove Mark of the Web from a file

To unblock macros in a file, like one from the internet or an email attachment, remove the Mark of the Web on your local device. To remove, right-click on the file, choose **Properties**, and then select the **Unblock** checkbox on the **General** tab.

:::image type="content" source="./media/internet-macros-blocked/vba-unblock-file-properties.PNG" alt-text="A screenshot of the file properties dialog box for a macro-enabled document, highlighting the security option to unblock the file.":::

> [!NOTE]
> - In some cases, usually for files on a network share, users might not see the **Unblock** checkbox for a file where macros are being blocked. For those cases, see [Files centrally located on a network share or trusted website](#files-centrally-located-on-a-network-share-or-trusted-website).
> - Even if the **Unblock** checkbox is available for a file on a network share, selecting the checkbox won’t have any effect if the share is considered to be in the **Internet** zone. For more information, see [Mark of the Web and zones](#mark-of-the-web-and-zones).

You can also use the [Unblock-File](/powershell/module/microsoft.powershell.utility/unblock-file) cmdlet in PowerShell to remove the ZoneId value from the file. Removing the ZoneId value allows VBA macros to run by default. Using the cmdlet does the same thing as selecting the **Unblock** checkbox on the **General** tab of the **Properties** dialog for the file. For more information about the ZoneId value, see [Mark of the Web and zones](#mark-of-the-web-and-zones).

### Files centrally located on a network share or trusted website

If you have your users access files from a trusted website or an internal file server, you can do either of the following steps so that macros from those locations aren't blocked.

- Designate the location as a Trusted site
- If the network location is on the intranet, add the location to the **Local intranet** zone

  > [!NOTE]
  > - If you add something as a trusted site, you’re also giving the entire site elevated permissions for scenarios not related to Office.
  > - For the **Local intranet** zone approach, we recommend you save the files to a location that’s already considered part of the **Local intranet** zone, instead of adding new locations to that zone.
  > - In general, we recommend that you use trusted sites, because they have some additional security compared to the **Local intranet** zone.

  For example, if users are accessing a network share by using its IP address, macros in those files are blocked unless the file share is in the **Trusted sites** or the **Local intranet** zone.

  > [!TIP]
  > - To see a list of trusted sites or what's in the **Local intranet** zone, go to **Control Panel** > **Internet Options** > **Change security settings** on a Windows device.
  > - To check if an individual file is from a trusted site or local intranet location, see [Mark of the Web and zones](#mark-of-the-web-and-zones).

  For example, you could add a file server or network share as a trusted site, by adding its FQDN or IP address to the list of trusted sites.

  :::image type="content" source="./media/internet-macros-blocked/trusted-sites-dialog-example.png" alt-text="A screenshot of the Trusted Sites dialog box showing the option to add or remove websites and manage security settings for trusted sites.":::

If you want to add URLs that begin with http:// or network shares, clear the **Require server verification (https:) for all sites in this zone** checkbox.

> [!IMPORTANT]
> Because macros aren’t blocked in files from these locations, you should manage these locations carefully. Be sure you control who is allowed to save files to these locations.

You can use Group Policy and the "Site to Zone Assignment List" policy to add locations as trusted sites or to the **Local intranet** zone for Windows devices in your organization. This policy is found under Windows Components\Internet Explorer\Internet Control Panel\Security Page in the Group Policy Management Console. It’s available under both Computer Configuration\Policies\Administrative Templates and User Configuration\Policies\Administrative Templates.

### Files on OneDrive or SharePoint

- If a user downloads a file on OneDrive or SharePoint by using a web browser, the configuration of the Windows internet security zone (**Control Panel** > **Internet Options** > **Security**) determines whether the browser sets Mark of the Web. For example, Microsoft Edge sets Mark of the Web on a file if it's from the Internet zone.

- If a user selects **Open in Desktop App** in a file opened from the OneDrive website or from a SharePoint site (including a site used by a Teams channel), then the file won't have Mark of the Web.

- If a user has the OneDrive sync client running and the sync client downloads a file, then the file won't have Mark of the Web.

- Files that are in Windows known folders (Desktop, Documents, Pictures, Screenshots, and Camera Roll), and are synced to OneDrive, don't have Mark of the Web.

- If you have a group of users, such as the Finance department that needs to use files from OneDrive or SharePoint without macros being blocked, here are some possible options:

  - Have them open the file by using the **Open in Desktop App** option

  - Have them download the file to a [Trusted Location](trusted-locations.md).

  - Set the Windows internet security zone assignment for OneDrive or SharePoint domains to Trusted Sites. Admins can use the "Site to Zone Assignment List" policy and configure the policy to place `https://{your-domain-name}.sharepoint.com` (for SharePoint) or `https://{your-domain-name}-my.sharepoint.com` (for OneDrive) into the Trusted Sites zone.

     - This policy is found under Windows Components\Internet Explorer\Internet Control Panel\Security Page in the Group Policy Management Console. It’s available under both Computer Configuration\Policies\Administrative Templates and User Configuration\Policies\Administrative Templates.

     - SharePoint permissions and OneDrive sharing aren't changed by adding these locations to Trusted Sites. Maintaining access control is important. Anyone with permissions to add files to SharePoint could add files with active content, such as macros. Users who download files from domains in the Trusted Sites zone bypasses the default to block macros.

### Macro-enabled template files for Word, PowerPoint, and Excel

Macro-enabled template files for Word, PowerPoint, and Excel that are downloaded from the internet have Mark of the Web. For example, template files with the following extensions:
- .dot
- .dotm
- .pot
- .potm
- .xlt
- .xltm

When the user opens the macro-enabled template file, the user is blocked from running the macros in the template file. If the user trusts the source of the template file, they can remove Mark of the Web from the template file, and then reopen the template file in the Office app.

If you have a group of users that need to use macro-enabled templates without macros being blocked, you can take either of the following actions:
- Use a digital signature and trust the publisher.
- If you're not using digital signatures, you can save the template file to a [Trusted Location](trusted-locations.md) and have users get the template file from that location.

### Macro-enabled add-in files for PowerPoint and Excel

Macro-enabled Add-in files for PowerPoint and Excel that are downloaded from the internet have Mark of the Web. For example, Add-in files with the following extensions:

- .ppa
- .ppam
- .xla
- .xlam

When the user tries to install the macro-enabled Add-in, by using **File** > **Options** > **Add-ins** or by using the **Developer** ribbon, the Add-in is loaded in a disabled state and the user is blocked from using the Add-in. If the user trusts the source of the Add-in file, they can remove Mark of the Web from the Add-in file, and then reopen PowerPoint or Excel to use the Add-in.

If you have a group of users that need to use macro-enabled Add-in files without macros being blocked, you can take the following actions.

For PowerPoint Add-in files:
- Remove Mark of the Web from the .ppa or .ppam file.
- Use a digital signature and trust the publisher.
- Save the Add-in file to a [Trusted Location](trusted-locations.md) for users to retrieve.

For Excel Add-in files:
- Remove Mark of the Web from the .xla or .xlam file.
- Save the Add-in file to a [Trusted Location](trusted-locations.md) for users to retrieve.

> [!NOTE]
> Using a digital signature and trusting the publisher doesn't work for Excel Add-in files that have Mark of the Web. This behavior isn't new for Excel Add-in files that have Mark of the Web. It's worked this way since 2016, as a result of a previous security hardening effort (related to Microsoft Security Bulletin MS16-088).

### Macros that are signed by a trusted publisher

If the macro is signed and you validated the certificate and trust the source, you can make that source a trusted publisher. We recommend, if possible, that you manage trusted publishers for your users. For more information, see [Trusted publishers for Office files](trusted-publisher.md).

If you have just a few users, you can have them [remove Mark of the Web from the file](#remove-mark-of-the-web-from-a-file) and then [add the source of the macro as a trusted publisher](https://support.microsoft.com/office/87b3d5a3-b68c-4023-87c4-7cc78a44d7ed) on their devices.

> [!WARNING]
> - All macros validly signed with the same certificate are recognized as coming from a trusted publisher and are run.
> - Adding a trusted publisher could affect scenarios beyond those related to Office, because a trusted publisher is a Windows-wide setting, not just an Office-specific setting.

### Trusted Locations

Saving files from the internet to a Trusted Location on a user's device ignores the check for Mark of the Web and opens with VBA macros enabled. For example, a line of business application could send reports with macros on a recurring basis. If files with macros are saved to a Trusted Location, users don't have to go to the **Properties** for the file, and select **Unblock** to allow the macros to run.

Because macros aren’t blocked in files saved to a Trusted Location, you should manage Trusted Locations carefully and use them sparingly. Network locations can also be set as a Trusted Location, but it's not recommended. For more information, see [Trusted Locations for Office files](trusted-locations.md).

## Additional information about Mark of the Web

### Mark of the Web and Trusted Documents

When a file is downloaded to a device running Windows, Mark of the Web is added to the file, identifying its source as being from the internet. Currently, when a user opens a file with Mark of the Web, a **SECURITY WARNING** banner appears, with an **Enable content** button. If the user selects **Enable content**, the file is considered a Trusted Document, and macros are allowed to run. The macros will continue to run even after the change of default behavior to block macros in files from the internet is implemented, because the file is still considered a Trusted Document.

After the change of default behavior to block macros in files from the internet, users will see a different banner the first time they open a file with macros from the internet. This **SECURITY RISK** banner doesn't have the option to **Enable content**. But users are able to go to the **Properties** dialog for the file, and select **Unblock**, which will remove Mark of the Web from the file and allow the macros to run, as long as no policy or Trust Center setting is blocking.

### Mark of the Web and zones

By default, Mark of the Web is added to files only from the **Internet** or **Restricted sites** zones.

> [!TIP]
> To see these zones on a Windows device, go to **Control Panel** > **Internet Options** > **Change security settings**.

You can view the ZoneId value for a file by running the following command at a command prompt, and replacing *{name of file}* with your file name.

```console
notepad {name of file}:Zone.Identifier
```

When you run this command, Notepad will open and display the ZoneId under the [ZoneTransfer] section.

Here's a list of ZoneId values and what zone they map to.

- 0 = My Computer
- 1 = Local intranet
- 2 = Trusted sites
- 3 = Internet
- 4 = Restricted sites

For example, if the ZoneId is 2, VBA macros in that file won't be blocked by default. But if the ZoneId is 3, macros in that file will be blocked by default.

You can use the [Unblock-File](/powershell/module/microsoft.powershell.utility/unblock-file) cmdlet in PowerShell to remove the ZoneId value from the file. Removing the ZoneId value allows VBA macros to run by default. Using the cmdlet does the same thing as selecting the **Unblock** checkbox on the **General** tab of the **Properties** dialog for the file.

## Use policies to manage how Office handles macros

You can use policies to manage how Office handles macros. We recommend that you use the [Block macros from running in Office files from the Internet](#block-macros-from-running-in-office-files-from-the-internet) policy. But if that policy isn't appropriate for your organization, the other option is the [VBA Macro Notification Settings](#vba-macro-notification-settings) policy.

For more information on how to deploy these policies, see [Tools available to manage policies](#tools-available-to-manage-policies).

> [!IMPORTANT]
> You can only use policies if you're using Microsoft 365 Apps for enterprise. Policies aren't available for Microsoft 365 Apps for business.

### Block macros from running in Office files from the Internet

This policy prevents users from inadvertently opening files containing macros from the internet. When a file is downloaded to a device running Windows, or opened from a network share location, Mark of the Web is added to the file identifying it was sourced from the internet.

We recommend enabling this policy as part of the [security baseline](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/bg-p/Microsoft-Security-Baselines) for Microsoft 365 Apps for enterprise. You should enable this policy for most users and only make exceptions for certain users as needed.

There's a separate policy for each of the seven applications. The following table shows where each policy can be found in the Group Policy Management Console under User Configuration\Policies\Administrative Templates:

|Application|Policy location |
|---------|---------|
|Access|Microsoft Access 2016\Application Settings\Security\Trust Center|
|Excel|Microsoft Excel 2016\Excel Options\Security\Trust Center|
|PowerPoint|Microsoft PowerPoint 2016\PowerPoint Options\Security\Trust Center|
|Project|Microsoft Project 2016\Project Options\Security\Trust Center|
|Publisher|Microsoft Publisher 2016\Publisher Options\Security\Trust Center|
|Visio|Microsoft Visio 2016\Visio Options\Security\Trust Center|
|Word|Microsoft Word 2016\Word Options\Security\Trust Center|

Which state you choose for the policy determines the level of protection you're providing. The following table shows the current level of protection you get with each state, before the change in default behavior is implemented.

|Icon|Protection level|Policy state|Description|
|-----|---------|---------|---------|
|:::image type="content" source="./media/internet-macros-blocked/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::| Protected **[recommended]**|Enabled |Users are blocked from running macros in files obtained from the internet. <br/><br/>Part of the Microsoft recommended security baseline. |
|:::image type="content" source="./media/internet-macros-blocked/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected|Disabled| Will respect the settings configured under **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Macro Settings**.         |
|:::image type="content" source="./media/internet-macros-blocked/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected |Not Configured| Will respect the settings configured under **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Macro Settings**.            |

> [!NOTE]
> - If you set this policy to Disabled, users will see, by default, a security warning when they open a file with a macro. That warning will let users know that macros have been disabled, but will allow them to run the macros by choosing the **Enable content** button.
> - This warning is the same warning users have been shown previously, prior to this recent change we’re implementing to block macros.
> - We don’t recommend setting this policy to Disabled permanently. But in some cases, it might be practical to do so temporarily as you test out how the new macro blocking behavior affects your organization and as you develop a solution for allowing safe usage of macros.  

After we implement the change to the default behavior, the level of protection changes when the policy is set to Not Configured.

|Icon|Protection level|Policy state|Description|
|---|---------|---------|---------|
|:::image type="content" source="./media/internet-macros-blocked/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::|Protected |Not Configured| Users are blocked from running macros in files obtained from the internet.<br/><br/> Users see the Security Risk banner with a Learn More button |

### VBA Macro Notification Settings

If you don't use the "Block macros from running in Office files from the Internet" policy, you can use the "VBA Macro Notification Settings" policy to manage how macros are handled by Office.

This policy prevents users from being lured into enabling malicious macros. By default, Office is configured to block files that contain VBA macros and display a Trust Bar with a warning that macros are present and have been disabled. Users can inspect and edit the files if appropriate, but can’t use any disabled functionality until they select **Enable Content** on the Trust Bar. If the user selects **Enable Content**, then the file is added as a Trusted Document and macros are allowed to run.

There's a separate policy for each of the seven applications. The following table shows where each policy can be found in the Group Policy Management Console under User Configuration\Policies\Administrative Templates:

|Application|Policy location |
|---------|---------|
|Access|Microsoft Access 2016\Application Settings\Security\Trust Center|
|Excel <sup>[1]</sup>|Microsoft Excel 2016\Excel Options\Security\Trust Center|
|PowerPoint|Microsoft PowerPoint 2016\PowerPoint Options\Security\Trust Center|
|Project|Microsoft Project 2016\Project Options\Security\Trust Center|
|Publisher|Microsoft Publisher 2016\Publisher Options\Security\Trust Center|
|Visio|Microsoft Visio 2016\Visio Options\Security\Trust Center|
|Word|Microsoft Word 2016\Word Options\Security\Trust Center|

> [!NOTE]
> - <sup>[1]</sup> For Excel, the policy is named Macro Notification Settings.

Which state you choose for the policy determines the level of protection you're providing. The following table shows the level of protection you get with each state.

|Icon|Protection level|Policy state|Policy value|
|--------|---------|---------|---------|
|:::image type="content" source="./media/internet-macros-blocked/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::|Protected **[recommended]** |Enabled|Disable all except digitally signed macros (and select "Require macros to be signed by a trusted publisher")|
|:::image type="content" source="./media/internet-macros-blocked/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::|Protected |Enabled|Disable all without notification |
|:::image type="content" source="./media/internet-macros-blocked/icon-partially-protected.png" alt-text="A screenshot of an orange icon with a checkmark indicating that the content is partially protected.":::|Partially protected |Enabled|Disable all with notification |
|:::image type="content" source="./media/internet-macros-blocked/icon-partially-protected.png" alt-text="A screenshot of an orange icon with a checkmark indicating that the content is partially protected.":::|Partially protected|Disabled|*(Same behavior as "Disable all with notification")*|
|:::image type="content" source="./media/internet-macros-blocked/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::|Not protected|Enabled|Enable all macros (not recommended) |

> [!IMPORTANT]
> Securing macros is important. For users that don't need macros, turn off all macros by choosing "Disable all without notification."
>
> Our security baseline recommendation is that you should do the following:
> - Enable the "VBA Macro Notification Settings" policy.
> - For users that need macros, choose "Disable all except digitally signed macros" and then select "Require macros to be signed by a trusted publisher." The certificate needs to be installed as a Trusted Publisher on users' devices.

If you don't configure the policy, users can configure macro protection settings under **File** > **Options** > **Trust Center** > **Trust Center Settings...** > **Macro Settings**.

The following table shows the choices users can make under **Macro Settings** and the level of protection each setting provides.

|Icon|Protection level|Setting chosen|
|----|---------|---------|
|:::image type="content" source="./media/internet-macros-blocked/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::|Protected |Disable all macros except digitally signed macros|
|:::image type="content" source="./media/internet-macros-blocked/icon-protected.png" alt-text="A screenshot of a green icon with a checkmark indicating that the content is fully protected.":::|Protected |Disable all macros without notification|
|:::image type="content" source="./media/internet-macros-blocked/icon-partially-protected.png" alt-text="A screenshot of an orange icon with a checkmark indicating that the content is partially protected.":::|Partially protected |Disable all macros with notification *(default)*|
|:::image type="content" source="./media/internet-macros-blocked/icon-not-protected.png" alt-text="A screenshot of a red icon with an 'X' indicating that the content isn't protected.":::| Not protected|Enable all macros (not recommended; potentially dangerous code can run)|

> [!NOTE]
> In the policy setting values and the product UI for Excel, the word "all" is replaced by "VBA."  For example, "Disable VBA macros without notification."

## Tools available to manage policies

There are several tools available to you to configure and deploy policy settings to users in your organization.

- [Cloud Policy](#cloud-policy)
- [Microsoft Intune admin center](#microsoft-intune-admin-center)
- [Group Policy Management Console](#group-policy-management-console)

### Cloud Policy

You can use Cloud Policy to configure and deploy policy settings to devices in your organization, even if the device isn't domain joined. Cloud Policy is a web-based tool and is found in the [Microsoft 365 Apps admin center](https://config.office.com).

In Cloud Policy, you create a policy configuration, assign it to a group, and then select policies to be included in the policy configuration. To select a policy to include, you can search by the name of the policy. Cloud Policy also shows which policies are part of the Microsoft recommended security baseline. The policies available in Cloud Policy are the same User Configuration policies that are available in the Group Policy Management Console.

For more information, see [Overview of Cloud Policy service for Microsoft 365](../admin-center/overview-cloud-policy.md).

### Microsoft Intune admin center

In the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/p/?linkid=2109431), you can use either the Settings catalog (preview) or Administrative Templates to configure and deploy policy settings to your users for devices running Windows 10 or later.

To get started, go to **Devices** > **Configuration profiles** > **Create profile**. For **Platform**, choose **Windows 10 and later** and then choose the profile type.

For more information, see the following articles:
- [Use the settings catalog to configure settings on Windows and macOS devices - preview](/mem/intune/configuration/settings-catalog)
- [Use Windows 10/11 templates to configure group policy settings in Microsoft Intune](/mem/intune/configuration/administrative-templates-windows)

### Group Policy Management Console

If you have Windows Server and Active Directory Domain Services (AD DS) deployed in your organization, you can configure policies by using Group Policy. To use Group Policy, download the most current [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), which include the policy settings for Microsoft 365 Apps for enterprise. After you copy the Administrative Template files to AD DS, you can use the Group Policy Management Console to create Group Policy Objects (GPOs) that include policy settings for your users, and for domain joined devices.

## Related articles

- [Macro malware](/defender-endpoint/malware/macro-malware)
- [Understanding malware & other threats](/defender-endpoint/malware/understanding-malware)
- [How to protect against phishing attacks](/defender-endpoint/malware/phishing)
- [Manage active content in Office documents](/microsoft-365/security/active-content-in-trusted-docs)
- [Add, remove, or change a trusted location](https://support.microsoft.com/office/7ee1cdc2-483e-4cbb-bcb3-4e7c67147fb4)
- [Trusted document settings have changed](https://support.microsoft.com/topic/0be30e4c-926a-4761-bdef-3f91097beb5a)
