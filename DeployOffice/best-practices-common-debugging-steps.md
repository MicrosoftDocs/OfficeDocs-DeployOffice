---
title: Best practices Common debugging steps
ms.prod: OFFICE365
ms.assetid: b584fcff-d64d-426a-b20f-fc93707cf46c
---


# Best practices: Common debugging steps

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

The following steps are common issues that can occur when you deploy and manage Office UNRESOLVED_TOKEN_VAL(365) ProPlus:
1. Use a network scanning utility such as Process Monitor, Wireshark, or Fiddler to see if throughput or connections are being blocked:
    
  - OfficeC2RClient.exe
    
  
  - OLicenseHeartbeat.exe
    
  
2. Does the system account running the processes have proxy access?
    
  
3. Are the appropriate network and firewall rules open for Office 365 traffic?
    
  
4. Make sure that you are using the latest version of the  [Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117) (updated regularly).
    
  
5. Make sure that your XML syntax is correct by using the  [GitHub XML script editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
    
  
6. Check for new GPOs in the  [Office 2016 Administrative Template files](https://www.microsoft.com/en-us/download/details.aspx?id=49030) (updated regularly).
    
  
7. Does the account that is being used to install Office UNRESOLVED_TOKEN_VAL(365) ProPlus have administrative privileges?
    
  

