---
title: "Device-based licensing for Office 365 ProPlus for education customers"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Explains how to configure device-based licensing for Office 365 ProPlus for Education customers."
---

# Device-based licensing for Office 365 ProPlus for Education customers

Starting in August 2019, education customers can use *Office 365 ProPlus for Education (device)* to assign an Office 365 ProPlus license to a Windows 10 device instead of assigning the license to a user. This device-based license is designed to simplify management of Office 365 ProPlus on devices shared by many students or on devices in labs or libraries. Anyone that signs in and uses that device can use Office 365 ProPlus to create and edit documents.

> [!IMPORTANT]
> *Office 365 ProPlus for Education (device)* is an add-on license that is available only for education customers and is available only through Enrollment for Education Solutions (EES).
>
> For more information, [read this blog post](https://educationblog.microsoft.com/2019/08/attention-it-administrators-announcing-device-based-subscription-for-education/) and contact your Microsoft account representative or the Microsoft partner that you work with.

## Requirements for using device-based licensing for Office 365 ProPlus

The following are the requirements for device-based licensing for Office 365 ProPlus when using *Office 365 ProPlus for Education (device)*.

- Version 1907 or later of Office 365 ProPlus
- Version 1803 or later of Windows 10
- The Windows 10 device must be Azure Active Directory (Azure AD) joined or hybrid Azure AD joined.

To verify that Office 365 ProPlus and the Windows 10 device meet these requirements, do the following:

- On the Windows 10 device, open an Office application, such as Word, and go to **File** > **Account**. The version number of Office 365 ProPlus that is installed on the device appears in the **About** section of the **Product Information** section.
- On the Windows 10 device, from the Start menu or a command prompt, type `winver` and then hit Enter. The **About Windows** dialog appears and lists the version of Windows 10.
- Sign in to the [Microsoft Azure](https://portal.azure.com/) and go to **Azure Active Directory** > **Devices**. The type of join for your Windows 10 device is listed in the **Join Type** column. 

  If the Windows 10 device doesn’t appear, sign in to the Windows 10 device. Then go to **Settings** > **Accounts** > **Access work or school**, choose **Connect**, and follow the steps to join the device to either Azure Active Directory or to a local Active Directory domain.

## Steps to configure device-based licensing for Office 365 ProPlus

After you have verified that your Windows 10 devices and Office 365 ProPlus installations meet the specified requirements, you need to do the following:
- Add the Windows 10 devices to a group that’s available in Azure AD and assign the appropriate licenses to that group.
- Configure Office 365 ProPlus to use device-based licensing instead of user-based licensing.

> [!IMPORTANT]
> Be sure to create the Azure AD group and assign the licenses ***before*** you configure Office 365 ProPlus to use device-based licensing. Otherwise you will receive error messages in Office 365 ProPlus.

### Add Windows 10 devices to a group in Azure AD and assign that group licenses

To configure device-based licensing, you first need to add your Windows 10 devices to a group that’s available in Azure AD. The following table provides information about the types of groups that are supported and where you can create those groups.


|**Group type**  |**Create using these tools**  |
|---------|---------|
|Security, with assigned or static membership| Azure AD portal <br/> <br/>On-premises Active Directory and sync to Azure AD with Azure AD Connect        |
|Security, with dynamic device membership |Azure AD portal |
|Distribution list| On-premises Active Directory and sync to Azure AD with Azure AD Connect <br/><br/>On-premises Exchange Server and sync to Azure AD with Azure AD Connect<br/><br/> Microsoft 365 admin center      |
|Office 365 | Not supported   (type of group in Azure AD |



For more information about Azure group management, see the following articles:
- [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal)
- [Create a dynamic group and check status](https://docs.microsoft.com/azure/active-directory/users-groups-roles/groups-create-rule)
- [Azure AD Connect sync: Understand and customize synchronization](https://docs.microsoft.com/azure/active-directory/hybrid/how-to-connect-sync-whatis)

After you have created the appropriate group type and assigned the appropriate Windows 10 devices to the group, you need to assign licenses to that group. For the steps on how to do that, see [Manage licenses for devices](https://go.microsoft.com/fwlink/p/?LinkID=2100336). You can assign licenses to only one group, but you can nest groups within that one group.

## Configure Office 365 ProPlus to use device-based licensing

After you have assigned licenses to the group in Azure AD that contains your Windows 10 devices, you need to configure Office 365 ProPlus to use device-based licensing instead of user-based licensing. You can do that by using either of the following methods:
 - The Office Deployment Tool and the DeviceBasedLicensing setting.
- Group Policy and the “Use a device-based license for Office 365 ProPlus” policy setting

If you use the Office Deployment Tool to install or configure Office 365 ProPlus, you’ll want to add the following line to your configuration.xml file:

```xml
<Property Name="DeviceBasedLicensing" Value="1" />
```

> [!TIP]
> - Be sure you're always using the most current version of the [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) available on the Microsoft Download Center so that you have the latest features and bug fixes.
> - Instead of using a text editor to create your configuration.xml, we recommend that you use the [Office Customization Tool (OCT)](https://config.office.com). The OCT provides a web-based interface for making your selections and creating your configuration.xml file to be used with the Office Deployment Tool. For more information, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md). There is a choice to configure device-based licensing under the **Licensing and activation** section of the OCT.

For more information about using the Office Deployment Tool and the configuration options that it supports, see the following articles:
- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)

If you use Group Policy to configure Office 365 ProPlus settings, you can enable the “Use a device-based license for Office 365 ProPlus” policy setting. This policy setting can be found under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Licensing Settings.

> [!NOTE]
> To use this policy setting, download version 4909.1000 (or later) of the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030) for Office 365 ProPlus from the Microsoft Download Center. Version 4909.1000 was released on September 5, 2019.

## Troubleshoot device-based licensing for Office 365 ProPlus

You can verify that Office 365 ProPlus is using a device-based license by opening an Office application, such as Word, and going to **File** > **Account**. In the **Product Information** section, you should see **Belongs to: This device**.

If the device hasn’t been properly configured for device-based licensing, when a user tries to use Office 365 ProPlus on the device, Office will be in reduced functionality mode. That means the user can open and print existing documents in Office applications, but the user can’t create new documents or edit and save existing documents.

In those cases, the user will also see a banner beneath the ribbon in the document with the following message:

   **LICENSE REQUIRED** Your admin needs to assign an Office license to this device so you can edit your files.

To troubleshoot this issue, make sure the device is correctly joined to Azure AD and that the device is added to the group that has been assigned the licenses. Also, there can be a delay of approximately one hour after you add the device to the group, so that might be causing this message to appear. Close the app and open the app again later.

In other cases, the user might see this message:

**CAN’T VERIFY LICENSE** We’re having trouble verifying the Office license for this device.

In this case, the device is having problems contacting the Office Licensing Service on the internet. Office tries to contact the Office Licensing Service to ensure the device is properly licensed and to automatically renew a license that is about to expire. A device-based license is set to expire in about 3 to 4 months, so the device doesn’t have to access to internet constantly. The **CAN’T VERIFY LICENSE** message usually appears about 10 days before the license is about to expire.

Make sure the device has access to the internet or that your firewall isn’t preventing access to the Office licensing service. For more information about firewall settings, see [Office 365 URLs and IP address ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges).  
