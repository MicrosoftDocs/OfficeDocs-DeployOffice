---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title:       # Add a title for the browser tab
description: # Add a meaningful description for search results
author:      JanelleMcIntosh-MSFT # GitHub alias
ms.author:   janelle.mcintosh # Microsoft alias
ms.service:  # Add the ms.service or ms.prod value
# ms.prod:   # To use ms.prod, uncomment it and delete ms.service
ms.topic:    # Add the ms.topic value
ms.date:     05/06/2024
---

# Manage updates in new Outlook for Windows

## Updates to the new Outlook for Windows 

The new Outlook for Windows app updates automatically, with new build updates shipping weekly. Unlike the classic version, though, features are not delivered via build updates. The native component updates ensure that the app continues to work with the service, and updates are delivered automatically.

To ensure reliable delivery of updates, administrators will need to allow access to the Microsoft 365 CDN on the *.office.net domain. [Microsoft 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges).

## Service-delivered features

New features are released through rings through our service, starting with validation in internal rings before starting to expand into a production audience. External customers can either receive features as part of a Targeted Release ring (for early previews) or Standard Release rings (most common). [Set up the Standard or Targeted release options](/microsoft-365/admin/manage/release-options-in-office-365).

This new model for feature delivery is similar to the way that Microsoft Teams releases new functionality, as described in the article, [Public preview in Microsoft Teams](/MicrosoftTeams/public-preview-doc-updates).

Unlike release channels for the classic Outlook, there is no Monthly Enterprise Channel or Semi-Annual Channel. Updates to new Outlook are not managed in [Software Center](/mem/configmgr/core/understand/software-center) nor do they require IT admins to enforce. If your organization has a workflow to test builds of the classic Outlook before releasing new them, the best practice will be to enroll part of your organization in Targeted Release .

## Looking ahead at features coming to new Outlook

The best way to see which features are coming to the new Outlook is to follow the [Microsoft 365 Roadmap](https://aka.ms/newOutlookforWindows). For finer details of updates, such as the timing of individual changes or for feature release status within your organization, you’ll want to subscribe to those updates in the Microsoft 365 [Message Center](/microsoft-365/admin/manage/message-center).

### Predictability and how to use Targeted Release with new Outlook

In new Outlook (as with all of Microsoft 365), new features become available first in Targeted Release. The Targeted Release date corresponds to its “preview” date in the Microsoft 365 Roadmap. 

### Timing of Targeted Release and Standard Release

New features arriving in Targeted Release will not be rolled out in Standard Release for at least 30 days. This time ensures that customers who choose to follow Enterprise guidance (selected users in Standard Release link here) to “look ahead” on behalf of their organization know they have 30 days to prepare for the update to eventually hit Standard Release and the rest of their users.
