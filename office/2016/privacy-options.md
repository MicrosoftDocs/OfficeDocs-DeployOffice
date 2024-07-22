---
title: "Privacy options in Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.collection: 
- privacy-office
- must-keep
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
description: "Explains how Office privacy settings let you control the disclosure of private information."
ms.date: 04/19/2024
hideEdit: true
---

# Privacy options in Office 2016

 **Summary**: Explains how Office 2016 privacy settings let you control the disclosure of private information. 
  
  
The **Welcome to Office** experience lets users enable or disable several Internet-based services that help protect and improve Office 2016 applications. For more information about the **Welcome to Office** experience, see the [Privacy in Microsoft Office](https://go.microsoft.com/fwlink/p/?LinkId=282043).
 
<a name="about"> </a>

## About planning privacy options for Office

The first time that users start Office 2016, they go through the **Welcome to Office** first run experience. 
  
If users choose to **Install important and recommended updates for Office and other products**:
  
- Recommended and important updates are automatically installed for the operating system and Office 2016 applications. Users are notified about new optional software.
    
- Applications can connect to support.office.com for updated Help content and can receive targeted Help content for the Office 2016 applications that are installed.
    
- Applications can periodically download small files that help determine system problems and prompt users to send error reports to Microsoft. 
    
- Users can sign up for the Customer Experience Improvement Program or the Office Personalized Experience Program (OPEP), depending on the SKU they have installed. For more information about OPEP, see the [Microsoft Office Personalized Experience Program](https://go.microsoft.com/fwlink/p/?LinkId=282045).
    
If users choose **Install Updates Only**, recommended and important updates are automatically installed for the operating system and Office 2016 applications. Users are notified about new optional software, but, privacy options aren't changed in Office 2016 applications. This means that the default privacy options take effect. If users choose **Don't Make Changes**, automatic updating isn't changed in the Windows Security Center and privacy options aren't changed in Office 2016. The default privacy options take effect.
  
The default privacy options for Office 2016 applications are as follows:
  
- Office 2016 applications don't connect to support.office.com for updated Help content and Office applications aren't detected on users' computers. Users won't experience optimal results when they search for Help.
    
- Office 2016 applications don't download small programs that help diagnose problems and error message information isn't sent to Microsoft.
    
- Users aren't enrolled in the Customer Experience Improvement Program.
    
Because the **Welcome to Office** experience lets users enable or disable several Internet-based services, you might want to prevent the dialog box from appearing and, instead, configure these services individually. If you suppress the dialog box, we recommend that you enable all Internet-based services, which you can do by configuring privacy options. 
  
<a name="suppress"> </a>

## Suppress the Welcome to Office experience

You can suppress the **Welcome to Office** experience by enabling the **Suppress recommended settings dialog** setting. This Group Policy setting is located in the Group Policy Object Editor under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Miscellaneous. This setting prevents the **Welcome to Office** experience from appearing the first time that a user starts Office 2016. If you enable this setting, the automatic updating feature remains unchanged and the privacy options that control Internet-based services aren't enabled. 
  
If you suppress the **Welcome to Office** experience without enabling certain privacy options, you disable several features that improve Office 2016 applications and you could expose a computer to security threats. Therefore, if you enable this setting we recommend that you also enable all the privacy options that are discussed in [Configure privacy options in Office](privacy-options.md#privacyoptions).
  
Most organizations enable this setting, including organizations that have a highly restrictive security environment or a security environment that restricts Internet access.
  
<a name="privacyoptions"> </a>

## Configure privacy options in Office

Office 2016 provides several settings that let you control the disclosure of private information. These settings are often known as privacy options. You can enable or disable each of these settings to suit your organization's security requirements. If you suppress the **Welcome to Office** experience, we recommend that you also enable all of the following Group Policy settings: 
  
**Online content options** This Group Policy setting is located in the Group Policy Object Editor under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\ Tools | Options | General | Service Options… \ Online Content. 
  
- **Description:** This setting controls whether the Office 2016 Help system can download Help content from support.office.com. You can choose one of three options for this setting: 
    
  - **Never show online content or entry points** The Help system doesn't connect to support.office.com to download content. This is the default setting if you suppress the **Welcome to Office** experience or if users select **Don't make changes** or **Install Updates Only**. 
    
  - **Search only offline content whenever available** The Help system doesn't connect to support.office.com to download content. 
    
  - **Search online content whenever available** The Help system connects to support.office.com for content when the computer is connected to the Internet. 
    
- **Impact:** If you enable this setting and select **Never show online content or entry points** or **Search only offline content whenever available**, users can't access updated Help articles through the Help system and you can't get templates from support.office.com.
    
- **Guidelines:** Most organizations enable this setting and select **Search online content when available**. This is the recommended configuration for this setting. But, organizations that have a highly restrictive security environment, or a security environment that restricts Internet access, typically enable this setting and select **Never show online content or entry points**.
    
**Automatically receive small updates to improve reliability** This Group Policy setting is located in the Group Policy Object Editor under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\ Privacy\Trust Center. 
  
- **Description:** This setting controls whether client computers periodically download small files that enable Microsoft to diagnose system problems. 
    
- **Impact:** If you enable this setting, Microsoft collects information about specific errors and the IP address of the computer. No personally identifiable information is transmitted to Microsoft other than the IP address of the computer requesting the update. 
    
- **Guidelines:** Most organizations enable this setting, which is the recommended configuration. Organizations that have a highly restrictive security environment, or a security environment that restricts Internet access, typically disable this setting. 
    
**Enable Customer Experience Improvement Program (CEIP)** This Group Policy setting is located in the Group Policy Object Editor under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center. 
  
- **Description:** This setting controls whether users participate in the CEIP to help improve Office 2016. When users participate in the CEIP, Office 2016 applications automatically send information to Microsoft about how the applications are used. This information is combined with other CEIP data to help Microsoft solve problems and improve the products and features customers use most often. CEIP doesn't collect users' names, addresses, or any other identifying information except the IP address of the computer that is used to send the data. 
    
- **Impact:** If you enable this setting, users participate in the CEIP. 
    
- **Guidelines:** Most organizations enable this setting, which is the recommended configuration. Organizations that have a highly restrictive security environment, or a security environment that restricts Internet access, typically don't enable this setting. 
    
**Improve Proofing Tools** This Group Policy setting is located in the Group Policy Object Editor under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools\Options\Spelling. 
  
- **Description:** This setting controls whether the Help Improve Proofing Tools feature sends usage data to Microsoft. The Help Improve Proofing Tools feature collects data about how users use the proofing tools, such as additions to the custom dictionary, and sends the data to Microsoft. After about six months, the feature stops sending data to Microsoft and deletes the data collection file from the user's computer. By default, this feature is enabled if users choose to participate in the Customer Experience Improvement Program (CEIP). 
    
  If your organization has policies that govern the use of external resources, such as the CEIP, people who use the Help Improve Proofing Tools feature might be violating these policies. If you disable this policy setting, the Help Improve Proofing Tools feature doesn't collect proofing tool usage information and doesn't transmit it to Microsoft. If you don't configure this policy setting, the behavior is of the same as setting the policy to "Enabled."
    
- **Impact:** If you enable this setting, users participate in the CEIP. Although this feature doesn't intentionally collect personal information, some content that is sent could include items that were marked as spelling or grammar errors, such as proper names and account numbers. But, any numbers such as account numbers, street addresses, and telephone numbers are converted to zeros when the data is collected. Microsoft uses this information only to improve the effectiveness of the Office Proofing Tools, not to identify users. 
    
- **Guidelines:** Most organizations enable this setting, which is the recommended configuration. Organizations that have a highly restrictive security environment, or a security environment that restricts Internet access, typically don't enable this setting. 
    
<a name="addtional"> </a>

## Related privacy options

Several other settings are related to privacy disclosure in Office 2016 applications. If you're changing privacy options because you have a special security environment, you might want to evaluate the following settings:
  
- **Protect document metadata for password protected files** This setting determines whether metadata is encrypted when you use the Encrypt with Password feature. 
    
- **Protect document metadata for rights managed Office Open XML files** This setting determines whether metadata is encrypted when you use the Restrict Permission by People feature. 
    
- **Warn before printing, saving, or sending a file that contains tracked changes or comments** This setting determines whether users are warned about comments and tracked changes before they print, save, or send a document. 
    
- **Make hidden markup visible** This setting determines whether all tracked changes are visible when you open a document. 
    
- **Prevent document inspectors from running** This setting lets you disable Document Inspector modules. Document Inspector modules, available in various Office applications since Office 2007, allows users to remove hidden and personal information from their Office documents. 
    
## Related articles
[Privacy in Microsoft Office](https://go.microsoft.com/fwlink/p/?LinkId=282043)

