---
title: "Best practices Office Telemetry"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/10/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
- Ent_Office_Compat
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
  
- [Assess Office compatibility](../compat/assess-office-compatibility.md)
    
- [Telemetry Dashboard topology, sizing, and bandwidth planning](../compat/plan-telemetry-dashboard-deployment.md)

- [Deploy Telemetry Dashboard](../compat/deploy-telemetry-dashboard.md)
    
- [Update Office Telemetry components for Office 2016](../compat/update-office-telemetry-components-for-office-2016.md)
    
- [Monitor Office compatibility and deployments by using Telemetry Dashboard](../compat/monitor-office-compatibility-and-deployments-by-using-telemetry-dashboard.md)

- [Manage add-ins by using Telemetry Dashboard in Office](../compat/manage-add-ins-by-using-telemetry-dashboard-in-office.md)

- [Manage the privacy of data monitored by telemetry in Office](../compat/manage-the-privacy-of-data-monitored-by-telemetry-in-office.mdx)
 
- [Custom reporting and database schema reference for Telemetry Dashboard](../compat/custom-reporting-and-database-schema-reference-for-telemetry-dashboard.md)
 
- [Data that the telemetry agent collects in Office](../compat/data-that-the-telemetry-agent-collects-in-office.md)
    
- [Document and solution types monitored by telemetry in Office](../compat/document-and-solution-types-monitored-by-telemetry-in-office.md)
    
- [Telemetry Dashboard worksheet reference](../compat/telemetry-dashboard-worksheet-reference.md)
    
    

