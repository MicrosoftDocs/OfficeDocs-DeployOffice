---
title: "Device-based licensing for Microsoft 365 Apps for enterprise"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Explains how to configure device-based licensing for Microsoft 365 Apps for enterprise."
---

# Device-based licensing for Microsoft 365 Apps for enterprise

Starting in Summer 2020, commercial customers can use *Microsoft 365 Apps for enterprise (device)* to assign a Microsoft 365 Apps for enterprise license to a Windows 10 device instead of to a user. Education customers can do the same thing by using the *Microsoft 365 Apps for Education (device)* license.  This device-based license is designed to simplify management of Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus) on devices shared by many users. Anyone that signs in and uses that device can use Microsoft 365 Apps for enterprise to create and edit documents.

> [!IMPORTANT]
> Device-based licensing for Microsoft 365 Apps for enterprise is available as a license only for some commercial customers and some education customers. For commercial customers, the license is *Microsoft 365 Apps for enterprise (device)* and is available only through Enterprise Agreement/Enterprise Agreement Subscription.  For education customers, the license is *Microsoft 365 Apps for Education (device)* and is available only through Enrollment for Education Solutions (EES). For more information, read the blog post on [education availability](https://educationblog.microsoft.com/2019/08/attention-it-administrators-announcing-device-based-subscription-for-education/). For commercial availability, contact your Microsoft account representative.

## Requirements for using device-based licensing for Microsoft 365 Apps for enterprise

The following are the requirements for device-based licensing for Microsoft 365 Apps for enterprise:

- Version 1907 or later of Microsoft 365 Apps for enterprise.
- A supported version of Windows 10 Semi-Annual Channel, but at least Version 1803.
- The Windows 10 device must be [Azure Active Directory (Azure AD) joined](https://docs.microsoft.com/azure/active-directory/devices/concept-azure-ad-join) or [hybrid Azure AD joined](https://docs.microsoft.com/azure/active-directory/devices/concept-azure-ad-join-hybrid).

To verify that Microsoft 365 Apps for enterprise and the Windows 10 device meet these requirements, do the following:

- On the Windows 10 device, open an Office application, such as Word, and go to **File** > **Account**. The version number of Microsoft 365 Apps for enterprise that is installed on the device appears in the **About** section of the **Product Information** section.
- On the Windows 10 device, from the Start menu or a command prompt, type `winver` and then hit Enter. The **About Windows** dialog appears and lists the version of Windows 10.
- Sign in to the [Microsoft Azure](https://portal.azure.com/) and go to **Azure Active Directory** > **Devices**. The type of join for your Windows 10 device is listed in the **Join Type** column. 

  If the Windows 10 device doesn't appear, sign in to the Windows 10 device. Then go to **Settings** > **Accounts** > **Access work or school**, choose **Connect**, and follow the steps to join the device to either Azure Active Directory or to a local Active Directory domain.

## Steps to configure device-based licensing for Microsoft 365 Apps for enterprise

After you have verified that your Windows 10 devices and Microsoft 365 Apps for enterprise installations meet the specified requirements, you need to do the following:
- Add the Windows 10 devices to a group that's available in Azure AD and assign the appropriate licenses to that group. The license assignment is done in the M365 Admin Portal > Billing > Licenses. 
- Configure Microsoft 365 Apps for enterprise to use device-based licensing instead of user-based licensing.

> [!IMPORTANT]
> Be sure to create the Azure AD group and assign the licenses ***before*** you configure Microsoft 365 Apps for enterprise to use device-based licensing. Otherwise you will receive error messages in Microsoft 365 Apps for enterprise.

### Add Windows 10 devices to a group in Azure AD and assign that group licenses

To configure device-based licensing, you first need to add your Windows 10 devices to a group that's available in Azure AD. The following table provides information about the types of groups that are supported and where you can create those groups.The license assignment is done in the M365 Admin Portal > Billing > Licenses. 


| Group type | Create using these tools |
|---------|---------|
|Security, with assigned or static membership. The security group should not be mail-enabled. | Azure AD portal <br/> <br/>On-premises Active Directory and sync to Azure AD with Azure AD Connect        |
|Security, with dynamic device membership |Azure AD portal |
|Distribution list| On-premises Active Directory and sync to Azure AD with Azure AD Connect <br/><br/>On-premises Exchange Server and sync to Azure AD with Azure AD Connect<br/><br/> Microsoft 365 admin center      |
|Office 365 | Not supported   (type of group in Azure AD |



For more information about Azure group management, see the following articles:
- [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal)
- [Create a dynamic group and check status](https://docs.microsoft.com/azure/active-directory/users-groups-roles/groups-create-rule)
- [Azure AD Connect sync: Understand and customize synchronization](https://docs.microsoft.com/azure/active-directory/hybrid/how-to-connect-sync-whatis)

After you have created the appropriate group type and assigned the appropriate Windows 10 devices to the group, you need to assign licenses to that group. For the steps on how to do that, see [Manage licenses for devices](https://go.microsoft.com/fwlink/p/?LinkID=2100336). You can assign licenses to only one group, but you can nest groups within that one group.

## Configure Microsoft 365 Apps for enterprise to use device-based licensing

After you have assigned licenses to the group in Azure AD that contains your Windows 10 devices, you need to configure Microsoft 365 Apps for enterprise to use device-based licensing instead of user-based licensing. You can do that by using either of the following methods:
 - The Office Deployment Tool and the DeviceBasedLicensing setting.
- Group Policy and the "Use a device-based license for Microsoft 365 Apps for enterprise" policy setting

### Using the Office Deployment Tool
If you use the Office Deployment Tool to install or configure Microsoft 365 Apps for enterprise, you'll want to add the following line to your configuration.xml file:

```xml
<Property Name="DeviceBasedLicensing" Value="1" />
```

> [!IMPORTANT]
> To configure device-based licensing by using the Office Deployment Tool, you must be installing Version 1909 or later of Microsoft 365 Apps for enterprise. There was a problem with earlier versions that prevented device-based licensing from being properly configured using the DeviceBasedLicensing setting with the Office Deployment Tool.
>
> If you're using an earlier version of Microsoft 365 Apps for enterprise, you can configure device-based licensing by using [Group Policy](#using-group-policy).  Or, from an elevated command prompt you can run the following command:
>
>   `reg add HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration /v O365ProPlusRetail.DeviceBasedLicensing /t REG_SZ /d 1`

> [!TIP]
> - Be sure you're always using the most current version of the [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) available on the Microsoft Download Center so that you have the latest features and bug fixes.
> - Instead of using a text editor to create your configuration.xml, we recommend that you use the [Office Customization Tool (OCT)](https://config.office.com). The OCT provides a web-based interface for making your selections and creating your configuration.xml file to be used with the Office Deployment Tool. For more information, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md). There is a choice to configure device-based licensing under the **Licensing and activation** section of the OCT.


For more information about using the Office Deployment Tool and the configuration options that it supports, see the following articles:
- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

### Using Group Policy 
If you use Group Policy to configure Microsoft 365 Apps for enterprise settings, you can enable the "Use a device-based license for Microsoft 365 Apps for enterprise" policy setting. This policy setting can be found under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Licensing Settings.

> [!NOTE]
> - To use this policy setting, download the most current version of the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.
> - This policy setting was previously named "Use a device-based license for Office 365 ProPlus." If you configured the previously named policy setting, the setting you chose still applies.

## Troubleshoot device-based licensing for Microsoft 365 Apps for enterprise

You can verify that Microsoft 365 Apps for enterprise is using a device-based license by opening an Office application, such as Word, and going to **File** > **Account**. In the **Product Information** section, you should see **Belongs to: This device**.

If the device hasn't been properly configured for device-based licensing, when a user tries to use Microsoft 365 Apps for enterprise on the device, Office will be in reduced functionality mode. That means the user can open and print existing documents in Office applications, but the user can't create new documents or edit and save existing documents.

In those cases, the user will also see a banner beneath the ribbon in the document with the following message:

> **LICENSE REQUIRED** Your admin needs to assign an Office license to this device so you can edit your files.

To troubleshoot this issue, make sure the device is correctly joined to Azure AD and that the device is added to the group that has been assigned the licenses. Also, there can be a delay of approximately one hour after you add the device to the group, so that might be causing this message to appear. Close the app and open the app again later.

In other cases, the user might see this message:

> **CAN'T VERIFY LICENSE** We're having trouble verifying the Office license for this device.

In this case, the device is having problems contacting the Office Licensing Service on the internet. Office tries to contact the Office Licensing Service to ensure the device is properly licensed and to automatically renew a license that is about to expire. A device-based license is set to expire in about 3 to 4 months, so the device doesn't have to access to internet constantly. The **CAN'T VERIFY LICENSE** message usually appears about 10 days before the license is about to expire.

## Transition from subscription licensing or shared computer activation to device-based licensing 

If Microsoft 365 Apps  are already installed and activated with user-based subscription licensing or shared computer activation, you will need to reset the license state on the device before it will transition over to device-based licensing. To reset the activation state, see [Reset Microsoft 365 Apps for enterprise activation state](https://docs.microsoft.com/office/troubleshoot/activation/reset-office-365-proplus-activation-state).

Make sure the device has access to the internet or that your firewall isn't preventing access to the Office licensing service. For more information about firewall settings, see [Office 365 URLs and IP address ranges](https://docs.microsoft.com/microsoft-365/enterprise/urls-and-ip-address-ranges).  
