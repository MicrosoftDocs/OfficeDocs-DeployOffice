---
title: "Best practices Common debugging steps"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 6/1/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: b584fcff-d64d-426a-b20f-fc93707cf46c
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Common debugging steps

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
The following steps are common issues that can occur when you deploy and manage Office 365 ProPlus:
  
1. Use a network scanning utility such as Process Monitor, Wireshark, or Fiddler to see if throughput or connections are being blocked:
    
  - OfficeC2RClient.exe
    
  - OLicenseHeartbeat.exe
    
2. Does the system account running the processes have proxy access?
    
3. Are the appropriate network and firewall rules open for Office 365 traffic?
    
4. Make sure that you are using the latest version of the [Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117) (updated regularly).
    
5. Make sure that your XML syntax is correct by using the [GitHub XML script editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
    
6. Check for new GPOs in the [Office 2016 Administrative Template files](https://www.microsoft.com/en-us/download/details.aspx?id=49030) (updated regularly).
    
7. Does the account that is being used to install Office 365 ProPlus have administrative privileges?
    

