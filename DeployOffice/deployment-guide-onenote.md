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
ms.date: 05/20/2024
---

# Deployment guide for OneNote

> [!IMPORTANT]
> OneNote for Window 10 will reach end of support in October 2025, It's recommended that all enterprise customers switch from OneNote for Windows 10 to OneNote on Windows, which is available from the Microsoft Store and with a Microsoft 365 subscription. OneNote on Windows offers new features and updates and allows you to customize user settings through Group Policy. 

OneNote is included alongside the other Office apps, such as Word, Excel, and PowerPoint, when you deploy Microsoft 365 Apps, Office LTSC 2021, or Office 2019. There are no other steps you need to take to include OneNote with new installations of Office. But, always be sure to check the deployment settings before you deploy, for example when using the wizards in Configuration Manager (current branch) or Microsoft Intune.

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
|Office Deployment Tool | You can use the [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration.xml file. <br/><br/> We recommend that you use the [Office Customization Tool](admincenter/overview-office-customization-tool.md) to help you create your configuration.xml file.|
|Microsoft Configuration Manager (current branch)| In the Office 365 Client Installation wizard, you can set **OneNote** to the **Off** position when you configure the Office settings.|
|Microsoft Intune | On the **Configure app suite** page, you can clear the check box for OneNote in the **Select Office apps** drop-down list.|

But, if you're allowing your users to install Office for themselves from the Office 365 portal, there's no way to exclude OneNote from being installed.

## OneNote for Windows 10 migration guidance

> [!NOTE]
> To ensure uninterrupted service and workflow, it's strongly recommend that organizations migrate to OneNote on Windows well ahead of the OneNote for Windows 10 end-of-support date in October 2025. 

This section provides a step-by-step guide to help you develop a migration policy and execute the transition smoothly.

Migration Policy Development: To facilitate a successful migration to OneNote on Windows, organizations should:

*Customize the Migration Script.*

Use this sample script to suit your organization's needs. 


If your markdown environment supports collapsible sections, you can use them to make the script collapsible. Unfortunately, standard markdown does not support collapsible sections, but some platforms like GitHub and GitLab support custom syntax for this:

For GitHub:

:::code language="powershell" source="snippets/deployment-guide-onenote/your-script.ps1":::

Ensure the script performs the following functions:

- **Installs OneNote on Windows** on user devices. Refer to the Deployment Guidance section for more details.

- **Updates OneNote for Windows 10** to the latest build (min build 16001.14326.21802.0) to incorporate essential features that prevent data loss during the migration of unsynced notes.

- **Terminates all OneNote for Windows 10 processes.**

- **Backs up any unsynced notebooks** to the user's backup folder using the `onenote-cmd://backup:` command.
  - The backups are stored in `C:\temp\OneNoteMigration`, however, feel free to edit the path to fit your organization’s needs.
  - Each backup creates a corresponding folder for each notebook with unsynced sections within this path.

- **Parse through the `UWPBackUpStatus.json`** to validate backup was successful.
  - Uninstalling with a failed backup can lead to data loss.

- **Uninstalls OneNote for Windows 10.**
  - Ensure OneNote for Windows 10 is uninstalled on a user basis and not on a device basis. This will help mitigate scenarios where shared devices have unsynced notes removed for all accounts.

## Accessing Migrated Notes

After migration, users can retrieve their notes by:
1. Opening the new **OneNote on Windows** application.
2. Signing into their account.
3. Opening their notebooks.

If any notes are missing, check the backup folder that was created in the previous steps.

To review backups through OneNote on Windows:
- Navigate to **File -> Open Backups -> Navigate to the backup file path.**

:::image type="content" source="images/deployment-guide-onenote/notebook-information-small.png" alt-text="This image displays the OneNote application's Notebook Information section. The interface includes a navigation bar with various options and a main panel showing Migration settings with a file path. There are icons for View Sync Status and Open Backups in the upper right corner" lightbox="images/deployment-guide-onenote/notebook-information.png":::

## Troubleshooting

- Review the `UWPBackupStatus.json` and `UWPSyncStatus.json` files in the user’s backup folder for detailed information on the backup and sync statuses.

- For errors encountered during migration, refer to the log file located in the backup generated previously (step 1.d).

Should the `onenote-cmd://backup:` command fail:
- Ensure that the OneNote for Windows 10 app is the default app linked to the `onenote-cmd` protocol.
- Consult the relevant support article to ensure correct protocol attachment to OneNote for Windows 10.

> [!CAUTION]
> Be cautious when using commands found online. Always test commands in a controlled environment before deploying them organization-wide to avoid unintended consequences, such as those resulting from the Remove-AppxPackage command. 

For additional assistance or inquiries, contact Microsoft Support.

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