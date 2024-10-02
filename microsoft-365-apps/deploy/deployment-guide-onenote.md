---
title: "Deployment guide for OneNote"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Provides an overview for admins on how to deploy OneNote or OneNote for Windows 10 to users in their organization"
ms.date: 10/02/2024
---

# Deployment guide for OneNote

<!--Using include for adding OneNote for Windows 10 eos-->
[!INCLUDE [OneNote Windows 10 eos](../includes/onenote-win10-eos.md)]

OneNote is included with Word, Excel, and PowerPoint when you deploy Microsoft 365 Apps, Office Long Term Service Channel (LTSC) 2024, Office LTSC 2021, or Office 2019. There are no other steps you need to take to include OneNote with new installations of Office. But, always be sure to check the deployment settings before you deploy, for example when using the wizards in Configuration Manager (current branch) or Microsoft Intune.

Use the [Office Deployment Tool](overview-office-deployment-tool.md) or enterprise deployment software like Microsoft Configuration Manager to include or exclude OneNote when you deploy Office in your organization.

### To add OneNote to an existing installation of Office

If you install Office on your device but OneNote is missing, use the Office Deployment Tool and the following configuration.xml file to add OneNote.

```xml
<Configuration>
   <Add>
      <Product ID="OneNoteFreeRetail">
       <Language ID="MatchInstalled"/>
      </Product>
   </Add>
</Configuration>
```

When you deploy the free version of OneNote, the license updates automatically to match the Office version already installed on the device once the user opens OneNote for the first time.

> [!NOTE]
> - Using OneNoteFreeRetail isn't supported with volume licensed versions of Office, such as Office LTSC Professional Plus 2021 or Office Standard 2019. To add OneNote back to those versions of Office, you can run an Online Repair.
> - If you deploy the freemium version of OneNote, when you go to **Control Panel** > **Programs** > **Programs and Features**, OneNote will appear as a standalone entry named Microsoft OneNote Home and Student 2016.

### To exclude OneNote from being installed

There are different ways to exclude OneNote from being installed with Office, depending on which deployment method you're using, as shown in the following table.

|Method  |Instructions  |
|---------|---------|
|Office Deployment Tool | You can use the [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration.xml file. <br/><br/> We recommend that you use the [Office Customization Tool](../admin-center/overview-office-customization-tool.md) to help you create your configuration.xml file.|
|Microsoft Configuration Manager (current branch)| In the Office 365 Client Installation wizard, you can set **OneNote** to the **Off** position when you configure the Office settings.|
|Microsoft Intune | On the **Configure app suite** page, you can clear the check box for OneNote in the **Select Office apps** drop-down list.|

If you're allowing your users to install Office for themselves from the Microsoft 365 portal, there's no way to exclude OneNote from being installed.

## Additional information about deploying OneNote

### OneNote training resources
We're providing [free and shareable eBooks](https://support.microsoft.com/office/4e08cf8b-dc37-4229-bdef-1f580220b6f5) to help your users transition to the user interface and functionalities in OneNote.

### Configure OneNote settings 
You can use Group Policy to configure certain OneNote settings for your users. To use Group Policy, download the latest [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center and implement the policy settings by using Active Directory Domain Services.

> [!NOTE]
> - Group Policy requires the devices with OneNote to be joined to an Active Directory domain. 
> - Most of these same policy settings can be applied by using [Cloud Policy](../admin-center/overview-cloud-policy.md), which doesn't require the device to be joined to a domain.
> - Group Policy can't be used with Microsoft 365 Apps for business or with OneNote for Windows 10.
> - Cloud Policy can only be used with Microsoft 365 Apps for enterprise.

### Supported languages
While both OneNote and OneNote for Windows 10 are available in most of the same languages, there are a few differences. The lists of the supported languages are available here: [OneNote](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Desktop), [OneNote for Windows 10](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Phone&ID0EAACAAA=Windows_Phone&ID0EBBF=Windows_Phone)

### Other platforms
There are also versions of OneNote for Mac, iPad, iPhone, Android, and for web browsers. For more information, see [What's the difference between the OneNote versions?](https://support.microsoft.com/office/a624e692-b78b-4c09-b07f-46181958118f)

## Related articles

- [Frequently Asked Questions about OneNote in Office 2019 and Microsoft 365](https://support.microsoft.com/office/6582c7ae-2ec6-408d-8b7a-3ed71a3c2103)
- [OneNote help & learning](https://support.microsoft.com/OneNote)
- [OneNote info for developers](https://developer.microsoft.com/onenote)
- [OneNote for Windows 10 migration guide](onenote-for-windows-10-migration-guide.md)
