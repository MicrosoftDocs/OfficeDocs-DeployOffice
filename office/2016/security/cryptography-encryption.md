---
title: "Cryptography and encryption in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.collection: Tier2
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
description: "Explains the settings that you can use to encrypt data in Office, and provides information about compatibility with previous versions of Office."
ms.date: 04/19/2024
---

# Cryptography and encryption in Office 2016

Office 2016 offers encryption settings to enhance data security. These settings are available in several applications, including Access 2016, Excel 2016, OneNote 2016, PowerPoint 2016, Project 2016, and Word 2016.
  
This article explores cryptography and encryption in Office 2016. It outlines settings for data encryption and offers details on compatibility with previous versions of Office.  
 
As you plan your encryption settings, consider the following recommendations:
  
- Avoid changing the default encryption settings unless your organization's security model require different settings. 
    
- We recommend that you enforce password length and complexity to help ensure that strong passwords are used when you encrypt data.
    
- We recommend that you don't use RC4 encryption. For more information, see [Compatibility with previous versions of Office](cryptography-encryption.md#compat) later in this article. 
    
- There isn't an administrative setting that forces users to encrypt documents. However, there's  an administrative setting that prevents users from adding passwords to documents and, therefore, prevent documents from being encrypted. For more information, see [Cryptography and encryption settings](cryptography-encryption.md#settings) later in this article. 
    
- Saving documents in trusted locations doesn't affect encryption settings. If a document is encrypted and saved in a trusted location, a user still must provide a password to open the document.
    
- If you allow users to password protect documents, there's a possibility they might forget or lose the password. In such cases, you can use the DocRecrypt tool to reset or remove the password. For more information, see [Remove or reset file passwords in Office 2016](remove-reset-file-passwords.md). 
    
    
<a name="about"> </a>

## About cryptography and encryption in Office 2016

The encryption algorithms that are available for you to use with Office depend on the algorithms that can be accessed through the APIs (application programming interfaces) in the Windows operating system. Office 2016, in addition to maintaining support for Cryptography API (CryptoAPI), also includes support for CNG (CryptoAPI: Next Generation), which was first made available in the 2007 Microsoft Office system with Service Pack 2 (SP2).
  
CNG allows for more agile encryption, where encryption and hashing algorithms that are supported on the host computer can be specified for use during the document encryption process. CNG also allows for better extensibility encryption, where third-party encryption modules can be used.
  
When Office uses CryptoAPI, the encryption algorithms depend on the specific algorithms that are available in a Crypto Service Provider (CSP), which is part of the Windows operating system. The following registry key contains a list of CSPs that are installed on a computer:
  
 **HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Cryptography/Defaults/Provider**
  
The following CNG encryption algorithms, or any other CNG cipher extension installed on the system, can be used with the 2007 Office system SP2, Office 2010, Office 2013, or Office 2016:
  
AES, DES, DESX, 3DES, 3DES_112, and RC2
  
The following CNG hashing algorithms, or any other CNG cipher extension that is installed on the system, can be used with the 2007 Office system SP2, Office 2010, Office 2013, or Office 2016:
  
MD2, MD4, MD5, RIPEMD-128, RIPEMD-160, SHA-1, SHA256, SHA384, and SHA512
  
In Office 2016, while there are settings to modify encryption methods, encrypting Open XML Format files (.docx, .xslx, .pptx, etc.) with the default values — AES (Advanced Encryption Standard) with a 256-bit key length, SHA-2, and CBC (cipher block chaining) — provides robust encryption suitable for most organizations. The National Security Agency (NSA) chose AES encryption as the strongest industry-standard algorithm for the United States Government's standard. AES encryption is compatible with various Windows operating systems, including Windows Vista, Windows 7, Windows 8, and Windows 10. It also supports multiple Windows Server versions: Windows Server 2003, Windows Server 2003 R2, Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012.
  
<a name="settings"> </a>

## Cryptography and encryption settings

The following table lists the encryption algorithm settings you can use with Office versions that access CryptoAPI. This list includes Office versions up to and including Office 2016.
  
**Encryption algorithm settings for use with CryptoAPI**

|**Setting**|**Description**|
|:-----|:-----|
|**Encryption type for password-protected Office Open XML files** <br/> |You can specify an encryption type for Open XML files using the available cryptographic service providers (CSP) with this setting. If you're using a custom COM encryption add-in, you must apply this setting. Additionally, this setting is essential in two scenarios. First, if you're working with the 2007 Office system SP1 and wish to change the encryption algorithm from the default. Second, if you're using a version of the Compatibility Pack older than the Microsoft Office Compatibility Pack for Word, Excel, and PowerPoint File Formats and want to change the encryption algorithm.  <br/> |
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
|**Set parameters for CNG context** <br/> |Lets you specify the encryption parameters that should be used for the CNG context. To use this setting, a CNG context first has to be created by using CryptoAPI: Next Generation (CNG). For more information, see [CNG Cryptographic Configuration Functions](/windows/win32/seccng/cng-cryptographic-configuration-functions).  <br/> |
|**Specify CNG hash algorithm** <br/> |Lets you specify the hash algorithm that is used. The default is SHA1.  <br/> |
|**Set CNG password spin count** <br/> |Lets you specify the number of times to spin (rehash) the password verifier. The default is 100000.  <br/> |
|**Specify CNG random number generator algorithm** <br/> |Lets you configure the CNG random number generator to use. The default is RNG (Random Number Generator).  <br/> |
|**Specify CNG salt length** <br/> |Lets you specify the number of bytes of salt that should be used. Salt is extra input to the password and hash. The default is 16.  <br/> |
   
The following table lists more CNG settings that can be configured for Excel 2016, PowerPoint 2016, and Word 2016.
  
**Excel 2016, PowerPoint 2016, and Word 2016 specific CHG setting**

|**Setting**|**Description**|
|:-----|:-----|
|**Use new key on password change** <br/> |Lets you specify if a new encryption key should be used when the password is changed. The default isn't to use a new key on password changes.  <br/> |
   
You can use the setting that is listed in the following table to prevent users from adding passwords to documents. This setting prevents users from encrypting documents.
  
**Setting used to prevent users from password protecting a document**

|**Setting**|**Description**|
|:-----|:-----|
|**Disable password to open UI** <br/> |This setting controls whether Office 2016 users can add passwords to documents. By default users can add passwords.  <br/> |
   
<a name="compat"> </a>

## Compatibility with previous versions of Office

If you have to encrypt Office documents, we recommend that you save the documents as Open XML Format files (.docx, .xlsx, .pptx, and so on) instead of Office 97-2003 format (.doc, .xls, .ppt, and so on). The encryption that is used for binary documents (.doc, .xls, .ppt) uses RC4. It isn't recommended, as discussed in Security Considerations sections 4.3.2 and 4.3.3 of the [Office Document Cryptography Structure Specification](/openspecs/office_file_formats/ms-offcrypto/3c34d72a-1a61-4b52-a893-196f9157f083). Documents that are saved in the older Office binary formats can only be encrypted by using RC4 to maintain compatibility with older versions of Office. AES, the default and recommended encryption algorithm, is used to encrypt Open XML Format files.
  
Office 2016, Office 2013, Office 2010, and the 2007 Office system let you save documents as Open XML Format files. In addition, if you have Office 2003 you can use the Compatibility Pack to save documents as Open XML Format files.
  
Only Office 2016, Office 2007 SP2, and Office 2003 with the Office 2007 SP2 compatibility pack can read documents saved as Open XML Format files and encrypted using Office 2016. To ensure compatibility with all previous versions of Office, you can create a registry key (if it doesn't already exist) under **HKCU\Software\Microsoft\Office\16.0\\<application\>\Security\Crypto\\** called **CompatMode** and disable it by setting it to **0**. The values that you can enter for *\<application\>* represent the specific Office application that you're configuring this registry key for. For example, you can enter Access, Excel, PowerPoint, or Word. When you set **CompatMode** to **0**, Office 2016 uses an Office 2007 compatible encryption format, instead of the enhanced security that is provided by default when you use Office 2016 to encrypt Open XML Format files. If you have to configure this setting for compatibility reasons, we recommend that you also use a third-party encryption module that allows for enhanced security, such as AES encryption. 
  
If your organization uses the Microsoft Office Compatibility Pack for Word, Excel, and PowerPoint File Formats to encrypt Open XML Format files, you should review the following information:
  
- By default, on Windows Server 2003 and Windows Vista operating systems, the Compatibility Pack uses the **Microsoft Enhanced RSA and AES Cryptographic Provider,AES 128,128** setting to encrypt Open XML Format files. 
    
- Users aren't notified that the Compatibility Pack uses these encryption settings.
    
- The graphical user interface on earlier versions of Office might display incorrect encryption settings for Open XML Format files if the Compatibility Pack is installed.
    
- Users can't use the graphical user interface in earlier versions of Office to change the encryption settings for Open XML Format files.
    
## Related articles
[Remove or reset file passwords in Office 2016](remove-reset-file-passwords.md)

[Office Document Cryptography Structure Specification](/openspecs/office_file_formats/ms-offcrypto/3c34d72a-1a61-4b52-a893-196f9157f083)
