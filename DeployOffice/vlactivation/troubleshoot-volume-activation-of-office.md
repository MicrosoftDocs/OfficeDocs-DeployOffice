---
title: "Troubleshoot volume activation of Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/24/2018
ms.audience: ITPro
ms.topic: troubleshooting
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
description: "Provides Office admins with information on how to troubleshoot common errors for KMS or MAK-based activation of Office."
---

# Troubleshoot volume activation of Office

***Applies to:*** *Volume licensed versions of Office 2019 and Office 2016, including Project and Visio*


Setting up volume activation of Office, including Project and Visio, by using Key Management Service (KMS) or Multiple Activation Key (MAK) can be challenging. Use these steps to troubleshoot the most common issues.

> [!NOTE]
> If you're an Office user troubleshooting a personal copy of Office, see [Unlicensed Product and activation errors in Office](https://support.office.com/article/0d23d3c0-c19c-4b2f-9845-5344fedc4380) instead of reading this article.
  
Many of the solutions include running the ospp.vbs, which you need to run from an elevated command prompt on the computer on which Office is installed. The opss.vbs script is located in the Program Files\Microsoft Office\Office16 folder. If you installed the 32-bit version of Office on a 64-bit operating system, go to the Program Files (x86)\Microsoft Office\Office16 folder. You can also use the slmgr.vbs script to configure and manage volume activation. For detailed information about these scripts, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
   
## Tips for configuring KMS clients and host computers

Generally, you do not have to configure Office Key Management Service (KMS) clients if the KMS host computer used to activate Office was correctly set up and configured. The KMS client automatically searches for the KMS host computer by using DNS and then attempts activation. The KMS service uses service (SRV) resource records (RRs) in DNS to store and communicate the locations of KMS host computers.
  
By default, KMS host computers automatically publish the information that KMS clients use to find and connect to them by using DNS dynamic update protocol. By default, KMS clients query the DNS server for KMS service information.
  
You can manually configure KMS host computers and clients, depending on the network configuration and your security requirements. For example, if the network environment does not use SRV records, you can manually configure a KMS client to use a specific KMS host computer. For more information about using DNS with volume activation, see [Configure DNS for activating volume licensed versions of Office by using KMS](configure-dns-to-activate-office-by-using-kms.md). For more information about how to configure the KMS client, see [ospp.vbs script](tools-to-manage-volume-activation-of-office.md#ospp) and [Activate volume licensed versions of Office by using KMS](activate-office-by-using-kms.md). For more information about how to configure the KMS host computer, see [Configure a KMS host computer to activate volume licensed versions of Office](configure-a-kms-host-computer-for-office.md).
  



## KMS activation issues

KMS activation issues can be due to a misconfiguration on one or more of the following items:
  
- Office client
  
- Network/DNS
    
- KMS host computer
    
To quickly identify your KMS trouble spots, use either the Office Client KMS activation diagnostic or Office KMS Host Activation diagnostic tool to analyze your environment for known issues. These diagnostic tools automate almost all of the troubleshooting steps available for KMS issues and provide a detailed report with recommendations on how to fix the detected issues.
  
You should always analyze the client first by using the Office Client KMS activation diagnostic tool, even if you feel you have a KMS Host configuration problem. It'll determine if your changes need to occur on the client, your network, or your KMS host.
  
If the Office Client KMS activation diagnostic tool indicates you have KMS host issues, you should then run the Office KMS Host Activation diagnostic tool.
  

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
    
9. Review the information listed in the **Summary** section and then review the problems listed in the **Details** section. Follow the recommendations provided under **Action needed or comment** for the items flagged with '**Attention Required**' in the **Result** column. 
    

## MAK activation issues


  
### Office does not activate when it is connected to the network through an authenticated proxy

You have to be connected to the internet to use MAK activation. But, if your internet connection requires authentication, MAK activation won't work and you'll have to activate over the telephone. For more information about this issue, see Knowledge Base article [921471](https://go.microsoft.com/fwlink/p/?LinkId=183044).
  

<a name="ErrorText"> </a>

## How to get the text for activation error codes

Error codes help you troubleshoot activation issues. If you see a dialog box that contains an activation notification, an error code is usually displayed at the lower corner. You can then run ospp.vbs /ddescr together with the error code to see the text of the error message. The text will help you better understand the issue and what to do to fix it. 
  
Another way to obtain an error code is to run ospp.vbs /act on the client computer to manually activate Office. If activation fails, an error code will be shown. 
  
<a name="OtherIssues"> </a>

## Other activation issues

### Licensing information is not updated on the client

To display licensing information for Office applications, open an Office application, such as Word, and go to **File** > **Account**.
  
If you see a notification that product activation is required even though you know that Office is in the licensed state, restart the application.
  
The client applications can be in this state because Office was activated by using ospp.vbs /act or the [Volume Activation Management Tool (VAMT)](https://docs.microsoft.com/windows/deployment/volume-activation/volume-activation-management-tool). In these cases, you must restart any Office applications to complete the activation.
  
### Generic Volume License Keys (GVLKs) for Office

All volume licensed versions of Office, including Project and Visio, have a Generic Volume License Key (GVLK) preinstalled that's used to activate Office by using a KMS host computer. If you entered a MAK key for a product and you want to change the activation method back to KMS, use the appropriate KMS client GVLK. For more information, see [GVLKs for KMS and Active Directory-based activation of Office 2019 and Office 2016](gvlks.md). The recommended way to enter the key is by using [Volume Activation Management Tool (VAMT)](https://docs.microsoft.com/windows/deployment/volume-activation/volume-activation-management-tool). You can also use ospp.vbs /inpkey to enter the key. 
  
For Office suites, only one key is required for all the products in the suite. For example, if you use Office Professional Plus, you must enter only the Office Professional Plus key for the complete suite. For a complete listing of the keys, see [GVLKs for KMS and Active Directory-based activation of Office 2019 and Office 2016](gvlks.md).
  


