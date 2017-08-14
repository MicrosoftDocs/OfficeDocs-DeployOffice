---
title: Overview of shared computer activation for Office 365 ProPlus
ms.prod: OFFICE365
ms.assetid: 836f882c-8ff6-4f19-8b24-0212e0111c94
---


# Overview of shared computer activation for Office 365 ProPlus

Shared computer activation lets you to deploy Office 365 ProPlus to a computer in your organization that is accessed by multiple users. For example, several nurses at a hospital connect to the same remote server to use their applications or a group of workers share a computer at a factory.
  
    
    

The most common shared computer activation scenario is to  [deploy Office 365 ProPlus to shared computers by using Remote Desktop Services (RDS)](deploy-office-365-proplus-by-using-remote-desktop-services.md). By using RDS, multiple users can connect to the same remote computer at the same time. The users can each run Office 365 ProPlus programs, such as Word or Excel, at the same time on the remote computer.
Shared computer activation is used only for situations where multiple users share the same computer. If you have users who are assigned individual computers, you  [use product key activation for Office 365 ProPlus](overview-of-licensing-and-activation-in-office-365-proplus.md).
  
    
    


## How to enable shared computer activation for Office 365 ProPlus
<a name="Enable"> </a>

If you have an  [Office 365 plan](https://go.microsoft.com/fwlink/p/?LinkId=510587) that includes Office 365 ProPlus, you can use shared computer activation. Make sure you [Assign or remove licenses for Office 365 for business](http://technet.microsoft.com/library/997596b5-4173-4627-b915-36abac6786dc%28Office.14%29.aspx) for Office 365 ProPlus and that users log on to the shared computer with their own user account.
  
    
    

> [!NOTE]
> You also can use shared computer activation to install Visio Pro for Office 365 or Project Online Desktop Client on a shared computer, if you have a subscription plan that includes those products. 
  
    
    

To enable shared computer activation when you deploy Office 365 ProPlus, you need the following:
  
    
    

- The current version of the Office 2016 version of the Office Deployment Tool, which is available from the  [Microsoft Download Center](http://go.microsoft.com/fwlink/p/?LinkID=626065).
    
  
- At least version 15.0.4631.1002 of Office 365 ProPlus, which was released in July 2014.
    
    > [!TIP]
      > To determine which version of Office 365 ProPlus is installed on a user's computer, go to **File** > **Account** in any Office 365 ProPlus program. The version is listed under the **Office Updates** section.

    You can download the Office 365 ProPlus software to your local network by using the  [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).
    
  
The Office Deployment Tool, combined with a simple text file, is used to install Office 365 ProPlus on the shared computer, and to enable shared computer activation for that computer. Add the following lines when you  [create the text file](configuration-options-for-the-office-2016-deployment-tool.md).
  
    
    



```

<Display Level="None" AcceptEULA="True" />
<Property Name="SharedComputerLicensing" Value="1" />
```

After Office 365 ProPlus is installed, you can  [verify that shared computer activation is enabled](http://technet.microsoft.com/library/c3aeb487-d45f-4079-8c35-7558a45b876cf%28Office.14%29.aspx#Enabled) on that computer.
  
    
    

## How shared computer activation works for Office 365 ProPlus
<a name="Works"> </a>

Here's what happens after Office 365 ProPlus is installed on a computer that has shared computer activation enabled.
  
    
    

1. A user logs on to the computer with her account.
    
  
2. The user starts an Office 365 ProPlus program, such as Word.
    
  
3. Office 365 ProPlus contacts the Office Licensing Service on the Internet to obtain a licensing token for the user.
    
    To determine whether the user is licensed to use Office 365 ProPlus, the Office Licensing Service has to know the user's account for Office 365. In some cases, Office 365 ProPlus prompts the user to provide the information. For example, the user might see the **Activate Office** dialog box.
    
     ![Activate Office](images/9cb7eef4-0ce6-428a-8f96-890e5237d17a.png)
  

    If your environment is configured to synchronize Office 365 and network user accounts, then the user probably won't see any prompts. Office 365 ProPlus should automatically be able to get the necessary information about the user's account in Office 365.
    
  
4. If the user is licensed for Office 365 ProPlus, a licensing token is stored on the computer in the user's profile folder, and Office 365 ProPlus is activated. The user can now use Office 365 ProPlus.
    
  
These steps are repeated for each user who logs on to the shared computer. Each user gets a unique licensing token. Just because one user activates Office 365 ProPlus on the computer doesn't mean Office 365 ProPlus is activated for all other users who log on to the computer.
  
    
    
If a user goes to another computer that also is enabled for shared computer activation, the same steps occur. There is a different licensing token for each computer that the user logs on to.
  
    
    
If a user logs on to a shared computer again, Office 365 ProPlus uses the same licensing token, if it is still valid.
  
    
    

## Additional details about shared computer activation for Office 365 ProPlus
<a name="Details"> </a>


- **Licensing token renewal** The licensing token that is stored on the shared computer is valid only for a few days. As the expiration date for the licensing token nears, Office 365 ProPlus automatically attempts to renew the licensing token when the user is logged on to the computer and using Office 365 ProPlus.
    
    If the user doesn't log on to the shared computer for several days, the licensing token can expire. The next time that the user tries to use Office 365 ProPlus, Office 365 ProPlus contacts the Office Licensing Service on the Internet to get a new licensing token.
    
  
- **Internet connectivity** Because the shared computer has to contact the Office Licensing Service on the Internet to obtain or renew a licensing token, reliable connectivity between the shared computer and the Internet is necessary.
    
  
- **Reduced functionality mode** If the user is not licensed for Office 365 ProPlus, or if the user closed the **Activate Office** dialog box, no licensing token is obtained and Office 365 ProPlus isn't activated. Office 365 ProPlus is now in reduced functionality mode. This means that the user can view and print Office 365 ProPlus documents, but can't create or edit documents. The user also sees a message in Office 365 ProPlus that most features are turned off.
    
     ![Reduced functionality](images/4e25a9fc-1844-4204-9b9d-40603ca1a091.png)
  

  

  
- **Activation limits** Normally, users can install and activate Office 365 ProPlus only on up to five computers. Using Office 365 ProPlus with shared computer activation enabled doesn't count against the five computer limit.
    
    Microsoft allows a single user to activate Office 365 ProPlus on a reasonable number of shared computers in a given time period. The user gets an error message in the unlikely event the limit is exceeded.
    
     ![Too many computers activated message](images/e01c8a45-1814-4bfe-bb7e-c0176f393031.png)
  

  

  

## See also
<a name="Details"> </a>


#### Other Resources


  
    
    
 [Deploy Office 365 ProPlus by using Remote Desktop Services](deploy-office-365-proplus-by-using-remote-desktop-services.md)
  
    
    
 [Troubleshoot issues with shared computer activation for Office 365 ProPlus](c3aeb487-d45f-4079-8c35-7558a45b876c.md)
  
    
    
 [Overview of licensing and activation in Office 365 ProPlus](overview-of-licensing-and-activation-in-office-365-proplus.md)
