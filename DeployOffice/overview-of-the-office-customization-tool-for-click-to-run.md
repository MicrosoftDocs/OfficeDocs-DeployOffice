---
title: "Overview of the Office Customization Tool for Click-to-Run"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
ms.assetid: 
description: "The Office Customization Tool (preview) creates the configuration files that are used to deploy Office in large organizations."
---

# Overview of the Office Customization Tool for Click-To-Run (preview)

The Office Customization Tool creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and settings for Office applications. After creating the configuration files, you can use them with the Office Deployment Tool, System Center Configuration Manager, or a third-party software distribution solution to deploy a customized version of Office.
 
## Get started

The Office Customization Tool is an Azure-based cloud service which allows you to create XML configuration files that are used with the Office Deployment Tool. In the past, you needed to create the configuration files in Notepad or another text editor. The Office Customization Tool makes this part of the deployment process easier and less likely to introduce errors.

To work with the service, go to [Office Customization Tool for Click-to-Run](https://config.office.com/) and choose the products, languages, and settings you want to configure. For example, you can create a configuration file that downloads the 64-bit English edition of Office 365 ProPlus, or you can create a file that installs the 64-bit English and German edition of Office without Access and Publisher and with the EULA automatically accepted. When you're done, you export the configuration file, which you can then use with the Office Deployment Tool to deploy Office in your organization. 

The rest of this article covers this procedure in more detail. For more details on the settings for the Office Customization Tool, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

## Before you begin

The Office Customization Tool is part of of a deployment process for installing Office on hundreds or thousands of computers. To follow this process end-to-end, we recommend completing the [assessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus.md) phases for your Office deployment.

If you're not an enterprise administrator and are looking to install Office 365 in your home or business, see [Install Office with Office 365](https://go.microsoft.com/fwlink/?LinkId=273820).
  
## Create a configuration file

Follow these steps to create a configuration file that can be used by the Office Deployment Tool to install Office.

1. Go to [Office Customization Tool for Click-to-Run](https://config.office.com/).
2. In the General settings, type your organization name and a description for this particular configuration. For example, you might want to use this file to install 64-bit version of Office in the Finance department.
3. In the Product settings, choose the architecture you want to deploy. Each configuration file can only deploy one architecture. For details on which architecture to choose, see [Choose the 32-bit or 64-bit version of Office](https://support.office.com/article/Choose-between-the-64-bit-or-32-bit-version-of-Office-2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
4. Choose the products and applications you want to deploy. 

## Customize application settings

As part of the Office Customization Tool for Click-to-Run, you can define application settings for Office 365 ProPlus, including VBA macro notifications, default file locations, and default file formats. When you define these settings, you can apply them as part of deploying Office or you can apply them to an existing installation of Office without changing any other deployment settings. For more details, see [Apply application settings](overview-of-the-office-2016-deployment-tool.md#apply-application-settings-to-office-365-proplus) and [Apply application settings to an existing installation of Office](overview-of-the-office-2016-deployment-tool.md#apply-application-settings-to-an-existing-installation-of-office-365-proplus).


