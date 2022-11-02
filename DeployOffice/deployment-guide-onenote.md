---
title: "Deployment guide for OneNote"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
recommendations: true
description: "Provides an overview for admins on how to deploy OneNote or OneNote for Windows 10 to users in their organization"
---

# Deployment guide for OneNote

There are two versions of OneNote that you can deploy to users in your organization who have devices running Windows:
- **OneNote**: the desktop version, which was previously named OneNote 2016.
- **OneNote for Windows 10**: the Microsoft Store app that's available only on Windows 10.

While both versions are supported and can be installed on the same device, OneNote is the recommended version for enterprise environments. OneNote provides more features and allows you to customize user settings through Group Policy.

> [!NOTE]
> OneNote still appears as OneNote 2016 in volume licensed versions of Office 2019, such as Office Professional Plus 2019.

## OneNote deployment guidance

You can use the [Office Deployment Tool](overview-office-deployment-tool.md) or enterprise deployment software, such as Microsoft Configuration Manager, to include or exclude OneNote when you deploy Office in your organization.

OneNote is included alongside the other Office apps, such as Word, Excel, and PowerPoint, when you deploy Microsoft 365 Apps, Office LTSC 2021, or Office 2019. There are no additional steps you need to take to include OneNote with new installations of Office. But, always be sure to check the deployment settings before you deploy, for example when using the wizards in Configuration Manager (current branch) or Microsoft Intune.

### To add OneNote to an existing installation of Office

If Office is already installed on the device, but OneNote didn't get installed previously, you can run the Office Deployment Tool on the device and use the following configuration.xml file to add OneNote.

```xml
<Configuration>
   <Add>
      <Product ID="OneNoteFreeRetail">
       <Language ID="MatchInstalled"/>
      </Product>
   </Add>
</Configuration>
```

Although you're deploying the freemium version of OneNote, the first time the user opens OneNote after it's installed, the license will update automatically to the same license as the version of Office already installed on the device.

> [!NOTE]
> - Using OneNoteFreeRetail isn't supported with volume licensed versions of Office, such as Office LTSC Professional Plus 2021 or Office Standard 2019. To add OneNote back to those versions of Office, you can run an Online Repair.
> - If you deploy the freemium version of OneNote, when you go to **Control Panel** > **Programs** > **Programs and Features**, OneNote will appear as a standalone entry named Microsoft OneNote Home and Student 2016.

### To exclude OneNote from being installed

There are different ways to exclude OneNote from being installed with Office, depending on which deployment method you're using, as shown in the following table.

|Method  |Instructions  |
|---------|---------|
|Office Deployment Tool | You can use the [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration.xml file. <br/><br/> We recommend that you use the [Office Customization Tool](admincenter/overview-office-customization-tool.md) to help you create your configuration.xml file.|
|Microsoft Configuration Manager (current branch)| In the Office 365 Client Installation wizard, you can set **OneNote** to the **Off** position when you configure the Office settings.|
|Microsoft Intune | On the **Configure app suite** page, you can clear the check box for OneNote in the **Select Office apps** drop-down list.|

But, if you're allowing your users to install Office for themselves from the Office 365 portal, there is no way to exclude OneNote from being installed.

## OneNote for Windows 10 deployment guidance

OneNote for Windows 10 is installed by default on computers running Windows 10. Users can also install it directly from the [Microsoft Store](https://www.microsoft.com/p/onenote/9wzdncrfhvjl?activetab=pivot%3aoverviewtab), if you allow them to install apps from there. In either case, updates to OneNote for Windows 10 come directly from the Microsoft Store.

If you don't want your users to install apps directly from the Microsoft Store, you can set up the Microsoft Store for Business in your organization. This option allows you to control which Microsoft Store apps your users can install, including OneNote for Windows 10. For more information, see [Microsoft Store for Business overview](/microsoft-store/microsoft-store-for-business-overview)

If your users already use OneNote for Windows 10, they may continue to use it. We recommend excluding OneNote for Windows 10 for new deployments. We don't recommend uninstalling OneNote for Windows 10 for existing users because uninstalling an app permanently removes any notebook changes in the local cache that haven't been synchronized. If you plan to uninstall OneNote for Windows 10 for existing users, ensure that all open notebooks have finished synchronizing before uninstalling.

All notebooks supported by OneNote for Windows 10 are also fully supported by OneNote. All cloud-based notebooks associated with their user account will be accessible in OneNote after they sign in with that same user account.

### To exclude OneNote for Windows 10 from a Windows image

To remove OneNote for Windows 10 from a Windows image so that OneNote for Windows 10 won't be installed when a new user account is created, you can use the [Remove-AppxProvisionedPackage](/powershell/module/dism/remove-appxprovisionedpackage) cmdlet. For the package name parameter, you should use Microsoft.Office.OneNote_2015.9126.21251.0_neutral_~_8wekyb3d8bbwe.

## Additional information about deploying OneNote

**OneNote training resources** We're providing [free and shareable eBooks](https://support.microsoft.com/office/4e08cf8b-dc37-4229-bdef-1f580220b6f5) to help your users transition to the user interface and functionalities in OneNote.

**Configure OneNote settings:** You can use Group Policy to configure certain OneNote settings for your users. To use Group Policy, download the latest [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center and implement the policy settings by using Active Directory Domain Services (AD DS).

> [!NOTE]
> - Group Policy requires the devices with OneNote to be joined to an Active Directory domain. 
> - Most of these same policy settings can be applied by using [Cloud Policy](admincenter/overview-cloud-policy.md), which doesn't require the device to be joined to a domain.
> - Group Policy can't be used with Microsoft 365 Apps for business or with OneNote for Windows 10.
> - Cloud Policy can only be used with Microsoft 365 Apps for enterprise.

**Supported languages:** While both OneNote and OneNote for Windows 10 are available in most of the same languages, there are a few differences. The lists of the supported languages are available here: [OneNote](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Desktop), [OneNote for Windows 10](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Phone&ID0EAACAAA=Windows_Phone&ID0EBBF=Windows_Phone)

**Other platforms:** There are also versions of OneNote for Mac, iPad, iPhone, Android, and for web browsers. For more information, see [What's the difference between the OneNote versions?](https://support.microsoft.com/office/a624e692-b78b-4c09-b07f-46181958118f)

## Related articles

- [Frequently Asked Questions about OneNote in Office 2019 and Microsoft 365](https://support.microsoft.com/office/6582c7ae-2ec6-408d-8b7a-3ed71a3c2103)
- [OneNote help & learning](https://support.microsoft.com/OneNote)
- [OneNote info for developers](https://developer.microsoft.com/onenote)