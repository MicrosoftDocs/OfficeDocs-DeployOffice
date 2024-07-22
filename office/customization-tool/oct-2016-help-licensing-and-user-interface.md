---
title: "Office Customization Tool (OCT) 2016 Help Licensing and user interface"
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

# Office Customization Tool (OCT) 2016 Help: Licensing and user interface

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

**Summary**: Enters the product key and accepts the license terms on behalf of each user who installs Office with this Setup customization file; also sets the user interface display level.
  
These options are recognized by Setup only when Office is first installed on a user's computer.
  
1. Select one of the following two options:

   - **Use KMS client key** - A product key entry isn't required for enterprise deployments that are using Key Management Service (KMS) activation because all Volume License editions of Office have KMS client key pre-installed. KMS is one of the methods that are provided by Office Activation Technologies for activating products licensed under Microsoft Volume Licensing programs. Only a KMS host computer needs a KMS host key to be activated and to establish a local activation service in your environment. Office connects to the local KMS host for activation. By default, the **Use KMS client key option** is selected.

   - **Enter another product key** - You can enter a valid Multiple Activation Key (MAK) key in the OCT by using the **Enter another product key** entry. A MAK key is another method that Office Activation Technologies provide for activating products licensed under Microsoft Volume Licensing programs. With a MAK, clients activate Office by using the Microsoft-hosted activation servers or by telephone. To use a MAK key, in the **Product key** box, enter the MAK key (25 numbers or characters) without spaces.

2. Select **I accept the terms in the License Agreement** to accept the terms of your license agreement on behalf of the user. The user isn't prompted for the license agreement either during installation or the first time an Office application is run.

3. Expand the **Display level** menu to set the behavior of the user interface during installation. Select one of the following options:

   - Select **Full - default** to run the installation interactively, displaying all of the user interface and messages.

   - Select **Basic** to display the Welcome screen and prompts for the product key and license terms, if needed, and to display a progress bar and completion notice.

   - Select **None** to run Setup quietly, displaying no user interface.

     > [!NOTE]
     > If **Display Level** is set to **Basic** or **None** and you supply a product key, then Setup assumes that you also accept the license agreement on behalf of the user, even if you do not select this check box.
  
4. Select **Completion notice** if you want Setup to display a message to the user after Setup completes.

5. Select **Suppress modal** if you want Setup not to display error messages or other dialog boxes that might interrupt the installation.

    > [!NOTE]
    > If **Display level** is set to **Full - default**, error messages and other dialog boxes are displayed regardless of the state of this check box.
  
    **Note** The preceding options are identical to the following settings in the Config.xml file:

6. Select **No cancel** if you want to disable the cancel button (the **X** in the upper corner). This setting only applies when **Display level** is set to **Full** or **Basic**.

The preceding options are identical to the following settings in the Config.xml file.
  
|**OCT option**|**Config.xml setting**|
|:-----|:-----|
|**Product key** <br/> |**PIDKEY** element  <br/> |
|**I accept the terms in the License Agreement** <br/> |**AcceptEula** attribute of the **Display** element  <br/> |
|**Display level** <br/> |**Level** attribute of the **Display** element  <br/> |
|**Completion notice** <br/> |**CompletionNotice** attribute of the **Display** element  <br/> |
|**Suppress modal** <br/> |**SuppressModal** attribute of the **Display** element  <br/> |
|**No cancel** <br/> |**NoCancel** attribute of the **Display** element  <br/> |