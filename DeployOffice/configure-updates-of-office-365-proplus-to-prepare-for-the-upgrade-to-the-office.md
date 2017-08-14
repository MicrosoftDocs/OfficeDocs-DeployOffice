---
title: Configure updates of Office 365 ProPlus to prepare for the upgrade to the Office 2016 version
ms.prod: OFFICE365
ms.assetid: 1ee534fd-56dd-40fc-a463-470e8d636f09
---


# Configure updates of Office 365 ProPlus to prepare for the upgrade to the Office 2016 version

 **Summary:** Help admins configure updates for Office 365 ProPlus to prepare for the upgrade to the Office 2016 version.
  
    
    

If you deployed the Office 2013 version of Office 365 ProPlus to the users in your organization, then you need to be aware of an upgrade coming from Microsoft. This will upgrade the Office apps, such as Word and Excel, from the Office 2013 version to the Office 2016 version. For information on the schedule for this upgrade,  [review these key dates](upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Key).
> [!IMPORTANT]
> Support for the Office 2013 version of Office 365 ProPlus ended on February 28, 2017. For more information, see Microsoft Knowledge Base (KB) article  [3199744.](https://support.microsoft.com/kb/3199744)
  
    
    

Not every Office 2013 installation is a candidate for this upgrade. Only Office 2013 installations that meet  [certain criteria](overview-of-the-upgrade-of-office-365-proplus-to-the-office-2016-version.md#BKMK_Criteria) receive an upgrade notification from Microsoft. The first check is to see how Office is configured to get updates. As shown in the following table, only Office installations that are configured to get updates automatically from the Office Content Delivery Network (CDN) on the Internet are considered for this upgrade.

|**Update configuration**|**Considered for upgrade**|
|:-----|:-----|
|Automatically from the Office Content Delivery Network (CDN) on the Internet  <br/> |Yes  <br/> |
|Automatically from a location other than the CDN, such as an internal network share  <br/> |No  <br/> |
|Automatic updates disabled  <br/> |No  <br/> |
   
To determine if your Office installation could get upgraded, you first need to  [determine if Office is configured to get updates from the CDN](configure-updates-of-office-365-proplus-to-prepare-for-the-upgrade-to-the-office.md#BKMK_DetermineCDN). If Office is configured to get updates from the CDN and you don't want Office to be upgraded, then you'll want to make a configuration change, such as the following:
-  [Configure Office to get updates from a location other than the CDN](configure-updates-of-office-365-proplus-to-prepare-for-the-upgrade-to-the-office.md#BKMK_ConfigureNotCDN)
    
  
-  [Prevent the upgrade but still get updates from the CDN](configure-updates-of-office-365-proplus-to-prepare-for-the-upgrade-to-the-office.md#BKMK_PreventAuto)
    
  
-  [Disable updates entirely](configure-updates-of-office-365-proplus-to-prepare-for-the-upgrade-to-the-office.md#BKMK_Disable)
    
  
The upgrade isn't automatic. The user has to choose **Update Office** from within an Office app, such as Word, to begin the upgrade. For more information about the upgrade, [read this overview](overview-of-the-upgrade-of-office-365-proplus-to-the-office-2016-version.md).
> [!NOTE]
> This information also applies to Visio Pro for Office 365 and Project Online Desktop Client. It also applies to Office 365 Business, which is the version of Office that comes with some Office 365 plans, such as Business Premium. 
  
    
    


## Determine if Office is configured to get updates from the CDN
<a name="BKMK_DetermineCDN"> </a>

You can determine where Office gets updates from by using Registry Editor to view the registry on the computer where Office is installed. There are three places in the registry that you need to check, as listed in the following table.
  
    
    


|**Registry key**|**Value**|**Description**|
|:-----|:-----|:-----|
|HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\15.0\\ClickToRun\\Configuration  <br/> |UpdateUrl  <br/> | If this value appears in the registry, and it points to a location on your network, such as a network share, then Office isn't configured to get updates from the CDN. <br/>  But, you also need to check for the updatepath value in the registry. <br/> |
|HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\15.0\\Common\\OfficeUpdate  <br/> |updatepath  <br/> | If this value appears in the registry, and it points to a location on your network, such as a network share, then Office isn't configured to get updates from the CDN. <br/>  But, if the value appears in the registry, and the **Data** column is blank, then Office is configured to get updates from the CDN. <br/>  This location in the registry is used by Group Policy to store the configuration of the **Update Path** policy setting. <br/>  The setting of the updatepath value takes precedence over the setting of UpdateURL. <br/> |
|HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\15.0\\ClickToRun\\Configuration  <br/> |CDNBaseURL  <br/> | If the UpdateURL and the updatepath values don't appear in the registry, then Office is configured to get updates from the CDN. <br/>  In the **Data** column, you should see an address that begins with http://officecdn.microsoft.com <br/> |
   
This assumes that Office is configured to get updates automatically. You can check this in the following places in the registry:
  
    
    

- Under the HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\15.0\\ClickToRun\\Configuration key, the UpdatesEnabled value is set to TRUE.
    
  
- Under the HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\15.0\\Common\\OfficeUpdate key, the enableautomaticupdates value is set to 1.
    
  
The enableautomaticupdates value appears in the registry if you use Group Policy and enable the **Enable automatic updates** policy setting. The setting of the enableautomaticupdates value takes precedence over the setting of the UpdatesEnabled value.
  
    
    

## Configure Office to get updates from a location other than the CDN
<a name="BKMK_ConfigureNotCDN"> </a>

If you want to control when Office is upgraded, we recommend that you configure Office to get updates from a location on your internal network, such as a network share, instead of the CDN. You can configure this by using one of the following methods:
  
    
    

- Use Group Policy and enable the **Update path** policy setting. When you enable the policy setting, you need to provide a location, such as a network share. You can find this policy setting under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2013 (Machine)\\Updates in the Group Policy Management Console.
    
  
- Use the Office Deployment Tool and include the following line in the configuration.xml file:
    
  ```
  
<Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share\\"  />
  ```


    Replace  _\\\\Server\\Share_ with the location on your network. Then, run the Office Deployment Tool in /configure mode on each computer that has Office installed. Be sure that you're using the [Office 2013 version of the Office Deployment Tool](https://go.microsoft.com/fwlink/p/?linkid=282642).
    
  
After you do this, use the Office 2013 version of the Office Deployment Tool to download updates for Office 2013 to your local network until you upgrade to Office 2016. 
  
    
    

## Prevent the upgrade but still get updates from the CDN
<a name="BKMK_PreventAuto"> </a>

There is another option. You can continue to have Office get updates from the CDN, but prevent Office from receiving this upgrade.
  
    
    

> [!IMPORTANT]
> Support for the Office 2013 version of Office 365 ProPlus ends on February 28, 2017. Therefore, we recommend that you upgrade to the Office 2016 version of Office 365 ProPlus as soon as possible. For more information, see Microsoft Knowledge Base (KB) article  [3199744](https://support.microsoft.com/kb/3199744). 
  
    
    

You can continue to get updates from the CDN, but prevent this upgrade, by using one of the following methods:
  
    
    

- Use Group Policy and disable the **Enable Automatic Upgrade** policy setting. You can find this policy setting under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2013 (Machine)\\Updates in the Group Policy Management Console.
    
  
- In the registry, under the HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\15.0\\Common\\OfficeUpdate key, add a DWORD value named enableautomaticupgrade. Set the **Value data** to 0.
    
  
- Use the Office Deployment Tool and include the following line in the configuration.xml file:
    
  ```
  <Updates Enabled="TRUE"  AutoUpgrade="FALSE"  />
  ```


    Then, run the Office Deployment Tool in /configure mode on each computer that has Office installed. Be sure that you're using the  [Office 2013 version of the Office Deployment Tool](https://go.microsoft.com/fwlink/p/?linkid=282642).
    
  

## Disable updates entirely
<a name="BKMK_Disable"> </a>

To prevent this upgrade, you can also disable updates entirely, but in most cases this isn't recommended. That's because it means you won't be getting security updates of Office.
  
    
    
If you plan to upgrade and update Office by using by using enterprise software deployment software, such as System Center Configuration Manager, you might want to disable automatic updates. You can disable automatic updates by using one of the following methods:
  
    
    

- Use Group Policy and disable the **Enable automatic updates** policy setting. You can find this policy setting under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2013 (Machine)\\Updates in the Group Policy Management Console.
    
    
    
  
- Use the Office Deployment Tool and include the following line in the configuration.xml file:
    
  ```
  <Updates Enabled="FALSE" />
  ```


    Then, run the Office Deployment Tool in /configure mode on each computer that has Office installed. Be sure that you're using the  [Office 2013 version of the Office Deployment Tool](https://go.microsoft.com/fwlink/p/?linkid=282642).
    
  

## See also
<a name="BKMK_Disable"> </a>


#### Other Resources


  
    
    
 [Configuration options for the Office 2016 Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
    
    
 [Plan your upgrade from Office 365 ProPlus 2013 to 2016](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md)
  
    
    
 [Upgrade from Office 365 ProPlus 2013 to 2016](upgrade-from-office-365-proplus-2013-to-2016.md)
  
    
    
 [Overview of the upgrade of Office 365 ProPlus to the Office 2016 version](overview-of-the-upgrade-of-office-365-proplus-to-the-office-2016-version.md)
