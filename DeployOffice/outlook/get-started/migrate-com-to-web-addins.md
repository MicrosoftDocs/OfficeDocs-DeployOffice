---
title: "Migrate from COM to web add-ins"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier1
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides an overview of transitioning from COM to web add-ins in Outlook"
ms.date: 04/17/2024
---

# Migrate from COM to web add-ins

In the new Outlook for Windows, web add-ins are fully supported, with no other work required from partners. COM add-ins aren’t supported in the new Outlook for Windows, but continue to work in classic Outlook for Windows. COM add-ins can manipulate Outlook in many ways that often leads to instability and crashes in Outlook. To ensure Outlook is more stable and robust, web add-ins provide a sandbox environment for add-ins to operate in and have checks and balances in place.

COM add-ins differ from web add-ins in several ways; one example is the use of fixed entry points. Using fixed entry points is intentional to ensure a stable and consistent experience for all Outlook users.

> [!NOTE]
> Classic Outlook supports web add-ins and continues to get the latest web add-in features. To learn more, see [Office Add-ins platform overview](/office/dev/add-ins/overview/office-add-ins).

The web add-ins platform in Outlook is advancing, with significant updates for both new Outlook and classic Outlook on Windows. These updates bring a host of modern capabilities and integrated experiences, ensuring that:

- Add-ins run automatically during event changes without disrupting the workflow.
- Users can apply add-ins to multiple items with ease.
- Items are validated and corrected as necessary before sending.
- Phishing reports are more effective, supported by contextual tips.
- Mail or event details are updated seamlessly.

## Transitioning add-ins from classic Outlook to the new Outlook for Windows

If your organization is currently using web add-ins, no extra effort is required to use it in the new Outlook. If your organization is using a COM add-in, there are a few steps you can take to transition to web add-ins:

1. **Check your installed COM add-ins**: You can check installed COM/VSTO add-ins from the Microsoft 365 Apps health dashboard in the [Microsoft 365 Apps admin center](https://config.office.com/). To find your installed apps, follow the instructions in [Add-in health](/DeployOffice/admincenter/microsoft-365-apps-health#add-in-health)—and be sure to filter out only the Outlook add-ins.
2. **Identify the mission-critical COM add-ins from this list**: Often, organizations have unused COM add-ins installed that are no longer relevant. It's important to identify and prioritize the COM add-ins that are actively used by your organization in preparation for the new Outlook for Windows. To identify the relevant COM add-ins, collaborate with your relevant business groups or IT teams.

   Some Microsoft COM add-ins might be deployed within your organization. The plan for these COM add-ins is detailed in [Identify COM add-ins in your organization](state-of-com-add-ins.md).

3. **Check if web add-ins are available for use**: If a web add-in is available, install, test, and assess it for usage with the new Outlook for Windows. You can follow the steps in [Deploy and manage Office Add-ins](/microsoft-365/admin/manage/office-addins) to install a web add-in.

   - Some widely used COM add-in publishers also published their web add-ins. The ones marked `PRIVATE` don't have a web add-in published to the store but have a private web add-in; you can reach out to the partners for requesting access to it.

      | COM Add-in                              | Scenario               | Web add-in                          |
      |-----------------------------------------|------------------------|-------------------------------------|
      | Adobe Acrobat Sign                      | Signature Management   | [Adobe Acrobat Sign for Microsoft Outlook](https://appsource.microsoft.com/product/office365/wa104381158) |
      | Barracuda Archive Search for Outlook    | Attachment Management  | [Barracuda Essentials for Outlook](https://appsource.microsoft.com/product/office365/wa104381249)    |
      | Blue jeans Outlook Add-in               | Online Meetings        | [BlueJeans Meetings](https://appsource.microsoft.com/product/office365/wa104381523)                  |
      | Calendly for Outlook                    | Meeting Boosters       | [Calendly for Outlook](https://appsource.microsoft.com/product/office365/wa104381446)                |
      | Cisco Webex Meetings                    | Online Meetings        | [Cisco Webex Scheduler](https://appsource.microsoft.com/product/office365/wa104382035)               |
      | Citrix Files for Outlook                | Attachment Management  | [ShareFile](https://appsource.microsoft.com/product/office365/wa104380913)                           |
      | Cofense Reporter                        | Phishing/Spam Reporting| PRIVATE- Cofense                    |
      | Egress                                  | Encryption & Classification | [Egress Protect](https://appsource.microsoft.com/product/office365/wa104381968)               |
      | Evernote.Outlook                        | Productivity           | [Evernote](https://appsource.microsoft.com/product/office365/wa104379617)                            |
      | Google Meet Outlook Add-in              | Online Meetings        | [Google Meet Add-In](https://appsource.microsoft.com/product/office365/wa104381851)                  |
      | GoToMeeting Outlook COM Add-in          | Online Meetings        | [GoTo for Outlook](https://appsource.microsoft.com/product/office365/WA200001676)                    |
      | harmon.ie                               | Attachment Management  | [harmon.ie web add-in](https://appsource.microsoft.com/product/office365/wa103004101)                |
      | Jira                                    | Project Management     | [Jira Cloud](https://appsource.microsoft.com/product/office365/wa200002140)                          |
      | Mimecast for Outlook                    | Phishing/Spam Reporting| [Mimecast Essentials for Outlook](https://appsource.microsoft.com/product/office365/wa200002175)     |
      | OnePlaceMail                            | Attachment Management  | [OnePlaceMail for Outlook](https://appsource.microsoft.com/product/office365/wa104380723)            |
      | KnowBe4 PhishAlarm Outlook Add-In       | Phishing/Spam Reporting| PRIVATE-KnowBe4                     |
      | Proofpoint Outlook Plug-in              | Phishing/Spam Reporting| PRIVATE-Proofpoint                  |
      | Proofpoint Plug-in                      | Phishing/Spam Reporting| PRIVATE-Proofpoint                  |
      | RingCentral Meetings Outlook Plugin     | Online Meetings        | [RingCentral Scheduler](https://appsource.microsoft.com/product/office365/wa200001471)               |
      | Salesforce for Outlook                  | CRM                    | [Salesforce](https://appsource.microsoft.com/product/office365/wa104379334)                          |
      | Symantec Endpoint Protection Outlook Add in | DLP                | PRIVATE-Symantec                    |
      | Vera AddIn for Outlook                  | DLP                    | Private Vera                        |
      | Virtru For Outlook                      | DLP                    | PRIVATE-Virtru                      |
      | Zoom Outlook Plugin                     | Online Meetings        | [Zoom for Outlook Extension](https://appsource.microsoft.com/product/office365/wa104381712)          |

   - If you don’t find your relevant COM add-ins on this list, search for them in the [Microsoft commercial marketplace](https://appsource.microsoft.com/home).

   - Some developers build private web add-ins that aren't published to the store. Check with your partners to confirm if they developed or are developing a web add-in.

   > [!TIP]
   > By default, users are given the option to install web add-in counterparts of their existing COM add-ins when they switch to new Outlook for Windows. For more information, see [Install web add-in counterparts of existing COM add-ins in new Outlook for Windows](install-web-add-ins.md).

4. **Explore native Outlook capabilities**. If your mission critical COM add-ins don't have an equivalent web add-in, explore new Outlook’s native capabilities and see if they work for your scenario. Some examples include:

   | COM Add-in                                  | Native Outlook capability                                          |
   |---------------------------------------------|--------------------------------------------------------------------|
   | Online Meeting                              | Teams meetings in Outlook                                          |
   | Security: DLP, Phishing & Spam             | Microsoft Purview Information Protection ([sensitivity labels](/purview/create-sensitivity-labels), permissions) and [Report Message](/office/dev/add-ins/outlook/spam-reporting) |
   | Email proofing                              | Microsoft Editor                                                   |
   | Signature                                   | Outlook Signatures                                                 |

5. **Initiate web add-in development**. If native Outlook capabilities don't meet your needs, reach out to your partners or internal developer teams (if there are internally developed COM add-ins) to initiate web add-in development. Here are some resources you can share with your partners or developers to start building web add-ins.
   - [Develop Outlook add-ins for the new Outlook for Windows](/office/dev/add-ins/outlook/one-outlook): This document has details on the supported and unsupported COM add-in scenarios in the web add-ins platform.
   - [Build your first Outlook add-in](/office/dev/add-ins/quickstarts/outlook-quickstart?tabs=yeomangenerator)
   - [Tutorial: Build a message compose Outlook add-in](/office/dev/add-ins/tutorials/outlook-tutorial)
   - [Outlook add-in APIs](/office/dev/add-ins/outlook/apis)

   In addition to the JS APIs supported by the web add-in platform, developers can also use Graph API integrations to augment the add-in capabilities.

## Request improvements in the web add-in platform

Our goal is to provide support for core scenarios through a combination of Add-in JS and Graph APIs. You can:

- Launch an add-in automatically when sending mail or during an event change.
- Select multiple items at once for the add-in to run on.
- Update mail or writing to the add-in product's server.

For a full list of scenarios, see [Supported scenarios in Outlook web add-ins](/office/dev/add-ins/outlook/one-outlook#supported-scenarios-in-outlook-web-add-ins).

If you find gaps in the web add-in platform that don't support core workflows like the COM add-in, use [this form](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR30HUvi_P4FFlU1eu9jg8INURUhWVkJHVEpRMURVUzNQWUdJS0g1U1NOOC4u) to share feedback.
