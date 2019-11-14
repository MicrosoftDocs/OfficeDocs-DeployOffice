---
title: "Required diagnostic data for Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_Privacy
description: "Provides Office admins with information about required diagnostic data in Office, and provides a list of events and data fields."
hideEdit: true
---

# Required diagnostic data for Office

> [!IMPORTANT]
> The information in this article applies to Version 1904 or later of the following Office client software installed on a computer running Windows:
> - Office 365 ProPlus and Office 365 Business
> - Office 365 Personal, Office 365 Home, or other versions of Office that are part of an Office 365 subscription.
> - Project and Visio that come with some subscription plans, such as the Project Online Professional plan or Visio Online Plan 2.
>
> The information also applies to Version 16.28 or later of the following Office for Mac applications: Excel, Outlook, OneNote, PowerPoint, and Word.

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and fix problems, and also make product improvements. This data does not include a user’s name or email address, the content of the user’s files, or information about apps unrelated to Office.

This diagnostic data is collected and sent to Microsoft about Office client software being used on computers running Windows. Some diagnostic data is required, while some diagnostic data is optional. We give you the ability to choose whether to send us required or optional diagnostic data through the use of privacy controls, such as policy settings for organizations. You can see the diagnostic data being sent to us by using the Diagnostic Data Viewer.

***Required diagnostic data*** is the minimum data necessary to help keep Office secure, up-to-date, and performing as expected on the device it’s installed on.

Required diagnostic data helps to identify problems with Office that may be related to a device or software configuration. For example, it can help determine if an Office feature crashes more frequently on a particular operating system version, with newly introduced features, or when certain Office features are disabled. Required diagnostic data helps us detect, diagnose, and fix these problems more quickly so the impact to users or organizations is reduced.

For more information about diagnostic data, see the following:

- [Optional diagnostic data for Office](optional-diagnostic-data.md)
- [Using the Diagnostic Data Viewer with Office](https://support.office.com/article/cf761ce9-d805-4c60-a339-4e07f3182855)

If you’re the admin for your organization, you might also be interested in the following:

- [Overview of privacy controls for Office 365 ProPlus](overview-privacy-controls.md)
- [Use policy settings to manage privacy controls for Office 365 ProPlus](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)

## Categories, data subtypes, events, and data fields for required diagnostic data

Required diagnostic data is organized into categories and data subtypes. Within each data subtype are events, which contain data fields that are specific to that event.

The following table provides a list of the categories for required diagnostic data. The data subtypes within each category are listed, along with a description of the focus for that data subtype. There are links to each data subtype section where you’ll find the following information:

- A list of events in that data subtype
- A description of each event
- A list of data fields in each event
- A description of each data field

| **Category**​       | **Data subtype**​| **Description**​    |
| ---------- | ------------- | ---- |
| **Software setup and inventory**​ | [Office setup and inventory​](#office-setup-and-inventory-subtype)   | Installed product and version and the installation status.  |
| | [Office add-in configuration​](#office-add-in-configuration-subtype)  | Software add-ins and their settings​.     |
| | [Security](#security-subtype)​  | Document, feature, and add-in error conditions that may compromise security, including product update readiness.  |
| **Product and service usage**​    | [Application feature success](#application-feature-success-subtype)​   | Success of application functionality. Limited to opening and closing of the application and documents, file editing, and file sharing (collaboration).​ |
| | [Application status and boot](#application-status-and-boot-subtype)    | Determination if specific feature events have occurred, such as start or stop, and if feature is running​.   |
| | [Office accessibility configuration](#office-accessibility-configuration-subtype)  | Office accessibility features​       |
| | [Privacy](#privacy-subtype)| Office privacy settings|
| **Product and service performance** ​      | [Unexpected application exit (crash)](#unexpected-application-exit-crash-subtype)  | Unexpected application exits and the state of the application when that happens​.    |
|  | [Application feature performance ​](#application-feature-performance-subtype)  | Poor response time or performance for scenarios such as application start up or opening a file. |
|  | [Application activity error](#application-activity-error-subtype)   | Errors in functionality of a feature or user experience.  |
| **Device connectivity and configuration**​ | [Device connectivity and configuration​](#device-connectivity-and-configuration-subtype) | Network connection state and device settings, such as memory.​ |


> [!NOTE]
> - Categories are shown in the Diagnostic Data Viewer, but data subtypes are not shown.
> - A data field marked *Obsolete* has been or will soon be removed from required diagnostic data. Some of these data fields are duplicates that arose as diagnostic data was modernized and were used to ensure no service disruption to live diagnostic monitoring reports.

## Categories and data fields that are common for all events

There is some information about events that is common to all events, regardless of category or data subtype. This common information, which is sometimes referred to as *data contracts*, is organized into categories. Each category contains fields, and these fields are the metadata and properties of an individual event. You can view this information by using the Diagnostic Data Viewer.

The categories of information that is collected about events can be divided into two groups:

  - [Information common to all events](#information-common-to-all-events)
  - [Information that specifically supports diagnostic data collection](#information-that-specifically-supports-diagnostic-data-collection)

### *Information common to all events*

Information common to all events is collected in the following categories.

#### App 

Information about the application. All fields are constant for all sessions of a given application version.

This category contains the following fields:

  - **Branch** - The branch that the given build came from. Allows us to determine what type of branch a given build came from so that we can correctly target fixes.
  - **InstallType** - An enumerator that identifies how the user installed the application. Allows us to determine if specific install mechanisms are creating issues that are not seen in other installation mechanisms.
  - **Name** - The name of the application that is providing the data. Allows us to identify which application is showing an issue so we know how to address it.
  - **Platform** - The broad classification of the platform on which the app is running. Allows us to identify on which platforms an issue may be occurring so that we can correctly prioritize the issue.
  - **Version** - The version of the application. Allows us to identify which versions of the product are showing an issue so that we can correctly prioritize it.

#### Client 

Identifier related to an Office instance on a device. Constant for all sessions of all apps of a given installation version for multi-app suites, or constant for all sessions of a given application version.

This category contains the following fields:

  - **Id** - Unique identifier assigned to a client at install time of Office. Allows us to identify whether issues are impacting a select set of installs and how many users are impacted.

#### Consent

Information regarding the users consent for diagnostic data and connected experiences.

This category contains the following fields:

  - **UserCategory –** Identified the type of user who made the consent. One of MSAUser, AADUser or LocalDeviceUser

  - **DiagnosticConsentLevel** – Indicates what level of diagnostic data consent the user has given

  - **DiagnosticConsentSourceLocation** – Indicates how the user had provided the consent for diagnostic data

  - **DiagnosticConsentConsentTime** – Indicates when the user provided the consent for diagnostic data. The date will appear as either a human readable date or as a machine encoded date that looks like a large number.

  - **ServiceConnectionState** – Indicates whether the user has chosen to use or not use all connected experiences

  - **ServiceConnectionStateSourceLocation** – Indicates how the user provided the choice whether to use all connected experiences

  - **ServiceConnectionStateConsentTime** – Indicates when the user chose whether to use all connected experiences. The date will appear as either a human readable date or as a machine encoded date that looks like a large number.

  - **ControllerConnectedServicesState** – Indicates whether the user has access to optional connected experiences

  - **ControllerConnectedServicesStateSourceLocation** – Indicates how the user’s choice for optional connected experiences was made

  - **ControllerConnectedServicesStateConsentTime** – Indicates when the user chose the status of optional connected experiences. The date will appear as either a human readable date or as a machine encoded date that looks like a large number.

  - **UserContentDependentState** – Indicates whether the user has chosen to enable or disable connected experiences that analyze content

  - **UserContentDependentStateSourceLocation** – Indicates how the user’s choice to enable or disable was made for connected experiences that analyze content

  - **UserContentDependentStateConsentTime** – Indicates when the user chose to enable or disable connected experiences that analyze content was made. The date will appear as either a human readable date or as a machine encoded date that looks like a large number.

  - **DownloadContentState** – Indicates whether the user has chosen to enable or disable connected experiences that download online content

  - **DownloadContentStateSourceLocation** – Indicates how the user made the choice to enable or disable connected experiences that that download online content

  - **DownloadContentStateConsentTime** – Indicates when the user made the choice to enable or disable connected experiences that download online content. The date will appear as either a human readable date or as a machine encoded date that looks like a large number.

#### Device 

Information about the operating system and build.

This category contains the following fields:

  - **OsBuild** - The build number of the operating system installed on the device. Allows us to identify whether issues are impacting individual service packs or versions of a given operating system differently than others so we can prioritize issues.

  - **OsVersion** - The major version of the operating system installed on the device. Allows us to determine if issues are impacting a particular operating system version more than other so we can prioritize issues.

#### Legacy 

Provides an App Id and OS version for compatibility with existing legacy collection practices.

This category contains the following fields:

  - **AppId** - An enumerator value representing which application is sending the data. Allows us to identify which application is showing an issue so we know how to address it.

  - **OsEnv** - An enumerator indicating which operating system the session is running on. Allows us to identify which operating system an issue happening on so we can prioritize issues.

#### Release 

Information related to the release channel. All fields are constant for all sessions of all apps of a given installation version. Identifies a group of devices all in one phase of a product release cycle.

This category contains the following fields:

  - **Audience** - Identifies a sub-audience of a given audience group. Allows us to track subsets of audience groups to evaluate prevalence and prioritization of issues.

  - **AudienceGroup** - Identifies the ring where data is coming from. Allows us to roll out features in a staged fashion and identify potential issues before they reach most users.

  - **Channel** - The channel that the product is being released through. Allows us to identify if an issue is impacting one of our rollout channels differently than others.

  - **Fork** - Identifies the fork of the product. Allows a mechanism to aggregate data across a set of build numbers to identify issues related to a given release.

#### Session 

Information about the process session. All fields are constant for this session.

This category contains the following fields:

  - **ABConfigs** - Identifies the set of flights that are running in a given session. Allows us to identify which individual flights are running on a session so that we can determine if a flight is the source of an issue impacting users.

  - **EcsETag** - An indicator from the flighting system that represents the flights sent to the machine. Allows us to identify what flights might be impacting a given session.

  - **Flags** - Bitmask tracking flags applicable to an entire session, currently primarily focused on sampling and diagnostic data options. Allows us to control how a given session behaves in relation to the diagnostic data that the session generates.

  - **Id** - Uniquely identifies a given session of data. Allows us to identify the impact of issues by evaluating the number of sessions that are impacted and if there are common features of those sessions.

  - **ImpressionId** - Identifies the set of flights that are running in a given session. Allows us to identify which individual flights are running on a session so that we can determine if a flight is the source of an issue impacting users.

  - **MeasuresEnabled** - Flag indicating if the current sessions data is sampled or not. Allows us to determine how to statistically evaluate the data that is gathered from the given session.

  - **SamplingClientId** - The id of the client used to determine if it is part of sampling. Allows us to determine why an individual session was included or excluded from sampling.

#### User

Provides tenant information for commercial software SKUs.

This category contains the following fields:

  - **PrimaryIdentityHash** – A pseudonymous identifier that represents the current user.

  - **PrimaryIdentitySpace** – The type of identity contained in the PrimaryIdentityHash. One of MASCID, OrgIdCID or UserObjectId.

  - **TenantGroup** - The type of the tenant that the subscription belongs to. Allows us to classify issues and identify whether a problem is widespread or isolated to a set of users.

  - **TenantId** - The tenant that a user’s subscription is tied to. Allows us to classify issues and identify whether a problem is widespread or isolated to a set of users or a specific tenant.

### *Information that specifically supports diagnostic data collection*

Information that specifically supports diagnostic data collection is collected in the following categories.

#### Activity

Information to understand the success of the collection event itself.

This category contains the following fields:

  - **AggMode** - Tells the system how to aggregate activity results. Allows us to reduce the amount of information uploaded from a user’s machine by aggregating activity results into a single event that gets sent periodically.

  - **Count** - The number of times the activity happened if the count is from an aggregated event. Allows us to determine how often an activity succeeded or failed based on the aggregation mode of the activity.

  - **CV** - A value that identifies the relationship between activities and sub-activities. Allows us to rebuild the relationship between nested activities.

  - **Duration** - The length of time the activity took to execute. Allows us to identify performance issues that are negatively impacting the users experience.

  - **Result**.**Code** - An application defined code to identify a given results. Allows us to determine more specific details of a given failure such as a failure code that can be used to classify and fix issues.

  - **Result.Tag** - An integer tag that identifies the location in code where the result was generated. Allows us to distinctly identify the location in code where a result was generated which enables classification of failures.

  - **Result**.**Type** - The type of the result code. Identifies what type of result code was sent so that the value can be correctly interpreted.

  - **Success** - A flag indicating if the activity succeeded or failed. Allows us to determine if actions the user takes in the product are succeeding or failing. This allows us to identify issues that are impacting the user.

#### Application 

Information about the installation of the application from which the events are being gathered.

This category contains the following fields:

  - **Architecture** - The architecture of the application. Let’s us classify errors that might be specific to an architecture of the application.

  - **Click2RunPackageVersion** - The version number of the Click-To-Run package that installed the app. Allows us to identify which version of the installer was used to install Office so we can identify setup related issues.

  - **DistributionChannel** - The channel where the app was deployed. Allows us to partition incoming data so we can determine if issues are impacting audiences.

  - **InstallMethod** - Whether the current build of Office was upgraded from an older build, rolled back to an older build, or a fresh install.

  - **IsClickToRunInstall** - Flag indicating if install was a click to run install. Allows us to identify issues that might be specific to the Click-To-Run install mechanism.

  - **IsDebug** - Flag indicating if the office build is a Debug build. Allows us to identify if issues are coming from Debug builds which may behave differently .

  - **IsInstalledOnExternalStorage** - Flag indicating if Office was installed on an external storage device. Let’s us determine if issues can be traced to an external storage location.

  - **IsOEMInstalled** - Flag indicating if Office was installed by an original equipment manufacturer (OEM). Let’s us determine if the application was installed by an OEM which can help us classify and identify issues.

  - **PreviousVersion** - The version of Office that was previously installed on the machine. Allows us to roll back to a previous version if the current one has an issue.

  - **ProcessFileName** - The name of the application filename. Allows us to identify the name of the executable which is generating the data as there may be several different process filenames reporting as the same app name.

#### Client

Information about the Office client.

This category contains the following fields:

  - **FirstRunTime** - The first time the client was run. Allows us to understand how long the client has had Office installed.

#### Device

Information about device configuration and capabilities.

This category contains the following fields:

  - **DigitizerInfo** - Information on the digitizer used by the machine. Allows us to classify data based on device pivot.

  - **FormFactor** - Identifies what form factor the device sending the info is. Allows us to classify data based on device pivot.

  - **FormFactorFamily** - Identifies what form factor the device sending the info is. Allows us to classify data based on device pivot.

  - **HorizontalResolution** - The horizontal resolution of the devices screen. Allows us to classify data based on device pivot.

  - **Id** - A unique identifier for the device. Allows us to identify the distribution of issues across a set of devices.

  - **IsEDPPolicyEnabled** - Flag to indicate if enhanced data protection is enabled on the machine. Allows us to classify data based on device pivot.

  - **IsTerminalServer** - Flag to determine if the machine is a terminal server. Allows us to classify data based on device pivot.

  - **Manufacturer** - The manufacturer of the device. Allows us to classify data based on device pivot.

  - **Model** - The model of the device. Allows us to classify data based on device pivot.

  - **MotherboardUUIDHash** - A hash of a unique identifier for the motherboard. Allows us to classify data based on device pivot.

  - **Name** - The name of the device. Allows us to classify data based on device pivot.
  
  - **NetworkCost** - Indicates network cost or type, such as metered or metered above cap.
  
  - **NetworkCountry** - The country code of the sender, based on the unscrubbed client IP address.

  - **NumProcPhysCores** - The number of physical cores on the machine. Allows us to classify data based on device pivot.

  - **OsLocale** - The locale of the operating system that is running. Allows us to classify data based on device pivot.

  - **ProcessorArchitecture** - The architecture of the processor. Allows us to classify data based on device pivot.

  - **ProcessorCount** - The number of processors on the machine. Allows us to classify data based on device pivot.

  - **ProcSpeedMHz** - The speed of the processor. Allows us to classify data based on device pivot.

  - **RamMB** - The amount of memory the device has. Allows us to classify data based on device pivot.

  - **ScreenDepth** - Allows us to classify data based on device pivot.

  - **ScreenDPI** - The DPI value of the screen. Allows us to classify data based on device pivot.

  - **SusClientId** - The Windows Update id of the device Office is run on.

  - **SystemVolumeFreeSpaceMB** - The amount of free space on the system volume. Allows us to classify data based on device pivot.

  - **SystemVolumeSizeMB** - The size of the system volume on the machine. Allows us to classify data based on device pivot.

  - **VerticalResolution** - The vertical resolution of the devices screen. Allows us to classify data based on device pivot.

  - **WindowErrorReportingMachineId** - A unique machine identifier provided by Windows error reporting. Allows us to classify data based on device pivot.

  - **WindowSqmMachineId** - A unique identifier for the machine provided by Windows SQM. Allows us to classify data based on device pivot.

#### Event 

Event-specific information, including its unique identifier in the session.

This category contains the following fields:

  - **Contract** - A list of any contracts that the event is implementing. Allows us to evaluate what data is part of the individual event so that we can process it effectively.

  - **CV** - A value that allows us to identify events that are related to one another. Used for diagnostics to allow us to identify patterns of related behavior or related events.

  - **Flags** - Information used to alter how a given event responds. Used to manage how a given event is treated for the purposes of uploading the data to Microsoft.

  - **Id** - A unique identifier for the event. Allows us to uniquely identify the events that are being received.

  - **Name** - The name of the event. Allows to identify the event that was being sent from the client.

  - **Rule** - An identifier of the rule that generated the data if it was generated by a rule. Allows us to identify the source of a piece of data so that we can validate and manage that events parameters

  - **RuleId** - The identifier of the rule that generated the data if it was generated by a rule. Allows us to identify the source of a piece of data so that we can validate and manage that events parameters.

  - **RuleInterfaces** - Any interfaces that are implemented by the specific rule. Allows us to classify and import the data based on its structure which simplifies data processing.

  - **RuleVersion** - The identifier of the rule that generated the data if it was generated by a rule. Allows us to identify the source of a piece of data so that we can validate and manage that events parameters.

  - **SampleRate** - An indication of what percentage of users are sending this piece of data This allows us to do statistical analysis of the data and for very common data points not require that to be sent by all users.

  - **SchemaVersion** - The version of the schema used to generate diagnostic data. Required to manage data being sent form the client. This allows changes over time in what data is being sent from each client.

  - **Sequence** - A counter that identifies the order that an event was generated on the client. Allows the data being received to be ordered so that we can identify what steps may have led to an issue that is impacting clients.

  - **Source** - The source pipeline that was used to upload the data. Required to monitor each of our upload pipelines for overall health and to help identify issues with the upload pipeline. This allows us to monitor individual upload pipelines to make sure they remain compliant.

  - **Time** - The time that the event was generated on the client. Allows us to synchronize and validate the order of events generated on the client as well as establish performance metrics for user instructions. 

#### Host

Information about an application that hosts an embedded application

This category contains the following fields:

  - **Id** - The unique identifier attributed to the host application by the embedded application.

  - **SessionId** - The globally unique identifier for the host’s session.

  - **Version** - The version identifier of the host’s primary executable.

#### Legacy

Information needed for legacy system compatibility.

This category contains the following fields:

  - **OsBuild** - The specific build number of the operating system. Allows us to determine which version of the operating system the diagnostic data is coming from in order to prioritize issues.

  - **OsBuildRevision** - The revision number of the build of the operating system. Allows us to determine which version of the operating system the diagnostic data is coming from in order to prioritize issues.

  - **OsMinorVersion** - The minor version of the operating system. Allows us to determine which version of the operating system the diagnostic data is coming from in order to prioritize issues.

  - **OsVersionString** - A unified string representing the operating system build number. Allows us to determine which version of the operating system the diagnostic data is coming from in order to prioritize issues.

#### Session

Information about the process session.

This category contains the following fields:

  - **ABConfigsDelta** - Tracks the difference between the current ABConfigs data and the previous value. Allows us to track what new flights are on the machine to help identify if a new flight is responsible for an issue.

  - **CollectibleClassification** - The classes of information the session can collect. Allows filtering of sessions based on the data they would have.

  - **DisableTelemetry** - Flag indicating if the DisableTelemetry key is set. Allows us to know if a session was not reporting diagnostic data other than EssentialServiceMetadata.

  - **SamplingKey** - The key used to determine whether the session is sampled or not. Allows us to understand how individual sessions are making their choice of whether they are sampled or not.

  - **SamplingMethod** - The method used to determine sampling policy. Allows us to understand what data is coming from a session.

  - **Sequence** - A unique numeric identifier for the session. Allows the ordering of sessions for analysis of then issues might have occurred.

  - **Start** - The boot time of the process session. Allows us to establish when the session started.

  - **TimeZoneBiasInMinutes** - The difference in minutes between UTC and the local time. Allows normalization of UTC times back to the local time.

  - **SamplingClientIdValue** - The value of the key used to determine sampling. Allows us to determine why a session was sampled or not.

  - **SamplingDeviceIdValue** - The value of the key used to determine sampling. Allows us to determine why a session was sampled or not.

  - **SamplingSessionKValue** - Advanced sampling metadata. Used to help evaluate statistical meaning of data that is received.

  - **SamplingSessionNValue** - Advanced sampling metadata. Used to help evaluate statistical meaning of data that is received.

  - **TelemetryPermissionLevel** - Value indicating what level of diagnostic data the user has opted into. Allows us to understand what level of diagnostic data to expect from a session.

## Data fields that are common for OneNote events

The following data fields are common for all events for OneNote on Mac, iOS, and Android.

> [!NOTE]
> When using the Diagnostic Data Viewer, events for OneNote on Mac, iOS, and Android will appear to have a name of Activity, ReportData, or Unexpected. To find the actual event name, select the event, and then look at the EventName field.

- **Activity_ActivityType** -  Indicates the type of this activity event. An activity can be a normal activity or a high value activity.

- **Activity_AggMode** -  Tells the system how to aggregate activity results. Allows us to reduce the amount of information uploaded from a user’s machine by aggregating activity results into a single event that gets sent periodically.

- **Activity_Count** -  The number of times the activity happened if the count is from an aggregated event. Allows us to determine how often an activity succeeded or failed based on the aggregation mode of the activity.

- **Activity_CV** -  A value that identifies the relationship between activities and sub-activities. Allows us to rebuild the relationship between nested activities.

- **Activity_DetachedDurationInMicroseconds** -  The length of time an activity is idle and not doing any real work, but the time is still count towards the total activity's time.

- **Activity_DurationInMicroseconds** -  The length of time the activity took to execute. Allows us to identify performance issues that are negatively impacting the users experience.

- **Activity_Expiration** -  A date in numerical format indicates when this event will be stop sending from clients

- **Activity_FailCount** -  A number of times this activity has failed

- **Activity_Name** -  A short name of an event. Allows to identify the event that was being sent from the client.

- **Activity_Namespace** -  A namespace of an event. Allows to group the event into groups.

- **Activity_Reason** -  A string indicating the reason causing an activity to ends with a particular result.

- **Activity_Result** -  A flag indicating if the activity succeeded, failed, or unexpectedly failed. Allows us to determine if actions the user takes in the product are succeeding or failing. This allows us to identify issues that are impacting the user.

- **Activity_State** -  A flag indicates whether an event is a start of a user activity or an end of a user activity.

- **Activity_SucceedCount** -  A number of times this activity is succeeded.

- **ErrorCode** -  Indicates an error code if available.

- **ErrorCode2** -  Indicates a second error code if available.

- **ErrorCode3** -  Indicates a third error code if available.

- **ErrorTag** -  Indicates the tag associated in code of an error if available.

- **ErrorType** -  Indicates the type of an error if available.

- **EventName** -  A unique name of a OneNote's event. OneNote events use this custom field to specify a unique name due to an engineering limitation in the past.

- **ExpFeatures** -  Indicates whether a user has turn-on an experimental-feature switch in OneNote app or not.

- **ExpirationDate** -  A date in numerical format indicates when this event will be stop sending from clients

- **IsConsumer** -  Indicates whether a user is consumer or not

- **IsEdu** -  Indicates whether a user is a user in education tenant or not

- **IsIW** -  Indicates whether a user is an enterprise user or not

- **IsMsftInternal** -  Indicates whether a user is a Microsoft employee or not

- **IsPremiumUser** -  Indicates whether a user has premium license or not

- **Namespace** -  A namespace of the event. Allows to group the event into groups.

- **Release_AppStore** -  A flag indicates whether a build is coming from an app store or not.

- **Release_Audience** -  Identifies a sub-audience of a given audience group. Allows us to track subsets of audience groups to evaluate prevalence and prioritization of issues.

- **Release_AudienceGroup** -  Identifies the ring where data is coming from. Allows us to roll out features in a staged fashion and identify potential issues before they reach most users.

- **Release_Channel** -  The channel that the product is being released through. Allows us to identify if an issue is impacting one of our rollout channels differently than others.

- **RunningMode** -  Indicates how the app is launched either by user or by system process.

- **SchemaVersion** -  Indicates a current telemetry schema version in OneNote's telemetry pipeline.

- **Session_EcsETag** -  An indicator from the flighting system that represents the flights sent to the machine. Allows us to identify what flights might be impacting a given session.

- **Session_ImpressionId** -  Identifies the set of flights that are running in a given session. Allows us to identify which individual flights are running on a session so that we can determine if a flight is the source of an issue impacting users.

- **SessionCorrelationId** -  The globally unique identifier for the host’s session.

- **SH_ErrorCode** -  Indicates an error code if available when an activity fails.

- **Tag** -  An integer tag that identifies the location in code where the telemetry event is generated.

- **UserInfo_IdType** -  A string indicates the type of a user's account

- **UserInfo_OMSTenantId** -  The tenant that a user’s subscription is tied to. Allows us to classify issues and identify whether a problem is widespread or isolated to a set of users or a specific tenant.

- **UserInfo_OtherId** -  A list of non-primary pseudonymous identifiers representing user's accounts.

- **UserInfo_OtherIdType** -  A list of non-primary account types.

## Software setup and inventory data events

The following are the data subtypes in this category:
- [Office setup and inventory​](#office-setup-and-inventory-subtype)
- [Office add-in configuration​](#office-add-in-configuration-subtype)
- [Security](#security-subtype)​  

### *Office setup and inventory subtype*

Installed product and version and the installation status.

#### Office.ClickToRun.UpdateStatus

Applicable to all win32 applications. Helps us understand the status of the update process of the office suite (Success or failure with error details)

The following fields are collected:

- **build** - Currently installed Office version

- **channel** - The channel by which Office was distributed

- **errorCode** - Error code indicating the failure

- **errorMessage** - Additional error information

- **status** - Current status of the update

- **targetBuild** - Version Office is updating to

#### Office.Compliance.FileFormatBallotDisplayedOnFirstBoot

Indicates whether the Office File Format choice dialog box was shown to the user on first/second boot of Word, Excel, PowerPoint on Win32.  Tracks whether the FileFormat Ballot dialog box is displayed - event is sent at the first/second boot of Word, Excel or PPT Win32.

The following fields are collected.

- **CountryRegion** –  The users’ country region setting in Windows system

- **FileFormatBallotBoxAppIDBootedOnce** –  In which app (Word, Excel, PPT) the file format ballot display logic was processed.

- **FileFormatBallotBoxDisplayedOnFirstBoot** –  What is the display result for file format ballot (displayed/not displayed as unexpected/not displayed due to license/not displayed due to location).

#### Office.Compliance.FileFormatBallotOption

Tracks whether the FileFormat Ballot dialog box is displayed - event is sent at the first/second boot of Word, Excel or PPT Win32.  Indicates whether the Office File Format choice dialog box is displayed on first or second boot of Word, Excel, or PowerPoint on Win32.

The following fields are collected:

- **FileFormatBallotSelectedOption** – Identifies the file format option (OOXML/ODF) that was selected by the user through the file format ballot dialog box.


#### Office.CorrelationMetadata.UTCCorrelationMetadata

Collects Office metadata through UTC to compare with equivalent data collected through the Office telemetry pipeline to check correctness and completeness of data.

The following fields are collected:

- **abConfigs** - A list of feature IDs to identify which features are enabled on the client or empty when this data is not being collected.

- **abFlights** - "NoNL:NoFlights" when the feature flights aren't set. Otherwise "holdoutinfo=unknown".

- **AppSessionGuid** - An identifier of a particular application session starting at process creation time and persisting until process end. It is formatted as a standard 128-bit GUID but constructed of 4 parts. Those four parts in order are (1) 32 bit Process ID (2) 16 bit Session ID (3) 16 bit Boot ID (4) 64 bit Process creation time in UTC 100ns

- **appVersionBuild** - The app build version number.

- **appVersionMajor** - The app major version number.

- **appVersionMinor** - The app minor version number.

- **appVersionRevision** - The app revision version number.

- **audienceGroup** - The release audience group name

- **audienceId** - The release audience name

- **channel** - The channel by which Office was distributed

- **deviceClass** - Device form factor from the OS

- **ecsETag** - An experiment identifier for the process

- **impressionId** - A guid indicating the current set of features.

- **languageTag** - The current Office UI IETF language tag

- **officeUserID** - Randomly generated guid for this Office install

- **osArchitecture** - Operating system architecture

- **osEnvironment** - An integer indicating the operating system (Windows, Android, iOS, Mac, etc).

- **osVersionString** - Operating system version

- **sessionID** - Randomly generated guid to identify the app session

- **UTCReplace_AppSessionGuid** - Constant boolean value. Always true.

#### Office.OneNote.FirstRun.FirstRun

The critical signal used to ensure new users can successfully launch and run OneNote for the first time.  The telemetry is collected to ensure critical regression detection for OneNote app and service health. If users can’t launch the app for the first time, this would trigger a high severity incident.

- **AfterOneDriveFrozenAccountError** - Indicates an error from OneDrive when an account is frozen.

- **Attempt** - The number of times that the first run experience needs to retry.

- **IsDefaultNotebookCreated** - Indicates whether OneNote has created a user's default notebook or not.

- **IsDelayedSignIn** - Indicates whether the first run is in delayed sign-in mode where a user is not required to signed-in.

- **IsMSA** - Indicates whether an account is Microsoft account or not.

#### Office.OneNote.FirstRun.FirstRunForMSA

The critical signal used to ensure new consumer users (Microsoft Account) can successfully launch and use OneNote for the first time.
How used Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t launch the app for the first time, this would trigger a high severity incident.

The following fields are collected:

- **Attempt** - The number of times that the first run experience needs to retry.

- **Error A** - OneNote's error object indicates an error during an error during the first run if any.

- **FAllowAddingGuide** - Indicates whether OneNote will allow creating a guide notebook or not.

- **FrozenOneDriveAccount** - Indicates whether a OneDrive account is frozen or not.

- **IsDefaultNotebookCreated** - Indicates whether OneNote has created a user's default notebook or not.

- **NoInternetConnection** - Indicates whether a device does not have internet connection.

- **ProvisioningFailure** - A OneNote error object indicating a provisioning error if any.

- **ProvisioningFinishedTime** - Indicates the end time when OneNote finishes provisioning a notebook during first run experience.

- **ProvisioningStartedTime** - Indicates the start time when OneNote starts provisioning a notebook during first run experience.

- **ShowSuggestedNotebooks** - Indicates whether OneNote will show a suggested notebook feature or not.

#### Office.OneNote.FirstRun.FirstRunForOrgId

The critical signal used to ensure new enterprise users (AAD/OrgID) can successfully launch and run OneNote for the first time.  How used Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t launch the app for the first time, this would trigger a high severity incident.

- **Attempt** - The number of times that the first run experience needs to retry.

- **Error** - A OneNote's error object indicates an error during the first run if any.

- **FAllowAddingGuide** - Indicates whether OneNote will allow creating a guide notebook or not.

- **IsDefaultNotebookCreated** - Indicates whether OneNote has created a user's default notebook or not.

- **ProvisioningFailure** - A OneNote's error object indicates a provisioning error if any.

- **ProvisioningFinishedTime** - Indicates the end time when OneNote finishes provisioning a notebook during first run experience.

- **ProvisioningStartedTime** - Indicates the start time when OneNote starts provisioning a notebook during first run experience.

#### Office.TargetedMessaging.EnsureCached 

Tracks if a package for Dynamic Canvas was downloaded. Considered a software configuration because the package must be successfully downloaded to enable the client to render the right experience. Is especially critical in consumer subscriptions where we use canvas to communicate to the user that the license has expired. Used to track metadata of a dynamic content package downloaded and cached by the product as well as results of operations performed on the package: download failures, unpacking failures, consistency checks failures, cache hits, package usages, download sources.

The following fields are collected:

  - **Data\_CacheFolderNotCreated -** Boolean flag indicating if cache folder creation succeed

  - **Data\_CdnPath – source address of the package-**

  - **Data\_EnsureCached -** Boolean flag indicating if content package was cached

  - **Data\_ExistsAlready -** Boolean flag indicating that the package was already downloaded before and there was another attempt

  - **Data\_GetFileStreamFailed -** source package not available in source

  - **Data\_GetFileStreamFailedToCreateLocalFolder -** local disk issues causing failure in directory creation

  - **Data\_GetFileStreamFromPackageFailed -** flag indicating if package was downloaded, but the client can’t read it

  - **Data\_GetFileStreamFromPackageSuccess -** successful attempts to read the package

  - **Data\_GetFileStreamSuccess -** no disk issues nor configuration issues which doesn’t let the file stream to be read

  - **Data\_GetRelativePathsFailed -** relative path doesn’t point to accessible location

  - **Data\_HashActualValue -** hash value extracted from file name when the package was used

  - **Data\_HashCalculationFailed -** error with calculation of a hash

  - **Data\_HashMatchFailed -** hash mismatch between the package name and registry values cached

  - **Data\_HashMatchSuccess -** hash consistency check success

  - **Data\_PackageDownloadRequestFailed -** can’t download the package

  - **Data\_PackageDownloadRequestNoData -** downloaded package contains no data

  - **Data\_PackageDownloadRequestSuccess -** successful download of a package

  - **Data\_PackageExplodedSuccess -** unpacking attempts statuses

  - **Data\_PackageOpenFailed -** failed attempts to open the package file

  - **Data\_PackageOpenSuccess -** successful attempts to open the package file

  - **Data\_SuccessHashValue -** hash value extracted from file name when the package was downloaded

  - **Data\_SuccessSource -** surface for which the package was downloaded

#### Office.Visio.VisioSKU

Captures Visio SKU whether it's standard or professional. Essential to categorize issues based on SKU.

The following fields are collected:

  - **Data\_VisioSKU**:**integer** - 0 for Standard SKU and 1 for Professional SKU

### *Office add-in configuration subtype*

Software add-ins and their settings​.

#### Excel.AddinDefinedFunction.CustomFunctionsAllInOne

Collects information about runtime behavior of custom add-in functions. Maintains counters of execution attempts, successful completions, infrastructure errors, and user code errors. This is used to identify reliability issues in the product and fix user-impacting problems.
 
The following fields are collected:

- **AsyncBegin** - number of async functions that begin

- **AsyncEndAddinError** - number of async functions that end in error

- **AsyncEndInfraFailure** - number of async functions that end with in infra failure

- **AsyncEndSuccess** - number of async functions that end successfully

- **AsyncRemoveCancel** - number of async functions that were canceled 

- **AsyncRemoveRecycle** - number of async functions that were removed due to recycle 

- **StreamingCycles1** - streaming cycle counter

#### Office.Extensibility.AppCommands.AppCmdProjectionStatus

Collects information to track which Office add-in installations successfully updated the ribbon vs failed.

Used to fix common registration issues where add-ins are not installed properly and never show up resulting in them being unusable.

The following fields are collected:

  - None

#### Office.Extensibility.AppCommands.AddSolution

Collects install information for Office add-ins that customize the ribbon.  Used to detect issues with how custom add-ins modify the office ribbon.
 
The following fields are collected:

- **AppVersion** - version of the app

- **SolutionId** - id of the solution

- **StoreType** - indicates the origin of the app

- **TelemetryId** - telemetry id based on the signed in identity


#### Office.Extensibility.Catalog.ExchangeGetEntitlements

Data regarding the success for failure of retrieving add-in entitlement data for the Office 365 tenant admin assigned add-ins. Used for health metrics, charts, and analysis of customer problems.

The following fields are collected:

  - **CachingResult -** the result of the attempt to save the service call return value

  - **ClientParameter -** client identifier sent in the service call

  - **EntitlementsCount -** The number of entitlements expected in the call response

  - **EntitlementsParsed -** the number of entitlements parsed from the response

  - **IsAllEntitlementsParsed -** whether expected entitlements count matches parsed entitlements count

  - **ServiceCallHResult -** the result returned by the service call API

  - **TelemetryId -** a GUID representing a unique user

  - **UsedCache -** whether the cached response was used instead of making a service call

  - **VersionParameter -** Office version number sent in the service call

#### Office.Extensibility.Catalog.ExchangeGetLastUpdate

Data regarding the success for failure of retrieving the need for updated data regarding the Office 365 tenant admin assigned add-ins. Used for health metrics, charts, and analysis of customer problems. ExchangeGetLastUpdate will always run on boot as part of the host code and determine whether add-in assignments have changed for a user.  If so then osf.DLL will be loaded so we can call ExchangeGetEntitlements to get the specific assignments (and ExchangeGetManifests will called to retrieve any new manifest that are needed).  ExchangeGetEntitlements (and ExchangeGetManifests) could also be called on demand after host application has been running.  The idea is to not load the large DLL if we don’t need to.  Without this event in Required, we would not be able to tell if users are failing to get add-ins assigned to them if that first service call fails.  It’s also the main signal for any auth problems we face talking to our service.

The following fields are collected:

  - **Abort -** whether the host was shut down during the service call

  - **AllowPrompt -** whether auth prompting was allowed

  - **AuthScheme -** the auth scheme requested by exchange

  - **BackEndHttpStatus -** http code reported when talking to exchange back end-

  - **BackupUrl -** the secondary exchange URL to call

  - **BEServer -** the back-end exchange server name

  - **CalculatedBETarget -** The full name of the exchange back end machine

  - **Call(n)\_TokenAuthError -** the auth error of the nth service call attempt

  - **Call(n)\_TokenIsValid -** whether the auth token on the nth service attempt was valid

  - **CallMethod -** a string indicating which path the code took

  - **ConfigSvcReady -** whether the config service had been initialized yet

  - **Date -** value returned by exchange server

  - **DiagInfo -** information returned by exchange server

  - **End\_TicketAuthError -** any error in getting the auth ticket after service call

  - **End\_TokenIsValid -** whether the auth ticket is valid after the service call

  - **EndingIdentityState -** identity objects reported state after making the service calls

  - **EwsHandler -** value returned from exchange

  - **FEServer -** the exchange front end servicing the request

  - **HResult -** the result code

  - **HttpStatus -** Http status code returned from exchange

  - **IsSupportedAuthResponse -** whether the auth type is one we can use

  - **LastUpdateValueRegistry -** hash value retrieved from the registry

  - **LastUpdateValueRetrieved -** hash value returned from the service call

  - **MSDiagnostics -** value returned from exchange

  - **MsoHttpResult -** the enumerator value returned form the http API

  - **NeedRefresh –-** This is a true or false field indicating whether the add-in data was stale and we needed to update it.

  - **PrimaryUrl -** the main URL to make the service call to

  - **RequestId -** value returned from exchange

  - **RequestTryCount -** the number of times we attempted to make the service call

  - **RequestTryCount -** the number of times we tried to talk to exchange

  - **ResultChain -** the series of result code from each of the service call attempts

  - **StartingIdentityState -** identity objects reported state before making service calls

  - **TelemetryId -** a GUID representing a unique user whether we need to make other service calls

#### Office.Extensibility.Catalog.ExchangeGetManifests

Data regarding the success for failure of retrieving add-in manifests data for the Office 365 tenant admin assigned add-ins. Used for health metrics, charts, and analysis of customer problems.

The following fields are collected:

  - **CachedManifestsParsed** – the number of manifests found in the cache

  - **IsAllReturnedManifestsParsed** – whether all the manifests that were returned were able to be parsed

  - **ManifestsRequested** – the number of manifests needed

  - **ManifestsReturned** – the number of manifest returned form the server

  - **ManifestsToRetrieve** – the number of manifests to get form the server

  - **ReturnedManifestsParsed** – the number of manifests returned from the server that were successfully parsed

  - **TelemetryId** – a GUID representing a unique user

#### Office.Extensibility.UX.FEnsureLoadOsfDLL 

Tracks failure to load Osf.DLL. Detect DLL load failure that prevents feature from running.

The following fields are collected:

  - None

#### Office.Extensibility.UX.FEnsureLoadOsfUIDLL 

Tracks failure to load OsfUI.DLL. Detect DLL load failure that prevents feature from running.

The following fields are collected:

  - None

#### Office.Extensibility.UX.FEnsureOsfSharedDLLLoad 

Tracks failure to load OsfShared.DLL. Detect DLL load failure that prevents feature from running.

The following fields are collected:

  - None

#### Office.Extensibility.VBATelemetryComObjectInstantiated

Collects information about invocation of automation server or client in VBA solutions. Used to understand interaction between VBA and Com Objects.

The following fields are collected:

  - **ComObjectInstantiatedCount** – number of COM Object instantiations

  - **HashComObjectInstantiatedClsid** – hash of COM Object Class Identifier

  - **HashProjectName** – hash of the VBA project name

  - **TagId** – unique tag

#### Office.Extensibility.VBATelemetryDeclare 

Collects information about invocation of Win32 API’s in VBA solutions. Used to understand interaction between VBA and usage and to supplement security investigations.

The following fields are collected:

  - **DeclareCount** – number of declarations

  - **HashDeclare** – hash of the DLL name

  - **HashEntryPoint** – hash of the API Name

  - **HashProjectName** – hash of the VBA project name

  - **IsPtrSafe** – whether the declaration statement is compatible for different architecture

  - **TagId** – unique tag

#### Office.Outlook.Desktop.Add-ins.Add-inLoaded

Collects the success and failure of Outlook loading of an add-in. This data is actively monitored in order to ensure Outlook is correctly working with customer add-ins. This data is used to detect and investigate issues.

The following fields are collected:

  - **Standard HVA activity** with no custom payload

#### Office.Outlook.Mac.AddinAPIUsage

Collects success and failure of add-in execution in Outlook. This data is actively monitored to ensure Outlook is correctly working with add-ins. This data is used to detect and investigate issues.

The following fields are collected:

- **AccountType** - type of account associated with the add-in 

- **Cookie** - cookie used by add-in

- **DispId** - dispatch identifier 

- **EndTime** - time when add-in ended 

- **ExecutionTime** - time elapsed during execution of add-in 

- **Result** - result of using the add-in in Outlook 

- **StartTime** - time when add-in started


#### Office.Outlook.Mac.AddinEventAPIsUsage

Collects success or failure of add-in execution in Outlook. This data is actively monitored to ensure Outlook is correctly working with add-ins. This data is used to detect and investigate issues.

The following fields are collected:

- **AddinType** - type of add-in 

- **EventAction** - action performed by the add-in 

- **EventDispid** - dispatch identifier

- **EventResult** - result of the action performed by the add-in 

#### Office.Outlook.Mac.AddInInstallationFromInClientStore

Collects success or failure of add-in installation in Outlook. This data is actively monitored to ensure Outlook is correctly working with add-ins. This data is used to detect and investigate issues.

The following fields are collected:

- **AccountType** - type of account associated with add-in 

- **FailureReason** - reason add-in failed to install 

- **MarketplaceAssetId** - store add-in identifier 

- **Status** - status of add-in installation


#### Office.Programmability.Add-ins.InternalSetConnectEnterprise

Event generated when a COM Add-in is loaded on an enterprise device. 

The following fields are collected:

  - **Activity Result** - Success state of the connection

  - **Add-inconnectFlag** – current load behavior

  - **Add-inId** – the add-in Class Id

  - **Add-inTimeDateStamp** – the add-in timestamp from the DLL metadata

  - **IsBootInProgress** – whether the Office application is in the process of booting

#### Office.Visio.Visio.AddonLoad

Captures errors when a solution fails to load. Essential to debug addon load errors in Visio.

The following fields are collected:

  - **Data\_Load1Error:integer** - Error value during the load of Visio add-on

#### Office.Visio.Visio.AddonUsage

Captures errors when there is an error in solution functionality. Essential to debug addon errors in add-ons.

The following fields are collected:

  - **Data\_DocumentSessionLogID:string** - Document session identifier

  - **Data\_IsEnabled**:**bool** - true if solution is enabled

  - **Data\_TemplateID:string** - GUID of template in which solution was loaded. Logged as 0 for custom solution

  - **Data\_AddOnID**:**string** - GUID to identify addon loaded

  - **Data\_Error**:**integer** - Error Id

### *Security subtype*

Document, feature, and add-in error conditions that may compromise security, including product update readiness.

#### Office.Security.ActivationFilter.CLSIDActivated

Tracks when a specific Class Identifier (Flash, Silverlight etc.) is activated in Office. Used to track impact of blocking Flash, Silverlight and Shockwave controls on end users.

The following fields are collected:

  - **ActivationType** - Type of activation for the control

  - **Blocked** - was the control blocked by office

  - **CLSID** - class identifier of the control

  - **Count** - how many times was the control activated

#### Office.Security.ActivationFilter.FailedToRegister

Tracks an error condition in security mitigation that blocks activation of dangerous controls in Office.

Used to diagnose error conditions in security mitigation that could impact security of end users.

The following fields are collected:

  - None

#### Office.Security.ComSecurity.FileExtensionListFromService

Tracks if packager block extensions were read from config service or we used client default list. Used to ensure effectiveness of security mitigation that protects end users of Office.

The following fields are collected:

  - **RetrievedFromServiceStatus** - were we able to retrieve the list of file extensions to block if not then what was the error reason

#### Office.Security.ComSecurity.Load

Tracks when an OLE object is loaded in a document. Used to ensure effectiveness of security mitigation that protects end users of Office.

The following fields are collected:

  - **Clsid** - class identifier of the OLE control

  - **Count** - how many times the OLE control was loaded

  - **DocUrlHash** - a hash representing the document uniquely. (Note – no way to find out the actual details of the document from this. It is just a unique representation of the document.)

  - **IsCategorized** – was the OLE control categorized to load in office

  - **IsInsertable** – is the OLE control insertable or not

#### Office.Security.ComSecurity.ObjDetected

Tracks when an OLE object is detected in a document. Used to ensure effectiveness of security .mitigation that protects end users of Office.

The following fields are collected:

  - **Clsid** - class identifier of the OLE control

  - **Count** - how many times this OLE object was detected

  - **DocUrlHash** - a hash representing the document uniquely. (Note – no way to find out the actual details of the document from this. It is just a unique representation of the document.)

  - **IsCategorized** - is the OLE control categorized to load in office

  - **IsInsertable** - is the OLE control insertable or not

#### Office.Security.ComSecurity.PackagerActivation

Tracks the outcome of security mitigation that blocks dangerous extensions embedded in Office documents. Used to ensure effectiveness of security mitigation that protects end users of Office.

The following fields are collected:

  - **FromInternet** - was the document from internet

  - **PackagerSetting** - what was the current packager setting

  - **TrustedDocument** - was the document a trusted document

#### Office.Security.ComSecurity.PackagerActivationErrors

Tracks error conditions in security mitigation that blocks dangerous extensions embedded in Office documents. Used to ensure effectiveness of security mitigation that protects end users of Office.

The following fields are collected:

  - **Error** - error code

  - **Extension** - what was the file extension

  - **FromInternet** - was the document from internet

  - **LinkedDocument** - was it a linked document or not

  - **PackagerSetting** - what was the current packager setting

  - **TrustedDocument** - was the document trusted


#### Office.Security.Macro.InternetVBABlockEnabled

Tracks whether the Block Macro from Internet setting is enabled in a client. Assess use of security mitigation to protect against malicious macros.

The following fields are collected:

  - None

#### Office.Security.Macro.PolicyDigSigTrustedPublishers

Tracks if the macro was verified to be from a trusted publisher. Used to ensure effectiveness of security mitigation that protects end users of Office.

The following fields are collected:

  - **Policy** - is the policy set or not set or not available

#### Office.Security.Macro.Prompted

Tracks when a user is prompted to enable VBA Macros. Used to assess prevalence of VBA Macros and drive future security mitigations that restrict macro execution in response to security incidents.

The following fields are collected:

  - **PromptType** - what type of prompt was shown

  - **VBAMacroAntiVirusHash** - antivirus hash of the macro

  - **VBAMacroAntiVirusHRESULT** - result of the antivirus assessment

#### Office.Security.Macro.VBASecureRuntimeSessionEnableState

Tracks each AMSI runtime verification performed when a macro executes. Tracks effectiveness of the AMSI runtime verification of Macro execution and identify errors that could impact security of end users.

The following fields are collected:

  - **IsRegistry** - did admin set some override in registry

  - **State** - what is the state to for secure runtime

#### Office.Security.Macro.XL4Prompted

Tracks when a user is prompted to enable XL4 Macros. Used to assess prevalence of XL4 Macros in Excel to drive future security mitigations that block XL4 by default in response to security incidents that involve abusing XL4 macros.

The following fields are collected:

  - **PromptType** - what type of prompt was shown


#### Office.Security.OCX.UFIPrompt

Tracks when a security prompt is shown to the user when loading an ActiveX control that is marked Unsafe for Initialization. Used to track prevalence of UFI ActiveX controls in Office documents to drive mitigations (e.g. killbitting controls) in response to security incidents.

The following fields are collected:

  - **IsFromInternet** - is the document opened from internet

  - **IsSecureReaderMode** - is the document opened in secure reader

  - **OcxTrustCenterSettings** - what is the current ActiveX setting


#### Office.Security.SecureReaderHost.OpenInOSR

Tracks completion of an open in Protected View. Used to diagnose conditions that lead to failures when opening files in Protected View impacting security and productivity of customers.

The following fields are collected:

  - None

## Product and service usage data events

The following are the data subtypes in this category:

- [Application feature success](#application-feature-success-subtype)
- [Application status and boot](#application-status-and-boot-subtype)
- [Office accessibility configuration](#office-accessibility-configuration-subtype)
- [Privacy](#privacy-subtype)


### *Application feature success subtype*

Success of application functionality. Limited to opening and closing of the application and documents, file editing, and file sharing (collaboration).​


#### IpcCreateRepublishingLicense

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcCreateRepublishingLicense API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.StatusCode** - Status code of the returned result

#### IpcGetLicenseProperty

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcGetLicenseProperty API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.HttpCall** - Indicates if there is HTTP operation

- **RMS.LicensePropertyType** - license property type

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.StatusCode** - Status code of the returned result

#### IpcGetSerializedLicenseProperty

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcGetSerializedLicenseProperty API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey**- Logging service server Id

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.HttpCall** - Indicates if there is HTTP operation

- **RMS.LicensePropertyType** - License property type

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.StatusCode** - Status code of the returned result

#### IpcGetTemplateIssuerList

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcGetTemplateIssuerList API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.AuthCallbackProvided** - Indicate if provides the authentication callback as input of the API call or not

- **RMS.ConnectionInfo.ExtranetUrl** - extranet URL of connection info

- **RMS.ConnectionInfo.IntranetUrl** - intranet URL of connection info

- **RMS.ConnectionMode** - The connection mode between Rights Management Service client and server: online or offline

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.GuestTenant** - Guest tenant Id for the user

- **RMS.HomeTenant** - Home tenant Id for the user

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.Identity.ExtranetUrl** - The extranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server
 
- **RMS.Identity.IntranetUrl** - The intranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.Status** - The first time to get Rights Account Certificate from the server or renew the Rights Account Certificate 

- **RMS.Identity.Type** - The type of the user account such as windows account or live account

- **RMS.Identity.UserProvided** - Indicate if the user email address provided or not while getting new Rights Account Certificate from the server

- **RMS.IssuerId** - The Id of the Rights Management Service server which issues Rights Account Certificate 

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.RACType** - The type of Rights Accounts Certificate

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server

- **RMS.StatusCode** - Status code of the returned result

- **UserInfo.UserObjectId** - The user object Id

#### IpcGetTemplateList

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcGetTemplateList API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.AuthCallbackProvided** - Indicate if provides the authentication callback as input of the API call or not

- **RMS.ConnectionInfo.ExtranetUrl** - extranet URL of connection info

- **RMS.ConnectionInfo.IntranetUrl** - intranet URL of connection info

- **RMS.ConnectionMode** - The connection mode between Rights Management Service client and server: online or offline

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.GuestTenant** - Guest tenant Id for the user

- **RMS.HomeTenant** - Home tenant Id for the user

- **RMS.HttpCall** - indicate if there is http operation

- **RMS.Identity.ExtranetUrl** - The extranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server
 
- **RMS.Identity.IntranetUrl** - The intranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.Status** - The first time to get Rights Account Certificate from the server or renew the Rights Account Certificate 

- **RMS.Identity.Type** - The type of the user account such as windows account or live account

- **RMS.Identity.UserProvided** - Indicate if the user email address provided or not while getting new Rights Account Certificate from the server

- **RMS.IssuerId** - The Id of the Rights Management Service server which issues Rights Account Certificate 

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.RACType** - The type of Rights Accounts Certificate

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server

- **RMS.StatusCode** - Status code of the returned result

- **RMS.TemplatesCount** - The number of the templates

- **UserInfo.UserObjectId** - The user object Id

#### IpcpCreateLicenseFromScratch

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcpCreateLicenseFromScratch API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.GuestTenant** - Guest tenant Id for the user

- **RMS.HomeTenant** - Home tenant Id for the user

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.Identity.ExtranetUrl** - The extranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.IntranetUrl** - The intranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.UserProvided** - Indicate if the user email address provided or not while getting new Rights Account Certificate from the server

- **RMS.IssuerId** - The Id of the Rights Management Service server which issues Rights Account Certificate 

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.RACType** - The type of Rights Accounts Certificate

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server

- **RMS.StatusCode** - Status code of the returned result

- **RMS.TokenProvided** - Indicate if provides the token as input of the API call or not 

- **RMS.UserProvided** - Indicate if provides the consumer as input of the API call or not 

- **UserInfo.UserObjectId** - The user object Id 

#### IpcpCreateLicenseFromTemplate

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcpCreateLicenseFromTemplate API call is made. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.AuthCallbackProvided** - Indicate if provides the authentication callback as input of the API call or not

- **RMS.ConnectionMode** - The connection mode between Rights Management Service client and server: online or offline

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.HttpCall** - indicate if there is http operation

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.StatusCode** - Status code of the returned result

- **RMS.TokenProvided** - Indicate if provides the token as input of the API call or not 

- **RMS.UserProvided** - Indicate if provides the consumer as input of the API call or not 

#### IpcpGetTemplateListForUser

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcpGetTemplateListForUser API call is made. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.AuthCallbackProvided** - Indicate if provides the authentication callback as input of the API call or not

- **RMS.ConnectionInfo.ExtranetUrl** - extranet URL of connection info

- **RMS.ConnectionInfo.IntranetUrl** - intranet URL of connection info

- **RMS.ConnectionMode** - The connection mode between Rights Management Service client and server: online or offline

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.GuestTenant** - Guest tenant Id for the user

- **RMS.HomeTenant** - Home tenant Id for the user

- **RMS.HttpCall** - Indicates if there is HTTP operation

- **RMS.Identity.ExtranetUrl** - The extranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.IntranetUrl** - The intranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.Status** - The first time to get Rights Account Certificate from the server or renew the Rights Account Certificate 

- **RMS.Identity.Type** - The type of the user account such as windows account or live account

- **RMS.Identity.UserProvided** - Indicate if the user email address provided or not while getting new Rights Account Certificate from the server

- **RMS.IssuerId** - The Id of the Rights Management Service server which issues Rights Account Certificate 

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.RACType** - The type of Rights Accounts Certificate

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server

- **RMS.StatusCode** - Status code of the returned result

- **RMS.TemplatesCount** - The number of the templates

- **RMS.TokenProvided** - Indicate if provides the token as input of the API call or not 
	
- **RMS.UserProvided** - Indicate if provides the consumer as input of the API call or not 

- **UserInfo.UserObjectId** - The user object Id 

#### IpcpSerializeLicense

Collected when a user attempts to apply IRM protections on the doc. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcpSerializeLicense API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.AuthCallbackProvided** - Indicate if provides the authentication callback as input of the API call or not

- **RMS.ConnectionMode** - The connection mode between Rights Management Service client and server: online or offline

- **RMS.ContentId** - Content Id of the document

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.GuestTenant** - Guest tenant Id for the user

- **RMS.HomeTenant** - Home tenant Id for the user

- **RMS.HttpCall** - indicate if there is http operation

- **RMS.Identity.ExtranetUrl** - The extranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.IntranetUrl** - The intranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.Status** - The first time to get Rights Account Certificate from the server or renew the Rights Account Certificate 

- **RMS.Identity.Type** - The type of the user account such as windows account or live account

- **RMS.Identity.UserProvided** - Indicate if the user email address provided or not while getting new Rights Account Certificate from the server

- **RMS.IssuerId** - The Id of the Rights Management Service server which issues Rights Account Certificate 

- **RMS.KeyHandle** - The memory address of key handle

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.RACType** - The type of Rights Accounts Certificate

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server

- **RMS.StatusCode** - Status code of the returned result

- **RMS.TokenProvided** - Indicate if provides the token as input of the API call or not 

- **RMS.UserProvided** - Indicate if provides the consumer as input of the API call or not 

- **UserInfo.UserObjectId** - The user object Id 

#### IpcSetLicenseProperty

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcSetLicenseProperty API call is made. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call 

- **RMS.HttpCall** - indicate if there is http operation

- **RMS.LicensePropertyType** - license property type

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.StatusCode** - Scenario Id defined by the API


#### Office.AppCompat.AppCompat.AgentUpload

Generated on client startup when end user has enabled Office Telemetry Dashboard.  It collects information on when the Office Telemetry Agent has uploaded data to the share folder. The primary use of this event is to monitor the health of the Office Telemetry agent and the secondary use of the event is to estimate usage of the Office Telemetry Dashboard.

The following fields are collected:

- **UploadTime** - the timestamp of the last successful upload performed by the Telemetry Agent.


#### Office.AppCompat.AppCompat.AgentScanAndUpload

Only collected when end user has enabled Office Telemetry Dashboard. It collects information on when the Office Telemetry Agent is executed.  This is only collected when Office Telemetry Dashboard is enabled and is used to determine the health of Office Telemetry agent.

The following fields are collected:

  - **Data.AgentExit** - Timestamp of when the Telemetry agent exits successfully

  - **Data.AgentScan** - Timestamp of when the Telemetry agent completed a scan successfully

  - **Data.AgentUpload** - Timestamp of when the Telemetry agent completes the upload successfully

#### Office.AppCompat.AppCompat.TelemetryDashboardResiliencyCrashLog

Only collected when Office Telemetry Dashboard has been enabled by end user (most likely an admin). It collects the occurrence of Office Add-ins and documents crashes. This is only collected when user has enabled Office Telemetry Dashboard and is used to determine if there is an increased occurrence of add-in or document crashes.

The following fields are collected:

  - **Data.CollectionTime** - Timestamp of when a crash event was logged

#### Office_Apple_ActivatePerpetual

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of the perpetual activation flow as well as investigating causes of failures by reviewing the FailedAt values.

The following fields are collected:

- **Data_FailedAt** - We collect a string representing where in the activate perpetual license flow we failed.

#### Office_Apple_ActivateSubscription

This event is collected for Office applications running under Apple platforms. We collect information related to the migration from the legacy licensing code stack to the vNext licensing code tack. This is used to monitor the health of the subscription activation flow as well as tracking if this is a migration to licensing vNext and if the primary identity was used.

The following fields are collected:

- **Data_ActivatingPrimaryIdentity** - A true/false value denoting if the primary identity was used. 

- **Data_NULSubscriptionLicensed** - A true/false value denoting the state of subcription

#### Office_Apple_CISAuthTicketWithIdentity

This event is collected for Office applications running under Apple platforms. The event is used for capturing auth token generation failures during InAppPurchase on the Mac (the event logs the error code received).  This event is used for detecting and helping troubleshoot auth token generation failures

The following fields are collected:

- **Data_EmptyAuthToken** - We collect a string representing where in the activate perpetual license flow we failed.

- **Data_TicketAuthError** - Error code which indicates the cause of failure

- **Data_ValidIdentity** - If the client has a valid identity

#### Office_Apple_InAppAssociationActivity

This event is collected for Office applications running under Apple platforms. 
We collect information related to product association after an in-app purchase. We log which subscription SKU we are associating.  This is used to monitor the health of the in-app purchase product associations.

The following fields are collected:

- **Data_ProductID** - The subscription SKU we are trying to associate the product to.

#### Office_Apple_InAppPurchaseActivity

This event is collected for Office applications running under Apple platforms. 

We collect information related to product purchases on the AppStore. We track the result of the purchase (Failure, success, payment issue, etc.), the type of the purchase request (restore, purchase) and the SKU/product being purchased (Office 365 Home, etc.).  This data is used for monitoring the health of the in-app purchase flows.

The following fields are collected:

- **Data_ Data_PurchaseResult** - The result of the purchase operation

- **Data_ProductID** - The product being purchased

- **Data_PurchaseRequestType** - The type of purchase request

#### Office_Apple_InTune

This event is collected for Office applications running under Apple platforms. We collect whether the current session is Intune-managed. This is used to pivot/filter on Intune managed sessions and allows us to investigate potential issues related to Office being run as an Intune-managed application.

The following fields are collected:

- **Data_EventID** - We collect a string representing a code that indicates whether the session is intune-managed.

#### Office_Apple_Licensing_Mac_LicensingState

This event is collected for Office applications running under Apple platforms. The event captures the current state of the license for a session in a machine (OLS license id, SKU being used, grace-period or not, RFM, etc.). The data collected is used for detecting errors and investigating causes of failures. 

The following fields are collected:

- **Data_DidRunPreview** - A string indicating if this session is run under preview

- **Data_LicensingACID** - A string representing a licensing system internal identifier

- **Data_LicensingType** - A string representing the type of license

- **Data_OLSLicenseId** - A string representing a license identifier

- **Data_State** - A string representing the current state of the license

#### Office.ConnectDevice.Activity.Start

Allows us to know if a connection to a device or application was successful.  Used for feature health and monitoring. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Datasource_Type** - Serial device, or App Service information

- **DataSource_Name** - Name of connected data source

- **Activity_Name** = Name of the activity “ConnectDevice”

- **Activity_CV** = ID to correlate the events across the connection session

- **Activity_StartStopType** = Start

- **Activity_DateTimeTicks** = Data Time for the activity
 
#### Office.ConnectDevice.Activity.Stop

Allows us to know if a connection to a device or application was successful. Used for feature health and monitoring This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Datasource_Type** - Serial device, or App Service information

- **DataSource_Name** - Name of connected data source

- **Activity_Name** - Name of the activity “ConnectDevice”

- **Activity_CV** - ID to correlate the events across the connection session

- **Activity_StartStopType** - Stop

- **Activity_DateTimeTicks** - Data Time for the activity

#### Office_Docs_Apple_DocsUXiOSSaveAsThroughFileMenu 

This event is collected for Office applications running under Apple platforms. The event records when a “Save as” operation takes place and is used to understand and prioritize user-experiences based on file operation information such as location categories.  A “Save as” operation occurs whenever a user creates a new file and saves it for the first time or saves a copy of an existing file to a new location.

The following fields are collected:

- **Data_OriginServiceType** - An abstract categorization of the original location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_ServiceType** - An abstract categorization of the new location of a file after the save is completed like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

#### Office_Docs_Apple_DocsUXMacAtMentionInsertedAtMention 

This event is collected for Office applications running under Apple platforms. This event records when a user “@” mentions another user and is used to understand and prioritize user-experiences based on how users collaborate with other users.

The following fields are collected:

- **Data_CharactersTyped** - A numerical value that indicates the total number of characters typed in the “@” mention text.

#### Office_Docs_Apple_DocsUXMacODSPSharingWebViewSharingCompleted 

This event is collected for Office applications running under Apple platforms. This event records when a user chooses to share a cloud document using the OneDrive sharing experience and is used to better understand and prioritize user-experiences based on sharing documents.

The following fields are collected:

- **Data_ShareType** - A hardcoded string that indicates what kind of share operation was completed including but not limited to “Copy Link”, “More apps”, “Teams”.

- **Data_ShareWebViewMode** - A hardcoded string that indicates what kind of share mode was active when the share was completed including but not limited to “ManageAccess”, “AtMentions”, “Share”.

#### Office_DocsUI_Collaboration_CoauthorGalleryRowTapped 

This event is collected for Office applications running under Apple platforms. This event records when a user selects to look at the list of current co-authors.  This data is used to better understand and prioritize user-experiences relating to co-authoring a document at the same time.

The following fields are collected:

- **Data_CoauthorCount** - A numerical value that represents the total number of people who are currently editing the same document as the user.

#### Office_DocsUI_Collaboration_CollabCornerPeopleGalleryCoauthorsUpdated 

This event is collected for Office applications running under Apple platforms. The event records when the number of active co-authors in a cloud document changes.  This data is used to better understand and prioritize user-experiences relating to co-authoring a document at the same time.

The following fields are collected:

- **Data_CoauthorsJoined** - The number of co-authors that joined the document.

- **Data_CoauthorsLeft** - The number of co-authors that left the document.

- **Data_NewCoauthorCount** - The new count of active co-authors in the document. 

- **Data_OldCoauthorCount** - The previous count of active co-authors before the update.

- **Data_ServiceType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

#### Office_DocsUI_DocStage_DocStageCreateNewFromTemplate 

This event is collected for Office applications running under Apple platforms. The event records when a new file is created from the “New from template” experience and is used to better understand and prioritize user-experiences based on document creation information.

The following fields are collected:

- **Data_InHomeTab** - A Boolean value that indicate whether the new file from template was created from the Home tab of the file new experience.

- **Data_InSearch** - A Boolean that indicates whether the file was created when the user was searching for a template.

- **Data_IsHomeTabEnabled** - A Boolean value that indicates if the Home tab is currently available to the user.

- **Data_IsRecommendedEnabled** - A Boolean value that indicates if the “Recommended” experience is currently available to the user.

- **Data_TemplateIndex** - The numerical index of the template file as it is displayed visually to the user.

- **Data_TemplateType** - A classification to help distinguish the type of template like, but not limited to, “Online” templates, “Online search” templates, “Local” templates.

#### Office_DocsUI_DocStage_RecommendedOpen

This event is collected for Office applications running under Apple platforms. The event records when a file-open operation takes place from the recommended files section of the document gallery and is used to understand and prioritize user-experiences based on file open operation information.

The following fields are collected:

- **Data_Success** - A Boolean value to indicate whether the operation succeeded.

#### Office_DocsUI_FileOperations_DocsUIFileOpenMacRequired

This event is collected for Office applications running under Apple platforms. The event records when a file open operation takes place and is used to understand and prioritize user-experiences based on file open operation information such as location categories “ServiceType” and the first four characters of the extension.

The following fields are collected:

- **Data_Ext** - The file extension limited to the first four characters of the extension or less.

- **Data_ServiceType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc.

#### Office_DocsUI_FileOperations_OpenFileWithReason 

This event is collected for Office applications running under Apple platforms. The event records when a file open operation takes place and is used to understand and prioritize user-experiences based on file open operation information such as location categories “ServiceType” and from where within Application the user requested to open a file.

The following fields are collected:

- **Data_IsCandidateDropboxFile** - This is a Boolean value that is logged if by inspecting the path of the file we think it might be from a folder that is sync’d by Drop Box.

- **Data_IsSignedIn** - Whether or not a user is signed in when the file is saved.

- **Data_OpenReason** - The open reason is a numerical value that indicates from where within the application a user opened a file.

- **Data_ServiceType** - An abstract numerical categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

#### Office_DocsUI_FileOperations_SaveToURL

This event is collected for Office applications running under Apple platforms. The event records when a “save as” operation takes place and is used to understand and prioritize user-experiences based on file operation information such as location categories and the first four characters of the extension.  A “save as” operation occurs whenever a user creates a new file and saves it for the first time or saves a copy of an existing file to a new location.

The following fields are collected:

- **Data_FileExtension** - The first four characters of the new file’s extension.

- **Data_IsNewFileCreation** - Indicates if the save operation is for a new file or a copy of an existing file.

- **Data_IsSignedIn** - Whether or not a user is signed in when the file is saved.

- **Data_SaveErrorCode** - A numerical value that is set if there is an error to help identify the kind of error.

- **Data_SaveErrorDomain** - Specifies the domain of the SaveErrorCode as defined by Apple SaveErrorDomains “are arbitrary strings used to differentiate groups of codes”.

- **Data_SaveLocation** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_SaveOperationType** - A numerical value defined by Apple’s NSSaveOperationType group of values.

#### Office_DocsUI_SharingUI_CloudUpsellShown 

This event is collected for Office applications running under Apple platforms. This event records when a user goes through the document upsell to cloud flow.  This data is used to better understand and prioritize user-experiences relating to moving documents to cloud locations.

The following fields are collected:

- **Data_FileStyle** - A numerical value that indicates from what scenario the upsell experience was shown like from an autosave toggle or a share button.

- **Data_FileType** - The first four characters of the current file’s extension.

- **Data_InDocStage** - A Boolean that indicates if the upsell experience is shown from the Document Gallery or from within a document window.

- **Data_IsDocumentOpened** - A Boolean that indicates if the current document for which the upsell experience is being shown is also open.

- **Data_IsDraft** - A Boolean that indicates if the current file has ever been saved.

- **Data_IsSheetModal** - A Boolean that indicates if the upsell experience was presented modally or not.

#### Office_DocsUI_SharingUI_CloudUpsellUpload 

This event is collected for Office applications running under Apple platforms. This event records when a user chooses to upload a new or local file to the cloud and the result of that operation.  This data is used to better understand and prioritize user-experiences relating to moving documents to cloud locations.

The following fields are collected:

- **Data_FileStyle** - A numerical value that indicates from what scenario the upsell experience was shown like an autosave toggle or a share button.

- **Data_FileType** - The first four characters of the current file’s extension.

- **Data_InDocStage** - A Boolean that indicates if the upsell experience is shown from the Document Gallery or from within a document window.

- **Data_IsDefaultServiceLocation** - A Boolean value that indicates if the selected location to upload the document to is the default location.

- **Data_IsDocumentOpened** - A Boolean that indicates if the current document for which the upsell experience is being shown is also open.

- **Data_IsDraft** - A Boolean that indicates if the current file has ever been saved.

- **Data_IsSheetModal** - A Boolean that indicates if the upsell experience was presented modally or not.

- **Data_LocationServiceType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_UploadAction** - A hard coded string that indicates whether the upload was a move or a copy operation.

- **Data_UploadResult** - A hard coded string that indicates the result of the attempt to upload including but not limited to ‘’Success”, “UserCancelledUpload”, and “PreAuthFailed”.

#### Office_DocsUI_SharingUI_CopyLinkOperation

This event is collected for Office applications running under Apple platforms. This event records when a user chooses to share a document by generating a link to a cloud document and is used to better understand and prioritize user-experiences based on sharing documents.

The following fields are collected:

- **Data_ ServiceType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_LinkType** - A hard coded string that describes the kind of invite operation performed like “ViewOnly” and “ViewAndEdit”.

- **Data_ShareScenario** - A hard-coded string description of where within the application’s user interface the file is being shared from including but not limited to, “FileMenu”, “OpenTabShareActionMenu”, “RecentTabShareActionMenu”.

#### Office_DocsUI_SharingUI_DocsUIOneDriveShare 

This event is collected for Office applications running under Apple platforms. This event records when a user chooses to share a cloud document using the OneDrive sharing experience and is used to better understand and prioritize user-experiences based on sharing documents.

The following fields are collected:

- **Data_ODSPShareWebviewShareError** - If the sharing experience experiences an error this is a numerical value to help identify the reason for the failure.

- **Data_ODSPShareWebviewShareGrantAccessResult** - A Boolean value that when true indicates that a lightweight sharing operation successfully completed.

- **Data_ODSPShareWebviewShareSuccessType** - When a share operation successfully completes this is a numerical value used to determine what kind of sharing operation was completed.

- **Data_WebViewInfoResult** - If the user interface fails to load this is a numerical value to help identify the reason for the failure. 

- **Data_WebViewLoadTimeInMs** - A numerical value that records the amount of time it took for the web user interface to load.

#### Office_DocsUI_SharingUI_InvitePeople 

This event is collected for Office applications running under Apple platforms. This event records when a user chooses to invite people to a cloud document and is used to better understand and prioritize user-experiences based on sharing documents.

The following fields are collected:

- **Data_ ServiceType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_InviteeCount** - The total number of contacts invited to a document in one invite action.

- **Data_LinkType** - A hard-coded string that describes the kind of invite operation performed like “ViewOnly” and “ViewAndEdit”.

- **Data_MessageLength** - A numerical count of the total number of characters sent in the invite message.

- **Data_ShareScenario** - A hard coded string description of where within the application’s user interface the file is being shared from including but not limited to, “FileMenu”, “OpenTabShareActionMenu”, “RecentTabShareActionMenu”.

#### Office_DocsUI_SharingUI_SendACopyOperation

This event is collected for Office applications running under Apple platforms. The event records when a user chooses to send a copy of a document and is used to better understand and prioritize user-experiences based on sharing documents.

The following fields are collected:

- **Data_IsHomeTabEnabled** - A Boolean value that indicates if the Home tab is currently available to the user.

- **Data_IsRecommendedEnabled** - A Boolean value that indicates if the “Recommended” experience is currently available to the user.

- **Data_OperationType** - A numerical value to indicate what kind of send a copy operation is taking place like sending a copy in an email or sending a copy through Apple’s share control.

- **Data_ServiceType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_ShareFileType** - A hard coded string description of what type of object is being shared including but not limited to, “Document”, “PDF”, “Picture”.

- **Data_ShareScenario** - A hard coded string description of where within the application’s user interface the file is being shared from including but not limited to, “FileMenu”, “OpenTabShareActionMenu”, “RecentTabShareActionMenu”.

- **Data_SharingService** - A Boolean that indicates whether the file was created when the user was searching for a template.

#### Office_DocsUI_SharingUI_UpsellShare 

This event is collected for Office applications running under Apple platforms. This event records when a user goes through the document upsell to cloud flow when trying to share a document.  This data is used to better understand and prioritize user experiences relating to moving documents to cloud locations.

The following fields are collected:

- **Data_FileOperationResult** - A numerical value to indicate whether the operation succeeded.

- **Data_HostedFromDocStage** - A Boolean to indicate if a user is going through the upsell to cloud flow from the DocStage experience or from an open document.

- **Data_isLocalCopyOn** - A Boolean to indicate if the use chose to keep a local copy of the document being uploaded to a cloud location or move the existing document to a cloud location.

- **Data_NewFileType** - An abstract categorization of the location of the new location of the file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_OriginalFileType** - An abstract categorization of the location of a file like “SharePoint”, “OneDrive”, “Local”, “WOPI”, etc., and explicitly not the actual location of the file.

- **Data_UploadButtonPressed** - A Boolean to indicate if the user chose to upload the current document to a cloud location.

- **Data_UploadError** - A numerical value that indicates the kind of error that occurred if an upload operation fails.

- **Data_UpsellAppearsFromDelegate** - A Boolean value to indicate if the view was shown from the share menu.

#### Office.Extensibility.Catalog.ExchangeProcessEntitlement

Data regarding the processing of an individual entitlement of and Office 365 tenant admin assigned add-in.

Used in charting (requested by team management) of customer success and analysis of customer problems.

The following fields are collected:

  - **AppVersion** – the version of the add-in host application

  - **SolutionId** – a GUID representing a unique add-in

  - **TelemetryId** – a GUID representing a unique user

#### Office.Extensibility.Catalog.ExchangeProcessManifest

Data regarding the processing of an individual manifest for an O365 tenant admin assigned add-in. Used in analysis of customer problems and charting of customer success.
 
The following fields are collected:

- **AppVersion** - version of the app

- **IsAllReturnedManifestsParsed** - bool indicating we parsed all returned manifests

- **IsAppCommand** - bool indicating if this is an app command app 

- **ReturnedManifestsParsed** - count of the parsed manifests

- **SolutionId** - ID of the solution

- **TelemetryId** - telemetry ID based on the signed in identity

#### Office.Extensibility.ODPAppCommandsRibbonClick

Collects whether clicking the custom add-in control succeeded or not. Used to detect issues in user interaction with add-in controls.
 
The following fields are collected:

- **CommandActionType** - type of the add-in command

- **CommandLabel** - label of the command clicked

- **SolutionId** - ID of the solution

#### Office.FileIO.CSI.CCachedFileCsiLoadFileBasic

Allows us to know if a file successfully opened from the FIO Layer. Used for feature health and monitoring.

The following fields are collected:

  - **Activity.Group -** tag that allows a set of monitoring events to be grouped to manage overall success

  - **Activity.IsHVA -** flag to indicate that event is critical to user success

  - **Data.AsyncOpen -** flag to indicate the open had content that arrived after the main body was opened

  - **Data.CacheFileId -** connects to Office Document Cache telemetry to enable impact analysis of cache issues on the user experience
 
  - **Data.CFREnabled** - Indicates that CacheFileRuntime is enabled for the session.

  - **Data.CFRFailure** - Indicated that CacheFileRuntime ran into error.
  
  - **Data.CoauthStatus -** reports collaborative status of the document on Open

  - **Data.CountOfMultiRoundTripsDownload -** Count of round trips to the server used to troubleshoot performance and network issues

  - **Data.CountOfMultiRoundTripsUpload -** Count of round trips to the server used to troubleshoot performance and network issues

  - **Data.DialogId -** Set if a UI dialog was displayed during Open, indicating a that a warning message was displayed to the user

  - **Data.DidFallbackToDAV -** Set if the document was opened using an older file transfer protocol

  - **Data.Doc.AccessMode -** Document is read only/editable

  - **Data.Doc.AssistedReadingReasons -** Set if the document has electronic data protection in place

  - **Data.Doc.AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data.Doc.ChunkingType -** Units used for incremental document open

  - **Data.Doc.EdpState -** Electronic Data Protection setting for the document

  - **Data.Doc.Ext -** Document extension (docx/xlsb/pptx, etc.)

  - **Data.Doc.Extension -** Obsolete

  - **Data.Doc.FileFormat -** File format protocol version

  - **Data.Doc.Fqdn -** OneDrive or SharePoint Online Domain Name

  - **Data.Doc.FqdnHash -** One-way hash of customer identifiable domain name

  - **Data.Doc.IdentityTelemetryId -** A one-way hash of the user identity used to perform the open

  - **Data.Doc.IdentityUniqueId -** Obsolete

  - **Data.Doc.InitializationScenario -** Records how the document was opened

  - **Data.Doc.IOFlags -** Reports on the cached flags used to set request options

  - **Data.Doc.IrmRights -** Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

  - **Data.Doc.IsCloudCollabEnabled -** Flag indicating that the service supports Cloud Collaboration

  - **Data.Doc.IsIncrementalOpen -** Flag indicating that the document has been incrementally opened

  - **Data.Doc.IsOcsSupported -** Flag indicating that the document is supported in the collaboration service

  - **Data.Doc.IsOpeningOfflineCopy -** Flag indicating that the offline copy of a document was opened

  - **Data.Doc.IsSyncBacked -** Flag indicating that an auto synced copy of the document exists on the computer

  - **Data.Doc.Location -** Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

  - **Data.Doc.LocationDetails -** Indicates which Known Folder provided a locally stored document

  - **Data.Doc.NumberCoAuthors -** Count of the number of fellow users in a collaborative editing session

  - **Data.Doc.PasswordFlags -** Indicates read or read/write password flags set

  - **Data.Doc.ReadOnlyReasons -** Reasons why the document was opened read only

  - **Data.Doc.ResourceIdHash -** An anonymized document identifier used to diagnose problems

  - **Data.Doc.ServerDocId -** An immutable anonymized document identifier used to diagnose problems

  - **Data.Doc.ServerProtocol -** the protocol version used to communicate with the service

  - **Data.Doc.ServerType -** the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

  - **Data.Doc.ServerVersion -** the server version offering the service

  - **Data.Doc.SessionId -** Identifies a specific document edit session within the full session

  - **Data.Doc.SharePointServiceContext -** Diagnostic information from SharePoint Online requests

  - **Data.Doc.SizeInBytes -** Indicator of document size

  - **Data.Doc.SpecialChars -** Indicator of special chars in the document's URL or Path

  - **Data.Doc.StorageProviderId -** Obsolete

  - **Data.Doc.StreamAvailability -** Indicator if document stream is available/disabled

  - **Data.Doc.SyncBackedType -** Indicator as to the type of document (local or service based)

  - **Data.Doc.UrlHash -** One-way hash to create a naïve document identifier

  - **Data.Doc.UsedWrsDataOnOpen -** Diagnostic indicator for incremental document open

  - **Data.Doc.WopiServiceId -** Contains unique identifier of WOPI service provider

  - **Data.DocumentLoadEndpoint -** obsolete/redundant duplicate of (Data.Doc.Location and Data.Doc.IsSyncbacked)

  - **Data.DocumentSizeInBytes -** Obsolete/redundant supplanted by Data.Doc. SizeInBytes

  - **Data.DocumentSizeOnDisk -** Obsolete

  - **Data.DoesBaseHaveContentOnOpen -** Change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.DoesWorkingBranchHaveExcludedDataOnOpen -** Change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.DownloadFragmentSize -** Size of data sent in a sub request for diagnosing network issues

  - **Data.DsmcStartedTooEarly -** Indicates an error starting a collaborative edit session

  - **Data.EditorsCount -** A count of other collaborators editing the document

  - **Data.ExcludedDataThresholdInBytes -** File size required for Asynch open to be used

  - **Data.FileIOResult.Code -** Cache of last Open return code from protocol layer

  - **Data.FileIOResult.Success -** Cache of last Open success indicator from protocol layer

  - **Data.FileIOResult.Tag -** Cache of last Open error tag from protocol layer

  - **Data.FileIOResult.Type -** Cache of last Open error type from protocol layer

  - **Data.FqdnHash -** Obsolete, replaced by Data\_Doc\_FqdnHash

  - **Data.FullIError -** Cache of all Open error codes from the protocol layer

  - **Data.FullyQualifiedDomainName -** Obsolete, replaced by Data\_Doc\_Fqdn

  - **Data.Input.FileOpenState -** State requested by app (Read/ReadWrite etc.)

  - **Data.Input.OpenAsync -** Async open requested by app

  - **Data.Input.OpenOfflineCopy -** Open from offline copy requested by add

  - **Data.IOFlags -** Obsolete

  - **Data.IsBaseBranchEmptyOnOpen -** Change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.IsCachedHistoricalVersion -** Cache contains an older version of the document

  - **Data.IsDocEnterpriseProtected -** Document has been protected by encryption (Electronic Document Protection / EDP)

  - **Data.IsDocInODC -** Document has been opened before and is already in the cache

  - **Data.IsMapUnMapCase -** Part of state of cached file

  - **Data.IsMapUnMapCase.End -** Part of state of cached file

  - **Data.IsOfficeHydrationInProgress -** The document is being restored from offline storage by Windows

  - **Data.isOfficeHydrationRequired -** The document is currently in offline storage

  - **Data.isOpenFromCollab -** The latest copy of the document was retrieved from the shared collaboration service

  - **Data.isPendingNameExist -** Document rename is in progress

  - **Data.IsStubFile -** The document hasn’t been saved to the cloud service yet

  - **Data.IsSyncBackedStateDifferentThanOnLastOpen -** the document state has changed, changes may have arrived while the document wasn’t open

  - **Data.isTaskCanceledAfterOpenComplete -** Obsolete

  - **Data.IsWorkingBranchAvailableOnOpen -** Change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.LicenseStatus** - Diagnostic product license status, used to validate that appropriate product features are enabled for the user’s license type 

  - **Data.LicenseType -** Indicates state of license (free/paid/trial etc.)

  - **Data.Location -** Indicates storage media type/location (USB, Cloud, etc.)

  - **Data.LockRequestDocMode -** Indicates if the document is available to others

  - **Data.MyDeferredValue -** Obsolete

  - **Data.Network.BytesReceived -** Obsolete

  - **Data.Network.BytesSent -** Obsolete

  - **Data.Network.ConnectionsCreated -** Obsolete

  - **Data.Network.ConnectionsEnded -** Obsolete

  - **Data.OcsDisableReasons -** Reason why the shared collaboration service wasn’t available for the document

  - **Data.OcsHostOnOpen -** Flag indicating that control will switch to the shared collaboration service during Open

  - **Data.OpeningOfflineCopy -** Flag indicating that the local copy of the document will be opened

  - **Data.Partition -** Obsolete

  - **Data.RequestTime -** Obsolete

  - **Data.ResourceIdHash -** Obsolete

  - **Data.ResumedIncrementalOpen -** Obsolete

  - **Data.RTCEnabled -** the fast change distribution protocol has started

  - **Data.SaveOnOpen -** unsaved changes in the local document were saved to the service during Open

  - **Data.ServerProtocol -** Obsolete, replaced by Data\_Doc\_ServerProtocol

  - **Data.ServerType -** Obsolete, replaced by Data\_Doc\_ServerType

  - **Data.ServerVersion -** Obsolete, replaced by Data\_Doc\_ServerVersion

  - **Data.ServiceId -** Obsolete, replaced by Data\_Doc\_WopiServiceId

  - **Data.SessionId -** Obsolete

  - **Data.ShouldSwitchToServerOnly -** the local copy of the document cannot be used, and the server version must be used

  - **Data.SpecialChars -** Obsolete

  - **Data.StopwatchDuration -** Obsolete

  - **Data.SyncBackedFileTelemetrySessionId -** Obsolete

  - **Data.SyncElapsedTime -** Obsolete

  - **Data.SyncRequestId -** Obsolete

  - **Data.TestProperty -** Obsolete

  - **Data.TransitionToHostOnOpen -** flag indicating that the session will connect to the service hosting the document

  - **Data.TransitionToHostOnOpenResult -** status of the transition to the host service

  - **Data.UseCachedNetworkConnection -** flag to indicate if a connection was reused or a new connection created

  - **Data.UseClientIdAsSchemaLockId -** flag to control how documents are locked in the service

  - **Data.VersionType** - Indicate which version type the current open operation is.

  - **Data.WopiServiceId -** Obsolete, replaced by Data\_Doc\_WopiServiceId

#### Office.FileIO.CSI.CCachedFileCsiSaveFileBasic

Allows us to know if a file was successfully saved from the FIO Layer. Used for Feature Health and monitoring.

The following fields are collected:

  - **Activity.Group -** tag that allows a set of monitoring events to be grouped to manage overall success

  - **Activity.IsHVA -** flag to indicate that event is critical to user success

  - **Data.AsyncOpen -** flag to indicate that the document was opened with content that arrived after the main body was opened

  - **Data.BaseDownloadTriggered -** Change tracking diagnostic indicating that the base version of the document was requested

  - **Data.BlockAutoUploadReasons -** Reason codes for blocked upload state (e.g. Autosave is turned off, the document is transitioning)

  - **Data.BlockUploadDueToFailedSaveAsOverExisting -** Upload is blocked as it would fail if retried

  - **Data.CacheFileId -** connects to Office Document Cache telemetry to enable impact analysis of cache issues on the user experience

  - **Data.ChartType -** Obsolete

  - **Data.CoAuthStatus -** reports collaborative status of the document on Save

  - **Data.CoauthUpdatesContext -** reports context (Merge/Incremental Open)

  - **Data.CountOfMultiRoundTripsDownload -** Count of round trips to the server used to troubleshoot performance and network issues

  - **Data.CountOfMultiRoundTripsUpload -** Count of round trips to the server used to troubleshoot performance and network issues
  
  - **Data.CFREnabled** - Indicates that CacheFileRuntime is enabled for the session.

  - **Data.CFRFailure** - Indicated that CacheFileRuntime ran into error.

  - **Data.DialogChoice -** Records choice made in any error dialogs

  - **Data.DialogId -** Records the DialogId of any error dialogs that display during save

  - **Data.Dmc.IsOcsSupported -** Obsolete

  - **Data.Doc.AccessMode -** Document is read only

  - **Data.Doc.AssistedReadingReasons -** Set if the document has electronic data protection in place

  - **Data.Doc.AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data.Doc.ChunkingType -** Units used for incremental document open

  - **Data.Doc.EdpState -** Electronic Data Protection setting for the document

  - **Data.Doc.Ext -** Document extension (docx/xlsm/pptx etc.)

  - **Data.Doc.Extension -** Obsolete

  - **Data.Doc.FileFormat -** File format protocol version

  - **Data.Doc.Fqdn -** OneDrive or SharePoint Online Domain name

  - **Data.Doc.FqdnHash -** One-way hash of the customer identifiable domain name

  - **Data.Doc.FqdnHasi -** Obsolete

  - **Data.Doc.IdentityTelemetryId -** A one-way hash of the user identity used to perform the save

  - **Data.Doc.IdentityUniqueId -** Obsolete

  - **Data.Doc.IKFlags -** Obsolete

  - **Data.Doc.InitializationScenario -** Records how the document was opened

  - **Data.Doc.IOFlags -** Reports on the cached flags used to set request options

  - **Data.Doc.IrmRights -** Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

  - **Data.Doc.IsCloudCollabEnabled -** Flag indicating that the application supports Cloud Collaboration

  - **Data.Doc.IsIncrementalOpen -** Flag indicating that the document was opened incrementally

  - **Data.Doc.IsOcsSupported -** Flag indicating that the document supports Cloud Collaboration

  - **Data.Doc.IsOpeningOfflineCopy -** Flag indicating that the offline copy of a document was opened

  - **Data.Doc.IsSyncBacked -** Flag indicating that an auto synced copy of the document exists on the computer

  - **Data.Doc.Location -** Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

  - **Data.Doc.LocationDetails -** Indicates which Known Folder provided a locally stored document

  - **Data.Doc.NumberCoAuthors -** Count of the number of fellow users in a collaborative editing session

  - **Data.Doc.PasswordFlags -** Indicates read or read/write password flags set

  - **Data.Doc.ReadOnlyReasons -** Reasons why the document was opened read only

  - **Data.Doc.ResourceIdHash -** An anonymized document identifier used to diagnose problems

  - **Data.Doc.ServerDocId -** An immutable anonymized document identifier used to diagnose problems

  - **Data.Doc.ServerProtocol -** the protocol version used to communicate with the service

  - **Data.Doc.ServerType -** the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

  - **Data.Doc.ServerVersion -** the server version offering the service

  - **Data.Doc.SessionId -** Identifies a specific document edit session within the full session

  - **Data.Doc.SharePointServiceContext -** Diagnostic information from SharePoint Online requests

  - **Data.Doc.SizeInBytes -** Indicator of document size

  - **Data.Doc.SpecialChars -** Indicator of special chars in the document’s URL or Path

  - **Data.Doc.StorageProviderId -** Obsolete

  - **Data.Doc.StreamAvailability -** Indicator if document stream is available/disabled

  - **Data.Doc.SussionId -** Obsolete

  - **Data.Doc.SyncBackedType -** Indicator as to the type of document (local or service based)

  - **Data.Doc.UrlHash -** One-way hash to create a naïve document identifier

  - **Data.Doc.UsedWrsDataOnOpen -** Diagnostic indicator for incremental document open

  - **Data.Doc.WopiServiceId -** Contains unique identifier of WOPI service provider

  - **Data.DocnReadOnlyReasons -** Obsolete

  - **Data.DocumentSaveEndpoint -** Obsolete, replaced by Data\_Doc\_Location

  - **Data.DocumentSaveType -** Type of Save (Normal, Create, SaveAs)

  - **Data.DocumentSizeOnDisk -** Obsolete, replaced by Data\_Doc\_SizeInBytes

  - **Data.DoesBaseHaveContentOnOpen -** Change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.DoesWorkingBranchHaveExcludedDataOnOpen -** Change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.DstDoc.AccessMode -** New document is read only/editable

  - **Data.DstDoc.EdpState -** Electronic Data Protection setting for the new document

  - **Data.DstDoc.Extension -** New document’s extension (docx/xlsm/pptx, etc.)

  - **Data.DstDoc.FileFormat -** New document’s file format protocol

  - **Data.DstDoc.Fqdn -** New document’s OneDrive or SharePoint Online domain name

  - **Data.DstDoc.FqdnHash -** One-way hash of new document’s customer identifiable domain name

  - **Data.DstDoc.IdentityUniqueId -** Obsolete

  - **Data.DstDoc.IOFlags -** New document’s cached options flags used when opening

  - **Data.DstDoc.IsOpeningOfflineCopy -** Flag indicating that an offline copy of the new document was opened

  - **Data.DstDoc.IsSyncBacked -** Flag indicating that an auto synced copy of the document exists on the computer

  - **Data.DstDoc.Location -** Indicates which service provided the new document (OneDrive, File Server, SharePoint, etc.)

  - **Data.DstDoc.NumberCoAuthors -** Count of the number of fellow users in a collaborative editing session on the new document

  - **Data.DstDoc.ReadOnlyReasons -** Reasons why the new document was opened read only

  - **Data.DstDoc.ResourceIdHash -** An anonymized document identifier used to diagnose problems with the new document

  - **Data.DstDoc.ServerDocId -** An immutable anonymized document identifier used to diagnose problems with the new document

  - **Data.DstDoc.ServerProtocol -** the protocol version used to communicate with the service when creating the new document

  - **Data.DstDoc.ServerType -** the type of the server offering the service (SharePoint, OneDrive, WOPI etc.) for the new document

  - **Data.DstDoc.ServerVersion -** the server version offering the service for the new document

  - **Data.DstDoc.SessionId -** Identifies a specific document edit session within the full session for the new document

  - **Data.DstDoc.SharePointServiceContext -** Diagnostic information from SharePoint Online requests for the new document

  - **Data.DstDoc.SizeInBytes -** Indicator of document size of new document

  - **Data.DstDoc.UrlHash -** One-way hash to create a naïve document identifier for the new document

  - **Data.EditorsCount -** A count of other collaborators editing the document

  - **Data.FullIError -** Cache of all error codes from the protocol layer

  - **Data.HasFilteredCategories -** Obsolete

  - **Data.HasFilteredCategoryNames -** Obsolete

  - **Data.HasFilteredSeries -** Obsolete

  - **Data.HasFilteredSeriesNames -** Obsolete

  - **Data.HasPendingSaveAs -** Indicates that a request Save As/Save a Copy is in progress

  - **Data.Input.FileOpenState -** State requested by app (Read/ReadWrite, etc.)

  - **Data.Input.FileSaveState -** State requested by app (Save on Open, Save As, etc.)

  - **Data.Input.NetworkCost -** Indicates network cost/type (metered, metered above cap, etc.)

  - **Data.Input.OpenAsync -** Flag indicates app requested an async open

  - **Data.Input.OpenOfflineCopy -** Flag indicates app requested an offline open

  - **Data.IsCachedHistoricalVersion -** Indicates that this cached file is not the latest version

  - **Data.IsHtml -** Indicates that HTML format text was pasted

  - **Data.IsLegacyCode -** Indicates that Legacy code format text was pasted

  - **Data.IsLocalOnlyFile -** Indicates that the file was opened from local storage only

  - **Data.IsLocalOrSyncBackedFile -** Indicates that the file was opened locally and mapped through to the service

  - **Data.IsMapUnMapCase -** Part of state of cached file

  - **Data.isOpenFromCollab -** Indicates that the file was opened from the shared collaboration service

  - **Data.IsStubFile -** The document hasn’t been shared to the cloud service yet

  - **Data.IsSyncBackedFile -** the document is in a folder that is auto sync updated

  - **Data.IsSyncBackedStateDifferentThanOnLastOpen -** the document state has changed, changes may have arrived while the document wasn’t open

  - **Data.IsWorkingBranchAvailableOnOpen -** change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.Location -** Indicates storage media type/location (USB; Cloud, etc.)

  - **Data.LockRequestDocMode -** Indicates if the document is available to others

  - **Data.MruRequestResult -** Obsolete

  - **Data.NewDataNotAvailableReason -** Obsolete

  - **Data.OcsDisableReasons -** Not used by Save

  - **Data.OcsHostOnOpen -** Not used by Save

  - **Data.Output.FileSaveState -** State on save completion

  - **Data.PivotChart -** Obsolete

  - **Data.resolveConflictState -** Reason codes for a request to resolve merge conflicts

  - **Data.RTCEnabled -** the fast change distribution protocol has started

  - **Data.SaveAsToCurrent -** Indicates that the active document will overwrite the stored file

  - **Data.ServiceId -** Obsolete, replaced by Data\_Doc\_WopiServiceId

  - **Data.SessionId -** Obsolete

  - **Data.SizeInBytes -** Obsolete, replaced by Data\_Doc\_SizeInBytes

  - **Data.StopwatchDuration -** Obsolete

  - **Data.SyncBackedFileRequiresOnlineTransition -** Flag indicating that Save action is temporarily blocked by online transition

  - **Data.SyncBackedFileSaveOnOpen -** Flag indicating that changes made by auto sync require a save on open

  - **Data.TelemetryId -** Obsolete

  - **Data.TriggerSaveAfterBaseDownload -** change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.UploadBlockedDueToCoherencyFailure -** Save to service blocked pending user resolution of conflicting changes

  - **Data.UploadBlockedDueToFailedSaveAsOverExisting -** Save to service blocked due to failed attempt to overwrite an existing file

  - **Data.UploadPreemptedForCoherency -** Save to service abandoned as more changes are being made by the user

  - **Data.UploadPreemptedForSaveAsOverExistingFailure -** Save to service abandoned due to earlier SaveAsOverExisting failure

  - **Data.UploadScheduled -** file is ready to be asynchronously uploaded to the service

  - **Data.UseClientIdAsSchemaLockId -** flag to control how documents are locked in the service

  - **Data.WorkingCopySaved -** change tracking diagnostic making sure we have the latest version of a shared file

  - **Data.ZrtSaveAsforSyncBackedBusinessEnabled -** flag indicating fast save enabled for SharePoint Online

  - **Data.ZrtSaveAsforSyncBackedConsumerEnabled -** flag indicating fast save enabled for OneDrive Consumer

  - **Data.ZrtSaveAsforSyncBackedCTBusinessEnabled -** flag indicating fast save content types enabled for SharePoint Online

  - **Data.ZrtSaveAsforSyncBackedCTConsumerEnabled -** flag indicating fast save content types enabled for OneDrive Consumer

  - **Data.ZrtSaveAsforSyncBackedMetaDataBusinessEnabled -** flag indicating fast file metadata save enabled for SharePoint Online

  - **Data.ZrtSaveAsforSyncBackedMetaDataConsumerEnabled -** flag indicating fast file metadata save enabled for OneDrive Consumer-

#### Office.FindTime.AppFailedToStart

Collected when app fails to start due to an unexpected error during startup. Used to track exceptions & crashes. Helps monitor & debug app health.

The following fields are collected:
- **DateTime** - Timestamp of when the event is logged

- **EventName** - The name of the event being logged

#### Office_FirstRun_Apple_ActivationResult

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application activation flow. We collect data to figure out the outcome of the O365 subscription activation along with the flow used to activate (First Run Experience, In-App-Flow, Purchase, etc.).

The following fields are collected:

- **Data_ActivationStatusCollectionTime** – A timestamp

- **Data_ActivationStatusError** – An activation error code.

- **Data_ActivationStatusFlowType** – A numeric value indicating the type of activation flow

#### Office_FirstRun_Apple_ActivationStatus

This event is collected for Office applications running under Apple platforms. The event is used to figure out the outcome of the O365 subscription activation along with the flow used to activate (FRE, InApp, Purchase, etc.). We collect data containing the Activation type, flow type (FRE/DocStage/Purchase) and Office Licensing Service ID.

The following fields are collected:

- **Data_ActivationTypeCollectionTime** – A timestamp

- **Data_ActivationTypeFlowType** – A numeric value indicating the type of activation flow

- **Data_ActivationTypeOLSLicense** – An identifier of the License

- **Data_ActivationTypeStatus** – An activation status code.

#### Office_FirstRun_Apple_FirstRunComplete

This event is collected for Office applications running under Apple platforms. The event lets us know if the user running in freemium, the flow type being run (FRE/DocStage/Purchase) and the identity type (MSA/OrgID). We use this event to figure out if the First Run-Experience (FRE) was completed and type of identity used to sign-in (MSA/OrgID).

The following fields are collected:

- **Data_FirstRunCompletedCollectionTime** - A timestamp registering the time at which the flow was completed

- **Data_FirstRunCompletedFlowType** - A code denoting the type of user flow that was completed 

- **Data_FirstRunCompletedFreemiumStatus** - A code representing the status of completion for a freemium user flow

- **Data_FirstRunCompletedIdentityType** - The type of identity of the user that completed the flow

#### Office_FirstRun_Apple_FirstRunStart

This event is collected for Office applications running under Apple platforms. The event lets us know a user has entered first run experience and the flow type being run (FRE/DocStage/Purchase). We use this event to figure out if the First Run-Experience (FRE) was started successfully.

The following fields are collected:

- **Data_FirstRunStartedCollectionTime** - A timestamp registering the time at which the flow was completed

- **Data_FirstRunStartedFlowType** - A code denoting the type of user flow that was completed 

#### Office_FirstRun_Apple_FirstRunStartedAndCompleted

This event is collected for Office applications running under Apple platforms. The event lets us know if the user running in freemium, the flow type being run (FRE/DocStage/Purchase) and the identity type (MSA/OrgID). We use this event to figure out the health and effectiveness of our First-Run Experience (FRE) flow.

The following fields are collected:

- **Data_FirstRunCompletedCollectionTime** - A timestamp registering the time at which the flow was completed

- **Data_FirstRunCompletedFlowType** - A code denoting the type of user flow that was completed  

- **Data_FirstRunCompletedFreemiumStatus** - A code representing the status of completion for a freemium user flow

- **Data_FirstRunCompletedIdentityType** - The type of identity of the user that completed the flow

- **Data_FirstRunStartedCollectionTime** - A timestamp registering the time at which the flow was started

- **Data_FirstRunStartedFlowType** - A code denoting the type of user flow that was started

#### Office_FirstRun_Apple_InAppPurchaseActivationFail

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application activation flow. We collect data to figure out the outcome of the In-App purchase activation along with the flow used to activate (First Run Experience, In-App-Flow, Purchase, etc.). 

The following fields are collected:

- **Data_ActivationFailCollectionTime** - A timestamp registering the time at which the activation failure occurred 

- **Data_ActivationFailFlowType** - A code denoting the type of user flow that was exercised

- **Data_AssoicatedSuccessfullyCollectionTime** - A timestamp registering the time at which the association occurred 

- **Data_AssoicatedSuccessfullyFlowType** - A code denoting the type of user flow that was exercised

#### Office_FirstRun_Apple_InAppPurchaseActivationSuccess

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application activation flow. We collect data to figure out the outcome of the In-App purchase activation along with the flow used to activate (First Run Experience, In-App-Flow, Purchase, etc.). 

The following fields are collected:

- **Data_ActivatedSuccessfullyCollectionTime** - A timestamp registering the time at which the activation occurred 

- **Data_ActivatedSuccessfullyFlowType** - A code denoting the type of user flow that was exercised

- **Data_AssoicatedSuccessfullyCollectionTime** - A timestamp registering the time at which the association occurred 

- **Data_AssoicatedSuccessfullyFlowType** - A code denoting the type of user flow that was exercised

#### Office_FirstRun_Apple_InAppPurchaseAssociationFailed

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application activation flow. We collect data to figure out the outcome of the In-App purchase activation along with the flow used to activate (First Run Experience, In-App-Flow, Purchase, etc.). 

The following fields are collected:

- **Data_AppChargedSuccessfullyCollectionTime** - A timestamp registering the time at which the purchase was charged

- **Data_AppChargedSuccessfullyFlowType** - A code denoting the type of user flow that was exercised

- **Data_AssoicationFailedCollectionTime** - A timestamp registering the time at which the app association failed

- **Data_AssoicationFailedFlowType** - A code denoting the type of user flow that was exercised

- **Data_AssoicationFailedResult** - A code denoting type of failure observed

#### Office_FirstRun_Apple_InAppPurchaseAssociationSuccess

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application activation flow. We collect data to figure out the outcome of the In-App purchase activation along with the flow used to activate (First Run Experience, In-App-Flow, Purchase, etc.). 

The following fields are collected:

- **Data_AppChargedSuccessfullyCollectionTime** - A timestamp registering the time at which the purchase was charged

- **Data_AppChargedSuccessfullyFlowType** - A code denoting the type of user flow that was exercised

- **Data_AssoicatedSuccessfullyCollectionTime** - A timestamp registering the time at which the app association failed

- **Data_AssoicatedSuccessfullyFlowType** - A code denoting the type of user flow that was exercised

#### Office_FirstRun_Apple_InAppPurchaseFailures

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application activation flow. We collect data on the outcome of the In-App purchase flow.

The following fields are collected:

- **Data_AppStoreFailureFlowType** - A code denoting the type of user flow that was exercised

- **Data_AppStoreFailureResult** - The failure result observed

- **Data_CancelRequestFlowType** - A code denoting the type of user flow that was exercised

- **Data_EventId** - A code denoting type of failure observed

#### Office_FirstRun_Apple_InAppPurchasesAttempted

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application in-app purchase flow. We collect data to track the attempted In-App purchases and their Type of SKU being purchased (Monthly/Annual/Home/Personal).

The following fields are collected:

- **Data_EventId** - A code denoting type of result observed

- **Data_PurchasedClickedOfferType** - The type of SKU attempted to purchase

- **Data_PurchaseSuccessfulFlowType** - A code denoting the type of user flow that was exercised

#### Office_FirstRun_Apple_InAppRestoreAttempted

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application in-app purchase flow. We collect data to track the attempted In-App restorations

The following fields are collected:

- **Data_EventId** - A code denoting the type of outcome of the attempt

- **Data_RestoreAttemptFlowType** - A code denoting the type of user flow that was exercised

#### Office_FirstRun_Apple_InAppRestoreAttemptFailed

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our application in-app purchase flow. We collect data to track the attempted In-App restorations and their associated flows and errors.

The following fields are collected:

- **Data_RestoreButtonFlowType** - A code denoting the type of user flow that was exercised

- **Data_RestoredFailedPaymentCancelledFlowType** - A code denoting the type of payment cancellation flow that was exercised

- **Data_RestoredFailedUnKnownFlowType** - Whether the attempt failed due to the exercise of an unexpected user flow

- **Data_RestoredFailedUnKnownResult** - Whether the attempt failed due to unknown reasons

#### Office_FirstRun_Apple_MacFirstRunCompleted

This event is collected for Office applications running under Apple platforms. The event lets us know a user has gone thru first run experience. We use this event to figure out if the First Run-Experience (FRE) was completed successfully.

The following fields are collected:

- **Data_FirstRunCollectionTime** - A timestamp registering the time at which the flow was completed.

#### Office_FirstRun_Apple_MacWXPFirstRunStarted

This event is collected for Office applications running under Apple platforms. The event lets us know a user has entered first run experience. We use this event to figure out if the First Run-Experience (FRE) was started successfully.

The following fields are collected:

- **Data_FirstRunPanelName** - The name of the panel from which the experience started

#### Office.LivePersonaCard.UserActions.OpenedPersonaCard

Logged when the user opens a Persona Card. It is used to observe critical anomalies in failure rates of launching the Live Persona Card.

The following fields are collected:

- **Data.appContextId** - A randomly generated id used to identify different accounts in the same app

- **Data.AppInfo.Name** - Name of the service in use (Profile card)

- **Data.cardCorrelationId** - The globally unique identifier for a persona card

- **Data.cardPersonaCorrelationId** - The globally unique identifier for a specific persona shown in a card

- **Data.clientCorrelationId** - The globally unique identifier for the app's session

- **Data.clientType** - The type of device the app is run on.

- **Data.eventId** - Name identifier of the event, e.g. "LivePersonaCardRenderedAction"

- **Data.exportName** - Human readable name of the user action event, e.g. "OpenedPersonaCard"

- **Data.exportType** - Category of the event for GDPR export request

- **Data.feature** - Used to group various events of the same feature (Profile card)

- **Data.hostAppRing** - The ring by which the app was distributed

- **Data.OTelJS.Version** - Version of OTel logger

- **Data.region** -The geographical region of the profile card backend service to which user is connected

- **Data.tenantAadObjectId** - The tenant to which a user’s subscription is tied. Allows us to classify issues and identify whether a problem is widespread or isolated to a set of users or a specific tenant

- **Data.type** -Type of the logged event, e.g. Trace, Error, Event

- **Data.userAadObjectId** -The globally unique user identifier for an enterprise Microsoft account (duplicate of Data.UserInfo.Id)

- **Data.UserInfo.Id** - The globally unique user identifier for an enterprise Microsoft account 

- **Data.UserInfo.MsaId** - The globally unique user identifier for a consumer Microsoft account

- **Data.UserInfo.OMSTenantId** - The tenant that a user’s subscription is tied to. Allows us to classify issues and identify whether a problem is widespread or isolated to a set of users or a specific tenant

- **Data.userPuid** -The globally unique user identifier for a consumer Microsoft account (duplicate of Data.UserInfo.MsaId)

- **Data.version** -The version of the service (Profile Card)

- **Data.viewType** -Defines the type of the Profile card displayed

- **NetworkCost** - Indicates network cost/type (metered, metered above cap, etc.)

- **NetworkCountry** - The Country Code of the Sender, based on the un-scrubbed Client IP Address.

- **Data.properties** - Additional metadata collected for each event as follows.

	- **bandwidthEstimateMbps** - Effective bandwidth estimate in Mbps

	- **cardCorrelationId** - Duplicate of Data.appContextId above 

	- **cardPersonaCorrelationId** - Duplicate of Data.cardCorrelationId above

	- **consumerCorrelationId** - Duplicate of Data.clientCorrelationId above 

	- **externalAppSessionCorrelationId** - A globally unique identifier for the app to identify all persona cards opened in the same sub-session

	- **immersiveProfileCorrelationId** - A globally unique identifier for the expanded profile view session

	- **networkEffectiveType** - The effective type of network connection, e.g. "slow-2g Online” to identify whether the user is connected to the internet at the time of showing the persona card

	- **networkType** - The type of network connectivity of the device in use

	- **personaCorrelationId** - A globally unique identifier for unique personas in a session

	- **roundTripEstimateMs** - Estimated effective round-trip of the current connection in milliseconds

	- **wasOpenedAsCompactCard** - Used to identify if the card was opened as a compact view initially


#### Office.Manageability.Client Fetch.PolicyPreChecks

Critical telemetry to track failure\\success for cloud policy fetch precheck validation. ExitReason contains an enumerator map to the pre-check condition that failed.

The following fields are collected:

  - **Data.ExitReason** - An enumerator value telling the exit reason, if the Precheck failed

  - **Data.Log** - Custom log message indicating the precheck success or failure

#### Office.Manageability.Client.Fetch.AndApplyPolicy

Critical telemetry to track failure\\success for cloud policy fetch initiation from app. Exit Reason contains an enumerator Map to the failure reason.

The following fields are collected:

  - **Data.ExitReason** - An enumerator value telling the exit reason, if the Precheck failed

  - **Data.Log** - Custom log message indicating the precheck success or failure


#### Office.OneNote.Navigation.CreatePage

Critical signal used to monitor the ability of OneNote users to create pages in OneNote.  Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t create a page this would trigger a high severity incident.

The following fields are collected:

- **IsAtSectionEnd** - Indicates whether a new page is created at the end of section or not.

- **IsBlank** - Indicates whether a new page is blanked page or created with a template.

- **IsRecentsView** - Indicates whether a page is created from a recents or not.

- **NavView** - Indicates whether a page is created from a navigation view or not.

- **NoteType** - Indicates the type (quick note, list, or photo) of a page.

- **QuickNoteType** - Indicates the type (quick note, list, or photo) of a page.

- **RailState** - Indicates the state of OneNote's navigation rail when creating a page.

- **Trigger** - Indicates an entry point where the create page action is started.

- **TriggerInfo** - Indicates additional information related to the trigger.


#### Office.OneNote.Navigation.CreateSection

Critical signal used to monitor the ability of OneNote users to create sections in OneNote.  Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t create a page this would trigger a high severity incident.

The following fields are collected

- **NotebookID** - A unique identifier of a notebook.

- **SectionID** - A unique identifier of a section created.

- **Trigger** - Indicates an entry point where the create section action is started.

- **TriggerInfo** - Indicates additional information related to the trigger.


#### Office.OneNote.Navigation.Navigate

Critical signal used to monitor the ability of OneNote users to navigate between pages in OneNote.  Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t navigate this would trigger a high severity incident.

The following fields are collected:

- **FromNotebook** - A unique identifier of a notebook.

- **FromPage** - A unique identifier of a page.

- **FromSection** - A unique identifier of a section.

- **FromSectionGroup** - A unique identifier of a section group.

- **IsCurrentUserEduStudent** - Indicates whether the current user has a student role in an education notebook or not.

- **IsEduNotebook** - Indicates whether the current page is in an education notebook or not.

- **IsEduNotebookReadOnlyPage** - Indicates whether the current page is a read-only page in an education notebook or not.

- **ToNotebook** - A unique identifier of a notebook.

- **ToPage** - A unique identifier of a page.

- **ToSection** - A unique identifier of a section.

- **ToSectionGroup** - A unique identifier of a section group.


#### Office.OneNote.NotebookManagement.CreateNotebook

Critical signal used to monitor the ability of OneNote users to create notebooks in OneNote.  Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t create notebooks this would trigger a high severity incident.

The following fields are collected:
	
- **NotebookID** - A unique identifier of a notebook.


#### Office.OneNote.NotebookManagement.OpenNotebook

Critical signal used to monitor the ability of OneNote users to open notebooks in OneNote.  Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t open notebooks this would trigger a high severity incident.

The following fields are collected:

-  **NotebookID** - A unique identifier of a notebook.

	
#### Office.OneNote.Search.Search

Critical signal ID used to monitor the ability of OneNote users to find information across thousands of pages and notebooks.   Telemetry used to ensure critical regression detection for OneNote app and service health. If users can’t find information across notebooks this would trigger a high severity incident.

The following fields are collected:

- **PageSearchResultCount** - Indicates the number of search's results found in a page search mode.

-  **PageTimeToFirstResultInMs** - Indicates the amount of time OneNote takes to find the first match in a page search mode.
	
-  **PageTimeToLastResultInMs** - Indicates the amount of time OneNote takes to find the last match in a page search mode.

-  **PageTimeToMedianResultInMs** - Indicates the median of time OneNote takes to find all matches in a page search mode.

-  **SearchResultCount** - Indicates the number of search's results found.

-  **TagSearchResultCount** - Indicates the number of search's results found in a tag search mode.

-  **TagTimeToFirstResultInMs** - Indicates the amount of time OneNote takes to find the first match in a tag search mode.

-  **TagTimeToLastResultInMs** - Indicates the amount of time OneNote takes to find the last match in a tag search mode.

-  **TagTimeToMedianResultInMs** - Indicates the median of time OneNote takes to find all matches in a tag search mode.

-  **TimeToFirstResultInMs** - Indicates the amount of time OneNote takes to find the first match.

-  **TimeToLastResultInMs** - Indicates the amount of time OneNote takes to find the last match.

-  **TimeToMedianResultInMs** - Indicates the median of time OneNote takes to find all matches.


#### Office.OneNote.StickyNotes.NoteCreated

This is a critical signal that is used to monitor the ability of Sticky Notes users to create notes in the app.  Telemetry is used to ensure critical regression detection for OneNote app and service health. If users can’t create a note, this would trigger a high severity incident.

The following fields are collected:

- **NoteLocalId** - Distinguishable unique identifier assigned to a note at the time of a user creates the note within the app.

- **IsExportable** - A flag indicating whether this event was a result of a user action or not. Should be set to True as NoteCreated is a user-triggered action.

- **StickyNotes-SDKVersion** - Version number indicating the version of Sticky Notes the user is using. Allows us to identify which versions of the product are showing an issue so that we can correctly prioritize it.


#### Office.OneNote.StickyNotes.NoteViewed

This is a critical signal that is used to monitor the ability of Sticky Notes users to create notes in the app.  Telemetry is used to ensure critical regression detection for OneNote app and service health. If users can’t create a note, this would trigger a high severity incident.

The following fields are collected:

- **HasImages** - A flag indicating whether the note viewed has images stored in it.

- **IsExportable** - A flag indicating whether this event was a result of a user action or not. Should be set to True as NoteViewed is a user-triggered action.

- **NoteLocalId** - Distinguishable unique identifier assigned to a note at the time a user creates the note within the app.

- **StickyNotes-SDKVersion** - Version number indicating the version of Sticky Notes the user is using. Allows us to identify which versions of the product are showing an issue so that we can correctly prioritize it.


#### Office.OneNote.Storage.NotebookSyncResult
 
This event logs notebook sync result. It is used for figuring out how many unique sync targets when calculating OneNote sync score.
 
The following fields are collected

- **CachedError_Code** - a numbered or alphanumeric code used to determine the nature of the cached error, and/or why it occurred
	
- **CachedError_Description** -a description of the cached error

- **CachedError_Tag** -indicate where in the code throws the cached error

- **CachedError_Type** -the type of the cached error, e.g. Win32Error, etc.

- **ExecutionTime** -time in milliseconds taken to replicate the notebook

- **Gosid** -global object space ID

- **IdentityType** -identity type, e.g. Windows Live, Org ID, etc.

- **InitialReplicationInSession** -is this replication the first notebook replication after open or not

- **IsBackgroundSync** -is this a background sync or not

- **IsCachedErrorSuppressed** -is the cached error suppressed or not

- **IsCachedErrorUnexpected** -is the cached error unexpected or not

- **IsNotebookErrorSuppressed** -is the notebook level sync error suppressed or not

- **IsNotebookErrorUnexpected** -is the notebook level sync error unexpected or not

- **IsSectionErrorSuppressed** -is the section sync error suppressed or not

- **IsSectionErrorUnexpected** -is the section sync error unexpected or not

- **IsUsingRealtimeSync** -is the notebook sync using modern page content sync or not

- **LastAttemptedSync** -timestamp when the notebook was attempted to be synced last time

- **LastBackgroundSync** -timestamp when the latest background sync was attempted

- **LastNotebookViewedDate** -the date when the notebook was last viewed

- **LastSuccessfulSync** -timestamp when the notebook successfully synced before

- **NeedToRestartBecauseOfInconsistencies** -does the sync need to restart because of inconsistencies or not

- **NotebookErrorCode** -notebook level sync error code saved on notebook graph space

- **NotebookId** -notebook ID

- **NotebookType** -notebook type

- **ReplicatingAgainBecauseOfInconsistencies** -does the sync restart because of inconsistencies or not

- **SectionError_Code** -a numbered or alphanumeric code used to determine the nature of the section sync error, and/or why it occurred

- **SectionError_Description** -a description of the section sync error

- **SectionError_Tag** -indicate where in the code throws the section sync error

- **SectionError_Type** -the type of the section sync error, e.g. Win32Error, etc.

- **Success** -is the notebook sync successful or not

- **SyncDestinationType** -sync destination type, i.e. OneDrive or SharePoint Online

- **SyncId** -a number unique to each notebook sync

- **SyncWasFirstInSession** -is this sync the first sync in current session

- **SyncWasUserInitiated** -is this sync user initiated or not

- **TenantId** -SharePoint tenant ID

- **TimeSinceLastAttemptedSync** -time since last notebook sync attempt

- **TimeSinceLastSuccessfulSync** -time since last successful notebook sync


#### Office.OneNote.System.AppLifeCycle.AppLaunch

The critical signal used to ensure OneNote users can successfully launch the app. The telemetry is used to ensure critical regression detection for OneNote app and service health. If users can’t launch the app in our performance window, this would trigger a high severity incident.

The following fields are collected: 	None

#### Office.Outlook.Desktop.AccountConfiguration.CreateAccountResult

Result of adding an account to Outlook in a new profile, from the Office Backstage, or from the account settings dialog. The data is actively monitored to ensure we don't see any spikes in failures. We also analyze the data to find areas of improvement. We aim to improve this success rate with each release.

The following fields are collected:

  - **AccountCreationResult** – The result (success, failure, cancellation, etc.) of adding the account to Outlook.

  - **AccountCreationTime** – time taken to attempt account creation

  - **AccountInfoSource** - account settings source (e.g. AutoDiscover, GuessSmart, AutoDetect, etc.)

  - **AccountType** – The type of account being configured.

  - **HashedEmailAddress** – hashed email address

  - **ShowPasswordPageFlightEnabled** - indicator if ShowPopImapPasswordPage flight is enabled

#### Office.Outlook.Desktop.AccountConfiguration.RepairAccountResult

Result of repairing an account or changing advanced account settings. The data is actively monitored to ensure we don't see any spikes in failures. We also analyze the data to find areas of improvement. Since this a new (refactored) experiences we want to make sure we got this right.

The following fields are collected:

  - **AccountInfoSource** - account info source for the account used to attempt repair

  - **AccountType** - type of account for which account repair was attempted

  - **HashedEmailAddress** - hashed email address

  - **ManualRepairRequested** - indicator if manual repair was requested

  - **Result** - result of attempt to repair account. For example: "Success" or "Fail\_SaveChangesToAccount"

#### Office.Outlook.Desktop.AccountConfiguration.UpdatePasswordResult

Result of updating an account's password from the Account Settings dropdown. The data is actively monitored to ensure we don't see any spikes in failures. We also analyze the data to find areas of improvement. Since this a new (refactored) experiences we want to make sure we got this right.

The following fields are collected:

  - **AccountType** - type of account for which updating password was attempted

  - **HashedEmailAddress** - hashed email address

  - **Result** - result of attempt to update password. For example: "Success" or "Fail\_AllowLessSecureAppsDisabled"


#### Office.Outlook.Desktop.Stores.CreateNewStore

Collects the result of creating a new store (with type and version), as well as the result code. We actively monitor this event to track the health a user’s ability to sync and store mail locally, archive mails (in a PST), or use Groups.

The following fields are collected:

  - **Standard HVA Activity** with custom payload

  - **StoreType** – The type of store created OST/PST/NST

  - **StoreVersion** – The store version created Small/Large/Tardis

#### Office.Outlook.Mac.AccountAddWorkflow

Result of adding an account in Outlook. The data is monitored to ensure we don’t see any spikes in failures. We also analyze the data to find areas of improvement. We aim to improve this success rate with each release. 

The following fields are collected:

- **AccountConfigMethod** - the account configuration method

- **AccountType** - the type of account being configured

- **AccountWorkflowSession** - session where account workflow is attempted

- **SessionDuration** - duration of session 

- **ThreadId** - identifier for the thread


#### Office.Outlook.Mac.AccountOnboardingFlow

Result of adding an account in Outlook using new account configuration experience. The data is monitored to ensure we don’t see any spikes in failures. We also analyze the data to find areas of improvement. We aim to improve this success rate with each release. 

The following fields are collected:

- **AccountConfigAutoSignIn** - automatic account configuration set by admin

- **AccountConfigDomain** - domain specified during account configuration 

- **AccountConfigEntryPoint** - entry point where user entered account configuration 

- **AccountConfigErrorCode** - error code encountered during account configuration 

- **AccountConfigErrorString** - error encountered during account configuration

- **AccountConfigMethod** - account configuration method

- **AccountConfigPhase** - current step of account configuration workflow

- **AccountConfigPhaseFrom** - beginning step of account configuration workflow 

- **AccountConfigPhaseTo** - last step of account configuration workflow 

- **AccountType** - type of account being configured

- **AccountWorkflowSession** - session where account workflow is attempted

- **SessionDuration** - duration of session


#### Office.Outlook.Mac.DeleteAccountUsage

Result of deleting an account in Outlook. The data is monitored to ensure we don’t see any spikes in failures. We also analyze the data to find areas of improvement. We aim to improve this success rate with each release. 

The following fields are collected:

- **AccountType** - type of account being configured

- **AccountID** - account identifier

- **DeprovisionAccount** - indicates whether account is removed from server

- **IsFastDelete** - indicates whether account is deleted on background thread

#### Office.PowerPoint.DocOperation.Close

Collected when PowerPoint presentations are closed. It contains the information needed to be able to properly investigate and diagnose issues that happen through the close process which entail persisting and syncing the user's data. Microsoft uses this data to ensure that close is working as expected and user content is successfully being persisted.

The following fields are collected:

  - **Data\_AddDocTelemetryResult:long -** Does this log entry have all necessary document telemetry (Data\_Doc\_\* fields)? If not, why?

  - **Data\_AutoSaveDisabledReasons:string -** Predefined set of values of why was autosave disabled on this document? (Merge error, Save error, Group policy etc.)

  - **Data\_CloseReason:long -** How was close performed? Closing document? Closing app?

  - **Data\_CppUncaughtExceptionCount:long -** Number of unhandled exceptions

  - **Data\_DetachedDuration:long -** Time for which Activity was detached/not running

  - **Data\_Doc\_AccessMode:long -** How was this document opened (Read only | read write)

  - **Data\_Doc\_AssistedReadingReasons:long -** Predefined set of values of why document was opened in assisted reading mode

  - **Data_Doc_AsyncOpenKind:long –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data\_Doc\_ChunkingType:long -** How is document stored in SharePoint

  - **Data\_Doc\_EdpState:long -** Enterprise Data Protection state of document

  - **Data\_Doc\_Ext:string -** Document extension

  - **Data\_Doc\_Extension:string -** Document extension

  - **Data\_Doc\_FileFormat:long -** Predefined set of values of format of file (more granular than extension)

  - **Data\_Doc\_Fqdn:string -** Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

  - **Data\_Doc\_FqdnHash:string -** Hash of where document is stored

  - **Data\_Doc\_IdentityTelemetryId:string -** Unique GUID of user

  - **Data\_Doc\_IdentityUniqueId:string -** Unique identifier of identity that was used for Shared Documents action

  - **Data\_Doc\_IOFlags:long -** Bitmask for various IO related flags for a given document

  - **Data\_Doc\_IrmRights:long -** Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

  - **Data\_Doc\_IsCloudCollabEnabled:bool -** True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

  - **Data\_Doc\_IsIncrementalOpen:bool -** Was document opened incrementally (new feature that opens document without needing to download entire document)

  - **Data\_Doc\_IsOcsSupported:bool -** Is Document supports coauthoring using new OCS service

  - **Data\_Doc\_IsOpeningOfflineCopy:bool -** verifies if document is being opened from local cache

  - **Data\_Doc\_IsSyncBacked:bool -** verifies if document is being opened from folder that is using OneDrive sync back app

  - **Data\_Doc\_Location:long -** Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

  - **Data\_Doc\_LocationDetails:long -** Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

  - **Data\_Doc\_NumberCoAuthors:long -** Number of coauthors at the time of opening of a document

  - **Data\_Doc\_PasswordFlags:long -** Predefined set of values of how document is encrypted with password (None, password to read, password to edit)-

  - **Data\_Doc\_ReadOnlyReasons:long -** Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit etc.)

  - **Data\_Doc\_ResourceIdHash:string -** Hash of resource identifier for documents stored in cloud

  - **Data_Doc_RtcType -**  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

  - **Data\_Doc\_ServerDocId:string -** immutable identifier for documents stored in cloud

  - **Data\_Doc\_ServerProtocol:long -** Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

  - **Data\_Doc\_ServerType:long -** Predefined set of values of type of server (SharePoint, DropBox, WOPI)

  - **Data\_Doc\_ServerVersion:long -** verifies if server is based off Office14, Office15 or Office 16

  - **Data\_Doc\_SessionId:long -** generated GUID that Identifies the instance of the document within the same process session

  - **Data\_Doc\_SharePointServiceContext:string -** An opaque string, typically GridManagerID.FarmID. Useful for correlating client-side and server-side log

  - **Data\_Doc\_SizeInBytes:long -** Document size in bytes

  - **Data\_Doc\_SpecialChars:long -** Bitmask indicating special chars in the document's URL or Path

  - **Data\_Doc\_StorageProviderId:string -** A string that identifies the document's storage provider, like "DropBox"

  - **Data\_Doc\_StreamAvailability:long -** Predefined set of values of status of document Stream(available, permanently disabled, not available)

  - **Data\_Doc\_UrlHash:string -** hash of full URL of documents stored in cloud

  - **Data\_Doc\_UsedWrsDataOnOpen:bool -** true if the file was opened incrementally using pre cached WRS data on the host

  - **Data\_Doc\_WopiServiceId:string -** WOPI Service identifier, e.g. "Dropbox"

  - **Data\_DocHasStorage:bool -** Does this document have local storage?

  - **Data\_fLifeguarded:bool -** Was document ever lifeguarded (feature to fix document errors by themselves without prompting user)?

  - **Data\_IsDocAutoSaveable:bool -** Is presentation auto savable?

  - **Data\_IsDocDirty:bool -** Does presentation have changes that are not yet saved?

  - **Data\_IsNewDoc:bool -** Is new document or existing

  - **Data\_IsRecoveredDoc:bool -** Is document recovered one? (If prior session crashed, we show document recovery pane on next session)

  - **Data\_NewDocDiscarded:bool -** Was new presentation discarded without being saved

  - **Data\_OCSClosingDlgCanceled:bool -** If upload is pending on OCS while user closes document, dialog is popped up to user to wait. Which option user chose?

  - **Data\_OCSClosingDlgExpired:bool -** Did dialog expire (after 1 minute) on its own?

  - **Data\_OCSClosingStatus:long -** What’s final status of OCS (In CSI, Closable, In OCS Transition, In CSI transition, etc.)

  - **Data\_OCSClosingWaitDurationMS:long -** How much time user had to wait for OCS to upload

  - **Data\_OCSHandleTransitionResult:long -** Predefined set of values of result of transition performed during close (Already tried, continue to close, etc.)

  - **Data\_ServerDocId:string -** GUID to uniquely identify a document

  - **Data\_StopwatchDuration:long -** Total time for Activity

  - **Data\_UserContinuedZRTClose:bool -** Upon showing dialog on close, did user selected ‘Continue’ to close?

#### Office.PowerPoint.DocOperation.NewDocument

Collected when PowerPoint creates a new presentation. Includes success failure and performance metrics.

This information is used to ensure we can create files successfully and with no degradation in performance.

The following fields are collected:

  - **NewDocumentType** – Whether new document is created from template or just created blank?

  - **FLifeguarded** – Is document life guarded (feature that restores corrupt document state without prompting user)

#### Office.PowerPoint.DocOperation.OpenCompleteProtocol

Collected when PowerPoint opens presentations. It contains the information needed to be able to properly investigate and diagnose issues that happen through the end stages of the open process.

Microsoft uses this data to ensure the feature is working as expected and there is no degradation to opening presentations.

The following fields are collected:

  - **Data\_AntiVirusScanMethod:long -** Predefined set of values of type of AntiVirus scanned (IOAV, AMSI, None etc.)

  - **Data\_AntiVirusScanStatus:long -** Predefined set of values of anti-virus scan that happens for every document opened (NoThreatsDetected, Failed, MalwareDetected etc.)

  - **Data\_CloseAndReopen:bool -** Was this document closed and reopened?

  - **Data\_DetachedDuration:long -** Time for which Activity was detached/not running

  - **Data\_Doc\_AccessMode:long -** How was this document opened (Read only | read write)

  - **Data\_Doc\_AssistedReadingReasons:long -** Predefined set of values of why document was opened in assisted reading mode

  - **Data_Doc_AsyncOpenKind:long –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data\_Doc\_ChunkingType:long -** How is document stored in SharePoint

  - **Data\_Doc\_EdpState:long -** Enterprise Data Protection state of document

  - **Data\_Doc\_Ext:string -** Document extension

  - **Data\_Doc\_Extension:string -** Document extension

  - **Data\_Doc\_FileFormat:long -** Predefined set of values of format of file (more granular than extension)

  - **Data\_Doc\_Fqdn:string -** Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

  - **Data\_Doc\_FqdnHash:string -** Hash of where document is stored

  - **Data\_Doc\_IdentityTelemetryId:string -** Unique GUID of user

  - **Data\_Doc\_IdentityUniqueId:string -** Unique identifier of identity that was used for Shared Documents action

  - **Data\_Doc\_IOFlags:long -** Bitmask for various IO related flags for a given document

  - **Data\_Doc\_IrmRights:long -** Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

  - **Data\_Doc\_IsCloudCollabEnabled:bool -** True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

  - **Data\_Doc\_IsIncrementalOpen:bool -** Was document opened incrementally (new feature that opens document without needing to download entire document)

  - **Data\_Doc\_IsOcsSupported:bool -** Is Document supports coauthoring using new OCS service

  - **Data\_Doc\_IsOpeningOfflineCopy:bool -** Is document being opened from local cache?

  - **Data\_Doc\_IsSyncBacked:bool -** Is document opened from folder that is using OneDrive sync back app

  - **Data\_Doc\_Location:long -** Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

  - **Data\_Doc\_LocationDetails:long -** Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

  - **Data\_Doc\_NumberCoAuthors:long -** Number of coauthors at the time of opening of a document

  - **Data\_Doc\_PasswordFlags:long -** Predefined set of values of how document is encrypted with password (None, password to read, password to edit)-

  - **Data\_Doc\_ReadOnlyReasons:long -** Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit etc.)

  - **Data\_Doc\_ResourceIdHash:string -** Hash of resource identifier for documents stored in cloud

  - **Data_Doc_RtcType -**  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

  - **Data\_Doc\_ServerDocId:string -** immutable identifier for documents stored in cloud

  - **Data\_Doc\_ServerProtocol:long -** Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

  - **Data\_Doc\_ServerType:long -** Predefined set of values of type of server (SharePoint, DropBox, WOPI)

  - **Data\_Doc\_ServerVersion:long -** verifies if server is based off Office14, Office15 or Office 16

  - **Data\_Doc\_SessionId:long -** generated GUID that Identifies the instance of the document within the same process session

  - **Data\_Doc\_SharePointServiceContext:string -** An opaque string, typically GridManagerID.FarmID. Useful for correlating client side and server-side logs

  - **Data\_Doc\_SizeInBytes:long -** Document size in bytes

  - **Data\_Doc\_SpecialChars:long -** Bitmask indicating special chars in the document's URL or Path

  - **Data\_Doc\_StorageProviderId:string -** A string that identifies the document's storage provider, like "DropBox"

  - **Data\_Doc\_StreamAvailability:long -** Predefined set of values of status of document Stream(available, permanently disabled, not available)

  - **Data\_Doc\_UrlHash:string -** hash of full URL of documents stored in cloud

  - **Data\_Doc\_UsedWrsDataOnOpen:bool -** true if the file was opened incrementally using pre cached WRS data on the host

  - **Data\_Doc\_WopiServiceId:string -** WOPI Service identifier, e.g. "Dropbox"

  - **Data\_ExecutionCount:long -** How many times we executed IncOpen protocol before executing this (OpenComplete) protocol

  - **Data\_FailureComponent:long -** Predefined set of values of which component caused this protocol to fail? (Conflict, CSI, Internal etc.)

  - **Data\_FailureReason:long -** Predefined set of values of what’s the failure reason (FileIsCorrupt, BlockedByAntivirus etc.)

  - **Data_FullDownloadRoundTripCount:long -** The number of roundtrips to the server taken to download the entire document.
  
  - **Data_IsProtocolRunInIncOpenMode:bool -** Was the protocol run for an incremental download, which is a download where parts of the document were downloaded after initially showing it to the user.

  - **Data\_MethodId:long -** Internally which line of code was last one to be executed

  - **Data\_StopwatchDuration:long -** Total time for Activity

  - **Data\_TimeToEdit:long -** Time it took for document to become editable

  - **Data\_TimeToView:long -** Time it took for first slide of document to be rendered

  - **Data\_UnhandledException:bool -** Any unhandled native exception?

#### Office.PowerPoint.DocOperation.Save

Collected whenever PowerPoint performs a save using the modern code path. Includes success or failure result type of save performance metrics and relevant document metadata.  Failures in save can result in data loss. Microsoft uses this data to ensure the feature is working as expected and user content is successfully being persisted.

The following fields are collected:

  - **Data\_AddDocTelemetryResult:long -** Does this log entry have all necessary document telemetry (Data\_Doc\_\* fields)? If not, why?

  - **Data\_BeforeSaveEvent:long -** Time taken to raise Document Before Save Event

  - **Data\_CheckDownRevSaveTimeMS:long -** Time taken to check revision

  - **Data\_CheckMacroSaveTimeMS:long -** Time taken to save macros

  - **Data\_ClearAutoSaveTimeMS:long -** Time taken to clear AutoSave flag

  - **Data\_ClearDirtyFlagTimeMS:long -** Time taken to clear document dirty flag

  - **Data\_CloneDocumentTimeMS:long -** Time taken to clone document before starting the save

  - **Data\_CommitTransactionTimeMS:long -** Time taken to commit the save transaction

  - **Data\_CppUncaughtExceptionCount:long -** Uncaught native exceptions while activity was running

  - **Data\_DetachedDuration:long -** Time for which Activity was detached/not running

  - **Data\_Doc\_AccessMode:long -** How was this document opened (Read only | read write)

  - **Data\_Doc\_AssistedReadingReasons:long -** Predefined set of values of why document was opened in assisted reading mode

  - **Data_Doc_AsyncOpenKind:long –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data\_Doc\_ChunkingType:long -** How is document stored in SharePoint

  - **Data\_Doc\_EdpState:long -** Enterprise Data Protection state of document

  - **Data\_Doc\_Ext:string -** Document extension

  - **Data\_Doc\_Extension:string -** Document extension

  - **Data\_Doc\_FileFormat:long -** Predefined set of values of format of file (more granular than extension)

  - **Data\_Doc\_Fqdn:string -** Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

  - **Data\_Doc\_FqdnHash:string -** Hash of where document is stored

  - **Data\_Doc\_IdentityTelemetryId:string -** Unique GUID of user

  - **Data\_Doc\_IdentityUniqueId:string -** Unique identifier of identity that was used for Shared Documents action

  - **Data\_Doc\_IOFlags:long -** Bitmask for various IO related flags for a given document

  - **Data\_Doc\_IrmRights:long -** Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

  - **Data\_Doc\_IsCloudCollabEnabled:bool -** True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

  - **Data\_Doc\_IsIncrementalOpen:bool -** Was document opened incrementally (new feature that opens document without needing to download entire document)

  - **Data\_Doc\_IsOcsSupported:bool -** Is Document supports coauthoring using new OCS service

  - **Data\_Doc\_IsOpeningOfflineCopy:bool -** verifies if document being is opened from local cache

  - **Data\_Doc\_IsSyncBacked:bool -** Is document opened from folder that is using OneDrive sync back app

  - **Data\_Doc\_Location:long -** Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

  - **Data\_Doc\_LocationDetails:long -** Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

  - **Data\_Doc\_NumberCoAuthors:long -** Number of coauthors at the time of opening of a document

  - **Data\_Doc\_PasswordFlags:long -**Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

  - **Data\_Doc\_ReadOnlyReasons:long -** Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit etc.)

  - **Data\_Doc\_ResourceIdHash:string -** Hash of resource identifier for documents stored in cloud

  - **Data_Doc_RtcType -**  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

  - **Data\_Doc\_ServerDocId:string -** immutable identifier for documents stored in cloud

  - **Data\_Doc\_ServerProtocol:long -** Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

  - **Data\_Doc\_ServerType:long -** Predefined set of values of type of server (SharePoint, DropBox, WOPI)

  - **Data\_Doc\_ServerVersion:long -** verifies if server is based off Office14, Office15 or Office 16

  - **Data\_Doc\_SessionId:long -** generated GUID that Identifies the instance of the document within the same process session

  - **Data\_Doc\_SharePointServiceContext:string -** An opaque string, typically GridManagerID.FarmID. Useful for correlating client-side and server-side logs

  - **Data\_Doc\_SizeInBytes:long -** Document size in bytes

  - **Data\_Doc\_SpecialChars:long -** Bitmask indicating special chars in the document's URL or Path

  - **Data\_Doc\_StorageProviderId:string -** A string that identifies the document's storage provider, like "DropBox"

  - **Data\_Doc\_StreamAvailability:long -** Predefined set of values of status of document Stream(available, permanently disabled, not available)

  - **Data\_Doc\_UrlHash:string -** hash of full URL of documents stored in cloud

  - **Data\_Doc\_UsedWrsDataOnOpen:bool -** true if the file was opened incrementally using pre cached WRS data on the host

  - **Data\_Doc\_WopiServiceId:string -** WOPI Service identifier, e.g. "Dropbox"

  - **Data\_DurationUAEOnSaveStartedMs:long -** Time taken for Unknown App Exit during save

  - **Data\_EnsureSaveTransactionTimeMS:long -** Time taken to ensure save transaction is created if doesn’t exist already

  - **Data\_FailureComponent:long-** Predefined set of values of which component caused this protocol to fail? (Conflict, CSI, Internal etc.)

  - **Data\_FailureReason:long -** Predefined set of values of what’s the failure reason (FileIsCorrupt, BlockedByAntivirus etc.)

  - **Data\_fLifeguarded:bool -** Was document ever lifeguarded (feature to fix document errors by themselves without prompting user)?

  - **Data\_HandleEnsureContentType:long -** Time taken to ensure all the content types are correct

  - **Data\_HandleEnsureContentTypeTimeMS:long -** Time taken to ensure all the content types are correct

  - **Data\_HasEmbeddedFont:bool -** Does this document have embedded fonts?

  - **Data\_InitializeSaveTimeMS:long -** Time taken to initialize document content to begin save

  - **Data\_InOCSTransition:bool -** Is this save performed for transitioning to OCS

  - **Data\_IsSavingWithEmbeddedFont:bool -** Does this document have embedded fonts?

  - **Data\_MethodId:long -** Internally which line of code was last one to be executed

  - **Data\_PerformEmbedFontsTimeMS:long -** Time taken to serialize embedded fonts

  - **Data\_PerformModernSaveTimeMS:long -** Time taken to perform modern save (new code)

  - **Data\_PerformPostSaveTimeMS:long -** Time taken to perform post save functions (notifications, undo entries)

  - **Data\_PrepareForSaveTimeMS:long -** Time taken to start save

  - **Data\_RaiseDocumentBeforeSaveEventTimeMS:long -** Time taken to raise the BeforeSave event

  - **Data\_ReflectDocumentChangeTimeMS:long -** Time taken to reflect saved changes to UI (repopulate thumbnails etc.)

  - **Data\_ReportStartTimeMS:long -** Time taken to finish initializing telemetry for save

  - **Data\_ReportSuccessTimeMS:long -** Time taken to finish reporting successful save

  - **Data\_ResetDirtyFlagOnErrorTimeMS:long -** Time taken to reset document dirty flag on error

  - **Data\_SaveReason:long -** Predefined set of values of why this save was performed? (AutoSave, ToOCSTransitionSave, ToCSITransitionSave etc.)

  - **Data\_SaveType:long -** Predefined set of values of save type (SaveAs, Publish, Manual, OMSave etc.)

  - **Data\_SavingWithFont:bool-** Are we saving document with new embedded fonts?

  - **Data\_ScrubClonedDocumentTimeMS:long -** Time taken to remove personal information on cloned copy of document

  - **Data\_StopwatchDuration:long -** Total time for Activity

  - **Data\_TransactionType:long -** Is it Save or MergeAndSave transaction?

#### Office.PowerPoint.DocOperation.SaveAs

Collected whenever PowerPoint performs a Save As. Includes success or failure result type of save performance metrics and relevant document metadata. Failures in save can result in data loss.  Microsoft uses this data to ensure the feature is working as expected and user content is successfully being persisted.

The following fields are collected:

- **Data_AddDocTelemetryResult:long** - Does this log entry have all necessary document telemetry (Data_Doc_* fields)? If not, why?

- **Data_CppUncaughtExceptionCount:long** - Uncaught native exceptions while activity was running

- **Data_DetachedDuration:long** - Time for which Activity was detached/not running

- **Data_DstDoc_AccessMode:long** - How was this document opened (Read only | read write)

- **Data_DstDoc_AssistedReadingReasons:long** - Predefined set of values of why document was opened in assisted reading mode

- **Data_DstDoc_AsyncOpenKind:long –** Indicates whether a cached version of the new cloud document was opened and which asynchronous refresh logic was used.

- **Data_DstDoc_ChunkingType:long** - How is document stored in SharePoint

- **Data_DstDoc_EdpState:long** - Enterprise Data Protection state of document

- **Data_DstDoc_Ext:string** - Document extension

- **Data_DstDoc_Extension:string** - Document extension

- **Data_DstDoc_FileFormat:long** - Predefined set of values of format of file (more granular than extension)

- **Data_DstDoc_Fqdn:string** - Where is document stored (SharePoint.com, live.net), only available for Office 365 domains
	
- **Data_DstDoc_FqdnHash:string** - Hash of where document is stored

- **Data_DstDoc_IdentityTelemetryId:string** - Unique GUID of user

- **Data_DstDoc_IdentityUniqueId:string** - Unique identifier of identity that was used for Shared Documents action

- **Data_DstDoc_IOFlags:long** - Bitmask for various IO related flags for a given document

- **Data_DstDoc_IrmRights:long** - Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)
	
- **Data_DstDoc_IsCloudCollabEnabled:bool** - True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

- **Data_DstDoc_IsIncrementalOpen:bool** - Was document opened incrementally (new feature that opens document without needing to download entire document)

- **Data_DstDoc_IsOcsSupported:bool** - Is Document supports coauthoring using new OCS service

- **Data_DstDoc_IsOpeningOfflineCopy:bool** - verifies if document is being opened from local cache

- **Data_DstDoc_IsSyncBacked:bool** - Is document opened from folder that is using OneDrive sync back app
	
- **Data_DstDoc_Location:long** - Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

- **Data_DstDoc_LocationDetails:long** - Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

- **Data_DstDoc_NumberCoAuthors:long** - Number of coauthors at the time of opening of a document

- **Data_DstDoc_PasswordFlags:long** - Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

- **Data_DstDoc_ReadOnlyReasons:long** - Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit, etc.)

- **Data_DstDoc_ResourceIdHash:string** - Hash of resource identifier for documents stored in cloud

- **Data_DstDoc_ServerDocId:string** - immutable identifier for documents stored in cloud

- **Data_DstDoc_ServerProtocol:long** - Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

- **Data_DstDoc_ServerType:long** - Predefined set of values of type of server (SharePoint, DropBox, WOPI)

- **Data_DstDoc_ServerVersion:long** - verifies if server is based off Office14, Office15 or Office 16

- **Data_DstDoc_SessionId:long** - generated GUID that Identifies the instance of the document within the same process session

- **Data_DstDoc_SharePointServiceContext:string** - An opaque string, typically GridManagerID.FarmID. Useful for correlating client side and server-side logs

- **Data_DstDoc_SizeInBytes:long** - Document size in bytes

- **Data_DstDoc_SpecialChars:long** - Bitmask indicating special chars in the document's URL or Path

- **Data_DstDoc_StorageProviderId:string** - A string that identifies the document's storage provider, like "DropBox"

- **Data_DstDoc_StreamAvailability:long** - Predefined set of values of status of document Stream(available, permanently disabled, not available)

- **Data_DstDoc_UrlHash:string** - hash of full URL of documents stored in cloud

- **Data_DstDoc_UsedWrsDataOnOpen:bool** - true if the file was opened incrementally using pre cached WRS data on the host

- **Data_DstDoc_WopiServiceId:string** - WOPI Service identifier, e.g. "Dropbox"

- **Data_FileType:long** - Predefined set of values of internal type of file

- **Data_fLifeguarded:bool** - Was document ever lifeguarded (feature to fix document errors by themselves without prompting user)?

- **Data_FWebCreated:bool** - Does this document have WebCreator flag?

- **Data_SaveReason:long** - Predefined set of values of why this save was performed? (AutoSave, ToOCSTransitionSave, ToCSITransitionSave, etc.)

- **Data_SaveType:long** - Predefined set of values of save type (SaveAs, Publish, Manual, OMSave, etc.) 

- **Data_SrcDoc_AccessMode:long** - How was this document opened (Read only | read write)

- **Data_SrcDoc_AssistedReadingReasons:long** - Predefined set of values of why document was opened in assisted reading mode

- **Data_SrcDoc_AsyncOpenKind:long –** Indicates whether a cached version of the original cloud document was opened and which asynchronous refresh logic was used.

- **Data_SrcDoc_ChunkingType:long** - How is document stored in SharePoint 

- **Data_SrcDoc_EdpState:long** - Enterprise Data Protection state of document

- **Data_SrcDoc_Ext:string** - Document extension

- **Data_SrcDoc_Extension:string** - Document extension

- **Data_SrcDoc_FileFormat:long** - Predefined set of values of format of file (more granular than extension)

- **Data_SrcDoc_Fqdn:string** - Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

- **Data_SrcDoc_FqdnHash:string** - Hash of where document is stored

- **Data_SrcDoc_IdentityTelemetryId:string** - Unique GUID of user

- **Data_SrcDoc_IdentityUniqueId:string** - Unique identifier of identity that was used for Shared Documents action

- **Data_SrcDoc_IOFlags:long** - Bitmask for various IO related flags for a given document

- **Data_SrcDoc_IrmRights:long** - Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

- **Data_SrcDoc_IsCloudCollabEnabled:bool** - True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

- **Data_SrcDoc_IsIncrementalOpen:bool** - Was document opened incrementally (new feature that opens document without needing to download entire document)

- **Data_SrcDoc_IsOcsSupported:bool** - Is Document supports coauthoring using new OCS service

- **Data_SrcDoc_IsOpeningOfflineCopy:bool** - verifies if document is being opened from local cache

- **Data_SrcDoc_IsSyncBacked:bool** - Is document opened from folder that is using OneDrive sync back app

- **Data_SrcDoc_Location:long** - Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

- **Data_SrcDoc_LocationDetails:long** - Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

- **Data_SrcDoc_NumberCoAuthors:long** - Number of coauthors at the time of opening of a document

- **Data_SrcDoc_PasswordFlags:long** - Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

- **Data_SrcDoc_ReadOnlyReasons:long** - Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit, etc.)

- **Data_SrcDoc_ResourceIdHash:string** - Hash of resource identifier for documents stored in cloud

- **Data_SrcDoc_ServerDocId:string** - immutable identifier for documents stored in cloud

- **Data_SrcDoc_ServerProtocol:long** - Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

- **Data_SrcDoc_ServerType:long** - Predefined set of values of type of server (SharePoint, DropBox, WOPI)

- **Data_SrcDoc_ServerVersion:long** - verifies if server is based off Office14, Office15 or Office 16Data_SrcDoc_SessionId:long generated GUID that Identifies the instance of the document within the same process session

- **Data_SrcDoc_SharePointServiceContext:string** - An opaque string, typically GridManagerID.FarmID. Useful for correlating client side and server-side logs

- **Data_SrcDoc_SizeInBytes:long** - Document size in bytes

- **Data_SrcDoc_SpecialChars:long** - Bitmask indicating special chars in the document's URL or Path

- **Data_SrcDoc_StorageProviderId:string** - A string that identifies the document's storage provider, like "DropBox"

- **Data_SrcDoc_StreamAvailability:long** - Predefined set of values of status of document Stream(available, permanently disabled, not available)

- **Data_SrcDoc_UrlHash:string** - hash of full URL of documents stored in cloud

- **Data_SrcDoc_UsedWrsDataOnOpen:bool** - true if the file was opened incrementally using pre cached WRS data on the host

- **Data_SrcDoc_WopiServiceId:string** - WOPI Service identifier, e.g. "Dropbox"

- **Data_StopwatchDuration:long** - Total time for Activity

- **Data_TypeOfSaveDialog:long** - Predefined set of values of Dialog (RUN_SAVEAS_DLG,RUN_SAVEMEDIA_DLG, RUN_SAVEAS_VIDEO_DLG etc.)

- **DstDoc** - New location of document 

- **SrcDoc** - Original location of document


#### Office.PowerPoint.DocOperation.SaveLegacy

Collected whenever PowerPoint performs a save using the legacy code path. Includes success or failure result type of save performance metrics and relevant document metadata.  Failures in save can result in data loss.  Microsoft uses this data to ensure the feature is working as expected and user content is successfully being persisted.

The following fields are collected:

- **Data_AddDocTelemetryResult:long** - Does this log entry have all necessary document telemetry (Data_Doc_* fields)? If not, why?

- **Data_CppUncaughtExceptionCount:long** - Uncaught native exceptions while activity was running

- **Data_DetachedDuration:long** - Time for which Activity was detached/not running

- **Data_Doc_AccessMode:long** - How was this document opened (Read only | read write)

- **Data_Doc_AssistedReadingReasons:long** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind:long –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType:long** - How is document stored in SharePoint

- **Data_Doc_EdpState:long** - Enterprise Data Protection state of document

- **Data_Doc_Ext:string** - Document extension

- **Data_Doc_Extension:string** - Document extension

- **Data_Doc_FileFormat:long** - Predefined set of values of format of file (more granular than extension)

- **Data_Doc_Fqdn:string** - Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

- **Data_Doc_FqdnHash:string** - Hash of where document is stored

- **Data_Doc_IdentityTelemetryId:string** - Unique GUID of user

- **Data_Doc_IdentityUniqueId:string** - Unique identifier of identity that was used for Shared Documents action

- **Data_Doc_IOFlags:long** - Bitmask for various IO related flags for a given document

- **Data_Doc_IrmRights:long** - Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

- **Data_Doc_IsCloudCollabEnabled:bool** - True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

- **Data_Doc_IsIncrementalOpen:bool** - Was document opened incrementally (new feature that opens document without needing to download entire document)

- **Data_Doc_IsOcsSupported:bool** - Is Document supports coauthoring using new OCS service

- **Data_Doc_IsOpeningOfflineCopy:bool** - verifies if document is being opened from local cache

- **Data_Doc_IsSyncBacked:bool** - Is document opened from folder that is using OneDrive sync back app

- **Data_Doc_Location:long** - Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

- **Data_Doc_LocationDetails:long** - Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

- **Data_Doc_NumberCoAuthors:long** - Number of coauthors at the time of opening of a document

- **Data_Doc_PasswordFlags:long** - Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

- **Data_Doc_ReadOnlyReasons:long** - Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit, etc.)

- **Data_Doc_ResourceIdHash:string** - Hash of resource identifier for documents stored in cloud

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId:string** - immutable identifier for documents stored in cloud

- **Data_Doc_ServerProtocol:long** - Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

- **Data_Doc_ServerType:long** - Predefined set of values of type of server (SharePoint, DropBox, WOPI) 

- **Data_Doc_ServerVersion:long** - verifies if server is based off Office14, Office15 or Office 16

- **Data_Doc_SessionId:long** - generated GUID that Identifies the instance of the document within the same process session

- **Data_Doc_SharePointServiceContext:string** - An opaque string, typically GridManagerID.FarmID. Useful for correlating client side and server-side logs

- **Data_Doc_SizeInBytes:long** - Document size in bytes

- **Data_Doc_SpecialChars:long** - Bitmask indicating special chars in the document's URL or Path

- **Data_Doc_StorageProviderId:string** - A string that identifies the document's storage provider, like "DropBox"

- **Data_Doc_StreamAvailability:long** - Predefined set of values of status of document Stream(available, permanently disabled, not available)

- **Data_Doc_UrlHash:string** - hash of full URL of documents stored in cloud

- **Data_Doc_UsedWrsDataOnOpen:bool** - true if the file was opened incrementally using pre cached WRS data on the host

- **Data_Doc_WopiServiceId:string** - WOPI Service identifier, e.g. "Dropbox"

- **Data_DstDoc_AccessMode:long** - How was this document opened (Read only | read write)

- **Data_DstDoc_AssistedReadingReasons:long** - Predefined set of values of why document was opened in assisted reading mode

- **Data_DstDoc_AsyncOpenKind:long –** Indicates whether a cached version of the new cloud document was opened and which asynchronous refresh logic was used.

- **Data_DstDoc_ChunkingType:long** - How is document stored in SharePoint

- **Data_DstDoc_EdpState:long** - Enterprise Data Protection state of document

- **Data_DstDoc_Ext:string** - Document extension

- **Data_DstDoc_Extension:string** - Document extension

- **Data_DstDoc_FileFormat:long** - Predefined set of values of format of file (more granular than extension)

- **Data_DstDoc_Fqdn:string** - Where is document stored (SharePoint.com, live.net), only available for Office 365 domains
	
- **Data_DstDoc_FqdnHash:string** - Hash of where document is stored

- **Data_DstDoc_IdentityTelemetryId:string** - Unique GUID of user

- **Data_DstDoc_IdentityUniqueId:string** - Unique identifier of identity that was used for Shared Documents action

- **Data_DstDoc_IOFlags:long** - Bitmask for various IO related flags for a given document

- **Data_DstDoc_IrmRights:long** - Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

- **Data_DstDoc_IsCloudCollabEnabled:bool** - True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

- **Data_DstDoc_IsIncrementalOpen:bool** - Was document opened incrementally (new feature that opens document without needing to download entire document)

- **Data_DstDoc_IsOcsSupported:bool** - Is Document supports coauthoring using new OCS service

- **Data_DstDoc_IsOpeningOfflineCopy:bool** - verifies if document is being opened from local cache

- **Data_DstDoc_IsSyncBacked:bool** - Is document opened from folder that is using OneDrive sync back app

- **Data_DstDoc_Location:long** - Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

- **Data_DstDoc_LocationDetails:long** - Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures etc.)

- **Data_DstDoc_NumberCoAuthors:long** - Number of coauthors at the time of opening of a document

- **Data_DstDoc_PasswordFlags:long** - Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

- **Data_DstDoc_ReadOnlyReasons:long** - Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit etc.)

- **Data_DstDoc_ResourceIdHash:string** - Hash of resource identifier for documents stored in cloud

- **Data_DstDoc_ServerDocId:string** - immutable identifier for documents stored in cloud

- **Data_DstDoc_ServerProtocol:long** - Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

- **Data_DstDoc_ServerType:long** - Predefined set of values of type of server (SharePoint, DropBox, WOPI)

- **Data_DstDoc_ServerVersion:long** - verifies if server is based off Office14, Office15 or Office 16

- **Data_DstDoc_SessionId:long** - generated GUID that Identifies the instance of the document within the same process session

- **Data_DstDoc_SharePointServiceContext:string** - An opaque string, typically GridManagerID.FarmID. Useful for correlating client side and server-side logs

- **Data_DstDoc_SizeInBytes:long** - Document size in bytes

- **Data_DstDoc_SpecialChars:long** - Bitmask indicating special chars in the document's URL or Path

- **Data_DstDoc_StorageProviderId:string** - A string that identifies the document's storage provider, like "DropBox"

- **Data_DstDoc_StreamAvailability:long** - Predefined set of values of status of document Stream(available, permanently disabled, not available)

- **Data_DstDoc_UrlHash:string** - hash of full URL of documents stored in cloud

- **Data_DstDoc_UsedWrsDataOnOpen:bool** - true if the file was opened incrementally using pre cached WRS data on the host

- **Data_DstDoc_WopiServiceId:string** - WOPI Service identifier, e.g. "Dropbox"

- **Data_FileType:long** - Predefined set of values of internal type of file

- **Data_fLifeguarded:bool** - Was document ever lifeguarded (feature to fix document errors by themselves without prompting user)?

- **Data_SaveReason:long** - Predefined set of values of why this save was performed? (AutoSave, ToOCSTransitionSave, ToCSITransitionSave etc.)

- **Data_SaveType:long** - Predefined set of values of save type (SaveAs, Publish, Manual, OMSave etc.)

- **Data_SrcDoc_AccessMode:long** - How was this document opened (Read only | read write)

- **Data_SrcDoc_AssistedReadingReasons:long** - Predefined set of values of why document was opened in assisted reading mode

- **Data_SrcDoc_AsyncOpenKind:long –** Indicates whether a cached version of the original cloud document was opened and which asynchronous refresh logic was used.

- **Data_SrcDoc_ChunkingType:long** - How is document stored in SharePoint

- **Data_SrcDoc_EdpState:long** - Enterprise Data Protection state of document

- **Data_SrcDoc_Ext:string** - Document extension

- **Data_SrcDoc_Extension:string** - Document extension

- **Data_SrcDoc_FileFormat:long** - Predefined set of values of format of file (more granular than extension)

- **Data_SrcDoc_Fqdn:string** - Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

- **Data_SrcDoc_FqdnHash:string** - Hash of where document is stored 

- **Data_SrcDoc_IdentityTelemetryId:string** - Unique GUID of user

- **Data_SrcDoc_IdentityUniqueId:string** - Unique identifier of identity that was used for Shared Documents action

- **Data_SrcDoc_IOFlags:long** - Bitmask for various IO related flags for a given document

- **Data_SrcDoc_IrmRights:long** - Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)
	
- **Data_SrcDoc_IsCloudCollabEnabled:bool** - True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

- **Data_SrcDoc_IsIncrementalOpen:bool** - Was document opened incrementally (new feature that opens document without needing to download entire document)

- **Data_SrcDoc_IsOcsSupported:bool** - Is Document supports coauthoring using new OCS service

- **Data_SrcDoc_IsOpeningOfflineCopy:bool** - verifies if document is being opened from local cache

- **Data_SrcDoc_IsSyncBacked:bool** - Is document opened from folder that is using OneDrive sync back app

- **Data_SrcDoc_Location:long** - Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

- **Data_SrcDoc_LocationDetails:long** - Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures, etc.)

- **Data_SrcDoc_NumberCoAuthors:long** - Number of coauthors at the time of opening of a document

- **Data_SrcDoc_PasswordFlags:long** - Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

- **Data_SrcDoc_ReadOnlyReasons:long** - Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit, etc.)

- **Data_SrcDoc_ResourceIdHash:string** - Hash of resource identifier for documents stored in cloud

- **Data_SrcDoc_ServerDocId:string** - immutable identifier for documents stored in cloud

- **Data_SrcDoc_ServerProtocol:long** - Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

- **Data_SrcDoc_ServerType:long** - Predefined set of values of type of server (SharePoint, DropBox, WOPI)

- **Data_SrcDoc_ServerVersion:long** - verifies if server is based off Office14, Office15 or Office 16

- **Data_SrcDoc_SessionId:long** - generated GUID that Identifies the instance of the document within the same process session

- **Data_SrcDoc_SharePointServiceContext:string** - An opaque string, typically GridManagerID.FarmID. Useful for correlating client side and server-side logs

- **Data_SrcDoc_SizeInBytes:long** - Document size in bytes

- **Data_SrcDoc_SpecialChars:long** - Bitmask indicating special chars in the document's URL or Path

- **Data_SrcDoc_StorageProviderId:string** - A string that identifies the document's storage provider, like "DropBox"

- **Data_SrcDoc_StreamAvailability:long** - Predefined set of values of status of document Stream(available, permanently disabled, not available)

- **Data_SrcDoc_UrlHash:string** - hash of full URL of documents stored in cloud

- **Data_SrcDoc_UsedWrsDataOnOpen:bool** - true if the file was opened incrementally using pre cached WRS data on the host

- **Data_SrcDoc_WopiServiceId:string** - WOPI Service identifier, e.g. "Dropbox"

- **Data_StopwatchDuration:long** - Total time for Activity

- **Data_TypeOfSaveDialog:long** - Predefined set of values of Dialog (RUN_SAVEAS_DLG, RUN_SAVEMEDIA_DLG, RUN_SAVEAS_VIDEO_DLG etc.)

- **Doc** - current document for Save

- **DstDoc** - New location of document (in case of SaveAs)

- **SrcDoc** - Original location of document (in case of SaveAs)

#### Office.PowerPoint.PPT.Mac.Shell.PrintInfo

Collected whenever an export PDF operation has completed and contains information about the success of the operation. This information is critical to identify the success of export PDF operations for our application.

The following fields are collected:

- **Data_ExportAsPDFSucceed** - Boolean indicating if exporting as PDF was a success.


#### Office.PowerPoint.PPT.Shared.SlideShow.Failure

Collecting failures during slide show as a key feature for PowerPoint. Microsoft is collecting when error happens during slide show to help improve user experience on slide show. Microsoft uses this data to get diagnostic information about where the error happens while user is using slide show.

The following fields are collected:

- **CountOArtErrors** - total number of OArt errors

- **CountOtherErrors** - total number of other errors

- **CountPPTErrors** - total number of PPT errors

- **CountSlideShowErrors** - total number of slide show errors

- **FirstOArtError** - first error happened in OArt

- **FirstOtherError** - first error happened in other area

- **FirstPPTError** - first error happened in PPT

- **FirstSlideShowError** - first error happened in slide show

	
#### Office.PowerPoint.RunPrintOperation

Collected whenever a print PDF operation has completed and contains information about the layout type, use of slide numbers, as well as the success of the operation. This information is critical to identify the success of print PDF operations for our application.

The following fields are collected:

- **Data_PrintWithSlideNumbers** - Boolean indicating if the user is printing with slide numbers.

- **Data_SavePrintLayoutType** - The print layout type at the time of starting the print or export operation.

- **Data_Success** -  Boolean indicating if printing was a success.


#### Office.Project.ProjectFileSave

Project saves a file. This event indicates a Project save. It allows Microsoft to measure success of Project saving a file which is important to avoid document data loss.

The following fields are collected:

  - **Data\_TriggerTime** - time of save

  - **Data\_FileType** - type of file the project is being saved as
 
#### Office.Session.Activity.Start

Allows us to know when a data streamer session has started.  Used for feature health and monitoring. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Activity_Name** - Name of the activity “Session”

- **Activity_CV** - ID to correlate the events across the connection session

- **Activity_StartStopType** - Start

- **Activity_DateTimeTicks** - Data Time for the activity

#### Office.Session.Activity.Stop

Allows us to know when a data streamer session has stopped Used for feature health and monitoring. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Activity_Name** - Name of the activity “Session”

- **Activity_CV** - ID to correlate the events across the connection session

- **Activity_StartStopType** - Stop

- **Activity_DateTimeTicks** - Data Time for the activity

#### Office.StreamDevice.Activity.Start

Allows us to know if start streaming data source is successful.   Used for feature health and monitoring. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Datasource_Type** - Serial device, or App Service information

- **DataSource_Name** - Name of connected data source

- **Activity_Name** - Name of the activity “StreamDeviceData” or “StreamFileData”

- **Activity_CV** - ID to correlate the events across the connection session

- **Activity_StartStopType** - Start

- **Activity_DateTimeTicks** - Data Time for the activity

#### Office.StreamDevice.Activity.Stop

Allows us to know if stop streaming data source is successful.   Used for feature health and monitoring. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Datasource_Type** - Serial device, or App Service information

- **DataSource_Name** - Name of connected data source

- **Activity_Name** - Name of the activity “StreamDeviceData” or “StreamFileData”

- **Activity_CV** - ID to correlate the events across the connection session

- **Activity_StartStopType** - Stop

- **Activity_DateTimeTicks** - Data Time for the activity

#### Office.TargetedMessaging.ABExperimentMessageTrigger

Tracks the number of users receiving BizBar and Dynamic Canvas messages from TargetedMessagingService (TMS). This data is critical to understand what messages users are getting and on what surface so that we can ensure they are not missing any messages that may be critical to their continued use of the product. Also needed to accurately measure the success of our experiments and campaigns run through TMS.

The following fields are collected:

  - **Data\_Surface** – Name of the surface that this service delivered message is meant for

  - **Data\_Flight** – ECS/CT Flight identifier that was used to deliver this message

  - **Data\_CampaignId** – identifier of the campaign that this message is part of

  - **Data\_MessageId** – identifier of this service delivered message

  - **Data\_TransactionId** – identifier of this transaction with the service

  - **Data\_TriggerPoint** – The step in which this event was logged (message received vs message displayed)

#### Office.Text.FontPickerFontSelected.Win32

This event indicates whether the downloaded font was rendered correctly. Used to indicate success or failure of Font Download.

The following fields are collected:

  - **Font name (Data\_Font)** - name of font picked in font picker

  - **User click (Data\_FClick)** - if user used mouse to select item

#### Office.Text.ResourceClient.RequestResourceInternal

This event indicates whether the font was downloaded correctly. Used to indicate success or failure of rendering the downloaded font.

The following fields are collected:

  - **Data\_FontToken** - resource file name will be saved as

  - **Data\_HTTPResult** - result of the HTTP request

  - **Data\_HTTPStatusCode** - HTTP code returned from the HTTP request

  - **Data\_isInternetOn** - If we had connection when trying to retrieve the resource

  - **Data\_RequestUrl** - URL of the CDN resource we’re trying to retrieve



#### Office.Translator.DocumentTranslated

Collects success or failure of a full document translation a user trigger in the Translator SDX. This is critical to evaluate the health of the translation feature and react to any outages that might occur. Monitor the health of the "Translate Document" scenario in Word.

The following fields are collected:

- **Data.actionSource** - How was the translate selection triggered

- **Data.bodyBackgroundColor** - Office theme container background color

- **Data.bodyForegroundColor** - Office theme container foreground color

- **Data.browserLang** - Browser current display language

- **Data.browserOnline** - Obsolete

- **Data.browserPlatform** - Browser platform

- **Data.browserUserAgent** - Browser user agent

- **Data.colorDepth** - System color depth

- **Data.contentLanguage** - Detected language of the content to translate

- **Data.controlBackgroundColor** - Office theme control background color

- **Data.controlForegroundColor** - Office theme control foreground color

- **Data.correlationId** - Unique identifier of the request sent to the service

- **Data.crossSessionId** - Unique identifier of the user

- **Data.crossSessionStartTime** - UTC timestamp of when the translation session started

- **Data.currentTime** - UTC timestamp of when this telemetry message was sent

- **Data.displayLanguage** - Office display language

- **Data.documentSourceLang** - Document content language

- **Data.documentTargetLang** - Language document will be translated to

- **Data.environment** - Service environment the request is sent to

- **Data.errorMessage** - Error message reported by the service

- **Data.eventActionType** - Type of telemetry event

- **Data.eventTagId** - Unique identifier of the line of code that produced this telemetry message.

- **Data.flights** - Enabled flights

- **Data.fileSize** - Size of Word file to translate

- **Data.fileSource** - Where is the Word file hosted (offline, online)

- **Data.fileType** - Word file extension

- **Data.innerHeight"** - Side pane container height

- **Data.innerWidth"** - Side pane container width

- **Data.lookupSourceLang** - Not used for document translation

- **Data.lookupTargetLang** - Not used for document translation

- **Data.officeHost** - Office application hosting the side pane

- **Data.officeLocale** - Office user language

- **Data.officeMachineId** - Device Unique identifier

- **Data.officePlatform** - Device platform

- **Data.officeSessionId** - Office session identifier

- **Data.officeUserId** - Office user unique identifier

- **Data.officeVersion** - Office version

- **Data.pageXOffset** - Side pane horizontal scroll position from the left side of the pane

- **Data.pageYOffset** - Side pane vertical scroll position from the top side of the pane

- **Data.pixelDepth** - Screen color resolution

- **Data.responseCode** - Request response code from the service

- **Data.responseTime** - Request elapsed time 

- **Data.resultType** - Request result

- **Data.screenHeight** - Screen height in pixels

- **Data.screenLeft** - Horizontal coordinate of the window relative to the screen

- **Data.screenTop** - Vertical coordinate of the window relative to the screen

- **Data.screenWidth** - Screen width in pixels

- **Data.selectedTab** - Which tab is selected Selection or Document

- **Data.serverUrl** - Translation service URL

- **Data.sessionId** - Side pane session identifier

- **Data.sessionStartTime** - UTC Timestamp of when the translation session started

- **Data.sourceTextHash** - Hash of text to translate

- **Data.sourceTextLength** - Text to translate length

- **Data.sourceTextWords** - Number of words in the text to translate

- **Data.warningMessage** - Warning message reported by the service


#### Office.Translator.TextTranslated

Collects success or failure of a selection translation that a user action triggers in the Translator SDX. This is critical to evaluate the health of the translation feature and react to any outages that might occur. Used to monitor the health of the "Translate Selection" scenario in Excel, PowerPoint, Word.

The following fields are collected:

- **Data.actionSource** - How was the translate selection triggered

- **Data.bodyBackgroundColor** - Office theme container background color

- **Data.bodyForegroundColor** - Office theme container foreground color

- **Data.browserLang** - Browser current display language

- **Data.browserOnline** - Obsolete

- **Data.browserPlatform** - Browser platform

- **Data.browserUserAgent** - Browser user agent

- **Data.colorDepth** - System color depth

- **Data.contentLanguage** - Detected language of the content to translate

- **Data.controlBackgroundColor** - Office theme control background color

- **Data.controlForegroundColor** - Office theme control foreground color

- **Data.correlationId** - Unique identifier of the request sent to the service

- **Data.crossSessionId** - Unique identifier of the user

- **Data.crossSessionStartTime** - UTC timestamp of when the translation session started

- **Data.currentTime** - UTC timestamp of when this telemetry message was sent

- **Data.displayLanguage** - Office display language

- **Data.documentSourceLang** - Not used for selection

- **Data.documentTargetLang** - Nor used for translation selection

- **Data.environment** - Service environment the request is sent to

- **Data.errorMessage** - Error message reported by the service

- **Data.eventActionType** - Type of telemetry event

- **Data.eventTagId"** - Unique identifier of the line of code that produced this telemetry message

- **Data.flights** - Enabled flights

- **Data.innerHeight** - Side pane container height

- **Data.innerWidth** - Side pane container width

- **Data.lookupSourceLang** - Language of the currently selected text

- **Data.lookupTargetLang** - Language currently selected text will be translated to

- **Data.officeHost** - Office application hosting the side pane

- **Data.officeLocale** - Office user language

- **Data.officeMachineId** - Device Unique identifier

- **Data.officePlatform** - Device platform

- **Data.officeSessionId** - Office session identifier

- **Data.officeUserId** - Office user unique identifier

- **Data.officeVersion** - Office version

- **Data.pageXOffset** - Side pane horizontal scroll position from the left side of the pane

- **Data.pageYOffset** - Side pane vertical scroll position from the top side of the pane

- **Data.pixelDepth** - Screen color resolution

- **Data.responseCode** - Request response code from the service

- **Data.responseTime** - Request elapsed time

- **Data.resultType** - Request result

- **Data.screenHeight** - Screen height in pixels

- **Data.screenLeft** - Horizontal coordinate of the window relative to the screen

- **Data.screenTop** - Vertical coordinate of the window relative to the screen

- **Data.screenWidth** - Screen width in pixels

- **Data.selectedTab** - Which tab is selected Selection or Document

- **Data.serverUrl** - Translation service URL

- **Data.sessionId** - Side pane session identifier

- **Data.sessionStartTime** - UTC Timestamp of when the translation session started

- **Data.sourceTextHash** - Hash of text to translate

- **Data.sourceTextLength** - Text to translate length

- **Data.sourceTextWords** - Number of words in the text to translate

- **Data.warningMessage** - Warning message reported by the service


#### Office.Visio.Shared.FeatureExperimentation

Tracks feature flighting for users. This event helps us determines success or failure of feature flights.

The following fields are collected:

  - **Data\_Enable:bool**- true indicate the feature is enabled for current user

  - **Data\_Feature:string** - name of the feature

  - **Data\_Flighted:bool** - true indicates the feature is enabled

  - **Data\_Licensed:bool** - true indicates the feature is under licensing check

  - **Data\_Subscriber:bool** - true indicates the user has subscription license

#### Office.Visio.Shared.RefreshSmartDiagram

Captures diagram refresh failures when file is created through DV. This helps us debug the failures and issues in data refresh in a DV diagram.

The following fields are collected:

  - **Data\_ConnectorsBasedOnSequence:bool** - true if the refreshed diagram was originally created using connector based on sequence" option

  - **Data\_DialogError**:**string** - error during refreshing smart diagram

  - **Data\_FileError:string** - error string when connected Excel file is invalid

  - **Data\_OverwriteSelected**:**bool** - true if user selected overwrite diagram option during refresh

  - **Data\_WarningShown**:**bool** - true if there was any warning shown to user during data refresh

#### Office.Visio.Shared.WritebackToExcel

Captures Excel write back failures when file is created through DV. This helps us debug the failures and issues in writing back data to Excel in a DV diagram.

The following fields are collected:

  - **Data\_ConnectorsBasedOnSequence:bool** - true means connectors are created based on sequence settings

  - **Data\_DataSourceType:string** - This filed indicates whether diagram is created from  "Table" or "CustomRange"

  - **Data\_DialogError:string** - Custom Error type while creating smart diagram through Excel

  - **Data\_NoOfShapesAdded:int** - Number of shapes added during writeback to Excel functionality

  - **Data\_NoOfShapesDeleted:int** - Number of shapes deleted during writeback to Excel functionality

  - **Data\_OverwriteSelected:bool** - true indicate user selected overwrite data option

  - **Data\_SourceDataModified:bool** - true indicates source data is modified

  - **Data\_WarningShown:bool** - true means data update warning shown to the user

  - **Data\_WarningShownBecauseOfPresenceOfFormula:bool** - true indicates warning shown to the user because of presence of formula in Excel

  - **Data\_WarningShownToAddNextStepID:bool** - true indicates warning show to the user because next step Identifier missing in Excel

  - **Data\_WarningShownToConvertToTable:bool** - true indicates warning shown to the user to convert Excel data to table format


#### Office.Word.Experimentation.DocumentStatsOnCloseAndSuspend

This event logs document statistics for each document when Office Word is closed or suspended.  The event is used to correlate document edits, size, etc. with document-save, document-share, and document online collaboration errors.

The following fields are collected:

- **Data_BkmkRefCount** - Number of bookmark references in the document

- **Data_CharacterCount** - Number of characters in the document

- **Data_CharactersWithSpaceCount** - Number of characters and spaces in the document

- **Data_ChartCount** - Number of charts in the document

- **Data_CitationCount** - Number of citations in the document

- **Data_DocumentLocation** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_ETW_TrackbackTag** - Identifies the place in code where this event was fired from (Close or Suspend)

- **Data_EndnoteDocCount** - Number of endnotes in the document

- **Data_FootnoteDocCount** - Number of footnotes in the document

- **Data_HasBibliography** - Indicates whether the document contains bibliography

- **Data_HasHeader** - Indicates whether the document contains a header

- **Data_IsImeUsed** - Indicates whether Input Method Editor been was used in the document

- **Data_IsPageCountInProgress** - Indicates whether page count is currently in progress for the document.
	
- **Data_IsTouchUsed** - Indicates whether touch input was used in the document

- **Data_IsTrackChangesOn** - Indicates whether track-changes was on for the document

- **Data_LineCount** - Number of lines in the document

- **Data_MainPdod** - The document identifier in Office Word process.

- **Data_PageCount** - Number of pages in the document

- **Data_PageNumberFieldCount** - Number of page number fields in the document

- **Data_ParagraphCount** - Number of paragraphs in the document

- **Data_PicCount** - Number of pictures in the document

- **Data_RsidCount** - Number of revisions save identifier in the document

- **Data_TocCount** - Number of table of contents in the document

- **Data_UrlHash** - One-way hash to create a naïve document identifier

- **Data_UserActionID** - this data field is not used (the value is always 0).

- **Data_UserActionName** - always “DocumentStatsOnCloseAndSuspend”

- **Data_UserInteractionTimeMsec** - Number of milliseconds that the user was actively interacting with the document
	
- **Data_WordCount** - Number of words in document

#### Office.Word.FileNew.CreateNewFile

This event indicates that a new document is created in Office Word and tracks success or failure of the operation. The event is used to monitor that new document creation is working as expected. It is also used to calculated monthly active users/devices and cloud reliability metrics.

The following fields are collected:

  - **Data\_DirtyState** - whether the document was created in a dirty state (with changes that need to be saved)

  - **Data\_ErrorID** - error identifier in case of operation failure

  - **Data\_MainPdod** - The document identifier during this process session

  - **Data\_UsesCustomTemplate** - indicates whether the document was created from a custom template

#### Office.Word.FileOpen.UserInitiatedOpen 

This event indicates Office Word opens a document by user initiation instead of by Office Word programmatically. It also contains critical file open performance data and is an app start event from user perspective.  The event monitors whether file-open is working as expected. It is also used to calculated monthly active users/devices, and cloud reliability metrics. 
 
The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics. 

- **Data_BytesAsynchronous** - Number of bytes (compressed) that we believe we can open the file without if we get them before the user wants to start editing or maybe saving. 

- **Data_BytesAsynchronousWithWork** - Number of bytes (compressed) that we might be able to open the file without but would require significant code investments to make it happen 

- **Data_BytesSynchronous** - Number of bytes (compressed) that we must have before we can start opening the file 

- **Data_BytesUnknown** - Number of bytes in document parts that we don’t expect to find. 

- **Data_Doc_AccessMode** - Document is read only/editable 

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode 

- **Data_Doc_ChunkingType** - Units used for incremental document open 

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document 

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx, etc.) 

- **Data_Doc_FileFormat** - File format protocol version 

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name 

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name 

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open 

- **Data_Doc_InitializationScenario** - Records how the document was opened 

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options 

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user 

- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened 

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service 

- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened 

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer 

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint) 

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document 

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session 

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set 

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only 

- **Data_Doc_ResourceIdHash** - An anonymized document Identifier used to diagnose problems 

- **Data_Doc_ServerDocId** - An immutable anonymized document Identifier used to diagnose problems 

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service 

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.) 

- **Data_Doc_ServerVersion** - the server version offering the service 

- **Data_Doc_SessionId** - the server version offering the service 

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests 

- **Data_Doc_SizeInBytes** - Indicator of document size 

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path 

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled 

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based) 

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier 

- **Data_Doc_WopiServiceId** - Contains unique identifier of WOPI service provider 

- **Data_EditorDisablingRename** - Identifier of the first editor that caused for rename to be disabled 

- **Data_EditorsCount** - Number of editors in the document 

- **Data_ForceReadWriteReason** - Integer value representing the reason why the file was forced into read/write mode 

- **Data_FSucceededAfterRecoverableFailure** - Indicates that open succeeded after repairing a failure while opening the document 

- **Data_LastLoggedTag** - Unique tag for code call site used to identify when we try to fail the open twice (used for data quality diagnostics) 

- **Data_LinkStyles** - Indicates whether we are linking to the template styles 

- **Data_MainPdod** - The document identifier in Office Word process 

- **Data_Measurements** - Encoded string containing the time breakdown of the different parts of open. Used to diagnose open performance. 

- **Data_MoveDisabledReason** - Error that is disabling move for the document 

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled 

- **Data_OpenInitiateKind** – Type of the scenario where users started this file-open operation. 

- **Data_PartsUnknown** - The number of document parts that we couldn’t get data for 

- **Data_RecoverableFailureInitiationLocationTag** - Unique tag for code call site used to identify the place in code where we attempt to fix the file before opening it 

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document 

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled 

- **Data_SecondaryTag** - Unique tag for code call site used to add additional failure data for open. 

- **Data_TemplateFormat** - File format of the template that the document is based on. 

- **Data_UsesNormal** - Indicates whether the open document is based on the normal template. 

- **Data_VerboseMeasurements** - Encoded string containing the detailed time breakdown of the different parts of open.  Used to measure performance, only enabled for internal rings. 



#### Office.Word.FileSave.ActCmdGosubSaveAs

This event indicates that a user is saving their changes to a new document. The event monitors whether saving to a new document is working as expected. It is also used to calculated monthly active users/devices and cloud reliability metrics.

The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics.

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_InitializationScenario** - Records how the document was opened

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user
	
- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service
	
- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document identifier used to diagnose problems

- **Data_Doc_ServerProtocol** - The protocol version used to communicate with the service

- **Data_Doc_ServerType** - The type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

- **Data_Doc_ServerVersion** - The server version offering the service

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_EditorDisablingRename** - identifier of the first editor that caused rename to be disabled

- **Data_EditorsCount** - Number of editors in the document

- **Data_LastLoggedTag** - Unique tag for code call site used to identify when we fail to try the save twice (used for data quality diagnostics)

- **Data_MoveDisabledReason** - Error that is disabling move for the document

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_RenameDisabledReason** - Error that is causing rename to be disabled for the document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

	
#### Office.Word.FileSave.ActFConfirmSaveDocCoreAutoRecoverySave

This event indicates Office Word saves an auto-recovery document that has not been saved before. It allows Microsoft to detect errors in auto-recovery which is important for document data safety.  The event monitors whether auto-recovery-save is working as expected. It is also used to calculated monthly active users/devices and cloud reliability metrics.

The following fields are collected:

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.
	
- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_InitializationScenario** - Records how the document was opened

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service
	
- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document identifier used to diagnose problems

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

- **Data_Doc_ServerVersion** - the server version offering the service

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_Doc_WopiServiceId** - Contains unique identifier of WOPI service provider

- **Data_FailureClass** - Integer representing the failure class for Office Collaboration Services (OCS) transition failures
	
- **Data_MainPdod** - The document identifier in Office Word process.

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_OCSSyncbackSaveStarted** - Flag that indicates that this save is related to sync back save

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

- **Data_SaveInitiateKind** - Integer that indicates how the save was initiated

- **Data_SrcDocIsUnnamedOrNew** - Indicates whether the document we are saving is new


#### Office.Word.FileSave.ActFConfirmSaveDocCoreQuerySave

This event indicates Office Word prompts the user to save changes when it tries to close the document. It allows Microsoft to monitor whether save-at-quit works as expected to avoid document data loss. The event monitors whether save-at-quit is working as expected. It is also used to calculated monthly active users/devices and cloud reliability metrics.

The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics.

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_InitializationScenario** - Records how the document was opened

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service
	
- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document identifier used to diagnose problems

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

- **Data_Doc_ServerVersion** - the server version offering the service

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_Doc_WopiServiceId** - Contains unique identifier of WOPI service provider

- **Data_DstDoc_AccessMode** - Destination Document is read only/editable

- **Data_DstDoc_EdpState** -Electronic Data Protection setting for the destination document-

- **Data_DstDoc_Ext** - Document extension (docx/xlsb/pptx, etc.) for the destination document

- **Data_DstDoc_FileFormat** - File format protocol version for the destination document

- **Data_DstDoc_Location** - Indicates which service will provide storage for destination document (OneDrive, File Server, SharePoint etc.)

- **Data_DstDoc_LocationDetails** - Indicates which local Known Folder stored the destination document

- **Data_DstDoc_SessionId** - Identifies a specific document edit session within the full session

- **Data_DstDoc_UrlHash** - One-way hash to create a naïve document identifier for the destination document

- **Data_FailureClass** - Integer representing the failure class for OCS transition failures

- **Data_LocationPickerSaveStatus** - Integer value that indicates the action that triggered the save from the save on exit dialog

- **Data_MainPdod** - The document identifier in Office Word process.

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_OCSSyncbackSaveStarted** - Flag that indicates that this save is related to sync back save 

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

- **Data_SaveInitiateKind** - Integer that indicates how the save was initiated

- **Data_SrcDocIsUnnamedOrNew** - Indicates whether the document we are saving is new


#### Office.Word.FileSave.SaveAsSaveFile

This event indicates Office Word saves a document into a new document. It allows Microsoft to detect errors in save-as which is important to avoid document data loss. The event monitors whether save-as is working as expected. It is also used to calculated monthly active users/devices and cloud reliability metrics.

The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics.

- **Data_AddDocTelemResDst** - Reports whether we were able to properly populate other document telemetry related values in the event for the destination document. Used for data quality diagnostics.

- **Data_AddDocTelemResSrc** - Reports whether we were able to properly populate other document telemetry related values in the event for the source document. Used for data quality diagnostics.

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service

- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document identifier used to diagnose problems

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

- **Data_Doc_ServerVersion** - the server version offering the service

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_DstDoc_AccessMode** - Destination Document is read only/editable

- **Data_DstDoc_AssistedReadingReasons** - Predefined set of values of why the destination document was opened in assisted reading mode

- **Data_DstDoc_AsyncOpenKind –** Indicates whether a cached version of the new cloud document was opened and which asynchronous refresh logic was used.
	
- **Data_DstDoc_ChunkingType** - Units used for incremental document open

- **Data_DstDoc_EdpState** - Electronic Data Protection setting for the destination document

- **Data_DstDoc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_DstDoc_FileFormat** - File format protocol version

- **Data_DstDoc_Fqdn** - OneDrive or SharePoint Online Domain Name for the destination document

- **Data_DstDoc_FqdnHash** - One-way hash of customer identifiable domain name for the destination document

- **Data_DstDoc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_DstDoc_InitializationScenario** - Records how the destination document was opened

- **Data_DstDoc_IOFlags** - Reports on the cached flags used to set open request options for the destination document
	
- **Data_DstDoc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the destination document/user

- **Data_DstDoc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_DstDoc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service

- **Data_DstDoc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_DstDoc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_DstDoc_Location** - Indicates which service provided the storage for the destination document (OneDrive, File Server, SharePoint etc.)

- **Data_DstDoc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_DstDoc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_DstDoc_PasswordFlags** - Indicates read or read/write password flags set for the destination document

- **Data_DstDoc_ReadOnlyReasons** - Reasons why the destination document was opened read only 

- **Data_DstDoc_ResourceIdHash** - An anonymized document identifier used to diagnose problems

- **Data_DstDoc_ServerDocId** - An immutable anonymized document identifier used to diagnose problems

- **Data_DstDoc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_DstDoc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)
	
- **Data_DstDoc_ServerVersion** - the server version offering the service

- **Data_DstDoc_SessionId** - Identifies a specific document edit session within the full session

- **Data_DstDoc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_DstDoc_SizeInBytes** - Indicator of document size

- **Data_DstDoc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_DstDoc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_DstDoc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_DstDoc_UrlHash** - One-way hash to create a naïve document identifier for the destination document
	
- **Data_DstDoc_WopiServiceId** - Contains unique identifier of WOPI service provider

- **Data_FailureClass** - Integer representing the failure class for OCS transition failures

- **Data_LocationPickerPropagateToSaveTime,spLapsedMsec** - Measure the time, in milliseconds, that it takes for the save to trigger after getting a result from the location picker

- **Data_LocationPickerSaveStatus** - Status returned by the location picker

- **Data_MainPdod** - The document identifier in Office Word process

- **Data_MoveDisabledReason** - Error that is disabling move for the document

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

- **Data_SaveInitiateKind** - Integer that indicates how the save was initiated

- **Data_SrcDoc_AccessMode** - Source Document is read only/editable

- **Data_SrcDoc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_SrcDoc_AsyncOpenKind –** Indicates whether a cached version of the original cloud document was opened and which asynchronous refresh logic was used.

- **Data_SrcDoc_ChunkingType** - Units used for incremental document open

- **Data_SrcDoc_EdpState** - Electronic Data Protection setting for the source document

- **Data_SrcDoc_Ext** - Document extension for the source document (docx/xlsb/pptx, etc.)

- **Data_SrcDoc_FileFormat** - File format protocol version for the source document

- **Data_SrcDoc_Fqdn** - OneDrive or SharePoint Online Domain Name for the source document

- **Data_SrcDoc_FqdnHash** - One-way hash of customer identifiable domain name for the source document

- **Data_SrcDoc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_SrcDoc_InitializationScenario** - Records how the document was opened

- **Data_SrcDoc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_SrcDoc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

- **Data_SrcDoc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_SrcDoc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service

- **Data_SrcDoc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_SrcDoc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer
	
- **Data_SrcDoc_Location** - Indicates which service provided the source document (OneDrive, File Server, SharePoint, etc.)

- **Data_SrcDoc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_SrcDoc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_SrcDoc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_SrcDoc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_SrcDoc_ResourceIdHash** - An anonymized document identifier used to diagnose problems

- **Data_SrcDoc_ServerDocId** - An immutable anonymized document identifier used to diagnose problems

- **Data_SrcDoc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_SrcDoc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

- **Data_SrcDoc_ServerVersion** - the server version offering the service

- **Data_SrcDoc_SessionId** - Identifies a specific document edit session within the full session

- **Data_SrcDoc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_SrcDoc_SizeInBytes** - Indicator of document size

- **Data_SrcDoc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_SrcDoc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_SrcDoc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_SrcDoc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_SrcDoc_WopiServiceId** - Contains unique identifier of WOPI service provider

- **Data_SrcDocIsUnnamedOrNew** - Indicates whether the document we are saving is new


#### Office.Word.Word.DocumentDirtyFlagChanged

This event indicates Office Word edits a document which changes the document internal state into "dirty". It allows Microsoft to evaluate the feature health of edit-document. The event is a heartbeat of user edits. It is also used to calculated monthly active users/devices.

The following fields are collected:

  - **Data\_CollectionTime-** Timestamp of the event

  - **Data\_DocumentLocation-** type of the document location

  - **Data\_DocumentLocationDetails-** Sub-type of the document location

  - **Data\_FAlwaysSaveEnabled-** Indicates whether always-save was enabled

  - **Data\_FirstEditTime-** Timestamp of first edit

  - **Data\_NumberCoAuthors-** Number of coauthors editing the document during the session

  - **Data\_NumberOfTimesDocumentDirtied-** Number of edits made to the document

  - **Data\_Pdod-** Document identifier in Office Word process

  - **Data\_UrlHash-** Hash of the document path

  - **Data\_ViewKind-** Type of Word view


#### ParseLicenseOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when parsing licenses operation is performed. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name

- **AppInfo.Version** - Application version

- **iKey** - Logger server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.Duration** - Total time for the operation to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the operation

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result

- **RMS.VerifyCertChainDuration** - Duration time to verify certificate chain

- **RMS.VerifySignatureDuration** - Duration time to verify signature

#### StoreOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when Rights Management Service license store operation is performed. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.ContentId** - Content Id in End User License

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the operation

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.OperationName** - Operation name

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result

- **RMS.Url** - The URL of Rights Management Service Server


### *Application status and boot subtype*

Determination if specific feature events have occurred, such as start or stop, and if feature is running​.

#### DnsLookupOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when DNS information lookup operation is performed. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.Duration** - Total time for the operation to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the operation

- **RMS.HttpCall** - indicate if there is http operation

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.NoOfDomainsSearched** - The number of domains searched	

- **RMS.NoOfDomainsSkipped** - The number of domains skipped 

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result

#### GetUserOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when getting user certificates operation is performed. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name

- **AppInfo.Version** - Application version

- **iKey** - Logging service server ID

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.ContentId** - Content Id

- **RMS.Duration** - Total time for the operation to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned from the operation

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result

- **RMS.Type** - type of user info

#### HttpOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when http request operation is performed.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment
	
- **AppInfo.Name** - Application name

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.CallBackStatus** - The status of authentication call back returned result

- **RMS.CallbackTime** - The time consumed by authentication call back 

- **RMS.CorrelationId** - correlation Id of the http request

- **RMS.DataSize** - data size of the HTTP request

- **RMS.Duration** - Total time for the operation to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the operation

- **RMS.HttpCall** - indicate if there is nested http operation 

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.OperationName** - operation name

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result

- **RMS.Url** - The URL of Rights Management Service Server

- **RMS.WinhttpCallbackStatus** - The status of winhttp call back result

#### IpcCreateOauth2Token

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcCreateOauth2Token API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment
	
- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.StatusCode** - Status code of the returned result

#### Office.Extensibility.OfficeJS.Appactivated

Records information about unexpected shutdowns of Office. This allows us to identify crashes or hangs in the product so that they can be addressed.

The following fields are collected:

  - **Data\_AirspaceInitTime:integer-** time taken to initialize Airspace office component

  - **Data\_AllShapes:integer -** number of shapes in the document

  - **Data\_APIInitTime:integer -** time taken to initialize Visio API module

  - **Data\_AppSizeHeight –** Add**-**in window size’s height

  - **Data\_AppSizeWidth –** Add**-**in window size’s width

  - **Data\_AppURL -** URL of the Add in; Logs full URL for Store Add ins and URL domain for non-store Add ins

  - **Data_Doc_AsyncOpenKind:long –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data\_AuthorsCount:integer -** number of authors who edited the document in this session

  - **Data\_BackgroundPages:integer -** number of background pages in diagram

  - **Data\_BootTime:integer -** The amount of time it took to boot Visio

  - **Data\_Browser -** Browser string with information about the browser such as type, version

  - **Data\_ChildWindowMixedModeTime:integer -** time taken to enable mixed mode in Visio (Child window can have different DpiAwareness from parent window)

  - **Data\_CommentsCount:integer -** number of comments in document

  - **Data\_ConnectionCount:integer -** number of data connection in diagram

  - **Data\_ContentMgrInitTim:integer -** time taken to initialize content manager

  - **Data\_CreateMainFrameTime:integer -** Create mainframe time

  - **Data\_CreatePaletteTime:integer -** Time taken to create the global color palette

  - **Data\_DispFormatCount:integer -** number of data graphics in diagram

  - **Data\_Doc\_Ext:string -** Document extension

  - **Data\_Doc\_Fqdn:string -** Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

  - **Data\_Doc\_FqdnHash:string -** Hash of where document is stored

  - **Data\_Doc\_IsIncrementalOpen:bool-** : Was document opened incrementally (new feature that opens document without needing to download entire document)

  - **Data\_Doc\_IsOpeningOfflineCopy:bool -** Is document being opened from local cache?

  - **Data\_Doc\_IsSyncBacked:bool-** true when this is a server document that exists locally, and is synchronized with the server (e.g. through OneDrive or ODB client apps)

  - **Data\_Doc\_Location:long-** : Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

  - **Data\_Doc\_LocationDetails:long -** Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures

  - **Data\_Doc\_ResourceIdHash:string -** Hash of resource Identifier for documents stored in cloud

  - **Data_Doc_RtcType -**  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

  - **Data\_Doc\_ServerDocId:string -** immutable identifier for documents stored in cloud

  - **Data\_Doc\_SessionId:long -** generated GUID that Identifies the instance of the document within the same process session

  - **Data\_Doc\_SizeInBytes:long -** Document size in bytes

  - **Data\_Doc\_SpecialChars:long -** long Bitmask indicating special chars in the document's URL or Path

  - **Data\_Doc\_SyncBackedType -** Indicator as to the type of document (local or service based) 

  - **Data\_Doc\_UrlHash:string -** hash of full URL of documents stored in cloud

  - **Data\_DpiAwarenessTime:integer -** Time taken to enable Per Monitor Dpi Awareness

  - **Data\_DurationToCompleteInMilliseconds:double-** Duration to complete save as in millisecond

  - **Data\_ErrorCode:int -** : 0 for success, integer for failure in save

  - **Data\_FailureReason:integer -** failure reason for asynchronous save

  - **Data\_FileExtension -** File extension of diagram opened

  - **Data\_FileHasDGMaster:bool -** true when file has Data Graphics

  - **Data\_FileHasImportedData:bool -** true when file has imported data

  - **Data\_FileHasShapesLinked:bool -** true when file has linked shapes to data

  - **Data\_FileIOBytesRead:int -** total bytes read while saving

  - **Data\_FileIOBytesReadSquared:int -** squared value of Data\_FileIOBytesRead

  - **Data\_FileIOBytesWritten:int -** total bytes written while saving

  - **Data\_FileIOBytesWrittenSquared:int-** squared value of Data\_FileIOBytesWritten

  - **Data\_FilePathHash:binary** -Binary Hash of file path

  - **Data\_FilePathHash: binary** - GUID for file path

  - **Data\_FileSize -** Document size in bytes

  - **Data\_ForegroundPages:integer -** number of foreground pages in diagram

  - **Data\_ForegroundShapes:integer -** integer number of shapes in Foreground pages

  - **Data\_GdiInitTime:integer -** time taken to initialize GDI module

  - **Data\_HasCoauthUserEdit:bool -** true if document was edited in a coauthoring session

  - **Data\_HasCustomPages:bool -** true if document contains custom pages

  - **Data\_HasCustPatterns:bool -** true if file has custom patterns

  - **Data\_HasDynConn:bool -** true if document contains dynamic connection

  - **Data\_HasScaledPages:bool -** true if document contains scaled pages

  - **Data\_HasUserWaitTime:bool -** true when file dialog is shown while saving

  - **Data\_InitAddinsTime:integer -** time taken to initialize and load the COM Add

  - **Data\_InitBrandTime:integer -** amount of time it takes to initialize splash screen and branding office components

  - **Data\_InitGimmeTime:integer -** time taken to initialize office component

  - **Data\_InitLicensingTime:integer -** time taken to initialize licensing office component

  - **Data\_InitMsoUtilsTime:integer -** Initialization time to MSOUTILS office component

  - **Data\_InitPerfTime:integer -** Performance office component initialization time

  - **Data\_InitTCOTime:integer -** amount of time it takes to initialize office component manager

  - **Data\_InitTrustCenterTime:integer -** Time taken to initialize office component trust center

  - **Data\_InitVSSubSystemsTime:integer -** amount of time it takes to initialize Visio components

  - **Data\_InternalFile:bool -** true if file is an internal file. e.g. Stencil

  - **Data\_IsAsyncSave:bool -** true if save was asynchronous

  - **Data\_IsAutoRecoveredFile:bool -** true if file was auto recovered

  - **Data\_IsEmbedded:bool -** true if Visio file was embedded in another app

  - **Data\_IsInfinitePageDisabledForAllPages:bool -** if Infinite Page disabled for all pages for the document true

  - **Data\_IsIRMProtected:bool -** true if file is Information Right Protected

  - **Data\_IsLocal:bool -** true if file is local

  - **Data\_IsRecoverySave:bool -** true if safe was triggered because of recovery

  - **Data\_IsShapeSearchPaneHiddenState:bool -** true if shape search pane was hidden for document

  - **Data\_IsSmartDiagramPresentInActivePageOfFile:bool -** bool, true if smart data visual diagram is present in active page of file

  - **Data\_IsSmartDiagramPresentInFile:bool -** bool, true if the smart data visual diagram present in file.

  - **Data\_IsUNC:bool -** true if document path is adhering to Universal Naming Convention

  - **Data\_LandscapePgCount:integer -** number of pages having landscape orientation in the diagram

  - **Data\_Layers:integer -** number of layers in the diagram

  - **Data\_LoadProfileTime:integer -** amount of time it takes to load office profiler

  - **Data\_LoadRichEditTim:integer-** rich edit component load time

  - **Data\_LoadVisIntlTime:integer -** time taken to load Visio international DLL

  - **Data\_Location:integer -** Location of the file from which it was opened 0 Local, 1, Network, 2, SharePoint, 3 – Web

  - **Data\_MasterCount:integer -** number of masters in the diagram

  - **Data\_MaxCoauthUsers:integer -** maximum number of users coauthoring at any point of time in the session Filesystem, Registry, First Party, SDX

  - **Data\_MaxTilesAutoSizeOn:integer -** Maximum number of tiles of a page for which auto size was enabled

  - **Data\_MsoBeginBootTime:integer -** MSO boot time

  - **Data\_MsoDllLoadTime:integer -** time taken to load MSO DLL

  - **Data\_MsoEndBootTime:integer -** time taken to end MSO boot

  - **Data\_MsoInitCoreTime:integer -** Take taken to initialize MSO office component

  - **Data\_MsoInitUITime:integer -** time taken to initialize MSO office component UI

  - **Data\_MsoMigrateTime:integer -** Time taken to migrate user settings on first bootup if user upgraded from previous version

  - **Data\_NetworkIOBytesRead:int -** total network bytes read while saving

  - **Data\_NetworkIOBytesReadSquared:int -** squared value of Data\_NetworkIOBytesRead

  - **Data\_NetworkIOBytesWritten:int -** total network bytes written while saving

  - **Data\_NetworkIOBytesWrittenSquared :int-** squared value of NetworkIOBytesWritten

  - **Data\_OartStartupTime:integer -** time taken to initialize OART office component

  - **Data\_OleInitTime:integer -** OLE office component initialization time

  - **Data\_OpenDurationTimeInMs:integer -** duration to open file in milliseconds

  - **Data\_OriginatedFromTemplateID:integer -** identifier for template from which diagram was created. NULL for third party templates

  - **Data\_Pages:integer -** number of pages in document

  - **Data\_PositionToolbarsTime:integer -** time taken to get the toolbars into place

  - **Data\_ReadOnly:bool -** True if the file is read only

  - **Data\_RecordSetCount:integer -** number of record set in the diagram

  - **Data\_RecoveryTime:integer -** time taken to open recovery files

  - **Data\_ReviewerPages:integer -** number of reviewer pages in diagram

  - **Data\_RibbonTime:integer -** time taken to display the status bar

  - **Data\_RoamingSettingsStartupTime:integer -** time taken create and load all currently roamed Visio settings

  - **Data\_SchemeMgrStartupTime:integer -** time taken to initialize scheme manager

  - **Data\_SDX\_AssetId -** ONLY exists for store Add- ins. OMEX gives the Add in an AssetId when it goes into Store

  - **Data\_SDX\_BrowserToken -** Identifier that sits in the browser's cache

  - **Data\_SDX\_HostJsVersion -** This is the platform specific version of Office.js (e.g. outlook web16.01.js) This contains the API surface for ad ins

  - **Data\_SDX\_Id -** The GUID of an Add in which uniquely identifies it

  - **Data\_SDX\_InstanceId -** Represents Add in document pair

  - **Data\_SDX\_MarketplaceType -** Indicates where the Add in installed from

  - **Data\_SDX\_OfficeJsVersion -** This is the version of Office.js which will redirect to the platform specific version.

  - **Data\_SDX\_Version -** Version of the Add in

  - **Data\_ShellCmdLineTime:integer -** time taken to Parse and execute any shell commands on the command line

  - **Data\_Size:long** - File size in bytes

  - **Data\_StartEndTransactionTime:integer -** time taken to initialize Visio components

  - **Data\_STNInitTime:integer -** time taken to initialize stencil window configuration

  - **Data\_Tag:string -** unique identifier to identify Save As event

  - **Data\_ThemeCount:integer -** number of themes in diagram

  - **Data\_TimeStamp -** Time stamp when document was closed

  - **Data\_UIInitTime:integer -** UI initialization time

  - **Data\_WasSuccessful:bool -** true if save as was successful

  - **Data\_WinLaunchTime:integer -** time taken to launch the Visio startup pane, etc.)

  - **Office.Visio.FileCharacteristicsVisio -** Captures file properties at the time of file boot for Visio C2R and Dev16. This event helps us to categorize and debug errors about document properties, which in turn enables us root cause issues faster and fix it for customer satisfaction.

  - **Office.Visio.Shared.BootStats -** This event collects boot time for Visio Win32 app. It collects various fields for boot of various components like Ribbon load time, App Initialization time. This event is used to measure Boot perf for Visio.

  - **Office.Visio.Shared.FileOpen -** This event collects File open stats for Visio. This event is used to monitor file open Success/ Fail rates and maps it with few properties of like file size. File properties enable us debug and root cause issues faster.

  - **Office.Visio.Shared.Filesave -** This event collects File save stats for Visio. This event is used to monitor file save Success/ Fail rates and maps it with few properties of like file size and location it is being saved to e.g. cloud/local. File properties enable us debug and root cause issues faster.

  - **Office.Visio.Shared.FilesaveAs -** This event collects File save as stats for Visio. This event is used to monitor file save Success/ Fail rates and maps it with few properties of like file size and location it is being saved to, e.g. cloud/local. File properties enable us debug and root cause issues faster.

  - **Office.Visio.Shared.PostSave -** This event captures failure reason for failure in file save.

  - **Office.Visio.VisioFileSaveAs -** This event collects File save as stats for Visio Dev16. This event is used to monitor file save as Success/ Fail rates and maps it with few properties of like file size and location that it is being saved to, e.g. cloud/local. File properties enable us debug and root cause issues faster.

  - **Office.Visio.VisioFileSaveAsync -** This event collects File save async stats for Visio Dev16. This event is used to monitor file save async Success/ Fail rates and maps it with few properties of like file size and location that it is being saved to e.g., cloud/local. File properties enable us debug and root cause issues faster.

  - **Office.Visio.VisioFileSaveSync -** This event collects File save sync stats for Visio Dev16. This event is used to monitor file save sync Success/ Fail rates and maps it with few properties of like file size and location that it is being saved to e.g., cloud/local. File properties enable us debug and root cause issues faster. This event helps us monitor save failure reasons for a file.

#### Office.Extensibility.Sandbox.ODPActivationHanging

Collects when an Office add-in takes unexpectedly long to launch (>5 sec). Used to detect and fix problems with Office add-ins launching.
 
The following fields are collected:

- **AppId** - ID of the App

- **AppInfo** - data regarding the type of add-in (task pane or UILess or in content etc.) and the provider type (omen, SharePoint, filesystem etc.)

- **AppInstanceId** - ID of the app instance 

- **AssetId** - asset ID of the app

- **NumberOfAddinsActivated** - counter of add-ins activated

- **RemoterType** - specifies the type of remoter (Trusted, untrusted, Win32webView, Trusted UDF etc.) used to activate the add-in

- **StoreType** - origin of the app

- **TimeForAuth** - time spent on auth 

- **TimeForSandbox** - time spent on the sandbox

- **TimeForServerCall** - time spent on the server call 

- **TotalTime** - total time spent


#### Office.Outlook.Desktop.ExchangePuidAndTenantCorrelation

Collects the user PUID and Tenant Identifier once per session. The correlation of PUID and Tenant are necessary to understand and diagnose Outlook issues on a per-tenant basis.

The following fields are collected:

  - **CollectionTime** - Timestamp of the event

  - **ConnId** - Connection Identifier: Identifier of the connection parsing out PUID and OMS tenant Identifier

  - **OMSTenantId** – Microsoft-generated Unique identifier of Tenant

  - **PUID** - Exchange's PUID to uniquely identify users


#### Office.Outlook.Mac.MacOLKActivationState

Collects how Outlook is activated, such as with a subscription or volume license. The data is monitored to ensure we don’t see any spikes in failures. We also analyze the data to find areas of improvement. 

The following fields are collected:

- **SetupUIActivationMethod** - Outlook activation method, such as subscription or volume license

#### Office.PowerPoint.DocOperation.Open 

Collected whenever PowerPoint opens a file. Contains success information, failure details, performance metrics, and basic details about the file including file format type and document metadata. This information is necessary to ensure PowerPoint can open files successfully with no degradation in performance. It allows us to diagnose any problems we discover.

The following fields are collected:

  - **Data\_AddDocTelemetryResult -** Does this log entry have all necessary document telemetry (Data\_Doc\_\* fields)

  - **Data\_AddDocumentToMruList -** Method AddDocumentToMruList execution duration

  - **Data\_AlreadyOpened -** Was this document previously opened (within the context of same process session)

  - **Data\_AntiVirusScanMethod -** Predefined set of values of type of anti-virus scanned (IOAV, AMSI, None etc.)

  - **Data\_AntiVirusScanStatus -** Predefined set of values of anti-virus scan that happens for every document opened (NoThreatsDetected, Failed, MalwareDetected, etc.)

  - **Data\_AsyncOpenKind -** Predefined set of values of async options (Collab, ServerOnly, SyncBacked, NotAsync)

  - **Data\_CancelBackgroundDownloadHr -** Was downloading of document interrupted? If yes, what was the result of interruption?

  - **Data\_CheckForAssistedReadingReasons -** Method CheckForAssistedReadingReasons execution duration in milliseconds

  - **Data\_CheckForDisabledDocument -** Method CheckForDisabledDocument execution duration in milliseconds

  - **Data\_CheckForExistingDocument -** Method CheckForExistingDocument execution duration in milliseconds

  - **Data\_CheckIncOpenResult -** Method CheckIncOpenResult execution duration in milliseconds

  - **Data\_CheckLambdaResult -** Method CheckLambdaResult execution duration in milliseconds

  - **Data\_CheckPackageForRequiredParts -** Method CheckPackageForRequiredParts execution duration in milliseconds

  - **Data\_CheckPackageForSpecialCases -** Method CheckPackageForSpecialCases execution duration in milliseconds

  - **Data\_CheckRequiredPartsLoaded -** Method CheckRequiredPartsLoaded execution duration in milliseconds

  - **Data\_CheckWebSharingViolationForIncOpen -** Method CheckWebSharingViolationForIncOpen execution duration in milliseconds
   
  - **Data_CloseAndReopenWithoutDiscard –** Whether a document was closed and reopened during the open process without discarding.

  - **Data\_ContentTransaction -** Predefined set of values of when transaction can be created (AllowedOnLoadDocument, AllowedOnOpenComplete, etc.)

  - **Data_CorrelationId -** A GUID passed to PowerPoint by ProtocolHandler for correlating telemetry. ProtocolHandler is a separate process which handles Office links for the OS.

  - **Data\_CppUncaughtExceptionCount:long -**Uncaught native exceptions while activity was running

  - **Data\_CreateDocumentTimeMS -** Method CreateDocumentTimeMS execution duration in milliseconds

  - **Data\_CreateDocumentToken -** Method CreateDocumentToken execution duration in milliseconds

  - **Data\_CreateDocumentToW -** Method CreateDocumentToW execution duration in milliseconds

  - **Data\_CreateDocWindow -** Method CreateDocWindow execution duration in milliseconds

  - **Data\_CreateLocalTempFile -** Method CreateLocalTempFile execution duration in milliseconds

  - **Data\_DetachedDuration:long -** Time for which Activity was detached/not running

  - **Data\_DetermineFileType -** Method DetermineFileType execution duration in milliseconds

  - **Data\_Doc\_AccessMode:long -**How was this document opened (Read only / read write)

  - **Data\_Doc\_AssistedReadingReasons:long -**Predefined set of values of why document was opened in assisted reading mode

  - **Data_Doc_AsyncOpenKind:long –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data\_Doc\_ChunkingType:long -**How is document stored in SharePoint

  - **Data\_Doc\_EdpState:long -**Enterprise Data Protection state of document

  - **Data\_Doc\_Ext:string -**Document extension

  - **Data\_Doc\_Extension:string -**Document extension

  - **Data\_Doc\_FileFormat:long -**Predefined set of values of format of file (more granular than extension)

  - **Data\_Doc\_Fqdn:string – -**Where is document stored (SharePoint.com, live.net), only available for Office 365 domains

  - **Data\_Doc\_FqdnHash:string – -**Hash of where document is stored

  - **Data\_Doc\_IdentityTelemetryId:string – -**Unique GUID of user

  - **Data\_Doc\_IdentityUniqueId:string -** Unique identifier of identity that was used for Shared Documents action

  - **Data\_Doc\_IOFlags:long -** Bitmask for various IO related flags for a given document

  - **Data\_Doc\_IrmRights:long -** Predefined set of values of what type of Information Rights Management is applied on this document (Forward, Reply, SecureReader, Edit etc.)

  - **Data\_Doc\_IsCloudCollabEnabled:bool -** True if the "IsCloudCollabEnabled" HTTP header has already been received from an OPTIONS request.

  - **Data\_Doc\_IsIncrementalOpen:bool – -**Was document opened incrementally (new feature that opens document without needing to download entire document)

  - **Data\_Doc\_IsOcsSupported:bool -**Is Document supports coauthoring using new OCS service

  - **Data\_Doc\_IsOpeningOfflineCopy:bool -**Is document being opened from local cache?

  - **Data\_Doc\_IsSyncBacked:bool -**Is document opened from folder that is using OneDrive sync back app

  - **Data\_Doc\_Location:long -**Predefined set of values of where document is stored (Local, SharePoint, WOPI, Network etc.)

  - **Data\_Doc\_LocationDetails:long -**Predefined set of values of more detailed location (Temp folder, downloads folder, One Drive Documents, One Drive Pictures, etc.)

  - **Data\_Doc\_NumberCoAuthors:long -**Number of coauthors at the time of opening of a document

  - **Data\_Doc\_PasswordFlags:long -**Predefined set of values of how document is encrypted with password (None, password to read, password to edit)

  - **Data\_Doc\_ReadOnlyReasons:long –-**Predefined set of values of why this document was marked read only (Locked on server, final document, password protected to edit, etc.)

  - **Data\_Doc\_ResourceIdHash:string -**Hash of resource identifier for documents stored in cloud

  - **Data_Doc_RtcType -**  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

  - **Data\_Doc\_ServerDocId:string -**immutable identifier for documents stored in cloud

  - **Data\_Doc\_ServerProtocol:long -**Predefined set of values of which protocol is used to talk to server (Http, Cobalt, WOPI etc.)

  - **Data\_Doc\_ServerType:long -** Predefined set of values of type of server (SharePoint, DropBox, WOPI)

  - **Data\_Doc\_ServerVersion:long -**Is server is based off Office14, Office15, Office 16?

  - **Data\_Doc\_SessionId:long -**generated GUID that Identifies the instance of the document within the same process session

  - **Data\_Doc\_SharePointServiceContext:string -** An opaque string, typically GridManagerID.FarmID. Useful for correlating client-side and server-side logs

  - **Data\_Doc\_SizeInBytes:long -**Document size in bytes

  - **Data\_Doc\_SpecialChars:long -** Bitmask indicating special chars in the document's URL or Path

  - **Data\_Doc\_StorageProviderId:string -** A string that identifies the document's storage provider, like "DropBox”

  - **Data\_Doc\_StreamAvailability:long-**Predefined set of values of status of document Stream (available, permanently disabled, not available)

  - **Data\_Doc\_UrlHash:string -**hash of full URL of documents stored in cloud

  - **Data\_Doc\_UsedWrsDataOnOpen:bool -** true if the file was opened incrementally using pre-cached WRS data on the host

  - **Data\_Doc\_WopiServiceId:string -** WOPI Service identifier, e.g. "Dropbox"

  - **Data\_DownloadExcludedData -** Method DownloadExcludedData execution duration in milliseconds

  - **Data\_DownloadExcludedDataTelemetry -** Predefined set of values of state of synchronously waiting for download(SynchronousLogicHit, UserCancelled RunModalTaskUnexpectedHResult etc.)

  - **Data\_DownloadFileInBGThread -** Method DownloadFileInBGThread execution duration in milliseconds

  - **Data\_DownloadFragmentSize -** Size of fragment(downloadable chunk of file), usually 3.5 MB

  - **Data\_ExcludedEmbeddedItems -** Number of zip parts that are excluded for first render

  - **Data\_ExcludedEmbeddedItemsSize -** Total size of zip parts that are excluded for first render

  - **Data\_ExcludedRequiredItems -** Number of zip parts that are excluded but required for first render

  - **Data\_ExcludedRequiredItemsSize -** Total size of zip parts that are excluded but required for first render

  - **Data\_ExecutionCount -** How many times IncOpen protocol was executed

  - **Data\_FailureComponent:long -**Predefined set of values of which component caused this protocol to fail? (Conflict, CSI, Internal etc.)

  - **Data\_FailureReason:long -** Predefined set of values of what’s the failure reason (FileIsCorrupt, BlockedByAntivirus etc.)

  - **Data\_FCreateNew -** Is this new blank document

  - **Data\_FCreateNewFromTemplate -** Is this new document from templates

  - **Data_FErrorAfterDocWinCreation:boolean-**  Did any error or exception happen after the document window is created.

  - **Data\_FileUrlLocation -** Predefined set of values of where document is stored (NetworkShare, LocalDrive, ServerOther etc.)

  - **Data\_FirstSlideCompressedSize -** compressed size of first slide zip part (usually Slide1.xml)

  - **Data\_FIsDownloadFileInBgThreadEnabled -** Is downloading in background thread enabled?

  - **Data\_fLifeguarded:bool -** Was document ever lifeguarded (feature to fix document errors by themselves without prompting user)?

  - **Data\_ForceReopenOnIncOpenMergeFailure -** Flag representing if we were forced to re-open due to merge failure in Inc Open

  - **Data\_ForegroundThreadPass0TimeMS -** (Mac only) Total time spent in foreground thread in first pass

  - **Data\_ForegroundThreadPass1TimeMS -** (Mac only) Total time spent in foreground thread in second pass

  - **Data\_FWebCreatorDoc -** Is doc created from template or QuickStarter

  - **Data\_HasDocToken -** Does this document have CSI doc token (internal code)

  - **Data\_HasDocument -** Does this document have CSI document (internal code)

  - **Data\_InclusiveMeasurements -** Does method measurement durations are inclusive of child method call duration

  - **Data\_IncompleteDocReasons -** Predefined set of values of why open was incomplete (Unknown, DiscardFailure etc.)

  - **Data\_IncOpenDisabledReasons -** Predefined set of values of Reasons why incremental open was disabled

  - **Data\_IncOpenFailureHr -** result of why Incremental open failed

  - **Data\_IncOpenFailureTag -** Tag (pointer to code location) of where Incremental open failed

  - **Data\_IncOpenFallbackReason -** Why was IncOpen not run

  - **Data\_IncOpenRequiredTypes -** Predefined set of values of content types needed for first render (RequiredXmlZipItem, RequiredNotesMaster etc.)

  - **Data\_IncOpenStatus -** Predefined set of values of Incremental open status (Attempted, FoundExcludedItems, DocIncOpenInfoCreated etc.)

  - **Data\_InitFileContents -** Method InitFileContents execution duration in milliseconds

  - **Data\_InitialExcludedItems -** Number of zip parts that are excluded initially

  - **Data\_InitialExcludedItemsSize -** Total size of zip parts that are excluded initially

  - **Data\_InitializationTimeMS -** (Mac Only) Time to initialize

  - **Data\_InitialRoundtripCount -** Number of server responses needed to form initial zip archive

  - **Data\_InitLoadProcess -** Method InitLoadProcess execution duration in milliseconds

  - **Data\_InitPackage -** Method InitPackage execution duration in milliseconds

  - **Data\_InitSecureReaderReasons -** Method InitSecureReaderReasons execution duration in milliseconds

  - **Data\_IsIncOpenInProgressWhileOpen -** In case of multiple open of same document, is Inc open protocol running alongside open protocol?

  - **Data\_IsMultiOpen -** Do we support multiple open?

  - **Data\_IsOCS -** Was document in OCS mode in its’ last known state

  - **Data\_IsODPFile -** Is document in 'Open Document Format' used by OpenOffice.org

  - **Data\_IsPPTMetroFile -** Is document metro (pptx) file format

  - **Data\_LoadDocument -** Method LoadDocument execution duration in milliseconds

  - **Data\_MeasurementBreakdown -** Encoded measurement breakdown (shortened detailed method perf)

  - **Data\_Measurements -** Encoded measurements

  - **Data\_MethodId -** Last method that was executed

  - **Data\_NotRequiredExcludedItems -** Total number of PowerPoint package items that are not required for first render and excluded

  - **Data\_NotRequiredExcludedItemsSize -** Total size of PowerPoint package items that are not required for first render and excluded

  - **Data\_NotRequiredExcludedParts -** Total number of zip parts that are not required for first render and excluded

  - **Data\_NotRequiredExcludedPartsSize -** Total number of zip parts that are not required for first render and excluded

  - **Data\_OpenCompleteFailureHR -** result of why OpenComplete protocol failed

  - **Data\_OpenCompleteFailureTag -** Tag (pointer to code location) of where OpenComplete protocol failed

  - **Data\_OpenLifeguardOption -** Predefined set of values of choices for lifeguard operation (None, TryAgain, OpenInWebApp etc.)

  - **Data\_OpenReason -** Predefined set of values of how this document was opened (FilePicker, OpenFromMru, FileDrop etc.)

  - **Data\_OSRPolicy -** SecureReader Policy

  - **Data\_OSRReason -** Reasons why this document was opened in Secure Reader

  - **Data\_OtherContentTypesWithRequiredParts -** Nonstandard content types that were excluded but required for first render

  - **Data\_PrepCacheAsync -** Flag for OcsiOpenPerfPrepCacheAsync

  - **Data\_PreviousDiscardFailed -** Indicates previous open/close attempt on the document didn't properly release all memory

  - **Data\_PreviousFailureHr -** In case of re-opening of same document, what was last failure result

  - **Data\_PreviousFailureTag -** In case of re-opening of same document, what was last failure tag (pointer to code location)

  - **Data\_RemoteDocToken -** Is Remote Open enabled (prototype feature that enables opening file from service rather than from host)?

  - **Data\_Repair -** Are we in document repair mode (for corrupt documents that are fixable)

  - **Data\_RequestPauseStats -** How many times code requested to pause perf recording

  - **Data\_RequiredPartsComressedSize -** Total size of required PowerPoint parts needed for first render

  - **Data\_RequiredPartsDownload -** Total size of required PowerPoint parts that are downloaded

  - **Data\_RequiredPartsRoundtripCount -** Total number of roundtrips (calls to host) needed to get all the required PowerPoint parts for first render

  - **Data\_RequiredZipItemsDownload -** Total size of required zip items needed for first render

  - **Data\_RequiredZipItemsRoundtripCount -** Total number of roundtrips (calls to host) needed to get all the required zip items for first render

  - **Data\_RoundtripsAfterMissingRequiredParts -** Total number of roundtrips (calls to host) needed after we found missing required PowerPoint parts

  - **Data\_RoundtripsAfterMissingRequiredZipItems -** Total number of roundtrips (calls to host) needed after we found missing required zip items

  - **Data\_RoundtripsAfterRequiredPackage -** Total number of roundtrips (calls to host) needed after we created the package

  - **Data\_RoundtripsAfterRequiredParts -** Total number of roundtrips (calls to host) needed after we downloaded all required parts

  - **Data\_SetDocCoAuthAutoSaveable -** Method SetDocCoAuthAutoSaveable execution duration in milliseconds

  - **Data\_SniffedFileType -** An educated guess of proposed file type of corrupt document

  - **Data\_StartTime -** Perf counter when Open started

  - **Data\_StopwatchDuration:long -** Total time for Activity

  - **Data\_SyncSlides -** Method SyncSlides execution duration in milliseconds

  - **Data\_TimerStartReason -** Predefined set of values of how timer was started (CatchMissedSyncStateNotification, WaitingForFirstDownload etc.)

  - **Data\_TimeSplitMeasurements -** Encoded measurement breakdown (shortened detailed method perf)

  - **Data\_TimeToInitialPackage -** Time took to create initial package

  - **Data\_TimeToRequiredPackage -** Time took to create required package

  - **Data\_TimeToRequiredParts -** Time took to create package with all required parts in it

  - **Data\_TotalRequiredParts -** Total number of PowerPoint parts required for first render

  - **Data\_UnknownRequiredParts -** Total number of non-standard parts required for first render

  - **Data\_UnpackLinkWatsonId -** Watson identifier of error when document is opened via Share OneDrive URL

  - **Data\_UnpackResultHint -** Predefined set of values of unpacking share URL results (NavigateToWebWithoutError, UrlUnsupported, AttemptOpen etc.)

  - **Data\_UnpackUrl -** Method UnpackUrl execution duration in milliseconds

  - **Data\_UpdateAppstateTimeMS -** Method UpdateAppstate execution duration in milliseconds

  - **Data\_UpdateCoauthoringState -** Method UpdateCoauthoringState execution duration in milliseconds

  - **Data\_UpdateReadOnlyState -** Method UpdateReadOnlyState execution duration in milliseconds

  - **Data\_WACCorrelationId -** In case of opening file in browser, get the correlation of WebApp logs

  - **Data\_WasCachedOnInitialize -** Was this document cached during initialization

  - **Data\_WBDirtyBeforeDiscard -** Is working branch became dirty before re-opening document

  - **Data\_ZRTOpenDisabledReasons -** Why we could not open document from cache (Zero Round Trip)

#### Office.PowerPoint.PPT.Desktop.Bootime

Collecting how PowerPoint is booted. It includes boot PowerPoint in protected view, in assisted reading mode, from Macro, print, new and blank document, document recovery, from automation and if it is click- to-run. It also collects how long it takes PowerPoint to boot. This data is critical to guarantee PowerPoint performs well when booted from different modes. Microsoft uses this data to catch long booting time when opening PowerPoint from different modes.

The following fields are collected:

  - **AssistedReading -** in assisted reading mode

  - **Automation -** from automation

  - **Benchmark -** run performance benchmark

  - **Blank -** blank document

  - **BootTime -** session boot time

  - **Embedding -** embedding document

  - **IsC2R -** is click-to-run

  - **IsNew -** new document

  - **IsOpen -** is open

  - **Macro1 -** run Macro

  - **Macro2 -** run Macro

  - **NonStandardSpaceInCmdLine** – there is non-standard space in command line

  - **Print -** print document

  - **PrintDialog -** print document with dialog

  - **PrintPrinter -** print document with printer

  - **ProtectedView -** in protected view

  - **Regserver -** Register PowerPoint as a COM server

  - **Restore -** restore document

  - **Show -** show document

  - **Time -** session time

  - **UnprotectedView -** in unprotected view

#### Office.PowerPoint.PPT.HasUserEditedDocument

Collected when a user starts editing a document. Microsoft uses this data to calculate active users who edited a PowerPoint document

The following fields are collected:

  - **CorrelationId** – document Correlation Identifier

#### Office.Project.BootAndOpenProject

Project is booted by opening a file. This event indicates that a user has opened Office Project with an associated file. It contains critical success data of making sure Project can start and load a file.

The following fields are collected:

  - **Data\_AlertTime -** The amount of time the boot dialog was active.

  - **Data\_BootTime -** The amount of time it took to boot Project

  - **Data\_CacheFileSize -** If the file was cached, the size of the file

  - **Data\_EntDocType -** The type of file that was opened

  - **Data\_IsInCache -** Whether the file opened was cached

  - **Data\_LoadSRAs -** If the user wants to load SRAs or not

  - **Data\_Outcome -** Total boot and file open time.

  - **Data\_OpenFromDocLib -** If the Project file opened was from the document library

  - **Data\_ProjectServerVersion -** The version and build that Project is currently on

#### Office.Project.BootProject

Project is booted without opening a file. This event indicates that a user has opened Office Project without an associated file. It contains critical success data of making sure Project can start.

The following fields are collected:

  - **Data\_BootTime -** The amount of time it took to boot Project

  - **Data\_FileLoaded -** False if opening from out-space or new blank project

  - **Data\_IsEntOfflineWithProfile -** If the users are in the professional SKU and not connected to the server

  - **Data\_IsEntOnline -** If the session of Project is connected to a Project server with enterprise features

  - **Data\_IsLocalProfile -** If the Project session is connected to a Project server with enterprise features

  - **Data\_ProjectServerVersion -** The version and build that Project is currently on


#### Office.Project.OpenProject

Project opens a file. This event indicates a user directly opening a Project file by a user. It contains critical success data of opening files in Project.

The following fields are collected:

  - **Data\_AgileMode -** defines if the project opened is a waterfall or agile project

  - **Data\_AlertTime -** The amount of time the boot dialog was active

  - **Data\_CacheFileSize -** If the file was cached, the size of the file

  - **Data\_EntDocType -** the type of file that was opened

  - **Data\_IsInCache -** whether the file opened was cached

  - **Data\_LoadSRAs -** If the user wants to load SRAs or not

  - **Data\_OpenFromDocLib -** If the Project file opened was from the document library

  - **Data\_Outcome -** Total boot and file open time

  - **Data\_Outcome -** Total boot and file open time.

  - **Data\_ProjectServerVersion -** The version and build that Project is currently on

#### Office.SessionIdProvider.OfficeProcessSessionStart

Applicable to all the Office windows-based applications: win32 and UWP

The following fields are collected:

- **OfficeProcessSessionStart** sends basic information upon the start of a new Office session. This is used to count the number of unique sessions seen on a given device. This is used as a heartbeat event to ensure that the application is running on a device or not. In addition, it serves as a critical signal for overall application reliability

- **AppSessionGuid** - An identifier of a particular application session starting at process creation time and persisting until process end. It is formatted as a standard 128-bit GUID but constructed of 4 parts. Those four parts in order are (1) 32 bit Process ID (2) 16 bit Session ID (3) 16 bit Boot ID (4) 64 bit Process creation time in UTC 100ns

- **processSessionId** - Randomly generated guid to identify the app session

- **UTCReplace_AppSessionGuid** - Constant boolean value. Always true.

#### Office.System.SessionHandoff

Indicates that the current Office session is a handoff session. This means that handling of a user’s request to open a document is being handed off to an already running instance of the same application.

The following fields are collected.

- **ParentSessionId** - The ID of the session that will be taking over handling of the users’ request.

#### Office.TelemetryEngine.IsPreLaunch

Applicable for Office UWP applications.  This event is fired when an office application is initiated for the first-time post upgrade/install from the store. This is part of basic diagnostic data, used to track whether a session is launch session or not.

The following fields are collected:

- **appVersionBuild** - The app build version number.

- **appVersionMajor** - The app major version number.

- **appVersionMinor** - The app minor version number.

- **appVersionRev** - The app revision version number.

- **SessionID** - Randomly generated GUID to identify the app session

#### Office.TelemetryEngine.SessionHandOff

Applicable to Win32 Office applications.  This event helps us understand whether there was a new session created to handle a user-initiated file open event. It is a critical diagnostic information that is used to derive reliability signal and ensure that the application is working as expected.

The following fields are collected:

- **appVersionBuild** - The app build version number.

- **appVersionMajor** - The app major version number.

- **appVersionMinor** - The app minor version number.

- **appVersionRev** - The app revision version number.

- **childSessionID** - Randomly generated guid to identify the app session

- **parentSessionId** - Randomly generated guid to identify the app session

#### Office.Visio.VisioIosAppBootTime

This is triggered every time the Visio iOS application boots. It is essential to understand boot performance of the Visio iOS app. Used to troubleshoot poor performance. 

The following fields are collected:

- **Data_AppBootTime** - Duration taken for app to boot, in milliseconds.

#### Office.Visio.VisioIosAppResumeTime 

This event is triggered every time the Visio iOS app resumes focus. It is essential to measure app resume performance and troubleshoot performance issues of Visio iOS app.

The following fields are collected:

- **Data_AppResumeTime** - Duration for app to resume in milliseconds.

#### Office.Word.FileOpen.OpenCmdFileMruPriv

This event indicates Office Word opens a document from the Most Recent Used (MRU) list. It also contains critical file open performance data and is an app start event from user perspective. The event monitors whether fileopen-from-MRU is working as expected. It is also used to calculated monthly active users/devices, and cloud reliability metrics.

The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics.

- **Data_BytesAsynchronous** - Number of bytes (compressed) that we believe we can open the file without if we get them before the user wants to start editing or maybe saving

- **Data_BytesAsynchronousWithWork** - Number of bytes (compressed) that we might be able to open the file without but would require significant code investments to make it happen

- **Data_BytesSynchronous** - Number of bytes (compressed) that we must have before we can start opening the file

- **Data_BytesUnknown** - Number of bytes in document parts that we don’t expect to find 

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read-only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_InitializationScenario** - Records how the document was opened

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service

- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto-synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document Identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document Identifier used to diagnose problems 

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI, etc.)

- **Data_Doc_ServerVersion** - the server version offering the service

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL 

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_Doc_WopiServiceId** - Contains unique identifier of WOPI service provider

- **Data_EditorDisablingRename** - Identifier of the first editor that caused for rename to be disabled

- **Data_EditorsCount** - Number of editors in the document

- **Data_ForceReadWriteReason** - Integer value representing the reason why the file was forced into read/write mode

- **Data_FSucceededAfterRecoverableFailure** - Indicates that open succeeded after repairing a failure while opening the document

- **Data_LastLoggedTag** - Unique tag for code call site used to identify when we try to fail the open twice (used for data quality diagnostics)

- **Data_LinkStyles** - Indicates whether we are linking to the template styles

- **Data_MainPdod** - The document identifier in Office Word process

- **Data_Measurements** - Encoded string containing the time breakdown of the different parts of open. Used to measure performance.

- **Data_MoveDisabledReason** - Error that is disabling move for the document

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_PartsUnknown** - the number of document parts that we couldn’t get data for

- **Data_RecoverableFailureInitiationLocationTag** - Unique tag for code call site used to identify the place in code where we attempt to fix the file before opening it

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

- **Data_SecondaryTag** - Unique tag for code call site used to add additional failure data for open 

- **Data_TemplateFormat** - File format of the template that the document is based on.

- **Data_UsesNormal** - Indicates whether the open document is based on the normal template

- **PathData_Doc_StreamAvailability** - Indicator if document stream is available/disabled


#### Office.Word.FileOpen.OpenFFileOpenXstzCore

This event indicates Office Word opens a document who is double clicked by a user. It also contains critical file open performance data and is an app start event from user perspective. The event monitors whether file-openfrom-file-double-click is working as expected. It is also used to calculated monthly active users/devices, and cloud reliability metrics.

The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics
	
- **Data_BytesAsynchronous** - Number of bytes (compressed) that we believe we can open the file without if we get them before the user wants to start editing or maybe saving
	
- **Data_BytesAsynchronousWithWork** - Number of bytes (compressed) that we might be able to open the file without but would require significant code investments to make it happen

- **Data_BytesSynchronous** - Number of bytes (compressed) that we must have before we can start opening the file
	
- **Data_BytesUnknown** - Number of bytes in document parts that we don’t expect to find

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read-only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_InitializationScenario** - Records how the document was opened

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service
	
- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)
	
- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document Identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document Identifier used to diagnose problems

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)
	
- **Data_Doc_ServerVersion** - the server version offering the service 

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_Doc_WopiServiceId** - Contains unique identifier of WOPI service provider

- **Data_EditorDisablingRename** - Identifier of the first editor that caused for rename to be disabled

- **Data_EditorsCount** - Number of editors in the document

- **Data_FSucceededAfterRecoverableFailure** - Indicates that open succeeded after repairing a failure while opening the document

- **Data_ForceReadWriteReason** - Integer value representing the reason why the file was forced into read/write mode
	
- **Data_LastLoggedTag** - Unique tag for code call site used to identify when we try to fail the open twice (used for data quality diagnostics)

- **Data_LinkStyles** - Indicates whether we are linking to the template styles

- **Data_MainPdod** - The document identifier in Office Word process

- **Data_Measurements** - Encoded string containing the time breakdown of the different parts of open. Used to measure performance.
	
- **Data_MoveDisabledReason** - Error that is disabling move for the document

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_PartsUnknown** - the number of document parts that we couldn’t get data for

- **Data_RecoverableFailureInitiationLocationTag** - Unique tag for code call site used to identify the place in code where we attempt to fix the file before opening it.

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

- **Data_SecondaryTag** - Unique tag for code call site used to add additional failure data for open.

- **Data_TemplateFormat** - File format of the template that the document is based on.

- **Data_UsesNormal** - Indicates whether the open document is based on the normal template.


#### Office.Word.FileOpen.OpenIfrInitArgs

This event indicates Office Word opens a document via COM activation or command line. It also contains critical file open performance data, and is an app start event from user perspective. The event monitors whether file-open-from-command-line is working as expected. It is also used to calculated monthly active users/devices, and cloud reliability metrics.

The following fields are collected:

  - **Data\_AddDocTelemRes -** Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics.

  - **Data\_BytesAsynchronous -** Number of bytes (compressed) that we believe we can open the file without if we get them before the user wants to start editing or maybe saving.

  - **Data\_BytesAsynchronousWithWork -** Number of bytes (compressed) that we might be able to open the file without but would require significant code investments to make it happen

  - **Data\_BytesSynchronous -** Number of bytes (compressed) that we must have before we can start opening the file

  - **Data\_BytesUnknown -** Number of bytes in document parts that we don’t expect to find.

  - **Data\_Doc\_AccessMode -** Document is read only/editable

  - **Data\_Doc\_AssistedReadingReasons -** Predefined set of values of why document was opened in assisted reading mode

  - **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

  - **Data\_Doc\_ChunkingType -** Units used for incremental document open

  - **Data\_Doc\_EdpState -** Electronic Data Protection setting for the document

  - **Data\_Doc\_Ext -** Document extension (docx/xlsb/pptx, etc.)

  - **Data\_Doc\_FileFormat -** File format protocol version

  - **Data\_Doc\_Fqdn -** OneDrive or SharePoint Online Domain Name

  - **Data\_Doc\_FqdnHash -** One-way hash of customer identifiable domain name

  - **Data\_Doc\_IOFlags -** Reports on the cached flags used to set open request options

  - **Data\_Doc\_IdentityTelemetryId -** A one-way hash of the user identity used to perform the open

  - **Data\_Doc\_InitializationScenario -** Records how the document was opened

  - **Data\_Doc\_IrmRights -** Actions permitted by the Electronic Data Protection policy that has been applied to the document/user

  - **Data\_Doc\_IsIncrementalOpen -** Flag indicating that the document has been incrementally opened

  - **Data\_Doc\_IsOcsSupported -** Flag indicating that the document is supported in the collaboration service

  - **Data\_Doc\_IsOpeningOfflineCopy -** Flag indicating that the offline copy of a document was opened

  - **Data\_Doc\_IsSyncBacked -** Flag indicating that an auto synced copy of the document exists on the computer

  - **Data\_Doc\_Location -** Indicates which service provided the document (OneDrive, File Server, SharePoint)

  - **Data\_Doc\_LocationDetails -** Indicates which Known Folder provided a locally stored document

  - **Data\_Doc\_NumberCoAuthors -** Count of the number of fellow users in a collaborative editing session

  - **Data\_Doc\_PasswordFlags -** Indicates read or read/write password flags set

  - **Data\_Doc\_ReadOnlyReasons -** Reasons why the document was opened read only

  - **Data\_Doc\_ResourceIdHash -** An anonymized document Identifier used to diagnose problems

  - **Data_Doc_RtcType -**  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

  - **Data\_Doc\_ServerDocId -** An immutable anonymized document Identifier used to diagnose problems

  - **Data\_Doc\_ServerProtocol -** the protocol version used to communicate with the service

  - **Data\_Doc\_ServerType -** the type of the server offering the service (SharePoint, OneDrive, WOPI etc.)

  - **Data\_Doc\_ServerVersion -** the server version offering the service

  - **Data\_Doc\_SessionId -** the server version offering the service

  - **Data\_Doc\_SharePointServiceContext -** Diagnostic information from SharePoint Online requests

  - **Data\_Doc\_SizeInBytes -** Indicator of document size

  - **Data\_Doc\_SpecialChars -** Indicator of special chars in the document's URL or Path

  - **Data\_Doc\_StreamAvailability -** Indicator if document stream is available/disabled

  - **Data\_Doc\_SyncBackedType -** Indicator as to the type of document (local or service based)

  - **Data\_Doc\_UrlHash -** One-way hash to create a naïve document identifier

  - **Data\_Doc\_WopiServiceId -** Contains unique identifier of WOPI service provider

  - **Data\_EditorDisablingRename -** Identifier of the first editor that caused for rename to be disabled

  - **Data\_EditorsCount -** Number of editors in the document

  - **Data\_FSucceededAfterRecoverableFailure -** Indicates that open succeeded after repairing a failure while opening the document

  - **Data\_ForceReadWriteReason -** Integer value representing the reason why the file was forced into read/write mode

  - **Data\_LastLoggedTag -** Unique tag for code call site used to identify when we try to fail the open twice (used for data quality diagnostics)

  - **Data\_LinkStyles -** Indicates whether we are linking to the template styles

  - **Data\_MainPdod -** The document identifier in Office Word process

  - **Data\_Measurements -** Encoded string containing the time breakdown of the different parts of open. Used to diagnose open performance.

  - **Data\_MoveDisabledReason -** Error that is disabling move for the document

  - **Data\_MoveFlightEnabled -** Whether the flight for the move feature is enabled

  - **Data\_PartsUnknown -** the number of document parts that we couldn’t get data for

  - **Data\_RecoverableFailureInitiationLocationTag -** Unique tag for code call site used to identify the place in code where we attempt to fix the file before opening it

  - **Data\_RenameDisabledReason -** Error that is causing for rename to be disabled for this document

  - **Data\_RenameFlightEnabled -** Whether the flight for the rename feature is enabled

  - **Data\_SecondaryTag -** Unique tag for code call site used to add additional failure data for open.

  - **Data\_TemplateFormat -** File format of the template that the document is based on.

  - **Data\_UsesNormal -** Indicates whether the open document is based on the normal template.


#### Office.Word.FileOpen.OpenLoadFile

This event indicates Office Word opens a document via Open dialog. It also contains critical file open performance data and is an app start event from user perspective. The event monitors whether file-open-from-the-open-filedialog is working as expected. It is also used to calculated monthly active users/devices, and cloud reliability metrics.

The following fields are collected:

- **Data_AddDocTelemRes** - Reports whether we were able to properly populate other document telemetry related values in the event. Used for data quality diagnostics.

- **Data_BytesAsynchronous** - Number of bytes (compressed) that we believe we can open the file without if we get them before the user wants to start editing or maybe saving

- **Data_BytesAsynchronousWithWork** - Number of bytes (compressed) that we might be able to open the file without but would require significant code investments to make it happen
	
- **Data_BytesSynchronous** - Number of bytes (compressed) that we must have before we can start opening the file

- **Data_BytesUnknown** - Number of bytes in document parts that we don’t expect to find

- **Data_DetachedDuration** - How long was the activity detached from the thread

- **Data_Doc_AccessMode** - Document is read only/editable

- **Data_Doc_AssistedReadingReasons** - Predefined set of values of why document was opened in assisted reading mode

- **Data_Doc_AsyncOpenKind –** Indicates whether a cached version of the cloud document was opened and which asynchronous refresh logic was used.

- **Data_Doc_ChunkingType** - Units used for incremental document open

- **Data_Doc_EdpState** - Electronic Data Protection setting for the document

- **Data_Doc_Ext** - Document extension (docx/xlsb/pptx etc.)

- **Data_Doc_FileFormat** - File format protocol version

- **Data_Doc_Fqdn** - OneDrive or SharePoint Online Domain Name

- **Data_Doc_FqdnHash** - One-way hash of customer identifiable domain name

- **Data_Doc_IdentityTelemetryId** - A one-way hash of the user identity used to perform the open

- **Data_Doc_InitializationScenario** - Records how the document was opened

- **Data_Doc_IOFlags** - Reports on the cached flags used to set open request options

- **Data_Doc_IrmRights** - Actions permitted by the Electronic Data Protection policy that has been applied to the document/user
	
- **Data_Doc_IsIncrementalOpen** - Flag indicating that the document has been incrementally opened

- **Data_Doc_IsOcsSupported** - Flag indicating that the document is supported in the collaboration service

- **Data_Doc_IsOpeningOfflineCopy** - Flag indicating that the offline copy of a document was opened

- **Data_Doc_IsSyncBacked** - Flag indicating that an auto synced copy of the document exists on the computer

- **Data_Doc_Location** - Indicates which service provided the document (OneDrive, File Server, SharePoint etc.)

- **Data_Doc_LocationDetails** - Indicates which Known Folder provided a locally stored document

- **Data_Doc_NumberCoAuthors** - Count of the number of fellow users in a collaborative editing session

- **Data_Doc_PasswordFlags** - Indicates read or read/write password flags set

- **Data_Doc_ReadOnlyReasons** - Reasons why the document was opened read only

- **Data_Doc_ResourceIdHash** - An anonymized document Identifier used to diagnose problems

- **Data_Doc_RtcType** -  Indicates how the real-time channel (RTC) was setup for current file (Disabled, unsupported, on demand, always on, etc.).

- **Data_Doc_ServerDocId** - An immutable anonymized document Identifier used to diagnose problems 

- **Data_Doc_ServerProtocol** - the protocol version used to communicate with the service

- **Data_Doc_ServerType** - the type of the server offering the service (SharePoint, OneDrive, WOPI, etc.)

- **Data_Doc_ServerVersion** - the server version offering the service

- **Data_Doc_SessionId** - Identifies a specific document edit session within the full session

- **Data_Doc_SharePointServiceContext** - Diagnostic information from SharePoint Online requests

- **Data_Doc_SizeInBytes** - Indicator of document size

- **Data_Doc_SpecialChars** - Indicator of special chars in the document's URL or Path

- **Data_Doc_StreamAvailability** - Indicator if document stream is available/disabled

- **Data_Doc_SyncBackedType** - Indicator as to the type of document (local or service based)

- **Data_Doc_UrlHash** - One-way hash to create a naïve document identifier

- **Data_EditorDisablingRename** - Identifier of the first editor that caused for rename to be disabled

- **Data_EditorsCount** - Number of editors in the document

- **Data_ForceReadWriteReason** - Integer value representing the reason why the file was forced into read/write mode
	
- **Data_FSucceededAfterRecoverableFailure** - Indicates that open succeeded after repairing a failure while opening the document

- **Data_LastLoggedTag** - Unique tag for code call site used to identify when we fail to try the save twice (used for data quality diagnostics)

- **Data_LinkStyles** - Indicates whether we are linking to the template styles

- **Data_MainPdod** - The document identifier in Office Word process

- **Data_Measurements** - Encoded string containing the time breakdown of the different parts of open. Used to measure performance.

- **Data_MoveDisabledReason** - Error that is disabling move for the document

- **Data_MoveFlightEnabled** - Whether the flight for the move feature is enabled

- **Data_PartsUnknown** - the number of document parts that we couldn’t get data for

- **Data_RecoverableFailureInitiationLocationTag** - Unique tag for code call site used to identify the place in code where we attempt to fix the file before opening it

- **Data_RenameDisabledReason** - Error that is causing for rename to be disabled for this document

- **Data_RenameFlightEnabled** - Whether the flight for the rename feature is enabled

- **Data_SecondaryTag** - Unique tag for code call site used to add additional failure data for open

- **Data_TemplateFormat** - File format of the template that the document is based on

- **Data_UsesNormal** - Indicates whether the open document is based on the normal template


#### RenewUserOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when renew user certificates operation is performed. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logger server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.Duration** - Total time for the operation to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the operation

- **RMS.HttpCall** - indicates if there is HTTP operation

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result

- **RMS.Type** - The type of user info

#### ServiceDiscoveryOp

Collected when a user attempts to open an IRM protected doc or apply IRM protections.  It contains the information needed to be able to properly investigate and diagnose issues that happen when service discovery operation is performed. 

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.Duration** - Total time for the operation to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the operation

- **RMS.HttpCall** - Indicate if there is HTTP operation

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.OperationName** - Operation name

- **RMS.Result** - Success or fail of the operation

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the operation result


### *Office accessibility configuration subtype*

Office accessibility features​

#### Office.Accessibility.AccessibilityToolSessionPresenceWin32

Allows us to detect that the user has an Assistive technology tool and its name. This allows us to understand if an Office user is experiencing issues with a specific Assistive Technology tool.

The following fields are collected:

  - **Data\_Data\_Jaws -** indicates if Jaws was running during the session**Data\_Data\_Magic -** indicates if Magic was running during the session

  - **Data\_Data\_Magnify -** indicates if Magnify was running during the session

  - **Data\_Data\_Narrator -** indicates if Narrator was running during the session

  - **Data\_Data\_NVDA -** indicates if NVDA was running during the session

  - **Data\_Data\_SA -** indicates if SA was running during the session

  - **Data\_Data\_Supernova -** indicates if Supernova was running during the session

  - **Data\_Data\_SuperNovaessSuite -** indicates if SuperNovaAccessSuite was running during the session

  - **Data\_Data\_WinEyes -** indicates if WinEyes was running during the session

  - **Data\_Data\_ZoomText -** indicates if ZoomText was running during the session

#### Office_Apple_DarkMode

This event is collected for Office applications running under Apple platforms. The event tells us if user is running a System on DarkMode and whether the user overwrote the DarkMode System setting in Office.  We use this event to help ensure accessibility and prioritize user-experience optimization.

The following fields are collected:

- **Data_DarkModeIsEnabled** - Whether DarkMode is enabled in the system.

- **Data_RequiresAquaSystemAppearanceEnabled** - Whether DarkMode is overwritten in Office.

#### Office_Apple_HardwareKeyboardInUse_Apple

This event is collected for Office applications running under Apple platforms. The event tells us that a user is attaching a keyboard to their mobile device. The event helps us improve accessibility and optimize our user experience.

The following fields are collected:

- **Data_CollectionTime** - A timestamp denoting the event collection time.

#### Office_Apple_MbuInstrument_DeviceAccessibilitySettings

This event is collected for Office applications running under Apple platforms. The event collects the state of the different accessibility options available during a session. We use this event to help ensure accessibility and prioritize user-experience optimization.

The following fields are collected:

- **Data_AccessibilityContentSize** - A flag indicating whether this setting is enabled

- **Data_AssistiveTouchRunning** - A flag indicating whether this setting is enabled

- **Data_BoldTextEnabled** - A flag indicating whether this setting is enabled

- **Data_CollectionTime** - A flag indicating whether this setting is enabled

- **Data_DarkerSystemColorsEnabled** - A flag indicating whether this setting is enabled

- **Data_DifferentiateWithoutColor** - A flag indicating whether this setting is enabled

- **Data_GrayscaleEnabled** - A flag indicating whether this setting is enabled

- **Data_GuidedAccessEnabled** - A flag indicating whether this setting is enabled

- **Data_IncreaseContrast** - A flag indicating whether this setting is enabled

- **Data_InvertColorsEnabled** - A flag indicating whether this setting is enabled

- **Data_PreferredContentSizeCategory** - A flag indicating whether this setting is enabled

- **Data_ReduceMotionEnabled** - A flag indicating whether this setting is enabled

- **Data_ReduceTransparency** - A flag indicating whether this setting is enabled

- **Data_ReduceTransparencyEnabled** - A flag indicating whether this setting is enabled

- **Data_ShakeToUndeEnabled** - A flag indicating whether this setting is enabled. (Deprecated - used only on old builds.)

- **Data_ShakeToUndoEnabled** - A flag indicating whether this setting is enabled.

- **Data_SpeakScreenEnabled** - A flag indicating whether this setting is enabled

- **Data_SpeakSelectionEnabled** - A flag indicating whether this setting is enabled

- **Data_SwitchControlRunning** - A flag indicating whether this setting is enabled

- **Data_UAZoomEnabled** - A flag indicating whether this setting is enabled

- **Data_VoiceOverRunning** - A flag indicating whether this setting is enabled

#### Office.Word.Accessibility.LearningTools.ReadAloud.PlayReadAloud

This event indicates Office Word reads aloud the text in the document. The event is a heartbeat of the accessibility feature which allows Microsoft to evaluate the feature health of read-aloud-text.

The following fields are collected:

  - **Data\_CharacterCount -** character count of the document

  - **Data\_CharactersWithSpaceCount -** character and space count of the document

  - **Data\_IsPageCountInProgress -** is the page count in progress

  - **Data\_LineCount -** line count of the document

  - **Data\_PageCount -** page count of the document

  - **Data\_ParagraphCount -** paragraph count of the document

  - **Data\_Play -** Is this the first time for Word to read aloud

  - **Data\_ViewKind -** view type of the document

  - **Data\_WordCount -** word count of the document

#### Office.Word.Accessibility.LearningTools.ReadAloud.StopReadAloud

This event indicates Office Word stops reading aloud the text in the document. The event allows Microsoft to evaluate the feature health of read-aloud-text by measuring the working duration.

The following fields are collected:

  - None

### *Privacy subtype*

Office privacy settings 

#### Office.IntelligentService.PrivacyConsent.PrivacyEvent

This event represents a user or system initiated action that is part of the privacy User experience for Office. It is triggered on the privacy First Run dialogs, Account Privacy dialog, and privacy notifications. The event is used to understand the following: users consenting to Office privacy settings, users changing Office privacy settings, and Office privacy settings getting updated in user sessions.

The following fields are collected:

  - **Data_ActionId -** User action in a privacy dialog

  - **Data_ControllerConnectedServicesState -** User policy setting for additional optional connected experiences

  - **Data_DownloadedContentServiceGroupState -** User setting for downloaded content 
 
  - **Data_ForwardLinkId -** Link to privacy documentation for the user scenario

  - **Data_HRESULT -** Record of errors during interaction with a privacy dialog

  - **Data_IsEnterpriseUser -** User license category

  - **Data_OfficeServiceConnectionState -** User setting for connected services

  - **Data_RecordRegistry -** Record of showing the enterprise privacy dialog

  - **Data_Scenario -** First run scenario based on the user license and category

  - **Data_SeenInsidersDialog -** Record of showing the Insiders privacy dialog

  - **Data_SendTelemetryOption -** User setting for telemetry

  - **Data_SendTelemetryOptionPolicy -** User policy setting for telemetry

  - **Data_UserCategory -** User account type  

  - **Data_UserCCSDisabled -** User override for additional optional connected experiences

   - **Data_UserContentServiceGroupState -** User setting for analyzing content

  - **Data_WillShowDialogs -** Record of user needing to see privacy First Run dialogs



## Product and service performance data events

The following are the data subtypes in this category:
- [Unexpected application exit (crash)](#unexpected-application-exit-crash-subtype)
- [Application feature performance ​](#application-feature-performance-subtype)
- [Application activity error](#application-activity-error-subtype)

### *Unexpected application exit (crash) subtype*

Unexpected application exits and the state of the application when that happens​.

#### Office.AppDomain.UnhandledExceptionHandlerFailed

Collects information for any unhandled exceptions using the Data Streamer App. This data is used to monitor the health of the application. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Exception** - Call stack for the Exception

- **Event Name** - Event Name is the Event Category and Event Label.

#### Office_Apple_IdentityDomainName

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our system as well as investigating causes of failures by certain domain users. We collect the domain used by our users when they authenticate.  We use this data to help identify and fix those issues that might not seem too impactful at a broader level, but that turn out to be very impactful to a certain domain of users.

The following fields are collected:

- **Data_Domain** - the domain used for authentication

- **Data_IdentityProvider** - The authentication identity provider name. (i.e. LiveId or ADAL)

- **Data_IdentityProviderEnum** - The authentication identity provider code. (A number)

#### Office_Apple_SystemHealthAppExitMacAndiOS

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our Office applications as well as for investigating causes of failures. We collect data on each application exit to determine whether an application exited gracefully.

The following fields are collected:

- **Data_AffectedProcessSessionID** - The identifier for the session that experience the application exit.

- **Data_AffectedSessionBuildNumber** - The minor version of the application in which an application exit was observed.

- **Data_AffectedSessionDuration** - The length of the session from start to exit

- **Data_AffectedSessionIDSMatch** - An indicator of telemetry health.

- **Data_AffectedSessionMERPSessionID** - An indicator of telemetry health.

- **Data_AffectedSessionOSLocale** - The Locale of the OS under which the application exit was observed.

- **Data_AffectedSessionOSVersion** - The OS version under which the application exit was observed.

- **Data_AffectedSessionResidentMemoryOnCrash** - The amount of resident memory that was consumed when the application exit occurred

- **Data_AffectedSessionStackHash** - An identifier that will denote the specific error being hit.

- **Data_AffectedSessionStartTime** - The time at which the session started.

- **Data_AffectedSessionUAEType** - The type of application exit observed (if it was an ungraceful exit, this code will denote the type of error observed)

- **Data_AffectedSessionVersion** - The major version of the application in which an application exit was observed.

- **Data_AffectedSessionVirtualMemoryOnCrash** - The amount of virtual memory that was consumed when the application exit occurred.

- **Data_ExitWasGraceful** - Whether the application Exit was graceful or ungraceful.

#### Office.Extensibility.COMAddinUnhandledException

Event generated when COM Add-in crashes on a consumer version of Office applications. 

Usage: this is used to compute a global, non-enterprise-specific Office 365 ProPlus "adoption" for an add-in which is then published on readyforwindows.com and other tools like the Readiness Toolkit. This allows enterprise customers to validate if the add-ins they have deployed in their organizations are compatible with the latest versions of Office 365 ProPlus and plan their upgrades accordingly. 

The following fields are collected:

- **ScopeId** – the current thread scope

- **Method** – Office method where exception occurred

- **Interface** – Office interface where exception occurred

- **AddinId** – the add-in Class Id

- **AddinProgId** – deprecated

- **AddinFriendlyName** – deprecated

- **AddinTimeDateStamp** – the add-in timestamp from the DLL metadata

- **AddinVersion** – deprecated

- **AddinFileName** – deprecated

- **VSTOAddIn** – whether add-in is VSTO

- **AddinConnectFlag** – current load behavior

- **LoadAttempts** – number of attempts to load add-in

#### Office.Extensibility.COMAddinUnhandledExceptionEnterprise

Event generated when COM Add-in crashes on an enterprise version of Office applications.

Usage: this is used to compute a global, non-enterprise-specific Office 365 ProPlus "adoption" for an add-in which is then published on readyforwindows.com and other tools like the Readiness Toolkit. This allows enterprise customers to validate if the add-ins they have deployed in their organizations are compatible with the latest versions of Office 365 ProPlus and plan their upgrades accordingly. 

- **ScopeId** – the current thread scope

- **Method** – Office method where exception occurred

- **Interface** – Office interface where exception occurred

- **AddinId** – the add-in Class Id

- **AddinProgId** – deprecated

- **AddinFriendlyName** – deprecated

- **AddinTimeDateStamp** – the add-in timestamp from the DLL metadata

- **AddinVersion** – deprecated

- **AddinFileName** – deprecated

- **VSTOAddIn** – whether add-in is VSTO

- **AddinConnectFlag** – current load behavior

- **LoadAttempts** – number of attempts to load add-in

#### Office.Extensibility.Sandbox.ODPActivationHeartbeat

Office Add-ins run in a sandbox. This event collects heartbeat information on activations. When an add-in crashes, this event collects why it crashed in the case it’s related to our sandbox. Used to investigate when customers escalate issues.
 
The following fields are collected:

- **AppId** - ID of the App

- **AppInfo** - Data regarding the type of add-in (task pane or UILess or in content etc.) and the provider type (omen, SharePoint, filesystem etc.)

- **AppInstanceId** - ID of the app instance 

- **AssetId** - Asset ID of the app

- **ErrorCode** - Total time spent 

- **NumberOfAddinsActivated** - Counter of add-ins activated

- **RemoterType** - Specifies the type of remoter (Trusted, untrusted, Win32webView, Trusted UDF, etc.) used to activate the add-in

- **StoreType** - Origin of the app

- **Tag**- Specifies where exactly the code has failed using the unique tag associated with it.

- **UsesSharedRuntime** - indicates the app uses sharedRuntime or not.


#### Office.Extensibility.VbaTelemetryBreak

Event generated when a macro-enabled file runs into a compile or runtime error

Desktop Analytics: This is used as numerator in the computation of enterprise-specific health status for macro types (e.g. Word macros, Excel macros, etc.) which is used to infer during pilot if the add-in is "ready to upgrade" in the production ring.

The following fields are collected:

- **TagId** – the id of the telemetry tag

- **BreakReason** – the reason for the break (runtime, compile, other error)

- **SolutionType** – type of solution (document, template, app add-in, COM add-in)

- **Data.ErrorCode** – error code reported by VBA engine


#### Office.FindTime.AppFailedToStart

Collected when app fails to start due to an unexpected error during startup. Used to track exceptions & crashes.  Helps monitor and debug app health.

The following fields are collected: 

- **DateTime** - Timestamp of when the event is logged.

- **EventName** - The name of the event being logged.

#### Office.Outlook.Desktop.HangBucketMetrics

Collects hang time for outlook hangs – a unique identifier per hang, elapsed time, and call stack information. The data is used to detect and identify app crashes in order to fix in future updates.

The following fields are collected:

  - **BucketId** - hash of the call stack

  - **ElapsedTotal** - total time spent in the call

  - **ElapsedHanging** - hang time spent in the call

#### Office.Outlook.Desktop.HangReportingScopePerfMetrics

Collects time taken for outlook core scenarios – switchfolder, switchmodule, sendmailoutbox, openitemclassic, sendmailtransport. The data is actively monitored for anomalous performance issues. It is used to detect and diagnose performance issues as well as improve performance with each update.

The following fields are collected:

  - **ElapsedTotal** - Total time spent in this call

  - **ScopeId** - name of the function containing the declaration or a custom name given through scope definition

#### Office.Outlook.Desktop.WatsonBuckets

This rule collects the crash information from the event logs when Outlook crashed in the previous session.

The data is actively monitored for anomalous hangs. It is used to detect and identify hangs in order to fix in future updates.

The following fields are collected:

  - **BucketId** – hash of the call stack

  - **ElapsedTotal** - total time spent in the call

  - **ElapsedHanging** - hang time spent in the call

#### Office.PowerPoint.Session

Collecting feature usages on each PowerPoint session. This data is used to calculate the ratio of PowerPoint ungraceful exit while using a feature. The ratio of PowerPoint ungraceful exit is a key signal to guarantee PowerPoint is running as expected.

The following fields are collected:

  - **Flag** – session flags

  - **Usage** – feature usages

#### Office.PowerPoint.UAE.Dialog

Collected every time when PowerPoint ungracefully exited while a dialog open on top of PowerPoint main window. This information is critical to catch PowerPoint ungracefully exits due to an active dialog blocking PowerPoint main window. Microsoft is using this data to diagnose the issue in order to guarantee PowerPoint running as expected.

The following fields are collected:

  - **DlgCnt** – total number of open dialogs when session crashed

  - **DlgId** – open dialog identifier

  - **IdType** – open dialog identifier type

  - **InitTime** – crashed session initialized time

  - **SessionId** – crashed session identifier

  - **TopId** – top dialog identifier

  - **Version** – crashed session version

#### Office.PowerPoint.UAE.Document

Collecting what feature is being used on a document when PowerPoint ungracefully exited. These features include slide show, document open, save, edit, co-authoring, shutdown. This information is critical to catch PowerPoint ungracefully exits while using a feature. Microsoft is using this data to diagnose the issue in order to guarantee PowerPoint running as expected.

The following fields are collected:

  - **CoauthFlag** – coauth usage flags

  - **CommandFlag** – document modification flags

  - **FileIOFlag** – file IO usage flags

  - **InitTime** - crashed session initialized time

  - **Location** – document location

  - **ServerDocId** – server document identifier

  - **SessionId** - crashed session identifier

  - **UrlHash** – document URL hash

  - **Usage** – feature usages

  - **Version** - crashed session version

#### Office.PowerPoint.UAE.Open

Collecting every time when PowerPoint ungracefully exit while opening a document. This information is critical to catch PowerPoint ungracefully exits while opening a document. Microsoft is using this data to diagnose the issue in order to guarantee PowerPoint running as expected.

The following fields are collected:

  - **FileUrlLocation** – document URL location

  - **Flag** – open flags

  - **InitTime** - crashed session initialized time

  - **Location** - document location

  - **OpenReason** – open reason

  - **ServerDocId** – server document identifier

  - **SessionId** - crashed session identifier

  - **UrlHash** - document URL hash

  - **Version** - crashed session version

#### Office.PowerPoint.UAE.Session

Collecting what feature have been used when PowerPoint session ungracefully exited.  This information is critical to catch PowerPoint ungracefully exits. Microsoft is using this data to diagnose the issue in order to guarantee PowerPoint running as expected.

The following fields are collected:

  - **Flag** – session flags

  - **InitTime** - crashed session initialized time

  - **PreviousSessionId** - crashed session identifier

  - **Usage** – feature usages

  - **Version** - crashed session version

#### Office.PowerPoint.UAE.Shutdown

Collecting PowerPoint ungracefully exit while shutting down. This information is critical to catch PowerPoint ungraceful exits while shutting down. Microsoft uses this data to diagnose the issue in order to guarantee PowerPoint runs as expected.

The following fields are collected:

  - **InitTime** - crashed session initialized time

  - **SessionId** - crashed session identifier

  - **Stage** – shutdown stage

  - **Version** - crashed session version

#### Office.PowerPoint.UAE.SlideShow

Collecting PowerPoint ungracefully exit while shutting down. This information is critical to catch PowerPoint ungraceful exits while shutting down. Microsoft uses this data to diagnose the issue in order to guarantee PowerPoint runs as expected.

The following fields are collected:

  - **InitTime** - crashed session initialized time

  - **Mode** – slide show mode

  - **SessionId** - crashed session identifier

  - **State** – slide show state

  - **Version** - crashed session version

#### Office.Programmability.Telemetry.AddInCrash

Event generated when a COM Add-in is loaded. This information is critical to determine whether an add-in caused an Office application crash. It is used to assess global add-in compatibility with Office applications.

The following fields are collected:

  - **CLSID** – the add-in Class identifier

  - **ConnectFlag** – the current add-in load behavior

  - **FileName** – the add-in file name, excluding the file path

  - **FriendlyName** – the add-in friendly name

  - **Interface** – the Office interface where the exception occurred

  - **LoadAttempts** – the number of attempts to load the add-in

  - **Method** – the Office method where the exception occurred

  - **OfficeApplication** – the Office application where the exception occurred

  - **OfficeVersion** – the versions of Office

  - **ProgID** – the add-in Prog identifier

#### Office.Programmability.Telemetry.MacroFileOpened 

Triggered upon opening a macro (VBA)-containing file on a device that has been onboarded to Office Apps as a Service (OAAS) by the IT admin and where Office 365 ProPlus has been activated with an enterprise license. The event is used to understand the health of macro(VBA)-containing files in a tenant and is compared to Office.Programmability.Telemetry.VbaTelemetryBreak which tracks errors on VBA-containing files. 

No fields are collected.

#### Office.System.SystemHealthUngracefulAppExitMacAndiOS

On boot event that captures ungraceful app exits for further investigation.

The following fields are collected:

- **AffectedProcessAppBuild** – Build number

- **AffectedProcessAppBuildRevision** – Build Revision Number

- **AffectedProcessAppMajorVer** – Major version number of App

- **AffectedProcessAppMinorVer** – Minor version number of App

- **AffectedProcessAppName** – Application name

- **AffectedProcessResidentMemoryOnCrash** – Resident memory of crashed app

- **AffectedProcessUnsymbolicatedChecksum** – Goes with Stack hash for symbolization

- **AffectedProcessVirtualMemoryOnCrash** – Virtual memory of crashed app

- **AffectedSessionDuration** – Duration of session in seconds before crash

- **AffectedSessionLongBuildNumber** – Long build number

- **CrashedProcessSessionID** – SessionID of the process in app crash

- **DetectionTime** – DateTime of app crash
	
- **DeviceModel** – Hardware model

- **MERPSessionID** – Session ID of MERP

- **ReportingOsLocaleTag** – OS locale

- **ReportingOSVerStr** – OS version

- **SessionBuildNumber** – Crashed App’s version

- **SessionIDSMatch** – Boolean to verify whether reporting session ID is the same as picked up by Merp

- **SessionVersion** – Crashed App’s version– **StackHash** – Hash of the crashed app’s stack trace

- **UAEType** – Enum giving us information on what type of crash it was

#### Office.ThisAddIn.StartupFailed

Collects information for exception that occur during startup of the Data Streamer App. This data is used to monitor the health of the application. This event is generated by Microsoft Data Streamer for Excel Add-in.

The following fields are collected:

- **Exception** - Call stack for the Exception

- **Event Name** - Event Name is the Event Category and Event Label.


### *Application feature performance subtype*

Poor response time or performance for scenarios such as application start up or opening a file.

#### Initial_page_landing 
 
This event helps track the type of experience that users see when they land in our application page.  This data is used to determine the traffic of users piped into each experience in our application and also helps us to easily consolidate experimentation results.
 
The following fields are collected: 

- **Page** - This is used to track the type of experience that user first sees when they land on our page. Possible values are “Trial”, “Skip”, “Prebundled”, “Subscription” etc.

- **storeExperience** - This is used to determine if user was eligible to see the Store SDK Experience.

- **stringVariant** - This is used to determine the type of strings that user sees when they land on our page. Note that for any page such as “Trial”, user can be eligible to see different strings based on whether they had Legacy Office installed, or if they had previously activated Office. Possible enumerations of this property are “LegacyUpsell”, “OfficeOpened”, “Default”, “YesIntent”, “NoIntent” etc.

- **windowsBuildType** - This is used to track the type of WindowsBuildType that user is on. i.e. “RS4”, “RS5”, “RS19H1”, “Vibranium etc. As our experiences are usually targeted to different WindowsBuildTypes, this property is vital in differentiating between rollouts. 

#### IpcpBootstrapUser

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when the IpcpBootstrapUser API call is made.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **iKey** - Logging service server Id

- **RMS.ApplicationScenarioId** - Scenario Id provided by the application

- **RMS.AuthCallbackProvided** - Indicate if provides the authentication callback as input of the API call or not

- **RMS.ConnectionInfo.ExtranetUrl** - the extranet URL in connection info

- **RMS.ConnectionInfo.IntranetUrl** - the intranet URL in connection info

- **RMS.ConnectionMode** - The connection mode between Rights Management Service client and server: online or offline

- **RMS.Duration** - Total time for API call to complete

- **RMS.DurationWithoutExternalOps** - Total time minus external operations consumed, such as network latency.

- **RMS.ErrorCode** - The error code returned if any from the API call

- **RMS.GuestTenant** - Guest tenant Id for the user

- **RMS.HomeTenant** - Home tenant Id for the user

- **RMS.HttpCall** - indicate if there is HTTP operation

- **RMS.Identity.ExtranetUrl** - The extranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.IntranetUrl** - The intranet URL of Rights Management service server for the user, collected while getting a new Rights Account Certificate from the server

- **RMS.Identity.Status** - The first time to get Rights Account Certificate from the server or renew the Rights Account Certificate 

- **RMS.Identity.Type** - The type of the user account such as windows account or live account

- **RMS.Identity.UserProvided** - Indicate if the user email address provided or not while getting new Rights Account Certificate from the server

- **RMS.IssuerId** - The Id of the Rights Management Service server which issues Rights Account Certificate  

- **RMS.LicenseFormat** - The license Format: Xrml or Json

- **RMS.RACType** - The type of Rights Accounts Certificate

- **RMS.Result** - Success or fail of the API call

- **RMS.ScenarioId** - Scenario Id defined by the API

- **RMS.SDKVersion** - The version of Rights Management Service Client

- **RMS.ServerType** - The type of Rights Management Service Server 

- **RMS.StatusCode** - Status code of the returned result

- **RMS.TemplatesCount** - The number of the templates

- **RMS.TokenProvided** - Indicate if provides the token as input of the API call or not 

- **RMS.UserProvided** - Indicate if provides the consumer as input of the API call or not 

- **UserInfo.UserObjectId** - The user object Id

#### json_parse_error 
 
This event denotes that an error is thrown by the json parser.  We will be able to debug the read registry string that was sent to the json parser, to allow a smooth experience for our users.
 
The following fields are collected: 

- **Error** - This consists of the error message that the error object returns.

#### Office_Apple_Apple_AppBoot_Mac

This event is collected for Office applications running under Apple platforms. The event is used to collect the time taken to boot the app, as well as some details on the type of boot done. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_ Data_EvtBootTimerDocStageReady** - Time elapsed until reaching certain point in code.

- **Data_DocumentRecoveryInvoked** - Whether document recovery was invoked during boot.

- **Data_EvtBootTimerBootIdle** - Time elapsed until reaching certain point in code.

- **Data_EvtBootTimerFinishLaunchEnd** - Time elapsed until reaching certain point in code.

- **Data_EvtBootTimerLaunchDidFinish** - Time elapsed until reaching certain point in code.

- **Data_EvtBootTimerLaunchStart** - Time elapsed until reaching certain point in code.

- **Data_EvtBootTimerMainStart** - Time elapsed until reaching certain point in code.

- **Data_EvtBootTimerStaticInit** - Time elapsed until reaching certain point in code.

- **Data_EvtDockStageReady** - Time elapsed until reaching certain point in code.

- **Data_IsFileOpenAttempted** - Whether a file open was attempted during boot.

- **Data_IsFirstRunAttempted** - Whether the app boot went thru first run experience.

- **Data_SentToBackground** - Whether the app was sent to background during boot.

#### Office_Apple_DiskRuleResultSerializerErrorOnStreamOp

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our telemetry infrastructure. This event denotes an error has occurred.

The following fields are collected:

- **Data_ActualBytesModified** - Number of bytes modified.

- **Data_BytesRequested** - Number of bytes to process.

- **Data_IsWriteOp** - Whether we are about to execute a write operation

#### Office_Apple_MacBootResourceUsage

This event is collected for Office applications running under Apple platforms. This event is collected for Office applications running under Apple platforms. The event is used to collect multiple indicators around the resources being consumed during boot by Office apps. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_BlockInputOperations** - A count of block input operations

- **Data_BlockOutputOperations** - A count of block output operations

- **Data_InvoluntaryContextSwitches** - The number of involuntary context switches

- **Data_MainThreadCPUTime** - An elapsed time measurement

- **Data_MaxResidentSize** - A memory size measurement

- **Data_MessagesReceived** - The number of messages received

- **Data_MessagesSent** - The number of messages sent

- **Data_PageFaults** - A count of page reclaims

- **Data_PageReclaims** - A count of page reclaims

- **Data_ProcessCPUTime** - An elapsed time measurement

- **Data_SharedTextMemorySize** - A memory size measurement

- **Data_SignalsReceived** - The number of signals received

- **Data_Swaps** - A count of data swaps

- **Data_SystemCPUTime** - An elapsed time measurement

- **Data_SystemUpTime** - An elapsed time measurement

- **Data_UnsharedDataSize** - A data size measurement

- **Data_UnsharedStackSize** - A stack size measurement

- **Data_UserCPUTime** - An elapsed time measurement

- **Data_VoluntaryContextSwitchesNvcsw** - The number of voluntary context switches

#### Office_Apple_MAU_Validation

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of the Microsoft Autoupdate component, which is used to distribute and install application updates. The data collected is used for detecting errors and investigating causes of failures.

The following fields are collected:

- **Data_EventID** - We collect a string representing an error code

- **Data_Message** - We collect a string containing a description of the error

#### Office_Apple_MbuInstrument_Hang_Detection_Spin_Control

This event is collected for Office applications running under Apple platforms. The event is logged whenever an application appears to become non-responsive. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_CountSpinControlStart** - A marker than indicates that the application appears to have become unresponsive (or slow to respond)

#### Office_Apple_MbuInstrument_VMOnDocumentClose

This event is collected for Office applications running under Apple platforms. The event is used to collect a snapshot of the state of memory during document close. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_CollectionTime** - A timestamp from the moment in which the data was collected

- **Data_ResidentMemory** - Observed resident memory value

- **Data_VirtualMemory** - Observed virtual memory value

#### Office_Apple_MbuInstrument_VMOnShutdown

This event is collected for Office applications running under Apple platforms. The event is used to collect a snapshot of the state of memory during application shutdown. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_CollectionTime** - A timestamp from the moment in which the data was collected

- **Data_ResidentMemory** - Observed resident memory value

- **Data_VirtualMemory** - Observed virtual memory value

#### Office_Apple_MbuInstrument_VMOnStart

This event is collected for Office applications running under Apple platforms. The event is used to collect a snapshot of the state of memory during application start. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_CollectionTime** - A timestamp from the moment in which the data was collected

- **Data_ResidentMemory** - Observed resident memory value

- **Data_VirtualMemory** - Observed virtual memory value

#### Office_Apple_MsoAppDelegate_BootPerf

This event is collected for Office applications running under Apple platforms. The event is used to collect time and memory consumed during boot by Office apps, as well as some details on the type of boot done. This event helps us monitor our performance and provide performance improvements.

The following fields are collected:

- **Data_AppLaunchDurationMicroSec** - The duration of the boot process

- **Data_AppLaunchFinishSystemTime** - A timestamp at a particular boot code marker

- **Data_AppLaunchStartSystemTime** - A timestamp at a particular boot code marker

- **Data_ResidentMemory** - A snapshot of the available resident memory during boot

- **Data_VirtualMemory** - A snapshot of the available virtual memory during boot

#### Office_Apple_UngracefulAppExitHangsInPreviousSession

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our Office applications as well as for investigating causes of failures. We collect the number of times an application appeared to be unresponsive prior to hitting an ungraceful application exit.

The following fields are collected:

- **Data_HangsDetected** - The number of times the application appeared to become unresponsive prior to observing the ungraceful application exit.

- **Data_LastSessionId** - The identifier for the session in which the ungraceful application exit was observed.

- **Data_SessionBuildNumber** - The minor version of the application in which an ungraceful application exit was observed.

- **Data_SessionVersion** - The major version of the application in which an ungraceful application exit was observed.

#### Office_Apple_WhatsNewErrorAndWarning

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of the What’s New feature. This event denotes that an error/warning occurred while parsing What's New content, pointing to potential content authoring issues.

The following fields are collected:

- **Data_ContentKey** - A pointer to the section of the content that is likely to have caused the error.

- **Data_ErrorCode** - The observed error code (if available)

- **Data_ErrorDescription** - A description of the error (if available)

- **Data_EventID** - We collect a string representing the type of error observed.

- **Data_IncludesHTMLTag** - Whether the content contains rich html

- **Data_IncludesItemsTag** - Whether the content contains a hierarchy of items

- **Data_LengthOfRawData** - The size of the content

- **Data_RequestURL** - The URL from which the content was downloaded

- **Data_ServerLanguageTag** - The language the content was in.

- **Data_StatusCode** - The status of the error (if available)

#### Office.Extensibility.RichApiMethodInvocation

When customer uses an Office Add-in and calls Rich API for providing service, this event will be triggered. Used to measure the service reliability, performance and usage for Rich API method invocation.
 
The following fields are collected:

- **Api** - Full name of the API

- **DispFlag** - A bit flag describing the type of method call (Ex: 0x1 = METHOD, 0x2 = PROPERTYGET, 0x4 = PROPERTYPUT, 0x8 = PROPERTYPUTREF)

- **DispId** - Dispatch ID for the method being called

- **HResult** - HResult for the method call

- **Latency** - Latency for the call, in microseconds

- **ReqId** - GUID for the batch request that this method belongs to

- **TypeId** - GUID for the interface on which this method being called


#### Office.Manageability.Service.ApplyPolicy

Critical telemetry to track failure\\Success of applying cloud policy settings to registry. LastError tells why and where the Application of policy in registry failed.

The following fields are collected:

  - **Data.ApplyLogMsg** - The exception msg if any while policy was being applied

  - **Data.Cid** - dynamically generated correlation identifier sent to the service when the service call was made to fetch the cloud policy. Used to correlate which call caused an issue while applying the policies on the cloud.

  - **Data.Last Error** - One of five string values (enumerators) to log which stage of policy application was being executed when the exception occurred

#### Office.Outlook.Desktop.BootPerfMetrics

Collects time taken to boot Outlook. The boot time of Outlook is actively monitored to detect and diagnose regressions. It is also used to diagnose customer escalations as well as improve boot performance over time.

The following fields are collected:

  - **AddinElapsedTotal** - Total time spent for loading add-ins

  - **CredPromptCount** – Number of credential prompts shown

  - **ElapsedTotal** - Total time spent for boot

  - **IsLoggingEnabled** - Is logging enabled

  - **ShowChooseProfileDlg** – Whether the Choose Profile Dialog was shown

  - **ShowFirstRunDlg** - is outlook launched for the first time

  - **ShowIMAPSrchfldWarningDlg** - Warnings in case we have an IMAP account with an ANSI PST

  - **ShowNeedSupportDlg** - Boot failure triggered support dialog

  - **ShowSafeModeDlg** - is the session opened in safe mode

  - **ShowScanPstDlg** - Store repair check displayed error message


#### Office.Outlook.Mac.BootPerf

Collects time taken to boot Outlook. The boot time of Outlook is actively monitored to detect and diagnose regressions. It is also used to diagnose customer escalations as well as improve boot performance over time.

The following fields are collected:

- **MacOLKBootPerfDuration** - total time spent booting

- **MacOLKBootPerfID** - identifier for the time spent booting


#### Office.Outlook.Mac.PerformanceUnresponsive

Used to identify user impacting issues in Outlook that may manifest as degraded performance. 

The following fields are collected:

- **Duration** - time elapsed of degraded performance

- **EventType** - type of event experiencing degraded performance


#### Office.Performance.Boot

Collected when an Office application is booted. Includes whether the boot was initiated by opening a file or launching via the Start menu, whether this was the first boot of the application, how much memory the application is using, and whether there was any blocking UI shown to the user. Used to measure how fast Office applications boot and how much memory they use when they start, to ensure there is an acceptable user experience.

The following fields are collected:

  - **ActivationKind** - Whether the application was started by launching from the Start menu, by opening a file, or through OLE Automation.
  
  - **BootToStart** - Whether the user has chosen to show the start screen when this application starts.

  - **DocLocation** -  When opening a document, indicates which service provided the document (OneDrive, File Server, SharePoint, etc.).

  - **FirstBoot** - Whether this was a first boot of the application.

  - **InitializationDuration** - The duration in microseconds it took to first initialize the Office process.

  - **InterruptionMessageId** - If the boot was interrupted by a dialog asking for user input, the ID of the dialog.

  - **TotalWorkingSetMB** - The amount of memory in megabytes in the process’s working set.

  - **VirtualSetMB** - The amount of memory in megabytes in the process’s virtual set. (MacOS / iOS only)

  - **WorkingSetPeakMB** - The largest amount of memory in megabytes that was ever in the process’s working set so far.

#### Office.UX.OfficeInsider.CanShowOfficeInsiderSlab

Activity tracking whether the Office Insider slab can be shown to the user on the Account tab in the Office Backstage UI.

The following fields are collected:

  - **Data_CanShow** - Indicates whether the Office Insider Slab can be shown to the user on the Account tab in the Office Backstage UI.
  
  - **Data_Event** - Unused

  - **Data_EventInfo** - Unused

  - **Data_Reason** - Unused
 

#### Office.UX.OfficeInsider.RegisterCurrentInsider

Critical signal for tracking success or failure of registering users using Office Insider builds who weren't registered as Office Insiders before. Main scenario for this is current Office Insiders who joined Office Insider program before registration of Office Insiders was added.

The following fields are collected:

- **Data_RegisterInsider** - Status of Office Insider registration

- **Data_RegisterInsiderHr** - Result code for Office Insider registration

- **Data_RegistrationStateCurrent** - Current registration state

- **Data_RegistrationStateDesired** - Requested registration state


#### Office.UX.OfficeInsider.ShowOfficeInsiderDlg

Critical signal tracking user interaction with Join Office Insider dialog. It is used for identifying any issues in performing user-initiated changes such as joining or leaving Office Insider program and changing Office Insider level.

The following fields are collected:

- **Data_AcceptedContactMeNew** - Indicates if a user has accepted to be contacted by Microsoft upon joining Office Insider program

- **Data_InsiderLevel** - Insider Level on opening of “Join Office Insider” dialog

- **Data_InsiderLevelNew** - Insider level on closing of “Join Office Insider” dialog

- **Data_IsInternalUser** - Indicates whether the application runs under the credentials of a Microsoft corporate account.

- **Data_IsInternalUserInit** - Indicates whether the code could determine whether the application runs under the credentials of a Microsoft corporate account.

- **Data_OpenNewsletterWebpage** - Indicates whether Office Insider Newsletter Subscription link was triggered under condition that user has joined Office Insider program, Newsletter Subscription feature is enabled, and the user have not cancelled opening of Office Insider Newsletter Subscription webpage.
	
- **Data_RegisterInsider** - Status of Office Insider registration

- **Data_RegisterInsiderHr** - Result code for Office Insider registration

- **Data_RegistrationStateCurrent** - Current registration state

- **Data_RegistrationStateDesired** - Requested registration state




#### Office.Visio.Shared.VisioFileRender

This event captures file render time. This event helps us keep file render performance in check.

The following fields are collected:

  - **Data\_AvgTime: integer** - Average time it took to render Visio drawing in a session

  - **Data\_CompositeSurfEnabled: bool** - true is composite rendering mode is enabled

  - **Data\_Count: integer** - Number of time Visio renders the drawing in a session

  - **Data\_FirstRenderTime: long** - duration to render file on first launch in millisecond

  - **Data\_MaxTime: integer** - Max time it took to render Visio drawing in a session

#### Office.Visio.VisioFileOpenReliability

This event collects File open perf data for Visio Dev16. This event is used to monitor performance of File open and associates it with file properties like file size for Visio Dev16. File properties enable us debug and root cause issues faster.

The following fields are collected:

  - **Data\_CorrelationId: string -**Document correlation identifier

  - **Data\_DocIsEnterpriseProtected: bool -** true if document is protected with Windows information protection

  - **Data\_DocumentId: string -** GUID of file path

  - **Data\_DurationToCompleteInMilliseconds: double -** Duration to complete save as in millisecond

  - **Data\_DurationToCompleteInMillisecondsSquared: double -**squared value for DurationToCompleteInMilliseconds

  - **Data\_ErrorCode: integer -** Internal error code for file open failure

  - **Data\_Extension\_Docs: string -** File extension of diagram opened

  - **Data\_FileIOBytesRead: int -** total bytes read while saving

  - **Data\_FileIOBytesReadSquared: int -** squared value of Data\_FileIOBytesRead

  - **Data\_FileIOBytesWritten: int -** total bytes written while saving

  - **Data\_FileIOBytesWrittenSquared: int -** squared value of Data\_FileIOBytesWritten

  - **Data\_FileName: binary -** Binary Hash of file name

  - **Data\_FileOpenDownloadDurationInMs: long -**duration to download file in milliseconds

  - **Data\_FileOpenEndDurationInMs: long: -**duration to open file in millisecond

  - **Data\_FileOpenTimeStamp: time: -**Time stamp when file started opening

  - **Data\_FilePathHash: binary -** GUID for file path

  - **Data\_FileSize: long -** Document size in bytes

  - **Data\_FileType: string -** File extension of diagram opened

  - **Data\_IsInternalFile: bool -** true if file is an internal file. e.g. Stencil

  - **Data\_IsIRM: bool -** true if file is Information Right Protected

  - **Data\_IsReadOnly: bool -** true if the file is read only

  - **Data\_IsSuccess: bool -** true when file open was successful

  - **Data\_Location: string -** location of the file like Local, SharePoint, OneDrive, WopiConsumer, WopiBusiness, GenericThirdPartyConsumer

  - **Data\_NetworkIOBytesRead: int -** total network bytes read while saving

  - **Data\_NetworkIOBytesReadSquared: int -** squared value of Data\_NetworkIOBytesRead

  - **Data\_NetworkIOBytesWritten: int -** total network bytes written while saving

  - **Data\_NetworkIOBytesWrittenSquared: int -** squared value of NetworkIOBytesWritten

  - **Data\_OpenLocation: integer -** Location of the file from which it was opened 0 , Local, 1, Network, 2, SharePoint, 3 – Web

  - **Data\_Size\_Docs: integer -** Document size in bytes

  - **Data\_Tag: string -** unique identifier to identify Save AS event

  - **Data\_WasSuccessful: bool -** true if open as was successful

### *Application activity error subtype*

Errors in functionality of a feature or user experience.

#### Office.AirSpace.Backend.Win32.GraphicsDriverSoftHang 

Helps Microsoft separate long video card driver hangs from short ones, which in turn helps make decisions about which video card drivers may be having problems. The user's video card driver has caused Office to hang, but the impact of the hang is not known yet

The following fields are collected:

  - **Data\_InDeviceCall** - The method called on the video card that produced the hang

  - **Data\_Timeout** - How long the hang lasted

#### Office_Apple_Licensing_Mac_DRActivationFailures

This event is collected for Office applications running under Apple platforms. The event is used for capturing digital river activation failures (the event logs the key and product that was used to activate, as well as the error code received).  This event is used for detecting and helping troubleshoot activation failures (Digital River issues).

The following fields are collected:

- **Data_DigitalRiverID** - Digital River product Id that maps to this Office product SKY

- **Data_Error** - A string representing an activation error code.

- **Data_ProductKey** - Product key that was attempted to be activated

- **Data_ProductKeyHash** - An encoded product key being activated

#### Office_Apple_Licensing_Mac_GetMachineStatusErrors

This event is collected for Office applications running under Apple platforms. The event collects the error code returned while periodically checking the validity of a subscription license. The error code can signify server unavailability but also license expiration, machine count limit, invalid hardware ID, etc.  This event is used to monitor the health of the Office Licensing Service but also to investigate issues related to subscription machine management.

The following fields are collected:

- **Data_Error** - We collect a string representing an error code.

#### Office.Extensibility.Sandbox.ODPErrorNotification

Tracks the various error notifications received from the sandbox. Used to detect the error scenarios in sandbox and there by fixing it, to improve productivity of the user
 
The following fields are collected:

- **AppId** - Id of the App

- **AppUrl** - scrubbed app URL 

- **Result** - result error code

#### Office_FirstRun_Apple_MacONIOLKFirstRunStarted

This event is collected for Office applications running under Apple platforms. The event lets us know a user has entered first run experience. We use this event to figure out if the First-Run Experience (FRE) was started successfully.

The following fields are collected:

- **Data_FirstRunCollectionTime** - A timestamp registering the time at which the flow was started.

#### Office.Graphics.ARCExceptions 

This exception reporting information is important for assessing the overall health of the graphics stack, as well as identifying parts of the code where failures are occurring at high frequency, in order to prioritize investigation. This exception reporting information is important for assessing the overall health of the graphics stack, as well as identifying parts of the code where failures are occurring at high frequency. This helps an engineer to determine which rendering failures are impacting the most users, enabling us to prioritize our investigations toward fixing issues that will have the greatest user benefit.

The following fields are collected:

  - **Data\_HResult** - The error code returned from failure

  - **Data\_TagCount** - The count of each failure that occurred

  - **Data\_TagID** - The identifier of the failure that occurred

#### Office.Outlook.Desktop.Calendar.AcceptCalShareNavigateToSharedFolder\_Error

Collects information when any failure occurs when while Navigation to shared Calendar. This data is used to monitor the health of the calendar sharing API as well as Outlooks interaction with shared calendars.

The following fields are collected:

  - **FailedCaseHResult** - The error code returned from Failure

#### Office.Outlook.Desktop.EDP.EDPOpenStoreFailure

Success or failure to open the Enterprise Data Protection protected mail store based on result of Windows API call to get the key to decrypt the store. We use this diagnose one of the top Enterprise Data Protection issues which can prevent Outlook from booting. Primary cause of failure is Outlooks interaction with Windows APIs used to decrypt the store key.

The following fields are collected:

  - **HVA Activity** **-** with custom data fields

  - **IsFlightOn** – Indicates whether the EDPDecryption Flight is enabled

#### Office.Outlook.Desktop.NdbCorruptionResult

Office.Outlook.Desktop.NdbCorruptionResult and Office.Outlook.Desktop.NDBCorruptStore.Warning are collected when we detect corruption in a user’s PST/OST. When we detect corruption, Microsoft collects the format of the database, the place where detected it, and a small amount of context about the corruption. OST/PST corruption prevents users from accessing their emails. We actively monitor this data for anomalous activity. We aim to investigate and diagnose issues to limit loss of customer data.

The following fields are collected:

  - **0 -** The Process name which reported corruption

  - **1 -** Bool indicating if the user chooses new file or not

  - **2 -** the number of other processes which have the database open

#### Office.Outlook.Desktop.NDBCorruptStore.Warning

Office.Outlook.Desktop.NdbCorruptionResult and Office.Outlook.Desktop.NDBCorruptStore.Warning are collected when we detect corruption in a user’s PST/OST. When we detect corruption, Microsoft collects the format of the database, the place where detected it, and a small amount of context about the corruption. OST/PST corruption prevents users from accessing their emails. We actively monitor this data for anomalous activity. We aim to investigate and diagnose issues to limit loss of customer data.

The following fields are collected:

  - **CollectionTime** - collection time

  - **Context** - Corrupt Store Context, where corruption was detected

  - **CreatedWithVersion** – (Optional) field with version of store

  - **Details** – Details about the crash

  - **NdbType** - Store Type, can be 0 = NdbUndefined, 1 = NdbSmall, 2 = NdbLarge, 3 = NdbTardis

  - **ProcessName** - Process Name causing the store to get corrupted

  - **PstVersion** - Version of the MSPST32.DLL

  - **Version** - Version of store file format

#### Office.Outlook.Desktop.OutlookCalendarUsageErr.MeetRcpt.ForwardActions.Rule.O16

Collects success and failure of the Forward, Forward as Attachment, and Forward as iCalendar action for Single, Recurring, and Exceptional Meeting Responses in the Mail, Calendar, and Inspector Outlook view. The failure rate of the Forward, Forward as Attachment, and Forward as iCalendar actions are actively monitored for anomalies. Anomalous statistics indicate a failure Outlooks ability to conduct core calendar operations. This data is also used to diagnose other Calendar related issues that may be detected.

The following fields are collected:

  - **CountExceptionForward** - Count of the forwarded Meetings Exceptions

  - **CountExceptionForwardAsiCal** - Count of the forwarded Meetings Exceptions as an iCal

  - **CountExceptionForwardInSplit** - Count of the forwarded Meetings Exceptions from the Split Menu in Ribbon

  - **CountExceptionForwardWithAttach** - Count of the forwarded Meetings Exceptions as an Attachment

  - **CountRecurringForward** - Count of the forwarded Recurring Meetings

  - **CountRecurringForwardAsiCal** - Count of the forwarded Recurring Meetings as an iCal

  - **CountRecurringForwardInSplit** - Count of the forwarded Recurring Meetings from the Split Menu in Ribbon

  - **CountRecurringForwardWithAttach** - Count of the forwarded Recurring Meetings as an Attachment

  - **CountSingleForward** - Count of the forwarded Single Meetings

  - **CountSingleForwardAsiCal** - Count of the forwarded Single Meetings as an iCal

  - **CountSingleForwardInSplit** - Count of the forwarded Single Meetings from the Split Menu in Ribbon

  - **CountSingleForwardWithAttach** - Count of the forwarded Single Meetings as an Attachment

  - **HResult** - ErrorCode

  - **OlkViewName** - Indicates Mail, Calendar, or Inspector View

#### Office.Outlook.Desktop.OutlookCalendarUsageErr.MeetRcpt.ReplyActions.Rule.O16

Collects success and failure of the Reply, Reply All, Reply With IM, and Reply All with IM action for Single, Recurring, and Exception Meeting Responses in the Mail, Calendar, and Inspector Outlook view. The failure rate of the Reply, Reply All, Reply With IM, and Reply All with IM actions are actively monitored for anomalies. Anomalous statistics indicate a failure Outlooks ability to conduct core calendar operations. This data is also used to diagnose other Calendar related issues that may be detected.

The following fields are collected:

  - **CountExceptionReply** - Count of the Meetings Reply on exceptions

  - **CountExceptionReplyAll** - Count of the Meetings ReplyAll on exceptions

  - **CountExceptionReplyAllWithIM** - Count of the Meetings ReplyAll with IM on exceptions

  - **CountExceptionReplyWithIM** - Count of the Meetings Reply with IM on exceptions

  - **CountRecurringReply** - Count of the Recurring Meetings Reply

  - **CountRecurringReplyAll** - Count of the Recurring Meetings ReplyAll

  - **CountRecurringReplyAllWithIM** - Count of the Recurring Meetings ReplyAll with IM

  - **CountRecurringReplyWithIM** - Count of the Recurring Meetings Reply with IM

  - **CountSingleReply** - Count of the Single Meetings Reply

  - **CountSingleReplyAll**- Count of the Single Meetings ReplyAll

  - **CountSingleReplyAllWithIM** - Count of the Single Meetings ReplyAll with IM

  - **CountSingleReplyWithIM** - Count of the Single Meetings Reply with IM

  - **HResult** - ErrorCode

  - **OlkViewName** - Indicates Mail, Calendar, or Inspector View

#### Office.Outlook.Desktop.OutlookPrivsDlgSingleUser.LoadFail

This rule collects Calendar Sharing errors when adding a new user (of type EX or SMTP) from the Address book. This data is used to diagnose and resolve issues detected in the Calendar Sharing dialog

The following fields are collected:

  - **CountAccountWizardEnd** - How many times the legacy wizard dialog ended

  - **CountCreatePIMAccount** - How many times user created a PIM Profile

#### Office.Outlook.Mac.MacOLKAsserts

Used to identify user impacting issues in Outlook that may manifest as crashes or degraded functionality. 

The following fields are collected:

- **Category** - type of assert

- **CollectionTime** - time when assert is collected


#### Office.Outlook.Mac.MacOLKErrors

Used to identify user impacting issues in Outlook that may manifest as crashes or degraded functionality. 

The following fields are collected:

- **Category** - type of error

- **CollectionTime** - time when error is collected

- **ThreadId** - identifier for the thread


#### Office.System.SystemHealthAsserts

The errors this event identifies help us understand when the customer experience is degrading. Many of these ShipAsserts lead to crashes and this information makes it possible to fix many of those. Collects ShipAsserts from the product which helps to identify errors.

The following fields are collected:

 - **Count** – The count of each assert reported

  - **EndTime** – Time at which the last assert reported occurred

  - **ErrorGroup** – A bucketing identifier for each assert

  - **FirstTimeStamp** – The first time at which the assert occurred

  - **Trackback** – A unique identifier for a specific assert

#### Office.System.SystemHealthErrorsEtwShim

Used to identify customer impacting issues within the running app that may manifest as crashes or degraded functionality. Records errors that occur during process run time.

The following fields are collected:

  - **EndTime** – The time at which the last error reported occurred

  - **Trackback** – A unique identifier for a specific error

  - **ErrorGroup** – A bucketing identifier for each error

  - **Count** – The count of each error

  - **FirstTimeStamp** – The first time at which the error occurred

#### Office.System.SystemHealthErrorsUlsAndAsserts

Used to identify customer impacting issues within the running app that may manifest as crashes or degraded functionality. Records errors that occur during process run time.

The following fields are collected:

  - **EndTime** – The time at which the last error reported occurred

  - **Trackback** – A unique identifier for a specific error

  - **ErrorGroup** – A bucketing identifier for each error

  - **Count** – The count of each error

  - **FirstTimeStamp** – The first time at which the error occurred

#### Office.System.SystemHealthErrorsUlsWorkaround

Used to identify customer impacting issues within the running app that may manifest as crashes or degraded functionality. Records errors that occur during process runtime

The following fields are collected:

  - **EndTime** – The time at which the last error reported occurred

  - **Trackback** – A unique identifier for a specific error

  - **ErrorGroup** – A bucketing identifier for each error

  - **Count** – The count of each error

#### Office.System.SystemHealthErrorsWithoutTag

Used to identify customer impacting issues within the running app that may manifest as crashes or degraded functionality. Records errors that occur during process runtime.

The following fields are collected:

Count - The count of each error

  - **EndTime** - The time at which the last error reported occurred

  - **ErrorCode** – An identifier for the error

  - **ErrorGroup** - A bucketing identifier for each error

  - **ErrorId** – An identifier for the error

  - **FirstTimeStamp** - The first time at which the error occurred

  - **Trackback** - A unique identifier for a specific error

#### Office.System.SystemHealthErrorsWithTag

Used to identify customer impacting issues within the running app that may manifest as crashes or degraded functionality. Records errors that occur during process runtime.

The following fields are collected:

  - **Count** - The count of each error

  - **EndTime** - The time at which the last error reported occurred

  - **ErrorCode** – An identifier for the error

  - **ErrorGroup** - A bucketing identifier for each error

  - **ErrorId** – An identifier for the error

  - **FirstTimeStamp** - The first time at which the error occurred

  - **Trackback** - A unique identifier for a specific error

#### RenewIdentityFailure

Collected when a user attempts to open an IRM protected doc or apply IRM protections. It contains the information needed to be able to properly investigate and diagnose issues that happen when failed to renew user certificates.

The following fields are collected:

- **AppInfo.ClientHierarchy** - Client hierarchy which indicates the application runs in production environment or developer environment

- **AppInfo.Name** - Application name.

- **AppInfo.Version** - Application version

- **Failure.Category** - The category of the failure “UnhandledError”

- **Failure.Detail** - The detailed info of the failure

- **Failure.Id** - Failure Id

- **Failure.Signature** - The signature of the failure, which is same as the event name

- **iKey** - Logging service server Id

- **RMS.HRESULT** - The result of renewing user certificate

- **RMS.ScenarioId** - Scenario Id defined by Rights Management Service Client

- **RMS.SDKVersion** - The version of Rights Management Service Client


## Device connectivity and configuration​ data events

The following are the data subtypes in this category:

- [Device connectivity and configuration​](#device-connectivity-and-configuration-subtype)


### *Device connectivity and configuration subtype*

Network connection state and device settings, such as memory.​

#### Office.AirSpace.AirSpaceLocalBlocklistDriverUpdated

User has updated a video card driver that was previously causing Office crashes and thus no longer being used to render. Informs Microsoft that users who were once in a sub-optimal rendering state are once again in the recommended rendering state.

The following fields are collected:

  - **Data\_BlockedDriverVersion** - Version of the driver that was blocklisted.

  - **Data\_DeviceId** -identifier of the video card device that was blocklisted.

  - **Data\_UpdatedDriverVersion** - Version of the updated driver

#### Office.AirSpace.AirSpaceLocalBlocklistInfo

Details on the user's video card driver that has caused multiple recent crashes of Office applications. Office will not use this video card in this Office session (using software rendering instead) until the driver is updated. Informs Microsoft of video card drivers that are causing problems in Office so trends can be identified and the user of impact of such drivers can be analyzed. Tell Microsoft how many users are in this sub-optimal state.

The following fields are collected:

  - **Data\_AllAppsBlocked** - Whether all Office apps are blocklisted

  - **Data\_BlockedDeviceId** - identifier of the video card device that was blocklisted

  - **Data\_BlockedDriverVersion** - Version of the driver that was blocklisted

  - **Data\_CrashHistory** - A string that represents the history of video card driver caused crashes for analysis

  - **Data\_SecsBetweenCrashes** - How frequently driver card crashes are occurring

#### Office.AirSpace.AirSpaceWinCompIsEnabled

Whether the latest Office low-level rendering platform based on Windows Composition is being used.

As the latest Office low-level rendering platform is developed and begins to be released to customers, this allows Microsoft to see how many users are on each version to ensure the platform remains bug-free.

The following fields are collected:

  - **Data\_WinCompEnabled** -Whether the Windows Composition-based backend is in use

#### Office.AirSpace.Backend.Win32.GraphicsDriverHangDetectorBlocklistApp

User’s video card has been detected as causing long or unrecoverable hangs. Office will not use this video card in this Office session (using software rendering instead) until the driver is updated. Informs Microsoft of video card drivers that are causing problems in Office so trends can be identified and the user of impact of such drivers can be analyzed. Also helps in informing how many users are in this sub-optimal state.

The following fields are collected:

  - **Data\_AppName** - Which app has encountered video card driver hangs

#### Office.AirSpace.Backend.Win32.GraphicsDriverHangDetectorRegistryWrite

Office has identified that the user's video card driver has caused a hang that should be analyzed at the next Office application boot. Used to determine whether using a different video card driver or adapter would offer a better user experience. As patterns occur, Microsoft may make adjustments to keep the Office experience as smooth as possible.

The following fields are collected:

  - **Data\_HangDetected** - Whether a hang was detected

  - **Data\_InDeviceCall** - Which video card rendering call Office was in when the hang occurred

  - **Data\_Timeout** - How long the hang lasted, if it recovered

  - **Data\_UnrecoverableCommand** - Whether the hang in this video card rendering command is typically recoverable.

#### Office.AirSpace.Backend.Win32.LocalBlocklistActivity

Details on the user's video card driver that has caused multiple recent crashes of Office applications. Office will not use this video card in this Office session (using software rendering instead) until the driver is updated. Informs Microsoft of video card drivers that are causing problems in Office so trends can be identified and the user of impact of such drivers can be analyzed. Tell Microsoft how many users are in this sub-optimal state.

The following fields are collected:

  - **Data.AllAppsBlocked** - Whether all Office apps are blocklisted

  - **Data.BlockedDeviceId** - identifier of the video card device that was blocked

  - **Data.BlockedDriverVersion** - Version of the driver that was blocklisted

  - **Data.CrashHistory System.String** - A string that represents the history of video card driver caused crashes for analysis

  - **Data.SecsBetweenCrashes** - How frequently driver card crashes are occurring

#### Office.AirSpace.Backend.Win32.LocalBlocklistDriverUpdatedActivity

User has updated a video card driver that was previously causing Office crashes and thus no longer being used to render. Informs Microsoft that users who were once in a sub-optimal rendering state are once again in the recommended rendering state.

The following fields are collected:

  - **Data\_BlockedDeviceId** - identifier of the video card device that was blocklisted

  - **Data\_BlockedDriverVersion** - Version of the driver that was blocklisted

  - **Data\_UpdatedDriverVersion** - Version of the updated driver

#### Office.Graphics.SpriteMemCorrupt

Reports any errors detected in the sprite memory accounting telemetry. Critical for assessing health of the graphics memory usage telemetry. This information is needed to validate the correctness of our SpriteMem telemetry.

The following fields are collected:

  - **Data\_CurrentSpriteMem** - Total amount of memory that is actively allocated to hold sprites (images) that result in screen content.

  - **Data\_Function** - The name of the function that is attempting to release sprite memory.

  - **Data\_SpriteMemToRemove** - Amount of memory to be removed from sprite allocation.

#### Office.PowerPoint.PPT.Shared.NoInternetConnectivity

Collected whenever PowerPoint detects there is no internet connectivity. Microsoft uses this data to get diagnostic information about the user's internet connection to be able to understand how that impacts connectivity to Office services.

The following fields are collected:

- **Data\_IsNexusDetected:bool** - shows whether we got the Internet connectivity status when calling Nexus service (value true) or when calling generic web service API call (value false)
