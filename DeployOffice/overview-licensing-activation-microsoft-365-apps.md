---
title: "Overview of licensing and activation in Microsoft 365 Apps"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Explains how to assign Microsoft 365 Apps licenses to users, and how individual installations are activated."
---

# Overview of licensing and activation in Microsoft 365 Apps

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**, starting with Version 2004. To learn more, [read this article](name-change.md). In our documentation, we'll usually just refer to it as Microsoft 365 Apps.

This article shows how to assign Microsoft 365 Apps licenses to users and how to activate installations of Office.

> [!NOTE]
> The information in this article also applies to Project Online Desktop Client and Visio Online Plan 2 (previously named Visio Pro for Office 365), which are licensed separately from Microsoft 365 Apps.  
  
Before deploying Microsoft 365 Apps to users in your organization, you must first assign licenses to those users. Each license allows a user to install Microsoft 365 Apps on up to five desktops, five tablets, and five mobile devices. Each installation is activated and kept activated automatically by cloud-based services associated with Office 365. This means you don’t have to keep track of product keys and you don’t have to figure out how to use other activation methods such as Key Management Service (KMS) or Multiple Activation Key (MAK). All you have to do is purchase enough licenses, keep your Office 365 subscription current, and make sure your users can connect to the Office Licensing Service via the internet at least once every 30 days.

If you remove a user's license (for example, if the user leaves your organization), any installations of Microsoft 365 Apps that the user had go into [reduced functionality mode](overview-of-licensing-and-activation-in-office-365-proplus.md#BKMK_ReducedFunctionalityMode). The Office Licensing Service, a part of Office 365, keeps track of which users are licensed and how many computers they've installed Office on.
     
## Assign and manage licenses

To use Microsoft 365 Apps, your users will need the appropriate license. To assign Microsoft 365 Apps licenses, do one of the following:

- Assign a license to a user directly in the Office 365 portal by selecting a check box on the licenses page for the user’s account. 

- Use Office 365 PowerShell. For more information, see [Assign licenses to user accounts with Office 365 PowerShell](https://docs.microsoft.com/en-us/office365/enterprise/powershell/assign-licenses-to-user-accounts-with-office-365-powershell).

- If you have a subscription for Azure AD Premium P1 and above, or an edition of Office 365 Enterprise E3 or Office 365 A3 or Office 365 GCC G3 and above, you can use group-based licensing with Azure AD. You can assign one or more product licenses to a group, and Azure AD ensures that the licenses are assigned to all members of the group. Any new members who join the group are assigned the appropriate licenses. When they leave the group, those licenses are removed. For more information, see  [Group-based licensing in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-licensing-whatis-azure-portal). 

After a user is assigned a license, you can deploy Office to your users or your users can install Office directly from the Office 365 portal. If the user hasn't been assigned a license, the user can't install Office from the Office 365 portal. We recommend assigning the  license 24 hours prior to the deployment so you can ensure that the license is provisioned. 

## Activating Microsoft 365 Apps

As part of the installation process, Microsoft 365 Apps communicates with the Office Licensing Service and the Activation and Validation Service to obtain and activate a product key. Each day, or each time the user logs on to their computer, the computer connects to the Activation and Validation Service to verify the license status and extend the product key. As long as the computer can connect to the internet at least once every 30 days, Office remains fully functional. If the computer goes offline for more than 30 days, Office enters reduced functionality mode until the next time a connection can be made. To get Office fully functional again, the user can simply connect to the internet and let the Activation and Validation Service reactivate the installation, though in some cases the user may have to sign back into Office first.
  
> [!IMPORTANT]
> Because of its online activation features, Microsoft 365 Apps won't work on computers that are completely cut off from the Internet. For those computers, we recommend installing Office Professional Plus 2019 and using a [traditional activation method](https://docs.microsoft.com/DeployOffice/vlactivation/plan-volume-activation-of-office) such as Key Management Service (KMS) or Active Directory Domain Services.
  
### Managing activated installations

Each Microsoft 365 Apps license allows a user to install Office on up to five desktops, five tablets, and five mobile devices. The user manages installations in the Office 365 portal:
  
![Managing Office 365 active installations](images/c830ebad-a255-4e32-8d7a-af5a687dc107.png)
  
If the user decides to install Microsoft 365 Apps on an eleventh computer, she will need to deactivate one of the first ten. Microsoft 365 Apps goes into reduced functionality mode on the deactivated computer.
  
## What is reduced functionality mode?

In reduced functionality mode, Microsoft 365 Apps remains installed on the computer, but users can only view and print their documents. All features for editing or creating new documents are disabled, and the user sees a message like the following:
  
![Product deactivated](images/78aa59b0-8772-4ba2-8094-bfeb65602ab7.png)
  
The user can then choose one of the available options to reactivate Microsoft 365 Apps on that computer.

If the user hasn't been assigned a license, and they try to use Microsoft 365 Apps on a computer where it's installed, Office will be in reduced functionality mode. Also, the user will be prompted to sign in and activate every time they open an Office app, such as Word or Excel.

## Related topics

[Licensing and activation data sent to Office 365 by Microsoft 365 Apps](licensing-and-activation-data-sent-to-office-365-by-office-365-proplus.md)
  
[About Microsoft 365 Apps in the enterprise](about-office-365-proplus-in-the-enterprise.md)
  
[Choose how to deploy Microsoft 365 Apps](choose-how-to-deploy-office-365-proplus.md)