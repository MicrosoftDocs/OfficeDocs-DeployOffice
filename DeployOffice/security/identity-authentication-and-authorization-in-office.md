---
title: "Identity, authentication, and authorization in Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Security
ms.assetid: b9ee9188-b209-49a7-a3aa-a6f5040391ba
ROBOTS: NOINDEX, NOFOLLOW
description: "Describes Office authentication, logon types, and how to use registry settings to determine which user identities are offered at user logon."
---

# Identity, authentication, and authorization in Office 2016

 **Summary:** Describes Office 2016 authentication, logon types, and how to use registry settings to determine which user identities are offered at user logon. 
  
  
In the new Office, Office applications are used for both business and non-business activities. A person may use Excel to crunch Q2 widget sales numbers by day and crunch World Cup stats by night, or use Word to write product specifications by day and short stories by night. Because Office is a tool that is used by the same individual in two different roles, the new Office offers two identities with which users can log on to Office 2016: 
  
- **A Microsoft account,** which most people use for personal business 
    
- **An organization ID that is assigned by Microsoft,** which most people use when doing work for an organization, such as a business, charity, or school. 
    
The credentials that are used to sign in are recognized as either personal or organizational. That sign-in identity becomes the user's "home realm" and determines which documents the user has access to on SharePoint, OneDrive, or Office 365 Services for a specific session. Each unique sign-in identity is saved in a most-recently used list so that it is easy to switch between identities without leaving the Office experience.
  
For additional convenience, users can choose to mount an online document service to their identities for easy access. For instance, a personal OneDrive can be mounted to an organization identity so that personal documents can be accessed at work or school without ever switching identities. Also, when a user authenticates by using an identity, this authentication is valid for all Office applications, not just the application he or she signed in to.
  
The very good news is that all of this just works for users, by default, and out of the box. 
  
<a name="Bkmk_1_OAuth"> </a>  

## Office authentication protocols


In Office, users are authenticated by using Forms-Based Authentication (FBA), Windows Integrated Authentication (WIA), or Passport Server Side Include (SSI) Authentication, also known as "Passport Tweener." In Office 2016, you can still use FBA or WIA, but instead of SSI, we now use the new open standard, token-based Open Authorization 2.0 (OAuth 2.0). See the following table for an overview of the authentication protocols that you can use with Office.
  
**Office authentication protocols**

|**Client Office version**|**Authentication protocol**|**Server**|
|:-----|:-----|:-----|
|Office 2010, Office 2013, Office 2016  <br/> |Forms-Based Authentication (FBA). Forms based authentication uses client-side redirection to forward unauthenticated users to an HTML form where they can enter their credentials. After the credentials are validated, users are redirected to the resources that they requested.  <br/> |SharePoint Online  <br/> |
|Office 2010, Office 2013, Office 2016  <br/> |Windows Integrated Authentication (WIA). This is negotiated, as with the Kerberos protocol or NTLM. In this scenario, the operating system provides authentication.  <br/> |SharePoint 2010, SharePoint 2013, SharePoint 2016  <br/> |
|Office 2010, Office 2013, Office 2016  <br/> |SSI, or Passport Tweener, Authentication. When a user provides Windows Live ID credentials or a Microsoft account, the Windows Live ID service returns a passport "ticket" that the client uses to access Windows Live services.  <br/> |OneDrive  <br/> |
|Office 2013, Office 2016  <br/> |Open Authorization 2.0 (OAuth 2.0). OAuth 2.0 provides temporary, redirection-based authorization. A user or a web application that acts on behalf of a user can request authorization to temporarily access specified network resources from a resource owner. For more information, see [OAuth 2.0](https://go.microsoft.com/fwlink/p/?LinkId=268364).  <br/> |OneDrive  <br/> |
|Office 2013, Office 2016  <br/> |Microsoft Online Services Sign-in Assistant. The Microsoft Online Services Sign-In Assistant provides end-user sign-in capabilities to Microsoft Online Services, such as Office 365. For more information about Microsoft Online Services Sign-in Assistant and the IT pro, see [Microsoft Online Services Sign-In Assistant for IT Professionals RTW](https://go.microsoft.com/fwlink/p/?LinkId=268384). The download is for distribution to managed client systems as part of an Office 365 client deployment, using System Center Configuration Manager (SCCM) or similar software distribution systems.  <br/> |Office 365 Services  <br/> |
   
### Logon types in Office 2016

Two logon types are supported when users sign in to Office 2016, a Microsoft account or an organization ID that is assigned by Microsoft. 
  
 **Microsoft account (the user's individual account).** This account, formerly known as Microsoft ID, is the credential that users use to authenticate with the Microsoft network and is frequently used for personal or non-business work, such as volunteer work. To create a Microsoft account, a user provides a user name and password, certain demographic information, and "account proofs," such as an alternative email address or phone number.
  
 **An organization ID that is assigned by Microsoft / Office 365 account ID that is assigned by Microsoft.** This account is created for business use. An Office 365 account can be one of three types: a pure Office 365 ID, an Active Directory ID, or an Active Directory Federation Services ID. These are described below: 
  
- **Office 365 ID.** This ID is created when an admin sets up an Office 365 domain and takes the form \<user\>@\<org\>.onmicrosoft.com, for example: 
    
    sally@contoso.onmicrosoft.com
    
- **Organization ID that is assigned by Microsoft that is validated against a user's Active Directory ID.** An organization ID that is assigned by Microsoft and validated against Active Directory as follows: 
    
1. First, a person who has an [on-premise domain]\\<user\> account attempts to access organization resources.
    
2. Next, the resource requests authentication from the user.
    
3. Then, the user types in their organization user name and password.
    
4. Finally, that user name and password are validated against the organization AD database, the user is authenticated, and is given access to the requested resource.
    
- **An organization ID that is assigned by Microsoft that is validated against a user's Active Directory Federation Services ID.** An organization ID that is assigned by Microsoft and validated against Active Directory Federation Services (AD FS) as follows: 
    
1. First, one person who has an org.onmicrosoft.com attempts to access  *partner*  organization resources. 
    
2. Then, the resource requests authentication from the user.
    
3. Next, the user types in their organization user name and password.
    
4. Then, that user name and password are validated against the organization AD DS database.
    
5. Finally, that same user name and password are passed to the partner's federated AD DS database, the user is authenticated, and is given access to the requested resource.
    
For on-premises resources, Office 2016 uses the domain\alias user name for authentication. For federated resources, Office 2016 uses the alias@org.onmicrosoft.com user name for authentication.
  
<a name="Bkmk_2_GPforIDtypes"> </a>

## Use registry settings to determine which ID types to offer a user at logon

By default, when a user attempts to access an Office 2016 resource, Office 2016 includes registry keys that are set to display a user's Microsoft account ID and the organization ID that is assigned by Microsoft. But, you can change this so that only the Microsoft account is displayed, or their organization ID, or neither. This setting is changed in the computer registry.
  
 **To change the Office 2016 logon types offered to the user**
  
1. From Registry Editor, browse to:
    
    **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\SignIn\SignInOptions**
    
2. Set the value of SignInOptions to one of the values in the following table. The type for the SignInOptions setting is DWORD.
    
   **SignInOptions settings**

|**If you set SignInOptions to this…**|**This is what it means**|**This is the effect on users**|
|:-----|:-----|:-----|
|**0** <br/> |**Microsoft account or organization ID** <br/> |Users can sign in and access Office content by using their Microsoft account or one that is assigned by your organization.  <br/> |
|**1** <br/> |**Microsoft account only** <br/> |Users can sign in only by using their Microsoft account.  <br/> |
|**2** <br/> |**Organization only** <br/> |Users can sign in only by using the user ID that is assigned by your organization. This can be either a user ID in Azure Active Directory or a user ID in Active Directory Domain Services (AD DS) on Windows Server.  <br/> |
|**3** <br/> |**AD DS only** <br/> |Users can sign in only by using a user ID in Active Directory Domain Services (AD DS) on Windows Server.  <br/> |
|**4** <br/> |**None allowed** <br/> |Users can't sign in with any ID.  <br/> |
   
If you disable, or do not configure, the **Block sign-in to Office** setting, the default setting is 0, which means that users can sign in by using their Microsoft account or one that is assigned by your organization. 
    

<a name="Bkmk_3_GPfornoInternet"> </a>
## Use a registry setting to prevent a user from connecting to Office 2016 resources on the Internet

By default, Office 2016 gives users access to Office 2016 files that reside on the Internet. You can change this setting so that a user can't see those resources.
  
 **To allow or prevent a user from connecting to Office 2016 Internet resources**
  
1. From Registry Editor, browse to:
    
    **Computer\HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Internet\UseOnlineContent**
    
2. Set the value of UseOnlineContent to one of the following:
    
   **Office 2016 UseOnlineContent values**

|**UseOnlineContent value**|**Value type**|**Description**|
|:-----|:-----|:-----|
|0  <br/> |DWORD  <br/> |Do not allow user to access Office 2016 resources on the Internet.  <br/> |
|1  <br/> |DWORD  <br/> |Allow user to opt in to access of Office 2016 resources on the Internet.  <br/> |
|2  <br/> |DWORD  <br/> |(Default) Allows the user to access Office 2016 resources on the Internet.  <br/> |
   
<a name="Bkmk_4_DeleteCreds"> </a>
## Delete the Office Profile, and credentials, associated with a removed logon identity

When a user logs into an Office app by using either their Microsoft account ID or their organization ID, a matching Office profile and credentials for that identity are created in the registry. The logon page gives the user the option of removing that identity, just under the "Not user name?" question near the user avatar or photo and name. If users choose to remove one of their identity options, it will be removed from the logon page. But, that corresponding Office profile and credentials will actually remain in the cache for a short time. If this is a security issue, such as when a user is fired from your organization, you should immediately delete that Office profile setting from the registry. To do this, browse to that user's Office profile in the registry, and delete it.
  
 **To delete an Office profile that may still be cached**
  
1. From Registry Editor, browse to:
    
    **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Identity\Identities**
    
2. Choose the Office profile that you want to delete, and then choose **Delete**.
    
3. From the Identity hive, navigate to the Profiles node, choose that same identity, open the shortcut menu (right-click), and then choose **Delete**.
    


