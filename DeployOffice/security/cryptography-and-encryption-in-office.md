---
title: "Cryptography and encryption in Office 2016"
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
ms.assetid: 9ed0c24f-02d0-4202-a4e5-853ebd06a58c
description: "Explains the settings that you can use to encrypt data in Office, and provides information about compatibility with previous versions of Office."
---

# Cryptography and encryption in Office 2016

 **Summary:** Explains the settings that you can use to encrypt data in Office 2016, and provides information about compatibility with previous versions of Office. 
  
  
Office 2016 contains settings that let you control the way that data is encrypted when you use Access 2016, Excel 2016, OneNote 2016, PowerPoint 2016, Project 2016, and Word 2016.
  
This article discusses cryptography and encryption in Office 2016, describes the settings that you can use to encrypt data, and provides information about compatibility with previous versions of Office. 
  
 
As you plan your encryption settings, consider the following:
  
- We recommend that you do not change the default encryption settings unless your organization's security model requires encryption settings that differ from the default settings. 
    
- We recommend that you enforce password length and complexity to help ensure that strong passwords are used when you encrypt data.
    
- We recommend that you do not use RC4 encryption. For more information, see [Compatibility with previous versions of Office](cryptography-and-encryption-in-office.md#compat) later in this article. 
    
- There isn't an administrative setting that forces users to encrypt documents. However, there  is  an administrative setting that prevents users from adding passwords to documents and, therefore, prevent documents from being encrypted. For more information, see [Cryptography and encryption settings](cryptography-and-encryption-in-office.md#settings) later in this article. 
    
- Saving documents in trusted locations doesn't affect encryption settings. If a document is encrypted and it is saved in a trusted location, a user still must provide a password to open the document.
    
- If you do allow users to password protect documents, and they later forget or lose the password, you can use the DocRecrypt tool to reset or remove the password. For more information, see the [Remove or reset file passwords in Office 2016](remove-or-reset-file-passwords-in-office.md) article. 
    
    
<a name="about"> </a>

## About cryptography and encryption in Office 2016

The encryption algorithms that are available for you to use with Office depend on the algorithms that can be accessed through the APIs (application programming interfaces) in the Windows operating system. Office 2016, in addition to maintaining support for Cryptography API (CryptoAPI), also includes support for CNG (CryptoAPI: Next Generation), which was first made available in the 2007 Microsoft Office system with Service Pack 2 (SP2).
  
CNG allows for more agile encryption, where encryption and hashing algorithms that are supported on the host computer can be specified for use during the document encryption process. CNG also allows for better extensibility encryption, where third-party encryption modules can be used.
  
When Office uses CryptoAPI, the encryption algorithms depend on those that are available in a Crypto Service Provider (CSP), which is part of the Windows operating system. The following registry key contains a list of CSPs that are installed on a computer:
  
 **HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Cryptography/Defaults/Provider**
  
The following CNG encryption algorithms, or any other CNG cipher extension installed on the system, can be used with the 2007 Office system SP2, Office 2010, Office 2013, or Office 2016:
  
AES, DES, DESX, 3DES, 3DES_112, and RC2
  
The following CNG hashing algorithms, or any other CNG cipher extension that is installed on the system, can be used with the 2007 Office system SP2, Office 2010, Office 2013, or Office 2016:
  
MD2, MD4, MD5, RIPEMD-128, RIPEMD-160, SHA-1, SHA256, SHA384, and SHA512
  
Although there are Office 2016 settings to change how encryption is performed, when you encrypt Open XML Format files (.docx, .xslx, .pptx, and so on) the default values — AES (Advanced Encryption Standard), 256-bit key length, SHA1, and CBC (cipher block chaining) — provide strong encryption and should be fine for most organizations. AES encryption is the strongest industry-standard algorithm that is available and was selected by the National Security Agency (NSA) to be used as the standard for the United States Government. AES encryption is supported on Windows Vista, Windows 7, Windows 8, Windows 10, Windows Server 2003, Windows Server 2003 R2, Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012.
  
<a name="settings"> </a>

## Cryptography and encryption settings

The following table lists the encryption algorithm settings you can use with Office versions that access CryptoAPI. This includes Office versions up to and including Office 2016.
  
**Encryption algorithm settings for use with CryptoAPI**

|**Setting**|**Description**|
|:-----|:-----|
|**Encryption type for password-protected Office Open XML files** <br/> |This setting lets you specify an encryption type for Open XML files from the available cryptographic service providers (CSP). This setting is required when you use a custom COM encryption add-in. This setting is also required if you use the 2007 Office system SP1 or use a version of the Compatibility Pack that is older than the [Microsoft Office Compatibility Pack for Word, Excel, and PowerPoint File Formats](https://go.microsoft.com/fwlink/p/?LinkID=78517) and you want to change the encryption algorithm to something other than the default.  <br/> |
|**Encryption type for password-protected Office 97-2003 files** <br/> |This setting lets you specify an encryption type for Office 97-2003 (binary) files from the available cryptographic service providers (CSP). The only supported encryption algorithm with this setting is RC4, which, we don't recommend.  <br/> |
   
In Office 2016, if you must change the **Encryption type for password-protected Office Open XML files** setting, first enable the **Specify encryption compatibility** setting and select the **Use legacy format** option. The **Specify encryption compatibility** setting is available for Access 2016, Excel 2016, PowerPoint 2016, and Word 2016. 
  
The following table lists the settings that are available to change the encryption algorithms when you use Office 2016. These settings apply to Access 2016, Excel 2016, OneNote 2016, PowerPoint 2016, Project 2016, and Word 2016.
  
**Settings that change the encryption algorithm**

|**Setting**|**Description**|
|:-----|:-----|
|**Set CNG cipher algorithm** <br/> |Lets you configure the CNG cipher algorithm that is used. The default is AES.  <br/> |
|**Configure CNG cipher chaining mode** <br/> |Lets you configure the cipher chaining mode that is used. The default is **Cipher Block Chaining (CBC)**.  <br/> |
|**Set CNG cipher key length** <br/> |Lets you configure the number of bits to use when you create the cipher key. The default is 256 bits.  <br/> |
|**Specify encryption compatibility** <br/> |Lets you specify the compatibility format. The default is **Use next generation format**.  <br/> |
|**Set parameters for CNG context** <br/> |Lets you specify the encryption parameters that should be used for the CNG context. To use this setting, a CNG context first has to be created by using CryptoAPI: Next Generation (CNG). For more information, see [CNG Cryptographic Configuration Functions](https://go.microsoft.com/fwlink/p/?LinkID=192996).  <br/> |
|**Specify CNG hash algorithm** <br/> |Lets you specify the hash algorithm that is used. The default is SHA1.  <br/> |
|**Set CNG password spin count** <br/> |Lets you specify the number of times to spin (rehash) the password verifier. The default is 100000.  <br/> |
|**Specify CNG random number generator algorithm** <br/> |Lets you configure the CNG random number generator to use. The default is RNG (Random Number Generator).  <br/> |
|**Specify CNG salt length** <br/> |Lets you specify the number of bytes of salt that should be used. Salt is additional input to the password and hash. The default is 16.  <br/> |
   
The following table lists additional CNG settings that can be configured for Excel 2016, PowerPoint 2016, and Word 2016.
  
**Excel 2016, PowerPoint 2016, and Word 2016 specific CHG setting**

|**Setting**|**Description**|
|:-----|:-----|
|**Use new key on password change** <br/> |Lets you specify if a new encryption key should be used when the password is changed. The default is not to use a new key on password changes.  <br/> |
   
You can use the setting that is listed in the following table to prevent users from adding passwords to documents. This prevents users from encrypting documents.
  
**Setting used to prevent users from password protecting a document**

|**Setting**|**Description**|
|:-----|:-----|
|**Disable password to open UI** <br/> |This setting controls whether Office 2016 users can add passwords to documents. By default users can add passwords.  <br/> |
   
<a name="compat"> </a>

## Compatibility with previous versions of Office

If you have to encrypt Office documents, we recommend that you save the documents as Open XML Format files (.docx, .xlsx, .pptx, and so on) instead of Office 97-2003 format (.doc, .xls, .ppt, and so on). The encryption that is used for binary documents (.doc, .xls, .ppt) uses RC4. It isn't recommended, as discussed in Security Considerations sections 4.3.2 and 4.3.3 of the [Office Document Cryptography Structure Specification](https://go.microsoft.com/fwlink/p/?LinkId=192287). Documents that are saved in the older Office binary formats can only be encrypted by using RC4 to maintain compatibility with older versions of Office. AES, the default and recommended encryption algorithm, is used to encrypt Open XML Format files.
  
Office 2016, Office 2013, Office 2010, and the 2007 Office system let you save documents as Open XML Format files. In addition, if you have Office 2003 you can use the Compatibility Pack to save documents as Open XML Format files.
  
Documents that are saved as Open XML Format files and encrypted by using Office 2016 can only be read by Office 2016, Office 2007 SP2, and Office 2003 with the Office 2007 SP2 compatibility pack. To ensure compatibility with all previous versions of Office, you can create a registry key (if it doesn't already exist) under **HKCU\Software\Microsoft\Office\16.0\\<application\>\Security\Crypto\** called **CompatMode** and disable it by setting it to **0**. The values that you can enter for <application> represent the specific Office application that you are configuring this registry key for. For example, you can enter Access, Excel, PowerPoint, or Word. It is important to realize that, when you set **CompatMode** to **0**, Office 2016 uses an Office 2007 compatible encryption format, instead of the enhanced security that is provided by default when you use Office 2016 to encrypt Open XML Format files. If you have to configure this setting for compatibility reasons, we recommend that you also use a third-party encryption module that allows for enhanced security, such as AES encryption. 
  
If your organization uses the Microsoft Office Compatibility Pack for Word, Excel, and PowerPoint File Formats to encrypt Open XML Format files, you should review the following information:
  
- By default, on Windows Server 2003 and Windows Vista operating systems, the Compatibility Pack uses the **Microsoft Enhanced RSA and AES Cryptographic Provider,AES 128,128** setting to encrypt Open XML Format files. 
    
- Users aren't notified that the Compatibility Pack uses these encryption settings.
    
- The graphical user interface on earlier versions of Office might display incorrect encryption settings for Open XML Format files if the Compatibility Pack is installed.
    
- Users can't use the graphical user interface in earlier versions of Office to change the encryption settings for Open XML Format files.
    
## Related topics
[Remove or reset file passwords in Office 2016](remove-or-reset-file-passwords-in-office.md)

[Office Document Cryptography Structure Specification](https://go.microsoft.com/fwlink/p/?LinkId=192287)

