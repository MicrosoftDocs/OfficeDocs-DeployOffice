---
title: "OneNote for Windows 10 migration guidance"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
hideEdit: false
description: "Provides migration guidance for OneNote for Windows 10"
ms.date: 10/02/2024

---

# OneNote for Windows 10 migration guidance

<!--Using include for adding OneNote for Windows 10 eos-->
[!INCLUDE [OneNote Windows 10 eos](../includes/onenote-win10-eos.md)]

This article provides guidance for migrating your organization from OneNote for Windows 10 to OneNote for Windows. It includes instructions for identifying users, customizing migration scripts, and ensuring data integrity throughout the process. You find troubleshooting steps and best practices to help minimize disruption and safeguard user data during the migration.

## Identifying users on OneNote for Windows 10:

To identify users or devices in your organization using OneNote for Windows 10 via Microsoft Intune, follow these steps to run a report:

- In Intune, navigate to: **All Services** > **Apps | Monitor** > **Monitor** > **Discovered apps**, then search for "Office.OneNote."
- Look for the application version starting with `16001.xxxxx.xxxxx.x` to identify OneNote for Windows 10 users. The latest version is `16001.14326.22008.0`
  > [!NOTE]
  > The sample migration script works only with OneNote for Windows 10 devices on version `16001.14326.22008.0`

## Sample script customization

To ensure a smooth migration to OneNote for Windows, organizations must customize the following sample script to complete these functions:

- Installs OneNote on Windows on user devices. For more information, see [Deployment guide for OneNote](deployment-guide-onenote.md)

- Updates OneNote for Windows 10 to the latest build to incorporate important features and prevent data loss during the migration of unsynced notes.
    > [!NOTE]
    > This script does not update OneNote for Windows 10 devices that aren't on version 16001.14326.22008. IT admins must upgrade these devices according to their organization's policy.

- Terminates all OneNote for Windows 10 processes.

- Backs up any unsynced notebooks to the user's backup folder using the `onenote-cmd://backup:` command.
  - The backups are stored in `C:\temp\OneNoteMigration`, however, feel free to edit the path to fit your organization’s needs.
  - Each backup creates a corresponding folder for each notebook with unsynced sections within this path.

- Parse through the `UWPBackUpStatus.json` to validate the backup was successful.
  - Uninstalling with a failed backup can lead to data loss.
    > [!NOTE]
    > To perform the backup, OneNote for Windows must be installed, and OneNote for Windows 10 must be updated to version 16001.14326.22008 or later.
- Uninstalls OneNote for Windows 10.
  - Ensure OneNote for Windows 10 is uninstalled on a user basis and not on a device basis. This process helps mitigate scenarios where shared devices have unsynced notes removed for all accounts.

> [!IMPORTANT]
> Before using the sample script, you must customize it to fit your organization's specific deployment and migration requirements.

:::code language="powershell" source="../snippets/deployment-guide-onenote/uninstall-onenote-win10.ps1":::

## Accessing migrated notes

After migration, users can retrieve their notes by:
1. Opening the new **OneNote on Windows** application.
2. Signing into their account.
3. Opening their notebooks.

If any notes are missing, check the backup folder that was created in the previous steps.

To review backups through OneNote on Windows:
- Navigate to **File -> Open Backups -> Navigate to the backup file path.**

## Troubleshooting

- Review the `UWPBackupStatus.json` and `UWPSyncStatus.json` files in the user’s backup folder for detailed information on the backup and sync statuses.

- For errors encountered during migration, refer to the log file located in the backup generated previously (step 1.d).

If the `onenote-uwp://backup:` command fails:
- Ensure that the OneNote for Windows 10 app is the default app linked to the `onenote-uwp` protocol.
- Consult the relevant support article to ensure correct protocol attachment to OneNote for Windows 10.

> [!CAUTION]
> Be cautious when using commands found online. Always test commands in a controlled environment before deploying them organization-wide to avoid unintended consequences, such as those resulting from the Remove-AppxPackage command. 

For more assistance or inquiries, contact Microsoft Support.

## Related articles

- [Frequently Asked Questions about OneNote in Office 2019 and Microsoft 365](https://support.microsoft.com/office/6582c7ae-2ec6-408d-8b7a-3ed71a3c2103)
- [OneNote help & learning](https://support.microsoft.com/OneNote)
- [OneNote info for developers](https://developer.microsoft.com/onenote)
- [Deployment guide for OneNote](deployment-guide-onenote.md)