## Requirements

### Supported built-in admin roles

You can use any of the following Microsoft Entra built-in roles to access and manage features in the Microsoft 365 Apps admin center:

| Role                       | Description       |
| -------------------------- | ----------------- |
| Global Administrator       | This role can manage all aspects of Microsoft Entra ID and Microsoft services that use Microsoft Entra identities.
| Security Administrator     | This role can read security information and reports and manage configuration in Microsoft Entra ID and Office 365.
| Office Apps Administrator (**Recommended**) | This role can manage Office apps cloud services, including policy and settings management, and manage the ability to select, unselect, and publish 'what's new' feature content to end-user's devices.

> [!NOTE]
> Global Reader is another built-in role supported by the Microsoft 365 Apps admin center, but it does not support some features like cloud update or the Modern App Settings page.

### Licensing requirements

The center supports the following subscription plans:

| Type       | Subscription Plan |
| ---------- | ----------------- |
| Education  | <li>Microsoft 365 A3</li><li>Microsoft 365 A5</li>
| Business   | <li>Microsoft 365 Business Standard</li><li>Microsoft 365 Business Premium</li>
| Enterprise | <li>Microsoft 365 E3</li><li>Microsoft 365 E5</li>

> [!IMPORTANT]
> The center is not available to customers who have the following plans:
>- Microsoft 365 operated by 21Vianet
>- Microsoft 365 GCC
>- Microsoft 365 GCC High and DoD

### Product version requirements

You can manage Microsoft 365 Apps on Windows with the following version requirements:

- [Supported version of Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date)
- [Supported version of Microsoft Windows 10/11](/windows/release-health/supported-versions-windows-client)
- [Supported version of Windows Server that supports Microsoft 365 Apps](../endofsupport/windows-server-support.md)

### Network requirements

Devices running Microsoft 365 Apps require access to the following endpoints:

| Microsoft service | URLs required on allowlist |
| ----------------- | -------------------------- |
| Microsoft 365 Apps admin center      | <li>login.live.com</li><li>\*.config.office.com</li><li>\*.config.office.net</li>
| Office Content Delivery Network (CDN)        | <li>officecdn.microsoft.com</li><li>officecdn.microsoft.com.edgesuite.net</li><li>otelrules.azureedge.net</li>

  Source: [Microsoft 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges)

### Requirements for using Microsoft Entra groups

Some features support the use of [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups). For example, groups can be used to configure custom [rollout waves](cloud-update.md#rollout-waves) or setup [device exclusions](cloud-update.md#exclude-groups) in cloud update. In all cases, the membership of these groups supports user and/or device objects with the following requirements:

- **Device objects** must be Microsoft Entra joined or hybrid joined.
- **User objects** must be present in Microsoft Entra ID and have a [supported license](#licensing-requirements) assigned.
- Multiple groups can be used, but a single group should contain no more than 20,000 objects.
- Nested groups supports up to three levels deep.

> [!NOTE]
> The Cloud Policy Service only supports user objects as the policies set apply on a user level, not device level.
