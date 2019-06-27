---
title: "Assign licenses for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ms.custom: Ent_Office_FRP
ROBOTS: NOINDEX, NOFOLLOW
---

# Assign licenses for Office 365 ProPlus

> [!NOTE]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

Ensure your customers end users are able to use Office 365 when you deploy Office to their machines. There is two methods to assign licenses for end users:

- Office Admin center
- Office 365 PowerShell

## Office Admin Center
1. In the admin center, go to the **Users** > **Active users** page.
2. Select the circles next to the names of the users to whom you want to assign licenses.
3. At the top, choose choose **Manage product licenses**.
4. In the **Manage product licenses** pane, choose **Add to existing product license assignments** > **Next**.
5. In the **Add to existing products** pane, switch the toggle to the **On** position for the license that you want the selected users to have.
6. By default, all services associated with that license are automatically assigned to the users. To limit which services are available to the users, switch the toggles to the **Off** position for the services that you don't want the users to have.
7. At the bottom of the pane, choose **Add** > **Close**.

[Learn more about assigning licenses via the Admin center](https://docs.microsoft.com/office365/admin/subscriptions-and-billing/assign-licenses-to-users)

## Office 365 PowerShell

If you wish to bulk assign licenses you make find it more efficient to do using PowerShell. Office 365 PowerShell allows you to view and modify information like licensing plans, services, assigned licenses, view licensed and unlicensed users.

[Learn more about assigning users with Office 365 PowerShell](https://docs.microsoft.com/office365/enterprise/powershell/assign-licenses-to-user-accounts-with-office-365-powershell)
