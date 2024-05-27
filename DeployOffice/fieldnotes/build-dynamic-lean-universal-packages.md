---
title: Build dynamic, lean, universal packages for Microsoft 365 Apps
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "How to provide additional language packs, proofing tools, products like Visio and Project, or other components of Microsoft 365 Apps to your users with minimal maintenance overhead"
ms.date: 05/25/2024
---

# Build dynamic, lean, and universal packages for Microsoft 365 Apps

> [!NOTE]
> Authored by the Microsoft 365 Apps Rangers, this article outlines common practices observed across customer implementations. We advise assessing the relevance of this guidance for your organization and adapting the approach as necessary.
   
As an admin, you might plan to deploy Microsoft 365 Apps in your organization. Such a deployment is often more than just pushing the basic Microsoft 365 Apps to devices. Users might need additional components, for example, language packs, proofing tools or additional products like Visio or Project. We often refer to these scenarios as **2nd installs**, while the initial installation of Microsoft 365 Apps is often called **1st install**. For 1st install scenarios, have a look at the [install options](install-options.md) and the best way to [right-size your deployment](right-sizing-initial-deployment.md).

This article shows you how can greatly reduce long-term maintenance costs and improve user satisfaction by implementing 2nd installs with dynamic, lean, and universal packages for Microsoft 365 Apps.
 
## The challenge
Historically, the task of supporting 2nd install scenarios was solved by creating a dedicated installation package for each. Usually, an admin would combine the necessary source files (of ~3 gigabytes) with a copy of the Office Deployment Tool (ODT) and a configuration file tailored for the scenario.

But, especially in larger organizations, you often don't have a single configuration set of Microsoft 365 Apps. You might have a mix of update channels, for example, the majority is on Monthly Enterprise Channel and a few special-purpose devices is on Semi-Annual Enterprise Channel. Maybe you're currently transitioning from 32-bit to 64-bit, and you have to support both architectures for some time.

If you build a dedicated, for example, Language Pack deployment for each channel and architecture in the previous example, you would end up with four packages: Monthly Enterprise Channel x86, Monthly Enterprise Channel x64, Semi-Annual Enterprise Channel x86, Semi-Annual Enterprise Channel x64. This isn't a sustainable approach and has the following disadvantages:

- High maintenance costs due
    - High number of packages to create and maintain.
    - Embedded source files get outdated over time and need servicing.
    - High bandwidth consumption during deployment, as the full 3 GB package is synchronized to the device before the actual installation starts.
- Bad user experience
    - Users have to understand their current configuration and pick the matching package from the software portal.
    - Long deployment time as full source files are synchronized first.
    - If embedded source files are outdated, the installation will downgrade the full installation, before the update cycle kicks in and updates all apps again.

So, how do you build packages that are less costly to maintain over time and are more user friendly?

## The solution: Dynamic, lean, and universal packages

You can resolve these issues by implementing self-adjusting, small, and universal packages. Let's cover the basic concepts before we dive into sample scenarios.

Build **dynamic** packages where you don’t hard-code anything. Use features of the [Office Deployment Tool (ODT)](https://go.microsoft.com/fwlink/p/?LinkID=626065) to enable the packages to self-adjust to the requirements:
- Use [Version=MatchInstalled](https://techcommunity.microsoft.com/t5/Office-365-Blog/New-feature-Make-changes-to-Office-deployments-without-changing/ba-p/816482) to prevent unexpected updates and stay in control of the version installed on a client. No hard coding of a build number, which gets outdated quickly.
- Use [Language=MatchInstalled](https://techcommunity.microsoft.com/t5/Office-365-ProPlus/Dynamically-match-already-existing-languages-when-installing/m-p/716927) to instruct, for example,  Visio or Project to install with the same set of languages as Office is already using. No need to list them or build a script that injects the required languages.
 
Build **lean** packages by removing the source files from the packages. This has multiple benefits:

- Package size is smaller, from 3 GB down to less than 10 megabytes for the ODT and its configuration file.
- Instead of pushing a 3-GB install package to clients, you let clients pull what they need on demand from Office Content Delivery Network (CDN), which saves bandwidth.
   - When you add Project to an existing Microsoft 365 Apps installation, you need to download less than 50 megabytes, as Office shared components are already installed.
   - Visio installs are typically 100-200 megabytes, based on the number of languages, as the templates/stencils are a substantial part of the download.
   - Installing proofing tools is typically 30-50 megabytes, versus a full language pack, which is 200-300 megabytes.
- A second install scenario is often less frequent, which lowers the internet traffic burden, ultimately reducing the impact.
- You don’t have to update the source files every time Microsoft releases new features or security and quality fixes.
 
Build **universal** packages by not hard coding things like the architecture or update channel. ODT will dynamically match the existing install, so your packages work across all update channels and architectures. Instead of having four packages to install Visio, for example, you have a single, universal package that works across all permutations of update channels and architectures.
- Leaving out [OfficeClientEdition](https://techcommunity.microsoft.com/t5/Office-365-ProPlus/Insights-into-OfficeClientEdition-and-how-to-make-it-work-for/m-p/767577) makes your package universal for mixed x86/x64 environments.
- Leaving out [Channel](https://techcommunity.microsoft.com/t5/Office-365-ProPlus/Understanding-the-Channel-attribute-of-the-Office-Deployment/m-p/813604) makes your package universal across update channels.
 
## How to build and benefit from building dynamic, lean, and universal packages

The idea is to not hardcode anything in the configuration file, but to instead utilize the cleverness of the Office Deployment Tool as much as possible.

Let’s have a look at a "classic" package that was built to add Project to an existing install of Microsoft 365 Apps. We have the source files (of ~3 gigabytes) and a configuration file, which explicitly states what we want to achieve:

:::image type="content" source="./media/build-dynamic-lean-universal-packages/build-dynamic-lean-universal-packages-1.png" alt-text="A screenshot of a sample package.":::

```xml
<Configuration>
 <Add OfficeClientEdition="64" Channel="MonthlyEnterprise">
  <Product ID="ProjectProRetail">
   <Language ID="en-us" />
  </Product>
 </Add>
 <Display Level="None" />
</Configuration>
```
 
When we apply the concepts of dynamic, lean, and universal packages, the result would look like this:
 
:::image type="content" source="./media/build-dynamic-lean-universal-packages/build-dynamic-lean-universal-packages-2.png" alt-text="A screenshot of a lean sample package.":::

```xml
<Configuration>
 <Add Version="MatchInstalled">
  <Product ID="ProjectProRetail">
   <Language ID="MatchInstalled" TargetProduct="O365ProPlusRetail" />
  </Product>
 </Add>
 <Display Level="None" />
</Configuration>
```

So what have we changed, and what are the benefits?

- We removed the OfficeClientEdition-attribute, as the ODT will automatically match the installed version.
   - Benefit: The configuration file now works for both x86 and x64 scenarios.
- We removed the channel for the same reason. ODT will automatically match the already-assigned update channel.
   - Benefit I: The package works for all update channels (Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel, and others).
   - Benefit II: It also works for update channels you don’t offer as central IT. Some users are running Current Channel, some are on Insider builds? Don’t worry, it just works.
- We added *Version="MatchInstalled"*, which ensures that ODT will install the same version that's already installed.
   - Benefit: You're in control of versions deployed, with no unexpected updates.
- We added *Language ID="MatchInstalled"*  and *TargetProduct* to match the currently installed languages, replacing a hard-coded list of languages to install.
   - Benefit I: The user has the same languages for Project as were already installed for Office.
   - Benefit II: No need to re-request language pack installs.
   - Benefit III: Also works for rarely used languages that you as the central IT admin don’t offer, which makes users happy.
- We removed the source files. The ODT will fetch the correct set of source files from the Office CDN just in time.
   - Benefit I: The package never gets outdated. No maintenance of source files is needed.
   - Benefit II: The download is about 50 megabytes instead of about 3 GB.
 
## Another example: Add language packs and proofing tools the dynamic, lean, and  universal way

Let’s have a brief look at other scenarios as well, like adding language packs and proofing tools. The classic configuration file to install the German Language Pack might look like this:
 
```xml
<Configuration>
 <Add OfficeClientEdition="64" Channel="MonthlyEnterprise">
  <Product ID="LanguagePack">
   <Language ID="de-de" />
  </Product>
 </Add>
 <Display Level="None" />
</Configuration>
```

Again, this configuration file would only work for one specific scenario (update channel is set to Monthly Enterprise Channel, 64-bit is installed). Other scenarios would need to be covered by additional files and packages, which drive up the complexity and cost of ownership. Fix this by just going the dynamic, lean, and universal way:

```xml
<Configuration>
 <Add Version="MatchInstalled">
  <Product ID="LanguagePack">
   <Language ID="de-de" />
  </Product>
 </Add>
 <Display Level="None" />
</Configuration>
```
 
This single configuration file works across x86/x64 and all update channels, such as Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel, and others. So, if you want to offer five additional languages in your environment, just build five of these "config file + ODT" packages. For proofing tools, you just change the ProductID to "ProofingTools".

## Build your own configuration

The above concept is universally applicable to all Click-To-Run-based installations and products, as long as the ODT is used. You can change the specified Product ID to your scenario. Check out the [list of supported Product IDs](/office365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run) for more information.

## Prerequisites/Notes

Here are some prerequisites you must meet to make this concept work in your environment and some notes:
- Use [Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065) 16.0.11615.33602 or later to enable *Version="MatchInstalled"* to work.
- The ODT must be able to locate the matching source files on the Office CDN.
- Make sure that the context you're using for running the install can traverse the proxy. For details, see [Office 365 ProPlus Deployment and Proxy Server Guidance](https://techcommunity.microsoft.com/t5/Office-365-Blog/Office-365-ProPlus-Deployment-and-Proxy-Server-Guidance/ba-p/849164).
- Make sure that the account (user or system) that's used to install the apps can connect to the internet.
- The tailored configuration files shown previously are good for installing the products (with the /configure switch), but don't work with the /download switch. This is expected, as the ODT is missing some details to perform a download (like architecture). For the above concept, there's no need to download the files beforehand.
