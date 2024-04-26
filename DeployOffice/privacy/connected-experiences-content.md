---
title: "Connected experiences and your content"
description: "Provides information about how connected experiences for Microsoft 365 Apps use content to provide its functionality and how that content is managed and secured."
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: high
ms.collection: privacy-microsoft365
hideEdit: true
ms.date: 04/26/2024
---

# Connected experiences and your content

Microsoft 365 Apps consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. The following list provides some examples of connected experiences:
- Translate the contents of a Word document into a different language.
- Provide real-time automatic captions or subtitles when giving a PowerPoint presentation.
- Get suggested words or phrases as you compose an email in Outlook.
- Insert an online picture into an Excel workbook based on a search query.

For a more complete list of connected experiences, including for Project and Visio, see [Connected experiences in Office](connected-experiences.md).

For a connected experience to perform its function to help you accomplish a task, information must be shared between the client application and the Microsoft cloud (or in a small number of instances, [third-party service](optional-connected-experiences.md#experiences-that-rely-on-other-microsoft-owned-online-services-andor-services-owned-by-third-parties) offering the given functionality). In some cases, that information is text you typed into a search field, or selected text in your document or Excel cell.

For more information, see [Appendix: Content used by connected experiences](#appendix-content-used-by-connected-experiences).

> [!IMPORTANT]
> The content that a connected experience uses to perform its function to help you accomplish a task is not used for the purposes of profiling you or for the purposes of targeting advertising at you.

The connected experience processes the content it receives to perform its function to help you accomplish a task. When the content is no longer needed, it's immediately deleted (that is, it's not retained). There are, however, a few connected experiences that retain a portion of this content. For more information, see [Content retained by a connected experience](#content-retained-by-a-connected-experience).

Microsoft takes its responsibility to safeguard your content seriously. For more information, see [Securing content used by a connected experience](#securing-content-used-by-a-connected-experience).

Some connected experiences use machine learning services to perform their function to help you accomplish a task. For a list of those connected experiences, see [Connected experiences and machine learning](#connected-experiences-and-machine-learning).

> [!NOTE]
> - For information about privacy controls available to manage connected experiences, see [Overview of privacy controls for Microsoft 365 Apps for enterprise](overview-privacy-controls.md).
> - For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).
> - For information about Microsoft Teams, see [Privacy and Microsoft Teams](/microsoftteams/teams-privacy) and [Location of data in Microsoft Teams](/microsoftteams/location-of-data-in-teams).

## Connected experiences that analyze your content

To perform their function to help you accomplish a task, some connected experiences analyze content that you’ve created. Common examples include translating text in a document, checking spelling in an email, or suggesting design changes to a presentation.

With Editor, for example, when you check the spelling of a word, that word and some of the words before and after that word is sent to Microsoft. No more than five words are sent at a time. If you’re checking grammar or style, one sentence at a time is sent to the Microsoft service that is designed to perform this task.

When required, a connected experience sends content to Microsoft so that the connected experience can perform its function to help you accomplish a task. Content can be sent when you ask the connected experience to perform a task, such as translating some text in a document. In other cases, like the grammar checker, it can occur at pre-defined intervals.

For more information, see [Appendix: Content used by connected experiences](#appendix-content-used-by-connected-experiences).

> [!NOTE]
> As they’re used, connected experiences send [required service data](required-service-data.md). This data includes information needed to keep the underlying service secure, up to date, and performing as expected.

## Content retained by a connected experience

Most connected experiences don’t retain your content after performing their function to help you accomplish a task, but there are a few exceptions. In those cases, Microsoft retains the content for as long as your account exists and it’s used to support, personalize, or improve that connected experience. While it’s retained, the content is encrypted. For more information, see [Securing content used by a connected experience](#securing-content-used-by-a-connected-experience).

The following table lists the few connected experiences that retain content, along with a description of when and why the content may be retained, and how you might benefit. For each connected experience in the table, the content is retained for as long as your account exists and is stored in the same location as your Exchange Online data. For more information, see [Where Microsoft stores data for Microsoft 365 customers](#where-microsoft-stores-data-for-microsoft-365-customers).

|Connected experience  |Description  |
|---------|---------|
|Editor, including Text predictions | Some components of Editor retain content, such as corrected spelling or recommended grammar edits, and whether you accepted them. <br/><br/> This data allows the service to adapt to your preferences and to reduce otherwise irrelevant or annoying recommendations. For example, you might prefer to use contractions in documents. "Ignoring" recommendations to spell out contractions teaches the service this preference. |
|PowerPoint Designer |Microsoft retains information about which automatically generated designs are offered, which are considered, and which are used.<br/><br/> This information is used to help the service adapt to your preferences and to recommend more relevant images. |

> [!NOTE]
> - Some connected experiences rely on a search query you’ve entered to find and download online content from Microsoft that might be useful for your work. For example, templates, fonts, pictures, and Office Help. In these cases, your search query isn’t retained.
> - For connected experiences that [rely on Bing](optional-connected-experiences.md#experiences-that-rely-on-bing), metadata (for example, the query, the result, and time to deliver) is retained, but isn't linked to your identity. Personal identifying information isn’t retained. In aggregate, the data that is retained provides critical feedback to test and improve performance.

There are some connected experiences that create and retain your content. For example, when you use a connected experience to do the following task:

- Publish a video of your PowerPoint presentation to Microsoft Stream
- Publish your Excel workbook to a Power BI workspace
- Create a transcript of an audio file or a recording in Word for the web

But for each of these connected experiences, the content is stored in a location that is under your control. For example, the transcript is stored in your OneDrive. Also, you control how long the content is retained.

## Securing content used by a connected experience

Content sent from your device by the connected experience, to perform its function to help you accomplish a task, is encrypted using Transport Layer Security (TLS), version 1.2 or higher. (This is sometimes referred to as "data in motion.")

Content that is retained by Microsoft is encrypted while it’s stored. (This is sometimes referred to as "data at rest.")

For more information, see [Encryption and key management overview](/compliance/assurance/assurance-encryption).

### Where Microsoft stores data for Microsoft 365 customers

For information about where Microsoft stores data for Microsoft 365 customers, see the following articles:
- [Where your Microsoft 365 customer data is stored](/microsoft-365/enterprise/o365-data-locations)
- [Overview of Product Terms Data Residency](/microsoft-365/enterprise/m365-dr-product-terms-dr)
- [What is the EU Data Boundary?](/privacy/eudb/eu-data-boundary-learn)

### How Microsoft controls access to Microsoft 365 data

Microsoft 365 uses a [multi-layered access control approach](/compliance/assurance/assurance-microsoft-365-account-management) built on the principle of least privilege and incorporating data access controls and audits. Nearly all service operations performed by Microsoft are fully automated, and access to customer data by Microsoft operations and support personnel is denied by default. Only in rare cases does a Microsoft engineer need access to customer data, typically at a customer’s request to resolve an issue.

To ensure that no one has unapproved physical, logical, or remote access to Microsoft 365 data, Microsoft employs a series of [isolation controls](/compliance/assurance/assurance-microsoft-365-isolation-controls) and [personnel controls](/compliance/assurance/assurance-human-resources). Access to customer data is highly restricted by role-based access controls, multifactor authentication, data minimization and other controls. In addition, Microsoft performs extensive [audit logging and monitoring](/compliance/assurance/assurance-audit-logging) of all delegation, privileges, and operations that occur within Microsoft 365. All access to customer data is strictly logged, and both Microsoft and third parties perform regular audits (as well as sample audits) to attest that any access is appropriate.

For more information, see [Identity and access management overview](/compliance/assurance/assurance-identity-and-access-management).

## Connected experiences and machine learning

Some connected experiences use machine learning services to perform their function to help you accomplish a task. For example, machine learning services are used to help with the following tasks:

- Analyze your cell contents in an Excel workbook to provide PivotTable recommendations.
- Review the contents of an email that you receive to provide suggested replies.
- Use the search query that you enter using Tap in Word to rank the search results to improve relevance.

The following connected experiences use machine learning services:

- Analyze Data
- Editor
- Immersive Reader
- Ink to Test, Ink to Shape, Ink to Math
- Live captions & subtitles
- PivotTable recommendations
- Suggested replies
- Tap
- Text predictions
- Transform to Web page

> [!IMPORTANT]
> - These machine learning services are not used for the purposes of profiling you or for the purposes of targeting advertising at you.
> - Microsoft is committed to the responsible use of machine learning. For more information, see [Responsible AI](https://www.microsoft.com/ai/responsible-ai).

## Appendix: Content used by connected experiences

The following table lists the content used by connected experiences when performing their function to help you accomplish a task. The table also lists whether Microsoft is the processor or controller of the content. For more information about that role, see [Role of Microsoft and Data Subject Requests (DSRs)](#role-of-microsoft-and-data-subject-requests-dsrs).

| Connected experience                   | Content used                                                                                                      | Role of Microsoft |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------------|-------------------|
| 3D Maps <sup>[1]</sup>                 | Cell contents of an Excel workbook                                                                                | Controller        |
| Analyze Data                           | Cell contents of an Excel workbook                                                                                | Processor         |
| Automatic alt txt                      | Images inserted into the document, workbook, presentation, or email                                               | Processor         |
| Data types                             | Cell contents of an Excel workbook                                                                                | Processor         |
| Dictation                              | Audio captured by the microphone while creating a document, email, or presentation                                | Processor         |
| Editor                                 | Up to one sentence at a time from the document or email                                                           | Processor         |
| Friendly links                         | URL and name of a file stored on OneDrive or SharePoint                                                           | Processor         |
| Immersive Reader                       | Contents of a Word document                                                                                       | Processor         |
| Ink to Text, Ink to Shape, Ink to Math | The current slide and selected ink in a PowerPoint presentation                                                   | Processor         |
| Insert data from picture               | Data from a screenshot on the Clipboard, from a photo from an iPhone camera, or from an image file on the device. | Processor         |
| Live captions & subtitles              | Audio captured by the microphone while giving a PowerPoint presentation                                           | Processor         |
| Map chart <sup>[1]</sup>               | Cell contents of an Excel workbook                                                                                | Controller        |
| Math Assistant                         | Math equations in a OneNote Class Notebook                                                                        | Processor         |
| PivotTable recommendations             | Cell contents of an Excel workbook                                                                                | Processor         |
| PowerPoint Designer                    | Content from the current presentation, including the current slide and slide masters                              | Processor         |
| Publish to Microsoft Stream            | Video created from a PowerPoint presentation                                                                      | Processor         |
| Publish to Power BI                    | Contents of an Excel workbook                                                                                     | Processor         |
| Read Aloud                             | Contents of a Word document                                                                                       | Processor         |
| Research <sup>[1]</sup>                | Word or phrase selected in a document or a search term typed into the Research pane                               | Controller        |
| Reuse Files                            | Recent and recommended documents, workbooks, and presentations                                                    | Processor         |
| Scan a business card                   | Business card scanned by using Office Lens                                                                        | Processor         |
| Similarity checker <sup>[1]</sup>      | Contents of a Word document                                                                                       | Controller        |
| Smart Lookup <sup>[1]</sup>            | Word or phrase selected in a document, or email                                                                   | Controller        |
| Speaker Coach                          | Audio captured by the microphone while rehearsing a slide show in PowerPoint                                      | Processor         |
| Suggested replies                      | Contents of an email received in Outlook                                                                          | Processor         |
| Text predictions                       | Up to one sentence at a time from a Word document                                                                 | Processor         |
| Transcribe                             | Audio file or a recording in Word for the web or in OneNote                                                       | Processor         |
| Transform to Web Page                  | Contents of a Word document                                                                                       | Processor         |
| Translator                             | The selected content or the entire document (depending on your request)                                           | Processor         |

> [!NOTE]
> <sup>[1]</sup> When users are signed in with a work or school account, these connected experiences are optional connected experiences. For optional connected experiences, Microsoft’s role is as controller of the content. For more information, see [Overview of optional connected experiences in Office](optional-connected-experiences.md).

### Role of Microsoft and Data Subject Requests (DSRs)

The role listed in the third column of the preceding table is based on you being signed in with a work or school account. However, if you’re signed in with a Microsoft account, such as a personal outlook.com email address, then Microsoft acts as a controller for the connected experiences.

The European Union General Data Protection Regulation (GDPR) gives rights to people (known in the regulation as data subjects) to request their personal data that has been collected by the data controller. A formal request by a data subject to a controller to take an action on their personal data is called a Data Subject Request (DSR).

Microsoft strongly supports this right. When Microsoft acts as a data processor of personal data processed in connection with the use of Microsoft 365 Apps, they process such data only on the documented instructions of the commercial customer as the data controller. To support fulfilling DSRs, Microsoft provides the data controllers with the administrative tools and documentation to help them respond to DSRs. For more information, see [Data Subject Requests and the GDPR and CCPA](/compliance/regulatory/gdpr-data-subject-requests).

## Related articles

- [Privacy at Microsoft](https://privacy.microsoft.com/)
- [Microsoft Trust Center](https://www.microsoft.com/trust-center/)
- [Microsoft Online Services Data Protection Addendum (DPA)](https://www.microsoft.com/licensing/docs/view/Microsoft-Products-and-Services-Data-Protection-Addendum-DPA)
- [What is the EU Data Boundary?](/privacy/eudb/eu-data-boundary-learn)
