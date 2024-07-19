---
title: "Use Microsoft Intune to install Microsoft 365 Insider on Windows devices"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides steps for admins to use Microsoft Intune to install Microsoft 365 Insider on Windows devices"
ms.date: 02/05/2024
---

# Use Microsoft Intune to install Microsoft 365 Insider on Windows devices

If you already use Microsoft Intune to deploy software in your organization, you can use it to install Microsoft 365 Insider on Windows devices. Intune supports both of these scenarios:

- [Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider](#change-an-existing-microsoft-365-apps-installation-to-microsoft-365-insider)
- [Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation](#install-microsoft-365-insider-when-you-do-a-new-microsoft-365-apps-installation)

## Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider

If Microsoft 365 Apps is already installed on the Windows device, you can use [administrative templates for Windows 10 and later](/mem/intune/configuration/administrative-templates-windows) to change to Microsoft 365 Insider.

To make that change, follow these steps:

1. Sign in to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/p/?linkid=2109431).
2. Go to **Devices** > **Policy** > **Configuration profiles** > **Create profile**.
3. In the **Create a profile** pane, select **Windows 10 and later** for the platform. Then, select **Templates** for the profile type, and **Administrative Templates** for the template name. Then, select **Create**.
4. On the **Basics** page, provide a name (required) and description (optional), and then select **Next**.
5. On the **Configuration settings** page, select **Microsoft Office 2016 (Machine)**. Then, select **Updates**.
6. Select **Update Channel (2.0)** and then select **Enabled**.
7. From the drop-down list under **Channel Name**, choose either **Current Channel (Preview)** or **Beta Channel**. *(Keep in mind that Beta Channel isn't supported.)*
8. Select **OK** and then select **Next**.
9. Select scope tags (optional), if appropriate for your organization, and then select **Next**.
10. Assign the configuration profile to the Microsoft Entra security group with the devices whose channel you want to change, and then select **Next**.
11. On the **Review + create** page, review your selections, and then select **Create**.

By default, Intune policies refresh in the background every eight hours. Actions such as assigning a new profile immediately notifies the device to check in. If you want to refresh policy assignment immediately, from the device, you can [sync your Windows device manually](/mem/intune/user-help/sync-your-device-manually-windows).

After the policy is applied, the "Office Automatic Updates 2.0" scheduled task must run. It detects the updated policy and update the assigned channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to that channel. You won't see the new channel name under **File** > **Account** until after the update to that channel is complete.

> [!TIP]
> You can force Microsoft 365 Apps to check for updates by going to **File** > **Account** > **Update Options** > **Update Now** in an app, such as Word.

## Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation

Follow these steps to use Intune to install Microsoft 365 Insider on a Windows device that doesn't already have Microsoft 365 Apps installed.

1. Sign in to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/p/?linkid=2109431).
2. Go to **Apps** > **All apps** > **Add**.
3. In the **Select app type** pane, select **Windows 10 and later** in the **Microsoft 365 Apps** section.
4. Choose **Select**. The **Add Microsoft 365 Apps** steps are displayed.
5. On the **App suite information** page, fill in the fields as you would for a typical app suite in your organization, then select **Next**.
6. On the **Configure app suite** page, make sure **Configuration designer** is selected for **Configuration settings format**, then select the apps that you want to assign to devices.
7. On the **Configure app suite** page, choose the following settings:
   - Select the appropriate architecture for your organization. The default is 64-bit and is recommended. But if you’re not sure which architecture to use, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
   - For **Update channel**, select **Current Channel (Preview)**.  *(If you want Beta Channel, [follow these steps](#how-do-i-install-beta-channel) )*
   - For **Version** to install, make sure **Latest** is selected.
   - For **Languages**, select the appropriate languages for your organization.
   - Make any other selections that are appropriate for your organization, and then select **Next**.
8. On the **Assignments** page, make the selections appropriate for your organization, and then select **Next**. For more information, see [Assign apps to groups with Microsoft Intune](/mem/intune/apps/apps-deploy).
9. On the **Review + create** page, review your selections, and then select **Create**.
10. After Microsoft 365 Apps downloads and installs on the user’s device, open an app, such as Word, and go to **File** › **Account**. Under the **About** section, you should see **Current Channel (Preview)**.

## Frequently asked questions

### How do I install Beta Channel?

To install Beta Channel, in Step 6, choose **Enter XML data** for the **Configuration settings format**. Selecting this option displays the **Configuration file** text box. Enter the following text into the text box, and then select **Validate XML**. After validating the XML, select **Next**.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="BetaChannel" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
 </Configuration>
```

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.
> - For information about other configuration settings, such as how to install other languages, see [Configuration options for the Office Deployment Tool](../../deploy/office-deployment-tool-configuration-options).

### I have Microsoft 365 Apps for business, not Microsoft 365 Apps for enterprise. What do I do?

Intune doesn't support Microsoft 365 Apps for business. Use the Office Deployment Tool instead. For more information, see [Use the Office Deployment Tool to install Microsoft 365 Insider on Windows devices](office-deployment-tool.md).
