---
title: "Overview of the new Outlook for Windows"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection:
- Tier3
- deploy-new-outlook
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides an overview of the new Outlook for Windows"
ms.date: 11/09/2023
---

# Overview of the new Outlook for Windows

The new Outlook for Windows is reimagined to be more agile, deliver faster feature deployment and availability, and provide a consistent experience in Windows.

New Outlook is currently offered as a preview for commercial accounts and is generally available for consumer accounts. For more user support information, see [Getting started with the new Outlook for Windows](https://support.microsoft.com/office/656bb8d9-5a60-49b2-a98b-ba7822bc7627).

## Architecture

The new Outlook for Windows, built upon modern service architecture, is inspired by the Outlook web experience. It operates within a streamlined Native Windows Integration Component and utilizes WebView2. For more information, see [Microsoft Edge WebView2 and Microsoft 365 Apps](../deploy/webview2-install.md).

## COM add-ins

In new Outlook for Windows, COM add-ins aren't supported in new Outlook for Windows. COM add-ins can manipulate Outlook in many ways and often led to instability and crashes in Outlook. Web add-ins provide a sandbox environment for add-ins to operate in with checks and balances in place to ensure Outlook is more stable and robust. Existing web add-ins are fully supported, with no extra work required from partners. If you have a web add-in, nothing else is required to transition to the new client.  

For more information, see [Identify COM add-ins in your organization](./get-started/state-of-com-add-ins.md).

## Feature delivery

New functionality is flighted to different release rings, as is the case for Microsoft 365 for the web. Some tenants or individual users in organizations could opt to get early access to features by enrolling in the Targeted release. Build updates don’t go through the same channels as the classic Outlook for Windows system, nor do they control new feature delivery. With service-delivered changes, features and fixes can be deployed faster and more reliably. With classic Outlook, customers were concerned with the cadence of deployment mostly because it took days or weeks to get available fixes. The new Outlook for Windows delivers critical updates within hours. For more information, see [Set up the Standard or Targeted release options](/microsoft-365/admin/manage/release-options-in-office-365).

For updates about features that are rolling out, refer to the [Microsoft 365 Roadmap](https://aka.ms/newOutlookforWindows).

## Packaging

The new Outlook for Windows is delivered as an MSIX package. Users acquire the package through the Outlook entry in the Microsoft Store app. For custom deployment by system administrators, the package is made available for manual or scripted installation. For more information, see [What is MSIX?](/windows/msix/overview)

In addition to the MSIX packaging, setup.exe is also available. Setup.exe simplifies the deployment matrix since it contains a complete set of the required packages. In general, MSIX requires a separate package for each platform. As such, setup.exe is preferred for deployments. MSIX and Windows Package Manager (winget) options are provided because some tenants already have solutions that use these options. For more information, see [Deployment overview for the new Outlook for Windows](/microsoft-365-apps/outlook/get-started/deployment-new-outlook).

## Windows integration

As highlighted earlier, new Outlook is a native application, based on WebView2. The experience is provided by Outlook on the web but is given access to local machine resources through the Native Windows Integration Component. With this approach, features and scenarios previously inaccessible to web apps can be implemented in the new Outlook for Windows. A few examples are rich notifications and more complete access to files and local resources.

Windows integration is managed by a small component that updates in the background. Updates are delivered approximately every week from the Office Content Delivery Network (CDN). In the past, such a fast update cadence would be challenging for large deployments due to the validation steps most enterprises undertake. This update cadence is less of a concern for new Outlook because almost none of the feature implementations are in this Windows integration component. It serves as a thin application only providing access to local machine resources.

Consistent with many service-based architectures, the client and service remain close in version. If updates can’t be applied for an extended period, users could see an error message that new Outlook isn't compatible with the current service. If this error occurs, users can close and reopen the application to apply the latest update.

Organizations used to distribute updates for classic Outlook from a custom local network location, but this practice is now obsolete and unnecessary due to the reduced package size.
