---
title: "Deployment guide for OneNote"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides an overview for admins on how to deploy OneNote 2016 or OneNote for Windows 10 to users in their organization"
---

# Deployment guide for OneNote

 There are two Windows versions of OneNote that IT Pros can deploy to users in their organizations: OneNote 2016 and OneNote for Windows 10. Currently, OneNote 2016 is installed by default when you deploy Office 365 ProPlus, or when you deploy a volume licensed version of Office 2016, such as Office Standard 2016. OneNote for Windows 10 is installed by default on computers running Windows 10 or users can install it directly from the [Microsoft Store](https://www.microsoft.com/p/onenote/9wzdncrfhvjl?activetab=pivot%3aoverviewtab).

But, starting with the release of Office 2019 later this year, OneNote for Windows 10 will replace OneNote 2016 as the default OneNote experience for both Office 365 ProPlus and Office 2019 on computers running Windows 10.  New installations of Office will get OneNote for Windows 10 instead of OneNote 2016. Also, existing Office 365 ProPlus users will get updated to OneNote for Windows 10 if they haven’t used OneNote 2016.

Even with this change, you’ll still be able to deploy OneNote 2016 to your users. If your users are currently using OneNote 2016, there won’t be any change for them. Also, this change doesn’t affect other versions of OneNote, such as OneNote for Mac, OneNote for Android, or OneNote Online.

## Choose the verison of OneNote to deploy to your users

There are differences between OneNote 2016 and OneNote for Windows 10. For more information, see [What's the difference between OneNote and OneNote 2016?](https://support.office.com/article/a624e692-b78b-4c09-b07f-46181958118f)

Other than features, the most significant difference is that local notebooks aren’t supported in OneNote for Windows 10. Local notebooks are OneNote files that are stored on the user’s computer or on a file share on the network. Instead, OneNote for Windows 10 notebooks must be stored in the cloud. For example, in OneDrive for Business or SharePoint Online. SharePoint Server is also supported.

Other factors that might require you to keep users on OneNote 2016 include computers running Windows 7 or Windows 8 or the use of COM add-ins with OneNote. Micosoft has updated its add-ins for OneNote, such as providing integration with Outlook, to work with OneNote for Windows 10.

> [!NOTE]
> If your users are still using computers that are running Windows 7 or Windows 8, the recommended and most up-to-date OneNote experience on those versions is [OneNote Online](https://support.office.com/article/80B7E897-88DF-49E7-8BFE-A3467A428DA0), the Web version of OneNote.

Keep in mind that OneNote 2016 is no longer being updated with new features and there won’t be a OneNote 2019. OneNote 2016 will continue to receive other updates, like critical fixes and security updates, while it’s still supported. Mainstream support for OneNote 2016 ends in October 2020, and extended support ends in October 2025.

Users can use both OneNote 2016 and OneNote for Windows 10 on the same computer. While the two OneNote versions store their notebooks separately, with two different caches on the user’s computer, they can sync with each other if the user is connected to the Internet. Users can [set which OneNote version is the default](https://support.office.com/article/f261140c-5ce8-4cf4-ad0b-c9e1cb953831) on their computer.

## How to deploy OneNote 2016

You can use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) or enterprise deployment software, such as System Center Configuration Manager, to deploy Office 365 ProPlus with OneNote 2016.

If you're using Configuration Manager (Current Branch) and the Office 365 Installer to deploy Office 365 ProPlus, be sure that OneNote is selected to be included as part of the installation of Office 365 ProPlus. In some cases, the default setting will be for OneNote to be excluded from the installation of Office 365 ProPlus.

If an existing installation of Office 365 ProPlus gets updated and OneNote 2016 is removed, but the user needs to start using OneNote 2016, you can reinstall OneNote 2016 by using the Office Deployment Tool or enterprise deployment software. When you run the Office installation process again on that computer, it will add OneNote 2016 without doing a complete reinstallation of Office 365 ProPlus.

> [!NOTE]
> The information in this section will also apply if you're deploying a volume licensed version of Office 2019 when it's released later this year. *(A specific release date for Office 2019 hasn't been announced yet.)* 


## How to deploy OneNote for Windows 10

OneNote for Windows 10 is installed by default on computers running Windows 10 or users can install it directly from the [Microsoft Store](https://www.microsoft.com/p/onenote/9wzdncrfhvjl?activetab=pivot%3aoverviewtab). Updates to OneNote for Windows 10 come directly from the Microsoft Store.

If you don’t want your users to install apps directly from the Microsoft Store, you can set up the Microsoft Store for Business in your organization. This allows you to control which Microsoft Store apps your users can install, including OneNote for Windows 10. For more information, see [Microsoft Store for Business overview](https://docs.microsoft.com/microsoft-store/microsoft-store-for-business-overview).

If you plan to move your users to OneNote for Windows 10, make sure their notebooks have been moved to a cloud storage location, such as OneDrive for Business. To do that, you can provide them the instructions in [Move OneNote notebooks from your computer to OneDrive](https://support.office.com/article/b43692ae-ce27-4ab9-a8ad-a2aed225e6a5). 


## When does OneNote for Windows 10 become the default version that's installed?

The change to the default installation behavior for OneNote will take effect at different times, depending on which version of Office you’re deploying to your users. 

If you’re deploying Office 2019 to your users, OneNote for Windows 10 will be the default when Office 2019 is released later this year. *(A specific release date for Office 2019 hasn’t been announced yet.)* 

If you’re deploying Office 365 ProPlus to users on Windows 10, when OneNote for Windows 10 becomes the default installation depends on which [update channel](overview-of-update-channels-for-office-365-proplus.md) you’re using. The following are the approximate dates for each update channel:
 - Monthly Channel: September 2018
 - Semi-Annual Channel (Targeted): September 2018
 - Semi-Annual Channel: January 2019

The dates for Office 365 ProPlus also apply if you allow your users to install Office 365 ProPlus for themselves from the Office 365 portal. The default update channel for those installs is Semi-Annual Channel.

## Additional information about deploying OneNote

**Checking if OneNote 2016 is being used:** If your users are currently using OneNote 2016, OneNote for Windows 10 won't replace OneNote 2016 on their computers. How do we know if the user has used OneNote 2016? We look at the following things to determine that:

- Is the "first run" key for OneNote 2016 enabled in the registry for the current user?
- Does any user on the computer have a “OneNote Notebooks” folder in the root of their Documents folder? 
- Has OneNote 2016 sent a message to the Office Updater identifying that it’s been used on that computer? *(Requires Office 365 ProPlus with the June 2018 update.)*

If any of these are true, OneNote 2016 will be identified as “in use” and we won't update that computer to OneNote for Windows 10. We'll always err on the side of caution, so we won’t take any action if there’s any reason for us to suspect that OneNote 2016 has been used before on that computer.

**Configure OneNote 2016 settings:** You can use Group Policy to configure certain OneNote 2016 settings for your users. To do that, download the latest [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center and implement those policy settings by using Active Directory Domain Services (AD DS). Group Policy can't be used with OneNote for Windows 10.

**Office 365 Business:** These changes also apply to Office 365 Business, which is the version of Office that comes with some Office 365 plans, such as Business Premium.

## Related topics

- [Frequently Asked Questions about OneNote in Office 2019](https://support.office.com/article/6582c7ae-2ec6-408d-8b7a-3ed71a3c2103)
- [What's new in OneNote for Windows 10](https://support.office.com/article/1477d5de-f4fd-4943-b18a-ff17091161ea)
- [The best version of OneNote on Windows](https://techcommunity.microsoft.com/t5/Education-Blog/The-best-version-of-OneNote-on-Windows/ba-p/183726)
- [OneNote help center](https://support.office.com/OneNote)
- [OneNote info for developers](https://developer.microsoft.com/onenote)