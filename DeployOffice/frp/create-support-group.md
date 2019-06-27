---
title: "Create self-support group in Teams (or Yammer)"
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

# Create self-support group in Teams (or Yammer)
Help lower support tickets by empowering your customers end users to support each other with a dedicated community forum where they can find answers to more common questions. Enlist the help of champions to drive and own these groups. Start by identifying and enlisting users within your organisation to own and drive the self-support channel. These users should be able to commit time to engaging with the forum and support users experiencing issues.

## Create your support forum and add your owning users.
If using Microsoft Teams, you can create a Team using the following PowerShell template.

```powershell
Connect-MicrosoftTeams -AccountId myaccount@example.com
$group = New-Team -alias “Office 365 ProPlus Community Support" -displayname " Office 365 ProPlus Community Support " -AccessType “public"
Add-TeamUser -GroupId $group.GroupId -User "fred@example.com"
Add-TeamUser -GroupId $group.GroupId -User "john@example.com"
Add-TeamUser -GroupId $group.GroupId -User "wilma@example.com"
New-TeamChannel -GroupId $group.GroupId -DisplayName “Technical questions"
New-TeamChannel -GroupId $group.GroupId -DisplayName “Tips, tricks and training"
```

If you are using Yammer, create a public group and add your owning users. You can add resources from the following locations to the teams as starting points for the conversations.

- https://support.office.com/
- https://support.office.com/office-training-center

Add the rest of your users to the support forum and announce the creation of your support forum to all users that you will be upgrading to Office 365 ProPlus, specifying it as the first line of support for any issues they encounter. 


