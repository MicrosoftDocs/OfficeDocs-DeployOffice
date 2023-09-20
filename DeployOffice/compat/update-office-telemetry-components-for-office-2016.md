---
title: "Update Office Telemetry Dashboard components"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Learn how to update processors and the database so that they work with Office Telemetry Dashboard in Office 2019 or Office 2016."
ms.date: 03/01/2023
---

# Update Office Telemetry Dashboard components

***Applies to:*** *Office 2019, Office 2016*

> [!IMPORTANT]
> - Follow these steps only if you were using the Office Telemetry Dashboard in Office 2013 and you're now moving to using the Office Telemetry Dashboard in Office 2019 or Office 2016. 
> - These steps aren't needed if you were using Office Telemetry Dashboard in Office 2016 and are now moving to Office 2019.
  
When you install Office 2019 or Office 2016, Office Telemetry Dashboard and the built-in agents are updated to the new versions automatically. However, the processors and the database used by Office Telemetry Dashboard aren't updated, even if they are on the same computer as Office 2019 or Office 2016. 
  
To use the new version of Office Telemetry Dashboard, you'll have to update the processors and database manually. If you don't, you'll see an error message similar to the following when you use Office Telemetry Dashboard to connect to the database:
  
&nbsp; &nbsp; Database connection failure. The database needs to be updated.
  
You need to ensure that each computer on which you install the processors and database is also running the latest version of the Universal C Runtime (CRT) for the version of Windows running on the computer. For information, see [Update for Universal C Runtime in Windows](https://support.microsoft.com/help/2999226).
  
Here are the procedures for uninstalling the old processors, installing the new processors, and updating the database.
  
> [!NOTE]
> Be sure that you get the list of processors before you install Office 2019 or Office 2016. You can find the list on the [Telemetry Processor worksheet](telemetry-dashboard-worksheet-reference.md#telemetry-processor-worksheet) in Office Telemetry Dashboard.
  
## To uninstall the old version of the processor

1. On each computer where a processor is installed, uninstall the processor from the Windows Control Panel. For example, on Windows 10, choose **Start** > **Settings**. Then, choose **System** > **Apps &amp; Features**.
    
2. In the list of programs, select **Microsoft Office Telemetry Processor**.
    
3. Select **Uninstall**, and then select **Yes** when you're prompted.
    
The following two procedures describe two options for installing the processor. Pick the procedure that applies to your situation. Do this for each computer that's running a processor. 
  
## Option 1: To install the processor on a computer that's running Office 2019 or Office 2016

1. Ensure that the computer where you want to update the processor is also running the latest version of the CRT. For more information, see [Update for Universal C Runtime in Windows](https://support.microsoft.com/help/2999226).
    
2. On a computer where Office 2019 or Office 2016 is running, open Office Telemetry Dashboard, and then select **Let's get started**.
    
3. On the **Getting started** worksheet, expand **Step 2**, and then select **Install Telemetry Processor on This Computer**. This starts the **Microsoft Office Telemetry Processor Setup** wizard. 
    
4. Select **Next** in the wizard, and then select **Yes** in the **User Account Control** dialog box, if you're prompted. 
    
5. When installation is complete, select **Finish**, and then select **Yes** when you're prompted. This will open the **Office Telemetry Processor settings** wizard, where you can complete the next procedure, [To configure the processor and update the database](update-office-telemetry-components-for-office-2016.md#configure), for each computer.
    
## Option 2: To copy the processor to a computer that isn't running Office 2019 or Office 2016 and install it

1. On a computer where Office 2019 or Office 2016 is running, open Office Telemetry Dashboard, and then select **Let's get started**.
    
2. On the **Getting started** worksheet, expand **Step 2**, and then select the appropriate version of the **Save the Telemetry Processor MSI** link (either x86 or x64) to save the MSI file to the local computer. 
    
3. Copy the MSI file to the computers that run a processor.
    
4. Ensure that each computer that runs a processor is also running the latest version of the CRT. For more information, see [Update for Universal C Runtime in Windows](https://support.microsoft.com/help/2999226).
    
5. On each computer that runs a processor, run the MSI file to start the **Microsoft Office Telemetry Processor** wizard. 
    
6. Select **Next** in the wizard, and then select **Yes** in the **User Account Control** dialog box, if you're prompted. 
    
7. When installation is complete, select **Finish**, and then select **Yes** when you're prompted. This will open the **Office Telemetry Processor settings** wizard, where you can complete the next procedure, [To configure the processor and update the database](update-office-telemetry-components-for-office-2016.md#configure), for each computer. 
    
Complete the next procedure for each computer that runs a processor. The **Office Telemetry Processor settings** wizard is started as part of the previous procedures. 
  
<a name="configure"> </a>

## To configure the processor and update the database

1. Select **Next** in the **Office Telemetry Processor settings** wizard. 
    
2. On the **Database Settings** page, do the following: 
    
   1. Verify that the server selected in **SQL server** corresponds to the database that you're updating for Office 2019 or Office 2016. 
    
   2. Select **Connect** to connect to the SQL Server computer. 
    
   3. Select the database in **SQL database**, and then select **Next**.
    
3. If you're prompted to update the database, select **Yes**. You'll only be prompted to do this on the first computer where you run the **Office Telemetry Processor settings** wizard. 
    
4. Select **Yes** to set database permissions. 
    
5. On the **Shared Folder** page, verify that the shared folder is correct, and then select **Next**.
    
6. Select **Yes** to set shared folder permissions, and then complete the rest of the wizard. 
    
## To connect Office Telemetry Dashboard to the database after you upgrade

On a computer where Office 2019 or Office 2016 is running, open Office Telemetry Dashboard, and then select **Connect to Database** to connect to the newly updated database. The connection should be successful and you won't see an error message about the database. 
    
## Related articles

- [Plan a deployment of Office Telemetry Dashboard](plan-telemetry-dashboard-deployment.md)
- [Deploy Office Telemetry Dashboard](deploy-telemetry-dashboard.md)
- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)
