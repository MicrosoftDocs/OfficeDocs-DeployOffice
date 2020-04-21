---
title: "Guidance for deploying Microsoft 365 Apps for enterprise in a GCC High or DoD environment"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides guidance for deploying Microsoft 365 Apps for enterprise  in a GCC High or DoD environment"
---

# Guidance for deploying Microsoft 365 Apps for enterprise in a GCC High or DoD environment

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

If you plan to deploy Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus) in a GCC High or DoD environment, there are some special considerations that you need to be aware of to help you meet your compliance requirements.

## Which version of Microsoft 365 Apps for enterprise to deploy

> [!IMPORTANT]
> To meet GCC High and DoD compliance requirements, you must be running at least Version 1803 of Microsoft 365 Apps for enterprise.

Version 1803 or later is available in Monthly Channel, Semi-Annual Channel (Targeted), and Semi-Annual Channel.

### What about other applications, such as Project and Visio?

You can deploy the subscription versions of the Project and Visio desktop apps in a GCC High or DoD environment, but they must be at least Version 1803. Any configuration or settings mentioned for Microsoft 365 Apps for enterprise also apply to the subscription versions of the Project and Visio desktop apps.

Outlook for iOS and Android is also available for GCC High or DoD environments. For more information, [read this Tech Community blog post](https://techcommunity.microsoft.com/t5/Outlook-Blog/Outlook-mobile-meets-needs-of-customers-with-the-highest-Federal/ba-p/313938).

> [!IMPORTANT]
> For Teams, currently you need to exclude Teams from being installed when you install Microsoft 365 Apps for enterprise. Instead, you need to install Teams by using the separate MSI-based installer. In the future, you'll be able to install Teams along with Microsoft 365 Apps for enterprise without needing to use the separate MSI-based installer.
> - For steps on how to exclude Teams from being installed with Microsoft 365 Apps for enterprise, see [How to exclude Microsoft Teams from new installations of Microsoft 365 Apps](teams-install.md#how-to-exclude-microsoft-teams-from-new-installations-of-microsoft-365-apps) and [Use Group Policy to control the installation of Microsoft Teams](teams-install.md#use-group-policy-to-control-the-installation-of-microsoft-teams).
>- For links to the correct version of the MSI-based installer for your environment, see [Install Microsoft Teams using Microsoft Endpoint Configuration Manager](https://docs.microsoft.com/MicrosoftTeams/msi-deployment).

## Which update channel of Microsoft 365 Apps for enterprise to use

For most enterprises, we usually recommend that a majority of users be on the Semi-Annual Channel of Microsoft 365 Apps for enterprise. For more information about update channels, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).
 
## Where to install Microsoft 365 Apps for enterprise from and where to get updates

If network connectivity and other considerations based on your organizational requirements aren't an issue, you can choose to deploy Microsoft 365 Apps for enterprise directly from the [Office Content Delivery Network (CDN)](#office-content-delivery-network-cdn) on the internet. You can also configure Microsoft 365 Apps for enterprise to receive updates automatically from the Office CDN. This requires the least amount of administrative effort and is an easy way to keep Microsoft 365 Apps for enterprise up to date.

If you don't want computers installed with Microsoft 365 Apps for enterprise to connect to the Office CDN and the [Device Management Service](#device-management-service) to get updates, you need to configure Microsoft 365 Apps for enterprise to be installed and updated from a shared folder from within your internal network. You will still need a least one computer to have access to the Office CDN to be able to download Microsoft 365 Apps for enterprise and updates to Microsoft 365 Apps for enterprise to the shared folder on your internal network. Also, computers installed with Microsoft 365 Apps for enterprise still require internet connectivity in order to remain activated.

Keep in mind that installing and updating Microsoft 365 Apps for enterprise from a shared folder on your local network requires significantly more administrative effort and more disk space. For example, you have to keep track of when new builds of Microsoft 365 Apps for enterprise are available and then download the updated version of Microsoft 365 Apps for enterprise to your network. The core files for Microsoft 365 Apps for enterprise are at least 1.6 GB and at least 250 MB for each language deployed.

If Microsoft 365 Apps for enterprise is being updated directly from the Office CDN, the amount of network traffic to each computer is significantly less, because only the changed files need to be downloaded. The size of those updates can vary from 50 mb to 300 mb. These estimates are based on historical data from the past year or so of updates.


## What tools to use to deploy Microsoft 365 Apps for enterprise
There is no special guidance about what tools you can use to deploy Microsoft 365 Apps for enterprise in GCC High or DoD environments.

To deploy Microsoft 365 Apps for enterprise, you can use the Office Deployment Tool along with a configuration.xml file. The Office Deployment Tool is a command line tool, so it can be used with scripts or batch files. The configuration.xml file contains the settings for the installation. For example, where to install Microsoft 365 Apps for enterprise from, whether to install the 32-bit or 64-bit version, which languages to install, and where Microsoft 365 Apps for enterprise should connect to get updates. For more information about the Office Deployment Tool and the configuration.xml file, see [Overview of the Office Deployment Tool](overview-office-deployment-tool.md) and [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

You can also use enterprise software deployment tools, such as Microsoft Endpoint Configuration Manager, to deploy Microsoft 365 Apps for enterprise. For more information about using Configuration Manager, see [Deploy with Configuration Manager (current branch)](deploy-microsoft-365-apps-configuration-manager.md) and [Deploy with Configuration Manager (2012 R2)](deploy-microsoft-365-apps-configuration-manager-2012R2.md).

> [!NOTE]
> If you have anti-virus or other endpoint protection software configured to prevent installs or data writes to your devices, we recommend that you update to the most current version of that software, if possible. In some cases, you may need to configure an exception for the OfficeClickToRun.exe process in order for the install to complete successfully.


## Sample configuration.xml files

For more information about settings available in the configuration.xml file, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

### Installing and updating Microsoft 365 Apps for enterprise from the Office CDN
Here is a sample configuration.xml file to use with the Office Deployment Tool to install Microsoft 365 Apps for enterprise on Semi-Annual Channel from the Office CDN. Microsoft 365 Apps for enterprise will also be automatically updated directly from the Office CDN.

```xml
<Configuration> 
   <Add OfficeClientEdition="64" Channel="Broad">
       <Product ID="O365ProPlusRetail" >
            <Language ID="en-us" />
       </Product>
   </Add>
   <Updates Enabled="TRUE"  Channel="Broad" />
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

### Installing and updating Microsoft 365 Apps for enterprise from a shared folder on the local network
Here is a sample configuration.xml file to use with the Office Deployment Tool to install Microsoft 365 Apps for enterprise on Semi-Annual Channel from a shared folder on your local network. Updates to Microsoft 365 Apps for enterprise will also come from a shared folder on your local network.

```xml
<Configuration> 
   <Add SourcePath="\\Server\Share\Installs"  OfficeClientEdition="64" Channel="Broad">
       <Product ID="O365ProPlusRetail" >
            <Language ID="en-us" />
       </Product>
   </Add>
   <Updates Enabled="TRUE" UpdatePath="\\Server\Share\Updates" Channel="Broad" />
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

## Configure whether to send telemetry data to Microsoft
Office apps send telemetry data to Microsoft on a regular basis to help Microsoft understand how to improve the product. In highly regulated environments, you may choose to prevent telemetry data from being sent to Microsoft.

No additional configuration is needed to prevent Microsoft 365 Apps for enterprise or Office apps on Android from sending telemetry data to Microsoft. In both cases, the apps can recognize that they are in a GCC High or DoD environment and will automatically prevent telemetry data from being sent to Microsoft.

For other Office apps, such as Skype for Business client, Office for Mac, and Office apps on iOS, additional configuration is needed to prevent telemetry data from being sent to Microsoft. See the following sections for additional information.

### Turn off sending telemetry data to Microsoft from Skype for Business client
To prevent Skype for Business client from sending telemetry data to Microsoft, edit the registry and add the TelemetryTier value to the HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Lync key. The type for TelemetryTier is REG_DWORD, and the value should be set to 0.

For more information, see [Skype for Business and Microsoft Teams data collection practices](https://docs.microsoft.com/SkypeForBusiness/legal-and-regulatory/data-collection-practices).

### Turn off sending telemetry data to Microsoft from Office for Mac
Office for Mac sends telemetry information back to Microsoft at regular intervals. Data is uploaded to the 'Nexus' endpoint. The telemetry data helps the engineering team assess the health and any unexpected behaviors of each Office app. There are two categories of telemetry:
- **Heartbeat** contains version and license information. This data is sent immediately upon app launch.
- **Usage** contains information about how apps are being used and non-fatal errors. This data is sent every 60 minutes.

To prevent Office for Mac from sending telemetry data to Microsoft, you can set the SendAllTelemetryEnabled and SendCriticalTelemetryEnabled preferences to "FALSE." 

> [!IMPORTANT]
> You must be using at least Version 16.11 of Office for Mac.

The preferences are per-application and can be set via macOS Configuration Profiles, or manually from Terminal, as shown in the following example.

    defaults write com.microsoft.Word SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.Word SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.Excel SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.Powerpoint SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.Outlook SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.onenote.mac SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.autoupdate2 SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.Office365ServiceV2 SendAllTelemetryEnabled -bool FALSE
    defaults write com.microsoft.Word SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.Word SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.Excel SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.Powerpoint SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.Outlook SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.onenote.mac SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.autoupdate2 SendCriticalTelemetryEnabled  -bool FALSE
    defaults write com.microsoft.Office365ServiceV2 SendCriticalTelemetryEnabled  -bool FALSE


### Turn off sending telemetry data to Microsoft from Office apps on iOS
To prevent Office apps on iOS from sending telemetry data to Microsoft, set the SendAllTelemetryEnabled and SendCriticalTelemetryEnabled preferences to "false." The preferences are per-application and can be set by using Microsoft Intune. For more information, see [Add app configuration policies for managed iOS devices](https://docs.microsoft.com/intune/app-configuration-policies-use-ios).

> [!IMPORTANT]
> You must be using at least Version 2.11 of Office on iOS.

For each key and value in the configuration, set the following:
- Configuration key = SendAllTelemetryEnabled 
- Value type = Boolean
- Configuration value = false

and

- Configuration key = SendCriticalTelemetryEnabled 
- Value type = Boolean
- Configuration value = false

## Additional settings to configure

In addition to telemetry data settings, there are some additional settings that you may choose to configure depending on your compliance requirements. Many of these settings are configured by making changes to the registry. To deploy registry changes to multiple computers or users, you can use batch files, login scripts, Group Policy, Configuration Manager, PowerShell, or other scripting and deployment tools.

### Ensure modern authentication is enabled
Modern authentication needs to be enabled to be compliant. Modern authentication is enabled by default for Office 365 services and in Microsoft 365 Apps for enterprise. Unless you have intentionally disabled modern authentication, no action is required. For more information, see [How modern authentication works for Office 2013 and Office 2016 client apps](https://docs.microsoft.com/office365/enterprise/modern-auth-for-office-2013-and-2016).

### Turn off Windows Error Reporting
To disable Windows Error Reporting (Watson), edit the registry and under the HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting key, set the Disabled value to 1. The type for the Disabled value is REG_DWORD. 

### Disable experimentation on Microsoft 365 Apps for enterprise
Microsoft occasionally runs experiments on Office features.

To disable experimentation, edit the registry and add the DisableFeatureRollout value to the HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\TrustCenter\Experimentation key. The type for DisableFeatureRollout is REG_SZ and the value should be set to `true` (lowercase).

If experimentation was previously enabled, you also need to delete any data under the following registry keys to clear the experimentation cache.
- HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Experiment
- HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\ExperimentEcs
- HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\ExperimentTas

These registry keys get created when an Office app is launched, so it's ok if they reappear after you delete the data underneath them.

### Configure Outlook behavior on Microsoft 365 Apps for enterprise
The following registry values must be set to correctly configure Outlook behavior on Microsoft 365 Apps for enterprise. The type for these registry values is REG_DWORD and the values should be set to 1.

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover\EnableOffice365ConfigService <br/>
  **Description:** This is needed so that the correct mailbox settings may be retrieved in this specific environment without calling a worldwide service to retrieve mailbox settings. If you're using Version 1805 or later of Microsoft 365 Apps for enterprise you don't need to set this registry setting. <br/>

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Setup\DisableAccountSettingsDetectionService <br/>
  **Description:** This disables calling a worldwide service that assists in getting account information for POP, IMAP, and other protocols based on the email address. Because this service will be disabled by this key, personal accounts will need to be set up manually.  <br/>

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General\DisablePreviewPlace <br/>
  **Description:** This disables the Coming Soon feature which provides users with information about upcoming features and lets users try those features and provide feedback. Coming Soon is available in Version 1806 or later of Microsoft 365 Apps for enterprise. <br/>

The following registry values are optional. The type for these registry values is REG_DWORD and the values should be set to 1.

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Setup\DisableGuessSmart <br/>
  **Description:** This disables attempts at setting up IMAP, POP accounts through various known ports. <br/>
 
  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General\DisableOutlookMobileHyperlink <br/>
  **Description:** This suppresses the option of configuring Outlook on a mobile device following a successfully configured account in Outlook Desktop. <br/>

Also, if [Office Add-ins](https://docs.microsoft.com/office/dev/add-ins/overview/office-add-ins) are built and used in non-Outlook apps, those applications must know where the user's mailbox is configured. Microsoft will only perform Step 6 and Step 7 of the [AutoDiscover](https://support.microsoft.com/help/3211279/outlook-2016-implementation-of-autodiscover) process. This means you must have a URL that exists in one of these locations: `https://<contoso.com>.autodiscover/autodiscover.xml` or `https://autodiscover.<contoso.com>/autodiscover/autodiscover.xml`.  Then, that should redirect to `https://autodiscover-s-dod.office365.us/autodiscover/autodiscover.xml`. This process will be automatic in future versions.  


## Special considerations
Due diligence was done to review cloud services connected to features in Microsoft 365 Apps for enterprise.  We expect, and have found, that such processes are not failure proof so we have created the following table to capture any edge cases that were not initially captured prior to initial release. We will use this table so we can communicate the finding, any potential risk and the mitigation of that increase in scope.  Services in this table will be appropriately turned off within 30 days.


|**Application**  |**Feature**  |**Recommendation**  |
|---------|---------|---------|
|Excel     |[Maps](https://support.office.com/article/f2cfed55-d622-42cd-8ec9-ec8a358b593b)         |This feature has been disabled, as of these releases: <br/><br/> - Version 1804 (Build 9226.2126) of Monthly Channel <br/> - Version 1803 (Build 9126.2191) of Semi-Annual Channel (Targeted) <br/> - Version 1803 (Build 9126.2259) of Semi-Annual Channel  <br/><br/> If you're using an earlier version of Excel, don't use this feature.|


## Reference information

### Office Content Delivery Network (CDN)
The software to install and update Microsoft 365 Apps for enterprise is available on the Office Content Delivery Network (CDN) on the internet. The Click-to-Run service, which manages installations and updates of Microsoft 365 Apps for enterprise, makes calls to the Office CDN, which is hosted by Akamai.

Office 365 has a Memorandum of Understanding with Akamai as part of the Office 365 accreditation package and Akami has a FedRAMP moderate accreditation. For availability, the Click-to-Run service can failover to a world-wide instance of Azure Front Door, which also has a FedRAMP moderate accreditation.

### Device Management Service
For installations of Microsoft 365 Apps for enterprise that are configured to get updates automatically from the Office CDN, Microsoft uses the Device Management Service (DMS) to apply release configuration to individual devices based on their specific configuration. For example, the operating system version that Office is installed on, whether the 32-bit or 64-bit version of Office is installed, and which language of Office is installed.

The Click-to-Run service contacts DMS to check for updates and will get a JSON response letting it know if a new build is available to download. None of the data passed by the Click-to-Run service is stored by the DMS service. The data is merely used as filtering criteria to determine what build information should be provided to the Click-to-Run for updating Microsoft 365 Apps for enterprise.
 
The DMS service doesn't process, store or transmit any personally identifiable information or customer content.


## Related topics
For more information about the GCC High and DoD environments provided by Microsoft, see the following service descriptions:

- [Office 365 US Government](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/office-365-us-government)
- [GCC High and DoD](https://docs.microsoft.com/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)
- [Enterprise Mobility + Security for US Government](https://docs.microsoft.com/enterprise-mobility-security/solutions/ems-govt-service-description)

For general deployment guidance about Microsoft 365 Apps for enterprise, see the following articles:

- [Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
- [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md)
- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)
- [Deploy with Configuration Manager (current branch)](deploy-microsoft-365-apps-configuration-manager.md)
- [Deploy with Configuration Manager (2012 R2)](deploy-microsoft-365-apps-configuration-manager-2012R2.md)

For networking information, see the following articles:

- [Office 365 U.S. Government GCC High endpoints](https://docs.microsoft.com/office365/enterprise/office-365-u-s-government-gcc-high-endpoints)
- [Office 365 U.S. Government DoD endpoints](https://docs.microsoft.com/office365/enterprise/office-365-u-s-government-dod-endpoints)
- [Office 365 URLs and IP address ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges)
- [Network requests in Office for Mac](https://docs.microsoft.com/office365/enterprise/network-requests-in-office-2016-for-mac)
