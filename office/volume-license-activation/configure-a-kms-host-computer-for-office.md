---
title: "Configure a KMS host computer to activate volume licensed versions of Office"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides Office admins with steps to configure the Key Management Service (KMS) host computer to activate volume licensed versions of Office, Project, and Visio."
ms.date: 04/26/2024
---

# Configure a KMS host computer to activate volume licensed versions of Office

<!--Update for LTSC 2024-->

***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*

To activate volume licensed versions of Office, including Project, and Visio, you must have a Key Management Service (KMS) host computer. You can configure a Windows Server computer to be a KMS host computer by installing the Volume Activation Services role and then running the Volume Activation Tools wizard.

To enable the KMS host computer to activate Office, you must install the Office Volume License Pack and enter your KMS key on the KMS host computer. Then, you need to activate the KMS key over the internet or by telephone. 

If you have a KMS host computer configured to activate Windows, you can configure that same KMS host computer to activate Office. You can also configure a KMS host computer to activate multiple versions of Office, such as Office LTSC 2021, Office 2019, and Office 2016. In these cases, the KMS host computer must be running an operating system that supports KMS for each of the versions of Office that you want to activate. Also, you need to install the Office Volume License Pack for each version of Office on the KMS host computer and activate a KMS host key for each version of Office.

Office supports KMS host computers running on the following operating systems, depending on which version of Office is activated with KMS:
- Office LTSC 2021: At least Windows Server 2016 or at least Windows 10 (volume editions)
- Office 2019: At least Windows Server 2012 or at least Windows 8.1 (volume editions)
- Office 2016: At least Windows Server 2008 R2 or at least Windows 7 Service Pack 1 (volume editions)

You can download the appropriate Office Volume License Pack from the Microsoft Download Center.

- [Office LTSC 2021 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=103446)
- [Office 2019 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=57342)
- [Office 2016 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=49164)
 
To get the KMS key, sign in to the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and download the KMS key for each product and version of Office that you want KMS to activate.

> [!NOTE]
> If you are setting up KMS on Windows 7 volume license edition or Windows Server 2008 R2, you must first install a patch as described in this [support article](https://support.microsoft.com/topic/22412808-3176-fa2c-6610-4be38f850d3a). This patch allows the KMS host computer to activate Office clients that run on Windows 8 and Windows Server 2012.

> [!NOTE]
> - Support for Windows 7 and Windows Server 2008 R2 ended on January 14, 2020.
> - Support for Windows 8 ended on January 12, 2016.
> - Support for Windows 8.1 ended on January 10, 2023.

## Configure the KMS host computer

To configure the KMS host computer to activate Office, you must be a member of the Administrators group on the KMS host computer.

If your KMS host computer has internet access, do the following steps:

1. Sign in to the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and download the KMS key for each product and version of Office that you want KMS to activate.
2. On the KMS host computer, download the appropriate Office Volume License Pack from the Microsoft Download Center.
   - [Office LTSC 2021 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=103446)
   - [Office 2019 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=57342)
   - [Office 2016 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=49164)
3. Run the Office Volume License Pack executable file. Running the executable file installs the Office Volume License Pack on the KMS host computer and then opens the Volume Activation Tools wizard.
4. Follow the steps in the Volume Activation Tools wizard. Enter your KMS key when prompted.
5. If you have a firewall, make sure port 1688 is open to allow the KMS host service through the firewall.
   - Go to **Control Panel** > **System and Security** > **Windows Firewall** (or **Windows Defender Firewall**).
   - Select the **Allow an app or feature through Windows Firewall** link.
   - Select the **Change Settings** button.
   - Select the check box for Key Management Service and then choose **OK**.

If your KMS host computer doesn't have internet access, you can activate it by telephone.

1. From an elevated command prompt, go to the Windows\system32 folder, and then run the following command:
   
```console 
   cscript slmgr.vbs /dti ACTIVATIONID
 ```   
Replace *ACTIVATIONID* with the Activation ID for your version of Office.

- Activation ID for Office LTSC 2021: 47F3B983-7C53-4D45-ABC6-BCD91E2DD90A
- Activation ID for Office 2019: 70512334-47B4-44DB-A233-BE5EA33B914C
- Activation ID for Office 2016: 98EBFE73-2084-4C97-932C-C0CD1643BEA7
  
The result of running this command is a 36-digit installation ID. Paste the installation ID number into Notepad, and then break it up into six groups of six numbers.
    
2. At the command line, run the following command:

```console
  slui.exe 4
```

This command launches the Windows phone activation wizard and it displays a telephone number.
    
After obtaining the telephone number, cancel the wizard. You can ignore the activation ID displayed by the wizard. It's for Windows. 
  
3. Call the telephone number. At each prompt, enter a group of six numbers. This 36-digit number is the installation ID that you obtained in step 1.
    
4. When you hear the response, write down the numbers. These numbers are your confirmation ID.
    
5. At the command line, run the following command:

 ```console
cscript slmgr.vbs /atp CONFIRMATIONID ACTIVATIONID
```
Replace *CONFIRMATIONID* with the 48-digit confirmation ID that you received over the telephone.

Replace *ACTIVATIONID* with the Activation ID for your version of Office.

- Activation ID for Office LTSC 2021: 47F3B983-7C53-4D45-ABC6-BCD91E2DD90A
- Activation ID for Office 2019: 70512334-47B4-44DB-A233-BE5EA33B914C
- Activation ID for Office 2016: 98EBFE73-2084-4C97-932C-C0CD1643BEA7

6. You should see a message that the confirmation ID was successfully deposited.

## Verify activations by the KMS host computer

After you set up the KMS host computer, KMS clients send requests for activation and increment the current count of activations. The current count must be 5 or more before KMS clients are activated. The maximum current count is double the activation threshold, or 10. You can also check the KMS log from the Applications and Services Logs folder for event ID 12290, the ID for KMS-related activity. The KMS log records activation requests from KMS clients. Each event displays the name of the computer and the time stamp of each activation request.
  

## Verify the KMS key is successfully installed and activated

From an elevated command prompt on the KMS host computer, run the following command:
 
```console
   cscript slmgr.vbs /dlv all
```    
    
To view information only for a specific version of Office, specify that version's Activation ID after the /dlv parameter. For example, for Office 2019:

```console   
    cscript slmgr.vbs /dlv 70512334-47B4-44DB-A233-BE5EA33B914C
```
 
The following text is an example of the output for Office 2016. The line that says: "License Status: Licensed" indicates that your KMS host computer is successfully activated.
    
   ```console
   Name: Office 16, OfficeKMSHostVL_KMS_Host edition
   Description: Office 16, VOLUME_KMS channel
   Activation ID: 98EBFE73-2084-4C97-932C-C0CD1643BEA7
   Application ID: 0ff1ce16-a989-479d-af46-f275c6370663
   Extended PID: 05426-00206-234-001162-03-1033-9200.0000-0992013
   Installation ID: 020650770493837252929082195773527024195725809211989214
   Use License URL: https://activation.sls.microsoft.com/SLActivateProduct/SLActiva
   teProduct.asmx?configextension=o16
   Validation URL: https://go.microsoft.com/fwlink/p/?LinkID=187557
   Partial Product Key: KDQ2G
   License Status: Licensed
   Remaining Windows rearm count: 1000
   Trusted time: 10/26/2016 9:58:33 AM
   Key Management Service is enabled on this machine
      Current count: 0
      Listening on Port: 1688
      DNS publishing enabled
      KMS priority: Normal
   Key Management Service cumulative requests received from clients
      Total requests received: 0
      Failed requests received: 0
      Requests with License Status Unlicensed: 0
      Requests with License Status Licensed: 0
      Requests with License Status Initial grace period: 0
      Requests with License Status License expired or Hardware out of tolerance: 0
      Requests with License Status Non-genuine grace period: 0
      Requests with License Status Notification: 0
   ```

## Related articles

- [Overview of volume activation of Office](plan-volume-activation-of-office.md)
- [Activate volume licensed versions of Office by using KMS](activate-office-by-using-kms.md)
- [Activate volume licensed versions of Office by using Active Directory](activate-office-by-using-active-directory.md)