---
title: "Overview of shared computer activation for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: mattphil
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
recommendations: false
description: "Provides information for IT Pros about shared computer activation for use in shared computer scenarios, such as deploying Microsoft 365 Apps with Remote Desktop Services (RDS) "
---

# Overview of shared computer activation for Microsoft 365 Apps

> [!TIP]
> The information in this article is intended for administrators and IT Pros. For information about activating a personal copy of Office, see [Activate Office](https://support.microsoft.com/office/5bd38f38-db92-448b-a982-ad170b1e187e). 
  
Shared computer activation lets you deploy Microsoft 365 Apps to a computer in your organization that is accessed by multiple users. Here are some examples of supported scenarios:

- Three workers at a factory share the same physical computer, with each worker using Office on that computer during their eight-hour shift.
- Fifteen nurses at a hospital use Office on 10 different computers throughout the day.
- Five employees connect remotely to the same computer to run Office.
- Multiple employees use Office on a computer that's located in a conference room or some other public space in the company.
- Multiple users access an instance of Office that is hosted through [Remote Desktop Services (RDS)](deploy-microsoft-365-apps-remote-desktop-services.md).

Shared computer activation is required for scenarios where multiple users share the same computer and the users are logging in with their own account. Normally, users can install and activate Microsoft 365 Apps only on a limited number of devices, such as 5 PCs. Using Microsoft 365 Apps with shared computer activation enabled doesn't count against that limit. If your users have dedicated computers and no other users work on those computers, you [use product key activation for Microsoft 365 Apps](overview-licensing-activation-microsoft-365-apps.md).

> [!NOTE]
> To activate Microsoft 365 Apps, TLS 1.2 must be enabled by default on the operating system. Some older operating systems, such as Windows 7 Service Pack 1 (SP1) and Windows Server 2012, need an update applied to enable TLS 1.2 by default. For more information, see [Update to enable TLS 1.1 and TLS 1.2 as default secure protocols in WinHTTP in Windows](https://support.microsoft.com/topic/c4bd73d2-31d7-761e-0178-11268bb10392). But, running Microsoft 365 Apps on these older operating systems isn't supported. For more information, see [End of support resources for Office](endofsupport/resources.md).
  
<a name="Enable"> </a>

## How to enable shared computer activation for Microsoft 365 Apps

To use shared computer activation, you need an Office 365 (or Microsoft 365) plan that includes Microsoft 365 Apps and also supports shared computer activation. Shared computer activation is available for the following plans:

- Any plan that includes Microsoft 365 Apps for enterprise. For example, Office 365 E3 or Microsoft 365 E5.
- Any plan that includes the desktop version of Project or Visio. For example, Project Plan 3 or Visio Plan 2.
- The Microsoft 365 Business Premium plan, which includes Microsoft 365 Apps for business.
  
> [!NOTE]
> - The Microsoft 365 Business Premium plan is the only business plan that includes support for shared computer activation. There are other business plans, such as Microsoft 365 Business Standard, that include Microsoft 365 Apps for business, but, those business plans don't include support for shared computer activation.
> - Shared computer activation is available for Education plans that include Microsoft 365 Apps for enterprise. For example, Office 365 A3 or Microsoft 365 A5.
> - Shared computer activation isn't available for Office for Mac.

Make sure you [assign each user a license](/microsoft-365/admin/manage/assign-licenses-to-users) for Microsoft 365 Apps and that users sign in the shared computer with their own user account.

If you want to enable shared computer activation during the initial installation of Microsoft 365 Apps, you can instruct the [Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065) to do so during installation.
- When you're using the [Office Customization Tool](admincenter/overview-office-customization-tool.md) at [config.office.com](https://config.office.com) or the [wizard built into Microsoft Configuration Manager](deploy-microsoft-365-apps-configuration-manager.md#step-4---create-and-deploy-the-office-application-to-the-broad-group), make sure that you enable the option **Shared Computer** in the **Product activation** section.
- When you're crafting the configuration file manually, make sure to include the following line:
  ```xml
  <Property Name="SharedComputerLicensing" Value="1" />
  ```

If Microsoft 365 Apps is already installed and you want to enable shared computer activation, there are three options to choose from. A reinstallation isn't required. The device must be rebooted in order to apply the change.

> [!NOTE]
> If a user already activated the Microsoft 365 Apps before shared computer activation was enabled, you have to [reset the activation](/office/troubleshoot/activation/reset-office-365-proplus-activation-state) to allow shared computer activation to work.

### Option 1: Use Group Policy to enable shared computer activation

Use Group Policy by downloading the most current [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) and enable the "Use shared computer activation" policy. This policy is found under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Licensing Settings.

> [!NOTE]
> Microsoft 365 Apps for business doesn't support the use of Group Policy to enable shared computer activation, so you'll need to use another method to enable shared computer activation.

### Option 2: Use Registry Editor to enable shared computer activation

Use Registry Editor to add a String value (Reg_SZ) of SharedComputerLicensing with a setting of 1 under HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration.

### Option 3: Use the Microsoft Support and Recovery Assistant to enable shared computer activation

The Support and Recovery Assistant fully automates all of the steps to verify requirements for shared computer activation and to enable shared computer activation. It's available in two versions: enterprise and UI. Use the version that's best suited for your situation.

#### Enterprise (command-line) version of the Microsoft Support and Recovery Assistant

The [Enterprise version](https://aka.ms/SaRA_EnterpriseVersion) of the Microsoft Support and Recovery Assistant is a command-line version that can be scripted and is recommended for multiple devices and for devices that you can't access immediately. [Download the Enterprise version](https://aka.ms/SaRA_EnterpriseVersionFiles)

#### UI version of the Microsoft Support and Recovery Assistant

The [UI version](https://aka.ms/SaRA_Home) of the Microsoft Support and Recovery Assistant is recommended if you need to reset Office activation on a single device, or on a few individual devices. [Download the UI version](https://aka.ms/SaRA_OfficeSCA_Docs)

### Verify that shared computer activation is enabled

After Microsoft 365 Apps is installed, you can [verify that shared computer activation is enabled](troubleshoot-shared-computer-activation.md#Enabled) on that computer.

> [!NOTE]
> There is a known issue where, on devices with both shared computer activation and viewer mode enabled, licensed users are incorrectly placed in [viewer mode](overview-viewer-mode.md). This issue is fixed in Version 2205 and later.

<a name="Works"> </a>

## How shared computer activation works for Microsoft 365 Apps


Here's what happens after Microsoft 365 Apps is installed on a computer that has shared computer activation enabled.
  
1. A user signs in the computer with their account.
    
2. The user starts an Office program, such as Word.
    
3. Microsoft 365 Apps contacts the Office Licensing Service on the internet to obtain a licensing token for the user.
    
    To determine whether the user is licensed to use Microsoft 365 Apps, the Office Licensing Service has to know the user's account for Office 365. In some cases, Microsoft 365 Apps prompts the user to provide the information. For example, the user might see the **Activate Office** dialog box.
    
     ![Activate Office.](images/9cb7eef4-0ce6-428a-8f96-890e5237d17a.png)
  
    If your environment is configured to synchronize Office 365 (Azure Active Directory) and local Active Directory (AD) accounts, then the user most likely won't see any prompts. Microsoft 365 Apps should automatically be able to get the necessary information about the user's account in Office 365.
    
4. If the user is licensed for Microsoft 365 Apps, a licensing token is stored on the computer in the user's profile folder, and Microsoft 365 Apps is activated. The user can now use Microsoft 365 Apps.
    
These steps are repeated for each user who signs in the shared computer. Each user gets a unique licensing token. Just because one user activates Microsoft 365 Apps on the computer doesn't mean Microsoft 365 Apps is activated for all other users who sign in the computer.
  
If a user goes to another computer that also is enabled for shared computer activation, the same steps occur. There's a different licensing token for each computer that the user signs in.
  
If a user signs in a shared computer again, Microsoft 365 Apps uses the same licensing token, if it's still valid.
  
<a name="Details"> </a>

## Additional details about shared computer activation for Microsoft 365 Apps

**Licensing token renewal** The licensing token that is stored on the shared computer is valid only for 30 days. As the expiration date for the licensing token nears, Microsoft 365 Apps automatically attempts to renew the licensing token when the user is logged on to the computer and using Microsoft 365 Apps.
    
If the user doesn't sign in the shared computer for 30 days, the licensing token can expire. The next time that the user tries to use Microsoft 365 Apps, Microsoft 365 Apps contacts the Office Licensing Service on the internet to get a new licensing token.
    
**Internet connectivity** Because the shared computer has to contact the Office Licensing Service on the internet to obtain or renew a licensing token, reliable connectivity between the shared computer and the internet is necessary.
    
**Reduced functionality mode** If the user isn't licensed for Microsoft 365 Apps, or if the user closed the **Activate Office** dialog box, no licensing token is obtained and Microsoft 365 Apps isn't activated. Microsoft 365 Apps is now in reduced functionality mode. This means that the user can view and print Office documents, but can't create or edit documents. The user also sees a message in the Office program that most features are turned off.
    
   ![Reduced functionality.](images/4e25a9fc-1844-4204-9b9d-40603ca1a091.png)

*(For Version 2205 and later)* If [viewer mode](overview-viewer-mode.md) is enabled on the device, then the user will be placed in viewer mode instead of reduced functionality mode.
  
**Activation limits** Normally, users can install and activate Microsoft 365 Apps only on a limited number of devices, such as 5 PCs. Using Microsoft 365 Apps with shared computer activation enabled doesn't count against that limit.
    
Microsoft allows a single user to activate Microsoft 365 Apps on a reasonable number of shared computers in a given time period. The user gets an error message in the unlikely event the limit is exceeded.
    
   ![Too many computers activated message.](images/e01c8a45-1814-4bfe-bb7e-c0176f393031.png)
  
**Single sign-on recommended** The use of single sign-on (SSO) is recommended to reduce how often users are prompted to sign in for activation. With single sign-on configured, Microsoft 365 Apps is activated using the user credentials that the user provides to sign in to Windows, as long as the user has been assigned a license for Microsoft 365 Apps. For more information, see [Microsoft 365 identity models and Azure Active Directory](/microsoft-365/enterprise/about-microsoft-365-identity).
    
If you don't use single sign-on, you should consider using roaming profiles and include the %localappdata%\\Microsoft\\Office\\16.0\\Licensing folder as part of the roaming profile.
    
**Licensing token roaming** Starting with Version 1704 of Microsoft 365 Apps, you can configure the licensing token to roam with the user's profile or be located on a shared folder on the network. Previously, the licensing token was always saved to a specific folder on the local computer and was associated with that specific computer. In those cases, if the user signed in to a different computer, the user would be prompted to activate Microsoft 365 Apps on that computer in order to get a new licensing token. The ability to roam the licensing token is especially helpful for non-persistent VDI scenarios.
  
To configure licensing token roaming, you can use either the Office Deployment Tool or Group Policy, or you can use Registry Editor to edit the registry. Whichever method you choose, you need to provide a folder location that is unique to the user. The folder location can either be part of the user's roaming profile or a shared folder on the network. Microsoft 365 Apps needs to be able to write to that folder location. If you're using a shared folder on the network, be aware that network latency problems can adversely affect the time it takes to open Office programs. The location is only needed if you prefer to not use the default location, which is %localappdata%\\Microsoft\\Office\\16.0\\Licensing.
    
- If you're using Group Policy, download the most current [Administrative Template files (ADMX/ADML) for Office](https://go.microsoft.com/fwlink/p/?linkid=626001) and enable the "Specify the location to save the licensing token used by shared computer activation" policy setting. This policy setting is found under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Licensing Settings.
    
- If you're using the Office Deployment Tool, include the SCLCacheOverride and SCLCacheOverrideDirectory in the Property element of your configuration.xml file. For more information, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).
    
- To edit the registry, go to HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration, add a string value of SCLCacheOverride, and set the value to 1. Also, add a string value of SCLCacheOverrideDirectory and set the value to the path of the folder to save the licensing token. 
    
  >[!NOTE]
  > If you're using Microsoft Application Virtualization (App-V) to deploy Microsoft 365 Apps, the registry location is HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\16.0\\Common\\Licensing. 
  


   
## Related articles

- [Deploy Microsoft 365 Apps by using Remote Desktop Services](deploy-microsoft-365-apps-remote-desktop-services.md)
- [Troubleshoot issues with shared computer activation for Microsoft 365 Apps](troubleshoot-shared-computer-activation.md)
- [Overview of licensing and activation in Microsoft 365 Apps](overview-licensing-activation-microsoft-365-apps.md)
