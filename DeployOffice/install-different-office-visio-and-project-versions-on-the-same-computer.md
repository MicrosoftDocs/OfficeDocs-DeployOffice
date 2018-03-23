---
title: "Supported scenarios for installing different versions of Office, Visio, and Project on the same computer"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 4/14/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: efeca365-f49c-42b1-899b-80878a398e5c
description: "Provides IT admins with information about which versions of Office, Visio, and Project can be installed on the same computer."
---

# Supported scenarios for installing different versions of Office, Visio, and Project on the same computer

 **Summary:** Provides IT admins with information about which versions of Office, Visio, and Project can be installed on the same computer. 
  
 **Audience:** Admins who deploy and manage Office, Visio, and Project in organizations. 
  
In many cases, you can install Office, Visio, and Project on the same computer. But, there are some combinations of Office, Visio, and Project that can't be installed together on the same computer. 
  
The two things that determine whether Office, Visio, and Project can be installed together on the same computer are the following:
  
- The version — 2013 or 2016.
    
- The installation technology — Click-to-Run or Windows Installer (MSI)
    
Most versions of Office, Visio, and Project for 2013 and 2016 are installed by using Click-to-Run. If you have a volume licensed edition of Office, Visio, or Project, those use Windows Installer (MSI). For more information, see [How to determine whether you're using a Click-to-Run or MSI installation](install-different-office-visio-and-project-versions-on-the-same-computer.md#BKMK_Determine) and [Examples of Click-to-Run and MSI versions of Office, Visio, and Project](install-different-office-visio-and-project-versions-on-the-same-computer.md#BKMK_Examples).
  
The following table covers the two general rules for which installation scenarios are supported and provides some examples.
  
|**Rule**|**Not supported example**|**Supported example**|
|:-----|:-----|:-----|
|You can't install two products together that have the same version but use different installation technologies.  <br/> | MSI version of Project 2016  <br/><br/>  Click-to-Run version of Office 2016  <br/> | MSI version of Project 2013  <br/><br/>  Click-to-Run version of Office 2016  <br/> |
|You can't install two products together that use different versions of the Click-to-Run installation technology, if those products have overlapping Office applications.<sup>1</sup> <br/> | Retail version of Visio 2013  <br/><br/>  2016 version of Visio Pro for Office 365  <br/> | 2013 version of Visio Pro for Office 365  <br/><br/>  2016 version of Office 365 ProPlus  <br/> |
   
<sup>1</sup>Office 2013 software that uses Click-to-Run can be installed on the same computer with Office 2016 software that uses Click-to-Run, as long as there is no overlap in the applications installed. Here are some examples:
- **Supported** Installing the retail version of Project Professional 2013, which uses Click-to-Run, on the same computer with the Office 2016 version of Office 365 ProPlus. 
- **Not supported** Installing the 2013 version of Visio Pro for Office 365 on the same computer with the 2016 version of Visio Pro for Office 365. 
- **Not supported** Installing the retail version of Access 2013, which uses Click-to-Run, on the same computer with the Office 2016 version of Office 365 ProPlus. That's because Office 365 ProPlus includes Access. > 

<a name="BKMK_Office"> </a>
## Supported installation scenarios for Office 2016

The following table shows which versions of Visio and Project can be installed on the same computer with Click-to-Run and MSI versions of Office 2016.
  
|**Version**|**Office 2016 (Click-to-Run)**|**Office 2016 (MSI)**|
|:-----|:-----|:-----|
|Visio 2016 (Click-to-Run)  <br/> |Yes  <br/> |No  <br/> |
|Visio 2016 (MSI)  <br/> |No<sup>1</sup> <br/> |Yes  <br/> |
|Visio 2013 (Click-to-Run)  <br/> |Yes  <br/> |Yes  <br/> |
|Visio 2013 (MSI)  <br/> |Yes  <br/> |Yes  <br/> |
|Project 2016 (Click-to-Run)  <br/> |Yes  <br/> |No  <br/> |
|Project 2016 (MSI)  <br/> |No<sup>1</sup> <br/> |Yes  <br/> |
|Project 2013 (Click-to-Run)  <br/> |Yes  <br/> |Yes  <br/> |
|Project 2013 (MSI)  <br/> |Yes  <br/> |Yes  <br/> |
   
<sup>1</sup> You can use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016 on the same computer with a Click-to-Run version of Office 2016. For more information, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](https://support.office.com/article/82691bd7-a3d5-47ca-8d8a-0ee43ec2c01f). 
  
<a name="BKMK_Visio"> </a>
## Supported installation scenarios for Visio 2016

The following table shows which versions of Visio 2016 can be installed on the same computer with Click-to-Run and MSI versions of Office 2016 and Office 2013.
  
|**Version**|**Visio 2016 (Click-to-Run)**|**Visio 2016(MSI)**|
|:-----|:-----|:-----|
|Office 2016 (Click-to-Run)  <br/> |Yes  <br/> |No<sup>1</sup> <br/> |
|Office 2016 (MSI)  <br/> |No  <br/> |Yes  <br/> |
|Office 2013 (Click-to-Run)  <br/> |Yes  <br/> |Yes  <br/> |
|Office 2013 (MSI)  <br/> |Yes  <br/> |Yes  <br/> |
   
<sup>1</sup> You can use the Office Deployment Tool to install volume licensed editions of Visio 2016 on the same computer with a Click-to-Run version of Office 2016. For more information, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](https://support.office.com/article/82691bd7-a3d5-47ca-8d8a-0ee43ec2c01f). 
  
<a name="BKMK_Project"> </a>
## Supported installation scenarios for Project 2016

The following table shows which versions of Project 2016 can be installed on the same computer with Click-to-Run and MSI versions of Office 2016 and Office 2013.
  
|**Version**|**Project 2016 (Click-to-Run)**|**Project 2016 (MSI)**|
|:-----|:-----|:-----|
|Office 2016 (Click-to-Run)  <br/> |Yes  <br/> |No<sup>1</sup> <br/> |
|Office 2016 (MSI)  <br/> |No  <br/> |Yes  <br/> |
|Office 2013 (Click-to-Run)  <br/> |Yes  <br/> |Yes  <br/> |
|Office 2013 (MSI)  <br/> |Yes  <br/> |Yes  <br/> |
   
<sup>1</sup> You can use the Office Deployment Tool to install volume licensed editions of Project 2016 on the same computer with a Click-to-Run version of Office 2016. For more information, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](https://support.office.com/article/82691bd7-a3d5-47ca-8d8a-0ee43ec2c01f). 
  
<a name="BKMK_Determine"> </a>
## How to determine whether you're using a Click-to-Run or MSI installation

In an Office app (such as Excel), Visio, or Project go to **File** > **Account**. If you see **Office Updates** in the **Product Information** area, you have a Click-to-Run installation. If you don't see **Office Updates**, you have a Windows Installer (MSI) version.
  
<a name="BKMK_Examples"> </a>
## Examples of Click-to-Run and MSI versions of Office, Visio, and Project

There are different ways to purchase Office, Visio, and Project. For example, you can purchase them as part of an Office 365 plan, as a one-time purchase from a retail store, or thorough a volume licensing agreement. How you purchase them determines whether they're a Click-to-Run or MSI version.
  
 **Office 365 plans** All versions of Office, Visio, and Project that come with an Office 365 plan are installed by using Click-to-Run. These include both the 2013 and 2016 versions of the following: 
  
- Office 365 ProPlus
    
- Visio Pro for Office 365
    
- Project Online Desktop Client
    
- Office 365 Business
    
Office 365 Business is the version of Office that comes with some Office 365 plans, such as Business Premium.
  
 **Retail versions** Retail versions of Office, Visio, or Project for 2013 and 2016 are installed by using Click-to-Run. A retail version is a one-time purchase (as opposed to an Office 365 subscription) that you buy from a retail store or online. For example, Visio Standard 2016 purchased from the Microsoft Store. This can also include standalone versions of applications, such as Access 2016. 
  
 **Volume license agreements** Some organizations purchase their software through volume licensing. Volume licensed editions of Office, Visio, and Project are installed by using Windows Installer (MSI). Examples of volume license editions include both the 2013 and 2016 versions of the following: 
  
- Office Professional Plus
    
- Office Standard
    
- Visio Professional
    
- Visio Standard
    
- Project Professional
    
- Project Standard
    
> [!NOTE]
> Both the Standard and Professional versions of Visio and Project can be purchased either from retail or from volume licensing. Even though the versions have the same name, they use different installation technologies. 
  
## Related topics
[Deployment guide for Visio 2016](deployment-guide-for-visio.md)
  
[Deployment guide for Project 2016](deployment-guide-for-project.md)

