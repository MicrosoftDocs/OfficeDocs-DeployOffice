---
title: "Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise"
description: "Provides Office admins with information about how to manage privacy controls in Microsoft 365 Apps for enterprise by using policy settings."
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: high
ms.collection: privacy-microsoft365
hideEdit: true
ms.date: 05/31/2024
---

# Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise

> [!NOTE]
> For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you’re using Microsoft 365 Apps for enterprise.

Starting with Version 1904 of Microsoft 365 Apps for enterprise, there are new policy settings that will allow you to control settings related to the following:

- ***Diagnostic data*** that is collected and sent to Microsoft about Office client software being used

- ***Connected experiences*** that use cloud-based functionality to provide enhanced Office features to you and your users.

The following are the five new policy settings:

- Configure the level of client software diagnostic data sent by Office to Microsoft
- Allow the use of connected experiences in Office that analyze content
- Allow the use of connected experiences in Office that download online content
- Allow the use of additional optional connected experiences in Office
- Allow the use of connected experiences in Office

These policy settings can be implemented by using either Group Policy or [Cloud Policy](../admincenter/overview-cloud-policy.md). If you’re using Group Policy, you need to download the most current version of the Administrative Template files (ADMX/ADML) from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030).

> [!NOTE]
> - For information on how to manage privacy controls for Office for Mac, see [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md).
> - For information about similar settings for Office on iOS devices, see [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md).
> - For information about similar settings for Office on Android devices, see [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md).
> - For information about privacy controls for Office for the web applications, see [Use policy settings to manage privacy controls for Office for the web applications](office-web-privacy-controls.md).


If you’re using the Group Policy Management tool, all these policy settings are located under User Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016\\Privacy\\Trust Center.

These new policy settings also apply to the desktop versions of Project and Visio that come with some subscription plans, such as Project Plan 5 or Visio Plan 2. They also apply to Microsoft 365 Apps for business.

There are also some existing policy settings that will no longer apply to Microsoft 365 Apps for enterprise, and there are some user interface (UI) changes for privacy settings that you should be aware of because your users might notice those changes and ask about them.

As with any new policy settings, you should carefully test them out in a limited, controlled environment to ensure the settings you configure have the desired effect before you implement the policy settings more widely in your organization.

## Policy setting for diagnostic data

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and remediate problems, and also make product improvements.

You can use the *Configure the level of client software diagnostic data sent by Office to Microsoft* policy setting to choose what level of diagnostic data is sent to Microsoft.

If you enable this policy setting, you must choose which level of diagnostic data is sent to Microsoft. Your choices are Required, Optional, or Neither.

- If you choose ***Required***, the minimum data necessary to help keep Office secure, up-to-date, and performing as expected on the device it’s installed on is sent to Microsoft.

- If you choose ***Optional***, additional data that helps make product improvements and provides enhanced information to help detect, diagnose, and remediate issues is sent to Microsoft. This data may also be used in aggregate to train and improve experiences powered by machine learning, such as recommended actions, text predictions, and contextual help. If you choose to send optional diagnostic data, required diagnostic data is also included.

- If you choose ***Neither***, no diagnostic data about Office client software running on the user’s device is sent to Microsoft. This option, however, significantly limits Microsoft’s ability to detect, diagnose, and remediate problems that your users may encounter when using Office.

If you disable or don’t configure this policy setting, both optional and required diagnostic data are sent to Microsoft.

> [!NOTE]
> Even if you choose ***Neither***, required service data will be sent from the user's device to Microsoft. For more information, see [Required service data for Office](required-service-data.md).

For more information about diagnostic data, see the following articles:

- [Overview of privacy controls for Microsoft 365 Apps for enterprise](overview-privacy-controls.md)
- [Required diagnostic data for Office](required-diagnostic-data.md)
- [Optional diagnostic data for Office](optional-diagnostic-data.md)
- [Using the Diagnostic Data Viewer with Office](https://support.microsoft.com/office/cf761ce9-d805-4c60-a339-4e07f3182855)

## Policy settings for connected experiences

Microsoft 365 Apps for enterprise consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. Working with others on a document stored on Microsoft OneDrive or translating the contents of a Word document into a different language are examples of connected experiences.

We understand that you might want to choose which types of connected experiences are available to your users when they’re working in Office applications. So we have provided four new policy settings for you:

- Allow the use of connected experiences in Office that analyze content
- Allow the use of connected experiences in Office that download online content
- Allow the use of additional optional connected experiences in Office
- Allow the use of connected experiences in Office

If you don't configure these policy settings, all connected experiences are available. This gives your users all the features and functionality accessible through Microsoft 365 Apps for enterprise. But we understand that you might need to turn off some or all of these connected experiences to meet certain requirements of your organization.

If you choose not to provide your users with certain types of connected experiences, either the ribbon or menu command for those connected experiences will be grayed out or users will get an error message when they try to use those connected experiences. In that case, no [required service data](required-service-data.md) for those connected experiences will be sent to Microsoft.

Your users won’t be able to choose whether to turn these connected experiences included with Microsoft 365 Apps for enterprise on or off if they're signed into Office with their organizational credentials, which is sometimes referred to as a work or school account.

### Policy setting for connected experiences that analyze your content

These are experiences that use your Office content to provide you with design recommendations, editing suggestions, data insights, and similar features. For example, PowerPoint Designer or Translator. For a list of these connected experiences, see [Connected experiences in Office](connected-experiences.md).

You can use the *Allow the use of connected experiences in Office that analyze content* policy setting to control whether these types of connected experiences are available to your users. If you don’t configure this policy setting, these connected experiences will be available to your users.

Note that if you disable the *Allow the use of connected experiences in Office* policy setting, connected experiences that analyze content won’t be available to your users.

> [!NOTE]
> If you disable the *Allow the use of connected experiences in Office* policy setting, Copilot for Microsoft 365 features won’t be available to your users in certain apps. For more information, see [Microsoft Copilot for Microsoft 365 and policy settings for connected experiences](/copilot/microsoft-365/microsoft-365-copilot-privacy#microsoft-copilot-for-microsoft-365-and-policy-settings-for-connected-experiences).

### Policy setting for connected experiences that download online content

These are experiences that allow you to search and download online content including templates, images, 3D models, videos, and reference materials to enhance your documents. For example, Office templates or PowerPoint QuickStarter. For a list of these connected experiences, see [Connected experiences in Office](connected-experiences.md).

You can use the *Allow the use of connected experiences in Office that download online content* policy setting to control whether these types of connected experiences are available to your users. If you don’t configure this policy setting, these connected experiences will be available to your users.

Note that if you disable the *Allow the use of connected experiences in Office* policy setting, connected experiences that download online content won’t be available to your users.

### Policy setting for optional connected experiences

In addition to the connected experiences mentioned above that are included with Microsoft 365 Apps for enterprise, there are some optional connected experiences that you may choose to allow your users to access with their organization account. For example, the 3D Maps feature in Excel, which uses Bing. For more examples, see [Overview of optional connected experiences in Office](optional-connected-experiences.md).

These connected experiences are different because they aren't covered by your organization’s commercial agreement with Microsoft. Optional connected experiences are offered by Microsoft directly to your users and are governed by the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) instead of the [Microsoft Product Terms](https://www.microsoft.com/licensing/docs/view/Product-Terms). In some cases, third-party content or functionality are provided through these optional connected experiences and other terms may also apply. For more information, see [Overview of optional connected experiences in Office](optional-connected-experiences.md).

You can use the *Allow the use of additional optional connected experiences in Office* policy setting to control whether these types of connected experiences are available to your users. If you don’t configure this policy setting, these optional connected experiences will be available to your users.

> [!NOTE]
> To apply the *Allow the use of additional optional connected experiences in Office* policy setting to volume licensed versions of Office 2019, Project 2019, or Visio 2019, you must use Group Policy. You can't use Cloud Policy. This applies to when Office 2019, Project 2019, or Visio 2019 is configured to use the PerpetualVL2019 update channel.

Even if you choose to make these optional connected experiences available to your users, your users will have the option to turn them off as a group by going to the [privacy settings dialog box](https://support.microsoft.com/office/3e7bc183-bf52-4fd0-8e6b-78978f7f121b). Your users will only have this choice if they're signed into Office with their organizational credentials (sometimes referred to as a work or school account), not if they're signed in with a personal email address.

Also, some of these optional connected experiences are also considered to be connected experiences that analyze content or that download online content. For example, Insert Online Pictures is an optional connected experience, powered by Microsoft Bing, but it’s also considered to be a connected experience that downloads online content. Therefore, if you disable the *Allow the use of connected experiences in Office that download online content* policy setting, Insert Online Pictures won’t be available to your users. It won’t be available even if you have enabled the *Allow the use of additional optional connected experiences in Office* policy setting. For more information about which connected experiences analyze content or download online content, see [Connected experiences in Office](connected-experiences.md).

There's one exception to take note of. The *Allow the use of additional optional connected experiences in Office* policy setting doesn't control experiences that require you to connect your LinkedIn account to your Microsoft work or school account. To control these types of experiences, such as the LinkedIn information on a [profile card](https://support.microsoft.com/office/365-e80f931f-5fc4-4a59-ba6e-c1e35a85b501) in Outlook, see [LinkedIn in Microsoft apps and services](https://support.microsoft.com/office/dc81cc70-4d64-4755-9f1c-b9536e34d381) and [Integrate LinkedIn account connections in Microsoft Entra ID](/entra/identity/users/linkedin-integration).

### Policy setting for most connected experiences

You can use the *Allow the use of connected experiences in Office* policy setting to control whether most connected experiences accessible through Microsoft 365 Apps for enterprise are available to your users. If you disable the policy setting, the following types of connected experiences won’t be available to your users:

- Experiences that analyze your content
- Experiences that download online content
- Optional connected experiences

In addition, if you disable this policy setting, most other connected experiences are also turned off, such as coauthoring and online file storage. For a list of these other connected experiences, see [Connected experiences in Office](connected-experiences.md).

But even if you disable this policy setting, limited Office functionality will remain available, such as synching a mailbox in Outlook, and Teams and Skype for Business will continue to work. [Essential services](essential-services.md), such as the licensing service that confirms that you’re properly licensed to use Office, will also remain available.

## Existing policy settings that are replaced by new policy settings

There are two existing policy settings that are no longer applicable to Microsoft 365 Apps for enterprise, starting with Version 1904. Those policy settings are the following:

- **Send personal information**, which can be found under User Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016\\Privacy\\Trust Center.

- **Online Content Options**, which can be found under User Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016\\Tools | Options | General | Service Options...\\Online Content.

Starting with Version 1904, configuring these two existing policy settings will have no effect on Microsoft 365 Apps for enterprise. They're no longer applicable because their functionality is replaced by these new policy settings:

- Allow the use of connected experiences in Office that analyze content
- Allow the use of connected experiences in Office that download online content
- Allow the use of additional optional connected experiences in Office
- Allow the use of connected experiences in Office

These new policy settings can give you a finer level control than the two existing policy settings. For example, previously if you used the *Send personal information* policy setting, both PowerPoint QuickStarter and Smart Lookup would be turned off. But now, with the new policy settings, if you use the *Allow the use of connected experiences in Office that analyze content* policy setting to turn off that type of connected experiences, only Smart Lookup is turned off. PowerPoint QuickStarter will still be available to your users.

The policy settings still appear in the Group Policy Management tool because they're still applicable to volume licensed versions of Office 2016 and Office 2019, such as Office Professional Plus 2019.

## What about existing policy settings that control connected experiences?

As you probably already know, there are some existing policy settings that allow you to control connected experiences. Here are a few examples of existing policy settings:

- *PowerPoint Designer Options*, under User Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016\\Tools | Options | General | Service Options...\\PowerPoint Designer

- *Turn off QuickStarter*, under User Configuration\\Policies\\Administrative Templates\\Microsoft PowerPoint 2016\\PowerPoint Options\\General

You can still use these existing policy settings if you want to turn off individual connected experiences. But keep in mind that if you use one of the new policy settings, that new policy setting might turn off a connected experience that you turned on by using a different policy setting.

In general, if one policy setting is configured to turn on a specific connected experience while at the same time another policy setting is configured to turn off that type of connected experience, then that specific connected experience is turned off for your users.

## Privacy-related changes to the Office UI

There are some changes to the user interface (UI) of Microsoft 365 Apps for enterprise related to privacy that your users might notice and ask about. These changes are a direct result of the new privacy controls and policy settings available starting in Version 1904.

### Dialog about optional connected experiences

If you have chosen to provide your users with [optional connected experiences](optional-connected-experiences.md), the first time your users open an Office app after they've been updated to Version 1904 or later, an informational dialog box will appear. This dialog box informs your users that you have given them the choice to use these optional connected experiences and lets them know they can go to **File** > **Account** > **Account Privacy** to change this setting.

### Privacy settings removed from the Office UI

The following settings are removed from **File** > **Options** > **Trust Center** > **Trust Center Settings…** > **Privacy Options**:

- Get designs, information, recommendations, and services by allowing Office to access and make product improvements based on Office content on my device.

- Let Office connect to online services from Microsoft to provide functionality that’s relevant to your usage and preference.

Also, under **File** > **Options** > **General**, the choice to enable Office intelligent services is removed.

As the admin for your organization, you now control the equivalent settings to these through the new policy settings described earlier.

### Privacy settings added to the Office UI

The following are new elements added to the Office UI:

- Under **File** > **Account**, users will see a new choice for **Account Privacy** > **Manage Settings**. It’s under **Manage Settings** where users can turn off optional connected experiences, if you have given them that option.

- Under **File** > **Options** > **Trust Center** > **Trust Center Settings…** > **Privacy Options,** there's an option to enable the use of the [Diagnostic Data Viewer](https://support.microsoft.com/office/cf761ce9-d805-4c60-a339-4e07f3182855) on the device.

 
## Control privacy settings by editing the registry

Some admins prefer to change settings directly in the registry, for example by using a script, instead of by using Group Policy or Cloud Policy. You can use the following information to configure privacy settings directly in the registry.


|**Policy setting** |**Registry setting**  |**Values**  |
|---------|---------|---------|---------|
|Configure the level of client software diagnostic data sent by Office to Microsoft  | SendTelemetry |1=Required <br/> 2=Optional <br/> 3=Neither|
|Allow the use of connected experiences in Office that analyze content  | UserContentDisabled | 1=Enabled <br/> 2=Disabled|
|Allow the use of connected experiences in Office that download online content  | DownloadContentDisabled | 1=Enabled <br/> 2=Disabled|
|Allow the use of additional optional connected experiences in Office   | ControllerConnectedServicesEnabled  |1=Enabled <br/> 2=Disabled|
|Allow the use of connected experiences in Office | DisconnectedState  | 1=Enabled <br/> 2=Disabled|

To create a .reg file for the privacy settings, open Notepad and copy in the following lines. Adjust the values to suit your needs, and then save the file. Be sure the file name has an extension of .reg

```console
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Policies\Microsoft\office\16.0\common\privacy]
"disconnectedstate"=dword:00000001
"usercontentdisabled"=dword:00000001
"downloadcontentdisabled"=dword:00000001
"controllerconnectedservicesenabled"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\office\common\clienttelemetry]
"sendtelemetry"=dword:00000002
```

For example, you can use this .reg file with the regedit.exe command in a script to configure privacy settings for the user.