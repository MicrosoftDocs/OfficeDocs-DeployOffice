---
title: "Configure the iOS app for Microsoft Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/16/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Instructions on how to install the Microsoft Places mobile app (iOS only)."
---
# Configure the iOS app for Microsoft Places

To enable the mobile experience, an IT admin might need to configure Mobile Application Management (MAM), and users must install Apple’s TestFlight app and the Microsoft Places app on their mobile phones. Please refer to the below steps for the details and instructions.

- These instructions are only in effect for the Private and Public Preview. Testing will be managed through Apple’s TestFlight platform.  

- TestFlight is an application/service owned by Apple and is offered to app developers to make it easy to invite users to test apps and collect feedback before releasing thei apps in the App Store.

- The Places mobile application can be made available to Private and Public Preview customers’ users that have iOS devices (version 16.4 or later).  

- Because the Places mobile application is still in its pilot phase and not yet available in the App Store. To allow Preview customers to install and test the application, we've made the Places mobile iOS available (installed through Apple TestFlight).

> [!NOTE]
> The Microsoft Places iOS app is an opt-in feature. For more information, see [Microsoft Places Preview](https://www.microsoft.com/en-us/microsoft-places).

## Prerequisites 

If applicable, your organization’s Mobile Application Management (MAM) policy should allow your employees to download/install “TestFlight” app to install, run and experience Places iOS. 

All users that need access to Places (including Mobile app) are added to the Security Group in Tenant Settings for PlacesEnabled. 

EnabledPlacesMobileApp is set to default:true OR all users that need access to the mobile app are added to the Security Group set for EnablePlacesMobileApp 

Customer updates their Unified Endpoint Management, such as Intune, for MAM policy requirements to allow employees to install the Places Mobile App (some tenants, see criteria and guidance below) 
