---
title: "Deployment guide for OneNote"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides an overview for admins on how to deploy OneNote 2016 or OneNote for Windows 10 to users in their organization"
---

# Deployment guide for OneNote

> [!IMPORTANT]
> Based on customer feedback, we're making the following changes for OneNote 2016:
>- We're continuing mainstream support for OneNote 2016 until October 2023, which aligns with mainstream support for Office 2019. Extended support for OneNote 2016 remains the same, ending in October 2025.
>- We're adding some new features to OneNote 2016, starting with Dark Mode.
>- Beginning in March 2020, OneNote 2016 will be installed alongside the other Office apps, such as Excel and PowerPoint, when you deploy Office 365 ProPlus, Office 365 Business, or Office 2019. You will still be able to exclude OneNote 2016 from being installed.<br/><br/>
> We'll be updating this article soon to cover these new changes. In the meantime, for more information, [read this blog post](https://techcommunity.microsoft.com/t5/Office-365-Blog/Your-OneNote/ba-p/954922) from the OneNote team.


There are two Windows versions of OneNote that IT Pros can deploy to users in their organizations: OneNote 2016 and OneNote for Windows 10. Currently, OneNote 2016 is installed by default when you deploy Office 365 ProPlus, or when you deploy a volume licensed version of Office 2016, such as Office Standard 2016. OneNote for Windows 10 is installed by default on computers running Windows 10 or users can install it directly from the [Microsoft Store](https://www.microsoft.com/p/onenote/9wzdncrfhvjl?activetab=pivot%3aoverviewtab).

But, in the next several months, the following changes are coming to OneNote for new Office deployments:

- If you're deploying Office 365 ProPlus on a computer running Windows 10, OneNote 2016 will no longer be installed by default when you're installing Office 365 ProPlus from the Office 365 portal or by using Microsoft Endpoint Configuration Manager (current branch). OneNote for Windows 10 will be the default OneNote experience.
- If you're deploying Office 2019, OneNote for Windows 10 will be the default OneNote experience.

If you decide later that your users need OneNote 2016, there will be ways to add OneNote 2016, such as by using the Office Deployment Tool.
 
These changes don't affect existing installations of OneNote for Office 365 ProPlus or Office 2016. Also, these changes don’t affect other versions of OneNote, such as OneNote for Mac, OneNote for Android, or the [web version of OneNote](https://support.office.com/article/7e497458-6bf3-4de3-a362-f83636f0d5b9).

## Choose the version of OneNote to deploy to your users

There are differences between OneNote 2016 and OneNote for Windows 10. For more information, see [What's the difference between OneNote and OneNote 2016?](https://support.office.com/article/a624e692-b78b-4c09-b07f-46181958118f)

Other than features, the most significant difference is that local notebooks aren’t supported in OneNote for Windows 10. Local notebooks are OneNote files that are stored on the user’s computer or on a file share on the network. Instead, OneNote for Windows 10 notebooks must be stored in the cloud. For example, in OneDrive for Business or SharePoint Online. SharePoint Server is also supported. But, OneNote for Windows 10 always keeps a copy of notebooks cached on the user's computer so that the user can access them even when the user isn't connected to the Internet.

Other factors that might require you to keep users on OneNote 2016 include computers running Windows 7 or Windows 8 or the use of COM add-ins with OneNote. Microsoft has updated its add-ins for OneNote, such as providing integration with Outlook, to work with OneNote for Windows 10.

> [!NOTE]
> If your users are still using computers that are running Windows 7 or Windows 8, the recommended and most up-to-date OneNote experience on those versions of Windows is the [web version of OneNote](https://support.office.com/article/7e497458-6bf3-4de3-a362-f83636f0d5b9).

Keep in mind that OneNote 2016 is no longer being updated with new features and there won’t be a OneNote 2019. OneNote 2016 will continue to receive other updates, like critical fixes and security updates, while it’s still supported. Mainstream support for OneNote 2016 ends in October 2020, and extended support ends in October 2025.

Users can use both OneNote 2016 and OneNote for Windows 10 on the same computer. While the two OneNote versions store their notebooks separately, with two different caches on the user’s computer, both versions can open the same cloud-based notebooks and stay in sync if the user is connected to the Internet. Users can [set which OneNote version is the default](https://support.office.com/article/f261140c-5ce8-4cf4-ad0b-c9e1cb953831) on their computer.

## How to deploy OneNote 2016

You can use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) or enterprise deployment software, such as Configuration Manager, to deploy Office 365 ProPlus with OneNote 2016.

By default, OneNote 2016 is installed when you deploy Office 365 ProPlus by using the Office Deployment Tool. If you don't want OneNote 2016 installed, include the [ExcludeApp element](configuration-options-for-the-office-2016-deployment-tool.md#excludeapp-element) in the configuration.xml file that's used by the Office Deployment Tool.

If you're using Configuration Manager (current branch) and the Office 365 Installer to deploy Office 365 ProPlus, be sure that OneNote 2016 is selected to be included as part of the installation of Office 365 ProPlus. Currently, OneNote 2016 is installed by default when using the Office 365 Installer.

In the coming months, when OneNote for Windows 10 becomes the default version for new Office 365 ProPlus deployments, you'll need to keep these things in mind:

- If you're installing Office 365 ProPlus with the Office Deployment Tool, OneNote 2016 will still be installed by default.
- If you're using the Office 365 Installer in Configuration Manager (current branch), OneNote 2016 will be excluded, by default, from installations of Office 365 ProPlus. But, you can easily include OneNote 2016 as part of the installation by making a simple setting change in the Office 365 Installer UI. *(Older versions of the Office 365 Installer will still include OneNote 2016 by default, but you can exclude OneNote 2016 with a simple setting change in the UI.)*
- If you're installing Office 365 ProPlus from the Office 365 portal, OneNote 2016 won't be installed. There will be no way to include OneNote 2016 when installing from the Office 365 portal.
- If OneNote 2016 isn't installed, but your users need to start using it, you can install OneNote 2016 by using the Office Deployment Tool. When you run the Office installation process again on that computer, it will add OneNote 2016 without doing a complete reinstallation of Office 365 ProPlus. You can also install OneNote 2016 by using Configuration Manager (current branch) if you have selected OneNote 2016 in the Office 365 Installer UI.  

> [!NOTE]
> The information in this section also applies if you're deploying a volume licensed version of Office 2019. 


## How to deploy OneNote for Windows 10

OneNote for Windows 10 is installed by default on computers running Windows 10 or users can install it directly from the [Microsoft Store](https://www.microsoft.com/p/onenote/9wzdncrfhvjl?activetab=pivot%3aoverviewtab). Updates to OneNote for Windows 10 come directly from the Microsoft Store.

If you don’t want your users to install apps directly from the Microsoft Store, you can set up the Microsoft Store for Business in your organization. This allows you to control which Microsoft Store apps your users can install, including OneNote for Windows 10. For more information, see [Microsoft Store for Business overview](https://docs.microsoft.com/microsoft-store/microsoft-store-for-business-overview).

If you plan to move your users to OneNote for Windows 10, make sure their notebooks have been moved to a cloud storage location, such as OneDrive for Business. To do that, you can provide them the instructions in [Move OneNote notebooks from your computer to OneDrive](https://support.office.com/article/b43692ae-ce27-4ab9-a8ad-a2aed225e6a5). 


## When does OneNote for Windows 10 become the default version that's installed?

The change to the default installation behavior for OneNote will take effect at different times, depending on which version of Office you’re deploying to your users. 

If you’re deploying Office 2019 to your users, OneNote for Windows 10 will be the default. 

If you’re deploying Office 365 ProPlus to users on Windows 10, when OneNote for Windows 10 becomes the default installation depends on which [update channel](overview-of-update-channels-for-office-365-proplus.md) you’re using. The following are the approximate dates for each update channel:
 - Monthly Channel: by end of September 2018
 - Semi-Annual Channel (Targeted): by end of September 2018
 - Semi-Annual Channel: January 2019

The dates for Office 365 ProPlus also apply if you allow your users to install Office 365 ProPlus for themselves from the Office 365 portal. The default update channel for those installs is Semi-Annual Channel.


## Additional information about deploying OneNote

**Configure OneNote 2016 settings:** You can use Group Policy to configure certain OneNote 2016 settings for your users. To do that, download the latest [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center and implement those policy settings by using Active Directory Domain Services (AD DS). Group Policy can't be used with OneNote for Windows 10.

**Office 365 Business:** These changes also apply to Office 365 Business, which is the version of Office that comes with some Office 365 plans, such as Business Premium.

**Supported languages:** While both OneNote 2016 and OneNote for Windows 10 are available in most of the same languages, there are a few differences. The list of supported languages are available here: [OneNote 2016](https://support.office.com/article/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Desktop), [OneNote for Windows 10](https://support.office.com/article/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Windows_Phone)

## Related topics

- [Frequently Asked Questions about OneNote in Office 2019](https://support.office.com/article/6582c7ae-2ec6-408d-8b7a-3ed71a3c2103)
- [What's new in OneNote for Windows 10](https://support.office.com/article/1477d5de-f4fd-4943-b18a-ff17091161ea)
- [The best version of OneNote on Windows](https://techcommunity.microsoft.com/t5/Education-Blog/The-best-version-of-OneNote-on-Windows/ba-p/183726)
- [OneNote help center](https://support.office.com/OneNote)
- [OneNote info for developers](https://developer.microsoft.com/onenote)