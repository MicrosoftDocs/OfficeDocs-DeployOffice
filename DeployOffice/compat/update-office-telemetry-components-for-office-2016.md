---
title: "Update Office Telemetry components for Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/10/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
ms.assetid: 2ab315c1-332a-4bb8-8a23-ec1396e4c3cf
description: "Learn how to update telemetry processors and the telemetry database so that they work with Telemetry Dashboard in Office 2016."
---

# Update Office Telemetry components for Office 2016

 **Summary:** Learn how to update telemetry processors and the telemetry database so that they work with Telemetry Dashboard in Office 2016. 
  
 **Audience:** IT Professionals 
  
When you install Office 2016, Telemetry Dashboard and the built-in telemetry agents are updated to the new versions automatically. However, the telemetry processors and the telemetry database aren't updated, even if they are on the same computer as Office 2016. 
  
To use the new version of Telemetry Dashboard, you'll have to update the telemetry processors and telemetry database manually. If you don't, you'll see an error message similar to the following when you use Telemetry Dashboard to connect to the telemetry database:
  
 **Database connection failure. The database needs to be updated.**
  
You need to ensure that each computer on which you install the telemetry processors and telemetry database is also running the latest version of the Universal C Runtime (CRT) for the version of Windows running on the computer. For information, see [Update for Universal C Runtime in Windows](https://support.microsoft.com/kb/2999226).
  
Here are the procedures for uninstalling the old telemetry processors, installing the new telemetry processors, and updating the telemetry database.
  
> [!NOTE]
> Be sure that you get the list of telemetry processors before you install Office 2016. You can find the list on the [Telemetry Processor worksheet](telemetry-dashboard-worksheet-reference.md#bkmk_TelemetryProcessorWorksheet) in Telemetry Dashboard. 
  
## To uninstall the old version of telemetry processor

1. On each computer where telemetry processor is installed, uninstall telemetry processor from the Windows Control Panel.
    
  - On Windows 8, choose **Start** > **Control Panel**. Then, under **Programs** choose **Uninstall a program**.
    
  - On Windows 10, choose **Start** > **Settings**. Then, choose **System** > **Apps &amp; Features**. 
    
2. In the list of programs, select **Microsoft Office Telemetry Processor**. 
    
3. Select **Uninstall**, and then select **Yes** when you are prompted. 
    
The following two procedures describe two options for installing the telemetry processor. Pick the procedure that applies to your situation. Do this for each computer that's running telemetry processor. 
  
## Option 1: To install the telemetry processor on a computer that's running Office 2016

1. Ensure that the computer where you want to update the telemetry processor is also running the latest version of the CRT. For more information, see [Update for Universal C Runtime in Windows](https://support.microsoft.com/kb/2999226).
    
2. On a computer where Office 2016 is running, open Telemetry Dashboard, and then select **Let's get started**.
    
3. On the **Getting started** worksheet, expand **Step 2**, and then select **Install Telemetry Processor on This Computer**. This starts the **Microsoft Office Telemetry Processor Setup** wizard. 
    
4. Select **Next** in the wizard, and then select **Yes** in the **User Account Control** dialog box, if you are prompted. 
    
5. When installation is complete, select **Finish**, and then select **Yes** when you are prompted. This will open the **Office Telemetry Processor settings** wizard, where you can complete the next procedure, [To configure the telemetry processor and update the telemetry database](update-office-telemetry-components-for-office-2016.md#configure), for each computer.
    
## Option 2: To copy the telemetry processor to a computer that isn't running Office 2016 and install it

1. On a computer where Office 2016 is running, open Telemetry Dashboard, and then select **Let's get started**.
    
2. On the **Getting started** worksheet, expand **Step 2**, and then select the appropriate version of the **Save the Telemetry Processor MSI** link (either x86 or x64) to save the MSI file to the local computer. 
    
3. Copy the MSI file to the computers that run telemetry processor.
    
4. Ensure that each computer that runs telemetry processor is also running the latest version of the CRT. For more information, see [Update for Universal C Runtime in Windows](https://support.microsoft.com/kb/2999226).
    
5. On each computer that runs telemetry processor, run the MSI file to start the **Microsoft Office Telemetry Processor** wizard. 
    
6. Select **Next** in the wizard, and then select **Yes** in the **User Account Control** dialog box, if you are prompted. 
    
7. When installation is complete, select **Finish**, and then select **Yes** when you are prompted. This will open the **Office Telemetry Processor settings** wizard, where you can complete the next procedure, [To configure the telemetry processor and update the telemetry database](update-office-telemetry-components-for-office-2016.md#configure), for each computer. 
    
Complete the next procedure for each computer that runs Telemetry Processor. The **Office Telemetry Processor settings** wizard is started as part of the previous procedures. 
  
<a name="configure"> </a
## To configure the telemetry processor and update the telemetry database

1. Select **Next** in the **Office Telemetry Processor settings** wizard. 
    
2. On the **Database Settings** page, do the following: 
    
  1. Verify that the server selected in **SQL server** corresponds to the database that you are updating for Office 2016. 
    
  2. Select **Connect** to connect to the SQL Server computer. 
    
  3. Select the telemetry database in **SQL database**, and then select **Next**.
    
3. If you are prompted to update the database, select **Yes**. You'll only be prompted to do this on the first computer where you run the **Office Telemetry Processor settings** wizard. 
    
4. Select **Yes** to set database permissions. 
    
5. On the **Shared Folder** page, verify that the shared folder is correct, and then select **Next**.
    
6. Select **Yes** to set shared folder permissions, and then complete the rest of the wizard. 
    
## To connect Telemetry Dashboard to the telemetry database after you upgrade

- On a computer where Office 2016 is running, open Telemetry Dashboard, and then select **Connect to Database** to connect to the newly updated database. The connection should be successful and you won't see an error message about the database. 
    
## Related topics
[Deploy Telemetry Dashboard](deploy-telemetry-dashboard.md)
  
[Telemetry Dashboard topology, sizing, and bandwidth planning](plan-telemetry-dashboard-deployment.md)

[Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md)
