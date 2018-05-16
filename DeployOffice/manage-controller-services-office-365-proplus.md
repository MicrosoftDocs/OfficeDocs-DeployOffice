
# How admins can manage controller services in Office 365 ProPlus 

The following information shows administrators what controls are available for services in Office 365 ProPlus in which Microsoft acts as data controller.<sup>1<sup/>

> [!NOTE]
> - For more information about these services, how the data is collected and processed, and the controls available to end users, see [Controller services in Office 365](https://support.officeppe.com/article/92c234f1-dc91-4dc1-925d-6c90fc3816d8).  **/{STAGING LINK/ARTICLE NAME NEEDS TWEAKING}**
> - Be sure to download the latest [Office 2016 Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030).
> - To use these services, Office must be installed. 
> - Some of these services may be available in other versions of Office, such as Office Professional Plus 2016. 


## Add-ins 
To avoid any unintended transfer of data to Microsoft via an add-in, we recommend that you disable the use of unknown add-ins by your users. You can do this by using Group Policy and the **Block Web Add-ins** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings\Trust Center\Trusted Catalogs. 

## Insert 3D Models
You can disable this service for your users by using Group Policy and the **Online Content Options** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Service Options...\Online Content. 


## Linked Data Types 
You can disable this service for your users by using Group Policy and the **Online Content Options** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Service Options...\Online Content. 

## LinkedIn Resume Assistant 
You can disable this service for your users by using Group Policy and the **Allow LinkedIn Resume Assistant feature** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Word 2016\Word Options\General. 

You can prevent all LinkedIn features from appearing in Office applications by using Group Policy and the **Show LinkedIn features in Office applications** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Miscellaneous. 

## Map Charts and 3D Maps 
You can disable this service for your users by using Group Policy and the **Online Content Options** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Service Options...\Online Content. 


## Office Help and Quick Starts 
You can disable this service for your users by using Group Policy and the **Send personal information** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center. 

## Office Templates 
You can disable this service for your users by using Group Policy and the **Disable web templates in File | New and on the Office Start screen** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Web Options… But, this policy setting doesn’t prevent users from downloading templates from Office.com using their web browsers.

## Online Pictures 
You can disable this service for your users by using Group Policy and the **Online Content Options** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Service Options...\Online Content. 

## Online Video 
You can disable this service for your users by using Group Policy and the **Online Content Options** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Service Options...\Online Content. 

## PowerPoint QuickStarter
You can disable this service for your users by using Group Policy and the **Turn off QuickStarter** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft PowerPoint 2016\PowerPoint Options\General. 

You can also use the **Send personal information** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center. 


## Send a Smile
You can disable this service for your users by using Group Policy and the **Send Office Feedback** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center.

You can also use the **Online Content Options** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Tools | Options | General | Service Options...\Online Content. 

You can disable the user option to send a screenshot of their desktop with their feedback to Microsoft by using the **Allow including screenshot with Office Feedback** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center.


## Smart Lookup
You can disable this service for your users by using Group Policy and the **Send personal information** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center. 


## Tell Me
You can disable this service for your users by using the **Send personal information** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center. 

## Translator
You can disable this service for your users by using the **Send personal information** policy setting. This policy setting can be found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center. 

{Add policy settings mentioned in Admin considerations for the modern Translator feature in Office}



<sup>1<sup/> “Controller” means the natural or legal person, public authority, agency or other body which, alone or jointly with others, determines the purposes and means of the processing of personal data; where the purposes and means of such processing are determined by Union or Member State law, the controller or the specific criteria for its nomination may be provided for by Union or Member State law.
