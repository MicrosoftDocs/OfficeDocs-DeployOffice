---
title: "Remove or reset file passwords in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.collection: Tier2
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
description: "Explains how to use the Office DocRecrypt tool to unlock password protected OOXML formatted Word, Excel, and PowerPoint files."
ms.date: 04/19/2024
---

# Remove or reset file passwords in Office 2016

 **Summary:** Explains how to use the Office 2016 DocRecrypt tool to unlock password protected OOXML formatted Word, Excel, and PowerPoint files. 
  
  
Use Group Policy to push registry changes that associate a certificate with password-protected documents. This certificate information is embedded in the file header. Later, if the password is forgotten or lost, use the DocRecrypt command-line tool and the private key to unlock the file and, optionally, assign a new password.

> [!NOTE]
> - If you want information about passwords in a personal copy of Office 2016, see [Protect a document with a password](https://support.microsoft.com/topic/05084cc3-300d-4c1a-8416-38d3e37d6826) or [Protect an Excel file](https://support.microsoft.com/office/7359d4ae-7213-4ac2-b058-f75e9311b599). 
> - If you are an IT Professional looking to remove or reset passwords in Office 2016 files within your organization, for example if an employee has left the organization and you do not know the password, you're at the right place, so keep reading. |
   
    
<a name="BKMK_Overview"> </a>

## Overview: removing or resetting a file password in Office 2016 using the DocRecrypt tool

There are many reasons why users might want or have to password protect a Word, Excel, or PowerPoint document. For example:
  
- Multiple people in an immediate organization want to work on a group budget, but don't want those numbers to be visible to the greater organization until they're finished.
    
- Consultants work with clients who require, through a service level agreement, that their sensitive data remain protected when it leaves client control.
    
- Teachers want to make sure tests that are created in Word can't be compromised.
    
- Media professionals, and scientists who work on presentations to key researchers in their fields, want to make sure their breakthroughs don't leak to the public before their major announcements.
    
Previously, if the original creator of a file password either forgot the password or left the organization, the file was rendered unrecoverable. An IT admin can unlock a file for a user with Office 2016 and an escrow key. This key comes from your company or organization's private key certificate store. After unlocking, the admin can either remove the password protection or set a new password for the file. You, the IT admin, are the keeper of the escrow key, which is generated from your company or organization's private key certificate store. You can silently push the public key information to client computers one time through a registry key setting that you can manually create or you can create it through a Group Policy script. When a user later creates a password-protected Word, Excel, or PowerPoint file, this public key is included in the file header. Later, an IT pro can use the Office DocRecrypt tool to remove the password that is attached to the file, and then, optionally, protect the file by using a new password. The IT pro must have  *all*  the following to remove the password: 
  
- The new Office DocRecrypt tool
    
- The Word, Excel, or PowerPoint file that has an embedded public key
    
- Permission and access to public and private keys that are associated with the certificate
    
### Keep the private key safe

This feature doesn't control the corporate process for handling and distributing a private key. It also doesn't define where to store the key, the required permissions for password reset requests, or the file's location after restoration. Your organization's standards and processes should guide these decisions
  
To maintain a high level of security on password-protected files, adopting these policies is recommended:
  
- Never push the private key to a client computer! This recommendation is the most important.
    
- Lock the certificate store that has the private key and the certificate that was used to generate the escrow key and public keys.
    
- Make sure that no single individual can compromise public key infrastructure (PKI) services. Also, we recommend that you distribute certificate management roles across different people in your organization.
    
If you don't follow these recommendations consistently, the security of all new password-protected files can be compromised. Your company or organization should already have a well-defined Active Directory Certificate Services (AD CS) administration model and certification authority (CA) infrastructure strategy that includes, for example, off-site storage of the private key and certificates. For more information, see [Implement Role-Based Administration](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc732590(v=ws.11)). 
  
> [!NOTE]
> The certificate used for DocRecrypt can be a regular user certificate with User Authentication as the intended purpose. The main goal of the certificate is to be able to encrypt the document. 
  
### How is the correct certificate located?

Because many private key certificates might be located on an IT computer, it's fair to wonder how the correct certificate can be discovered. In Certificate Manager (certmgr.msc), the Office 2016 DocRecrypt tool first searches the Logical store, then the Current User store. In each of these stores, the tool first searches through the certificates that don't require a Windows System enforcement PIN. Then, it searches the certificates that do require one.
  
### Special considerations

 **Open Office XML files only** The Office DocRecrypt tool only works on Office Open XML format documents such as docx, pptx, and xlsx files. 
  
 **Previously encrypted files** The Office DocRecrypt tool can't be used to recover files that were password-protected before you deployed the certificate and escrow key. After you deploy the certificate and escrow key, a user can open a previously protected Office 2016 file and save it. This action adds the escrow key to the file. From that point on, you're able to remove or reset the file's password using the Office DocRecrypt tool. 
  
 **Other ways to protect Word, Excel, and PowerPoint files** For other ways to protect Word, Excel, and PowerPoint files, see [Add or remove protection in your document, workbook, or presentation](https://go.microsoft.com/fwlink/p/?LinkId=268111).
  
Users can independently apply any of these protection methods. If an IT admin removes a password, all other protection settings remain in place. Removing the password doesn't affect these other settings. 
  
There are some factors that might affect your ability to remove the password on a file. For details and advice, see the following table.
  
**Considerations when removing the password on a file**

|**Issue**|**Advice**|
|:-----|:-----|
|File is marked as read-only or hidden.  <br/> |The Office DocRecrypt tool doesn't work on files that are marked as read-only or hidden. But, you can remove the setting, decrypt the file, and then set it back to Read-only or Hidden after the search.  <br/> |
|File is stored in multiple places.  <br/> |The Office DocRecrypt tool only removes password protection on the specific instance of the file that you reference. But, you should remove password-protection on files referenced on RAID or other hard disk configurations also.  <br/> |
|File is located in a shared workbook.  <br/> |The Office DocRecrypt tool doesn't work on co-authored files that contain embedded files.  <br/> |
|File is digitally signed.  <br/> |Removing the password protection from a digitally signed file doesn't compromise the validity of the digital signature.  <br/> |
|Filename begins with a hyphen ("-").  <br/> |If the name of the file that you want to search by using the Office DocRecrypt tool contains a hyphen, enclose the file name in quotation marks.  <br/> |
|Requestor doesn't have permissions to open the file.  <br/> |The IT admin checks if the person asking to decrypt a file has the right to access its contents once the password is removed or changed. Similarly, if a password-protected file has an access control list associated with it, the decryption process removes the association. You must reinstate it afterward.  <br/> |
|File or destination location is read-only.  <br/> |Make sure that both the password-protected file and the destination location are read/write.  <br/> |
|Certificate was revoked or is expired.  <br/> |Your IT department must make sure that your private key certificates are valid and up-to-date. Also, the Office DocRecrypt tool doesn't check for private key certificate revocation status.  <br/> |
|Password-protected file is located in the cloud.  <br/> |The file must be copied to a hard disk or a read/write UNC share before it can be decrypted.  <br/> |
   
<a name="BKMK_SetUpClientComputers"> </a>

## Set up client computers for password protection removal

To enable your IT department to remove a password from a password-protected Word, PowerPoint, or Excel file, when you deploy Office 2016 to your organization, you must first push the certificate public keys and do some registry work on the client computers. There are two ways to achieve this:
  
- Through a Group Policy Administrative template, which is the best choice for multiple or enterprise client computers, or
    
- By manually changing a client computer's registry, which is the best choice for a single computer or a few client computers.
    
### To set up multiple client computers for password protection by using a group policy object

1. Download the Group Policy Administrative template (ADMX/ADML) files from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626001).
    
2. Open the template in the Local Group Policy Editor and navigate to the escrow key settings. Open the **User Configuration** branch, then choose **Administrative Templates**, **Microsoft Office 2016**, **Security Settings**, and then **Escrow Certificates**. 
    
    20 escrow keys are available to configure, each named Escrow Key #n.
    
3. Select an escrow key, and then from the shortcut menu (right-click), choose **Edit** to configure an escrow key. 
    
    The **Escrow Key #n** dialog appears. 
    
4. To set up and enable this key, select the **Enabled** button. If you want to disable this key later, return to **Escrow Key #n** dialog box and select the **Disabled** button. 
    
5. In the **Certificate Hash** box, enter the certificate hash that is used as the certificate unique identifier, also known as a "thumbprint." For example, if your certificate thumbprint is 9131517191121d94d143117fc126213c1781d21c, set the certificate hash value to that number. This hash can include spaces if you want to make it more readable. 
    
6. Enter a comment to provide more details about this particular certificate, if it's necessary. This is optional.
    
7. Choose **OK**. 
    
### To set up a single client computer for password protection with new registry settings

To be able to remove a password from a Word, PowerPoint, or Excel file, you must create a registry key to indicate the public key certificates that you want to make available for password protecting files.
  
> [!NOTE]
> For specific directions about how to create a registry key, refer to the Help that is available from the Registry Editor (regedit.exe) Help menu. 
  
- In Registry Editor, create a key in the client computer registry in the following registry path:
    
    Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0 \common\Security\Crypto\EscrowCerts
    
    Create this new key either manually or through a .reg batch file. To create a .reg file by using regedit.exe, see [Creating a .reg File](/previous-versions/windows/it-pro/windows-server-2003/dd379001(v=ws.10)).
    
   **Create a key in the client computer registry**

|**Registry element**|**Description**|
|:-----|:-----|
|Key Name  <br/> |This must be EscrowCerts.  <br/> |
|Data Type  <br/> |key  <br/> |
|Parent  <br/> |Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\ common\Security\Crypto\  <br/> |
   
- In the new key that you created in step 1, add public key certificate information as shown in the following table. Create one entry for each public key certificate that you want to make available for password protecting files.
    
   **Add public key certificate information**

|**Registry element**|**Description**|
|:-----|:-----|
|Key Name  <br/> |Unique user-defined name that describes the public key certificate. For example, EscrowCert01, EscrowCert02, and so on.  <br/> |
|Type  <br/> |STRING  <br/> |
|Value  <br/> |The hash that is used as the certificate unique identifier, also known as a "thumbprint" in the **Windows Certificate** dialog box. For example, if your certificate thumbprint is 9131517191121d94d143117fc126213c1781d21c, set this value to that number. This hash can include spaces if you want to make it more readable.  <br/> |
   
- When the registry entries are in place, push the certificate to the client computer. The public key certificate should be stored in Windows Certificate Manager (certmgr.msc) in the Certificates - Current User or Logical, Personal store. For details about pushing public key certificates to client computers through Group Policy, see [Distribute Certificates to Client Computers by Using Group Policy](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd807084(v=ws.10)).
    
    > [!IMPORTANT]
    > The IT admin must make sure that the certificate that was used for this process is valid and has not expired. 
  
When users decide to password protect the files that they create in Office 2016 Word, PowerPoint, or Excel, the appropriate public key information is saved in the file header. The administrator can use this public key and matching private key later if asked to remove the password protection.
  
<a name="BKMK_SetUpTheITAdminComputer"> </a>

## Set up the IT admin computer that has the key and DocRecrypt tool

The IT admin computer doesn't have to have key and subkey in the registry, nor does it have to have a copy of the public key certificate. But, the IT admin computer does need the following:
  
- The matching private key/certificate pair
    
- The Office DocRecrypt tool
    
### To set up the IT computer that has the key and DocRecrypt tool

1. Use the Certificate Import Wizard to import the matching private key to the certificate in the Windows Certificate Manager.
    
2. Download and install the Office DocRecrypt tool. This tool is available in the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626081). 
    
- When you install the Office DocRecrypt tool on a 64-bit computer, it's installed in the following location:
    
   - %programfiles(x86)%\Microsoft Office\DOCRECRYPT
    
- When you install the Office DocRecrypt tool on a 32-bit computer, it's installed in the following location:
    
   - %programfiles%\Microsoft Office\DOCRECRYPT
    
That's it. All the pieces are in place and you're ready to remove the password on a Word, Excel, or PowerPoint file the next time that a user asks you to do it.
  
<a name="BKMK_UsetheDocRecryptTool"> </a>

## Use the Office DocRecrypt tool

Use the DocRecrypt tool, which is now installed on the IT admin computer, to remove the file password and assign a new password. 
  
### To use the DocRecrypt tool

Follow these instructions to use the DocRecrypt tool from the command line. You can also run DocRecrypt commands silently from a batch file or script.
  
- Navigate to and open the Office DocRecrypt tool command line by using the following syntax:
    
     DocRecrypt [-p <new_password>] -i <inputfile_or_folder> [-o <outputfile_or_folder>] [-q]
    
    The DocRecrypt tool options are described in the following table.
    
   **DocRecrypt tool options**

|**Parameter**|**Description**|
|:-----|:-----|
|-p \<new_password\>  <br/> |(Optional) This is the new password that is assigned to the input file, or the output file if an output file name is supplied.  <br/> |
|-i \<inputfile_or_folder\>  <br/> |This is the file or folder that contains files that are locked because the password is unknown. If you specify a folder, the Office DocRecrypt tool ignores any files that aren't Office Open XML format.  <br/> |
|-o \<outputfile_or_folder\>  <br/> |(Optional) This is the name of a new output file or folder for files that will be created from the input files. Again, any files that aren't Office Open XML format are ignored.  <br/> |
|-q  <br/> |(Optional) Indicates that you want to run the Office DocRecrypt tool in quiet mode, usually in a script. Quiet mode doesn't show a UI and it fails if a certificate requires the IT admin to enter a PIN. If your certificate requires a PIN, don't use quiet mode.  <br/> |
   
For example:
  
To remove the password from a file, use this code:
    
 DocRecrypt -i lockedfile
    
To remove the password and assign a new password of 12345, use this code:
    
 DocRecrypt -p 12345 -i lockedfile
    
To remove the password, create a new file, and assign a new password of 12345 to that file, use this code:
    
 DocRecrypt -p 12345 -i lockedfile -o newfile
    
Once files are password protected using Office 2016, won't remove the passwords.
  
<a name="BK_officeEarly"> </a>

### Office 2010 and 2007 files

Once the client computers in your organization have been configured by using the Office DocRecrypt tool (either individually or through Group Policy), any future Word 2016, Excel 2016, or PowerPoint 2016 files (docx, xlsx and pptx files) and any existing password protected Office Word 2007, Word 2010, Office Excel 2007, Excel 2010, Office PowerPoint 2007 or PowerPoint 2010 files that the users edit in Office 2016 can be unlocked or the password reset with the DocRecrypt tool. Once an escrow key is added to a password protected file, it can be unlocked or reset even if it's been edited in Office 2007 or Office 2010.
