---
title: Right-sizing your initial deployment of Microsoft 365 Apps
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Right-sizing your initial deployment of Microsoft 365 Apps."
ms.date: 05/25/2024
---

# Right-sizing your initial deployment of Microsoft 365 Apps

> [!NOTE]
> Authored by the Microsoft 365 Apps Rangers, this article outlines common practices observed across customer implementations. We advise assessing the relevance of this guidance for your organization and adapting the approach as necessary.

When you plan a Microsoft 365 Apps deployment using Configuration Manager in a multi-language enterprise environment, you might face the following challenge: To prevent overloading your corporate internet connections, you  want to include as many source files for different languages as possible in the on-premises deployment package. But including many languages increases the on-premises LAN/WAN traffic, because all distribution points and managed clients will download the whole package, regardless of what they actually need.

Either extreme (host everything on-premises or host nothing) isn't feasible for most organizations. This article shows how to balance the impact on internet and on local resources.

There are three goals:

- Reduce the impact on your company's internet circuits as much as possible.
- Reduce the impact on your internal network as much as possible.
- Use a minimum number of deployment packages to reduce on-going maintenance costs.

This article applies to the initial on-premises deployment of Microsoft 365 Apps. In other articles, we cover how to best support [remote workers](https://techcommunity.microsoft.com/t5/office-365-blog/deploy-office-365-proplus-to-remote-workers/ba-p/1258514) and optimize [subsequent installations of Visio, Project, or other language packs](build-dynamic-lean-universal-packages.md).

Let's first look at a sample scenario and how we determine the right balance. Then we'll walk through the steps to implement the solution.

## Sample scenario and solution

Let's look at a sample scenario in a typical enterprise environment:

- The IT department supports 24 different languages for Microsoft 365 Apps.
- IT uses Microsoft Configuration Manager to manage 50,000 devices around the globe.
- A few internet breakouts occur. These are always congested.
- The goal is to upgrade within six months.

We could include all the languages in one on-premises deployment package to reduce impact on internet breakouts to zero. But including 24 languages inflates the package size to about 8 gigabytes. Because Configuration Manager synchronizes the full package to each device regardless of what the device actually needs, this package size causes 400 terabytes of LAN traffic (8 gigabytes * 50,000 devices).

At the other extreme, we could remove all the source files, and use Configuration Manager only to initiate the installation. We would rely on the Office content delivery network (CDN) to supply just the required source files. This method would ensure that each device will only download what it needs. But the files all come from the internet. If we assume that every other device needs one extra language, we'd end up with roughly 81 terabytes of traffic from the internet (50,000 devices * 1.5 GB plus 25,000 devices * 0.25 GB). That's a great reduction in overall traffic, but it would contribute to internet access congestion.

Instead of creating one large deployment package, we could also create one base deployment (Microsoft 365 Apps with one language) and 24 additional packages, one for each language as described in the [deploy languages](../deploy/overview-deploying-languages-microsoft-365-apps.md#deploy-languages-to-existing-installations-of-microsoft-365-apps) article. This option reduces the amount of content that's synchronized per device, but increases complexity and the total amount of data stored on distribution points. Targeting each device with the right set of packages is complex, and we would then have to maintain 25 individual deployment packages going forward.

The good news is that we don't have to go to extremes. Instead, we can use a feature called *AllowCdnFallback*. When this option is enabled, the installation engine can fall back to Office CDN for each language pack that it can't find locally in the *Ccmcache* folder. This method lets us replace LAN/WAN bandwidth with internet bandwidth. If only one device needs a specific language pack, the device will have to download about 250 megabytes. But if we remove this language from the source file set, it saves 49,999 other devices from synchronizing the source files from distribution points (~12.5 terabytes). This sounds like a good deal!

To identify which language packs to exclude, we can generate an overview of how often each language pack is installed. Then we add up the number of all language pack installations and calculate the share of each one. Typically, the distribution isn't even. A small subset of language packs usually accounts for most installations, as the following example shows:

:::image type="content" source="./media/right-sizing-initial-deployment/right-sizing-initial-deployment-1.png" alt-text="A screenshot of a table showing how the individual install base of language packs is summed up to the overall coverage.":::

In this case, just 8 out of 24 language packs (nl-nl, fr-fr, pt-br, es-es, it-it, de-de, pl-pl, and ru-ru) account for 92 percent of all language pack installations. The remaining 16 language packs are only installed on 8 percent of devices. Based on this data, we can calculate the impact on the on-premises WAN/LAN and internet connections (caused by devices having to download another source files):

:::image type="content" source="./media/right-sizing-initial-deployment/right-sizing-initial-deployment-2.png" alt-text="A screenshot of a spreadsheet showing the different impact on LAN/WAN and internet bandwidth for different language pack combinations.":::

We can see the two extremes (no/all source files) and the impact on the LAN/WAN traffic and internet bandwidth consumed. But if we include just the eight language packs mentioned previously, we can balance out those. Compared to handling everything on-prem, package size will be reduced by about 50 percent. We would reduce LAN/WAN network traffic by more than 180 terabytes. The trade-off is that 1,800 devices will now have to download one of the excluded languages, generating approximately 450 gigabytes of traffic. Across all workdays from our targeted 6-month rollout window, this is approximately 3.5 gigabytes per day. If we add [Client Peer Cache](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache), [Delivery Optimization](../updates/delivery-optimization.md), and [Microsoft Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) to the mix, we might be able to reduce the network impact even further.

In our scenario, we decided to go with eight language packs, which will save time and network bandwidth during the first sync across all distribution points and client devices. We'll also apply this on-premises/cloud split to future Office updates, so the customer benefits from the split every month, not only during the initial deployment.

## How to implement a right-sized deployment

### Identify your most-used language packs

First, you need to know how often each individual language pack is installed in your environment. If you're using Configuration Manager, you can run the following query against the database to get an overview and count of installed language pack:

```sql
select count (distinct resourceid) as total, DisplayName0 from v_Add_Remove_Programs where DisplayName0 like 'Microsoft Office Language Pack%' group by resourceid, DisplayName0

```

Adjust the query to your needs. Keep in mind that even a rough estimate of language pack distribution is fine. Copy the data into Microsoft Excel, sort by number of installations, and calculate the total number of installations. Then calculate the individual share of each language pack, and start summing those up as shown above.

This method enables you to quickly determine three key factors:

- Which group of language packs is standing for most of your install base?
- How many installations of language packs aren't covered by this primary group?
- What's the saving on WAN/LAN network traffic and impact on internet bandwidth?

For the last bullet, do these calculations for each group:

- Saved WAN/LAN bandwidth: Multiply the number of managed devices by 0.25 gigabyte by the number of language packs excluded.
- Required internet bandwidth: Multiply the sum of the install count for excluded language packs by 0.25 gigabyte.

For the above table, it could look like this:

:::image type="content" source="./media/right-sizing-initial-deployment/right-sizing-initial-deployment-3.png" alt-text="A screenshot of a table showing the savings per language pack combination.":::

Decide which language packs you want to include and record this information.

### Adjust your Configuration Manager application

The next step is to craft a deployment package that includes the selected language packs and allows devices to fall back to the Office CDN for missing content.

1. Make sure that the account (user or SYSTEM) that's used to install Microsoft 365 Apps can connect to the internet [as documented](/microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online).
2. Launch Configuration Manager and navigate to **Software Library**. Open the **Office 365 Client Management** node and start the **Office 365 Installer** wizard.
3. Select through the wizard and make sure to select all the languages you want to include.
4. When the wizard finishes, you need to adjust the configuration file to allow Office CDN fallback and instruct the setup engine to dynamically determine which languages to install instead of hard coding them. Navigate to your content source folder and open the configuration.xml file in an editor.
5. Remove all the hard-coded languages and replace them with a combination of these items:

   - Specific languages you want to always install. 
   - Add ID="[MatchPreviousMSI](../upgrade-from-msi-version.md#install-the-same-language-resources)" if you want to carry forward any already installed languages. 
   - Add ID="[MatchOS](../deploy/overview-deploying-languages-microsoft-365-apps.md#install-the-same-languages-as-the-operating-system)" if you want to install languages that match the Windows display language.

6. Also add [AllowCdnFallback="True"](../deploy/office-deployment-tool-configuration-options#allowcdnfallback-attribute-part-of-add-element) to the `<Add …>` element. Here's example configuration.xml:

   ```xml
   <Configuration>
	   <Add OfficeClientEdition="64" Channel="MonthlyEnterprise" AllowCdnFallback="True" OfficeMgmtCOM="TRUE" Version="16.0.12624.20588" ForceUpgrade="TRUE" >
   		<Product ID="O365ProPlusRetail">
   			<Language ID="en-us" />
   			<Language ID="MatchPreviousMSI" />
   			<Language ID="MatchOS" />
   			<ExcludeApp ID="Groove" />
   			<ExcludeApp ID="Lync" />
   		</Product>
   	</Add>
   	<RemoveMSI />
   	<Display Level="Full" AcceptEULA="TRUE" />
   </Configuration>
   ```

7. Save the file and return to the Configuration Manager console. Navigate to **Software Library** > **Application Management** > **Applications**. Select your application, switch to the **Deployment Types** tab, right-click the matching entry, and then select **Update Content**.

   :::image type="content" source="./media/right-sizing-initial-deployment/right-sizing-initial-deployment-4.png" alt-text="A screenshot showing the Configuration Manager console.":::

8. After all distribution points synchronize the changes, you can deploy your application as usual.

You're all set!

### Further reduce network impact

We recommend these steps to further reduce network impact:

- Use [Client Peer Cache](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache) to allow clients to share content coming from distribution points. Because this content is the bulk of the download, this step will help all your on-premises deployments, not just Office.
- Configure [Delivery Optimization](../updates/delivery-optimization.md) on your devices to allow them to peer cache content coming from the Office CDN. To use Delivery Optimization during Office installation, deploy version 1908 or later. For versions 1908 to 1911, you must [set a specific registry key](../updates/delivery-optimization.md#configure-microsoft-365-apps-to-use-delivery-optimization).
- Optionally enable [Microsoft Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) on your distribution points. This step enables distribution points to act as a persistent cache for your devices. Connected cache will use already-existing information within Configuration Manager about your network infrastructure and preferred distribution points.

*Special thanks to Tom Ferguson, one of our ConfigMgr experts, for the SQL example*
