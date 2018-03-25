---
title: "Remove or reset file passwords in Office 2016"
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
ms.assetid: 6c4deec3-1f17-4958-b487-0c9194383907
description: "Explains how to use the Office DocRecrypt tool to unlock password protected OOXML formatted Word, Excel, and PowerPoint files."
---

# Remove or reset file passwords in Office 2016

 **Summary:** Explains how to use the Office 2016 DocRecrypt tool to unlock password protected OOXML formatted Word, Excel, and PowerPoint files. 
  
 **Audience:** IT Professionals 
  
Use Group Policy to push registry changes that associate a certificate with password-protected documents. This certificate information is embedded in the file header. Later, if the password is forgotten or lost, use the DocRecrypt command-line tool and the private key to unlock the file and, optionally, assign a new password.
  
|||
|:-----|:-----|
|![Are you a user?](../images/Iconforuser.jpg)           <br/> |If you want information about passwords in a personal copy of Office 2016, see [protect your documents with passwords and permissions](https://go.microsoft.com/fwlink/p/?LinkId=393748) instead.  <br/> See [remove a password from a document](https://go.microsoft.com/fwlink/p/?LinkId=393749) for an additional example.  <br/> |
|![Are you an admin?](../images/IconAdmin.jpg)           <br/> |If you are an IT Professional looking to remove or reset passwords in Office 2016 files within your organization, for example if an employee has left the organization and you do not know the password, you're at the right place, keep reading.  <br/> |
   
    
## Overview: removing or resetting a file password in Office 2016 using the DocRecrypt tool
<a name="BKMK_Overview"> </a>

There are many reasons why users may want or have to password protect a Word, Excel, or PowerPoint document. For example:
  
- Multiple people in an immediate organization want to work on a group budget, but don't want those numbers to be visible to the greater organization until they are finished.
    
- Consultants work with clients who require, through a service level agreement, that their sensitive data remain protected when it leaves client control.
    
- Teachers want to make sure tests that are created in Word cannot be compromised.
    
- Media professionals, and scientists who work on presentations to key researchers in their fields, want to make sure their breakthroughs do not leak to the public before their major announcements.
    
Previously, if the original creator of a file password either forgot the password or left the organization, the file was rendered unrecoverable. By using Office 2016 and an escrow key, which is generated from your company or organization's private key certificate store, an IT admin can "unlock" the file for a user and then either leave the file without password protection, or assign a new password to the file. You, the IT admin, are the keeper of the escrow key which is generated from your company or organization's private key certificate store. You can silently push the public key information to client computers one time through a registry key setting that you can manually create or you can create it through a Group Policy script. When a user later creates a password-protected Word, Excel, or PowerPoint file, this public key is included in the file header. Later, an IT pro can use the Office DocRecrypt tool to remove the password that is attached to the file, and then, optionally, protect the file by using a new password. To do this, the IT pro must have  *all*  the following: 
  
- The new Office DocRecrypt tool
    
- The Word, Excel, or PowerPoint file that has an embedded public key
    
- Permission and access to public and private keys that are associated with the certificate
    
### Keep the private key safe

This feature does not prescribe a corporate process for managing and distributing a private key, where that key is stored, any permissions and authorization that are required to request that a password be cracked or reset, or where the file should be located after it is restored. These decisions should be guided by your organization's standards and processes.
  
That said, to maintain a high level of security on password-protected files, we recommend that your organization adopt these policies:
  
- Never push the private key to a client computer! This is our most important recommendation.
    
- Lock the certificate store that has the private key and the certificate that was used to generate the escrow key and public keys.
    
- Make sure that no single individual can compromise public key infrastructure (PKI) services. Also, we recommend that you distribute certificate management roles across different people in your organization.
    
If you do not follow these recommendations consistently, the security of all new password-protected files can be compromised. Your company or organization should already have a well-defined Active Directory Certificate Services (AD CS) administration model and certification authority (CA) infrastructure strategy that includes, for example, off-site storage of the private key and certificates. For more information, see [Implement Role-Based Administration](https://technet.microsoft.com/en-us/library/cc732590). 
  
> [!NOTE]
> The certificate used for DocRecrypt can be a regular user certificate with User Authentication as the intended purpose. The main goal of the certificate is to be able to encrypt the document. 
  
### How is the correct certificate located?

Because many private key certificates may be located on an IT computer, it's fair to wonder how the correct certificate can be discovered. In Certificate Manager (certmgr.msc), the Office 2016 DocRecrypt tool first searches the Logical store, then the Current User store. In each of these stores, the tool first searches through the certificates that do not require a Windows System enforcement PIN. Then, it searches those that do require one.
  
### Special considerations

 **Open Office XML files only** The Office DocRecrypt tool only works on Office Open XML format documents such as docx, pptx, and xlsx files. 
  
 **Previously encrypted files** The Office DocRecrypt tool can't be used to recover files that were password-protected before you deployed the certificate and escrow key. However, after you've deployed the certificate and escrow key, if a user opens a previously protected file in Office 2016 and then saves it, the escrow key is added to the file at that time. From that point on, you'll be able to remove or reset the file's password using the Office DocRecrypt tool. 
  
 **Other ways to protect Word, Excel, and PowerPoint files** For other ways to protect Word, Excel, and PowerPoint files, see [Protect your document, workbook, or presentation with passwords, permission, and other restrictions](https://go.microsoft.com/fwlink/p/?LinkId=268111).
  
Be aware that users can independently apply any of these protection methods. If a password is removed by an IT admin, any other protection settings will remain. Removing the password does not affect these other settings. 
  
There are some factors that may affect your ability to remove the password on a file. For details and advice, see the following table.
  
**Considerations when removing the password on a file**

|**Issue**|**Advice**|
|:-----|:-----|
|File is marked as read-only or hidden.  <br/> |The Office DocRecrypt tool does not work on files that are marked as read-only or hidden. But, you can remove the setting, decrypt the file, and then set it back to Read-only or Hidden after the search.  <br/> |
|File is stored in multiple places.  <br/> |The Office DocRecrypt tool only removes password protection on the specific instance of the file that you reference. But, you should remove password-protection on files referenced on RAID or other hard disk configurations also.  <br/> |
|File is located in a shared workbook.  <br/> |The Office DocRecrypt tool does not work on co-authored files that contain embedded files.  <br/> |
|File is digitally signed.  <br/> |Removing the password protection from a digitally signed file doesn't compromise the validity of the digital signature.  <br/> |
|Filename begins with a hyphen ("-").  <br/> |If the name of the file that you want to search by using the Office DocRecrypt tool contains a hyphen, enclose the file name in quotation marks.  <br/> |
|Requestor doesn't have permissions to open the file.  <br/> |The IT admin determines whether the person who requests that a file be decrypted actually has the authority to view the contents of the file when the password is removed or reassigned. Similarly, if a password-protected file has an access control list associated with it, the decryption process removes the association. You must reinstate it afterward.  <br/> |
|File or destination location is read-only.  <br/> |Make sure that both the password-protected file and the destination location are read/write.  <br/> |
|Certificate was revoked or is expired.  <br/> |Your IT department must make sure that your private key certificates are valid and up-to-date. Also, be aware that the Office DocRecrypt tool does not check for private key certificate revocation status.  <br/> |
|Password-protected file is located in the cloud.  <br/> |The file must be copied to a hard disk or a read/write UNC share before it can be decrypted.  <br/> |
   
## Set up client computers for password protection removal
<a name="BKMK_SetUpClientComputers"> </a>

To enable your IT department to remove a password from a password-protected Word, PowerPoint, or Excel file, when you deploy Office 2016 to your organization, you must first push the certificate public keys and do some registry work on the client computers. There are two ways to achieve this: 
  
- Through a Group Policy Administrative template, which is the best choice for multiple or enterprise client computers, or
    
- By manually changing a client computer's registry, which is the best choice for a single computer or a few client computers.
    
### To set up multiple client computers for password protection by using a group policy object

1. Download the Group Policy Administrative template (ADMX/ADML), which is available in the [Office 2016 Administrative Template files (ADMX/ADML) and Office Customization Tool](https://go.microsoft.com/fwlink/p/?LinkID=626001)
    
2. Open the template in the Local Group Policy Editor and navigate to the escrow key settings. Open the **User Configuration** branch, then choose **Administrative Templates**, **Microsoft Office 2016**, **Security Settings**, and then **Escrow Certificates**. 
    
    20 escrow keys are available to configure, each named Escrow Key #n.
    
3. Select an escrow key, and then from the shortcut menu (right-click), choose **Edit** to configure an escrow key. 
    
    The **Escrow Key #n** dialog appears. 
    
4. To set up and enable this key, select the **Enabled** button. If you want to disable this key later, return to **Escrow Key #n** dialog box and select the **Disabled** button. 
    
5. In the **Certificate Hash** box, enter the certificate hash that is used as the certificate unique identifier, also known as a "thumbprint." For example, if your certificate thumbprint is 9131517191121d94d143117fc126213c1781d21c, set the certificate hash value to that number. This hash can include spaces if you want to make it more readable. 
    
6. Enter a comment to provide more details about this particular certificate, if it is necessary. This is optional.
    
7. Choose **OK**. 
    
### To set up a single client computer for password protection with new registry settings

To be able to remove a password from a Word, PowerPoint, or Excel file, you must create a registry key to indicate the public key certificates that you want to make available for password protecting files.
  
> [!NOTE]
> For specific directions about how to create a registry key, refer to the Help that is available from the Registry Editor (regedit.exe) Help menu. 
  
1. In Registry Editor, create a key in the client computer registry in the following registry path:
    
    Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0 \common\Security\Crypto\EscrowCerts
    
    Create this new key either manually or through a .reg batch file. To create a .reg file by using regedit.exe, see [Creating a .reg File](https://go.microsoft.com/fwlink/p/?LinkId=268116).
    
   **Create a key in the client computer registry**

|****Registry element****|****Description****|
|:-----|:-----|
|Key Name  <br/> |This must be EscrowCerts.  <br/> |
|Data Type  <br/> |key  <br/> |
|Parent  <br/> |Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\ common\Security\Crypto\  <br/> |
   
2. In the new key that you created in step 1, add public key certificate information as shown in the following table. Create one entry for each public key certificate that you want to make available for password protecting files.
    
   **Add public key certificate information**

|****Registry element****|****Description****|
|:-----|:-----|
|Key Name  <br/> |Unique user-defined name that describes the public key certificate. For example, EscrowCert01, EscrowCert02, and so on.  <br/> |
|Type  <br/> |STRING  <br/> |
|Value  <br/> |The hash that is used as the certificate unique identifier, also known as a "thumbprint" in the **Windows Certificate** dialog box. For example, if your certificate thumbprint is 9131517191121d94d143117fc126213c1781d21c, set this value to that number. This hash can include spaces if you want to make it more readable.  <br/> |
   
3. When the registry entries are in place, push the certificate to the client computer. The public key certificate should be stored in Windows Certificate Manager (certmgr.msc) in the Certificates - Current User or Logical, Personal store. For details about pushing public key certificates to client computers through Group Policy, see [Distribute Certificates to Client Computers by Using Group Policy](https://go.microsoft.com/fwlink/p/?LinkId=268118).
    
    > [!IMPORTANT]
    > The IT admin must make sure that the certificate that was used for this process is valid and has not expired. 
  
When users decide to password protect the files that they create in Office 2016 Word, PowerPoint, or Excel, the appropriate public key information is saved in the file header. The administrator can use this public key and matching private key later if asked to remove the password protection.
  
## Set up the IT admin computer that has the key and DocRecrypt tool
<a name="BKMK_SetUpTheITAdminComputer"> </a>

The IT admin computer does not have to have key and subkey in the registry, nor does it have to have a copy of the public key certificate. But, the IT admin computer does need the following:
  
- The matching private key/certificate pair
    
- The Office DocRecrypt tool
    
### To set up the IT computer that has the key and DocRecrypt tool

1. Use the Certificate Import Wizard to import the matching private key to the certificate in the Windows Certificate Manager.
    
2. Download and install the Office DocRecrypt tool. This tool is available in the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626081). 
    
    When you install the Office DocRecrypt tool on a 64-bit computer, it is installed in the following location:
    
  - %programfiles(x86)%\Microsoft Office\DOCRECRYPT
    
    When you install the Office DocRecrypt tool on a 32-bit computer, it is installed in the following location:
    
  - %programfiles%\Microsoft Office\DOCRECRYPT
    
That's it. All the pieces are in place and you are ready to remove the password on a Word, Excel, or PowerPoint file the next time that a user asks you to do it.
  
## Use the Office DocRecrypt tool
<a name="BKMK_UsetheDocRecryptTool"> </a>

Use the DocRecrypt tool, which is now installed on the IT admin computer, to remove the file password and assign a new password. 
  
### To use the DocRecrypt tool

Follow these instructions to use the DocRecrypt tool from the command line. You can also run DocRecrypt commands silently from a batch file or script.
  
- Navigate to and open the Office DocRecrypt tool command line by using the following syntax:
    
     `DocRecrypt [-p <new_password>] -i <inputfile_or_folder> [-o <outputfile_or_folder>] [-q]`
    
    The DocRecrypt tool options are described in the following table.
    
   **DocRecrypt tool options**

|**Parameter**|**Description**|
|:-----|:-----|
|-p \<new_password\>  <br/> |(Optional) This is the new password that will be assigned to the input file, or the output file if an output file name is supplied.  <br/> |
|-i \<inputfile_or_folder\>  <br/> |This is the file or folder that contains files that are locked because the password is unknown. If you specify a folder, the Office DocRecrypt tool will ignore any files that are not Office Open XML format.  <br/> |
|-o \<outputfile_or_folder\>  <br/> |(Optional) This is the name of a new output file or folder for files that will be created from the input files. Again, any files that are not Office Open XML format are ignored.  <br/> |
|-q  <br/> |(Optional) Indicates that you want to run the Office DocRecrypt tool in quiet mode, usually in a script. Quiet mode does not show a UI and it fails if a certificate requires the IT admin to enter a PIN. If your certificate requires a PIN, do not use quiet mode.  <br/> |
   
    For example:
    
    To remove the password from a file, use this code:
    
     `DocRecrypt -i lockedfile`
    
    To remove the password and assign a new password of 12345, use this code:
    
     `DocRecrypt -p 12345 -i lockedfile`
    
    To remove the password, create a new file, and assign a new password of 12345 to that file, use this code:
    
     `DocRecrypt -p 12345 -i lockedfile -o newfile`
    
Once files are password protected using Office 2016, will not remove the passwords.
  
### Office 2010 and 2007 files
<a name="BK_officeEarly"> </a>

Once the client computers in your organization have been configured by using the Office DocRecrypt tool (either individually or through Group Policy), any future Word 2016, Excel 2016, or PowerPoint 2016 files (docx, xlsx and pptx files) and any existing password protected Office Word 2007, Word 2010, Office Excel 2007, Excel 2010, Office PowerPoint 2007 or PowerPoint 2010 files that the users edit in Office 2016 can be unlocked or the password reset with the DocRecrypt tool. Once an escrow key is added to a password protected file, it can be unlocked or reset even if it's been edited in Office 2007 or Office 2010.
  

