---
title: "Deployment guide for OneNote"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides an overview for admins on how to deploy OneNote or OneNote for Windows 10 to users in their organization"
---

# Deployment guide for OneNote

There are two versions of OneNote that you can deploy to users in your organizations who have devices running Windows:
- **OneNote**, which is part of the Office suite.
- **OneNote for Windows 10**, which is included on devices running Windows 10.

Both versions are supported and continue to receive new features. For example, [Dark Mode](https://support.microsoft.com/office/bb81fb88-968d-4c1a-818d-eec590deadef) was added to OneNote in late 2019.

As of March 2020, OneNote is included alongside the other Office apps, such as Word, Excel, and PowerPoint, when you deploy Microsoft 365 Apps or Office 2019. But, if you want to, you can exclude OneNote from being installed. For more information, see [OneNote deployment guidance](#onenote-deployment-guidance).

> [!NOTE]
> In Version 2003 and earlier of Microsoft 365 Apps, OneNote was named OneNote 2016.

## Choose the version of OneNote for your organization

Both OneNote and OneNote for Windows 10 can be installed on the same device and used side by side. Each version of OneNote can access and sync with the same cloud-based notebooks, such as notebooks stored in OneDrive for Business, SharePoint Online, or SharePoint Server. Even though the notebooks are cloud-based, a copy of each notebook is cached on the user's device so that users can access them even when the device isn't connected to the internet. But, OneNote for Windows 10 can't use local notebooks, which are OneNote files that are stored on the user's device or on a file share on the network.

You can provide users in your organization with both versions of OneNote so that they can choose which version best suits their needs. Users can [choose which OneNote version is the default](https://support.microsoft.com/office/f261140c-5ce8-4cf4-ad0b-c9e1cb953831) on their device. Or, you can decide to provide only one version of OneNote on their devices running Windows.

OneNote might be the better choice for your organization in the following situations:
- Your users rely primarily on local notebooks and you don't want to migrate these notebooks to the cloud.
- Most of your existing users are already trained on OneNote, or even OneNote 2013, so they're already familiar with the user interface.
- You want to customize OneNote settings for your users, which is available through Group Policy.

OneNote for Windows 10 might be a better alternative for your organization in the following situations:
- Most of your users are new to OneNote. OneNote for Windows 10 has a user interface that is designed to be easier to navigate for new users.
- Your organization supports OneNote on multiple platforms, such as Mac, web, and iPad. OneNote across these platforms, including OneNote for Windows 10, have a consistent user interface.

For more information, see [What's the difference between the OneNote versions](https://support.microsoft.com/office/a624e692-b78b-4c09-b07f-46181958118f)

## OneNote deployment guidance

You can use the [Office Deployment Tool](overview-office-deployment-tool.md) or enterprise deployment software, such as Microsoft Endpoint Configuration Manager, to include or exclude OneNote when you deploy Office in your organization.

As of March 2020, OneNote is included alongside the other Office apps, such as Word, Excel, and PowerPoint, when you deploy Microsoft 365 Apps or Office 2019. There are no additional steps you need to take to include OneNote with new installations of Office. But, always be sure to check the deployment settings before you deploy, for example when using the wizards in Configuration Manager (current branch) or Microsoft Intune.

### To add OneNote to an existing installation of Office

If Office is already installed on the device, but OneNote didn't get installed, you can run the Office Deployment Tool on the device and use the following configuration.xml file to add OneNote.

```xml
<Configuration>
   <Add>
      <Product ID="OneNoteFreeRetail">
       <Language ID="MatchOS"/>
      </Product>
   </Add>
</Configuration>
```

Although you're deploying the freemium version of OneNote, the first time the user opens OneNote after it's installed, the license will update automatically to the same license as the version of Office already installed on the device.

> [!NOTE]
> Using OneNoteFreeRetail isn't supported with volume licensed versions of Office 2019, such as Office Professional Plus 2019 or Office Standard 2019. To add OneNote back to these versions of Office, run an Online Repair.

### To exclude OneNote from being installed

There are different ways to exclude OneNote from being installed with Office, depending on which deployment method you're using, as shown in the following table.


|Method  |Instructions  |
|---------|---------|
|Office Deployment Tool | You can use the [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration.xml file. <br/><br/> We recommend that you use the [Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md) to help you create your configuration.xml file.|
|Microsoft Endpoint Configuration Manager (current branch)| In the Office 365 Client Installation wizard, you can set **OneNote 2016** to the **Off** position when you configure the Office settings.|
|Microsoft Intune | On the **Configure app suite** page, you can clear the check box for OneNote 2016 in the **Select Office apps** drop-down list.|

But, if you're allowing your users to install Office for themselves from the Office 365 portal, there is no way to exclude OneNote from being installed.

## OneNote for Windows 10 deployment guidance

OneNote for Windows 10 is installed by default on computers running Windows 10. Users can also install it directly from the [Microsoft Store](https://www.microsoft.com/p/onenote/9wzdncrfhvjl?activetab=pivot%3aoverviewtab), if you allow them to install apps from there. In either case, updates to OneNote for Windows 10 come directly from the Microsoft Store.

If you don't want your users to install apps directly from the Microsoft Store, you can set up the Microsoft Store for Business in your organization. This allows you to control which Microsoft Store apps your users can install, including OneNote for Windows 10. For more information, see [Microsoft Store for Business overview](https://docs.microsoft.com/microsoft-store/microsoft-store-for-business-overview)

If you plan to move your users to OneNote for Windows 10, make sure their notebooks have been moved to a cloud storage location, such as OneDrive for Business. To do that, you can provide them the instructions in [Move OneNote notebooks from your computer to OneDrive](https://support.microsoft.com/office/b43692ae-ce27-4ab9-a8ad-a2aed225e6a5).

If you plan to move your users from OneNote for Windows 10 to OneNote, no steps are needed to migrate their notebooks. All cloud-based notebooks associated with their user account will be accessible in OneNote after they sign in with that same user account.

## Additional information about deploying OneNote

**Configure OneNote settings:** You can use Group Policy to configure certain OneNote settings for your users. To use Group Policy, download the latest [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center and implement the policy settings by using Active Directory Domain Services (AD DS).

> [!NOTE]
> - Group Policy requires the devices with OneNote to be joined to an Active Directory domain. 
> - Most of these same policy settings can be applied by using the [Office cloud policy service](overview-office-cloud-policy-service.md), which doesn't require the device to be joined to a domain.
> - Neither Group Policy nor Office cloud policy service can be used with Microsoft 365 Apps for business or with OneNote for Windows 10.

**Support dates:** In November 2019, we [announced](https://techcommunity.microsoft.com/t5/Office-365-Blog/Your-OneNote/ba-p/954922) that mainstream support for OneNote will continue until October 2023. Extended supported remains the same, ending in October 2025. These dates align with the support dates for Office 2019. These specific support dates apply only to OneNote included with versions of Office, such as Office Professional Plus 2016, that are available as a one-time purchase or through volume licensing agreements.

**Supported languages:** While both OneNote and OneNote for Windows 10 are available in most of the same languages, there are a few differences. The lists of the supported languages are available here: [OneNote](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Desktop), [OneNote for Windows 10](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Phone&ID0EAACAAA=Windows_Phone)

**Other platforms:** There are also versions of OneNote for Mac, iPad, iPhone, Android, and for web browsers. For more information, see [OneNote help & learning](https://support.microsoft.com/OneNote).

## Related topics

- [Frequently Asked Questions about OneNote in Office 2019 and Microsoft 365](https://support.microsoft.com/office/6582c7ae-2ec6-408d-8b7a-3ed71a3c2103)
- [What's new in OneNote for Windows 10](https://support.microsoft.com/office/1477d5de-f4fd-4943-b18a-ff17091161ea)
- [OneNote help & learning](https://support.microsoft.com/OneNote)
- [OneNote info for developers](https://developer.microsoft.com/onenote)