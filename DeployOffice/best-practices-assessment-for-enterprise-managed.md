---
title: Best practices Assessment for enterprise managed
ms.prod: OFFICE365
ms.assetid: 394f54fb-01ba-4be4-8606-4bce1ac39a31
---


# Best practices: Assessment for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

 *Enterprise Managed*  success criteria is to deploy Office 365 ProPlus in a like-for-like fashion. Users should get the application set they had before, including Project and Visio, and their existing languages. 32-bit users should be kept on 32-bit, and 64-bit users should receive the appropriate 64- bit version. All InfoPath-based LOB applications must continue to work. Everything should work as before, with a minimal user impact and management overhead.
## Assessment results


### Size and distribution


- 20,000+ employees
    
  
- 17 supported languages
    
  
- Worldwide across the Americas, EMEA and APAC regions
    
  
- 1,000s of travelling users, most of whom are offsite for extended periods
    
  
- Sites are ranging from small offices up to a larger campus
    
  

### IT infrastructure


- Windows 7 64-bit
    
  
- Small pockets of Mac users, ~500 total, managed by a third party Mac software distribution tool
    
  
- All systems have en-us language pack installed, with additional languages per region or pulled by the user
    
  
- Desktops, notebooks, and shared devices for shift workers
    
  
- Remote Desktop Services and Citrix farm with 1,000s of users
    
  
- Static and dynamic Virtual Desktop Infrastructure (VDI) for a smaller user group
    
  
- Network bandwidth is sufficient for daily business
    
  
- Windows clients managed by System Center Configuration Manager
    
  
- High bandwidth deployments (such as a 1 GB Office package) require pre -caching and staged deployment
    
  
- Users do not have administrative rights on their machines
    
  
- Network is a distributed layout with a small number of high-bandwidth internet interconnection points
    
  

### Application landscape


- Office 2010 Volume License (MSI) 32-bit
    
  
- Groups of users who use Project 2010 and Visio 2010 (MSI) 32-bit
    
  
- Finance department uses Office 2010 64-bit for working with large data sets
    
  
- Small pockets still run Office/Visio/Project 2007 (MSI) 32-bit
    
  
- OneDrive is in the evaluation phase and should not be deployed until signed off on
    
  
- Due to legacy Line-of-Business (LOB) applications, InfoPath is required
    
  

### Cloud infrastructure


- Office 365 tenant with Azure AD Connect
    
  
- On-Premises Active Directory Federation Services with Single Sign-on (SSO)
    
  
- Exchange Online deployed in production
    
  
- Self-service installations are blocked in the portal
    
  

