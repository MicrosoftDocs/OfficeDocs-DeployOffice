---
title: "Overview of the Office Customization Tool"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
ms.assetid: 
description: "The Office Customization Tool creates the configuration files that are used to deploy Office in large organizations."
---

# Overview of the Office Customization Tool

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

The [Office Customization Tool](https://config.office.com/) creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which applications and languages are installed, how those applications should be updated, and application preferences. After creating the configuration files, you can use them with the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) to deploy a customized version of Office.

> [!NOTE] 
> The Office Customization Tool is part of the deployment process for installing Office on hundreds or thousands of computers. To follow this process end-to-end, we recommend completing the [assessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus.md) phases for your Office deployment. If you're not an enterprise administrator and are looking to install Office in your home or business, see [Install Office with Office 365](https://go.microsoft.com/fwlink/p/?LinkId=273820).
 
## Get started

To work with the service, go to [Office Customization Tool](https://config.office.com/) and choose the products, languages, and application preferences you want to configure. For example, you can create a configuration file that downloads the 64-bit English version of Microsoft 365 Apps, or you can create a file that installs the 64-bit English and German version of Office without Access and Publisher and with the EULA automatically accepted. When you're done, you export the configuration file, which you can then use with the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) or another software distribution solution to deploy Office in your organization. 
  
> [!NOTE] 
> If you use Microsoft Endpoint Configuration Manager (current branch) to deploy Office, we recommend using the Office 365 Installer wizard in the Configuration Manager console. That wizard includes a customized version of the Office Customization Tool. For more details, see [Deploy Office 365 ProPlus with Microsoft Endpoint Configuration Manager (current branch)](deploy-office-365-proplus-with-configuration-manager.md).

## Create a configuration file

Follow these steps to create a configuration file that can be used by the Office Deployment Tool or another software distribution solution to install Office. 

> [!NOTE] 
> We recommend saving and managing your configuration files in the cloud. To do so, sign in to the Office 365 Client Configuration Service before you create your configuration file.  For more details, see [Save and manage configuration files in the cloud](#save-and-manage-configuration-files-in-the-cloud).

1. Go to [Office Customization Tool](https://config.office.com/).
2. In the **Product and releases** section, choose the architecture you want to deploy. Each configuration file can only deploy one architecture. For details on which architecture to choose, see [Choose the 32-bit or 64-bit version of Office](https://support.office.com/article/Choose-between-the-64-bit-or-32-bit-version-of-Office-2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
3. Choose the products and applications you want to deploy.
4. Choose the update channel you want to deploy. The update channel determines how frequently your client devices are updated with new features. For best practice recommendations, see [Step 3 - Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels).
5. Choose which version you want to deploy. Unless you require a particular version, we recommend choosing the latest. For details on previous versions, see [Update history for Office 365 ProPlus](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).
6. In the **Language** section, choose which languages to include. You can include multiple languages and you can select **Match operating system** to automatically install the same languages that are in use on the client device. For more details, see [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md).
7. In the **Installation** section, choose whether to install the Office files directly from the cloud or from a local source on your network. For more details, see [Choose how to deploy](plan-office-365-proplus.md#step-1---choose-how-to-deploy).
8. Choose whether to display the installation to your end users and whether to pin the Office icons to the taskbar. For more details on these options, see [Display element](configuration-options-for-the-office-2016-deployment-tool.md#display-element) and [PinIconsToTaskBar property](configuration-options-for-the-office-2016-deployment-tool.md#piniconstotaskbar-property-part-of-property-element).
9. In the **Update and upgrade** section,  choose whether to install updates directly from the cloud, from a local source on your network, or with Configuration Manager. If you want to update your client devices automatically, choose **CDN** and **Automatically check for updates**. For best practice recommendations, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels).
10. Choose whether to automatically remove all MSI-versions of Office, and whether to automatically install the same language as the removed MSI-version of Office. For more details, see [Install the same languages as a previous MSI installation](overview-of-deploying-languages-in-office-365-proplus.md#install-the-same-languages-as-a-previous-msi-installation).
11. If you are deploying a volume-licensed version of Office, Visio, or Project, specify the appropriate license key in **Licensing and activation** settings. Note that Microsoft 365 Apps is not volume licensed and does not require a KMS or MAK activation. For more details, see [Overview of volume activation of Office](vlactivation/plan-volume-activation-of-office.md).
12. In the **General** section, type your organization name and a description for this particular configuration. For example, you might want to use this file to install the 64-bit version of Office for your finance department.
13. Choose whether to automatically accept the EULA. 
14. Choose whether to enabled shared computer activation. For more details, see [Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md).
15. In the **Application preferences** section, choose what preferences to apply when deploying Office. You can search for a setting, filter the preferences by Office app, and learn more about each setting by clicking it and reviewing the detailed description.
16. Click **Finish**, review the configured settings in the right-hand pane, and then click **Export**.
17. Accept the terms in the license agreement, name the configuration file, and then click **Export** or, if you're saving the configuration file to the cloud, click **Done**. 
18. You can now use the configuration file in your deployment workflow with the Office Deployment Tool or another software distribution solution.

## Edit an existing configuration file

Follow these steps to import and edit an existing configuration file.

1. Go to [Office Customization Tool](https://config.office.com/).
2. Click **Import**, and then select the configuration file you want to edit.
3. Change the settings you want, and then export the updated file.

## Save and manage configuration files in the cloud

You can now use the [Office Customization Tool](https://config.office.com/) to create, save, and manage your deployment configuration files in the cloud. You can also refer to these cloud-based files directly when running the Office Deployment Tool. 


To work with configuration files in the cloud, sign in to the [Office 365 Client Configuration Service](https://config.office.com/) and go to the [Device Configuration](https://config.office.com/officeSettings/configurations) page. From that page, you can do the following:

- To create a new file, click **Create**, create a configuration file, and then click **Done**. The configuration file is automatically saved to the cloud as part of your tenant.
- To edit an existing file, click the name of the file, make your changes, and then click **Done**.
- To get a link to a configuration file, select the file, click **Get Link**, and then click **Copy**. You can use the link to refer to the configuration file when you use the Office Deployment Tool. 

When running the Office Deployment Tool, you refer to the cloud-based configuration file by including the link in quotes. To deploy with the ODT, for example, use `setup.exe /configure "link"`.

You can also copy, upload, or download configuration files from the Device Configuration page. For example, you can create a baseline configuration file and then create copies of that baseline for custom configurations.

## Define application preferences

As part of the Office Customization Tool, you can define application preferences for supported products, including VBA macro notifications, default file locations, and default file formats. When you define these preferences, you can apply them as part of deploying Office or you can apply them to an existing installation of Office without changing any other deployment settings. For more details, see [Apply application preferences](overview-of-the-office-2016-deployment-tool.md#apply-application-preferences-to-office-365-proplus) and [Apply application preferences to an existing installation of Office](overview-of-the-office-2016-deployment-tool.md#apply-application-preferences-to-an-existing-installation-of-office-365-proplus).

## Notes

When creating a configuration file, the Office Customization Tool includes two attributes for the Configuration element: The ID attribute, which identifies the deployment method, and the Host attribute, which identifies the deployment options that have been selected. These attributes don't contain any personally identifiable information (PII), but Click-to-Run sends the attribute values to Microsoft so that we can better understand what configurations customers use and make customization even easier. Because of these insights, we recommend keeping the attributes. They are optional, however, and can be removed without affecting your deployment.










