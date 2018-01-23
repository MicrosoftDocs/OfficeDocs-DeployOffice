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
ms.assetid: b18a9110-0d14-46ec-af54-a22793ef6b38
description: "This article gives step-by-step instructions for how to plan your deployment of Office 365 ProPlus with System Center Configuration Manager. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
---

# Assess your environment and requirements for deploying Office 365 ProPlus with System Center Configuration Manager

Follow the steps in this guide to assess your environment and requirements for deploying Office 365 ProPlus in your organization. This is the first step in deploying Office in the enterprise:

 - 1 - Assess your environment and requirements 
 - 2 - Create a deployment plan
 - 3 - Deploy 
 - 4 - Manage updates
  
In addition to this guidance, we recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs. Migration assistance for mail and files is available with the purchase of 500 or more seats.

## Step 1 - Assess your client infrastructure and system requirements

Review the number and distribution of your clients, including operating systems, architectures, existing versions of Office, and required languages.

As part of this assessment, verify that your client computers meet or exceed the minimum system requirements for installing Office 365 ProPlus. The Office 365 ProPlus requirements are the same as [the requirements for Office Professional Plus 2016](https://products.office.com/en-us/office-system-requirements#Office2016-suites-section).

In addition, you should review the system requirements for your Office server workloads. For example, Exchange 2007 does not support Outlook 2016. For more details, see [Exchange Server Supportability Matrix](https://technet.microsoft.com/library/ff728623(v=exchg.150).aspx) and [System Requirements for Office server products](https://products.office.com/en-US/office-system-requirements).

## Step 2 - Assess your Office 365 licensing and accounts

Make sure that all your users have Office 365 accounts and licenses, and that those licenses include Office 365 ProPlus. For more details, see [Deploy Office 365 Enterprise for your organization](https://support.office.com/en-us/article/Deploy-Office-365-Enterprise-for-your-organization-ee73dafb-be54-492e-bcfd-0fbfb5f65e94?ui=en-US&rs=en-US&ad=US).

## Step 3 - Assess your network

Assess your network and Office 365 ProPlus requirements, including bandwidth and the ports and protocols that need to be open.

Managing network bandwidth with System Center Configuration Manager: https://docs.microsoft.com/en-us/sccm/core/plan-design/hierarchy/manage-network-bandwidth

Office 365 ProPlus requires the following ports and protocols to be open: [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US).

As part of deployment and update management, Office 365 ProPlus also requires a reliable connection to the Office CDN.
xxxxxxx
Only the files that are different are copied down to a Download folder on the local computer, and they're downloaded in a compressed form. This helps reduce the size of the download.

The size of the download depends on several factors, such as how many security and other updates are released in a given month, and which version of Office 365 ProPlus you're updating from. For example, if you have the March version of Office 365 ProPlus installed, and you're updating to the July version, it's likely that more files are different between those two versions, than if you're updating from the June to the July version. Therefore, the download will probably be larger.
xxxxxxx

## Step 4 - Assess your System Center Configuration Manager infrastructure

Current Branch, peer cache, network support.xx

Peer cache: https://docs.microsoft.com/en-us/sccm/core/plan-design/hierarchy/client-peer-cache

## Step 5 - Assess application compatibility

We recommend that you identify your Office add-ins--including VBA scripts, macros, third-party add-ins, and complex documents and spreadsheets--and assess their compatibility with Office 365 ProPlus. In particular, you should:

- Use [Office telemetry](https://technet.microsoft.com/EN-US/library/ff394407(v=office.16).aspx) to discover the add-ins, including which documents and solutions are being used most often and by the most people.
- Work with your business groups to prioritize the critical add-ins.
- Test the critical add-ins for compatability with the [Readiness Toolkit](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md). 
- Create an update process that tests your add-ins with future Office updates. This article builds in that kind of testing to your deployment plan. 

## Step 6 - Review new Group policy settings

As with any new version of Office, there are new Administrative Template files (ADMX/ADML) for Group Policy settings. All Group Policy settings for Office are now located in HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0 and HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0.

You can download the Administrative Template files (ADMX/ADML) for Group Policy settings for Office 2016 from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=49030). The download includes an Excel file that lists all the Group Policy settings and the new policy settings for Office 2016.

## Step 7 - Review exit criteria

Before creating your deployment, make sure you've completed all the steps for assessing your environment and requirements.

|Assessment                                        |Details                                 |Best practice                           |
|--------------------------------------------------|----------------------------------------|----------------------------------------|
|Mirosoft FastTrack                                |Free with purchase of 50 or more seats of Office 365 Enterprise|Engage FastTrack early in the deployment process|
|Client infastructure and system requirements      |||
|Office 365 licensing and accounts                 |||
|Network                                           |||
|Configuration Manager infrastructure              |||
|Application compatibility                         |||
|Group policy settings                             |||

## Next steps

Create a deployment plan for deploying Office 365 ProPlus with System Center Configuration Manager.


