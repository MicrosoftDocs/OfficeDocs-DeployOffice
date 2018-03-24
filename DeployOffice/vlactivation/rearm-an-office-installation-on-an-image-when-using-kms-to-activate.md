---
title: "Rearm the Office 2016 KMS-based volume activation installation"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ms.assetid: 1a0f1f39-2923-4be7-9339-fb54a03de27d
description: "How to reset the grace timer and reset the client computer ID in Office 2016 KMS installation by rearming the image."
---

# Rearm the Office 2016 KMS-based volume activation installation

 **Summary:** How to reset the grace timer and reset the client computer ID in Office 2016 KMS installation by rearming the image. 
  
 **Audience:** IT Professionals 
  
There is a 25-day grace period from the time of installation of Key Management Service (KMS) clients before notifications to activate are displayed to the user. If you want to deploy an image, you must rearm your Office 2016 installation before you capture the image. If you do not rearm, users see notification dialog boxes at the time that the image is deployed, instead of 25 days after deployment. The 25-day grace period gives ample time for a KMS host computer to be found and activation to succeed. If activation is successful, users do not see notifications to activate.
  
Rearming does the following important tasks:
  
- Resets the grace timer to 30 days.
    
- Freezes the grace timer until either an Office application is run, or the ospp.vbs script is run.
    
- Resets the client computer ID (CMID). This is important because the KMS host uses the CMID to determine the number of unique clients. To check the CMID, use the command **ospp.vbs /dcmid**. For more information about ospp.vbs, see [The ospp.vbs script](tools-to-manage-volume-activation-of-office.md#section1).
    
    > [!NOTE]
    > If you run this command on either Windows 8 or Windows Server 2012, it only returns to CMID for Windows, not Office. To see the CMID for Office 2016, look for event 12288 in the Application Event log as shown in this [Office deployment support team blog](https://go.microsoft.com/fwlink/p/?LinkId=317885) article. 
  
You can rearm five times, unless you activate Office by using a KMS host. If you run out of rearms, activating by using a KMS host lets you rearm once.
  
Rearming is also recommended for MAK deployment. If you are deploying Office 2016 that is configured for MAK activation, and you do not remotely activate for end-users through Volume Activation Management Tool (VAMT) or ospp.vbs, users see an activation dialog box the first time that an Office 2016 application starts. The activation dialog box is slightly different 25 days after installation. Also, users might immediately see a red title bar warning them of activation issues if Office 2016 was not rearmed before image capture.
  
### To rearm your Office KMS based installation

1. Verify that the user account that is performing this procedure is a member of the Administrators group on the KMS host computer.
    
2. Close all Office 2016 applications.
    
3. Open a command prompt with administrative permissions.
    
4. Go to %installdir%\%Program Files%\Microsoft Office\Office16. If you installed the 32-bit edition of Office 2016 on a 64-bit operating system, %Program Files% is the Program Files (x86) folder.
    
5. At the command prompt, type ospprearm.exe. If the rearm succeeds, the following message displays: **"Microsoft Office rearm successful."**
    
6. Capture the image or save the virtual computer. For more information about how to capture the image, see [Configure Office 2010 for a hard disk image](http://technet.microsoft.com/library/146a77e1-75b9-4795-8feb-d94d0f528ecc .aspx). (Although this article is for an earlier version of Office, the information also applies to Office 2016.) 
    
    > [!IMPORTANT]
    > Do not open an Office application or run ospp.vbs, or do anything else related to Office 2016 while the image is being captured. Otherwise, the grace timer starts. 
  
## Related topics
[Plan volume activation of Office 2016](plan-volume-activation-of-office.md)
  
[Tools to manage Office 2016 volume activation](tools-to-manage-volume-activation-of-office.md)

[Volume Activation Management Tool Technical Reference](https://go.microsoft.com/fwlink/p/?LinkId=251932)

