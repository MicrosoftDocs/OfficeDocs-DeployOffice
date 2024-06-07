---
title: "Office Customization Tool (OCT) 2016 Help Add/Modify Network Server Entry dialog box"
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

# Office Customization Tool (OCT) 2016 Help: Add/Modify Network Server Entry dialog box

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

The **Add Network Server Entry** dialog box opens when you choose **Add** on the **Additional network sources** page. If you select an entry on the **Additional network sources** page, and then choose **Modify**, the **Modify Network Server Entry** dialog box opens.
  
In the **Add Network Server Entry** or **Modify Network Server Entry** dialog boxes, in the **Network server** box, type the path and name of the server. You can use a UNC path or, if all users have access to the server with the same drive letter, you can use a drive letter in the path. The path can contain environment variables delimited by percent signs (%) if they're defined for all users. For example:
  
 z:\office

 \\\server1\share\office_root

 %USERNAME%\office_root

 %USERNAME%\office_root

You can also choose **Browse** to search for a server on the network.
  
## Related articles

- [Office Customization Tool (OCT) 2016 Help: Additional network sources](oct-2016-help-additional-network-sources.md)