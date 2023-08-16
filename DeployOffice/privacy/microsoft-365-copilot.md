---
title: "Data, Privacy, and Security for Microsoft 365 Copilot"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
description: "Provides information about Microsoft 365 Copilot works, along with information about privacy and security aspects of Copilot."
hideEdit: true
ms.date: 06/21/2023
---

# Data, Privacy, and Security for Microsoft 365 Copilot

> [!IMPORTANT]
> The information in this article only applies to the [Microsoft 365 Copilot Early Access Program](/microsoft-365/admin/copilot/m365-early-access-program), an invite-only paid preview program for commercial customers. Details are subject to change.

[Microsoft 365 Copilot](https://www.microsoft.com/microsoft-365/blog/2023/03/16/introducing-microsoft-365-copilot-a-whole-new-way-to-work/) is a sophisticated processing and orchestration engine that provides AI-powered productivity capabilities by coordinating the following components:

- Large language models (LLMs)
- Your content in Microsoft Graph, such as your emails, chats, and documents, as well as security and permissions defined by you.
- The Microsoft 365 apps that you use every day, such as Word and PowerPoint.

For an overview of how these three components work together, watch these videos:

- [The Copilot System: Explained by Microsoft](https://www.youtube.com/watch?v=E5g20qmeKpg)
- [How Microsoft 365 Copilot works](https://www.youtube.com/watch?v=B2-8wrF9Okc)

Microsoft 365 Copilot will continue to evolve over time with new capabilities. As it does, we'll continue to provide you with updated information your organization needs to be successful with and get the most benefit out of Microsoft 365 Copilot. To keep up to date on Microsoft 365 Copilot or ask questions, visit the [Microsoft 365 Copilot community](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/ct-p/Microsoft365Copilot) on the Microsoft Tech Community.

From the outset, the following Microsoft 365 Copilot principles are foundational to our commitment to our customers.

- **Built on Microsoft’s comprehensive approach to security, compliance, and privacy.** Copilot is built on top of and integrated with Microsoft 365. This integration enables you to take advantage of the existing Microsoft security, compliance, and privacy solutions that you’ve already deployed in your organization as well as other controls that may be made available to help you configure the use of Copilot as appropriate for your organization.

- **Architected to protect tenant, group, and individual data.** We know a major concern for customers is staying in control of access to business data within the organization. Within your tenant, we provide a permissions model that helps ensure that the right groups and users have access only to the data they’re supposed to have access to.

- **Committed to responsible AI.** Microsoft is committed to making sure AI systems are developed responsibly and in ways that warrant people’s trust. This work is guided by a [core set of principles](https://www.microsoft.com/ai/our-approach): fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability.

## How does Microsoft 365 Copilot work?

Microsoft 365 Copilot capabilities that users see in Microsoft 365 apps and other surfaces appear as intelligent features, functionality, and prompting capability. Beneath that, our foundation models and proprietary Microsoft technologies work together in an underlying system that helps you securely access, use, and manage your business data.

- **Microsoft 365 apps** (such as, Word, Excel, PowerPoint, Outlook, Teams, and Loop) operate with Copilot to support users in the context of their work. For example, Copilot in Word is designed to assist users specifically in the process of creating, comprehending, and editing documents. In a similar way, Copilot in the other apps helps users in the context of their work within those apps.

- **Chat** enables Copilot users to make use of cross-app intelligence, which allows users with a simpler way to work with multiple apps. Users access cross-app intelligence by chat in the same way they would interact using open prompts with ChatGPT or Bing chat. Those prompts access the core training data in the LLM as well as users’ business data and apps to surface the information and insights they need from their organization’s data. Prompts work with Copilot across a range of experiences, including Teams (chat), Bing, Microsoft Edge, and the Microsoft 365 app.

- **Microsoft Graph** has long been fundamental to Microsoft 365. It includes information about the relationships between users, activities, and your organization’s data, working together with the Semantic Index for Copilot, as well as orchestrating information retrieval steps using search. The Microsoft Graph API brings additional context from customer signals into the prompt, such as information from emails, chats, documents, and meetings. For more information, see [Overview of Microsoft Graph](/graph/overview) and [Major services and features in Microsoft Graph](/graph/overview-major-services).

- **Semantic Index** for Copilot uses multiple LLMs that sit on top of Microsoft Graph to interpret user queries and produce sophisticated, meaningful, and multilingual responses that help you to be more productive. It allows you to search quickly through billions of vectors (mathematical representations of features or attributes) to connect you with the most relevant and actionable information in your organization. For more information, [review this video](https://www.youtube.com/watch?v=KtsVRCsdvoU).

These elements are all connected together as the Copilot System, the common underlying AI stack, including foundation LLM, AI platform, skills repository, and runtime that powers user experiences for Bing chat, Copilot in Microsoft 365 apps, and cross-app intelligence.

The following diagram provides a visual representation of how Microsoft 365 Copilot works.

:::image type="content" source="../images/privacy/microsoft-365-copilot-flow.png" alt-text="Diagram that shows the relationship among the components of Microsoft 365 Copilot, such as Microsoft Graph and LLM":::

Here's an additional explanation of how Microsoft 365 Copilot works:

- Copilot receives an input prompt from a user in an app, like Word or PowerPoint.

- Copilot then pre-processes the prompt through an approach called grounding, which improves the specificity of the prompt, ensuring that you get answers that are relevant and actionable to your specific task. It does this, in part, by making a call to Microsoft Graph and accessing your organization’s data. Data used by Copilot for an authenticated user is scoped to the documents and data that are already visible to them through existing Microsoft 365 role-based access controls.  

- This retrieval of information is referred to as retrieval-augmented generation. It allows Copilot to provide exactly the right type of information as input to an LLM, combining this user data with other inputs such as information retrieved from knowledge base articles to improve the prompt. Copilot takes the response from the LLM and post-processes it. This post-processing includes additional grounding calls to Microsoft Graph, responsible AI checks, security, compliance and privacy reviews, and command generation.

- Copilot returns a recommended response to the user, and commands back to the apps where a user can review and assess the suggested response. Copilot iteratively processes and orchestrates these sophisticated services to produce results that are relevant to your business because it’s contextually based on your organization’s data.

## How does Copilot use your proprietary business data?

Copilot unlocks business value by connecting LLMs to customer business data, designed with security, compliance, and privacy in mind.

Copilot accesses content and context through Microsoft Graph. It can generate responses anchored in the customer’s business content, such as user documents, emails, calendar, chats, meetings, contacts, and other business data. Copilot combines this content with the user’s working context, such as the meeting a user is in now, the email exchanges the user has had on a topic, or the chat conversations the user had last week. Copilot uses this combination of content and context to help deliver accurate, relevant, contextual responses.

> [!IMPORTANT]
> Customer data (including prompts, responses, and data accessed through the Microsoft Graph) isn't used to train the foundation LLMs that Copilot uses.

Copilot only surfaces organizational data to which individual users have at least view permissions. It's important that you're using the permission models available in Microsoft 365 services, such as SharePoint, to help ensure the right users or groups have the right access to the right content within your organization.  

Only the current user’s tenant Microsoft 365 cloud content for the current user is surfaced. Copilot won't search other tenants that the user may also be a B2B guest on, or non-current user’s tenants that have been set up with either cross-tenant access or cross-tenant sync.

When you input prompts using Copilot, the information contained within your prompts, the data they retrieve, as well as the generated responses remain within the Microsoft 365 compliance boundary, in keeping with our current data security and compliance commitments.

Each standard tenant has its own Copilot orchestrator instance, which relies on [Microsoft Search](/microsoftsearch/overview-microsoft-search) to collate information. Individual orchestrator instances help ensure data doesn't leave an organization's compliance boundary.

The only input to the model is the prompt. However, the prompt can also include input files or content discovered and presented to the user (by the tenant's Copilot orchestrator instance) that the user selected for input to the LLM.

> [!NOTE]
> We may use customer feedback, which is optional, to improve Copilot, just like we use customer feedback to improve other Microsoft 365 services and Microsoft 365 apps. We don't use this feedback to train the foundation models used by Copilot. Customers can manage feedback through admin controls. For more information, see [Manage Microsoft feedback for your organization](/microsoft-365/admin/manage/manage-feedback-ms-org).

### Extensibility

While Copilot is already able to use the apps and data within the Microsoft 365 ecosystem, many users still depend on various external tools and services for work management and collaboration. Customers can address this gap by extending Copilot to enable users to work with their third-party tools and services, unlocking the full potential of Microsoft 365 Copilot. This can be done through extending Microsoft 365 Copilot by building a plug-in or by connecting to an external data source. For more information, see [Microsoft Graph connectors overview](/graph/connecting-external-content-connectors-overview).

### About the content that Copilot creates

The responses that generative AI produces aren't guaranteed to be 100% factual. While we continue to improve responses, people should still use their judgment when reviewing the output before sending them to others. Our Copilot capabilities provide useful drafts and summaries to help you achieve more while giving you a chance to review the generated AI rather than fully automating these tasks.

We continue to improve algorithms to proactively address issues, such as misinformation and disinformation, content blocking, data safety, and preventing the promotion of harmful or discriminatory content in line with our [responsible AI principles](https://www.microsoft.com/ai/our-approach).

Microsoft doesn't claim ownership of the content created by Copilot capabilities. Generative AI systems may produce similar responses to similar prompts or queries from multiple users or customers. As copyright and other laws relating to ownership vary by jurisdiction, Microsoft doesn’t make any determination on whether the content created by Copilot capabilities is copyright-protected.

## How does Copilot protect sensitive business information and data?

The permissions model within your Microsoft 365 tenant can help ensure that data won't unintentionally leak between users, groups, and tenants. Microsoft 365 Copilot presents only data that each individual can access using the same underlying controls for data access used in other Microsoft 365 services. Semantic Index honors the user identity-based access boundary so that the grounding process only accesses content that the current user is authorized to access. For more information, see Microsoft’s [privacy policy and service documentation](https://privacy.microsoft.com/).  

Data protected using Microsoft Purview Information Protection (MPIP or AIP) labeling will continue to be protected according to those policies. While Copilot generated content currently doesn't inherit MPIP labels from the source, Copilot cites the original source, which will retain the label.

We already implement multiple forms of protection to help prevent customers from compromising Microsoft 365 services and applications or gaining unauthorized access to other tenants or the Microsoft 365 system itself. Here are some examples of those forms of protection.

- Logical isolation of customer content within each tenant for Microsoft 365 services is achieved through Azure Active Directory authorization and role-based access control. For more information, see [Microsoft 365 isolation controls](/compliance/assurance/assurance-microsoft-365-isolation-controls).

- Microsoft uses rigorous physical security, background screening, and a multi-layered encryption strategy to protect the confidentiality and integrity of customer content.

- Microsoft 365 uses service-side technologies that encrypt customer content at rest and in transit, including BitLocker, per-file encryption, Transport Layer Security (TLS) and Internet Protocol Security (IPsec). For specific details about encryption in Microsoft 365, see [Encryption in the Microsoft Cloud](/microsoft-365/compliance/office-365-encryption-in-the-microsoft-cloud-overview).

- Your control over your data is reinforced by Microsoft's commitment to comply with broadly applicable privacy laws, such as the GDPR, and privacy standards, such as ISO/IEC 27018, the world’s first international code of practice for cloud privacy.

- For content accessed through Copilot plug-ins, encryption can exclude programmatic access, thus limiting the plug-in from accessing the content. For more information, see [Configure usage rights for Azure Information Protection](/azure/information-protection/configure-usage-rights).

## Data residency and sovereignty

Microsoft 365 Copilot calls to the LLM are routed to the closest data centers in the region, but also can call into other regions where capacity is available during high utilization periods. The LLM call processes customer data in memory and returns the response and other customer content artifacts to the home region. No customer content data is written outside the home region for the user. For European Union users, we have additional safeguards to comply with the [EU Data Boundary](/privacy/eudb/eu-data-boundary-learn). EU traffic stays within the EU Data Boundary while worldwide traffic can be sent to EU and other geographies for LLM processing.

## Meeting requirements for regulatory compliance mandates

As regulation in the AI space evolves, Microsoft will continue to adapt and respond to fulfill future regulatory requirements.

Microsoft 365 Copilot is built on top of Microsoft’s current commitments to data security and privacy in the enterprise. There's no change to these commitments. Microsoft 365 Copilot is integrated into Microsoft 365 and adheres to all existing privacy and compliance obligations.  For more information, see [Microsoft Compliance](/compliance).

> [!NOTE]
> Currently, Microsoft 365 Copilot operates under the terms of the Early Access Program. When Microsoft 365 Copilot becomes generally available, it will operate under the [Microsoft 365 Product Terms](https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/).

Beyond adhering to regulations, we prioritize an open dialogue with our customers, partners, and regulatory authorities to better understand and address concerns, thereby fostering an environment of trust and cooperation. We acknowledge that privacy, security, and transparency aren't just features, but prerequisites in the AI-driven landscape.

## Additional information

### Other details about Microsoft 365 Copilot

- Microsoft 365 Copilot use Azure OpenAI services for processing, not OpenAI’s publicly available services.
- Microsoft 365 Copilot uses a combination of Generative Pre-Trained Transformers (GPT) models, including GPT 4. GPT is an example of a large language model (LLM).
- The [privacy controls for connected experiences](manage-privacy-controls.md#policy-settings-for-connected-experiences) available with Microsoft 365 Apps don't apply to Microsoft 365 Copilot.
- For information about the difference between Microsoft 365 Copilot and ChatGPT, see [ChatGPT vs. Microsoft 365 Copilot: What's the difference?](https://support.microsoft.com/topic/8fdec864-72b1-46e1-afcb-8c12280d712f).

### Committed to responsible AI

As AI is poised to transform our lives, we must collectively define new rules, norms, and practices for the use and impact of this technology. Microsoft has been on a Responsible AI journey since 2017, when we defined our principles and approach to ensuring this technology is used in a way that is driven by ethical principles that put people first.

At Microsoft, we're guided by our [AI principles](https://www.microsoft.com/ai/our-approach), our [Responsible AI Standard](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE5cmFl), and decades of research on AI, grounding, and privacy-preserving machine learning. A multidisciplinary team of researchers, engineers and policy experts reviews our AI systems for potential harms and mitigations — refining training data, filtering to limit harmful content, query- and result-blocking sensitive topics, and applying Microsoft technologies like [InterpretML](https://www.microsoft.com/research/uploads/prod/2020/05/InterpretML-Whitepaper.pdf) and [Fairlearn](https://fairlearn.org/) to help detect and correct data bias. We make it clear how the system makes decisions by noting limitations, linking to sources, and prompting users to review, fact-check, and adjust content based on subject-matter expertise. For more information, see [Governing AI: A Blueprint for the Future](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RW14Gtw).

We aim to help our customers use our AI products responsibly, sharing our learnings, and building trust-based partnerships. For these new services, we want to provide our customers with information about the intended uses, capabilities, and limitations of our AI platform service, so they have the knowledge necessary to make responsible deployment choices. We also share resources and templates with developers inside enterprises and with ISVs, to help them build effective, safe, and transparent AI solutions.

### Preparing your organization for Microsoft 365 Copilot

To access and use Copilot in Microsoft 365, there are certain prerequisites you need to meet. For example, you must have a Microsoft E3/E5 subscription plan and be using Azure Active Directory-based accounts. There are also requirements for using Copilot in specific apps, such as having the new Outlook for Windows. For more information, see [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566) and [Get started with Copilot in Microsoft 365](/microsoft-365/admin/copilot/m365-copilot-setup).

Beyond the basic prerequisites and product-specific requirements, there are some ways that you can prepare your organization now so that when you’re ready to deploy Copilot in Microsoft 365, you get the most benefit of its capabilities. For example, make sure your organization has the right information access controls and policies in place. Remember, Copilot only retrieves information the user explicitly has access to, such as files stored in SharePoint. For more information, [watch this video](https://youtu.be/oeX0lsMA69U).

### Other Microsoft products that make use of AI

The following links provide information about some other Microsoft products that make use of AI.

- [Bing](https://blogs.microsoft.com/blog/2023/02/07/reinventing-search-with-a-new-ai-powered-microsoft-bing-and-edge-your-copilot-for-the-web/)
- [Microsoft Designer](https://create.microsoft.com/learn/articles/how-to-image-prompts-dall-e-ai)
- [Azure AI](https://azure.microsoft.com/solutions/ai/#overview)
- [Microsoft Dynamics 365 Copilot](https://blogs.microsoft.com/blog/2023/03/06/introducing-microsoft-dynamics-365-copilot/)
- [Microsoft Security Copilot](https://www.microsoft.com/security/business/ai-machine-learning/microsoft-security-copilot?rtc=1)
- [GitHub Copilot](https://github.blog/2023-03-22-github-copilot-x-the-ai-powered-developer-experience/)
- [Copilot in Power Platform](https://cloudblogs.microsoft.com/powerplatform/2023/03/16/power-platform-is-leading-a-new-era-of-ai-generated-low-code-app-development/)