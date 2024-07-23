---
title: "What's new for admins in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
ms.collection: Tier2
description: "Provides IT admins with an overview of the new features and capabilities in Office 2016."
ms.date: 04/19/2024
---

# What's new for admins in Office 2016

 **Summary:** Provides IT admins with an overview of the new features and capabilities in Office 2016. 
  
  
The following is intended to highlight the new features and capabilities of Office 2016 that admins might want to know about as they plan to deploy Office 2016 to the users in their organization.
  
If you're looking for information for end users about the new features in Word, Excel, and the other Office apps, see [What's new and improved in Office 2016](https://support.microsoft.com/office/29d7e38e-ef06-4d9c-a476-03d896928b2f).
  
## Updated system requirements for Office 2016

With any new software release, you should [review the system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) to ensure that your computers meet those requirements. For example, for Office 2016, the minimum requirement is now 2 GB of RAM. 
  
Another important change to be aware of is that Outlook 2016 doesn't support connecting to Exchange Server 2007.
  
## New Group Policy settings added for Office 2016

As with any new version of Office, there's a new set of Administrative Template files (ADMX/ADML) for Group Policy settings. You can [download the Administrative Template files](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center. Included in the download is an Excel file that contains a list of all the Group Policy settings and a list of the new policy settings for Office 2016. 
  
## Outlook 2016 adds support for multi-factor authentication (MFA)

Multi-factor authentication (MFA) is now available in Outlook through integration with the Active Directory Authentication Library (ADAL).
  
## Outlook 2016 now requires Autodiscover to be configured

Outlook now requires Autodiscover to be configured or it's unable to connect to Exchange Server. Outlook retrieves Exchange connectivity settings directly from Autodiscover instead of the registry, making profiles more reliable, but that also makes Autodiscover a required feature. For more information, see [Autodiscover service](/Exchange/architecture/client-access/autodiscover). 
  
## Microsoft Purview Data Loss Prevention (DLP) added to Word 2016, Excel 2016, and PowerPoint 2016

Microsoft Purview Data Loss Prevention (DLP) is now available in Word, Excel, and PowerPoint. Admins can centrally create, manage, and enforce policies for content authoring and document sharing. End users see policy tips or sharing restrictions when the apps detect a potential policy violation. This capability is available with SharePoint Online and OneDrive.
  
## Visio 2016 supports Information Rights Management (IRM)

IRM protection is now available for Visio files, enabling both online and offline protection of Visio diagrams. For more information, see [Protect sensitive messages and documents using Information Rights Management (IRM) in Office 2016](2016/security/protect-sensitive-messages-documents-using-irm.md).
## Related articles

- [Changes in Office 2016](changes-windows-desktop.md)
- [Office Help & Training](https://support.microsoft.com/office)
