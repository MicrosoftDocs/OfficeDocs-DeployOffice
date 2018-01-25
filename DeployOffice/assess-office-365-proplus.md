---
title: "Assess your Deployment of Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 1/31/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid:
description: "This article gives step-by-step instructions for how to plan your deployment of Office 365 ProPlus with System Center Configuration Manager. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
---

# Assess your environment and requirements for deploying Office 365 ProPlus with System Center Configuration Manager

Follow the steps in this article to assess your environment and requirements prior to deploying Office 365 ProPlus in your organization. This assessment will help you make key decisions as part of planning your deployment.

In addition to this guidance, we recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs. Migration assistance for mail and files is available with the purchase of 500 or more seats.

## Step 1 - Assess your client infrastructure and system requirements

Review the number, distribution, and details of your client devices, including operating systems, architectures, existing versions of Office that are installed, and required languages.

As part of this review, make sure that your client devices meet or exceed the minimum system requirements for installing Office 365 ProPlus. The Office 365 ProPlus requirements are the same as [the requirements for Office Professional Plus 2016](https://products.office.com/en-us/office-system-requirements#Office2016-suites-section).

In addition, you should review the system requirements for your Office server workloads. For example, Exchange 2007 does not support Outlook 2016. For more details, see [Exchange Server Supportability Matrix](https://technet.microsoft.com/library/ff728623(v=exchg.150).aspx) and [System Requirements for Office server products](https://products.office.com/en-US/office-system-requirements).

## Step 2 - Assess your Office 365 licensing and accounts

Make sure that all your users have Office 365 accounts and licenses, and that those licenses include Office 365 ProPlus. For more details, see [Deploy Office 365 Enterprise for your organization](https://support.office.com/en-us/article/Deploy-Office-365-Enterprise-for-your-organization-ee73dafb-be54-492e-bcfd-0fbfb5f65e94?ui=en-US&rs=en-US&ad=US).

## Step 3 - Assess your network capability

Review your network capability, including bandwidth and distribution of client devices, based on the following considerations:

- Deploying Office 365 ProPlus: The installation files for Office 365 ProPlus are approximately 850 mb for the core files plus approximately 200 mb for each language deployed. 
- Managing updates to Office 365 ProPlus: Channel updates vary in size, but you can review recent download sizes [here] (https://support.office.com/en-us/article/Download-sizes-approximate-for-channel-updates-to-Office-365-ProPlus-190f41e4-064d-486b-9c95-db08f973687c). For details on the frequency and type of updates based on channel, see [Overview of the update process for Office 365 ProPlus](overview-of-the-update-process-for-office-365-proplus.md). 
- Deploying multiple languages: Language accessory packs are approimxately 200 MB per language.
- Authenticating client devices: Client devices require internet access at least once every thirty days to authenticate their Office 365 ProPlus subscription. 

In addition, Office 365 ProPlus requires the following ports and protocols to be open: [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US).

## Step 4 - Assess application compatibility

Identify your Office add-ins--including VBA scripts, macros, third-party add-ins, and complex documents and spreadsheets--and assess their compatibility with Office 365 ProPlus. In particular, you should:

- Use [Office telemetry](https://technet.microsoft.com/EN-US/library/ff394407(v=office.16).aspx) to discover the add-ins, including which documents and solutions are being used most often and by the most people.
- Work with your business groups to prioritize the critical add-ins.
- Test the critical add-ins for compatability with the [Readiness Toolkit](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md). 
 
As part of the [planning article](plan-deploy-office-365-proplus-with-Configuration-Manager.md), you will define an update process that tests your add-ins with future Office updates. 

## Step 5 - Review new Group policy settings

If you plan to configure and manage Office with Group Policy settings, review the Administrative Template files (ADMX/ADML) for Group Policy settings for Office 365 ProPlus. You can download an [Excel file](https://www.microsoft.com/en-us/download/details.aspx?id=49030) that lists all the Group Policy settings and the new policy settings for Office 365 ProPlus. Note that all Group Policy settings for Office are now located in HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0 and HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0.

## Step 6 - Review exit criteria

Before creating your deployment, make sure you've completed all the steps for assessing your environment and requirements.

|Assessment         |Details                     |
|-------------------|----------------------------|
|Number of clients                                ||
|Distribution of clients                          ||
|Operating systems                                ||
|Architectures (32-bit and 64-bit)                ||
|Required languages                               ||
|Existing versions of Office                      ||
|System requirements                              |Client requirements match those for [Office Professional Plus 2016](https://products.office.com/en-us/office-system-requirements#Office2016-suites-section)<br>[System Requirements for Office server products](https://products.office.com/en-US/office-system-requirements)|
|Office 365 licensing and accounts                |All users have accounts and Office 365 licenses that include Office 365 ProPlus.<br> For more details, see [Deploy Office 365 Enterprise for your organization](https://support.office.com/en-us/article/Deploy-Office-365-Enterprise-for-your-organization-ee73dafb-be54-492e-bcfd-0fbfb5f65e94?ui=en-US&rs=en-US&ad=US).|
|Network                                          ||
|Application compatibility                        ||
|Group policy settings                            ||

## Next steps

[Plan your deployment of Office 365 ProPlus with System Center Configuration Manager](plan-deploy-office-365-proplus-with-Configuration-Manager.md)f.


