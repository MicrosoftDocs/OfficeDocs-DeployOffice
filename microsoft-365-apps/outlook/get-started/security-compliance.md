---  
title: "Security and compliance for new Outlook for Windows"   
ms.author: janellem  
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook  
ms.collection: - Tier3
ms.localizationpriority: medium 
ms.custom: QuickDraft  
ms.reviewer: janellem  
search.appverid: MET150 
recommendations: true
description: "Provides an overview of security features in new Outlook, and guidance for how to configure them."
ai-usage:  ai-assisted  
ms.date: 08/24/2024 
---  

# Security and compliance in new Outlook for Windows

New Outlook supports comprehensive data security solutions to help organizations protect their information. Security features are managed and configured using Microsoft Purview. Other security features include insider risk management and privileged access management, which is designed to mitigate internal threats and ensure regulatory compliance. Together, these tools form a robust information protection strategy across Microsoft 365 services and on-premises environments.

## Sensitivity labels

In today's collaborative work environment, content moves freely across devices, apps, and services, often beyond the confines of a firewall. To ensure that this content remains secure and compliant with an organization's policies, Microsoft Purview Information Protection offers sensitivity labels. These labels help classify and protect your organization's data without compromising user productivity or collaboration.

The following screenshot shows the compose pane in new Outlook and the dropdown after selecting the [sensitivity bar](/purview/sensitivity-labels-office-apps#sensitivity-bar). Users can also apply **Sensitivity** labels from the ribbon. On the **Message** tab, go to the **Tags** group and select **Sensitivity**.

For more information about Sensitivity labels, check out [Learn about sensitivity labels](/purview/sensitivity-labels).

To understand supported capabilities, see [Sensitivity label capabilities in Outlook](/microsoft-365/compliance/sensitivity-labels?#sensitivity-label-capabilities-in-outlook).

## Encryption

Users in your organization should use encryption when they need to protect the privacy of an email message. Encrypting an email message in Outlook converts it from readable plain text into scrambled cipher text. Outlook supports two encryption options:

- **Microsoft 365 message encryption (Information Rights Management - IRM)** - To use Message Encryption, the sender must have Message Encryption, which is included in the Office 365 Enterprise E3 license.
- **S/MIME encryption** - Coming soon to new Outlook.

IRM protection can't be applied to a message that is already signed or encrypted using S/MIME. To apply IRM protection, S/MIME signature and encryption must be removed from the message. The same applies for IRM-protected messages; users can't sign or encrypt them by using S/MIME.

Encryption can be applied using the **Encrypt** button in the ribbon or can be configured with Labels.

For more information related to IRM, see [Email encryption](/purview/email-encryption).

Lo learn more about restricting access to content by using sensitivity labels to apply encryption, see [Restrict access to content by using sensitivity labels to apply encryption](/purview/encryption-sensitivity-labels).

> [!NOTE]
> Double Key encryption is not supported in New Outlook.

## Data loss prevention

Many organizations might have sensitive information under their control that can be shared over email. Examples of sensitive information can include financial information, proprietary data, health records, credit card details, government identification numbers, etc.

Admins can protect this type of sensitive data and reduce the risk of their users inappropriately sharing sensitive data with people who shouldn't have it. This practice is called data loss prevention (DLP).

New Outlook supports data loss prevention. For more information about DLP, see [Learn about data loss prevention](/purview/dlp-learn-about-dlp).

## Default labels and policies

New Outlook supports marking labels as default and other labeling policies of Microsoft Purview Information Protection:

- Sensitivity labels and a sensitivity label policy
- Client-side auto-labeling
- Service-side auto-labeling

These default configurations help you protect your emails and data in the emails.

For more information about labeling policies and how to configure them, see [Service-side auto-labeling](/purview/mip-easy-trials#service-side-auto-labeling).