---
title: "Customize language setup and settings for Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Learn how to customize languages for Office 2016."
ms.date: 05/20/2024
---

# Customize language setup and settings for Office 2016

 **Summary:** Learn how to customize languages for Office 2016. 
  
  
To customize and deploy language setup and settings for Office 2016, follow the steps that are described in this article.

> [!NOTE]
> - If you're a user trying to install a language pack for a personal copy of Office at home, see [Language Accessory Pack for Office](https://support.microsoft.com/office/82ee1236-0f9a-45ee-9c72-05b026ee809f#ID0EAACAAA=Office_2016) instead of reading this article.
> - This article describes methods of deploying and managing language packs for versions of Office 2016 that use the Windows Installer (MSI) installation technology, which are available for enterprises through volume licensing. If you have an Office subscription and you're deploying Microsoft 365 Apps, which uses the Click-to-Run installation technology, see [Overview of deploying languages for Microsoft 365 Apps](../../overview-deploying-languages-microsoft-365-apps.md). 

<a name="BKMK_Overview"> </a>  
## Overview of customizing language setup and settings for Office

By default, setup automatically installs the language version that matches the Windows user locale that is set on each user's computer. Or, you can override this default behavior and manage the distribution of multiple language versions more precisely. For example, you can perform any of the following tasks:
  
- Install more than one language on a single computer.
    
- Specify which languages to install on users' computers, regardless of the operating system's language, which the user locale specifies.
    
- Specify custom settings once and then apply them to all language versions that you deploy in your organization. 
    
- Deploy different languages to different groups of users.
    
- Deploy the proofing tools for more languages.
    
For more information, see [Plan setup of Office 2016 multilanguage deployment](plan-multilanguage-deployment.md#BKMK_PlanSetup).
  
When a user launches an Office 2016 application for the first time, the setup applies default settings that match the language installed on the computer and the language the Windows user locale setting specifies. However, you configure language settings by using Group Policy, the Office Customization Tool (OCT), or the Language Settings tool. For more information about these three methods, see [Plan language customizations for Office](plan-multilanguage-deployment.md#BKMK_PlanCustomizations). For instructions on configuring language settings by using these methods, see [Customize language settings](customize-language-setup-settings.md#BKMK_CustomizeLanguageSettings) in this article. 
  
If users need to edit in a language or a companion proofing language not already installed, you can easily customize and install the necessary Office proofing tools. For more information, see [Plan for Office proofing tools](plan-multilanguage-deployment.md#BKMK_PlanProofingTools).
  
<a name="BKMK_BeforeYouBegin"> </a>
## Before you begin

To determine which of the following procedures to use for your deployment and which customizations you might have to make, see [Plan for multilanguage deployment of Office 2016](plan-multilanguage-deployment.md).
  
<a name="DownloadLIPandProofTools"> </a>
## Download language packs, language interface packs, and proofing tools for volume license versions of Office

For Office 2016, you download an ISO image of the language packs, LIPs, and proofing tools from the Volume Licensing Service Center (VLSC).
  
### To download ISOs for Office language packs, LIPs, and proofing tools

1. Go to the [Microsoft Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/home.aspx) and sign in. 
    
2. On the **Home** tab, select **Software Downloads**.
    
3. In the list of products, select the product for which you want to download packages. For example, select **Office Professional Plus 2016**.
    
4. Specify the download method you want to use and the language for which you want to download packages. 
    
5. Under **Operating System Type**, select **32/64 bit**, and then select **Continue**. When you select **32/64 bit** the 32-bit and 64-bit editions of available downloads are displayed. 
    
    The list of files contains all available language packs, language interface packs, and proofing tools for the language and edition that you specified. For example, for Office Professional Plus 2016, the results look similar to the following figure.
    
     :::image type="content" source="/DeployOffice/office2016/language/media/customize-language-setup-settings/office_professional_plus_2016_download_small.png" alt-text="Screenshot of the Office Professional Plus 2016 download page, showing special instructions and download settings for various Office installation files.":::
  
6. Select the appropriate package from the list and then, under **Download**, select the down arrow to download the ISO image to your computer or to a shared folder on your network. 
    
    Download the edition that matches your version of Office. For example, if you're running 32-bit Office Professional Plus 2016 on 64-bit Windows, download the 32-bit edition of the language pack, language interface pack, or proofing tools package. If you're running 64-bit Office Professional Plus 2016 on 64-bit Windows, download the 64-bit edition of the language pack, language interface pack, or proofing tools package.
    
<a name="BKMK_DeployDefaultLanguageVersionOfOffice"> </a>
## Deploy a default language version of Office

If users in your organization work with Office files that are in the same language, or in a language that matches the language of their operating system, you can deploy a default language version of Office.
  
The following steps are the same as the standard steps for deploying Office 2016. They're included for testing. The only difference in the steps is that you must copy the language packs to the same network location as the installation files.
  
### To deploy a default language version of Office to every client computer

1. Create a network installation point for the primary Office 2016 product by copying all the files and folders from the source media to a shared network location.
    
2. Copy all the files and folders from the source media for each language pack to the same network location. When you're prompted to overwrite duplicate files, choose **No**. 
    
3. Use the Office Customization Tool (OCT) to configure the installation to match your organization's requirements.
    
    Because most of the customizations apply to the core product, you don't typically have to customize each language separately. Setup applies your customizations during the installation regardless of the language that you're installing. For information about how to customize language settings, see [Customize language settings](customize-language-setup-settings.md#BKMK_CustomizeLanguageSettings).
    
    Language packs that are obtained through a volume license agreement don't require a unique product key. Only one volume license key is required for the installation.
    
4. On the setup command line, specify the Config.xml file for the primary Office product that you're deploying.
    
    For example, the following command installs Office Professional Plus 2016 in any language:
    
    **\\\server\share\Office2016\Setup.exe /config \\\server\share\Office2016\ProPlus.WW\Config.xml**
    
    where **Office2016** is the root of the network installation point. 
    
5. Run setup from the root of the network installation point. 
    
    Setup installs only the language-specific elements that are needed for the Office product that you're installing. Setup doesn't install the complete language pack unless you deploy the language pack as a separate product.
    
<a name="BKMK_SpecifyLanguagesToInstall"> </a>
## Specify which languages to install

If users in your organization work with Office files in multiple languages, or if they prefer an Office language different from their operating system's language, you can install all the necessary languages simultaneously.
  
The following steps are the same as the standard steps for deploying Office 2016. They're included for testing. The key difference involves handling language packs. First, copy the language packs to the same network location as your installation files. Then, edit the Config.xml file to specify the languages you want to install.
  
### To specify one or more languages to install on a client computer

1. Create a network installation point for your primary Office 2016 product by copying all the files and folders from source media to a shared network location.
    
2. Copy all the files and folders from the source media for each language pack to the same network location. When you're prompted to overwrite duplicate files, choose **No**. 
    
3. In the core product folder for the product that you're updating, locate the Config.xml file
    
    For example, if you're adding languages to an installation of Office Professional Plus 2016, find the Config.xml file in the **ProPlus.WW** folder. 
    
4. Open the Config.xml file by using a text editor, such as Notepad. 
    
5. Add the **\<AddLanguage\>** element. 
    
6. Set the value of the **Id** attribute to the language tag that corresponds to the language that you want to install. You can specify more than one language by including more **\<AddLanguage\>** elements and attributes. 
    
7. Specify which language to use for the Shell user interface (Shell UI) by setting the **\<ShellTransform\>** attribute of the **\<AddLanguage\>** element. 
    
    For example, to specify that setup installs both English and French, with English as the default installation language, add the following elements:
    
   ```xml
   <AddLanguage Id="en-us" ShellTransform="yes"/>
   <AddLanguage Id="fr-fr" />
   ```

    To ensure the default installation language and the Shell UI match the operating system language, and to provide every user with Office in both English and French, modify the Config.xml file. The code should look similar to this example:
    
   ```xml
   <AddLanguage Id="match" ShellTransform="yes"/> 
   <AddLanguage Id="en-us" />
   <AddLanguage Id="fr-fr" /> 
   ```

    You're required to specify a value for the **ShellTransform** attribute when you add more than one **\<AddLanguage\>** element. Skipping this step causes the installation to fail. 
    
8. To specify that setup also matches the language of the user's Windows user locale, add another line in the Config.xml file: 
    
   ```xml
   <AddLanguage Id="match" /> 
   ```

    When you do this line, setup installs all specified languages plus the language that matches the user locale, if that language is different. 
    
9. Save the Config.xml file.
    
10. Use the Office Customization Tool (OCT) to configure the installation to match your organization's requirements.
    
    For information about how to customize language settings, see [Customize language settings](customize-language-setup-settings.md#BKMK_CustomizeLanguageSettings).
    
11. Run Setup.exe and specify the path of your changed Config.xml file. 
    
    You must use a fully qualified path. For example: **\\\server\share\Office2016\setup.exe /config** **\\\server\share\Office2016\ProPlus.WW\Config.xml** where **Office2016** is the root of the network installation point. 
    
<a name="BKMK_DeployDifferentLanguages"> </a>
## Deploy different languages to different groups of users

You can give different groups of users different sets of Office languages. For example, a subsidiary that is based in Tokyo might have to work with Office 2016 documents in English and Japanese, whereas users in the European subsidiary need English, French, and German. In this scenario, create a unique Config.xml file for each group of users.
  
The following steps are the same as the standard steps to deploy the Office 2016. They're included for testing. The process involves a few distinct steps. First, you must copy the language packs to the same network location as the installation files. Next, create and edit the Config.xml file for each group to specify which languages to install. Finally, deploy the appropriate Config.xml file to the different groups.
  
### To deploy different languages to different groups of users

1. In the core product folder for the product that you're installing, locate the Config.xml file. 
    
    For example, if you're installing Office Professional Plus 2016, find the Config.xml file in the **ProPlus.WW** folder. 
    
2. Open the Config.xml file by using a text editor, such as Notepad. 
    
3. Locate the **\<AddLanguage\>** element and specify the set of languages that you want to install for this user group, as described previously. 
    
    > [!NOTE]
    > You must also set the **\<Shell UI\>** attribute of the **\<AddLanguage\>** element, as described previously. 
  
4. Save the Config.xml file by using a unique file name.
    
5. Repeat these steps for the next user group.
    
6. Use the OCT to configure the installation to match your organization's requirements.
    
    For information about how to customize language settings, see [Customize language settings](customize-language-setup-settings.md#BKMK_CustomizeLanguageSettings).
    
7. Deploy Office to each group of users separately, and in each case specify the correct Config.xml file on the setup command line. For example:
    
    **\\\server\share\Office2016\setup.exe /config** **\\\server\share\Office2016\ProPlus.WW\SubAConfig.xml**, or 
    
    **\\\server\share\Office2016\setup.exe /config** **\\\server\share\Office2016\ProPlus.WW\SubBConfig.xml**
    
    where **Office2016** is the root of the network installation point. 
    
<a name="NewLangonLaunch"> </a>
## Enable users to view new language settings the first time that they start Office

Typically, after you configure language settings, setup applies default settings that match the language that is installed on the computer when a user starts an Office 2016 application for the first time. This configuration means the new language settings display the next (second) time that the user starts the Office 2016 application.
  
To ensure users see the new language settings the first time they open an Office 2016 application, deploy the following registry settings to their computers. This deployment should be part of the initial Office 2016 installation process or completed before they start using an Office 2016 application. You can deploy these registry settings by using a script or batch file, Group Policy, or the OCT. The registry settings to configure are the following DWORD values under the **HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\LanguageResources** key: 
  
 **UILanguage**
    
 **HelpLanguage**
    
 **FollowSystemUI**
    
For each of these values, for **Value** name specify the LCID (locale identifier) that corresponds to the language that you want to use. For a list of LCIDs, see [Language identifiers and OptionState ID values in Office 2016](language-identifiers-optionstate-id-values.md). LCIDs are decimal values. Therefore, you must also set the **Base** option to **Decimal**.
  
<a name="BKMK_CustomizeLanguageSettings"> </a>
## Customize language settings

There are several methods you can use to configure language settings for users. For an overview of the methods, see [Plan language customizations for Office](plan-multilanguage-deployment.md#BKMK_PlanCustomizations). 
  
### Use Group Policy to enforce language settings

Group Policy settings can enforce default language settings that users in your organization can't change. Policy settings are reapplied every time the user logs on. The following procedure provides high-level steps for configuring language preference-related policy settings.
  
The following policy settings help you manage language settings in Office 2016:
  
|**Group Policy setting**|**Location**|**Description**|
|:-----|:-----|:-----|
|Display menus and dialog boxes in  <br/> |**Display language** folder under **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Language Preferences\Display Language** <br/> |Determines the language of the user interface.  <br/> |
|Display help in  <br/> |**Display Language** folder under **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Language Preferences\Display Language** <br/> |Determines the language of online Help. If this policy setting isn't configured, the Help language uses the user interface language.  <br/> |
|Enabled Editing Languages  <br/> |**Editing Languages** folder under **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Language Preferences\Editing Languages** <br/> | Enables editing languages from the list of languages supported by Office.  <br/> |
|Primary Editing Language  <br/> |**Editing Languages** folder under **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Language Preferences\Editing Languages** <br/> |Specifies the language in which users work with Office applications and documents when more than one language version is available on the computer.  <br/> |
   
> [!IMPORTANT]
> Before you can configure Office 2016 policy settings, you must download and install the latest [Administrative Template files (ADMX/ADML) for Office](https://go.microsoft.com/fwlink/p/?LinkId=626001). 
  
### To use Group Policy to manage language settings

1. Open the Group Policy object (GPO) for which you want to set policy. 
    
2. In the navigation pane, expand (double-click) **User Configuration**, expand **Policies**, expand **Administrative Templates**, and then expand **Microsoft Office 2016\Language Preferences**, which contains language-related policy settings.
    
3. Under **Language Preferences**, choose either the **Display Language** or the **Editing Languages** folder, depending on what you want to configure: 
    
   - The **Display Language** folder contains policy settings that allow you to enable language preferences for UI items such as menu items and Help. 
    
   - The **Enable Language** folder contains policy settings that allow you to choose and configure editing languages. 
    
     > [!NOTE]
     > Each policy setting provides a description of what it enforces. 
  
4. In the details pane, open (double-click) the policy setting that you want to configure, choose either **Enable** or **Disable**, and then specify any appropriate options that are provided.
    
5. Save the GPO.
    
### Use a setup customization file to specify default language settings

You use the OCT to create a setup customization file (.msp file) that setup applies during installation. Settings that are specified in the OCT are the default settings. Users can modify the settings after the installation.
  
### To use the OCT to customize language settings

1. Start the OCT by running setup with the **/admin** command-line option. 
    
2. On the **Modify User Settings** page, expand the tree to **Microsoft Office 2016\Language Preferences**.
    
3. Open the folder that you want in the navigation pane. Open (double-click) the setting in the details pane, choose **Enable**, and then specify a value.
    
4. Save the setup customization file in the **Updates** folder at the root of the network installation point. 
    
    Setup applies the file automatically when you install Office on users' computers.
    
For more information about how to use the OCT, see [Office Customization Tool (OCT) reference for Office 2013](/previous-versions/office/office-2013-resource-kit/cc179097(v=office.15)). (Although this article is for an earlier version of Office, the information also applies to Office 2016.)
  
### Use the Language Preferences tool to change language settings

If you're not enforcing language settings by policy, users who work in Office applications can use the Language Preferences tool to change their language preferences.
  
### To change language preferences by using the Language Preferences tool

1. Depending on your operating system, do one of the following:
    
   - If you're running Windows 8.1, open **All Apps** (right-click the desktop), and then under **Microsoft Office 2016**, choose **Office 2016 Language Preferences**. Or, 
    
   - If you're running Windows 10, choose **Start**, choose **All Programs**, choose **Microsoft Office**, choose **Microsoft Office 2016 Tools**, and then choose **Office 2016 Language Preferences**. 
    
2. Under **Choose Editing Languages**, in the language list, choose the language that you want to be available for editing, and then choose **Add**. Repeat this step for each editing language that you want to add.
    
3. Under **Choose Editing Languages**, choose the language that you most often use for Office applications and documents, and then choose **Set as Default**.
    
4. Under **Choose Display and Help Languages**, and then under **Display Language**, choose the language that you want to use to view Office application buttons and tabs, and then choose **Set as Default**. 
    
5. Under **Help Language**, select the language that you want to use to view Office application Help, and then choose **Set as Default**.
    
    If you don't specify a language for Help, the online Help language uses the display language.
    
> [!NOTE]
> You can enable functionality for working in languages that are not installed on the computer. For example, if you select Korean as an editing language, you enable Asian and Korean features in Word even if Korean proofing tools are not installed. You must enable support for that language in the operating system. 
  
<a name="BKMK_LangatUserLocale"> </a>
## Customize language-specific settings that are related to user locale

In addition to using the **Primary Editing Language** setting, Office 2016 also configures language-related settings, such as number format, to match the user locale of the operating system. This behavior is controlled by the **LangTuneUp** entry in the **LanguageResources** subkey in the Windows registry. If you don't want user locale to affect default settings, you can reset the value of **LangTuneUp** when you install Office 2016. If the **LangTuneUp** entry doesn't exist, Office 2016 creates the entry the first time that an application starts and sets the value to **OfficeCompleted**. 
  
The **LangTuneUp** entry can have one of two values: 
  
- **OfficeCompleted** Settings based on user locale aren't applied to Office 2016 as a whole. However, individual applications still check for new input method editors (IMEs) and language scripts, and still apply application settings that are specific to the user locale. For example, applications make sure that newly installed keyboards have the appropriate editing languages enabled, and Word uses fonts in Normal.dot, based on user locale. 
    
- **Prohibited** No settings related to user locale are changed by Office 2016 or by any individual Office 2016 application. 
    
In some scenarios, ignoring the user locale setting can help maintain a standard configuration across a multilingual organization. Setting the **LangTuneUp** entry to **Prohibited** makes sure that language settings remain consistent and macros are more compatible internationally. 
  
For example, if your organization is based in the United States and you want to standardize settings internationally, you can deploy Office 2016 with **Primary Editing Language** set to **en-us** (U.S. English) and **LangTuneUp** set to **Prohibited**. In this scenario, users receive the same default settings, regardless of their user locale. 
  
Ignoring user locale isn't always the best option. For example, users who read and enter Asian characters in Office 2016 documents might not always have the Asian fonts they must have to display characters correctly. If the installation language on the user's computer doesn't match the language that was used in the document and **LangTuneUp** is set to **Prohibited**, Office 2016 doesn't display fonts in the nondefault language. If your Office 2016 installations have to support multiple Asian language user locales, make sure **LangTuneUp** continues to be set to **OfficeCompleted**. To help make sure that users don't change the default value, set the corresponding policy. 
  
<a name="BKMK_CustomizeProofingTools"> </a>
## Customize and install the Office proofing tools

This section covers how to customize and install Office proofing tools. 
  
> [!NOTE]
> If you only want specific proofing languages, the installation of one or two language packs might provide all the proofing tool languages that you need. Each language version of Office 2016 includes proofing tools for a set of companion languages. For more information, see [Plan for Office proofing tools](plan-multilanguage-deployment.md#BKMK_PlanProofingTools) and [Companion proofing languages for Office 2016](companion-proofing-languages.md). 
  
### Customize the Office proofing tools

You can specify which proofing tool languages to install by editing the Config.xml file in the **ProofKit.WW** folder. For more information about **OptionState** attributes and IDs, see [Language identifiers and OptionState ID values in Office 2016](language-identifiers-optionstate-id-values.md).
  
To customize the setup of Office proofing tools, modify the Config.xml file in the ProofKit.WW folder. For each set of proofing tools that you don't want to install, in the **OptionState** element, set the **State** attribute to **Absent**.
  
#### Syntax

 **\<OptionState**
  
 **Id="** _optionID_ **"**
  
 **State="Absent"** | **"Advertise"** | **"Local"**
  
 [ **Children="force"** ] 
  
 **/\>**
  
#### OptionState attributes

The following table shows **OptionState** attributes, values, and descriptions. 
  
**OptionState attributes and values**

|**Attribute**|**Value**|**Description**|
|:-----|:-----|:-----|
|**Id** <br/> | _optionID_ <br/> |An item that the user can choose to install. See [Proofing Tools Config.xml OptionState ID values](language-identifiers-optionstate-id-values.md#BKMK_OptionStateID).  <br/> |
|**State** <br/> |**Absent** <br/> |The feature isn't installed.  <br/> The default value is Local.  <br/> |
||**Advertise** <br/> |The feature is installed the first time that it's used.  <br/> |
||**Local** <br/> |The feature is installed on the user's computer.  <br/> |
|**Children** <br/> |**force** <br/> |All child features of the feature are set to the specified state.  <br/> |
   
#### Example: Config.xml file for Office proofing tools

The following Config.xml file example shows every language that has the **OptionState** element **State** attribute set to **Absent**. If you decide to copy this example into the Config.xml file for the proofing tools, set the **State** attribute for each set of proofing tools that you want to deploy to **Local** (or **Advertise**, if preferred).
  
```xml
<Configuration Product="ProofKit">
  <!-- <Display Level="full" CompletionNotice="yes" SuppressModal="no" AcceptEula="no" /> -->
  <!-- <Logging Type="standard" Path="%temp%" Template="Microsoft Office Proofing Tools Kit Setup(*).txt" /> -->
  <!-- <USERNAME Value="Customer" /> -->
  <!-- <COMPANYNAME Value="MyCompany" /> -->
  <!-- <INSTALLLOCATION Value="%programfiles%\Microsoft Office" /> -->
  <!-- <LIS CACHEACTION="CacheOnly" /> -->
  <!-- <LIS SOURCELIST ="\\server1\share\Office;\\server2\share\Office" /> -->
  <!-- <DistributionPoint Location="\\server\share\Office" /> -->
  <!-- <OptionState Id="OptionID" State="absent" Children="force" /> -->
    <OptionState Id="IMEMain_1028" State="Absent" Children="force"/>
    <OptionState Id="IMEMain_1041" State="Absent" Children="force"/>
    <OptionState Id="IMEMain_1042" State="Absent" Children="force"/>
    <OptionState Id="IMEMain_2052" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1025" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1026" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1027" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1028" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1029" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1030" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1031" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1032" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1033" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1035" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1036" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1037" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1038" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1040" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1041" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1042" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1043" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1044" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1045" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1046" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1048" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1049" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1050" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1051" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1053" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1054" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1055" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1056" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1058" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1060" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1061" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1062" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1063" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1069" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1081" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1087" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1094" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1095" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1097" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1099" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1102" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_1110" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_2052" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_2068" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_2070" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_2074" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_3076" State="Absent" Children="force"/>
    <OptionState Id="ProofingTools_3082" State="Absent" Children="force"/>
  <!-- <Setting Id="Setup_Reboot" Value="IfNeeded" /> -->
  <!-- <Command Path="%windir%\system32\msiexec.exe" Args="/i \\server\share\my.msi" QuietArg="/q" ChainPosition="after" Execute="install" /> -->
</Configuration>
```

### To customize setup for proofing tools

1. Browse to the location where you downloaded the proofing tools ISO.
    
    For instructions on downloading the ISO, see [Download language packs, language interface packs, and proofing tools for volume license versions of Office](customize-language-setup-settings.md#DownloadLIPandProofTools).
    
2. In the ProofKit.WW folder, locate the Config.xml file. 
    
3. Open the Config.xml file by using a text editor, such as Notepad. 
    
4. For each set of proofing tools that you don't want to install, in the **OptionState** element, set the **State** attribute to **Absent**. For example, if you don't want Catalan proofing tools installed, use this syntax: 
    
   ```xml
   <OptionState Id="ProofingTools_1027" State="Absent" Children="force"/>
   ```

5. Set the **State** attribute for each set of proofing tools that you want to deploy to **Local** (or **Advertise**, if preferred). For example, to deploy Basque (Basque) proofing tools, you can use this syntax:
    
   ```xml
   <OptionState Id="ProofingTools_1069" State="Local" Children="force"/>
   ```

6. Save the Config.xml file.
    
7. Run Setup.exe, and then specify the path of your changed Config.xml file. 
    
    You must use a fully qualified path. For example: **\\\server\share\Office2016\ProofKit.WW\setup.exe /config** **\\\server\share\Office2016\ProofKit.WW\Config.xml**
    
    where **Office2016** is the root of the network installation point. 
    
### Installing the Office Proofing Tools 2016 on a single computer

If you have only one or two users who want proofing tools, you can install proofing tools from Office proofing tools to individual computers. 
  
### To install the Office proofing tools on a single computer

1. Browse to the location where you downloaded the proofing tools ISO and then run Setup.exe.
    
    For instructions on downloading the ISO, see [Download language packs, language interface packs, and proofing tools for volume license versions of Office](customize-language-setup-settings.md#DownloadLIPandProofTools).
    
2. Read and accept the license terms, and then choose **Continue**.
    
3. To install the proofing tools for all available languages, choose **Install Now**. The installation begins. Otherwise, to install individual languages, choose **Customize**.
    
4. If you selected **Customize**, choose the **File Location** and **User Information** tabs to change the information as necessary. On the **Installation Options** tab, choose the node (plus (+) sign) for the languages that you want to install, and then use the drop-down arrows to set the appropriate installation states. 
    
5. Choose **Install**.
    
## Related articles

- [Plan for multilanguage deployment of Office 2016](plan-multilanguage-deployment.md)