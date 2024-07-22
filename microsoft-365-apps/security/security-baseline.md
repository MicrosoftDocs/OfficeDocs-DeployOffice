---
title: "Security baseline for Microsoft 365 Apps for enterprise"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: 
 - tier2
 - essentials-security
ms.localizationpriority: medium
description: "Provide Office admins with an overview of the security baseline for Microsoft 365 Apps for enterprise"
ms.date: 01/09/2024
---

# Security baseline for Microsoft 365 Apps for enterprise

The security baseline for Microsoft 365 Apps for enterprise is published twice a year, usually in June and December. The most current version is [Version 2306](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/security-baseline-for-m365-apps-for-enterprise-v2306/ba-p/3858702), released on June 29, 2023.

To get the security baseline for Microsoft 365 Apps for enterprise, [download the Security Compliance Toolkit](https://www.microsoft.com/en-us/download/details.aspx?id=55319).

> [!NOTE]
> This security baseline is for Microsoft 365 Apps for enterprise. Some of the policies might be applicable to other versions of Office, such as Office LTSC 2021, Office 2019, or Office 2016. But you'll have to determine which policies are applicable for those versions.

## Overview of security baselines

A security baseline is a Microsoft recommended configuration setting for enterprise customers to deploy in their organization. They're meant to act as a starting point for IT admins to evaluate and balance the security benefits with productivity needs of their users and adjust accordingly. These settings are based on feedback from Microsoft security engineering teams, product groups, partners, and customers.

Security baselines are available for the following Microsoft products:

- Windows 11, Windows 10, and Windows Server 2022
- Microsoft 365 Apps for enterprise
- Microsoft Edge

For a list of the most current security baselines, see this [version matrix](/windows/security/threat-protection/windows-security-configuration-framework/get-support-for-security-baselines#version-matrix).

## Overview of the Security Compliance Toolkit

The Security Compliance Toolkit is a set of tools that allows enterprise security administrators to download, analyze, test, edit, and store Microsoft-recommended security configuration baselines for Microsoft products.

Using the toolkit, administrators can compare their current GPOs with Microsoft-recommended GPO baselines or other baselines, edit them, store them in GPO backup file format, and apply them broadly through Active Directory or individually through local policy.

For more information, see [Microsoft Security Compliance Toolkit 1.0](/windows/security/threat-protection/windows-security-configuration-framework/security-compliance-toolkit-10).

## Contents of the security baseline for Microsoft 365 Apps for enterprise

The download of the security baseline for Microsoft 365 Apps for enterprise includes documentation, GP reports, GPOs, scripts, and the "MS Security Guide" Administrative template. The following sections provide additional information about some of these areas.

### Group Policy Objects (GPOs)

The download of the security baseline for Microsoft 365 Apps for enterprise includes several pre-configured Group Policy Objects (GPOs).

Most organizations can implement, without any problems, the recommended settings that are included in the **Computer** and the **User** GPOs.

However, there are a few settings that will cause operational issues for some organizations. We've broken out related groups of such settings into their own GPOs to make it easier for organizations to add or remove these restrictions as a set. Those settings are included in the following four separate GPOs:

- **DDE Block - User**, which is a User Configuration GPO that blocks using DDE to search for existing DDE server processes or to start new ones.

- **Legacy File Block - User**, which is a User Configuration GPO that prevents Office applications from opening or saving legacy file formats.

- **Legacy JScript Block - Computer**, which is a Computer Configuration GPO that disables the legacy JScript execution for websites in the Internet Zone and Restricted Sites Zone.

- **Require Macro Signing - User**, which is a User Configuration GPO that disables unsigned macros in each of the Office applications.

The local-policy script, named Baseline-LocalInstall.ps1, offers command-line options to control whether these GPOs are installed.

### "MS Security Guide" Administrative template

The download of the security baseline for Microsoft 365 Apps for enterprise includes the "MS Security Guide" Administrative template. The SecGuide ADMX/ADML files include two settings of interest to Office admins:

- Block Flash activation in Office documents
- Restrict legacy JScript execution for Office

The "Block Flash activation in Office documents" setting is only available in the "MS Security Guide" Administrative template. The "Restrict legacy JScript execution for Office" setting is also available as a GPO in the security baseline download, as noted in the previous section.

These settings appear under Computer Configuration\Policies\Administrative Templates\MS Security Guide in the Group Policy Management Console.

### Documentation listing available policies and security baseline recommendations

The download of the security baseline for Microsoft 365 Apps for enterprise includes an Excel file, which lists the available Computer Configuration and User Configuration policies. The file also includes the settings available in the "MS Security Guide" Administrative template.

You can filter the **Area** column on **Security Baseline** to see the policies that are part of the security baseline. You can also see how the setting is configured in the security baseline for each of those policies.

You can also filter the **Area Category** column to find groupings of related policies. For example, you can filter on **FileBlock** or on **Macros**.

In addition, there's color coding in the **MSFT Office 365 Baseline** column to indicate which policies are covered by the four separate GPOs mentioned previously. For the legend explaining the colors, see the **Information** sheet in the Excel file.

The Excel file includes the following columns.


|Column name  |Description of contents  |
|---------|---------|
|Policy Path|The location of the policy in the Group Policy Management Console. |
|Policy Setting Name|The name of the policy. |
|MSFT Office 365 Baseline|The recommended security baseline state or value the policy should be set to.|
|Area|The area of the policy. <br/><br/> Policies with "Security Baseline" are recommended. <br/><br/> **Note:** Policies with "Security" aren't included in the security baseline recommendations. They're more restrictive security policies.|
|Area Category|The technology category that the policy controls. |
|Registry Information|The location in the registry where the state of the policy is stored.|
|Help Text|The description of the policy.|

Some additional information about these policies can be found in the Excel file that is included with the [download of the Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030).
