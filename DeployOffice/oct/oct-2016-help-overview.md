---
title: "Office Customization Tool (OCT) 2016 Help Overview"
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

# Office Customization Tool (OCT) 2016 Help: Overview

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

You use the Office Customization Tool (OCT) to customize an installation of a volume licensed edition of Office. When you run the OCT, you choose whether to create a new Setup customization file or open an existing one. If you're creating a new file, the OCT displays a list of the products available on the network installation point. You must select a single product that you want to customize. To start the OCT, type **setup.exe /admin** on the command line.

> [!NOTE]
> The most current version of the OCT is available on the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030).
  
## Setup customization files

By using the OCT, you customize Office and save your customizations in a Setup customization file (.msp file), and then place the file in the Updates folder on the network installation point. When you install Office, Setup looks for a Setup customization file in the Updates folder and, if found, applies those customizations. If you put the customization file somewhere other than the Updates folder, you can use the Setup command-line option /adminfile to specify the fully qualified path to the file; for example, **setup.exe /adminfile** _\\\server_name\share_name\subfolder\custom.msp_.
  
> [!NOTE]
> If you use a folder other than the Updates folder for your customization files, you can specify its location in the Config.xml file by using the **SUpdateLocation** attribute of the **SetupUpdates** element.
  
You also can use a Setup customization file to change an existing installation. Because a Setup customization file is an expanded form of a Windows Installer .msp file, you apply the customization file to the user's computer just as you would a software update, and the user's existing Office installation is updated with your customizations. For example, if you change the installation states of some features to **Not Available** and then apply the resulting customization file to an existing installation of Office, those features are removed from the user's computer.
  
If you use the OCT to modify an existing .msp customization file, we recommend that you select the .msp file for the same product you're customizing. For example, if you're customizing an existing Office Professional Plus 2016 installation, select an Office Professional Plus 2016 customization .msp file.
  
There are some options in the OCT that are applicable only on a new installation of Office. For example, you can use the **INSTALLLOCATION** element to specify the folder where Office is installed on the user's computer. If a customization file is applied to an existing installation, however, the **INSTALLLOCATION** element is ignored. You need to uninstall and reinstall Office to change the installation location.
  
Select **Save** on the **File** menu to save the Setup customization file before you exit the OCT.
  
## Import Setup customization files

The OCT provides support for importing Setup customization files as follows:
  
- 32-bit Setup customization files can be imported into the 64-bit version of the OCT and can then be used to customize 64-bit Office products.

- 64-bit Setup customization files can be imported to the 32-bit version of the OCT and can then be used to customize 32-bit Office products.

A 32-bit Setup customization file that is imported into the 64-bit version of the OCT is converted to 64-bit, and a 64-bit customization file that is imported into the 32-bit version of the OCT is converted to 32-bit. To import a customization file, in the OCT, select **Import** on the **File** menu. In the **Open** dialog box, select the .msp file that you want to convert, and then choose **Open** to start the conversion.
  
> [!NOTE]
> Importing customization .msp files is intended for equivalent cross-architecture products only. You can import a 32-bit Office Professional Plus 2016 customization .msp file into the 64-bit version of the OCT for a 64-bit Office Professional Plus 2016 .msp file. However, you cannot import a 32-bit Word 2016 stand-alone customization .msp file into the 64-bit version of the OCT for a 64-bit Office Professional Plus 2016 .msp file; doing so is prevented and displays an error message.  <br/><br/> You cannot import Office 2007 Setup customization files into the OCT for Office 2016.
  
The Import feature can also be used in cases where you created an initial Setup customization .msp file for an Office product, such as Office Professional Plus 2016, and later you want to modify the installation to add language packs for that product. In such cases, you first add the language packs to the network installation point that contains the Office product source files. Then you run the OCT from the root of the network installation point, create a new Setup customization file for the same product, and import the original customization .msp file that you created previously for the product (Office Professional Plus 2016 in this example). To import the .msp file, in the OCT, on the **File** menu, choose **Import**. In the **Open** dialog box, select the previously created customization .msp file that you want to update. On the **File** menu, choose **Save As**. Specify a unique name for the .msp file, and choose **Save**. Importing the previously created customization .msp file into the OCT will update the .msp file and include the added languages.
  
## Structure of the OCT

The OCT consists of following four major sections, each of which is divided into a number of pages containing the following customizable options:
  
- **Setup**

  - [Installation location and organization name](oct-2016-help-installation-location-and-organization-name.md)

  - [Additional network sources](oct-2016-help-additional-network-sources.md)
  
  - [Licensing and user interface](oct-2016-help-licensing-and-user-interface.md)
  
  - [Remove previous installations](oct-2016-help-remove-previous-installations.md)
  
  - [Add installations and run programs](oct-2016-help-add-installations-and-run-programs.md)
  
  - [Office security settings](oct-2016-help-office-security-settings.md)
  
  - [Modify Setup properties](oct-2016-help-modify-setup-properties.md)
  
- **Features**
  
  - [Modify user settings](oct-2016-help-modify-user-settings.md)
  
  - [Set feature installation states](oct-2016-help-set-feature-installation-states.md)
  
- **Additional content**
  
  - [Add files](oct-2016-help-add-files.md)
  
  - [Remove files](oct-2016-help-remove-files.md)
  
  - [Add registry entries](oct-2016-help-add-registry-entries.md)
  
  - [Remove registry entries](oct-2016-help-remove-registry-entries.md)
  
  - [Configure shortcuts](oct-2016-help-configure-shortcuts.md)
  
- **Outlook**
  
  - [Outlook profile](oct-2016-help-outlook-profile.md)
  
  - [Add accounts](oct-2016-help-add-accounts.md)
  
  - [Export settings](oct-2016-help-export-settings.md)
  
  - [Specify Send/Receive groups](oct-2016-help-specify-send-receive-groups.md)
