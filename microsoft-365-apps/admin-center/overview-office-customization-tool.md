---
title: "Overview of the Office Customization Tool"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: chhopkin
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: true
description: "The Office Customization Tool creates the configuration files that are used to deploy Office in large organizations."
ms.date: 03/29/2024
---

# Overview of the Office Customization Tool

The [Office Customization Tool](https://config.office.com/deploymentsettings) creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which applications and languages are installed, how those applications should be updated, and application preferences. After creating the configuration files, you can use them with the [Office Deployment Tool](../overview-office-deployment-tool.md) to deploy a customized version of Office.

> [!NOTE]
> The Office Customization Tool is part of the deployment process for installing Office on hundreds or thousands of computers. To follow this process end-to-end, we recommend completing the [assessment](../assess-microsoft-365-apps.md) and [planning](../plan-microsoft-365-apps.md) phases for your Office deployment. If you're not an enterprise administrator and are looking to install Office in your home or business, see [Install Office with Office 365](https://go.microsoft.com/fwlink/p/?LinkId=273820).

## Get started

To work with the service, go to [Office Customization Tool](https://config.office.com/deploymentsettings) and choose the products, languages, and application preferences you want to configure. For example, you can create a configuration file that downloads the 64-bit English version of Microsoft 365 Apps, or you can create a file that installs the 64-bit English and German version of Office without Access and Publisher and with the license terms automatically accepted. When you're done, you export the configuration file, which you can then use with the [Office Deployment Tool](../overview-office-deployment-tool.md) or another software distribution solution to deploy Office in your organization.
  
> [!NOTE]
> If you use Microsoft Configuration Manager (current branch) to deploy Office, we recommend using the Office 365 Installer wizard in the Configuration Manager console. That wizard includes a customized version of the Office Customization Tool. For more information, see [Deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)](../deploy-microsoft-365-apps-configuration-manager.md).

## Create a configuration file

Follow these steps to create a configuration file that can be used by the Office Deployment Tool or another software distribution solution to install Office.

> [!NOTE]
> We recommend saving and managing your configuration files in the cloud. To do so, sign in to the Microsoft 365 Apps admin center before you create your configuration file. For more information, see [Save and manage configuration files in the cloud](#save-and-manage-configuration-files-in-the-cloud).

1. Go to [Office Customization Tool](https://config.office.com/deploymentsettings).
2. In the **Product and releases** section, choose the architecture you want to deploy. Each configuration file can only deploy one architecture. For details on which architecture to choose, see [Choose the 32-bit or 64-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
3. Choose the products you want to deploy.
4. Choose the update channel you want to deploy. The update channel determines how frequently your client devices are updated with new features. For best practice recommendations, see [Step 3 - Choose your update channels](../plan-microsoft-365-apps.md#step-3---choose-your-update-channels).
5. Choose which version you want to deploy. Unless you require a particular version, we recommend choosing the latest. For details on previous versions, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date).
6. Choose the Apps and Features you want to include.
7. In the **Language** section, choose which languages to include. You can include multiple languages and you can select **Match operating system** to automatically install the same languages that are in use on the client device. For more information, see [Overview of deploying languages for Microsoft 365 Apps](../overview-deploying-languages-microsoft-365-apps.md).

> [!IMPORTANT]
> - There is a known issue where you can select a language that isn't supported by the product you've selected. 
> - For example, you can select English (United Kingdom), French (Canada), or Spanish (Mexico) when installing Project or Visio, but those languages aren't supported in Project and Visio.
> - In those cases, if you don't manually correct the xml file that is created by the Office Customization Tool, your installation will fail.
> - For a list of supported languages, see the following articles: [What languages is Office available in?](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec) and [Display languages supported in the Visio desktop app](https://support.microsoft.com/office/a921983e-fd5d-45ef-8af1-cedf70c53d75). Project supports the same languages that Visio does.

7. In the **Installation** section, choose whether to install the Office files directly from the cloud or from a local source on your network. For more information, see [Choose how to deploy](../plan-microsoft-365-apps.md#step-1---choose-how-to-deploy).
8. Choose whether to display the installation to your end users. For more information, see [Display element](../office-deployment-tool-configuration-options.md#display-element).
9. Choose whether to shut down running applications.
10. In the **Update and upgrade** section,  choose whether to install updates directly from the cloud, from a local source on your network, or with Configuration Manager. If you want to update your client devices automatically, select **CDN** and **Automatically check for updates**. For best practice recommendations, see [Choose your update channels](../plan-microsoft-365-apps.md#step-3---choose-your-update-channels).
11. Choose whether to automatically remove all MSI-versions of Office, and whether to automatically install the same language as the removed MSI-version of Office. For more information, see [Install the same languages as a previous MSI installation](../overview-deploying-languages-microsoft-365-apps.md#install-the-same-languages-as-a-previous-msi-installation).
12. Choose whether to automatically upgrade the architecture. For more information, see [Change a Microsoft 365 Apps installation from 32-bit to 64-bit](../change-bitness.md).
13. In **Licensing and activation** section, choose whether to automatically accept the license terms.
14. If you are deploying a volume-licensed version of Office, Visio, or Project, specify the appropriate license key settings. Microsoft 365 Apps is not volume licensed and does not require a KMS or MAK activation. For more information, see [Overview of volume activation of Office](../vlactivation/plan-volume-activation-of-office.md).
15. Choose how to activate the product, where it be **User based**, **Shared Computer**, or **Device based**. For more infomation, see [Overview of licensing and activation in Microsoft 365 Apps](../overview-licensing-activation-microsoft-365-apps.md), [Overview of shared computer activation for Microsoft 365 Apps](../overview-shared-computer-activation.md), and [Device-based licensing for Microsoft 365 Apps for enterprise](../device-based-licensing.md)
16. In the **General** section, type your organization name and a description for this particular configuration. For example, you might want to use this file to install the 64-bit version of Office for your finance department.
17. In the **Application preferences** section, choose what preferences to apply when deploying Office. You can search for a setting, filter the preferences by Office app, and learn more about each setting by selecting it and reviewing the detailed description.
18. Select **Finish**, review the configured settings in the right-hand pane, and then select **Export**.
19. Accept the terms in the license agreement, name the configuration file, and then select **Export** or, if you're saving the configuration file to the cloud, select **Done**.
20. You can now use the configuration file in your deployment workflow with the Office Deployment Tool or another software distribution solution.

## Edit an existing configuration file

Follow these steps to import and edit an existing configuration file.

1. Go to [Office Customization Tool](https://config.office.com/deploymentsettings).
2. Select **Import**, and then select the configuration file you want to edit.
3. Change the settings you want, and then export the updated file.

## Save and manage configuration files in the cloud

You can now use the Office Customization Tool to create, save, and manage your deployment configuration files in the cloud. You can also refer to these cloud-based files directly when running the Office Deployment Tool.

> [!IMPORTANT]
>- Saving and managing configuration files in the cloud isn't available to customers who have the following plans:
>   - Office 365 operated by 21Vianet
>   - Office 365 GCC High and DoD
> - Office 365 GCC customers can save and manage configuration files in the cloud.

To work with configuration files in the cloud, sign in to the [Microsoft 365 Apps admin center](https://config.office.com/) and go to the [Device Configuration](https://config.office.com/officeSettings/configurations) page under **Customization**. From that page, you can do the following actions:

- To create a new file, select **Create**, create a configuration file, and then select **Done**. The configuration file is automatically saved to the cloud as part of your tenant.
- To edit an existing file, select the name of the file, make your changes, and then select **Done**.
- To get a link to a configuration file, select the file, select **Get Link**, and then select **Copy**. You can use the link to refer to the configuration file when you use the Office Deployment Tool. Note that the link will expire after two years.

When running the Office Deployment Tool, you refer to the cloud-based configuration file by including the link in quotes. To deploy with the ODT, for example, use `setup.exe /configure "link"`.

You can also copy, upload, or download configuration files from the **Device Configuration** page. For example, you can create a baseline configuration file and then create copies of that baseline for custom configurations.

## Define application preferences

As part of the Office Customization Tool, you can define application preferences for supported products, including VBA macro notifications, default file locations, and default file formats. When you define these preferences, you can apply them as part of deploying Office or you can apply them to an existing installation of Office without changing any other deployment settings. For more information, see [Apply application preferences](../overview-office-deployment-tool.md#apply-application-preferences-to-microsoft-365-apps) and [Apply application preferences to an existing installation of Office](../overview-office-deployment-tool.md#apply-application-preferences-to-an-existing-installation-of-microsoft-365-apps).

## ID and Host attributes

When creating a configuration file, the Office Customization Tool includes two attributes for the Configuration element: The ID attribute, which identifies the deployment method, and the Host attribute, which identifies the deployment options that have been selected. These attributes don't contain any personally identifiable information (PII), but Click-to-Run sends the attribute values to Microsoft so that we can better understand what configurations customers use and make customization even easier. Because of these insights, we recommend keeping the attributes. They are optional, however, and can be removed without affecting your deployment.
