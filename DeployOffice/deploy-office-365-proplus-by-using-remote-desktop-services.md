---
title: "Deploy Office 365 ProPlus by using Remote Desktop Services"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/29/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- DeployProPlus
- DeployProPlus_SOConly
- LIL_Placement
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: af9d7621-8c2c-4181-84b4-27778b1e7920

description: "If you use Remote Desktop Services (RDS) to provide shared computers to users in your organization, you can install Office 365 ProPlus on those computers. But, you have to use the Office Deployment Tool and enable shared computer activation to do the installation."
---

# Deploy Office 365 ProPlus by using Remote Desktop Services

If you use Remote Desktop Services (RDS) to provide shared computers to users in your organization, you can install Office 365 ProPlus on those computers. But, you have to use the Office Deployment Tool and enable [shared computer activation](overview-of-shared-computer-activation-for-office-365-proplus.md) to do the installation.
  
The following are two common RDS scenarios:
  
- Install Office 365 ProPlus on an RDS server.
    
- Install Office 365 ProPlus on a shared virtual machine.
    
## What you need to get started
<a name="Started"> </a>

The following is a list of prerequisites that you need to deploy Office 365 ProPlus with RDS:
  
- An Office 365 plan that includes Office 365 ProPlus. Also, make sure that you [assign each user a license](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc) for Office 365 ProPlus.
    
    > [!NOTE]
    > You also can use RDS to deploy Visio Pro for Office 365 or Project Online Desktop Client, if you have a subscription plan that includes those products. 
  
- The Office 2016 version of the Office Deployment Tool, which is available on the [Microsoft Download Center](http://go.microsoft.com/fwlink/p/?LinkID=626065). You can download the Office 365 ProPlus software to your local network by using the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md).
    
- Any supported version of Office 365 ProPlus.
    
- A supported version of RDS, which includes any of the following:
    
  - Windows Server 2008 R2 
    
  - Windows Server 2012 
    
  - Windows Server 2012 R2 
    
  - Windows Server 2016
    
- Reliable connectivity between the shared computer and the Internet.
    
    This is required because the shared computer must be able to contact the Office Licensing Service on the Internet to obtain a license for each user who uses Office 365 ProPlus on the computer and then activate Office 365 ProPlus. Internet connectivity is also needed to renew the license, which occurs every few days.
    
- A separate user account for each user who logs on to the shared computer.
    
- A server that supports [Hyper-V](https://go.microsoft.com/fwlink/p/?LinkId=510585) if you're deploying Office 365 ProPlus on a shared virtual machine.
    
## Install Office 365 ProPlus on an RDS server
<a name="Server"> </a>

In this scenario, you install Office 365 ProPlus on a computer configured as a Remote Desktop Session Host server. This enables multiple users to connect remotely to this computer. The users can each run Office 365 ProPlus programs, such as Word or Excel, at the same time.
  
Here are the basic steps of how to install Office 365 ProPlus on an RDS server:
  
1. Install and configure Windows Server.
    
2. Install and configure the Remote Desktop Session Host role service.
    
    For example, [follow these steps to install RD Session Host](https://go.microsoft.com/fwlink/p/?LinkId=510582) on Windows Server 2008 R2.
    
    For users to be able to connect remotely to the server to use Office 365 ProPlus, their accounts must be members of the Remote Desktop Users group on the RD Session Host server.
    
3. [Create a configuration.xml file](configuration-options-for-the-office-2016-deployment-tool.md) that includes the following lines:
    
  ```
  <Display Level="None" AcceptEULA="True" /> 
<Property Name="SharedComputerLicensing" Value="1" />

  ```

    You set the display level to "None" to do a silent installation of Office 365 ProPlus. This prevents Office 365 ProPlus from trying to activate during the installation. This also means that you won't see any user interface elements during the installation, such as the progress of the installation or error messages.
    
    You use the SharedComputerLicensing setting to enable [shared computer activation](overview-of-shared-computer-activation-for-office-365-proplus.md), which is required to use Office 365 ProPlus on a shared computer.
    
4. Use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) and the configuration.xml file to install Office 365 ProPlus on the RD Session Host server.
    
At this point, users can connect to the RD Session Host server and use Office 365 ProPlus. Users can connect to the server by using Remote Desktop Connection, which is available in Windows, or by using other [Remote Desktop clients](https://go.microsoft.com/fwlink/p/?LinkId=510586).
  
## Install Office 365 ProPlus on a shared virtual machine
<a name="VM"> </a>

In this scenario, you install Office 365 ProPlus as part of an operating system image, such as one running Windows 8.1. Then, you use RDS and Hyper-V to create a group of virtual machines based on that image. These virtual machines can be shared by multiple users. In RDS, this is known as either a virtual desktop pool or a pooled virtual desktop collection, depending on which version of RDS that you're using.
  
> [!NOTE]
> You can also use RDS to assign a virtual machine to a specific user. RDS calls that a personal virtual desktop. In that scenario, you don't use shared computer activation, because the virtual machine isn't shared among multiple users. 
  
Here are the basic steps of how to configure RDS to deploy Office 365 ProPlus on a shared virtual machine:
  
1. Create the operating system image:
    
  - Follow the instructions to [deploy Office 365 ProPlus as part of an operating system image](deploy-office-365-proplus-as-part-of-an-operating-system-image.md). In Step 2 of the instructions, make sure that your configuration.xml file also includes the following line to enable shared computer activation:
    
  ```
  <Property Name="SharedComputerLicensing" Value="1" />
  ```

  - You also need to [make some RDS-specific changes on the virtual machine](https://go.microsoft.com/fwlink/p/?LinkId=510584), such as enabling Remote Desktop.
    
2. Install and configure Windows Server.
    
3. Install and configure RDS.
    
    For example, [follow these steps to deploy a virtual desktop pool](https://go.microsoft.com/fwlink/p/?LinkId=510583) on Windows Server 2008 R2.
    
After you've completed all the RDS configuration steps, users can connect to any of the virtual machines and run Office 365 ProPlus.
  
[!INCLUDE [LinkedIn Learning Info](common/office/linkedin-learning-info.md)]
   
## Related Topics
<a name="VM"> </a>

[Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md)
  
[Troubleshoot issues with shared computer activation for Office 365 ProPlus](troubleshoot-issues-with-shared-computer-activation-for-office-365-proplus.md)
  
[Remote Desktop Services in Windows Server 2008 R2](https://go.microsoft.com/fwlink/p/?LinkID=268148)
  
[Remote Desktop Services Overview (Windows Server 2012 and Windows Server 2012 R2)](https://go.microsoft.com/fwlink/p/?LinkID=268149)
  

