---
title: "Accessibility guide for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: 
 - tier1
 - essentials-accessibility
ms.localizationpriority: medium
recommendations: true
description: "Provide Office admins with guidance and resources to help make their Microsoft 365 environment as inclusive and accessible as possible for their users"
ms.date: 03/01/2023
---

# Accessibility guide for Microsoft 365 Apps

Microsoft 365 provides apps and cloud services designed to help everyone create, communicate, and collaborate from any device. For example, by using the Office apps (such as Word, Excel, PowerPoint, and Outlook) that are included with [Microsoft 365 Apps](about-microsoft-365-apps.md).

As an admin responsible for deploying and managing the Office apps in your organization, you have a key role to play in helping make your Microsoft 365 environment as inclusive and accessible as possible for all your users.

The following information is intended to provide you with guidance and resources to help your organization create a more inclusive and accessible environment for your users.

## Recommendations for promoting accessibility with Office

To allow your users to take the most advantage of the accessibility capabilities of the Office apps that come with Microsoft 365 Apps, we recommend you take the following actions.

- [Provide your users with the latest accessibility features for Office by using Current Channel](#provide-your-users-with-the-latest-accessibility-features-for-office-by-using-current-channel)
- [Check that connected experiences for accessibility are turned on for your users](#check-that-connected-experiences-for-accessibility-are-turned-on-for-your-users)
- [Increase the use of the Accessibility Checker by having it run automatically for your users](#increase-the-use-of-the-accessibility-checker-by-having-it-run-automatically-for-your-users)
- [Make accessibility resources available to your organization](#make-accessibility-resources-available-to-your-organization)

## Provide your users with the latest accessibility features for Office by using Current Channel

Microsoft 365 Apps is updated regularly with new and improved features for the Office apps, such as Word and Excel. These updates can include new and improved accessibility features.

To provide your users with the newest and most up-to-date accessibility features, we recommend using [Current Channel](updates/overview-update-channels.md#current-channel-overview). Current Channel is updated every month with new and improved features, along with the latest security updates and bug fixes.

With Current Channel, you’ll be getting the accessibility features as soon as they’re ready. To see the features that are released each month, see [Release notes for Current Channel](/officeupdates/current-channel).

> [!NOTE]
> - If you need additional predictability of when new Office features are released each month, you can choose [Monthly Enterprise Channel](updates/overview-update-channels.md#monthly-enterprise-channel-overview), which is updated on the 2nd Tuesday of each month. You’ll still be getting new and improved accessibility features monthly, but a month or two after they’re available in Current Channel.
>- For information about how to move users to a particular channel, see [Change the Microsoft 365 Apps update channel for devices in your organization](updates/change-update-channels.md).

## Check that connected experiences for accessibility are turned on for your users

Microsoft 365 Apps provides [connected experiences](privacy/connected-experiences.md), which use cloud-based functionality to provide enhanced capabilities when using Office apps. This includes capabilities that improve accessibility to create and consume Office content.

Here are some examples of connected experiences for accessibility.

- [Live captions and subtitles (PowerPoint)](https://support.microsoft.com/office/68d20e49-aec3-456a-939d-34a79e8ddd5f), which can help accommodate users who may be deaf or hard of hearing, or more familiar with another language.

- [Dictation (Word or Outlook)](https://support.microsoft.com/office/eab203e1-d030-43c1-84ef-999b0b9675fe), which converts speech to text to allow users to author content without using a keyboard.

- [Read Aloud (Word)](https://support.microsoft.com/office/5a2de7f3-1ef4-4795-b24e-64fc2731b001), which reads all or part of a document out loud to assist users who are blind or have low vision.

- [Learning Tools (multiple apps)](https://support.microsoft.com/topic/eff7f7e3-7e21-42f0-a6f1-da7027f98261), such as Immersive Reader options in Outlook, which can assist users with dyslexia or learning disabilities by allowing them to customize how email text appears on the screen.

- [Automatic alt text (multiple apps)](https://support.microsoft.com/office/df98f884-ca3d-456c-807b-1a1fa82f5dc2), which can generate descriptions of images, pictures, and diagrams to assist users with visual impairments that are using screen readers.

- [PowerPoint QuickStarter](https://support.microsoft.com/office/4784f273-0b2c-456c-9c89-24e5b977c224), which can help users with learning disabilities or certain kinds of neurodivergence by providing an initial structure for a project.

We recommend that you check that connected experiences are turned on in your organization. Connected experiences are turned on by default, but we provide admins with policies that allow them to turn off connected experiences.

If connected experiences are turned off by using policies, then connected experiences for accessibility won’t be available to your users. For more information about those policies, see [Overview of privacy controls for Microsoft 365 Apps for enterprise](privacy/overview-privacy-controls.md).

## Increase the use of the Accessibility Checker by having it run automatically for your users

The [Accessibility Checker](https://support.microsoft.com/office/38059c2d-45ef-4830-9797-618f0e96f3ab) identifies possible accessibility issues in Office content and offers recommendations for fixing the issues. Therefore, we recommend that your users run the Accessibility Checker before sending an email message or sharing a document, presentation, or spreadsheet.

To make running the Accessibility Checker easier for your users, you can configure it to run automatically for Word, Excel, and PowerPoint on devices running Windows. To configure, use [Group Policy](https://www.microsoft.com/download/details.aspx?id=49030) or [Cloud Policy](admin-center/overview-cloud-policy.md) to enable the “Check for accessibility issues while editing” policy. There's a separate policy for each of the three apps.

There isn’t a policy for Outlook, but Outlook automatically checks for accessibility issues under certain conditions, as listed under **File** > **Options** > **Accessibility**. For example, when you’re composing a message to a large audience or when a recipient has indicated they prefer accessible content.

> [!NOTE]
> - The policy is found under User Configuration\Policies\Administrative Templates\Microsoft *{app name}* 2016\File Tab\Check Accessibility in the Group Policy Management Console.
> - If you use this policy, users won’t be able to turn off the Accessibility Checker under **File** > **Options** > **Accessibility**.

## Make accessibility resources available to your organization

There are many resources available that you can provide to your users to make them aware of the accessibility capabilities of Office, Windows, and other Microsoft products that you use in your organization.

People supporting users in the organization should also be aware of these accessibility resources. For example, support desk personnel, training staff, adoption teams, and human resources.

### Accessibility tools for Office and Windows users

The following links provide information about accessibility tools available for Office and Windows, organized by area of focus.

- [Accessibility tools for vision](https://support.microsoft.com/topic/b3c57606-e0af-46d2-97b4-fa6b5fba4fa1), for people who are blind, color blind, or have low vision.

- [Accessibility tools for hearing](https://support.microsoft.com/topic/111d7360-cd47-4104-aef1-2a33297909ad), for people who are hard of hearing, have hearing loss, or have deafness.

- [Accessibility tools for neurodiversity](https://support.microsoft.com/topic/6dbd8065-b543-4cf8-bdfb-7c84d9e8f74a), for people who have dyslexia, seizures, autism, or other cognitive differences.

- [Accessibility tools for learning](https://support.microsoft.com/topic/a610cc7f-6cd1-49ff-a543-214cdf9a0710), for people who have learning disabilities or dyslexia

- [Accessibility tools for mobility](https://support.microsoft.com/topic/19ff5a45-2d68-4306-9602-05c0aa967c9f), for people with arthritis, quadriplegia, spinal cord injuries, or other mobility issues.

- [Accessibility tools for mental health](https://support.microsoft.com/topic/76629671-3fc3-4f06-bf65-7ee02d03f540), for people with mental health conditions, such as bipolar disorder, anxiety, PTSD, depression, or ADHD.

### Product specific accessibility resources

The following links provide information about accessibility options available in Microsoft products that might be used in your organization. You can also go to the [Accessibility help & learning](https://support.microsoft.com/accessibility) page and do a search for what you're looking for.

- Office
   - [Accessibility tools for Office](https://support.microsoft.com/office/b5087b20-1387-4686-a0a5-8e11c5f46cdf)
   - [Keyboard shortcuts in Office](https://support.microsoft.com/office/e765366f-24fc-4054-870d-39b214f223fd)
   - [Use a screen reader with Office apps](https://support.microsoft.com/office/4aba5a56-f80c-4a6b-a584-d0f415471617)
   - [Set up your device to work with accessibility in Microsoft 365](https://support.microsoft.com/office/a0ca81c1-fa3e-417e-9d3b-78b8816fce58)
   - [Use color and contrast for accessibility in Microsoft 365](https://support.microsoft.com/office/bb11486d-fc7d-4cd9-b344-16e2bc2a2387)

- Windows
   - [Accessibility support for Windows](https://support.microsoft.com/windows/8b1068e6-d3b8-4ba8-b027-133dd8911df9)
   - [Windows keyboard shortcuts for accessibility](https://support.microsoft.com/windows/021bcb62-45c8-e4ef-1e4f-41b8c1fc87fd)
   - [Keyboard shortcuts in Windows](https://support.microsoft.com/windows/dcc61a57-8ff0-cffe-9796-cb9706c75eec)
   - [Keyboard shortcuts in apps](https://support.microsoft.com/windows/139014e7-177b-d1f3-eb2e-7298b2599a34)
   - [Change color contrast in Windows](https://support.microsoft.com/windows/fedc744c-90ac-69df-aed5-c8a90125e696)
   - [Accessibility information for IT Professionals](/windows/configuration/windows-10-accessibility-for-itpros)

- Teams
   - [Accessibility support for Microsoft Teams](https://support.microsoft.com/topic/d12ee53f-d15f-445e-be8d-f0ba2c5ee68f)
   - [Keyboard shortcuts for Microsoft Teams](https://support.microsoft.com/office/2e8e2a70-e8d8-4a19-949b-4c36dd5292d2)
   - [Quick Start Guide: Using Microsoft Teams with a screen reader](https://support.microsoft.com/topic/c065927a-3c43-4a09-9ad3-d5ecf0c0f8a0)
   - [Configure Microsoft Teams meetings and calls for inclusion (self-paced learning module)](/training/modules/m365-teams-accessibility/)
   - [Accessibility guide for Microsoft Teams Admins](/microsoftteams/accessibility-guide-admin)

- Microsoft Edge
   - [Accessibility features in Microsoft Edge](https://support.microsoft.com/microsoft-edge/4c696192-338e-9465-b2cd-bd9b698ad19a)
   - [Keyboard shortcuts in Microsoft Edge](https://support.microsoft.com/microsoft-edge/50d3edab-30d9-c7e4-21ce-37fe2713cfad)

- SharePoint
   - [Accessibility tools for SharePoint](https://support.microsoft.com/office/0c370f4b-5e27-471a-a14d-fdc58ce5942c)
   - [Keyboard shortcuts in SharePoint Online](https://support.microsoft.com/office/466e33ee-613b-4f47-96bb-1c20f20b1015)
   - [Screen reader support for SharePoint Online](https://support.microsoft.com/office/8cabc607-ab9c-4556-a0bf-275ccabeadab)

- Other apps
   - [Accessibility tools for OneNote](https://support.microsoft.com/office/37ea8231-860c-4a9e-b04b-f14ee4e1c3bd)
   - [Accessibility tools for OneDrive](https://support.microsoft.com/office/3aecd6f4-c67f-4f37-9658-f9d19d35f524)

### Other accessibility resources

The following list provides other accessibility resources that you might find helpful.

- [Enterprise Disability Answer Desk](https://support.microsoft.com/accessibility/enterprise-answer-desk), which is a support resource for organizations that have questions about the accessibility of Microsoft products and product compliance.

- [Microsoft Accessibility website](https://www.microsoft.com/accessibility), which provides information about the range of assistive technologies from Microsoft.

- [Microsoft Accessibility blog](https://blogs.microsoft.com/accessibility/), which provides news and announcements from Microsoft about accessibility. 

- [Microsoft 365 Accessibility Adoption Guide](https://adoption.microsoft.com/files/access/index.html), which provides accessibility data points, downloadable flyers, and links to case studies and to other accessibility resources.

- [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap), which provides a list of Microsoft 365 features in development, rolling out, and launched.

- ["Accessibility fundamentals" learning path](/training/paths/accessibility-fundamentals/), a series of four self-paced learning modules.
