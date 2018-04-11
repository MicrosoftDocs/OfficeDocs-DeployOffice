---
title: "Guidance for deploying Office 365 ProPlus in a GCC High or DoD environment"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 4/16/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus

description: "Provides guidance for deploying Office 365 ProPlus in a GCC High or DoD environment"
---

# Guidance for deploying Office 365 ProPlus in a GCC High or DoD environment

If you plan to deploy Office 365 ProPlus in a GCC High or DoD environment, there are some special considerations that you need to be aware of to meet compliance requirements.

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

We also recommend, if network connectivity and other considerations aren’t an issue, that you deploy Office 365 ProPlus directly from the [Office Content Delivery Network (CDN)](#office-content-delivery-network-cdn) on the Internet. We also recommend that Office 365 ProPlus is configured to receive updates automatically from the Office CDN. This requires the least amount of administrative effort and is the easiest way to keep Office 365 ProPlus up to date.

If you don’t want computers installed with Office 365 ProPlus to connect to the Office CDN and the [Device Management Service](#device-management-service) to get updates, you need to configure Office 365 ProPlus to be installed and updated from a shared folder from within your internal network. You will still need a least one computer to have access to the Office CDN to be able to download Office 365 ProPlus and updates to Office 365 ProPlus to the shared folder on your internal network. Also, computers installed with Office 365 ProPlus still require Internet connectivity in order to remain activated.

Keep in mind that installing and updating Office 365 ProPlus from a shared folder on your local network requires significantly more administrative effort and more disk space. For example, you have to keep track of when new builds of Office 365 ProPlus are available and then download the updated version of Office 365 ProPlus to your network. The core files for Office 365 ProPlus are at least 1.6 GB and at least 250 MB for each language deployed.

If Office 365 ProPlus is being updated directly from the Office CDN, the amount of network traffic to each computer is significantly less, because only the changed files need to be downloaded. The size of those updates can vary from 50 mb to 300 mb. These estimates are based on historical data from the past year or so of updates.


<a name="tools"> </a>

## What tools to use to deploy Office 365 ProPlus
There is no special guidance about what tools you can use to deploy Office 365 ProPlus in GCC High or DoD environments.

To deploy Office 365 ProPlus, you can use the Office Deployment Tool along with a configuration.xml file. The Office Deployment Tool is a command line tool, so it can be used with scripts or batch files. The configuration.xml file contains the settings for the installation. For example, where to install Office 365 ProPlus from, whether to install the 32-bit or 64-bit version, which languages to install, and where Office 365 ProPlus should connect to get updates. For more information about the Office Deployment Tool and the configuration.xml file, see [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) and [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

You can also use enterprise software deployment tools, such as System Center Configuration Manager, to deploy Office 365 ProPlus. For more information about using Configuration Manager, see [Deploy with Configuration Manager (Current Branch)](https://docs.microsoft.com/sccm/sum/deploy-use/manage-office-365-proplus-updates) and [Deploy with Configuration Manager (2012 R2)](deploy-office-365-proplus-with-system-center-configuration-manager.md).

<a name="samplexml"> </a>

## Sample configuration.xml files

<a name="CDNxml"> </a>

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
   <Add SourcePath="\\Server\Share"  OfficeClientEdition="64" Channel="Targeted"> 
       <Product ID="O365ProPlusRetail" > 
            <Language ID="en-us" />      
       </Product> 
   </Add> 
   <Updates Enabled="TRUE" UpdatePath="\\Server\Share" Channel="Targeted" />
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

## Reference information

<a name="CDN"> </a>

### Office Content Delivery Network (CDN)
The software to install and update Office 365 ProPlus is available on the Office Content Delivery Network (CDN) on the Internet. The Click-to-Run service, which manages installations and updates of Office 365 ProPlus, makes calls to the Office CDN, which is hosted by Akamai.

Office 365 has a Memorandum of Understanding with Akamai as part of the Office 365 accreditation package and has a FedRAMP moderate accreditation. For availability, the Click-to-Run service can failover to a world-wide instance of Azure Front Door, which also has a FedRAMP moderate accreditation.

<a name="DMS"> </a>

### Device Management Service
For installations of Office 365 ProPlus that are configured to get updates automatically from the Office CDN, Microsoft uses the Device Management Service (DMS) to apply release configuration to individual devices based on their specific configuration. For example, the operating system version that Office is installed on, whether the 32-bit or 64-bit version of Office is installed, and which language of Office is installed.

The Click-to-Run service contacts DMS to check for updates and will get a JSON response letting it know if a new build is available to download. None of the data passed by the Click-to-Run service is stored by the DMS service. The data is merely used as filtering criteria to determine what build information should be provided to the Click-to-Run for updating Office 365 ProPlus.
 
The DMS service doesn’t process, store or transmit any personally identifiable information or customer content.


## Related topics
For more information about the GCC High and DoD environments provided by Microsoft, see the following service descriptions:

- [Office 365 US Government](https://technet.microsoft.com/library/mt774581.aspx)
- [GCC High and Dod](https://technet.microsoft.com/library/mt774968.aspx)

For general deployment guidance about Office 365 ProPlus, see the following articles:

- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
- [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md)
- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
- [Deploy with Configuration Manager (Current Branch)](https://docs.microsoft.com/sccm/sum/deploy-use/manage-office-365-proplus-updates)
- [Deploy with Configuration Manager (2012 R2)](deploy-office-365-proplus-with-system-center-configuration-manager.md)

For networking information, see the following articles:

- [Office 365 URLs and IP address ranges](https://support.office.com/article/8548a211-3fe7-47cb-abb1-355ea5aa88a2)
- [Network requests in Office 365 ProPlus and Mobile](https://support.office.com/article/eb73fcd1-ca88-4d02-a74b-2dd3a9f3364d)
- [Network requests in Office 2016 for Mac](https://support.office.com/article/afdae969-4046-44b9-9adb-f1bab216414b)
