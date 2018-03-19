---
title: "Office Customization Tool (OCT) 2016 Help Set feature installation states"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 8/28/2015
ms.audience: ITPro
ms.topic: get-started-article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ms.assetid: 0ff078ae-b95a-4822-a11c-83d1679b56f1
description: "Summary: Customizes how Office features are installed on the user's computer."
---

# Office Customization Tool (OCT) 2016 Help: Set feature installation states

 **Summary**: Customizes how Office features are installed on the user's computer.
  
To change the installation state of a feature, choose it, and then select the installation state. Some features, called parent features, consist of multiple child features. To view child features, choose the plus sign (+) to the left of the parent feature to expand it.
  
When you change the installation state of a feature, the name of the feature and the names of all of its child features (if any) are displayed in bold, indicating that Setup will apply these changes to the installation. Features not displayed in bold are installed using the default installation state. If you want to remove a change that you made, select the feature and select the **Reset** or **Reset Branch**.
  
The following feature installation states typically are available to users during Setup. Not all installation states are available for every feature. For example, if a feature contains a component that cannot be advertised, **Installed on First Use** is not included in the list of available installation states for that feature. 
  
- **Run from My Computer** - Setup copies files and writes registry entries and shortcuts associated with the feature to the user's hard disk, and the application or feature runs locally. 
    
- **Run All from My Computer** - Same as **Run from My Computer**, except that all child features belonging to the feature are also set to this state.
    
- **Installed on First Use** - Setup leaves components for the feature and all of its child features in the local installation source until the user attempts to use the feature for the first time, at which time the components are installed. This is also known as an advertised feature. The symbol **[1]** is added to the menu icon next to the application name. 
    
- **Not Available** - The components for the feature, and all of the child features belonging to this feature, are not installed on the computer. A red **[X]** is added to the menu icon next to the application name. 
    
The following options also are available for each feature.
  
- **Hidden** - Setup does not display the feature in the feature tree during installation if Setup is run interactively. The feature is not hidden when Setup is run in maintenance mode after Office is installed. The symbol **[H]** is prepended to the feature name to indicate that the feature is hidden. 
    
- **Locked** - The installation state that you choose for this feature cannot be changed by the user during installation or in maintenance mode after Office is installed. The symbol **[L]** is prepended to the feature name to indicate that the feature is locked. 
    
- **Reset** - The feature is returned to its default installation state. This is the same as selecting the feature and choosing the **Reset Branch** button. 
    
If you explicitly set a feature to its default state, the symbol **[F]** is prepended to the feature name to indicate that the feature will be forced into this state. This is useful if you are creating a Setup customization file to modify an existing Office installation. If you do not change the installation state of a feature, then Setup does not change the feature on the user's computer. If you specify a change, even setting the feature to its normally default state, then Setup ensures that the feature is set to that state on the user's computer. 
  
When you change the installation state of a feature, Setup might change the installation state of a parent or child feature to match. For example, if you set a parent feature to **Installed on First Use**, but set a child feature to **Run from My Computer**, Setup changes the state of the parent feature also to **Run from My Computer**.
  
Setup does not display hidden features in the feature tree when users run Setup interactively, but the feature is installed according to its defined installation state. All child features belonging to the hidden feature are also hidden.
  
> [!NOTE]
> The best use of the **Hide** setting is to simplify the feature tree for users. For example, you might hide the Office Tools branch of the feature tree so that users do not have to decide which tools they need; only the tools that you select are installed. 
  
If you set a feature to **Not Available** and hide it in the feature tree, users can still change the setting and install the feature by installing the parent feature or by running Setup in maintenance mode. If you want to help prevent users from installing hidden features, select the **Not Available**, **Hidden**, and **Locked** installation state. In this case, the feature or application is not installed and is not available in maintenance mode. Users cannot install it by changing the state of the parent feature. The only way to reverse the **Not Available**, **Hidden**, and **Locked** installation state after Office is installed is to use the OCT to create a Setup customization file that is configured to change the installation state of the feature, and then apply the customization file to the user's computer. 
  

