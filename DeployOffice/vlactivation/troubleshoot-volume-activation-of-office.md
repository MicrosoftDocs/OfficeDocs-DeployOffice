---
title: "Troubleshoot volume activation for Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/29/2017
ms.audience: ITPro
ms.topic: troubleshooting
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ms.assetid: 976fc06b-faed-4682-b41f-4a19d8eb3302
description: "Explains how to troubleshoot common errors for KMS or MAK-based activation of Office 2016."
---

# Troubleshoot volume activation for Office 2016

 **Summary:** Explains how to troubleshoot common errors for KMS or MAK-based activation of Office 2016. 
  
 **Audience:** IT Professionals 
  
|||
|:-----|:-----|
|![Are you a user?](../images/e9b1eeb1-6712-4af3-9bd4-4b8e3cbc85d4.jpg)           <br/> |If you are a user troubleshooting a personal Office 2016 install, review the list of [most common install problems](https://go.microsoft.com/fwlink/p/?LinkId=335857).  <br/> |
|![Are you an admin?](../images/450333cb-3c0b-433f-9b74-65bbb5a4f274.jpg)           <br/> |If you are an admin troubleshooting Office 365 ProPlus activation and licensing, see [Unlicensed Product and activation errors in Office](https://support.office.com/article/0d23d3c0-c19c-4b2f-9845-5344fedc4380) instead.  <br/> If you are an admin troubleshooting a Volume license edition of Office 2016, you're at the right place, keep reading.  <br/> |
   
Setting up volume activation with Office 2016 by using Key Management Service (KMS) or Multiple Activation Key (MAK) can be challenging. Use these steps to troubleshoot the most common issues.
  
Many of the solutions include running the Office Software Protection Platform script ( **ospp.vbs** ), which you can find either in the "%programfiles%\microsoft office\office16" or the "%programfiles(x86)%\microsoft office\office16" folder of the client computer. You have to run it at the administrative command prompt. You can also use the Software License Manager script ( **Slmgr.vbs** ) to configure and manage volume activation. For detailed information about these scripts, see [Tools to manage Office 2016 volume activation](tools-to-manage-volume-activation-of-office.md).
  
In this article:
  
- [Tips for configuring KMS clients and host computers](troubleshoot-volume-activation-of-office.md#tips)
    
- [KMS activation issues](troubleshoot-volume-activation-of-office.md#KMSActivationIssues)
    
- [MAK activation issues](troubleshoot-volume-activation-of-office.md#MAKActivationIssues)
    
- [How to get the text for activation error codes](troubleshoot-volume-activation-of-office.md#ErrorText)
    
- [Other activation issues](troubleshoot-volume-activation-of-office.md#OtherIssues)
    
## Tips for configuring KMS clients and host computers
<a name="tips"> </a>

Generally, you do not have to configure Office Key Management Service (KMS) clients if the Office KMS host computer was correctly set up and configured. The KMS client automatically searches for the KMS host computer by using DNS and then attempts activation. The KMS service uses service (SRV) resource records (RRs) in DNS to store and communicate the locations of KMS host computers.
  
By default, KMS host computers automatically publish the information that KMS clients have to find and connect to them by using DNS dynamic update protocol. By default, KMS clients query the DNS server for KMS service information.
  
You can manually configure KMS host computers and clients, depending on the network configuration and your security requirements. For example, if the network environment does not use SRV records, you can manually configure a KMS client to use a specific KMS host computer. For more information about using DNS with volume activation, see [Set up DNS for Office 2016 KMS-based volume activation](configure-dns-to-activate-office-by-using-kms.md). For more information about how to configure the KMS client, see [The ospp.vbs script](tools-to-manage-volume-activation-of-office.md#section1) later in this article and [Set up Office 2016 KMS clients](activate-office-by-using-kms.md). For more information about how to configure the KMS host computer, see [Prepare and set up the Office 2016 KMS host computer](configure-a-kms-host-computer-for-office.md).
  
## KMS activation issues
<a name="KMSActivationIssues"> </a>

This section lists common activation issues with Office 2016 KMS.
  
KMS activation issues can be due to a misconfiguration on one or more of the following items:
  
- Office client
    
- Network/DNS
    
- KMS host
    
To quickly identify your KMS trouble spots, use either the Office Client KMS activation diagnostic or Office KMS Host Activation diagnostic tool to analyze your environment for known issues. These diagnostic tools automate almost all of the troubleshooting steps available for KMS issues and provide a detailed report with recommendations on how to fix the detected issues.
  
You should always analyze the client first by using the Office Client KMS activation diagnostic tool, even if you feel you have a KMS Host configuration problem. It'll determine if your changes need to occur on the client, your network, or your KMS host.
  
If the Office Client KMS activation diagnostic tool indicates you have KMS host issues, you should then run the Office KMS Host Activation diagnostic tool.
  
### 

### To use the Office Client KMS activation diagnostic tool

1. As a local administrator, log into any Office client that is unable to activate using KMS activation.
    
2. Go to [Office Client KMS activation diagnostic tool](https://go.microsoft.com/fwlink/p/?LinkId=335903) and sign in to the Microsoft Support Diagnostics Self-Help portal with your Microsoft Account credentials. 
    
3. On the **New Session** page, choose **Office Client KMS activation diagnostic**.
    
4. Enter a name in **Session Name** text box and then choose **Create**.
    
5. To start the analysis, choose **Download**.
    
6. When you are prompted, choose **Run** or **Save File**. If you choose **Save File**, you can later run the file from the folder where you saved it.
    
7. When prompted to select the computer on which to run the diagnostic, choose **This Computer**, and then choose **Next**. On the next page choose **Start**.
    
8. When the diagnostic displays an alert indicating a report has been saved, choose **Open Report**.
    
9. Review the details listed in the report **Summary** section, and then review the problems listed in the **Issues Detected** section and follow the recommendations provided under **Recommended steps and related resources**.
    
### To use the Office KMS Host Activation diagnostic tool

1. As a local administrator, log into your Office KMS host computer.
    
2. Go to [Office KMS Host Activation diagnostic tool](https://go.microsoft.com/fwlink/p/?LinkId=335904) and sign in to the Microsoft Support Diagnostics Self-Help portal with your Microsoft Account credentials. 
    
3. On the **New Session** page, choose **Office Client KMS Host Activation diagnostic**.
    
4. Enter a name in **Session Name** text box and then choose **Create**.
    
5. To start the analysis, choose **Download**.
    
6. When you are prompted, choose **Run** or **Save File**. If you choose **Save File**, you can later run the file from the folder where you saved it.
    
7. When prompted to select the computer on which to run the diagnostic, choose **This Computer**, and then choose **Next**. On the next page choose **Start**.
    
8. A report is automatically generated and opened in your browser.
    
9. Review the information listed in the **Summary** section and then review the problems listed in the **Details** section. Follow the recommendations provided under **Action needed or comment** for the items flagged with ' **Attention Required**' in the **Result** column. 
    
## MAK activation issues
<a name="MAKActivationIssues"> </a>

This section lists common issues with MAK activation for Office 2016.
  
### The Office 2016 client does not activate when it is connected to the network through an authenticated proxy

You have to be connected to the Internet to use MAK activation. However, if your Internet connection requires authentication, MAK activation won't work and you'll have to activate over the telephone. For more information about this issue, see Knowledge Base article [921471: Windows activation or validation fails and may generate error code 0x8004FE33](https://go.microsoft.com/fwlink/p/?LinkId=183044).
  
## How to get the text for activation error codes
<a name="ErrorText"> </a>

Error codes help you troubleshoot activation issues. If you see a dialog box that contains an activation notification, an error code is usually displayed at the lower corner. You can then run **ospp.vbs /ddescr** together with the error code to see the text of the error message. The text will help you better understand the issue and what to do to fix it. 
  
Another way to obtain an error code is to run ospp.vbs /act on the client computer to manually activate Office. If activation fails, an error code will be shown. 
  
## Other activation issues
<a name="OtherIssues"> </a>

### Licensing information is not updated on the client

To display licensing information for Office applications on the KMS client, on the **File** menu, choose **Account**.
  
If you see a notification that product activation is required even though you know that Office 2016 is in the licensed state, restart the application.
  
The client applications can be in this state because Office 2016 was activated by using **ospp.vbs /act** or the [Volume Activation Management Tool (VAMT)](https://go.microsoft.com/fwlink/p/?LinkId=251932). In these cases, you must restart any Office 2016 applications to complete the activation.
  
### Generic Volume License Keys (GVLKs) for Office 2016

All Office 2016 volume-licensed products have a [Generic Volume License Key (GVLK)](http://technet.microsoft.com/library/99fa0e2a-99f8-4555-b0a5-c09d3aede928%28Office.14%29.aspx) preinstalled to activate against an Office 2016 KMS host computer. If you entered a MAK key for a product and you want to change the activation method back to KMS, use the appropriate KMS client GVLK. For more information, see [GVLKs for KMS and Active Directory Domain Services activation of Office 2016](http://technet.microsoft.com/library/99fa0e2a-99f8-4555-b0a5-c09d3aede928.aspx). The recommended way to enter the key is by using the Volume Activation Management Tool, [VAMT](https://go.microsoft.com/fwlink/p/?LinkId=251932). You can also use **ospp.vbs /inpkey** to enter the key. 
  
For Office 2016 suites, only one key is required for all the products in the suite. For example, if you use Office Professional Plus, you must enter only the Office Professional Plus 2016 key for the complete suite. For a complete listing of the keys, see [GVLKs for KMS and Active Directory Domain Services activation of Office 2016](http://technet.microsoft.com/library/99fa0e2a-99f8-4555-b0a5-c09d3aede928.aspx).
  
## See also
<a name="OtherIssues"> </a>

#### 

 
[Prepare and set up the Office 2016 KMS host computer](configure-a-kms-host-computer-for-office.md)
  
[Activate Office 2016 MAK clients](activate-office-by-using-mak.md)

