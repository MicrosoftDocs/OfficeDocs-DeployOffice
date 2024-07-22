---
title: "Microsoft Edge WebView2 and Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Guidance for Office admins about the installation and use of Microsoft Edge WebView2 on devices running Microsoft 365 Apps."
ms.date: 05/28/2024
---

# Microsoft Edge WebView2 and Microsoft 365 Apps

Microsoft 365 Apps is starting to provide new or improved features that rely on Microsoft Edge WebView2. For example, the Room Finder and the Meeting Insights features in Outlook. WebView2 uses Microsoft Edge as a rendering engine to display web-based features in a desktop application.

By making use of WebView2, we can more easily provide your users with Office features that look and feel the same across device platforms. In turn, this consistent experience helps your users to learn and use those features without having to learn the nuances of Office on each device platform. For example, by using WebView2, the Room Finder feature looks the same when using Outlook on a device running Windows and when using Outlook on the web. Office Add-ins start relying on WebView2.

WebView2 requires that Microsoft Edge WebView2 Runtime is installed on the device running Office. If WebView2 Runtime isn’t installed on the device, your users can't make use of the Office features that rely on WebView2. 

Therefore, in April 2021, we began installing WebView2 Runtime on devices running Windows and that have Version 2101 or later of Microsoft 365 Apps installed.

> [!IMPORTANT]
> - WebView2 Runtime doesn’t install Microsoft Edge (full browser) on the device and doesn’t require Microsoft Edge to be installed on the device.
> - When WebView2 Runtime is installed on the device, no change is made to the user’s default browser selection.

## WebView2 Runtime installation

WebView2 Runtime installations began in April 2021. Only devices that are running Windows and that have Version 2101 or later of Microsoft 365 Apps installed are affected. If WebView2 Runtime is already installed on the device, WebView2 Runtime is updated to the latest version, if needed.

To benefit from the new or improved Office features or add-ins that rely on WebView2, no action is required on your part. We recommend that you allow WebView2 Runtime to be installed. As soon as WebView2 is available on the device, then your users can start using the Office features that rely on WebView2. 

After installation, you’ll see an entry for Microsoft Edge WebView2 Runtime under **Control Panel** > **Programs** > **Programs and Features**.

> [!NOTE]
> The installation of WebView2 Runtime is a separate process from the normal updates to Office provided by Click-to-Run. The installation won't happen as part of an Office update, but will happen at a different time. The timing of this installation isn't configurable by an admin, but usually happens within a few days after installing or updating to Version 2101 or later.

To postpone or prevent the automatic installation of WebView2 Runtime on devices in your organization, follow these steps if your organization has specific deployment limitations. But, if you don't allow WebVew2 Runtime to be installed, then Office features that rely on WebView2 aren't available on those devices.

To prevent the automatic installation of WebView2 Runtime, sign in to the Microsoft 365 Apps admin center [(https://config.office.com)](https://config.office.com) with an admin account. Then, go to **Customization** > **Device Configuration** > **Modern Apps Settings**. Select **Microsoft Edge WebView2** and then clear the **Enable automatic installation of WebView2 Runtime** check box.

> [!NOTE]
> - Clearing the check box won’t remove WebView2 Runtime from devices on which it has already been installed. Only new installations of WebView2 Runtime are prevented.
> - There is no policy setting (for Group Policy or Cloud Policy) to turn off the automatic installation of the WebView2 Runtime.

If you want to deploy WebView2 Runtime to devices in your organization on your own schedule, you can download it from https://developer.microsoft.com/microsoft-edge/webview2/#download-section. You should use either the Evergreen Bootstrapper or the Evergreen Standalone Installer, depending on your deployment needs.

## Updates to WebView2

To keep WebView2 up to date with the latest security and reliability updates, WebView2 Runtime uses its own automatic update process, separate from the update channel used by Microsoft 365 Apps. WebView2 Runtime is updated approximately a few times each month. Updates usually range in size from 5 MB to 30 MB, depending on the type of update. Differential updates and Delivery Optimization are used where possible. For information about managing these updates, see [Managing WebView2 applications](/microsoft-edge/webview2/concepts/enterprise).


## Additional information about WebView2

- The file name for WebView2 Runtime is msedgewebview2.exe
- If you're using Task Manager, you see multiple instances of Microsoft Edge WebView2 running under the Microsoft Outlook process. 
- WebView2 Runtime isn't installed on devices running macOS.
- To see if Version 2101 or later is available in the update channel you’re using for Microsoft 365 Apps, see [Update history for Microsoft 365 Apps (listed by date)](/officeupdates/update-history-microsoft365-apps-by-date).
- Other applications could have installed WebView2 Runtime on the device. For example, applications from companies other than Microsoft or line-of-business applications created within your organization. Office features that rely on WebView2 is able to use that installation.
 
## Related articles

- [Announcing Microsoft Edge WebView2 General Availability](https://blogs.windows.com/msedgedev/2020/10/19/edge-webview2-general-availability/)
- [Introduction to Microsoft Edge WebView2](/microsoft-edge/webview2)
- [Understanding the Office Add-ins runtime](https://developer.microsoft.com/office/blogs/understanding-office-add-ins-runtime/)
