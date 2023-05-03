---
title: "Licensing and activation data sent to Office 365 by Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Describes what data Microsoft 365 Apps sends to Office 365 services for licensing and activation purposes."
ms.date: 03/01/2023
---

# Licensing and activation data sent to Office 365 by Microsoft 365 Apps

  
Computers that have Microsoft 365 Apps installed occasionally need to send data to Office 365. This data helps Office 365 do the following:
  
- Register the computer and activate Microsoft 365 Apps
    
- Check the status of the Office 365 (or Microsoft 365) subscription
    
- Manage product keys for Microsoft 365 Apps
    
This article shows the data that is sent to Office 365 for each of these tasks.
  
## Registering the computer and activating Microsoft 365 Apps
<a name="BKMK_RegisterCompAndActivate"> </a>

During the installation and activation process, Microsoft 365 Apps connects to the Office Licensing Service, and sends the following data:
  
****

|**Data**|**Description**|**Purpose**|
|:-----|:-----|:-----|
|OrgId user identity  <br/> |The OrgId ticket generated when the user signs in to Office 365.  <br/> |Used to authenticate the call with the Office Licensing Service. The user signs in to their subscription account to retrieve a license for Office 365.  <br/> |
|Machine Key  <br/> |The serial number of the Microsoft 365 Apps product key for the computer.  <br/> |Used to uniquely identify the Microsoft 365 Apps product key used by the computer.  <br/> |
|Machine Name  <br/> |The friendly name of the computer, as set by the user in the operating system. For example, if the full name of a computer is "computer1.contoso.com," only "computer1" is sent to Office 365.  <br/> |This value is needed so users can identify which computers they have activated Microsoft 365 Apps on when they sign in to the Office 365 portal. On the software page, they see a list of their computers and can manage their Microsoft 365 Apps installations.  <br/> |
|Machine ID  <br/> |The hardware ID of the computer.  <br/> |Used to uniquely identify that computer.  <br/> |
   
## Checking the status of the Office 365 subscription
<a name="BKMK_CheckSubscriptionStatus"> </a>

Once Microsoft 365 Apps is installed and activated, a process runs once a day to connect to the Office Licensing Service. The purpose is to check whether the Office 365 (or Microsoft 365) subscription is still active or if it has changed in any way. The connection needs to succeed at least once a month for Microsoft 365 Apps to remain fully functional.
  
Microsoft 365 Apps connects to the Office Licensing Service, and sends the following data:
  
****

|**Data**|**Description**|**Purpose**|
|:-----|:-----|:-----|
|Machine Key  <br/> |The serial number of the Microsoft 365 Apps product key for the computer.  <br/> |Used to uniquely identify the Microsoft 365 Apps product key used by the computer.  <br/> |
   
## Managing product keys for Microsoft 365 Apps
<a name="BKMK_ManageProductKeys"> </a>

Microsoft 365 Apps uses a standard Microsoft technology called Activation &amp; Validation Service to activate and validate keys. Since Microsoft 365 Apps product keys need to be renewed every month, communication with the Activation &amp; Validation Service is necessary on a monthly basis.
  
For a description of the data sent, see the Activation section of the [Windows 8 and Windows Server 2012 Privacy Statement](https://go.microsoft.com/fwlink/p/?LinkId=313210)
  
## Related topics
[Overview of licensing and activation in Microsoft 365 Apps](overview-licensing-activation-microsoft-365-apps.md)
  
[Office 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges)