---
title: "Deploy Microsoft 365 Apps as part of an operating system image"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: tier2
ms.localizationpriority: medium
recommendations: false
description: "You can include Microsoft 365 Apps as part of an operating system image that you deploy to users in your organization. You just need to make sure you don't activate Microsoft 365 Apps when you create the image. That's because you need your users to activate their Microsoft 365 Apps installations by signing in with their accounts."
ms.date: 04/20/2020
---

# Deploy Microsoft 365 Apps as part of an operating system image

You can include [Microsoft 365 Apps](about-microsoft-365-apps.md) as part of an operating system image that you deploy to users in your organization. You just need to make sure you don't activate Microsoft 365 Apps when you create the image. That's because you need your users to activate their Microsoft 365 Apps installations by signing in with their accounts.
  
Here are the basic steps of how to include Microsoft 365 Apps when you create and deploy an operating system image.
  
<a name="Steps"> </a>

## Step 1: Install and configure the operating system for the image
<a name="Step1"> </a>

To start, install and configure the operating system on a test computer. There are several free tools from Microsoft to help you do this, such as [Windows Assessment and Deployment Kit (Windows ADK)](/previous-versions/windows/hh824947(v=win.10)) and [Microsoft Deployment Toolkit (MDT)](/mem/configmgr/mdt/). 
  
## Step 2: Install Microsoft 365 Apps for the image by using the Office Deployment Tool
<a name="Step2"> </a>

To install Microsoft 365 Apps on the test computer, first download the Office Deployment Tool from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).
  
Then, use the [Office Deployment Tool](overview-office-deployment-tool.md) to download the Microsoft 365 Apps software to your local network. You also use the Office Deployment Tool to install Microsoft 365 Apps on to the test computer.
  
Remember, you don't want to activate Microsoft 365 Apps when you do the installation.
  
To prevent Microsoft 365 Apps from trying to automatically activate during the installation, perform a silent installation. To do this, in the [configuration.xml file](office-deployment-tool-configuration-options.md) that the Office Deployment Tool uses, include the following line:
  
 \<Display Level="None" AcceptEULA="True" /\>
  
When you set **Level** to **None**, you don't see any user interface elements during the installation. You won't see anything that shows the progress of the installation and you won't see any error messages.
  
> [!IMPORTANT]
> Don't sign in to the Office 365 portal to install Microsoft 365 Apps from the **software** page. If you do, activation occurs automatically.<br/><br/> Also, don't save the setup file from the Office 365 portal to the test computer. Even if you run the setup file, which will have a file name similar to Setup.X86.en-us_O365ProPlusRetail_d079c594-698d-4370-9174-7c00f76abf00_TX_PR_.exe, from the test computer, activation occurs automatically. 
  
After the installation is complete, don't open any Office programs. If you open an Office program, you're prompted to sign-in and activate. Even if you don't sign in and you close the **Activate Office** dialog box, a temporary product key is installed. You don't want any kind of Microsoft 365 Apps product key installed in your operating system image.
  
If you accidentally open an Office program, you'll have to uninstall Microsoft 365 Apps, restart the computer, and then install Microsoft 365 Apps again.
  
## Step 3: Install and configure other programs for the operating system image
<a name="Step3"> </a>

Next, install other programs that you want to include as part of the operating system image. This includes Office add-ins you want to provide to your users.
  
Remember not to open any Office programs. After you've created the image, you can test on another computer that Office and the add-ins work correctly.
  
## Step 4: Check that a Microsoft 365 Apps product key isn't installed in the image
<a name="Step4"> </a>

Before you save the image, you should check to make sure that no product key for Microsoft 365 Apps is installed. To do this, use the ospp.vbs script. This script is installed on the computer when Microsoft 365 Apps is installed.
  
For example, at a command prompt, run the following command:
  
 cscript.exe "%programfiles%\\Microsoft Office\\Office16\\ospp.vbs" /dstatus
  
You should see **\<No installed product keys detected\>**, as shown in the following screenshot.
  
![No installed product key detected.](images/aa1e234d-c2d1-471f-bf7f-9b11adc8b4b4.jpg)
  
The location of the ospp.vbs script depends on whether you install the 32-bit or 64-bit version of Microsoft 365 Apps and whether you install on a 32-bit or 64-bit version of the operating system. The following table lists the possible locations of the ospp.vbs script.
  
|**Version of Microsoft 365 Apps**|**Version of operating system**|**Location of ospp.vbs file**|
|:-----|:-----|:-----|
|32-bit  <br/> |32-bit  <br/> |%programfiles%\\Microsoft Office\\Office16\\  <br/> |
|32-bit  <br/> |64-bit  <br/> |%programfiles(x86)%\\Microsoft Office\\Office16\\  <br/> |
|64-bit  <br/> |64-bit  <br/> |%programfiles%\\Microsoft Office\\Office16\\  <br/> |
   
## Step 5: Save the operating system image
<a name="Step5"> </a>

You can use Windows ADK or MDT 2012 to save the operating system image file that you'll deploy to your users. You can also use [Microsoft Configuration Manager](/mem/configmgr/osd/understand/introduction-to-operating-system-deployment).
  
## Step 6: Test that the operating system image works
<a name="Step6"> </a>

Deploy the operating system image to another test computer. Then, open the Office programs to make sure they're set up as you want. If you have a test user account for your Office 365 (or Microsoft 365) subscription, you can test that activation works.
  
After you finish your tests, don't save an image of the test computer.
  
## Step 7: Deploy the operating system image to your users
<a name="Step7"> </a>

After you test your operating system image, you can deploy it to your users. There are many ways that you can deploy the image to computers in your organization. For example, you can use Windows ADK, MDT 2012, Configuration Manager, scripts, or other enterprise software deployment tools.
  
Users are prompted to activate Microsoft 365 Apps when they open their first Office program, as seen in the following screenshot.
  
![Activate Office.](images/9cb7eef4-0ce6-428a-8f96-890e5237d17a.png)
  
As long as the computer is connected to the internet, the user just needs to sign in when prompted, and then activation occurs automatically.
