---
title: "Overview of the Office Customization Tool for Click-To-Run"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 11/28/2017
ms.audience: ITPro
ms.topic: article
ms.prod: office-online-server
localization_priority: Normal
ms.assetid: fd387616-8ebc-4a38-a08a-604bf5d84594
description: "This article describes a preview tool that isn't available to everyone and is subject to change."
---

# Overview of the Office Customization Tool for Click-To-Run

 *This article describes a preview tool that isn't available to everyone and is subject to change.* 
  
The Office Customization Tool for Click-to-Run (preview) creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users. After creating the configuration files, you can use them with the Office 2016 Deployment Tool, System Center Configuration Manager, or a third-party software distribution solution to deploy a customized version of Office.
  
## Get started
<a name="BKMK_GetStarted"> </a>

 The Office Customization Tool for Click-to-Run (preview) is an Azure-based cloud service that can create and update XML configuration files that are used with the Office 2016 Deployment Tool. In the past, you needed to create the configuration files in Notepad or another text editor. The Office Customization Tool makes this part of the deployment process easier and less likely to introduce errors.
  
To work with the service, go to [ Office Customization Tool for Click-to-Run (preview)](https://enterprise.officeppe.com/oct) and choose the software, languages, and settings you want to configure. For example, you can create a configuration file that downloads the 32-bit English edition of Office, or you can create a file that installs the 32-bit English edition of Office with the EULA automatically accepted and without Publisher. When you're done, you can export the configuration file, which you can then use with the Office 2016 Deployment Tool to deploy Office in your organization.
  
To edit existing configuration files, you can import them into the tool, make updates, and then export them.
  
## Learn more
<a name="BKMK_LearnMore"> </a>

To learn how to use the configuration file as part of the overall deployment process, see [Deploy Office 365 ProPlus from a local source](deploy-office-365-proplus-from-a-local-source.md) or[Deploy Office 365 ProPlus from the cloud](deploy-office-365-proplus-from-the-cloud.md). These articles cover how to use the Office 2016 Deployment Tool as part of an end-to-end deployment. Instead of creating the configuration file in a text editor, as the articles recommend, you can use the Office Customization Tool.
  
To learn about the settings for the Office Customization Tool, see [Configuration options for the Office 2016 Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).
  
## See also
<a name="BKMK_LearnMore"> </a>

#### Other Resources

[Deploy Office 365 ProPlus from a local source](deploy-office-365-proplus-from-a-local-source.md)
  
[Deploy Office 365 ProPlus from the cloud](deploy-office-365-proplus-from-the-cloud.md)
  
[Configuration options for the Office 2016 Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)

