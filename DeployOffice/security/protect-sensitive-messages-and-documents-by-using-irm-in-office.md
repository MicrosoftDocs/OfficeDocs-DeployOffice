---
title: "Protect sensitive messages and documents by using Information Rights Management (IRM) in Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
ms.date: 9/8/2017
audience: ITPro
ms.topic: article
ms.service: office-perpetual-itpro
ms.collection: tier2
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
description: "Use Information Rights Management (IRM) in Office to specify permission for accessing and using sensitive documents and messages."
---

# Protect sensitive messages and documents by using Information Rights Management (IRM) in Office 2016

 **Summary:** Use Information Rights Management (IRM) in Office 2016 to specify permission for accessing and using sensitive documents and messages. 
  
  
IRM allows individuals and administrators to specify who can access documents, workbooks, and presentations. This helps prevent sensitive information from being printed, forwarded, or copied by unauthorized people. This article contains a summary of IRM technology and how it works in Office applications, together with links to more information about how to set up and install the required software to implement IRM in Office 2016.
  
 
<a name="BKMK_WhatIsIRM"> </a>
    
## IRM overview

Azure Rights Management and Active Directory Rights Management are persistent document-level information protection technologies from Microsoft. They use permissions and authorization to help prevent sensitive information from being printed, forwarded, or copied by authorized users, or accessed by unauthorized people. After you restrict permission for a document or message with IRM, the usage restrictions travel with the document or email message as part of the contents of the file. Microsoft Office implements support for these technologies by using Information Rights Management (IRM) features.
  
The ability to create documents or email messages that have restricted permission by using IRM is available in Office Professional Plus 2016 and Microsoft 365 Apps for enterprise, and in the stand-alone versions of Excel 2016, Outlook 2016, PowerPoint 2016, InfoPath 2016, and Word 2016. IRM content that is created in Office 2016 can be viewed in Office 2007, Office 2010, Office 2013, or Office 2016.
  
For more information about IRM and Active Directory Rights Management Services (AD RMS) features that are supported in Office 2016, Office 2013, Office 2010, and Office 2007, see [AD RMS and Microsoft Office Deployment Considerations](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772697(v=ws.10)). For information about IRM and Azure RMS see [How applications support Azure Rights Management](/azure/information-protection/applications-support) and [What is Azure Rights Management](/azure/information-protection/what-is-azure-rms).
  
IRM support in Office 2016 helps organizations and knowledge workers address two fundamental needs:
  
- **Restricted permissions for sensitive information** IRM helps protect sensitive information from unauthorized access and reuse. Organizations rely on firewalls, logon security-related measures, and other network technologies to help protect sensitive intellectual property. However, a basic limitation of using these technologies is that legitimate users who have access to the information can share it with unauthorized people. This could lead to a potential breach of security policies. 
    
- **Information privacy, control, and integrity** Information workers often work with confidential or sensitive information. By using IRM, employees do not have to depend on the discretion of other people to ensure that sensitive materials remain inside the company. IRM prevents users' ability to forward, copy, or print confidential information by disabling those functions in documents and messages that use restricted permissions. 
    
For information technology (IT) managers, IRM helps enable the enforcement of existing corporate policies about document confidentiality, workflow, and email retention. For executives and security officers, IRM reduces the risk of having key company information fall into the hands of the wrong people, whether by accident, thoughtlessness, or through malicious intent.
  
<a name="BKMK_HowIRMWorks"> </a>

## How IRM works in Office 2016
Office users apply permissions to messages or documents by using options in the **File** menu; for example, by using the **Restrict Access** option, under **Info**, **Protect Document**. The protection options that are available are based on Rights Policy Templates that you can customize for your organization. Rights Policy Templates are groups of IRM rights that you package together in a predefined policy that users can apply to their documents. Office 2016 also provides a predefined **Do Not Forward** option which grants specific rights to the recipients of an email. To learn more about Rights Policy Templates, see [Configuring and managing templates for Azure Information Protection](/azure/information-protection/configure-policy-templates).
  
> [!NOTE]
> In addition to using the options from the **File** menu, users can select **Share Protected** from the Office ribbon when you install the Rights Management sharing application for Windows. This application also enables additional functionality, such as the ability to track consumption of shared documents. For more information, see [Rights Management Sharing Application for Windows](/azure/information-protection/rms-client/sharing-app-windows). 
  
To protect a document in Office 2016 using IRM, you must have an on-premises AD RMS or an Azure RMS subscription either as part of Office 365 or as a standalone service.
  
### Using IRM with Active Directory Rights Management Services

Enabling IRM in your organization requires access to a computer running Active Directory Rights Management Services (AD RMS) for Windows Server 2012 or Windows Server 2012 R2, or to a cloud tenant with an Azure RMS subscription. The permissions are enforced by using authentication, typically by using Active Directory Domain Services (AD DS) or Azure Active Directory.
  
Organizations can define the permissions policies that appear in Office applications by creating rights policy templates. For example, you might define a rights policy template named **Marketing Confidential**, which specifies that documents or email messages that use the policy can only be opened by users inside that department. While there is no limit to the number of permission policies that can be created, Office can only display up to 20 policy templates at a time. Azure Rights Management provides two pre-defined organization-wide templates to which you can either add your own custom templates, or alternatively you can disable the templates if you want.
  
With AD RMS on Windows Server 2012, users can share rights-protected documents between companies that have a federated trust relationship. For more information, see [Active Directory Rights Management Services Overview](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771627(v=ws.11)) and [Federating AD RMS](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee256071(v=ws.10)). With Azure RMS, the ability to securely collaborate between organizations is built-in and doesn't require you to complete any special configuration. 
  
While the ability to create and consume protected emails in Outlook 2016 does not require any special configuration in the email server, Exchange Server 2016 offers additional IRM-protected email functionality including RMS protection for Unified Messaging voice mail messages and Microsoft Outlook protection rules that can automatically apply IRM-protection to messages in Outlook 2016 before they leave the Microsoft Outlook client. Additionally, enabling IRM integration in Exchange Server allows users to create and consume protected emails in Outlook Web App and in Exchange ActiveSync IRM-enabled mobile devices. For more information, [Information Rights Management in Exchange 2016](/Exchange/policy-and-compliance/information-rights-management).
  
<a name="BKMK_SettingUpIRM"> </a>

## Setting up IRM for Office 2016

Applying IRM permissions to documents or email messages requires the following:
  
- Access to AD RMS for Windows Server 2012 or Windows Server 2012 R2, or to Azure Rights Management in order obtain licenses to consume content.
    
- Rights Management client software. This client software is included in Windows Vista and later versions. The Rights Management sharing applications provides an optional add-on that enhances IRM functionality in Office.
    
- Microsoft Office 2007, Office 2010, Office 2013, or Office 2016. Only specific editions of Office enable users to create IRM permissions.
    
### Setting up RMS server access

AD RMS and Azure RMS manage licensing and other server functions that work with IRM to provide rights management to client applications such as Office 2016. An RMS-enlightened client program, such as Office 2016, lets users create and view rights-protected content.
  
### Setting up the Rights Management on the client

RMS client software is included in Windows Vista, Windows 7, Windows 8.1, and Windows 10. In order to enable the additional IRM functionality in Office by using the RMS sharing application, users can install it themselves or administrators can automatically deploy it for users.

> [!NOTE]
> Windows Vista, Windows 7, and Windows 8.1 are no longer supported.
  
### Defining and deploying rights policy templates for Office 2016

As in Office 2007, Office 2010, and Office 2013, Office 2016 includes the option for users to apply individual rights to documents and messages, such as **Read** and **Change** in Word 2016, Excel 2016, PowerPoint 2016, and Visio 2016. In Outlook you can use the **Do Not Forward** option that allows you to confidently share email, granting only limited rights to the intended recipients of the message. You can also define custom rights policy templates for your organization that are deployed to clients automatically so they can be applied by users in one click. 
  
You create and manage rights policy templates by using the administration site on your RMS or AD RMS server. For information about how to create, configure, and post custom policy templates, see [AD RMS Rights Policy Templates Deployment Step-by-Step Guide](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731070(v=ws.10)). 
  
The rights that you can include in permissions policy templates for Office 2016 are listed in the following sections.
  
#### IRM rights

Each IRM right that is listed in the following table can be enforced by Office 2016 applications that are configured to work with AD RMS or Azure RMS.
  
**IRM permissions rights**

|**IRM right**|**Description**|
|:-----|:-----|
|Full Control  <br/> |Gives the user every right that is listed in this table, and the right to change permissions that are associated with content. Expiration does not apply to users who have Full Control.  <br/> |
|View  <br/> |Allows the user to open IRM content. This corresponds to Read Access in the Office 2016 user interface.  <br/> |
|Edit  <br/> |Allows the user to modify the document's content. This includes the ability to sort and filter content in Excel.  <br/> |
|Save  <br/> |Allows the user to save a file.  <br/> |
|Extract  <br/> |Allows the user to make a copy of any part of a file and paste that part of the file into the work area of another application.  <br/> |
|Export  <br/> |Allows the user to save content in another file format by using the **Save As** command. Depending on the application that uses the file format that you select, the content might be saved without protection.  <br/> |
|Print  <br/> |Allows the user to print the contents of a file.  <br/> |
|Allow Macros  <br/> |Allows the user to run macros against the contents of a file, as well as perform programmatic access to content from other applications and link to content across worksheets.  <br/> |
|Forward  <br/> |Allows an email recipient to forward an IRM email message and to add or remove recipients from the To: and Cc: lines. This right does not imply the ability to grant rights to additional users, and even if a user is forwarded the content, if that user is not granted rights by the template then the user will be prevented from opening the content. Not granting this right in a template is not equivalent to using the **Do Not Forward** option in Outlook, since that option grants rights only to the users specified in the To: and Cc: lines of the email.  <br/> |
|Reply  <br/> |Allows email recipients to reply to an IRM email message.  <br/> |
|Reply All  <br/> |Allows email recipients to reply to all users on the To: and Cc: lines of an IRM email message.  <br/> |
|View Rights  <br/> |Gives the user permission to view the rights associated with a file. Office ignores this right.  <br/> |
   
#### Predefined groups of permissions

Office 2016 provides the following predefined groups of rights that users can choose from when they create IRM content. The options are available in the **Permission** dialog box for Word 2016, Excel 2016, PowerPoint 2016, and Visio 2016. In the Office application, select the **File** tab, choose **Info**, choose the **Protect Document** button, select **Restrict Access**, and then choose from the rights policy templates listed, or choose **Restricted Access**. If you choose **Restricted Access**, you are given the option of selecting one of the predefined permission groups for each individual user.
  
**Predefined read/change permissions groups**

|**IRM predefined group**|**Description**|
|:-----|:-----|
|Read  <br/> |Users who have Read permission have View rights.  <br/> |
|Change  <br/> |Users who have Change permission have rights to View, Edit, Extract, and Save.  <br/> |
   
In Outlook 2016, users can select the following predefined group of rights when they create an email item. To access the option from the email item, choose **File**, **Info**, and then **Set Permissions**. Next, choose from the Rights Policy Templates listed, which are populated by the Rights Management server or service, or choose **Do Not Forward**, which implements the following rights.
  
**Predefined "Do not forward" group**

|**IRM predefined group**|**Description**|
|:-----|:-----|
|Do Not Forward  <br/> |In Outlook, Do Not Forward to an email grants users on the To:, Cc:, and Bcc: lines the View, Edit, Reply, and Reply All rights.  <br/> |
   
#### Advanced permissions

In Word 2016, Other IRM permissions can be specified for parts of a document. From **Info**, **Protect Document**, choose **Restrict Editing**, and select the **More Users** option to add users with rights to edit the indicated sections of a document. For even more restriction options, choose **Restrict permission** at the bottom of the **Restrict Editing** panel. For example, users can specify an expiration date, restrict other users from printing or copying content, and so on. 
  
<a name="BKMK_ConfiguringIRMForOffice"> </a>

## Configuring IRM settings for Office 2016

You can lock down many settings to customize IRM by using the Office Group Policy template (Office). Use this Group Policy template to configure Group Policy Objects in Active Directory and should not be confused with the rights policy templates. In addition, there are IRM configuration options that can only be configured by using registry key settings.
  
### Office 2016 IRM settings

The settings that you can configure for IRM in Group Policy are listed in the following table. In Group Policy, these settings are under **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Manage Restricted Permissions**. 
  
**IRM settings for Group Policy**

|**IRM option**|**Description**|
|:-----|:-----|
|Active Directory timeout for querying one entry for group expansion  <br/> |Specify the time-out value for querying an Active Directory entry when you expand a group.  <br/> |
|Additional permissions request URL  <br/> |Specify the location where a user can obtain more information about how to access the IRM content when consuming content protected in this client.  <br/> |
|Always expand groups in Office when restriction permission for documents  <br/> |Group name is automatically expanded to display all the members of the group when users apply permissions to a document by selecting a group name in the **Permission** dialog box.  <br/> |
|Always require users to connect to verify permission  <br/> |Users who open a rights-managed Office document must connect to the RMS service to verify that they are still entitled to consume the content by acquiring a new IRM license.  <br/> |
|Never allow users to specify groups when restricting permission for documents  <br/> |Return an error when users select a group in the **Permission** dialog box: ''You cannot publish content to Distribution Lists. You may only specify email addresses for individual users.''  <br/> |
|Prevent users from changing permission on rights managed content  <br/> |If enabled, users can consume content that already includes IRM permissions, but cannot apply IRM permissions to new content nor configure the rights on a document.  <br/> |
|Turn off Information Rights Management user interface  <br/> |Disable all Rights Management-related options within the user interface of all Office applications.  <br/> |
   
### Office 2016 IRM registry key options

The settings that you can configure for IRM in the registry are listed in the following tables.
  
The following IRM registry settings are located in **HKCU\Software\Microsoft\Office\16.0\Common\DRM**. 
  
**IRM registry key options**

|**Registry entry**|**Type**|**Value**|**Description**|
|:-----|:-----|:-----|:-----|
|RequestPermission  <br/> |DWORD  <br/> |1 = The box is checked. <br/> <br/> 0 = The box is cleared.  <br/> |This registry key toggles the default value of the **Users can request additional permissions from** check box.  <br/> |
|DoNotUseOutlookByDefault  <br/> |DWORD  <br/> |0 = Microsoft Outlook is used <br/> <br/> 1 = Microsoft Outlook is not used  <br/> |The **Permission** dialog box uses Microsoft Outlook to validate email addresses that are entered in that dialog box. This causes an instance of Microsoft Outlook to be started when restricting permissions. Disable the option by using this key.  <br/> |
   
The following IRM registry setting is located in **HKCU\Software\Microsoft\Office\16.0\Common\DRM\LicenseServers**. There is no corresponding Group Policy setting. 
  
**IRM registry setting for license servers**

|**Registry entry**|**Type**|**Value**|**Description**|
|:-----|:-----|:-----|:-----|
|LicenseServers  <br/> |Key/Hive. Contains DWORD values that have the name of a license server.  <br/> |Set to the server URL. If the value of the DWORD is 1, Office will not prompt to obtain a license, it will get the license automatically.  <br/><br/> If the value is zero or there is no registry entry for that server, Office prompts for a license.  <br/> |Example: If http://contoso.com/_wmcs/licensing = 1 is a value for this setting, a user who tries to obtain a license from that server to open a rights-managed document will not be prompted for authorization. This is the same as the user selecting the checkbox asking not to be notified again the first time that they consume the content.  <br/> |
   
The following IRM registry setting is located in **HKCU\Software\Microsoft\Office\16.0\Common\Security**. There is no corresponding Group Policy setting. 
  
**IRM registry settings for security**

|**Registry entry**|**Type**|**Value**|**Description**|
|:-----|:-----|:-----|:-----|
|DRMEncryptProperty  <br/> |DWORD  <br/> |1 = The file metadata is encrypted. <br/> <br/> 0 = The metadata is stored in plaintext. The default value is 0.  <br/> |Specify whether to encrypt all metadata that is stored inside a rights-managed document.  <br/> |
   
Encrypted metadata is not compatible with Azure Information Protection labels. If you use these labels, do not set the value to 1.
  
For Open XML Formats (for example, docx, xlsx, pptx, and so on), users can decide to encrypt the Office metadata that is stored inside a rights-managed file, or leave metadata content as not encrypted so other applications, such as the FCI functionality in a Windows File Server, can access the data.
  
Users can choose to encrypt the metadata by setting a registry key. You can set a default option for users by deploying the registry setting. There is no option for encrypting some of the metadata: all metadata is encrypted or none is encrypted.
  
In addition, the **DRMEncryptProperty** registry setting does not determine whether non-Office client metadata storage, such as metadata created by SharePoint Server 2016, is encrypted. 
  
<a name="BKMK_ConfiguringIRMOutlook"> </a>

## Configuring IRM settings for Outlook 2016

In Outlook 2016, users can create and send email messages that have restricted permission to help prevent messages from being forwarded, printed, or copied. Office 2016 documents, workbooks, and presentations that are attached to messages that have restricted permission are also automatically restricted.
  
As a Microsoft Outlook administrator, you can configure several options for IRM email, such as disabling IRM or configuring local license caching. 
  
The following IRM settings and features can be useful when you configure rights-managed email messaging:
  
- Configure automatic license caching for IRM.
    
- Help enforce an email message expiration period.
    
- Do not use Outlook for validating email addresses for IRM permissions.
    
> [!NOTE]
> To disable IRM in Outlook, you must disable IRM for all Office applications. There is no separate option to disable IRM only in Outlook. 
  
### Outlook IRM settings

You can lock down most settings to customize IRM for Microsoft Outlook by using the Microsoft Outlook Group Policy template (Outlk) or the Office Group Policy template (Office). Or, you can configure default settings for most options by using the Office Customization Tool (OCT), which enables users to configure the settings. The OCT settings are in corresponding locations on the **Modify user settings** page of the OCT. 
  
**Outlook IRM options**

|**Location**|**IRM option**|**Description**|
|:-----|:-----|:-----|
|Microsoft Outlook 2016\Miscellaneous  <br/> |Do not download rights permissions license information for IRM email during Exchange folder sync  <br/> |Enable to prevent license information from being cached locally. If enabled, users must connect to the network to retrieve license information to open rights-managed email messages. This doesn't affect Exchange pre-licensing which is performed at the server.  <br/> |
|Options > More Options > Delivery options  <br/> |**When sending a message** <br/> |To enforce email expiration, enable and enter the number of days before a message expires. The expiration period is enforced only when users send rights-managed email and the message can't be accessed after the expiration period.  <br/> |
   
### Outlook 2016 IRM registry key options

The **Permission** dialog box uses Microsoft Outlook to validate email addresses that are entered in that dialog box. This causes an instance of Microsoft Outlook to start when permissions are restricted. You can disable this option by using the registry key that is listed in the following table. There is no corresponding Group Policy or OCT setting for this option. 
  
The following IRM registry setting is located in **HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\DRM**. 
  
**Outlook IRM registry key options**

|**Registry entry**|**Type**|**Value**|**Description**|
|:-----|:-----|:-----|:-----|
|DoNotUseOutlookByDefault  <br/> |DWORD  <br/> |0 = Microsoft Outlook is used <br/> <br/> 1 = Microsoft Outlook is not used  <br/> |Disable the option by using this key.  <br/> |
   
<a name="BKMK_Overview"> </a>

## Overview for configuring IRM in Office 2016

You can lock many settings to customize IRM by using the Office 2016 Administrative Template files (Office16.admx) and Microsoft Outlook Group Policy template (Outlk16.admx). In addition, there are IRM configuration options that you can only configure by using registry key settings.
  
In Outlook 2016, users can create and send email messages that have restricted permission to help prevent messages from being forwarded, printed, or copied and pasted. Office 2016 documents, workbooks, and presentations that are attached to messages that have restricted permission are also automatically restricted.
  
As a Microsoft Outlook administrator, you can configure several options for IRM email, such as disabling IRM or configuring local license caching. You can also design custom IRM permissions for users, in addition to the default **Do Not Forward** permissions group.
  
<a name="BKMK_BeforeYouBegin"> </a>

## Before you begin

Before you start deployment, determine the settings that you might have to configure for IRM.
  
You can download the Office 2016 and Outlook 2016 templates from the Microsoft Download Center, [Administrative Template files (ADMX/ADML) for Office](https://go.microsoft.com/fwlink/p/?LinkID=626001).
  
<a name="BKMK_TurnOffIRM"> </a>

## Turn off Information Rights Management in Office 2016

You can turn off IRM for all Office applications. To turn off IRM in Outlook 2016, you must turn off IRM for all Office applications. There is no separate option to turn off IRM only in Microsoft Outlook.
  
### To turn off IRM in Office 2016 by using Group Policy

1. In Group Policy, load the Office 2016 template (Office) and locate **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Manage Restricted Permissions**.
    
2. Choose **Turn Off Information Rights Management User Interface**.
    
3. Choose **Enabled**.
    
4. Choose **OK**.
    
<a name="BKMK_ConfigureAutomaticLicenseCaching"> </a>

## Configure automatic license caching for Outlook 2016


By default, Outlook 2016 automatically downloads the IRM license for rights-managed email when Outlook synchronizes with Exchange Server. You can configure Outlook 2016 to prevent license information from being cached locally. This forces users to connect to the network to retrieve license information before they can open rights-managed email messages.
  
### To disable automatic license caching for IRM by using Group Policy

1. In Group Policy, load the Outlook 2016 template (Outlk) and locate **User Configuration\Policies\Administrative Templates\Microsoft Outlook 2016\Miscellaneous**.
    
2. Choose **Do not download rights permission license information for IRM email during Exchange folder sync**.
    
3. Choose **Enabled**.
    
4. Choose **OK**.
