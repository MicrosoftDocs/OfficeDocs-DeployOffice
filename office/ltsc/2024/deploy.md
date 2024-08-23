---
title: "Deploy Office LTSC 2024"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides IT admins with information on how to deploy Office LTSC 2024."
ms.date: 09/16/2024
---

# Deploy Office LTSC 2024

To configure and perform deployments of Office LTSC 2024, including Project and Visio, for users in your organization, you use the Office Deployment Tool (ODT).

## Download the Office Deployment Tool from the Microsoft Download Center

<!--Using include for odt-->
[!INCLUDE[odt-download.md](../../includes/odt-download.md)]

For an Office LTSC 2024-specific sample, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

## Create the configuration.xml file
<!-- Add instructions on creating the configuration.xml file -->

|Configuration  |configuration.xml setting  |Additional information  |
|---------|---------|---------|
|Where to download the Office installation files to and where to install Office from| SourcePath  |
|Which products to download or install| Product ID  |
|Use Key Management Service (KMS) to activate Office LTSC 2024|PIDKEY|
|Use Multiple Activation (MAK) to activate Office LTSC 2024| PIDKEY  |
|Which languages to download or install|Language ID|
|Which proofing tools to install|Product ID|
|Which edition of Office LTSC 2024 to download or install| OfficeClientEdition  |
| Which apps to install| ExcludeApp       |
| Where to get security and quality updates from| UpdatePath |
|Which update channel to install from and get updates from|Channel  |
|Whether to remove previous Windows Installer (MSI) versions of Office before installing Office LTSC 2024|RemoveMSI|

## Sample configuration.xml file to use with the Office Deployment Tool
<!-- Add sample configuration.xml code -->

## Remove existing versions of Office before installing Office LTSC 2024
<!-- Add instructions for removing existing versions of Office -->

## Download the Office LTSC 2024 installation files
<!-- Add details for downloading Office LTSC 2024 installation files -->

## Install Office LTSC 2024 by using the Office Deployment Tool
<!-- Add instructions for installing Office LTSC 2024 using the ODT -->

## Install Office LTSC 2024 by using Configuration Manager
<!-- Add instructions for installing Office LTSC 2024 using Configuration Manager -->

## Deploy languages for Office LTSC 2024
<!-- Add details for deploying languages -->

## Microsoft Teams in Office LTSC 2024
<!-- Add details about Microsoft Teams in Office LTSC 2024 -->

## Skype for Business in Office LTSC 2024
<!-- Add details about Skype for Business in Office LTSC 2024 -->

## Related articles
<!-- List related articles -->
- [Overview of Office LTSC 2024](overview.md)
- [Update Office LTSC 2024](update.md)
- [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md)
