---
title: Best practices Channel management
ms.prod: OFFICE365
ms.assetid: 091876a8-22ee-4685-bb88-adb9de85175a
---


# Best practices: Channel management

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

There are two common ways for organizations to apply updates to Office UNRESOLVED_TOKEN_VAL(365) ProPlus:
- Automatically from the Internet
    
  
- Automatically from an on-premises location, such as a network share, DFS, or by using a software distribution tool such as System Center Configuration Manager
    
  
When choosing how to manage updates, you should plan to use your existing software deployment and management tools and processes, such as a DFS system or System Center Configuration Manager. IT admins should also use the Office Deployment Tool configuration settings either via the install XML or Group Policy to configure and control the Office UNRESOLVED_TOKEN_VAL(365) ProPlus client update settings. Proper planning should be included for the unlikely cases that a user requests to switch their update channel cadence, as well as the event that a user or channel membership group needs their Office UNRESOLVED_TOKEN_VAL(365) ProPlus build reverted back to a previously known good version.
## Switching channels

Switching Channels is not advised unless required because it is a100% file delta install. If the channel you are switching to is 1.2 GB, then a complete 1.2 GB of network bandwidth is consumed if installing locally (700-800 MB if using Office CDN). There is no need to uninstall and then re-install; however, the network impact is the same as a new install. 
  
    
    

> [!NOTE]
> If the source files are hosted on premises, changing the Update Channel Group Policy object has no impact on the channel switch. The Update Channel Group Policy object can only be used if you are using the Office CDN for the source location. 
  
    
    


## Rollback

There are two supported methods to perform a rollback or downgrade:
  
    
    

- Run the ODT setup.exe in configure mode with a new install XML using the "version: element.
    
  
- Call OfficeC2Rclient.exe update engine and perform a command line rollback using the "updatetoversion" element.
    
  
If a rollback is required, one of the following two solutions is recommended:
  
    
    

### Re-Run ODT Setup.exe with new Install XML

To perform a rollback, re-run the ODT setup.exe in configure mode and push out a new install XML file that includes the build version specified in the install XML to rollback to. When using this method, the client must have access to the appropriate build source files; therefore, you should either have the client install the specified version from the Office CDN, or use the  _UpdatePath_ element to point to a local source that contains the appropriate Office UNRESOLVED_TOKEN_VAL(365) ProPlus build source files.
  
    
    
It is important to note that if the customer is patching from an on premises source location, the new install XML re-run with a specified version must contain an  _UpdatePath_ that specifies the network location of that specified build. If the specified build version cannot be found, the rollback will fail.
  
    
    
 **Steps for re-running the ODT Setup.exe with new Install XML to rollback**
  
    
    

1. Identify the version of Office365 ProPlus (version numbers can be found at  [Version and build numbers of update channel releases for Office 365 clients](https://technet.microsoft.com/en-us/library/mt592918.aspx)).
    
  
2. Copy ODT setup.exe and the new install XML file to the appropriate source distribution location to be deployed to the client machines.
    
  
3. From an elevated command prompt with administrator privileges, run **setup.exe /configure <configurationXMLfilename>.xml**.
    
    > [!NOTE]
      > If users are not local administrators on the machine, a software distribution tool or script that runs with elevated privileges must be used 
4. After the above the command has completed, verify the version of Office 365 ProPlus is at the desired version.
    
    Open an Office 365 ProPlus Application >> **File >> Office Account >> Verify Office 365 ProPlus version Utilize OfficeC2RClient.exe**
    
  

### Use OfficeC2RClient.exe

By specifying a previous Office 365 ProPlus build version in the command line, the OfficeC2RClient.exe will roll back the Office UNRESOLVED_TOKEN_VAL(365) ProPlus client to that specified build. The OfficeC2RClient.exe takes into account the  _UpdatePath_ location that is set either by the ODT or Group Policy, and will look to that location for the source files for the specified build version in the command line. The OfficeC2RClient.exe feature can be automated by using a batch file and script, or by leveraging an empty System Center Configuration Manager package to call the OfficeC2RClient.exe with the appropriate elements and specified variables.
  
    
    
To use the OfficeC2RClient.exe, see  [How to revert to an earlier version of Office 2013 or Office 2016 Click-to-Run](https://support.microsoft.com/en-us/help/2770432/how-to-revert-to-an-earlier-version-of-office-2013-or-office-2016-click-to-run).
  
    
    
The following table represents additional command line switches that you can include:
  
    
    

||||
|:-----|:-----|:-----|
|**Variable** <br/> |**Values** <br/> |**Description** <br/> |
|UpdatePromptUser  <br/> |True, False (Default: False)  <br/> |Specifies whether a user will see the "Office updates are available" dialog box before applying updates.  <br/> |
|ForceAppShutdown  <br/> |True, False (Default: False)  <br/> |Specifies whether a user is given the option to postpone the update. If set to "True", Office applications will shut down immediately when the update process begins.  <br/> |
|DisplayLevel  <br/> |True, False (Default: True)  <br/> |Specifies whether or not a user will see a user interface during the updates. If set to "False," all update user interface will be hidden, including any errors that are encountered during the update.  <br/> |
|UpdateToVersion  <br/> |16.0.XXXX.XXXX (Default: Install latest released build)  <br/> |Specifies the version of Office 365 ProPlus to update to, which can be used to install a newer or older version than the current Office 365 ProPlus build that is installed.  <br/> |
   
 **Steps for using OfficeC2RClient.exe to rollback**
  
    
    

1. Identify the version of Office365 ProPlus (version numbers can be found at  [Version and build numbers of update channel releases for Office 365 clients](https://technet.microsoft.com/en-us/library/mt592918.aspx)).
    
  
2. From an elevated command prompt with administrator privileges, run the following command: 
    
  ```
  
"%Program Files%\\Common Files\\Microsoft Shared\\ClicktoRun\\OfficeC2RClient.exe" /update user updatepromptuser=false forceappshutdown=true displaylevel=true updatetoversion=16.0.xxxx.xxxx
  ```


    > [!NOTE]
      > Be sure to note that **forceappshutdown=true** in the command line because updates cannot occur unless all off the applications are shut down. The **updatetoversion** is the specified version that the client will be rolling back to. Additionally, ensure that the specified **updatetoversion** correlates to the current channel membership that the client is on.> If users are not local administrators on the machine, a software distribution tool or script that runs with elevated privileges must be used. 
3. After the above the command has completed, verify that the version of Office365 ProPlus is at the desired version.
    
    Open an Office 365 ProPlus Application >> **File >> Office Account >> Verify Office 365 ProPlus version Utilize OfficeC2RClient.exe**
    
  

## Channel management references

The following links provide detailed information about channel management:
  
    
    

-  [Configure update settings for Office 365 ProPlus](https://technet.microsoft.com/en-us/library/dn761708.aspx)
    
  
-  [Manage updates to Office 365 ProPlus with System Center Configuration Manager](https://technet.microsoft.com/en-us/library/mt628083.aspx)
    
  
-  [Change management for Office 365 clients](https://technet.microsoft.com/en-us/library/mt584223.aspx)
    
  
-  [How to revert to an earlier version of Office 2013 or Office 2016 Click-to-Run](https://support.microsoft.com/en-us/help/2770432/how-to-revert-to-an-earlier-version-of-office-2013-or-office-2016-click-to-run)
    
  

