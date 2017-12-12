---
title: "Best practices Office Telemetry"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 3/10/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 570c7fb3-d7a5-49cd-8cbf-7300ea656328
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Office Telemetry

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Office Telemetry is the new compatibility monitoring framework that replaces the previous Office 2010 compatibility tools and helps minimize the time and risks of an Office upgrade. When an Office document or solution is loaded, used, closed, or raises an error in certain Office applications, the application adds a record about the event to a local data store. The record is then uploaded to the Office Telemetry database, where it is used together with the Telemetry Dashboard for IT admins to get a complete view of the Office Telemetry data that is being collected in the organization.
  
## Office Telemetry dashboard overview

Telemetry Dashboard is an Excel workbook that is configured to connect to a telemetry database, and comes installed together with Office versions starting with Office 2013. The Telemetry Dashboard also allows IT admins to use pre-built reports or create custom reports that can help with critical applications.
  
The Telemetry Dashboard should be used in conjunction with interviewing and working with key business stakeholders to identify the critical business applications that must be validated prior to deploying Office 365 ProPlus in the environment. It should not replace working with business groups; instead, it should assist with identifying how often users access specific components and the number of users for those particular components.
  
## Office Telemetry reference

The following links provide additional details on Telemetry Dashboard components and recommended configuration options to assist you with application compatibility assessment:
  
- [Assess Office compatibility with other versions of Office](https://technet.microsoft.com/en-us/library/ee819096%28v=office.16%29.aspx)
    
- [Telemetry Dashboard topology, sizing, and bandwidth planning](https://technet.microsoft.com/en-us/library/jj822978%28v=office.16%29.aspx)
    
- [Office Telemetry tools and components](https://technet.microsoft.com/en-us/library/jj822978%28v=office.16%29.aspx)
    
- [Update Office Telemetry components for Office 2016](https://technet.microsoft.com/en-us/library/dn627517%28v=office.16%29.aspx)
    
- [Deploy Telemetry Dashboard](https://technet.microsoft.com/en-us/library/jj219431%28v=office.16%29.aspx)
    
- [Data that the telemetry agent collects in Office](https://technet.microsoft.com/en-us/library/mt599629%28v=office.16%29.aspx)
    
- [Document and solution types monitored by telemetry in Office](https://technet.microsoft.com/en-us/library/mt599633%28v=office.16%29.aspx)
    
- [Monitor Office compatibility and deployments by using Telemetry Dashboard](https://technet.microsoft.com/en-us/library/jj980533%28v=office.16%29.aspx)
    
- [Manage the privacy of data monitored by telemetry in Office](https://technet.microsoft.com/en-us/library/jj591589%28v=office.16%29.aspx)
    
- [Manage add-ins by using Telemetry Dashboard in Office](https://technet.microsoft.com/en-us/library/mt599631%28v=office.16%29.aspx)
    
- [Let's manage add-ins using Telemetry Dashboard](https://blogs.technet.microsoft.com/office_resource_kit/2012/09/17/lets-manage-add-ins-using-telemetry-dashboard/)
    
- [Telemetry Dashboard worksheet reference](https://technet.microsoft.com/en-us/library/jj980532%28v=office.16%29.aspx)
    
- [Custom reporting and database schema reference for Telemetry Dashboard](https://technet.microsoft.com/en-us/library/dn169565%28v=office.16%29.aspx)
    

