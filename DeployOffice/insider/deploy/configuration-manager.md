---
title: "Use Configuration Manager to install Microsoft 365 Insider on Windows devices"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides steps for admins to use Configuration Manager to install Microsoft 365 Insider on Windows devices"
ms.date: 02/05/2024
---

# Use Configuration Manager to install Microsoft 365 Insider on Windows devices

If you use Microsoft Configuration Manager (current branch) to deploy software in your organization, you can use it to install Microsoft 365 Insider on Windows devices.

- You can use Configuration Manager to [install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation](#install-microsoft-365-insider-when-you-do-a-new-microsoft-365-apps-installation).
- If you previously installed Microsoft 365 Apps by using Configuration Manager, we recommend that you [follow these steps to change to Microsoft 365 Insider](#i-already-have-microsoft-365-apps-installed-do-i-need-to-go-through-all-these-steps-to-get-microsoft-365-insider).

## Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation

Follow these steps to use Configuration Manager (current branch) to install Microsoft 365 Insider on a Windows device that doesn't already have Microsoft 365 Apps installed. These steps also configure Microsoft 365 Apps to get updates automatically from Microsoft directly from the internet, which is our recommendation.

1. In the Configuration Manager console, create a device collection and add the appropriate devices to that collection. For more information about creating and managing collections, see [Introduction to collections in Configuration Manager](/mem/configmgr/core/clients/manage/collections/introduction-to-collections).
2. To create the Microsoft 365 Apps installation package, navigate to **Software Library** > **Overview** > **Office 365 Client Management** in the Configuration Manager console.
3. Select **Office 365 Installer** in the upper-right pane to start the Office 365 Client Installation Wizard.
4. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then select **Next**. The location must be specified as *\\\server\share*.
5. On the **Office Settings** page, select **Go to the Office Customization Tool**. This step opens the Office Customization Tool.
6. In the Office Customization Tool, choose the following settings:
   - For the **architecture**, we recommend choosing **64-bit**. But, if you’re not sure, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261) before selecting.
   - For the **Office suite**, choose **Microsoft 365 Apps for enterprise** or **Microsoft 365 Apps for business**, depending on which product you’re licensed for.
   - For the **update channel**, select **Current Channel (Preview)**.  *(If you want Beta Channel, [follow these steps](#how-do-i-install-beta-channel)).*
7. Configure other settings, such as languages, as appropriate for your organization.
8. After the **Applications preferences** section, select **Finish**, and then select **Submit**.
9. On the **Deployment** page, choose **Yes** to deploy the application, and then select **Next**. If you choose not to deploy the package in the wizard, you can deploy or edit it later. To find the application, go to **Software Library** > **Application Management** > **Applications**.
10. On the **General** page, choose the collection you created in Step 1, and then select **Next**.
11. Configure the remainder of the wizard as you would for a typical application deployment in your organization. For more information, see [Create and deploy an application with Configuration Manager](/mem/configmgr/apps/get-started/create-and-deploy-an-application).
12. After the wizard finishes, go to the *\\\server\share* that you specified in Step 4. Open the configuration.xml file in a text editor, such as Notepad. Change the OfficeMgmtCOM part of the file to OfficeMgmtCOM="False" and then save the file.
13. After Microsoft 365 Apps download and install on the user’s device, open an app, such as Word, and go to **File** › **Account**. Under the **About** section, you should see **Current Channel (Preview)**.

## Frequently asked questions

### How do I install Beta Channel?

You can't choose Beta Channel for the update channel on the **Deployment Settings** page in Step 6. To install Beta Channel, after the wizard finishes, go to the *\\\server\share* that you specified in Step 5. Then open the configuration.xml file in a text editor, such as Notepad. Change the Channel part of the file to Channel="BetaChannel" and make sure OfficeMgmtCOM="False". Then save the file.

> [!NOTE]
> Keep in mind that Beta Channel isn't supported.

## Why do I need to change the OfficeMgmtCOM setting in Step 12?

Using OfficeMgmtCOM="False" configures Microsoft 365 Apps to get updates automatically from Microsoft directly from the internet, instead of Configuration Manager downloading and distributing the updates. Getting updates for Microsoft 365 Insider directly from the internet simplifies update management for you. Updates are delivered automatically to Microsoft 365 Insider when they're released.

If you use Group Policy in your organization, you can turn off OfficeMgmtCOM by setting the “Management of Microsoft 365 Apps for enterprise” policy to Disabled. You can find that policy under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management Console.

## I already have Microsoft 365 Apps installed. Do I need to go through all these steps to get Microsoft 365 Insider?

If you already have Microsoft 365 Apps installed, you don’t have to uninstall and reinstall Microsoft 365 Apps to move those devices to Microsoft 365 Insider. You can use Group Policy and the following policies:
- Update Channel
- Management of Microsoft 365 Apps for enterprise
- Update Path

These policies can be found under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management Console.

> [!NOTE]
> When you configure these policies, Configuration Manager will no longer manage updates to Microsoft 365 Apps.

For information about the *Update Channel* policy, see [Use Group Policy to install Microsoft 365 Insider on Windows devices](group-policy.md).

For the *Management of Microsoft 365 Apps for enterprise* policy, set it to Disabled.

For the *Update Path* policy, set the policy to Enabled, but leave the update location blank. That way Microsoft 365 Apps get updates from Microsoft directly from the internet, which is our recommendation.

After you configure the policies, it might take at least 90 minutes before they're applied to the device. Then, the Microsoft 365 Insider channel should be installed the next time Microsoft 365 Apps checks for updates. You can force Microsoft 365 Apps to check for updates by going to **File** > **Account** > **Update Options** > **Update Now** in an app, such as Word.