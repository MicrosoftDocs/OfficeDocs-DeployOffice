---
title: Network guidance for deploying and servicing Microsoft 365 Apps
author: bobclements-msft
ms.author: roclemen
manager: dougeby
audience: ITPro
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Field best practices: Network guidance for deploying and servicing Microsoft 365 Apps"
ms.date: 05/25/2024
---

# Network guidance for deploying and servicing Microsoft 365 Apps

> [!NOTE]
> Authored by the Microsoft 365 Apps Rangers, this article outlines common practices observed across customer implementations. We advise assessing the relevance of this guidance for your organization and adapting the approach as necessary.

Microsoft 365 Apps is a version of Office that offers you the latest security and feature updates on a manageable and predictable cadence. With this modern servicing approach, there are multiple scenarios to consider for optimizing your network. Whether you're planning your first deployment, or have the apps deployed to your entire organization, network optimization is something you'll need to plan for. In this article, we're going to look at some of the most common scenarios when managing Microsoft 365 Apps, along with Microsoft’s recommendations for optimizing deployment and servicing across your network. 

## Managing Microsoft 365 Apps for remote users
The key objective for this section is to help you understand what options are available when managing Microsoft 365 Apps for a remote workforce. More specifically, we'll review solutions that can significantly reduce or eliminate content distribution across your VPN (if relevant), and cloud-based services that will simplify management and maintenance for Microsoft 365 Apps. 

If you're supporting a remote workforce, you likely fall into one of two scenarios: 
- Scenario A: your company provides a VPN service to users, enabling them to access internal company resources. In this scenario you want to eliminate any unnecessary traffic from the VPN tunnel (for example, software updates from the Office CDN).
- Scenario B: your company has adopted cloud-friendly technologies such as Windows Virtual Desktop (WVD) and/or web-based applications, enabling users to connect from anywhere without a VPN. In this scenario you may be dealing with a wider set of unmanaged devices (for example, BYOD), but still need to maintain the Microsoft 365 Apps that are connected to your tenant.

The following solutions will address these two groups. In general, you'll see the biggest benefits to your network and endpoints by leveraging cloud-based services for managing your Microsoft 365 Apps. 

### Split Tunneling
[Split tunneling for Microsoft 365 Apps](/microsoft-365/enterprise/microsoft-365-vpn-split-tunnel) is recommended if you're supporting a remote workforce that is frequently connected to your company’s VPN. With split tunneling enabled, all traffic coming from the Office CDN will bypass the VPN tunnel and go directly to the internet. This includes full installs of Microsoft 365 Apps and monthly updates. For more information on implementing VPN split tunneling for Microsoft 365 Apps, see the following article: [Implementing VPN split tunneling for Office 365](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel).

### Deploying Microsoft 365 Apps with Intune
If you're using Microsoft Intune to manage your devices, there's native integration for [creating and deploying Microsoft 365 Apps](/mem/intune/apps/apps-add-office365), including the option to [provide a custom configuration XML](/mem/intune/apps/apps-add-office365#step-2---option-2-configure-app-suite-using-xml-data). When creating the app consider setting the following options:

1.	Under **App suite information**, set **Update channel** to **Monthly Enterprise Channel**.
2.	Set **Version to install** to **Latest**. 

    :::image type="content" source="./media/network-guidance/NetOp-001.png" alt-text="A screenshot of the channel settings for M365 Apps in Intune.":::

Using these values will help achieve the following benefits:

- The latest version of Monthly Enterprise Channel will be used for each new install.
- All devices will receive the recommended monthly updates.
- Minimize the need for an administrator to make changes to the app moving forward.

Once the app is assigned to your enrolled devices, install requests will pull all required content from the Office CDN. If your users are on VPN, make sure you have split tunneling enabled.

### Managing Microsoft 365 Apps with Cloud Update
After deploying the Microsoft 365 Apps to your organization, you can leverage Cloud Update to manage monthly updates. [Cloud Update](../admincenter/cloud-update.md) is a cloud-based update management solution for Microsoft 365 Apps. With this technology you can leverage the data insights from [Apps Admin Center](https://config.office.com/) to monitor [inventory](../admincenter/inventory.md), [health](../admincenter/microsoft-365-apps-health.md), and [update compliance](../admincenter/security-update-status.md). From there you can enable Cloud Update to start managing all Microsoft 365 Apps signed into your tenant, regardless of the device being managed or unmanaged. Devices enabled for Cloud Update will be configured to receive updates using the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) or [Current Channel](../updates/overview-update-channels.md#current-channel-overview).

### Cloud Management Gateway
If you have Microsoft Configuration Manager in your environment, a [Cloud Management Gateway (CMG)](/mem/configmgr/core/clients/manage/cmg/overview) is recommended for supporting remote devices. The CMG is an Azure cloud service that extends the capabilities of Configuration Manager by enabling device management over the internet. With a CMG deployed, managed devices that aren't connected to your corporate network can still receive their Microsoft 365 Apps and updates. For this solution Microsoft recommends the following:

- Implement split tunneling. In combination with a CMG, devices that are connected to the corporate VPN (where split tunneling has been enabled) will receive update instructions but pull content directly from the Office CDN.
- When deploying new installs of Microsoft 365 Apps using CMG, be sure to [right-size your initial deployment](right-sizing-initial-deployment.md) and consider [building dynamic, lean, and universal packages](build-dynamic-lean-universal-packages.md). Leveraging these techniques will reduce egress costs from the CMG and instead utilize the Office CDN for content download. 

For more information on deploying a CMG in Configuration Manager, see the following article: [Plan for the cloud management gateway in Configuration Manager](/mem/configmgr/core/clients/manage/cmg/plan-cloud-management-gateway).

## Managing Microsoft 365 Apps for on-premises users
The key objective for this section is to help you understand what options are available when managing Microsoft 365 Apps for on-premises users. More specifically, we'll review solutions that can help optimize content distribution across your network and look at utilizing cloud-based services that will simplify management and maintenance for Microsoft 365 Apps.

### Microsoft Intune
If your organization is using Intune (or Co-Management), the following technologies are recommended for optimizing network traffic with Microsoft 365 Apps:

- [Delivery Optimization (DO) for Intune enrolled devices](/mem/intune/configuration/delivery-optimization-windows). DO is a cloud-based peer-to-peer technology introduced with Windows 10. DO supports content for both Windows Update and Microsoft 365 Apps. We recommend implementing DO when devices on the same network are pulling content from the Office CDN (for example, devices on-prem).
- [Microsoft Connected Cache](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/introducing-microsoft-connected-cache-microsoft-s-cloud-managed/ba-p/963898) (non- Configuration Manager) is an Azure technology available in private preview, enabling you to configure a local server to act as a DO source. Devices that have DO configured will now utilize your Connected Cache server as another source for retrieving content. This will help reduce the number of direct downloads to the Office CDN. For more information about the Microsoft Connected Cache private preview, see the following article: [Introducing Microsoft Connected Cache: Microsoft’s cloud-managed cache solution](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/introducing-microsoft-connected-cache-microsoft-s-cloud-managed/ba-p/963898)
- [Cloud Update](../admincenter/cloud-update.md) is a cloud-based update management technology. With this technology you can leverage the data insights from [Apps Admin Center](https://config.office.com/) to monitor inventory, health, and update compliance. From there you can enable Cloud Update to start managing all Microsoft 365 Apps signed into your tenant, regardless of the device being managed or unmanaged. Devices enabled for Cloud Update will be configured to receive updates using the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) or [Current Channel](../updates/overview-update-channels.md#current-channel-overview). For management of on-prem devices, DO is going to play an important role in order to offset the number of devices connected to the Office CDN.

### Configuration Manager
If your organization is using Configuration Manager, there are multiple technologies available to help with network optimization. In this section we'll look at the native site technologies, along with modern peer-to-peer capabilities.

The first four technologies that we'll look at can be enabled independently or in combination with one another. Microsoft’s recommendation is to review each technology and leverage them in combination where it makes sense (for example, you may enable BranchCache and Client Peer Cache, but BITS throttling isn’t necessary in your environment). This will help maximize efficiency and reduce traffic to your distribution points. Once enabled, you can review the [Client data sources](/mem/configmgr/core/servers/deploy/configure/monitor-content-you-have-distributed#client-data-sources-dashboard) dashboard to monitor content distribution for Client Peer Cache, BranchCache, Distribution Points, and Cloud Distribution Points.

- [Client Peer Cache](/mem/configmgr/core/plan-design/hierarchy/fundamental-concepts-for-content-management#peer-cache) is another peer-to-peer technology. This technology is native to Configuration Manager and does require devices to be domain joined and managed by Configuration Manager. With Client Peer Cache, you have additional controls over your network segmentation and peer-to-peer traffic. Refer to [Enabling Client Peer Cache](#enabling-client-peer-cache) to get started.
- [BranchCache](/mem/configmgr/core/plan-design/hierarchy/fundamental-concepts-for-content-management#branchcache) is a Windows technology focused on peer-to-peer content delivery. Clients that support BranchCache, and have downloaded a deployment configured for BranchCache, will serve as a content source to other BranchCache-enabled clients. Refer to [Enabling BranchCache](#enabling-branchcache) to get started.
- [Windows Low Extra Delay Background Transport (LEDBAT)](/mem/configmgr/core/plan-design/hierarchy/fundamental-concepts-for-content-management#windows-ledbat) is a network congestion control feature of Windows Server to help manage background network transfers. For distribution points running on supported versions of Windows Server, enable an option to help adjust network traffic. Then clients only use network bandwidth when it's available. Refer to [Enabling Windows LEDBAT](#enabling-windows-ledbat) to get started.
- [Background Intelligent Transfer Service (BITS) throttling for clients](/mem/configmgr/core/clients/deploy/about-client-settings#background-intelligent-transfer-service-bits) is another option for reducing network saturation when you deploy your Microsoft 365 Apps and updates. Configuration Manager provides several settings that to establish a scheduled and predictable transfer rate. Refer to [Enabling BITS throttling for clients](#enabling-bits-throttling-for-clients) to get started.

These next two technologies leverage the modern peer-to-peer capabilities in Windows 10. Configuration Manager offers native support for enablement, but configuration will require Group Policy and/or a Configuration Baseline to set up.

- [Delivery Optimization (DO)](/windows/deployment/update/waas-delivery-optimization) is a cloud-based peer-to-peer technology introduced with Windows 10. DO supports content for both Windows Update and Microsoft 365 Apps. We recommend implementing DO when devices on the same network are pulling content from the Office CDN. Devices that are internet-facing or connected over VPN are note ideal candidates, as they're unlikely to have local peers to share content with. For more information on implementing DO in Configuration Manager, see the following article: [Network optimization tips for on-premises Office installs and updates](https://techcommunity.microsoft.com/t5/office-365-blog/network-optimization-tips-for-on-premises-office-installs-and/ba-p/1608089).
- [Microsoft Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) is a technology available in Configuration Manager, enabling you to configure your distribution points to act as DO sources. Devices that have DO configured will now utilize your distribution point as another source for retrieving content, reducing the number of direct downloads to the Office CDN. For more information on implementing Connected Cache in Configuration Manager, see the following article: [Network optimization tips for on-premises Office installs and updates](https://techcommunity.microsoft.com/t5/office-365-blog/network-optimization-tips-for-on-premises-office-installs-and/ba-p/1608089).

These last two items are recommendations specific to deploying and upgrading Microsoft 365 Apps when using Configuration Manager. 

- [Right-sizing your initial deployment of Microsoft 365 Apps](right-sizing-initial-deployment.md). In this article, we deep dive into managing large numbers of language packs when deploying Microsoft 365 Apps using Configuration Manager (source content downloaded locally and distributed from your distribution points).  The guidance here leverages the CDN to dynamically download language packs that are less widely used, helping reduce the overall size of your deployment.
- [Build dynamic, lean, and universal packages for Microsoft 365 Apps](build-dynamic-lean-universal-packages.md). In this article, we deep dive into building lightweight packages for deploying Microsoft 365 Apps. For this implementation content is sourced directly from the Office CDN (or DO/CC if enabled). 

### Network Optimization Features in Configuration Manager

This section includes the walkthrough steps for enabling network optimization features in Configuration Manager. 

#### Enabling Client Peer Cache
To get started with Client Peer Cache refer to the documented **requirements**, then proceed with the following steps to set up the feature:

1.	Open the **Configuration Manager Console**.
2.	Navigate to the **Administration** workspace and select **Client Settings**.
3.	Create a new custom client device setting.
4.	Name your new client settings and select the **Client Cache Settings** category.

    :::image type="content" source="./media/network-guidance/NetOp-005.png" alt-text="A screenshot of the Custom Device Settings wizard for Peer Cache.":::

5.	Select **Client Cache Settings** on the left to configure the available settings shown below.

    :::image type="content" source="./media/network-guidance/NetOp-006.png" alt-text="A screenshot of the Custom Device Settings for Peer Cache.":::

6.	Select **OK** to save your changes.
7.	Deploy the new client settings to a device collection containing devices that are capable of being reliable peer sources. For example, desktop chassis with a modern CPU, 8 GB of RAM, and 100+ GB of free disk space. Once deployed these devices will now be recorded as eligible peer sources.

With your peer sources defined, confirm that your boundary groups are accepting peer-to-peer traffic.

1.	Navigate to the **Administration** workspace, expand **Hierarchy Configuration**, and select **Boundary Groups**.
2.	Right-click on a boundary group containing peer sources and select **Properties**.
3.	On the **Options** tab, confirm that **Allow peer downloads in this boundary group** is checked. 

    :::image type="content" source="./media/network-guidance/NetOp-007.png" alt-text="A screenshot of the Peer download settings for Boundary Groups.":::

4.	Select **OK** to save your changes. Repeat this step for all boundary groups that will be supporting peer-to-peer communication.

After validating your boundary group settings, you can start deploying applications and updates. In order to optimize client peer cache, always deploy to your collection of peer sources first and provide enough time for them to receive it before deploying to other devices. 
For more information on enabling the Client Peer Cache in Configuration Manager, see the following article: [Peer cache for Configuration Manager clients](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache).

#### Enabling BranchCache
To get started with BranchCache refer to the documented [requirements](/mem/configmgr/core/plan-design/configs/support-for-windows-features-and-networks#requirements-to-support-branchcache-with-configuration-manager), then proceed with the following steps to enable the feature:

1.	Open the **Configuration Manager Console**.
2.	Navigate to the **Administration** workspace and select **Distribution Points**.
3.	Right-click on a distribution point and select **Properties**.
4.	On the **General** tab, check the box to **Enable and configure BranchCache for this distribution point**.

    :::image type="content" source="./media/network-guidance/NetOp-002.png" alt-text="A screenshot of the BranchCache Settings for Distribution Points.":::

5.	Select **OK** to apply your changes.

With BranchCache enabled on your distribution points, you'll need to configure and assign the necessary [client settings](/mem/configmgr/core/clients/deploy/about-client-settings#configure-branchcache).

1.	Navigate to the **Administration** workspace and select Client Settings.
2.	Create a new custom client device setting.
3.	Name your new client settings and select the **Client Cache Settings** category.

    :::image type="content" source="./media/network-guidance/NetOp-003.png" alt-text="A screenshot of the Custom Device Settings wizard for BranchCache.":::

4.	Select **Client Cache Settings** on the left to configure the available settings shown below.

    :::image type="content" source="./media/network-guidance/NetOp-004.png" alt-text="A screenshot of the Custom Device Settings for BranchCache.":::

5.	Select **OK** to save your changes.
6.	Deploy the new client settings to a device collection containing the devices you need to enable BranchCache on.

#### Enabling Windows LEDBAT

1.	Open the **Configuration Manager Console**.
2.	Navigate to the **Administration** workspace and select **Distribution Points**.
3.	Right-click on a distribution point and select **Properties**.
4.	On the **General** tab, check the box to **Adjust the download speed to use the unused network bandwidth (Windows LEDBAT)**.

    :::image type="content" source="./media/network-guidance/NetOp-008.png" alt-text="A screenshot of the LETDBAT settings for Distribution Points.":::

5.	Select **OK** to apply your changes.

#### Enabling BITS throttling for clients

1.	Open the **Configuration Manager Console**.
2.	Navigate to the **Administration** workspace and select **Client Settings**.
3.	Create a new custom client device setting.
4.	Name your new client settings and select the **Background Intelligent Transfer** category.

    :::image type="content" source="./media/network-guidance/NetOp-009.png" alt-text="A screenshot of the Custom Device Settings wizard for BITS.":::

5.	Select **Background Intelligent Transfer** on the left to configure the available settings shown below.

    :::image type="content" source="./media/network-guidance/NetOp-010.png" alt-text="A screenshot of the Custom Device Settings for BITS.":::

6.	Select **OK** to save your changes.
7.	Deploy the new client settings to a device collection containing the devices you need to enable BITS throttling on. Note that all future content deployments using BITS on the targeted devices will be throttled.
