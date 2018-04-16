---
title: "Guidance for deploying Office 365 ProPlus in a GCC High or DoD environment"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 4/16/2017
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus

description: "Provides guidance for deploying Office 365 ProPlus in a GCC High or DoD environment"
---

# Guidance for deploying Office 365 ProPlus in a GCC High or DoD environment

If you plan to deploy Office 365 ProPlus in a GCC High or DoD environment, there are some special considerations that you need to be aware of to help you meet your compliance requirements.

<a name="version"> </a>

## Which version of Office 365 ProPlus to deploy

> [!IMPORTANT]
> To meet GCC High and DoD compliance requirements, you must be running at least Version 1803 of Office 365 ProPlus.

Version 1803 is currently available in Monthly Channel and in Semi-Annual Channel (Targeted). It is scheduled to be available in Semi-Annual Channel on July 10, 2018.

<a name="channel"> </a>

## Which update channel of Office 365 ProPlus to use
Since Version 1803 of Office 365 ProPlus won’t be available in Semi-Annual Channel until July, there are three possible options for you to meet GCC High and DoD compliance requirements:

- Wait until July to deploy Semi-Annual Channel
- Deploy Semi-Annual Channel (Targeted) now
- Deploy Monthly Channel now

For most enterprises, we usually recommend that a majority of users be on the Semi-Annual Channel of Office 365 ProPlus. For more information about update channels, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
 
But, if you don’t want to wait until July to install Office 365 ProPlus using Semi-Annual Channel, we recommend that you install Office 365 ProPlus to all your users using Semi-Annual Channel (Targeted). This will make the transition easier when you move most of your users to Semi-Annual Channel when Version 1803 is available in Semi-Annual Channel in July. 

If you deploy Monthly Channel to most of your users now, when you move users to Semi-Annual Channel after July, the features available to those users will change. That’s because Monthly Channel always gets new features as soon as they are available, while Semi-Annual Channel only receives new features twice a year. Because of this, it’s possible a feature that the user has been using in Monthly Channel won’t be available yet in Semi-Annual Channel. 


<a name="where"> </a>

## Where to install Office 365 ProPlus from and where to get updates

If network connectivity and other considerations based on your organizational requirements aren’t an issue, you can choose to deploy Office 365 ProPlus directly from the [Office Content Delivery Network (CDN)](#office-content-delivery-network-cdn) on the Internet. You can also configure Office 365 ProPlus to receive updates automatically from the Office CDN. This requires the least amount of administrative effort and is an easy way to keep Office 365 ProPlus up to date.

If you don’t want computers installed with Office 365 ProPlus to connect to the Office CDN and the [Device Management Service](#device-management-service) to get updates, you need to configure Office 365 ProPlus to be installed and updated from a shared folder from within your internal network. You will still need a least one computer to have access to the Office CDN to be able to download Office 365 ProPlus and updates to Office 365 ProPlus to the shared folder on your internal network. Also, computers installed with Office 365 ProPlus still require Internet connectivity in order to remain activated.

Keep in mind that installing and updating Office 365 ProPlus from a shared folder on your local network requires significantly more administrative effort and more disk space. For example, you have to keep track of when new builds of Office 365 ProPlus are available and then download the updated version of Office 365 ProPlus to your network. The core files for Office 365 ProPlus are at least 1.6 GB and at least 250 MB for each language deployed.

If Office 365 ProPlus is being updated directly from the Office CDN, the amount of network traffic to each computer is significantly less, because only the changed files need to be downloaded. The size of those updates can vary from 50 mb to 300 mb. These estimates are based on historical data from the past year or so of updates.


<a name="tools"> </a>

## What tools to use to deploy Office 365 ProPlus
There is no special guidance about what tools you can use to deploy Office 365 ProPlus in GCC High or DoD environments.

> [!NOTE]
> Currently we recommend that you don't allow your users to install Office 365 ProPlus for themselves from the Office 365 portal. By deploying Office 365 ProPlus to your users, you can ensure that users receive the Semi-Annual Channel (Targeted) version. To prevent users from installing from the Office 365 portal, sign in to the Office 365 admin center and go to **Settings** > **Services & add-ins** > **Office software download settings** and make sure all the toggles are set to the Off position.

To deploy Office 365 ProPlus, you can use the Office Deployment Tool along with a configuration.xml file. The Office Deployment Tool is a command line tool, so it can be used with scripts or batch files. The configuration.xml file contains the settings for the installation. For example, where to install Office 365 ProPlus from, whether to install the 32-bit or 64-bit version, which languages to install, and where Office 365 ProPlus should connect to get updates. For more information about the Office Deployment Tool and the configuration.xml file, see [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) and [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

You can also use enterprise software deployment tools, such as System Center Configuration Manager, to deploy Office 365 ProPlus. For more information about using Configuration Manager, see [Deploy with Configuration Manager (Current Branch)](https://docs.microsoft.com/sccm/sum/deploy-use/manage-office-365-proplus-updates) and [Deploy with Configuration Manager (2012 R2)](deploy-office-365-proplus-with-system-center-configuration-manager.md).

> [!NOTE]
> If you have anti-virus or other endpoint protection software configured to prevent installs or data writes to your devices, you may need to configure an exception for the OfficeClickToRun.exe process in order for the install to complete successfully.

<a name="samplexml"> </a>

## Sample configuration.xml files

<a name="CDNxml"> </a>

For more information about settings available in the configuration.xml file, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

### Installing and updating Office 365 ProPlus from the Office CDN
Here is a sample configuration.xml file to use with the Office Deployment Tool to install Office 365 ProPlus on Semi-Annual Channel (Targeted) from the Office CDN. Office 365 ProPlus will also be automatically updated directly from the Office CDN.

```
<Configuration> 
   <Add OfficeClientEdition="64" Channel="Targeted"> 
       <Product ID="O365ProPlusRetail" > 
            <Language ID="en-us" />      
       </Product> 
   </Add> 
   <Updates Enabled="TRUE"  Channel="Targeted" />
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

<a name="Localxml"> </a>

### Installing and updating Office 365 ProPlus from a shared folder on the local network
Here is a sample configuration.xml file to use with the Office Deployment Tool to install Office 365 ProPlus on Semi-Annual Channel (Targeted) from a shared folder on your local network. Updates to Office 365 ProPlus will also come from a shared folder on your local network.

```
<Configuration> 
   <Add SourcePath="\\Server\Share\Installs"  OfficeClientEdition="64" Channel="Targeted"> 
       <Product ID="O365ProPlusRetail" > 
            <Language ID="en-us" />      
       </Product> 
   </Add> 
   <Updates Enabled="TRUE" UpdatePath="\\Server\Share\Updates" Channel="Targeted" />
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

<a name="telemetry"> </a>

## Configure whether to send telemetry data to Microsoft
Office apps send telemetry data to Microsoft on a regular basis to help Microsoft understand how to improve the product. In highly regulated environments, you may choose to prevent telemetry data from being sent to Microsoft.

No additional configuration is needed to prevent Office 365 ProPlus or Office apps on Android from sending telemetry data to Microsoft. In both cases, the apps can recognize that they are in a GCC High or DoD environment and will automatically prevent telemetry data from being sent to Microsoft.

For other Office apps, such as Skype for Business client, Office 2016 for Mac, and Office apps on iOS, additional configuration is needed to prevent telemetry data from being sent to Microsoft. See the following sections for additional information.

### Turn off sending telemetry data to Microsoft from Skype for Business client
To prevent Skype for Business client from sending telemetry data to Microsoft, edit the registry and add the TelemetryTier value to the HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Lync key. The type for TelemetryTier is REG_DWORD, and the value should be set to 0.

For more information, see [Skype for Business and Microsoft Teams data collection practices](https://docs.microsoft.com/skypeforbusiness/accessibility-and-regulatory/data-collection-practices).

### Turn off sending telemetry data to Microsoft from Office 2016 for Mac
Office 2016 for Mac sends telemetry information back to Microsoft at regular intervals. Data is uploaded to the ‘Nexus’ endpoint. The telemetry data helps the engineering team assess the health and any unexpected behaviors of each Office app. There are two categories of telemetry:
- **Heartbeat** contains version and license information. This data is sent immediately upon app launch.
- **Usage** contains information about how apps are being used and non-fatal errors. This data is sent every 60 minutes.

To prevent Office 2016 for Mac from sending telemetry data to Microsoft, you can set the SendAllTelemetryEnabled and SendCriticalTelemetryEnabled preferences to "FALSE." 

> [!IMPORTANT]
> You must be using at least Version 16.11 of Office 2016 for Mac.

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

<a name="settings"> </a>

## Additional settings to configure

In addition to telemetry data settings, there are some additional settings that you may choose to configure depending on your compliance requirements. Many of these settings are configured by making changes to the registry. To deploy registry changes to multiple computers or users, you can use batch files, login scripts, Group Policy, Configuration Manager, PowerShell, or other scripting and deployment tools.

### Ensure modern authentication is enabled
Modern authentication needs to be enabled to be compliant. Modern authentication is enabled by default for Office 365 services and in Office 365 ProPlus. Unless you have intentionally disabled modern authentication, no action is required. For more information, see [Using Office 365 modern authentication with Office clients](https://support.office.com/article/776c0036-66fd-41cb-8928-5495c0f9168a) and [How modern authentication works for Office 2013 and Office 2016 client apps](https://support.office.com/article/e4c45989-4b1a-462e-a81b-2a13191cf517).

### Turn off Windows Error Reporting
To disable Windows Error Reporting (Watson), edit the registry and under the HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting key, set the Disabled value to 1. The type for the Disabled value is REG_DWORD. 

### Disable experimentation on Office 365 ProPlus
Microsoft occasionally runs experiments on Office features.

To disable experimentation, edit the registry and add the DisableFeatureRollout value to the HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\TrustCenter\Experimentation key. The type for DisableFeatureRollout is REG_DWORD and the value should be set to 1.

If experimentation was previously enabled, you also need to delete any data under the following registry keys to clear the experimentation cache.
- HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Experiment
- HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\ExperimentEcs
- HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\ExperimentTas

These registry keys get created when an Office app is launched, so it's ok if they reappear after you delete the data underneath them.

### Configure Outlook behavior on Office 365 ProPlus
The following registry values must to be set to correctly configure Outlook behavior on Office 365 ProPlus. The type for these registry values is REG_DWORD and the values should be set to 1.

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover\EnableOffice365ConfigService <br/>
  **Description:** This is needed so that the correct mailbox settings may be retrieved in this specific environment without calling a worldwide service to retrieve mailbox settings.<br/>

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Setup\DisableAccountSettingsDetectionService <br/>
  **Description:** This disables calling a worldwide service that assists in getting account information for POP, IMAP, and other protocols based on the email address. Because this service will be disabled by this key, personal accounts will need to be set up manually.  <br/>

The following registry values are optional. The type for these registry values is REG_DWORD and the values should be set to 1.

  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Setup\DisableGuessSmart <br/>
  **Description:** This disables attempts at setting up IMAP, POP accounts through various known ports. <br/>
 
  **Registry location:** HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General\DisableOutlookMobileHyperlink <br/>
  **Description:** This suppresses the option of configuring Outlook on a mobile device following a successfully configured account in Outlook Desktop. <br/>

Also, if [Office Add-ins](https://docs.microsoft.com/office/dev/add-ins/overview/office-add-ins) are built and used in non-Outlook apps, those applications must know where the user’s mailbox is configured. Microsoft will only perform Step 6 and Step 7 of the [AutoDiscover](https://support.microsoft.com/help/3211279/outlook-2016-implementation-of-autodiscover) process. This means you must have a URL that exists in one of these locations: `https://<contoso.com>.autodiscover/autodiscover.xml` or `https://autodiscover.<contoso.com>/autodiscover/autodiscover.xml`.  Then, that should redirect to `https://autodiscover-s-dod.office365.us/autodiscover/autodiscover.xml`. This process will be automatic in future versions.  

## Reference information

<a name="CDN"> </a>

### Office Content Delivery Network (CDN)
The software to install and update Office 365 ProPlus is available on the Office Content Delivery Network (CDN) on the Internet. The Click-to-Run service, which manages installations and updates of Office 365 ProPlus, makes calls to the Office CDN, which is hosted by Akamai.

Office 365 has a Memorandum of Understanding with Akamai as part of the Office 365 accreditation package and Akami has a FedRAMP moderate accreditation. For availability, the Click-to-Run service can failover to a world-wide instance of Azure Front Door, which also has a FedRAMP moderate accreditation.

<a name="DMS"> </a>

### Device Management Service
For installations of Office 365 ProPlus that are configured to get updates automatically from the Office CDN, Microsoft uses the Device Management Service (DMS) to apply release configuration to individual devices based on their specific configuration. For example, the operating system version that Office is installed on, whether the 32-bit or 64-bit version of Office is installed, and which language of Office is installed.

The Click-to-Run service contacts DMS to check for updates and will get a JSON response letting it know if a new build is available to download. None of the data passed by the Click-to-Run service is stored by the DMS service. The data is merely used as filtering criteria to determine what build information should be provided to the Click-to-Run for updating Office 365 ProPlus.
 
The DMS service doesn’t process, store or transmit any personally identifiable information or customer content.


## Related topics
For more information about the GCC High and DoD environments provided by Microsoft, see the following service descriptions:

- [Office 365 US Government](https://technet.microsoft.com/library/mt774581.aspx)
- [GCC High and DoD](https://technet.microsoft.com/library/mt774968.aspx)
- [Enterprise Mobility + Security for US Government](https://docs.microsoft.com/enterprise-mobility-security/solutions/ems-govt-service-description)

For general deployment guidance about Office 365 ProPlus, see the following articles:

- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
- [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md)
- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
- [Deploy with Configuration Manager (Current Branch)](https://docs.microsoft.com/sccm/sum/deploy-use/manage-office-365-proplus-updates)
- [Deploy with Configuration Manager (2012 R2)](deploy-office-365-proplus-with-system-center-configuration-manager.md)

For networking information, see the following articles:

- [Office 365 U.S. Government GCC High endpoints](https://support.office.com/article/cbd2369c-fd96-464c-bf48-c99826b459ee)
- [Office 365 U.S. Government DoD endpoints](https://support.office.com/article/5d7dce60-4892-4b58-b45e-ee42fe8a907f)
- [Office 365 URLs and IP address ranges](https://support.office.com/article/8548a211-3fe7-47cb-abb1-355ea5aa88a2)
- [Network requests in Office 365 ProPlus and Mobile](https://support.office.com/article/eb73fcd1-ca88-4d02-a74b-2dd3a9f3364d)
- [Network requests in Office 2016 for Mac](https://support.office.com/article/afdae969-4046-44b9-9adb-f1bab216414b)
