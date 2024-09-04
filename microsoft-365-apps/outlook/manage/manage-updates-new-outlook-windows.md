---
title: Manage updates in new Outlook for Windows
description: Describes how to manage updates in new Outlook for Windows that deliver features through a Targeted Release or Standard Release ring.
author: JanelleMcIntosh-MSFT
ms.author: janellem
manager: serdars
audience: ITPro
ms.topic: conceptual
ms.service: outlook
ms.collection:
- Tier3
- deploy-new-outlook
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
ms.date: 05/07/2024
---

# Manage updates in new Outlook for Windows

## Updates to the new Outlook for Windows 

The new Outlook for Windows app updates automatically, with new build updates shipping weekly. Unlike the classic version, though, features aren't delivered via build updates. The native component updates ensure that the app continues to work with the service, and updates are delivered automatically.

To ensure reliable delivery of updates, administrators need to allow access to the Microsoft 365 CDN on the *.office.net domain. [Microsoft 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges).

## Service-delivered features

New features are released through rings through our service, starting with validation in internal rings before starting to expand into a production audience. External customers can either receive features as part of a Targeted Release ring (for early previews) or Standard Release rings (most common). [Set up the Standard or Targeted release options](/microsoft-365/admin/manage/release-options-in-office-365).

This new model for feature delivery is similar to the way that Microsoft Teams releases new functionality, as described in the article, [Public preview in Microsoft Teams](/MicrosoftTeams/public-preview-doc-updates).

Unlike release channels for the classic Outlook, there's no Monthly Enterprise Channel or Semi-Annual Channel. Updates to new Outlook aren't managed in [Software Center](/mem/configmgr/core/understand/software-center) nor do they require IT admins to enforce. If your organization has a workflow to test builds of the classic Outlook before releasing new them, the best practice is to enroll part of your organization in Targeted Release.

## Looking ahead at features coming to new Outlook

The best way to see which features are coming to the new Outlook is to follow the [Microsoft 365 Roadmap](https://aka.ms/newOutlookforWindows). For detailed information about updates, including the timing of specific changes and feature release statuses in your organization, subscribe to these updates in the Microsoft 365 [Message Center](/microsoft-365/admin/manage/message-center).

### Predictability and timing of Targeted Release and Standard Release

In new Outlook (as with all of Microsoft 365), new features become available first in Targeted Release, and aren't rolled out to Standard Release for at least 30 days. We recommend customers use this time to prepare their organization for the update.
