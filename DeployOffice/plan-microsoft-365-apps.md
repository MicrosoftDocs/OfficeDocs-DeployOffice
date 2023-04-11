---
title: "Plan your enterprise deployment of Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "This article gives step-by-step instructions for how to plan your deployment of Microsoft 365 Apps. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
ms.date: 02/15/2023
---

# Plan your enterprise deployment of Microsoft 365 Apps

Follow the steps in this article to choose how to deploy Microsoft 365 Apps and how to manage updates, and whether to deploy Microsoft 365 Apps from the cloud, with Configuration Manager or from a local source on your network. 

## Before you begin 

If you haven't already, complete the [assessment of your environment and infrastructure](assess-microsoft-365-apps.md). This assessment helps you make key decisions as part of planning your deployment.

## Step 1 - Choose how to deploy

First choose which deployment tool to use and whether to install from the cloud or from a local source on your network.

> [!NOTE]
> **Best practice:** Microsoft recommends to deploy Microsoft 365 Apps from the cloud, using the portal or Microsoft Intune.

You can also manage your deployment from the Microsoft 365 portal and have your users install the Microsoft 365 Apps on their client devices [directly from the portal](https://www.microsoft365.com/). This method requires the least amount of administrative setup, but gives you less control over the deployment. You can, however, still define how frequently your users receive feature updates. For more information, see [Manage Microsoft 365 installation options in the Microsoft 365 admin center](manage-software-download-settings-office-365.md). This option requires that your users have local administrative rights on their client devices.

If this option isn't feasible due to the number of devices you manage or because users don't have administrative permissions on their devices, you should consider using [Microsoft Intune](/mem/intune/apps/apps-add-office365) to deploy Microsoft 365 Apps. Check out [this video](https://youtu.be/fA8lcnRXmkI) and the [Intune documentation](/mem/intune/apps/apps-add-office365) to learn more about deploying the Microsoft 365 Apps this way.

You can also use Configuration Manager to deploy from local Distribution points. This reduces the network load on your internet links. We recommend using the latest current branch release. 

For organizations that don't have Configuration Manager but still want to manage their deployment, we recommend using the Office Deployment Tool (ODT). You can use the ODT as a standalone tool or you can use it to download installation files that can be deployed using third-party software deployment tools. In either case, the ODT provides control over installation, updates, and settings. For more information, see [Overview of the Office Deployment Tool](overview-office-deployment-tool.md).

If you use the ODT and have the network capacity, we recommend deploying Microsoft 365 Apps from the cloud. Doing so minimizes your administrative overhead. If you don't have the network capacity to install on client devices from the cloud, you can use the ODT to download the installation files to a local source on your network and install from there. But this approach introduces more complexity into your deployment and isn't recommended.


Choose how you want to deploy:

- **Self-install from the cloud:** Manage your deployment from the Microsoft 365 portal and have your users install the apps on their client devices directly from the portal.

- **Deploy from the cloud using Intune:** Manage your deployment through Intune and automate the configuration and installation of the Microsoft 365 Apps.

- **Deploy from a local source with Configuration Manager:** Manage your deployment with Configuration Manager, and download and deploy from distribution points on your network.

- **Deploy from the cloud with the Office Deployment Tool:** Manage your deployment with the ODT, and install on client devices directly from the Office CDN.
 
- **Deploy from a local source with the Office Deployment Tool:** Manage your deployment with the ODT, and download and deploy from a local source on your network. 

Many organizations use a combination of these options for different users. For example, an organization might use Intune to deploy Microsoft 365 Apps to most of their users, but enable self-install for a small group of workers who aren't using managed devices.
 
## Step 2 - Choose how to manage updates

> [!NOTE]
> **Best practice:** We recommend updating your client devices automatically.  You can define the frequency of the feature updates, but the updates occur without any administrative overhead. If you want to take more control and get additional insights into e.g. the progress of an update deployment, we recommend usinga [servicing profile](admincenter/servicing-profile.md).

We recommend updating your client devices automatically from the Office CDN. You can still control the frequency of the feature updates, as those settings are defined as part of the initial deployment, but the updates themselves occur without any additional tools or administrative overhead. In addition, the updates are automatically deployed over a number of days to conserve your network bandwidth.

You can also use Intune to apply additional policies. For example, to set a deadline after how many days an update installation should be enforced. Review the [Intune documentation](/mem/intune/configuration/administrative-templates-update-office) on how to apply ADMX settings to devices.

The third, cloud-based option is to leverage a [servicing profile](admincenter/servicing-profile.md). It's a cloud-based update management solution for devices on Monthly Enterprise Channel. It includes features like advanced monitoring, reporting, enforcing, staggering, and rolling back devices.

If you need to distribute updates from an on-premises source, you can do so with Configuration Manager by downloading the updates and deploying them from distribution points. If you use a previous version of Configuration Manager, we recommend you upgrade to the current branch.

If you don't have Configuration Manager, you can use the ODT to download updates to a local source on your network and deploy them from there. This option requires the most administrative overhead, as you need to manage update packages for different update channels, architectures, and platforms. We suggest this option only when your network capacity is too limited to update from the cloud and other solutions aren't available.

Choose how to manage updates:

- **Update automatically:** Client devices are automatically updated directly from the Office CDN based on the update channel you define as part of the initial deployment.  

- **Manage updates with Intune:** Use Intune to set policies on devices, which control how and when those should get updates from the cloud. 

- **Manage updates with a servicing profile:** When using the Monthly Enterprise Channel, a servicing profile gives you the most comprehensive toolset to manage updates from the cloud. 

- **Manage updates with Configuration Manager:**  Updates are downloaded and deployed to client devices by Configuration Manager. 

- **Manage updates with the Office Deployment Tool:** Updates are downloaded to a local source by the ODT and then installed on client devices. 
    
As with the initial deployment, organizations can use a combination of these options for different users.

For more information, see [Choose how to deliver updates for the Microsoft 365 Apps](./fieldnotes/choose-how-to-deliver-updates.md).

## Step 3 - Choose your update channels

With Microsoft 365 Apps, you can control how frequently your users receive feature updates to their applications. To do so, you choose an update channel for your users:

- **Current Channel:** Provides users with the latest features as soon as they're ready, but on no set schedule.

- **Monthly Enterprise Channel:** Provides users with the latest features once a month and on a predictable schedule (the second Tuesday of the month)

- **Semi-Annual Enterprise Channel:** Provides users a roll-up of features every six months, in January and July.

> [!NOTE]
> The "[Explained - Microsoft 365 Apps Update Channels](https://youtu.be/eNn4PDkmo7s)" video gives you a complete overview of all update channels.

We recommend Current Channel, because it provides your users with the newest features as soon as they're ready. If you need additional predictability of when new features are released, we recommend Monthly Enterprise Channel with a [servicing profile](./admincenter/servicing-profile.md). By using a servicing profile, you’ll automatically deliver monthly Microsoft 365 Apps updates for specific users or groups in waves, limiting the impact on your network. In those cases where you've selected devices that require extensive testing before receiving new features, we recommend Semi-Annual Enterprise Channel.

All the update channels receive updates for security and non-security issues when needed. These updates usually occur on the second Tuesday of the month.

For more information, see [Overview of update channels for Microsoft 365 Apps](updates/overview-update-channels.md).

To preview or test new updates before deploying them to your entire organization, you have two options:

- Deploy the update in a staged manner. For example, on the release day to a handful of devices, then after a few days extend to a sample set across your organization and then to the remaining devices in two additonal waves. When using Monthly Enterprise Channel and a servicing profile, this can be automated by using [custom rollout waves](./admincenter/servicing-profile.md#create-rollout-waves).

- Deploy a combination of update channels where one channel receives new features earlier than the other. For example, deploy Current Channel (Preview) to a subset of your users for validation and Current Channel to the bulk of your devices. In that scenario, users with Current Channel usually receive feature updates just a few weeks after the users with Current Channel (Preview).
 
## Step 4 - Define your installation packages

> [!NOTE]
> **Best practices:**
> - Build as few installation packages as possible to reduce administrative overhead. Allow the installation process to fetch the installation files from the cloud, so you don't have to include and maintain them. If you need e.g. different update channels, go with one package and switch the update channel later with one of the [available options to change update channels](updates/change-update-channels.md).
>
> - If you need additional products to be installed during an upgrade, like Visio or Project, use [MSICondition](office-deployment-tool-configuration-options.md#msicondition-attribute-part-of-product-element) in combination with [RemoveMSI](upgrade-from-msi-version.md) to dynamically add the products based on the previously installed ones.
>
> - If you need additional products (like Visio or Project) or language packs being available, build [lean and dynamic installations](./fieldnotes/build-dynamic-lean-universal-packages.md) to add those later.

Build the installation packages using the [Office Customization Tool](./admincenter/overview-office-customization-tool.md) and the Office Deployment Tool. By default, the resulting packages would download the required files during installation.

If downloading the files during install time isn't feasible in your environment, you can use the /download switch to download the required source files upfront and embed them in your installation package. Note that doing this requires you to maintain and update the embedded sources on a regular base, increasing maintenance effort.

To package languages, we recommend identifying required languages in each region. You can deploy these languages directly as part of the first installation. You can also install the language that matches the operating system of the client device. For more information, see [Install the same languages as the operating system](overview-deploying-languages-microsoft-365-apps.md#install-the-same-languages-as-the-operating-system).

After you've deployed Office with the required languages, you can install additional language accessory packs at any time by choosing one of the following:

- Have your users download and install the language accessory packs that they need from the Microsoft 365 portal (requires local administrator permissions).
- Set and assign the policy "Allow users who aren’t admins to install language accessory packs" to your users. This enables them to install language packs through the apps UI themselves.
- Use Intune, Configuration Manager, or the Office Deployment Tool to deploy the appropriate language accessory packs to your users.

For more information, see [Overview of deploying languages for Microsoft 365 Apps](overview-deploying-languages-microsoft-365-apps.md).

For details on which architecture to choose, see [Choose the 32-bit or 64-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).

If you have the subscription versions of the Project and Visio desktop apps, continue to use those. If you have the volume licensed versions of Project and Visio, we recommend you upgrade to the subscription versions. If you need to keep using a volume licensed version of Project or Visio, see [Supported scenarios for installing different versions of Office, Project, and Visio on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md).

## Step 5 - Plan your upgrade from existing versions of Office 

> [!NOTE]
> **Best practice:** Allow the Microsoft 365 Apps setup to automatically uninstall any existing MSI-based version of Office, Visio and Project. We do not recommend to run Microsoft 365 Apps in parallel with MSI-based Office on the same device.

To help you remove prior versions of Office that use Windows Installer (MSI) as the installation technology, you can use the Office Deployment Tool and specify the RemoveMSI element to automate the removal with your Microsoft 365 Apps deployment package. For details see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).

## Step 6 - Plan for shared computers (optional)

> [!NOTE]
> **Best practice:** For shared computer scenarios, such as VDI, enable shared computer activation when deploying Microsoft 365 Apps.

If your organization has a virtual desktop infrastructure (VDI) implementation, or you have users that share workstations (for example, shift workers), you need to enable shared computer activation for those devices when you deploy Microsoft 365 Apps. 

With shared computer activation enabled, any user that is assigned a Microsoft 365 Apps license can sign in to the device and use the apps, such as Word or Excel. For more information, see [Overview of shared computer activation for Microsoft 365 Apps](overview-shared-computer-activation.md).

## Review exit criteria

Before beginning your deployment, make sure you've completed the planning exit criteria:

|Plan               |Completed?        |
|-------------------|------------------|
|Choose how to deploy                             |**Y/N**|
|Choose how to manage updates                     |**Y/N**|
|Choose your update channels                      |**Y/N**|
|Define your source files                         |**Y/N**|
|Define your deployment groups                    |**Y/N**|
|Plan your upgrade                                |**Y/N**|
|Plan for shared computers                        |**Y/N**|

## Next step

Depending on your deployment  plan, go to one of the following articles:

- [Deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)](deploy-microsoft-365-apps-configuration-manager.md)
- [Deploy Microsoft 365 Apps from the cloud](deploy-microsoft-365-apps-cloud.md)
- [Deploy Microsoft 365 Apps from a local source](deploy-microsoft-365-apps-local-source.md)
- [Self-install Office from the cloud](https://support.microsoft.com/office/4414eaaf-0478-48be-9c42-23adc4716658)
