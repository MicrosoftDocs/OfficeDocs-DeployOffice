---
title: "Overview of extended offline access for Microsoft 365 Apps"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: null
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Overview of extended offline access for Microsoft 365 Apps."
---

# Overview of extended offline access for Microsoft 365 Apps

Extended offline access enables the use of Microsoft 365 Apps for longer than 30 days without checking in.

 If yIf you work in locations that don't have internet access, you'll need to extend your Office license on your offline device. Otherwise your Office apps will become unlicensed after 30 days. You'll need a USB drive and internet access from another device to complete this procedure.

If you are on a device that needs to extend its license for offline use, see [Extend your Office license for offline use](https://support.office.com/article/extend-your-office-license-for-offline-use-06de5162-e230-4ce6-83bb-e6f06190a8f5)

From a device that has internet access, go to aka.ms/office-install.

On the Apps & devices page, under Office, select Devices to expand the list of devices where you've installed Office.

Locate the device that doesn't have internet access. The device name should have a red asterisk next to its name, indicating that your admin has configured it for offline use.

Select Extend license and save the license file (License.zip) to a USB drive.

Bring the USB drive to your offline device.

Insert the USB drive, open License.zip, and follow the steps in the Readme file.

This download allows you to extend your Office license so that you can work offline for more than 30 days. Follow these steps on your offline device:1. Close all Office apps.
2. Open the License folder, select the license file, and press CTRL + C to copy it.
3. Press Windows key + R to open the Run dialog box.
4. Type the following path in the Run box and then press Enter.
 %localappdata%\Microsoft\Office\Licenses\5
5. Press CTRL + P to paste the license file.
6. Open Word and go to File -> Account to confirm that your license expiration date has been extended.

Viewer mode allows unlicensed users of Microsoft 365 Apps to view and print Office files without being prompted to activate Office. To use viewer mode, you must have version 1902 of Microsoft 365 Apps or later. To enable viewer mode, your organization must have an Office 365 or Microsoft 365 license subscription.

Viewer mode is designed for users who need to view or print Office files without creating or editing them. For example, a doctor or nurse can use this mode to open files in Office from a health-care line-of-business application.

When viewer mode is enabled, an unlicensed user of Microsoft 365 Apps is not prompted to activate Office when they open Word, Excel, or PowerPoint. Instead, they see a banner message underneath the ribbon in their Office apps that informs them that Office is in viewer mode:

:::image type="content" source="images/viewermode2.png" alt-text="Viewer mode enabled in Word":::

:::image type="content" source="images/viewermode1.png" alt-text="Viewer mode enabled in Microsoft 365 Apps":::

## Enable viewer mode with Group Policy

To enable viewer mode for unlicensed users in your organization with Group Policy:

- Enable the **Use Viewer Mode** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Licensing Settings.

- Disable the **Automatically activate Office with federated organization credentials** policy setting. You can find this setting under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Subscription Activation. By disabling this setting, you ensure that Office is not automatically activated with federated organization credentials.

To use these policy settings, download and install the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

## Considerations when using viewer mode

- Viewer mode is currently supported for Word, Excel, and PowerPoint. We are aware of known issues with Project and Visio. For information about how to exclude applications when deploying, see [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element). 
- Updates, such as new features and security updates, are still applied when Office is in viewer mode.
- For information about the availability of Version 1902 or later in the update channels for Microsoft 365 Apps, see [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).
- The Activate Product button under File > Account is hidden when Office is in viewer mode.
- Even when viewer mode is enabled, users need to accept the license agreement when Office is opened for the first time. You can automatically accept the license agreement for your users when you deploy Office by configuring the [AcceptEULA attribute](office-deployment-tool-configuration-options.md#accepteula-attribute-part-of-display-element).
