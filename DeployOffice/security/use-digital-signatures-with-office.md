---
title: "Use digital signatures with Office 2016"
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
ms.assetid: a7154bc5-17cf-4da3-8b2e-21f4dc3475d3
description: "Explains how to support XML Advanced Electronic Signatures (XAdES) in Excel, PowerPoint, and Word documents as well as how to choose the appropriate certificates for your deployment."
---

# Use digital signatures with Office 2016

 **Summary:** Explains how to support XML Advanced Electronic Signatures (XAdES) in Excel, PowerPoint, and Word documents as well as how to choose the appropriate certificates for your deployment. 
  
  
Users digitally sign an Excel, PowerPoint, or Word document for many of the same reasons that they might place a handwritten signature on a paper document. A digital signature is used to help authenticate the identity of the creator of digital information, such as documents, email messages, and macros, by using cryptographic algorithms. 
  
Digital signatures are based on digital certificates. Digital certificates are verifiers of identity that are issued by a trusted third party, which is known as a certification authority (CA). This works similarly to the use of printed identity documents. For example, a trusted third party, such as a government entity or employer, issues identity documents such as driver licenses, passports, and employee ID cards. Other people rely on those documents to verify that a person is who he or she claims to be. 
  
This article includes digital signature registry keys that are new to Office 2016.
  
> [!TIP]
> **Are you looking for help with digital signature settings in Office 2016 on your desktop?** You may be looking for one of these articles, which will help you secure Office 2016 on your desktop: [Digital signatures and certificates](https://go.microsoft.com/fwlink/p/?LinkId=267578), [Add or remove a digital signature in Office files](https://go.microsoft.com/fwlink/p/?LinkId=267579), and [Get a digital ID](https://go.microsoft.com/fwlink/p/?LinkId=267580).
  
<a name="intro"> </a>
    
## Introduction to digital signatures and how they are used in Office

Digital signatures help establish the following authentication measures:
  
- **Authenticity** The digital signature and its underlying digital certificate helps make sure that the signer is the person he or she claims to be. This helps prevent other people from pretending to be the originator of a particular document, the equivalent of forgery on a printed document. 
    
- **Integrity** The digital signature helps make sure that the content has not been changed or tampered with since it was digitally signed. This helps prevent documents from being intercepted and changed without the document originator's knowledge. 
    
- **Non-repudiation** The digital signature helps prove to all parties the origin of the signed content. "Repudiation" refers to a signer's denial of any association with signed content. The digital signature helps prove that the originator of the document is the true originator and not someone else, regardless of the claims of the signer. A signer cannot repudiate the signature on that document without repudiating his or her digital key and, therefore, other documents signed by using that key. 
    
### Requirements for digital signatures in Office 2016

To establish these conditions, the content creator must digitally sign the content by creating a signature that satisfies the following criteria:
  
- The digital signature is valid. A CA that is trusted by the operating system must sign the digital certificate on which the digital signature is based.
    
- The certificate that is associated with the digital signature is not expired or contains a time stamp that indicates the certificate was valid at the time of signing.
    
- The certificate that is associated with the digital signature is not revoked.
    
- The signing person or organization (known as the publisher) is trusted by the recipient.
    
Word 2016, Excel 2016, and PowerPoint 2016 detect these criteria and warn the user if there is a problem with the digital signature. Information about problematic certificates can easily be viewed in a certificate task pane that appears in the Office 2016 application. Office 2016 applications let you add multiple digital signatures to the same document.
  
### Digital signatures in the Office 2016 business environment

The following scenario shows how you can use digital signatures on documents in a business environment:
  
1. An employee uses Excel 2016 to create an expense report. The employee then creates three signature lines: one for herself, one for her manager, and one for the accounting department. The signatures serve to:
    
  - identify that the employee is the originator of the document
    
  - indicate that no changes will occur in the document as it moves to the manager and the accounting department
    
  - demonstrate that there is proof that both the manager and the accounting department have received and reviewed the document
    
2. The manager receives the document and adds her digital signature to the document, confirming that she has reviewed and approved it. She then forwards it to the accounting department for payment.
    
3. A representative in the accounting department receives the document and signs it, which confirms receipt of the document.
    
This example demonstrates the ability to add multiple signatures to a single Office 2016 document. In addition to the digital signature, the signer of the document can add a graphic of her actual signature, or use a Tablet PC to actually write a signature into the signature line in the document.
  

<a name="compatissues"> </a>

### Compatibility issues with Office documents prior to Office 2016


Office 2016, just as Office 2013, Office 2010 and Office 2007, uses the XML-DSig format for digital signatures. In addition, Office 2016 has support for XAdES (XML Advanced Electronic Signatures). XAdES is a set of tiered extensions to XML-DSig, the levels of which build upon the previous levels to provide more reliable digital signatures. For more information about the levels of XAdES that are supported in Office 2016, see [Planning digital signature levels in Office 2016 documents](use-digital-signatures-with-office.md#planlevels) later in this article. For more information about the details of XAdES, see the specification for [XML Advanced Electronic Signatures (XAdES)](https://go.microsoft.com/fwlink/p/?LinkId=186631).
  
It is important to be aware that digital signatures that are created in Office 2016 are incompatible with versions of Office that are earlier than the 2007 Office system. For example, if a document is signed by using an application in Office 2016, Office 2013, Office 2010, or Office 2007, and then opened by using an application in Office, 2003 that has the Office Compatibility Pack installed, the user is informed that the document was signed in a newer version of Office and that the digital signature is lost.
  
The following figure shows the warning that the user sees after opening a document in a version of Office that is earlier than Office 2007.
  
**Digital signature warning for documents originally signed in Office 2003 or earlier versions.**

![Figure 1 Compatibility Issues](../images/CompatibilityIssues.jpg)
  
Also, if you use XAdES for a digital signature in Office 2016, the digital signature will not be compatible with Office 2010 or 2007 Office system unless you configure the Group Policy setting, **Do not include XAdES reference object in the manifest**, and set it to **Enabled**. For more information about the digital signature Group Policy settings, see [Plan signature settings for Office 2016](use-digital-signatures-with-office.md#configsigs) later in this article. 
  
If you want digital signatures that you create in Office 2016 to be compatible with Office 2003 and earlier versions, you can configure the Group Policy setting, **Legacy format signatures**, and set it to **Enabled**. This Group Policy setting is located under **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Signing**. After you change this setting to **Enabled**, the Office 2016 applications use the Office 2003 binary format to apply digital signatures to Office 97-2003 binary documents that you created in Office 2016. 
  
<a name="choosetypes"> </a>

## Choosing digital certificate types for Office 2016

Digital certificates can be either self-signed or issued by CAs in an organization, such as a Windows Server 2012 or Windows Server 2008 computer that is running Active Directory Certificate Services, or a public CA, such as VeriSign or Thawte. Self-signed certificates are typically used by people and small businesses that do not want to set up a public key infrastructure (PKI) for their organizations and do not want to purchase a commercial certificate.
  
The primary drawback of using self-signed certificates is that they are only useful if you exchange documents with those who know you personally and are confident that you are the actual originator of the document. By using self-signed certificates, there is no third party that validates the authenticity of your certificate. Each person who receives your signed document must manually decide whether to trust your certificate. 
  
For larger organizations, two primary methods for obtaining digital certificates are available: certificates that are created by using an organization or corporation PKI and commercial certificates. Organizations that want to share signed documents only among other employees in the organization might prefer a corporate PKI to reduce costs. Organizations that want to share signed documents with people outside their organization might prefer to use commercial certificates.
  
### Certificates that are created by using an organization or corporation PKI

Organizations have the option to create their own PKI. In this scenario, the company sets up one or more certification authorities (CAs) that can create digital certificates for computers and users throughout the company. When combined with Active Directory Directory Services (AD DS), a company can create a complete PKI solution so that all organization or corporate-managed computers have the organization or corporate CA chain installed and that both users and computers are automatically assigned digital certificates for document signing and encryption. This allows for all employees in a company to automatically trust digital certificates (and, therefore, valid digital signatures) from other employees in the same company.
  
  
### Commercial certificates

You can purchase commercial certificates from a company whose line of business is to sell digital certificates. The main advantage of using commercial certificates is that the commercial certificate vendor's root CA certificate is automatically installed on the organization's Windows operating systems. This enables these computers to automatically trust the CAs. Unlike the organization or corporate PKI solution, commercial certificates enable you to share your signed documents with users who do not belong to your organization. 
  
There are three kinds of commercial certificates:
  
- **Class 1** Class 1 certificates are issued to people who have valid email addresses. Class 1 certificates are appropriate for digital signatures, encryption, and electronic access control for non-commercial transactions where proof of identity is not required. 
    
- **Class 2** Class 2 certificates are issued to people and devices. Class 2 individual certificates are appropriate for digital signatures, encryption, and electronic access control in transactions where proof of identity that is based on information in the validating database is sufficient. Class 2 device certificates are appropriate for device authentication; message, software, and content integrity; and confidentiality encryption. 
    
- **Class 3** Class 3 certificates are issued to people, organizations, servers, devices, and administrators for CAs and root authorities (RAs). Class 3 individual certificates are appropriate for digital signatures, encryption, and access control in transactions where proof of identity must be assured. Class 3 server certificates are appropriate for server authentication; message, software, and content integrity; and confidentiality encryption. 
    
For more information about commercial certificates, see [Find digital ID or digital signature services](https://go.microsoft.com/fwlink/p/?LinkId=267581).
  

<a name="planlevels"> </a>

## Planning digital signature levels in Office 2016 documents

Users can digitally sign documents by using Excel 2016, PowerPoint 2016, and Word 2016. They can also use Excel 2016, InfoPath 2016, or Word 2016 to add a signature line or signature stamp. Digitally signing a document that has a digital certificate but does not have a signature line or stamp is known as creating an invisible digital signature. Visible and invisible digital signatures both use a digital certificate for signing the document. The difference is the graphical representation in the document when a visible digital signature line is used. For more information about how to add a digital signature, see [Add or remove a digital signature in Office files](https://go.microsoft.com/fwlink/p/?LinkId=187659).
  
By default, Office 2016 creates XAdES-EPES digital signatures, when either a self-signed certificate or a certificate signed by a CA is used during the creation of the digital signature. 
  
The XAdES digital signature levels, which are based on the XML-DSig digital signature standard and available in Office 2016, are listed in the following table. Each of the levels builds upon the previous level and contains all the capabilities of the previous levels. For example, XAdES-X also contains all of the capabilities of XAdES-EPES, XAdES-T, and XAdES-C, in addition to the new functionality that is introduced in XAdES-X.
  
**XAdES digital signature levels in Office 2016**

|**Signature level**|**Description**|
|:-----|:-----|
|XAdES-EPES (Base)  <br/> |Adds information about the signing certificate to the XML-DSig signature. This is the default for Office 2016 signatures.  <br/> |
|XAdES-T (Timestamp)  <br/> |Adds a time stamp to the XML-DSig and XAdES-EPES sections of the signature, which helps protect against certificate expiration.  <br/> |
|XAdES-C (Complete)  <br/> |Adds references to certification chain and revocation status information.  <br/> |
|XAdES-X (Extended)  <br/> |Adds a time stamp to the XML-DSig SignatureValue element, and the -T and -C sections of the signature. The additional time stamp protects the additional data from repudiation.  <br/> |
|XAdES-X-L (Extended Long Term)  <br/> |Stores the actual certificate and certificate revocation information in addition to the signature. This allows for certificate validation even if the certificate servers are no longer available.  <br/> |
   
### Planning for time stamped digital signatures in Office 2016

When users add a time stamp to a digital signature, they help to extend the lifespan of that digital signature. For example, if a revoked certificate has previously been used to create a digital signature, the digital signature contains a time stamp from a trusted time stamp server, and the time stamp occurred before the revocation of the certificate, the digital signature can still be considered valid. To use the time stamp functionality with digital signatures, you must complete the following tasks:
  
- Set up a time stamp server that is compliant with RFC 3161
    
- Use the Group Policy setting, **Specify server name**, to enter the location of the time stamp server on the network.
    
You can also configure additional time stamp parameters by configuring one or more of the following Group Policy settings:
  
- **Configure time stamping hashing algorithm**
    
- **Set time stamp server time-out**
    
If you do not configure and enable **Configure time stamping hashing algorithm**, the default value of SHA1 will be used. If you do not configure and enable **Set time stamp server time-out**, Office 2016 will wait 5 seconds for the time stamp server to respond to a request.
  

<a name="configsigs"> </a>

### Plan signature settings for Office 2016

In addition to the Group Policy settings for configuring time stamp related-settings, there are other Group Policy settings to configure how digital signatures are configured and controlled in an organization. The setting names and descriptions are listed in the following table.
  
**Digital signature Group Policy configuration settings**

|**Group Policy Setting**|**Description**|
|:-----|:-----|
|**Require OCSP at signature generation time** <br/> |This policy setting lets you determine whether Office 2016 requires OCSP (Online Certificate Status Protocol) revocation data for all digital certificates in a chain when digital signatures are generated.  <br/> |
|**Specify minimum XAdES level for digital signature generation** <br/> |This policy setting lets you specify a minimum XAdES level that Office 2016 applications must reach in order to create an XAdES digital signature. If the Office 2016 applications are unable to reach the minimum XAdES level, the Office application does not create the signature.  <br/> |
|**Check the XAdES portions of a digital signature** <br/> |This policy setting lets you specify whether Office 2016 checks the XAdES portions of a digital signature when validating a digital signature for a document.  <br/> |
|**Do not allow expired certificates when validating signatures** <br/> |This policy setting lets you configure whether Office 2016 applications accept expired digital certificates when verifying digital signatures.  <br/> |
|**Do not include XAdES reference object in the manifest** <br/> |This policy setting lets you determine whether an XAdES reference object will appear in the manifest. You must configure this setting to **Enabled** if you want the 2007 Office system to be able to read Office 2016 signatures that contain XAdES content. Otherwise, the 2007 Office system will consider signatures that contain XAdES content invalid.  <br/> |
|**Select digital signature hashing algorithm** <br/> |This policy setting lets you configure the hashing algorithm that Office 2016 applications use to confirm digital signatures.  <br/> |
|**Set signature verification level** <br/> |This policy setting lets you set the verification level that is used by Office 2016 applications when validating a digital signature.  <br/> |
|**Requested XAdES level for signature generation** <br/> |This policy setting lets you specify a requested or desired XAdES level in creating a digital signature.  <br/> |
   
The following additional Group Policy settings are related to digital signatures: 
  
- **Set default image directory**
    
- **EKU filtering**
    
- **Legacy format signatures**
    
- **Suppress Office Signing Providers**
    
- **Suppress external signature services command**
    

<a name="regsettings"> </a>

### Registry settings that apply to digital signatures


The following table shows Windows registry settings that are specific to digital signatures and the certificates that are used to encrypt them. These registry settings are located in HKEY_CURRENT_USER\software\policies\Microsoft\Office\16.0\common\signatures. There is no corresponding Group Policy.
  
**Digital signature registry settings**

|**Registry entry**|**Type**|**Value**|**Description**|
|:-----|:-----|:-----|:-----|
|FilterIssuer  <br/> |WZ  <br/> |Empty  <br/> |Reduces the set of available certificates to those that have the FilterIssuer value in their name.  <br/> |
|MinSigningDSABits  <br/> |DWORD  <br/> |Empty  <br/> |Specifies the minimum number of bits that are allowed to create a DSA digital signature in Office.  <br/> |
|InvalidDSABits  <br/> |DWORD  <br/> |Empty  <br/> |Specifies the maximum number of bits that will be read in a DSA digital signature. Any bits beyond the InvalidDSABits value are ignored.  <br/> |
|InvalidHashAlg  <br/> |WZ  <br/> |Empty  <br/> |Specifies the hash algorithms that were previously used by your organization to create digital signatures in previous releases of Office (Office 2007, Office 2010, for example) that you want to make invalid now. If a hash is specified here, validation will fail for any documents or emails that use that hash to validate a digital signature.  <br/> |
|InvalidRSABits  <br/> |DWORD  <br/> |Empty  <br/> |Specifies the maximum number of bits that will be read in an RSA digital signature. Any bits beyond the InvalidRSABits value are ignored.  <br/> |
|LegacyDSABits  <br/> |DWORD  <br/> |Empty  <br/> |Specifies the minimum number of bits that will be processed in a legacy DSA digital signature, where legacy refers to a digital signature created for a document or email using Office 2007 or Office 2010 and where the hash algorithm was specified in the LegacyHashAlg registry key setting.  <br/> |
|LegacyHashAlg  <br/> |WZ  <br/> |MD5  <br/> |Specifies the hash algorithms used by your organization to create digital signatures in previous releases of Office (Office 2007, Office 2010, for example) that you want to make available to validate legacy documents and emails that were digitally signed.  <br/> |
|LegacyRSABits  <br/> |DWORD  <br/> |Empty  <br/> |Specifies the minimum number of bits that will be processed in a legacy RSA digital signature. Legacy refers to a digital signature that was created for a document or email by using Office 2007 or Office 2010 and where the hash algorithm was specified in the LegacyHashAlg registry key setting.  <br/> |
|MinSigningRSABits  <br/> |DWORD  <br/> |Empty  <br/> |Specifies the minimum number of bits that will be used to create a digital signature in Office 2016.  <br/> |
   
## Related topics
[XML Advanced Electronic Signatures (XAdES)](https://go.microsoft.com/fwlink/p/?LinkId=186631)
  
[Office 2016 Administrative Template files (ADMX/ADML) and Office Customization Tool](https://go.microsoft.com/fwlink/p/?LinkID=626001)
  
[Find digital ID or digital signature services](https://go.microsoft.com/fwlink/p/?LinkId=267581)
  
[Add or remove a digital signature in Office files](https://go.microsoft.com/fwlink/p/?LinkId=187659)

