---
title: "Office Customization Tool (OCT) 2016 Help Outlook Anywhere"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.topic: concept-article
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: must-keep
ROBOTS: NOINDEX, NOFOLLOW
ms.date: 06/07/2024
---

# Office Customization Tool (OCT) 2016 Help: Outlook Anywhere

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

If you select **Configure Outlook Anywhere**, and then select **Connect to Exchange Mailbox using HTTP**, you can configure the following options:
  
- **Use this URL to connect to the proxy server for Exchange** - Server name URL for the Outlook Anywhere proxy server. Don't enter http:// or https:// as part of the name. The appropriate entry (http:// or https://) is included automatically in the box after you enter the name, based on the authentication settings you choose.
  
- **Connect using SSL only** - Select this option to connect using Secured Sockets Layer only. If you want to support both server authentication and client authentication, select:
  
  - **Mutually authenticate the session when connecting with SSL** - If this is enabled, enter the **Principal name for proxy server**.
  
- **On fast network, connect using HTTP first, then connect using TCP/IP** - On a fast network, connect using Outlook Anywhere (HTTP) first instead of the default LAN (TCP/IP).
  
- **On slow network, connect using HTTP first, then connect using TCP/IP** - On a slow network, connect using Outlook Anywhere (HTTP) first instead of the default LAN (TCP/IP).
  
- **Use this authentication when connecting to the proxy server for Exchange** - The default method is Password Authentication (NTLM).
  
## Related articles

- [Office Customization Tool (OCT) 2016 Help: Cached Mode](oct-2016-help-cached-mode.md)