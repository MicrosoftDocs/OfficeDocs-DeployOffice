---
title: Best practices Assessment for locally managed
ms.prod: OFFICE365
ms.assetid: aef0e8b7-b36c-488d-a392-21720c139063
---


# Best practices: Assessment for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

 *Locally Managed*  success criteria is to deploy Office 365 ProPlus in a like-for-like fashion, replacing the previous version of Office. Users should get the application set they had before, including Visio and Project, and the existing languages. InfoPath-based LOB applications must continue to work, with minimal user impact and management overhead. *Locally Managed*  only supports 32-bit Office so all users will remain on 32-bit Office.
## Assessments results


### Size and distribution


- 5000 employees
    
  
- 3 supported languages
    
  
- Canada, USA, and Germany
    
  
- < 100 travelling users, some who are offsite for extended periods
    
  
- Sites are a main office in each country, limited small offices throughout each country
    
  

### IT infrastructure


- Windows 7 64-bit
    
  
- Small group of Mac users, ~25 who users have local administrator rights
    
  
- Mac clients are not managed by client management software
    
  
- All systems have en-us language pack installed with additional languages in CanAm region or pulled by the user
    
  
- Remote Desktop Services and Citrix farm with < 500 users
    
  
- Network bandwidth is sufficient for daily business
    
  
- Users do not have administrative rights on their machines
    
  
- Network is a distributed layout with a small number of high-bandwidth internet interconnection points
    
  

### Application landscape


- Office 2010 Volume License (MSI) 32-bit
    
  
- Groups of users using Project 2010 and Visio 2010 32-bit
    
  
- All applications other than Access being deployed
    
  
- Due to legacy Line-of-Business (LOB) applications, InfoPath is required
    
  

### Cloud infrastructure


- Office 365 tenant with Azure AD Connect
    
  
- On-Premises Active Directory Federation Services with Single Sign-on (SSO)
    
  
- Exchange Online deployed in production
    
  
- Self-service including installations are not blocked in the portal
    
  

