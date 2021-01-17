**Unattended Robotic Process Automation with Microsoft 365 Apps for enterprise**

### **In this article**

> [Requirements for user-based licensing for Microsoft 365 Apps for enterprise in RPA](#requirements-for-using-microsoft-365-apps-for-enterprise-with-unattended-rpa)
> 
> [Steps to run Office Sessions in Unattended Mode](#steps-to-use-microsoft-365-apps-for-enterprise-with-unattended-rpa)

Robotic process automation (RPA) is the process of automating business procedures through mimicking and automatically executing rule-based tasks. Through RPA, a machine copies and records the set of actions that a user takes to complete a task. The two main forms of RPA are **Attended RPA**, which is the collaboration between the user and the bot (also known as the virtual assistant)**,** and **Unattended RPA**, which is the execution of tasks and interactions, independent of the user. With unattended RPA, the bot can run automation on its own. This article covers **Unattended RPA** **sessions**.

# **Requirements for using Microsoft 365 Apps for enterprise with unattended RPA **

The following are the requirements for using Microsoft 365 Apps for enterprise with unattended RPA:

  - The account that is running RPA unattended task must have a license for Microsoft 365 Apps for enterprise (unattended). The account can be a regular user account, a system/service account, or a robot account.

  - It is only available for Office Applications on Windows platform.

  - It requires version 2009 or later of Microsoft 365 Apps for enterprise.
    
    Same as attended user license, Admins can manage the Microsoft 365 Apps for enterprise (unattended) licenses in the Microsoft 365 Admin center.

If the account does not have a license for Microsoft 365 Apps for enterprise (unattended), the Office app being used for unattended RPA will be in reduced functionality mode. That means the unattended process can open and print existing documents in Office applications, but it can't create new documents or edit and save existing documents. In this case, below message will be shown beneath the ribbon in the document:

> **LICENSE REQUIRED** The account \<account sign-in name\> requires an Office license for unattended use. 

# **Steps to use Microsoft 365 Apps for enterprise with unattended RPA**

You can use one of the following options.

# **Using the Command Prompt Window**

## This will mostly apply to UI Automation scenarios. Upon application start-up,

  - Open the command prompt window (via your automation mechanism)

  - Call your Office app in the command prompt

  - When the app is called, switch will appear as the next command line

  - Pass argument on the command line switch to indicate you will use RPA Unattended: *“\[appname\].exe - unattended”*

<!-- end list -->

  - \*Appname is dependent on the name of the Office app you are opening.

The above scenario will happen **<span class="underline">every time</span>** you wish to run an Unattended RPA scenario in Office. You can also save the syntax offline and paste it back into the prompt later.

# **Using the Registry Key**

This is most applicable if you are running Unattended RPA on a **dedicated device**. To indicate Unattended usage, you can adjust your key with the following syntax: ***Software\\\\Microsoft\\\\Office\\\\Common\\\\Licensing", <span class="underline">key</span> = "Unattended", and <span class="underline">type</span> = DWORD.***

Users can then open their application via any method (does not have to be through the command prompt), as long as the per-user settings has been adjusted.

# **Sources:**

  - [Microsoft 365 Unattended License Overview](https://download.microsoft.com/download/3/D/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/M365_Unattended_Brief.pdf)

  - [New licensing options for Microsoft 365 for unattended scenarios](https://developer.microsoft.com/en-us/office/blogs/new-licensing-options-for-microsoft-365-for-unattended-scenarios/)

  - [Considerations for unattended automation of Office in the Microsoft 365 for unattended RPA environment](https://docs.microsoft.com/en-us/office/client-developer/integration/considerations-unattended-automation-office-microsoft-365-for-unattended-rpa)

  - [Command line switch code](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsupport.office.com%2Fen-us%2Farticle%2Fcommand-line-switches-for-microsoft-office-products-079164cd-4ef5-4178-b235-441737deb3a6&data=02%7C01%7CEbo.Quansah%40microsoft.com%7C286c55703b9445abc83108d8120ed42e%7C72f988bf86f141af91ab2d7cd011db47%7C0%7C0%7C637279202233188356&sdata=ZNlu5SadmbLCz3fK3zo8cYEX5s7SMo00ocODFpM2NZk%3D&reserved=0)
