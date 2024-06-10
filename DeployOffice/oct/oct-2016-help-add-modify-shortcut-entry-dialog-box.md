---
title: "Office Customization Tool (OCT) 2016 Help Add/Modify Shortcut Entry dialog box"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.topic: concept-article
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: must-keep
ROBOTS: NOINDEX, NOFOLLOW
ms.date: 06/07/2024
---

# Office Customization Tool (OCT) 2016 Help: Add/Modify Shortcut Entry dialog box

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

In the **Add/Modify Shortcut Entry** dialog box, type the following information for the shortcut that you're creating or modifying, and then choose **OK**:
  
- **Target** - Specify the application associated with the shortcut by selecting a predefined application keyword or by typing the name and path of the file to which the shortcut will point. If you select an application keyword, the OCT automatically enters information in the remaining boxes. The names in the list correspond to features that you select on the **Set feature installation states** page of the OCT, plus any custom files that you add to the installation on the **Add files** page. If you type a name and path, and the name or path contains a space, you must enclose the entire string in double quotation marks (""). You can add command-line options for the application by using the **Arguments** field.
  
- **Location** - Specify the folder in which the shortcut is created by selecting a predefined folder keyword or typing the name and path to the location of the shortcut. You can specify a subfolder by appending a backslash (\) followed by the subfolder name. For example, to install the Word shortcut in the Office subfolder in the Programs folder in the **Start** menu, select **[ProgramMenuFolder]** and append the subfolder name as follows: **[ProgramMenuFolder]\Microsoft Office**. You can use the following special folders for **Location**:
  
   ****

|**Location**|**Windows location**|
|:-----|:-----|
|**[DesktopFolder]** <br/> |Windows Desktop folder  <br/> |
|**[ProgramMenuFolder]** <br/> |Windows Start\Programs menu  <br/> |
|**[StartMenuFolder]** <br/> |Windows Start menu  <br/> |
|**[StartupFolder]** <br/> |Startup folder in the Windows Start\Programs menu  <br/> |
|**[INSTALLLOCATION]** <br/> |The folder in which Office is installed  <br/> |
|**[AppDataFolder]\Microsoft\Internet Explorer\Quick Launch** <br/> |Internet Explorer's Quick Launch toolbar  <br/> |
|**[FavoritesFolder]\Links** <br/> |Internet Explorer's Links bar  <br/> |
|**[NetHoodFolder]** <br/> |The user's My Network Places folder  <br/> |
  
- **Name** - Specify a name for the shortcut by typing any string.
  
- **Start in** - Specify the default starting folder for the application by typing a path. If you leave this box blank, the default folder is set to the folder where the target file resides. If the path isn't valid on a user's computer, the user sees an error message when trying to use the shortcut.
  
- **Arguments** - Type optional arguments to pass to the application on the command line.
  
- **Shortcut key** - Type an optional keyboard shortcut for the application or file. The syntax for the shortcut key is: [modifier+]VK_key, where modifier is SHIFT, CTRL, ALT, or EXT, and VK_key is a virtual key name.
  
The modifier is optional, and you can specify more than one, in any order, separated by plus signs (+). If you use a modifier, it must precede the virtual key name. You must enter one virtual key name. Don't use spaces in the key definition. The following are some examples:
  
- CTRL+VK_F12
  
- CTRL+SHIFT+VK_A
  
- ALT+CTRL+VK_SNAPSHOT
  
Some key combinations, such as CTRL+ALT+VK_DELETE, might be used by the system and might not start the application as expected. Be careful to avoid conflicts on the user's computer, especially when specifying a shortcut key without a modifier. For example, if you specify VK_A with no modifier, the application runs every time the user types the A key.
  
You can use the following virtual key names:
  
|**Virtual key name**|**Hex key code**|**Description**|
|:-----|:-----|:-----|
|VK_0 … VK_9  <br/> |30-39  <br/> |Keys 0-9  <br/> |
|VK_A … VK_Z  <br/> |41-5A  <br/> |Keys A-Z  <br/> |
|VK_NUMPAD0 … VK_NUMPAD9  <br/> |60-69  <br/> |Keys 0-9 on the numeric keypad  <br/> |
|VK_F1 ... VK_F24  <br/> |70-87  <br/> |Function keys F1-F24  <br/> |
|VK_LBUTTON  <br/> |1  <br/> |Left mouse button  <br/> |
|VK_RBUTTON  <br/> |2  <br/> |Right mouse button  <br/> |
|VK_CANCEL  <br/> |3  <br/> |Control-break processing  <br/> |
|VK_MBUTTON  <br/> |4  <br/> |Middle mouse button (three-button mouse  <br/> |
|VK_BACK  <br/> |8  <br/> |BACKSPACE key  <br/> |
|VK_CLEAR  <br/> |0C  <br/> |CLEAR key  <br/> |
|VK_RETURN  <br/> |0D  <br/> |ENTER key  <br/> |
|VK_PAUSE  <br/> |13  <br/> |PAUSE key  <br/> |
|VK_CAPITAL  <br/> |14  <br/> |CAPS LOCK key  <br/> |
|VK_PRIOR  <br/> |21  <br/> |PAGE UP key  <br/> |
|VK_NEXT  <br/> |22  <br/> |PAGE DOWN key  <br/> |
|VK_END  <br/> |23  <br/> |END key  <br/> |
|VK_HOME  <br/> |24  <br/> |HOME key  <br/> |
|VK_LEFT  <br/> |25  <br/> |LEFT ARROW key  <br/> |
|VK_UP  <br/> |26  <br/> |UP ARROW key  <br/> |
|VK_RIGHT  <br/> |27  <br/> |RIGHT ARROW key  <br/> |
|VK_DOWN  <br/> |28  <br/> |DOWN ARROW key  <br/> |
|VK_SELECT  <br/> |29  <br/> |SELECT key  <br/> |
|VK_EXECUTE  <br/> |2B  <br/> |EXECUTE key  <br/> |
|VK_SNAPSHOT  <br/> |2C  <br/> |PRINT SCREEN key  <br/> |
|VK_INSERT  <br/> |2D  <br/> |INS key  <br/> |
|VK_HELP  <br/> |2F  <br/> |HELP key  <br/> |
|VK_MULTIPLY  <br/> |6A  <br/> |Multiply key  <br/> |
|VK_ADD  <br/> |6B  <br/> |Add key  <br/> |
|VK_SEPARATOR  <br/> |6C  <br/> |Separator key  <br/> |
|VK_SUBTRACT  <br/> |6D  <br/> |Subtract key  <br/> |
|VK_DECIMAL  <br/> |6E  <br/> |Decimal key  <br/> |
|VK_DIVIDE  <br/> |6F  <br/> |Divide key  <br/> |
|VK_NUMLOCK  <br/> |90  <br/> |NUM LOCK key  <br/> |
|VK_SCROLL  <br/> |91  <br/> |SCROLL LOCK key  <br/> |

- **Run** - Select the type of window in which the application or file should start ( **Normal window**, **Minimized**, or **Maximized**).

- **Change Icon** - Select a different icon for the shortcut.

## Related articles

- [Office Customization Tool (OCT) 2016 Help: Configure shortcuts](oct-2016-help-configure-shortcuts.md)