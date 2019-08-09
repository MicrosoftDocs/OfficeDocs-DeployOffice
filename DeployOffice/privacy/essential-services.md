---
title: "Essential services for Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: concept
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_Privacy
description: "Provides Office admins with information about essential services in Office, such as Click-to-Run and Licensing, and provides a list of events and data fields for those essential services."
hideEdit: true
---

# Essential services for Office

> [!IMPORTANT]
> The information in this article applies to Version 1904 or later of the following Office client software installed on a computer running Windows:
> - Office 365 ProPlus and Office 365 Business
> - Office 365 Personal, Office 365 Home, or other versions of Office that are part of an Office 365 subscription.
> - Project and Visio that come with some subscription plans, such as the Project Online Professional plan or Visio Online Plan 2.
>
> The information also applies to Version 16.28 or later of the following Office for Mac applications: Excel, Outlook, OneNote, PowerPoint, and Word.

Office consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. While you can control many of the connected experiences that are available to you, or to your users if you’re the admin in your organization, there are a set of services that are essential to how Office functions and therefore cannot be disabled. For example, the licensing service that confirms that you are properly licensed to use Office. Required service data about these services is collected and sent to Microsoft, regardless of any other privacy-related policy settings that you have configured. You can see this data by using the Diagnostic Data Viewer.

For more information, see the following:

- [Required service data for Office](required-service-data.md)
- [Using the Diagnostic Data Viewer with Office](https://support.office.com/article/cf761ce9-d805-4c60-a339-4e07f3182855)
- [Connected experiences in Office](connected-experiences.md)

If you’re the admin for your organization, you might also be interested in the following:

- [Overview of privacy controls for Office 365 ProPlus](overview-privacy-controls.md)
- [Use policy settings to manage privacy controls for Office 365 ProPlus](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)

## List of essential services for Office 

The following table provides a list of the essential services for Office and a description of each service.

| **Service**  | **Description**  |
| ------ | ---- |
| [Authentication](#authentication-events) | Authentication is a cross-platform service that validates your Office user identity.  It is required to enable you to sign in to Office, activate your Office license, access your files stored in the cloud, and provides a consistent experience across Office sessions and your devices.    |
| [Click-to-Run](#click-to-run-events) | Click-to-Run is the installation technology used to install and update Office on Windows. It checks for new versions of Office, and when a new version is available, downloads and installs it. Click-to-Run will detect the need for, perform the download of, and install Office updates, including security updates.     |
| [Enhanced Configuration Service (ECS)](#enhanced-configuration-service-ecs-events) | ECS provides Microsoft the ability to reconfigure Office installations without the need for you to redeploy Office. It is used to control the gradual rollout of features or updates, while the impact of the rollout is monitored from diagnostic data being collected. It is also used to mitigate security or performance issues with a feature or update. In addition, ECS supports configuration changes related to diagnostic data to help ensure that the appropriate events are being collected. |
| [Licensing](#licensing-events)     | Licensing is a cloud-based service that supports your Office activation for new installations and maintains the license on your devices after Office has been activated. It registers each of your devices and activates Office, checks the status of your Office subscription, and manages your product keys.    |
|[Microsoft AutoUpdate (MAU)](#microsoft-autoupdate-mau-events)|Microsoft AutoUpdate (MAU) is the technology used to update Microsoft applications produced for MacOS, such as Office. MAU will detect the need for, perform the download of, and install application updates, including security updates.|
|[OneNote sync](#onenote-sync-events)|OneNote for Mac only supports notebooks stored on the internet in OneDrive or SharePoint Online. OneNote for Mac continually syncs all of the user's notes with OneDrive or SharePoint Online. This lets users open, view, and edit their notebooks on all their devices so their notebooks are always up-to-date.
 [Services Configuration](#services-configuration-events)  | Services Configuration provides the ability to make updates to Office configuration settings to enable or disable client features. It is called every time an Office application is started and provides details about other Office configurations and services. Services Configuration also controls which services are designated as essential services.  |
| [Telemetry ](#telemetry-events)  | The Telemetry service is used to collect diagnostic data from Office applications. It enables the collection of the diagnostic data generated by Office, both required and optional diagnostic data. It is also responsible for the collection of the service diagnostic data portion of required service data for Office.  |

## Events and data fields for essential services for Office

The next sections provide the following information:

- A list of events for each essential service
- A description of each event
- A list of data fields in each event
- A description of each data field

You can see these events by using the Diagnostic Data Viewer.



## Authentication events

These diagnostic data events are collected when Office attempts to acquire an authentication token, either silently or through prompting.

### Office.Identity.FbaPromptWin32

Collected when Office shows the user a Forms-Based-Auth sign-in prompt.

Along with silent token acquisitions, authentication prompts is used to determine if user is in a broken authentication state which, for the user, results in what is essentially an Offline Client state, or in the worst case, broken authentication may prevent license acquisition and result in a completely unusable client.

Forms-Based-Auth (FBA) sign-in prompts are used for some on-premises authentication scenarios and typically we want to make sure this isn’t happening, as everyone should be using Modern-Auth because of security vulnerabilities associated with FBA.

**The following fields are collected:**

  - **AuthScheme** - the authentication scheme used

  - **DocumentUrlHash** - an encrypted URL requesting

  - **EndTag** - the tag where FBA form is completed

  - **Flags** - Obsolete

  - **FlowTag** - the tag where FBA form is started

  - **LastError** – the error code returned

  - **PromptEndTime** - the time when then prompt ended

  - **PromptStartTime** - the time when the prompt started

  - **Result** - whether the authentication succeeded

  - **SessionEndTime** – the time when the event session ended

  - **Timeout** - the time when the prompt timed out

### Office.Identity.SignOutEvent

Collected when a user signs out of Office.

Knowing the user is signed-out makes it possible to classify other events, such as prompts, as expected, so those events can be correctly computed in reliability / ship-readiness metrics and avoid alerting or rolling back builds on the faulty premise that the user is experiencing unexpected sign-in prompts.

The following fields are collected:

  - **FlowEndTime** - the time when the sign out action ended

  - **FlowStartTime** - the time when the sign out action started

  - **IdentityErrorState** - any identity error state during sign out

  - **IdentityHashedUniqueId** - the encrypted identity ID being signed out

  - **IdentityProviderType** - the identity provider of the identity being signed out

  - **IdentityUniqueID** - the identity ID being signed out

  - **SessionEndTime** - the time when the event session ended

  - **SignOutUserAction** - Indicates the user initiates the sign out action

### Office.Identity.SspiPromptWin32

Collected when Office shows the user a Windows SSPI sign-in prompt. Along with silent token acquisitions, authentication prompts determine whether a user is in a broken authentication state, which results in an Offline Client state. Broken authentication may prevent license acquisition and result in a completely unusable client.

Windows SSPI prompts are used for authenticating with Exchange (for mail synchronizing) when the user's Exchange resource hasn't been setup for multi-factor authentication.

These events, along with the Office.MATS namespace events, are used for the following purposes:

1\) Identify whether clients can successfully obtain an authentication token or have entered a broken authentication state.

2\) Evaluate whether changes that have occurred on the client or services have resulted in critical regressions in the user's authentication experience and reliability

3\) When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

4\) These signals power various ship readiness and health monitors which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical user-blocking failures

The following fields are collected:

  - **AllowSavedCreds** - whether the new credential is persisted

  - **AuthScheme** - the authentication scheme used

  - **CredsSaved** - whether the new credential is saved

  - **DocumentUrlHash** - the encrypted URL requesting

  - **EndTag** - the tag where the prompt ended

  - **NewIdentity**\_ErrorState – whether the new identity is valid

  - **NewIdentity\_HashedUniqueId** - the encrypted new identity ID after prompt is completed

  - **NewIdentity\_ProviderType** - the new identity provider after the prompt is completed

  - **NewIdentity\_UniqueID** - the new identity ID after the prompt is completed

  - **OutStatus** - whether the prompt output is valid

  - **PromptEndTime** - the time when the prompt ended

  - **PromptFailedTag** - the tag that indicates SSPI prompt failure

  - **PromptFlow** - the tag that invoked the SSPI prompt

  - **PromptStartTime** - the time when the prompt started

  - **Proxy** - if proxy is used

  - **ServerHash** - the encrypted server address

  - **SessionEndTime** - the time when the event session ended

  - **Timeout** - the time when the prompt is timed out

  - **UiMessage** - the UI message in the prompt

  - **UserNameHash** - the encrypted user name

### Office.Identity.Win32Prompt

Collected when Office shows the user a multi-factor authentication sign-in prompt. Along with silent token acquisitions, authentication prompts determine whether a user is in a broken authentication state, which results in an Offline Client state. Broken authentication may prevent license acquisition and result in a completely unusable client.

These events, along with the Office.MATS namespace events, are used for the following purposes:

1\) Identify whether clients can successfully obtain an authentication token or have entered in to a broken authentication state.

2\) Evaluate whether changes that have occurred on the client or services have resulted in critical regressions in the user's authentication experience and reliability

3\) When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

4\) These signals power various ship readiness and health monitors which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical user-blocking failures.

The following fields are collected:

  - **AdalWAMUsed** – the tag that indicates result if ADAL-atop-WAM is used

  - **CallTag** – the tag that indicates the caller of sign in UI

  - **Context** - the sign in context for the prompt

  - **EndTagIdentityProviderRequested** - the tag where the identity provider is requested

  - **HrdShownTag** - the tag where the HRD sign in dialog is shown

  - **IdentityProviderResulted** - the identity provider type it is requesting

  - **IdPFlowTag** - the tag that indicates the identity request result

  - **LastLoginDelta** - the time delta from last successful login

  - **NewIdentity\_ErrorState** - whether the identity is valid after prompt

  - **NewIdentity\_ProviderType** - the new identity provider type after prompt

  - **NewIdentity\_UniqueID** - the new identity ID returned after prompt

  - **PromptCorrelation** - the prompt correlation ID for diagnostic purpose

  - **PromptEndTime** - the time when the prompt ended

  - **PromptStartTime** – the time when the prompt started

  - **SessionEndTime** - the time when the event session ended

  - **ShowUIResult** – the result code returned from the prompt UI

  - **StartTag** – the tag where Win32 prompt started

  - **Timeout** - the time when the prompt is timed out

  - **WasIdentitySignedOut** - whether the user is signed out

### Office.MATS.actionofficewin32, Office.MATS.actionofficewinrt

The following description applies for both Win32 and WinRT events (the name depends on platform.)

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. When acquisition attempts fail, error information is included. These events help our users avoid entering broken authentication states by:

1\) Identifying whether clients can successfully obtain an authentication token or have entered a broken authentication state.

2\) Evaluate when changes occur on the client or services, whether they result in critical regressions in the user's authentication experience and reliability

3\) When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

4\) These signals power various ship readiness and health monitors which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical failures.

The following fields are collected:

  - **Actiontype** - Which authentication library is used

  - **Appaudience** - Is the app build for internal or external use

  - **Appforcedprompt** - Did the app override cache and force a prompt to be shown

  - **Appname** - Name of the application doing authentication

  - **Appver** - Version of the application doing authentication

  - **Askedforcreds** - Did the application ask the user to enter credentials for this action

  - **Authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

  - **Blockingprompt** - Did the application throw a prompt requiring user interaction

  - **Correlationid** - GUID used for joining with services data

  - **Count** - Count of events in cases of aggregation

  - **Data\_accounttype** - Consumer or organizational account

  - **Devicenetworkstate** - Was the user online

  - **Deviceprofiletelemetryid** - Anonymous device ID used to measure device experience

  - **Duration** - How long the authentication took

  - **Endtime** - When the authentication event ended

  - **Error** - Error code if the authentication failed

  - **Errordescription** - Brief description of the error

  - **Errorsource** - Did the error come from service, authentication library, or application

  - **Identityservice** - Was Microsoft Service Account (MSA) or Azure Active Directory (AAD) service invoked

  - **Interactiveauthcontainer** - What type of prompt was shown

  - **Issilent** - Was a prompt shown

  - **Microsoft**\_**ADAL**\_**adal**\_**version** - Version of the Azure Active Directory Authentication Library (ADAL)

  - **Microsoft\_ADAL\_api\_error\_code** - Error code emitted by authentication library for this authentication attempt

  - **Microsoft\_ADAL\_api\_id** - API invoked for this authentication attempt

  - **Microsoft\_ADAL\_authority** – Azure Active Directory authority URL responsible for authenticating the user

  - **Microsoft\_ADAL\_authority\_type** – Consumer / Microsoft Service Agreement (MSA) vs organizational / Azure Active Directory (AAD); currently always AAD

  - **Microsoft\_ADAL\_authority\_validation\_status** – Tells whether authentication completed on the service-side

  - **Microsoft\_ADAL\_broker\_app** - Tells whether ADAL used a broker for authentication

  - **Microsoft\_ADAL\_broker\_app\_used** – Tells the name of the broker (e.g., Windows Account Management)

  - **Microsoft\_ADAL\_broker\_version** - Tells the version of the broker if used

  - **Microsoft\_ADAL\_cache\_event\_count** - Number of cache events ADAL performed while retrieving token

  - **Microsoft\_ADAL\_cache\_event\_count\_max** - If this signal is aggregated, max cache events of any one of the aggregated events.

  - **Microsoft\_ADAL\_cache\_event\_count\_min** - If this signal is aggregated, min cache events of any one of the aggregated events.

  - **Microsoft\_ADAL\_cache\_event\_count\_sum** - If this signal is aggregated, sum of the cache events of all the aggregated events.

  - **Microsoft\_ADAL\_cache\_read\_count** - How many times the API read from the disk cache. Present if there was at least one read.

  - **Microsoft\_ADAL\_cache\_read\_error\_count** - How many times the disk cache read failed. Is present if there was at least one failure.

  - **Microsoft\_ADAL\_cache\_read\_last\_error** - ADAL error code. Present if there was at least one read failure.

  - **Microsoft\_ADAL\_cache\_read\_last\_system\_error** - System error code. Is present if there was at least one read failure.

  - **Microsoft\_ADAL\_cache\_write\_count** - How many times the API wrote to the disk cache. Present if there was at least one write.

  - **Microsoft\_ADAL\_cache\_write\_error\_count** - How many times the disk cache-write failed. Present if there was at least one failure.

  - **Microsoft\_ADAL\_cache\_write\_last\_error** - ADAL error code. Present if there was at least one write failure.

  - **Microsoft\_ADAL\_cache\_write\_last\_system\_error** - System error code. Present if there was at least one write failure.

  - **Microsoft\_ADAL\_client\_id** - Hashed AAD app ID

  - **Microsoft\_ADAL\_extended\_expires\_on\_setting** - True/false telling if the token has an extended lifetime.

  - **Microsoft\_ADAL\_http\_event\_coun**t - Count of HTTP calls made by ADAL.

  - **Microsoft\_ADAL\_http\_event\_count\_max** - If this signal is aggregated, max HTTP calls made by ADAL of any aggregated event.

  - **Microsoft\_ADAL\_http\_event\_count\_min** - If this signal is aggregated, min HTTP calls made by ADAL of any aggregated event.

  - **Microsoft\_ADAL\_http\_event\_count\_sum** - If this signal is aggregated, sum of the HTTP calls made by ADAL of all the aggregated events.

  - **Microsoft\_ADAL\_is\_silent\_ui** - True/false telling if UI was shown (prompt) by ADAL.

  - **Microsoft\_ADAL\_is\_successful** - True/false telling if ADAL API succeeded.

  - **Microsoft\_ADAL\_logging\_pii\_enabled** - True/false telling if ADAL full logging mode is enabled. This data is only logged locally, not emitted in telemetry.

  - **Microsoft\_ADAL\_oauth\_error\_code** – OAuth protocol error code returned by the service.

  - **Microsoft\_ADAL\_prompt\_behavior** - log-in or none HTTP parameter passed to service to specify if user interface can be shown.

  - **Microsoft\_ADAL\_request\_id** - Transactional GUID for the request emitted by ADAL to the service.

  - **Microsoft\_ADAL\_response\_code** - HTTP response code from the service.

  - **Microsoft\_ADAL\_response\_time** - How long it took service to return to ADAL.

  - **Microsoft\_ADAL\_response\_time\_max** - If the signal is aggregated, the max time it took ADAL to return from its API among any of the aggregated events.

  - **Microsoft\_ADAL\_response\_time\_min** - If the signal is aggregated, the min time it took the service to respond to ADAL among any of the aggregated events.

  - **Microsoft\_ADAL\_response\_time\_sum** - If the signal is aggregated, the sum of the time it took ADAL to return from its API among all aggregated events.

  - **Microsoft\_ADAL\_rt\_age** – Age of the refresh token

  - **Microsoft\_ADAL\_server\_error\_code** - Error code returned by the server

  - **Microsoft\_ADAL\_server\_sub\_error\_code** - Sub error code returned by the server to help disambiguate why the request failed.

  - **Microsoft\_ADAL\_spe\_ring** - True/false telling if the user was using the Secure Production Enterprise inner ring (Microsoft employees only).

  - **Microsoft\_ADAL\_start\_time** – Time the ADAL API call was made

  - **Microsoft\_ADAL\_stop\_time** - Time the ADAL API call returned

  - **Microsoft\_ADAL\_telemetry\_pii\_enabled** - True/false telling if ADAL full telemetry mode is enabled. The name is a misnomer, as no PII/EUII is emitted.

  - **Microsoft\_ADAL\_tenant\_id** - GUID identifying the tenant that the authenticated user belongs to.

  - **Microsoft\_ADAL\_token\_acquisition\_from\_context** - Describes the ADAL behavior based on the tokens in the authentication context.

  - **Microsoft\_ADAL\_token\_type** – Either refresh token (RT) or multi-resource refresh token (MRRT).

  - **Microsoft\_ADAL\_ui\_event\_count** - Count of prompts shown to the user. May have been silent.

  - **Microsoft\_ADAL\_user\_cancel** - True / false if the user interface window was cancelled.

  - **Microsoft\_ADAL\_x\_ms\_request\_id** – Additional request ID provided in HTTP header to service by ADAL.

  - **Platform** - Win32/WinRT/Android/iOS/Mac

  - **Scenarioid** – GUID. Multiple events may belong to a single scenario, e.g. the scenario may be adding a new account but there are multiple prompts that occur as part of that scenario. This ID enables correlation to happen.

  - **Sessionid** - GUID identifying the boot session

  - **Skdver** - Version of MATS client SDK used to produce this data

  - **Starttime** - Time at which the Start\*Action MATS API was called

  - **Tenantid** - GUID identifying the tenant the authenticated user belongs to (in non-ADAL cases).

  - **Uploadid** - Unique GUID for this event, used for de-duping

  - **Wamapi** - Identifies which WAM API is called

  - **Wamtelemetrybatch** - Currently unused. In the future, allows the WAM component to dispatch additional information regarding the authentication event.

## Click-to-Run events

### Office.ClickToRun.Bootstrapper 

Office set up and inventory data collected when the user is running Office setup.exe to modify their installed Office products. Used to measure success / failure of a full user-initiated Office installation including pre-requisite checks.

The following fields are collected:

  - **Data\_BootStrapperStateFailure\_ErrorCode** – The error code we failed with

  - **Data\_BootStrapperStateFailure\_ErrorSource** – The function we failed in

  - **Data\_BootStrapperStateFailure\_FailingState** – The part that we failed in the boostrapperbootstrapper

  - **Data\_BootStrapperStateFailure\_OExceptionType** – The type of exception we failed with

  - **Data\_Culture** - the culture we are running this exe with, i.e. en-us

  - **Data\_HashedOLSToken** - a sha-256 hash of a token the OLS service gives us

  - **Data\_Platform** - x64 or x86 install

  - **Data\_PrereqFailure\_Type** – The prerequisite failure we hit, ie. the operating system is not supported

  - **Data\_ProductReleaseId** - Product we’re installing, i.e. Office 365 ProPlus

### Office.ClickToRun.CorruptionCheck

Office set up and inventory data collected when Click-to-Run client is running a corruption check to make sure that Office binaries are correct. Used to measure corruption of Office binaries, and which binaries are corrupt.

The following fields are collected:

  - **Data\_Active -** The current stream manifest we’re checking on disk

  - **Data\_ActivePackages -** what packages the manifest contains

  - **Data\_ActiveVersion -** the version of the manifest

  - **Data\_AddFileCount -** how many files we’re adding

  - **Data\_AddFileFiles -** a sample of the files we’re adding

  - **Data\_CompressionLevel -** how the files are compressed

  - **Data\_CorruptionCheckLevel -** how deeply we’re checking for corruption, stages

  - **Data\_CorruptSizeCount -** how many files have a corrupt size

  - **Data\_CorruptSizeFiles -** a sample of the files that have a corrupted size

  - **Data\_CorruptVersionCount -** how many files have a corrupted version

  - **Data\_CorruptVersionFiles -** a sample of the files that have a corrupted version

  - **Data\_FileBadDigestCount -**how many files we failed to open

  - **Data\_FileBadDigestFiles -** a sample of the files that we were unable to open

  - **Data\_FileNotSignedCount -** have many files that aren’t signed

  - **Data\_FileNotSignedFiles -** a sample of the files that aren’t signed

  - **Data\_FileNotTrustedCount -** how many files aren’t trusted

  - **Data\_FileNotTrustedFiles -** a sample of the files that we don’t trust

  - **Data\_IncompleteFileCount -** how many files seem to be incomplete

  - **Data\_IncompleteFileFiles -** a sample of the files that are incomplete

  - **Data\_KeepFileCount -** how many files we’re not doing anything to

  - **Data\_KeepFileFiles -** a sample of files we’re keeping

  - **Data\_KeepIncompleteFileCount -** how many files we’re not changing despite them being incomplete

  - **Data\_KeepIncompleteFileFiles -** a sample of the files we’re keeping that are incomplete

  - **Data\_MismatchSizeCount -** how many files have a size that doesn’t match our manifest

  - **Data\_MismatchSizeFiles -** a sample of the files that are mismatched in size

  - **Data\_MismatchVersionCount -** how many files that have a version different than our manifest

  - **Data\_MismatchVersionFiles -** a sample of the files that have mismatched versions

  - **Data\_MissingFileCount -** how many files seem to be missing

  - **Data\_MissingFileFiles -** a sample of the files that are missing

  - **Data\_NotToBeStreamedFileCount -** how many files we’re not streaming

  - **Data\_RemoveFileCount -** how many files we’re removing

  - **Data\_RemoveFileFiles -** a sample of the files we’re removing

  - **Data\_StreamUnitsMismatchCount -** how many files have units that don’t match the manifest

  - **Data\_StreamUnitsMismatchFiles -** a sample of the files that have a stream with units mismatched

  - **Data\_TimeElapsed -** how long we took to check for corruption

  - **Data\_UpdateFileCount -** how many files we’re updating

  - **Data\_UpdateFileFiles -** a sample of the files we’re adding

  - **Data\_Working -** the new manifest we’re checking

  - **Data\_WorkingVersion -** the version of the new manifest

### Office.ClickToRun.MachineMetadata

Office set up and inventory data that provides necessary metadata for setup and inventory and is used to determine an accurate install base.

The following fields are collected:

  - **Data\_C2RClientVer** – The version of OfficeClickToRun.exe on the machine

  - **Data\_OfficeBitness** – The bitness that Office is installed in, x86 or x64

  - **Data\_OfficeVersion** - The version Office is installed in

  - **Data\_Sku** - The SKU that’s installed, i.e. Office 365 ProPlus.en-us

  - **Data\_SqmMachineID** – Unique Machine ID used by Windows SQM Data\_SusClientID- Machine Office update identifier

### Office.ClickToRun.ODT

Office set up and inventory data collected when an IT Admin is running the Office Deployment Tool Click-to-Run setup.exe to modify their users’ installed Office products. It is used to measure success / failure of full IT Admin initiated Office installations including pre-requisite checks.

The following fields are collected:

  - **Data\_BootStrapperStateFailure\_ErrorCode-** The error code we failed with

  - **Data\_BootStrapperStateFailure\_ErrorSource-** The function we failed in

  - **Data\_BootStrapperStateFailure\_FailingState-** The part that we failed in the boot-strapper

  - **Data\_BootStrapperStateFailure\_OExceptionType-** The type of exception we failed with

  - **Data\_ConfigurationHost-** The host where the configuration.xml came from

  - **Data\_ConfigurationId-** The ID we get from a configuration.xml

  - **Data\_ConfigurationSource-** We the configuration.xml came from

  - **Data\_Culture-** the culture we are running this exe with, i.e. en-us

  - **Data\_HashedOLSToken-** a sha-256 hash of a token the OLS service gives us

  - **Data\_MigrateArchRequest-** If we are migrating the user from x86 to x64 or vice-versa

  - **Data\_MigrateArchRequestValid-** If we believe the migrate request is valid

  - **Data\_Platform-** x64 or x86 install

  - **Data\_PlatformMigratedFrom-** Starting platform, i.e. x86

  - **Data\_PlatformMigratedTo-** Ending platform, i.e. x64

  - **Data\_PrereqFailure\_Type-** The prerequisite failure we hit

  - **Data\_ProductReleaseId-** Product we’re installing, i.e. Office 365 ProPlus

### Office.ClickToRun.Scenario.InstallTaskConfigure

Office set up and inventory data collected when the Office installer is placing newly downloaded files. Used to measure the success / failure of an Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled -** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails -** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove -** what Office products we’re removing 

  - **Data\_RemovingFixedProducts -** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID -** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskConfigurelight

Office set up and inventory data collected when the Office installer is deciding which files need to be downloaded. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -**What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -**Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -**what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-**Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskFinalintegrate

Office set up and inventory data collected when the Office installer is installing licenses and registry settings. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we’re updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled -** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion  -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails -** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource  -** Where the error took place

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove -** what Office products we’re removing 

  - **Data\_RemovingFixedProducts -** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskFonts

Office set up and inventory data collected when the Office installer is installing fonts. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -**Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -**what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID   -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskInitupdates

Office set up and inventory data collected when the Office installer is creating settings for updates to work properly. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID –-**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskIntegrateinstall

Office set up and inventory data collected when the Office installer is creating registry entries for the Office applications Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we’re updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskLastrun

Office set up and inventory data collected when Office installer is finishing the installation, pinning shortcuts and creating final registry settings. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we’re updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-**  what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskMigrate

Office set up and inventory data collected when the Office Installer is migrating settings from older versions of Office. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we’re updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource – -** Where the error took place

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-**  Machine Office update identifier

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskPublishrsod

Office set up and inventory data collected when the Office installer is publishing the virtual registry for the AppV virtualization layer. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we’re updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running, i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskRemoveinstallation

Office set up and inventory data collected when the Office uninstaller is removing parts of Office from the device. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion-**  What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re  removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskStream

Office set up and inventory data collected when the Office installer is downloading new files for Office. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -**  What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType  -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled -** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion  -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version  -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we’re adding 

  - **Data\_AddingProducts  -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource  -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-**  what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID -** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskUninstallcentennial

Office set up and inventory data collected when the Office installer is uninstalling a previous version of Office installed from the Store. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskFinalintegrate

Office set up and inventory data collected when the Office repair client republishes .msi files and Office extensions. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion-**  What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code can be ignored 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskFullrepair

Office set up and inventory data collected when the Office repair client downloads the latest version of the Click-to-Run client to prepare the computer for uninstall and reinstall. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskIntegraterepair

Office set up and inventory data collected when the Office repair client attempts to repair some known troublesome registry entries. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code can be ignored 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskRemoveinstallation

Office set up and inventory data collected when the Office repair client removes Office from the device to prepare for a reinstall when repairing. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -**What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource  -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-**  what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskIntegrateupdate 

Office set up and inventory data collected when the Click-to-Run client updates licenses if necessary. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskPublishrsod

Office set up and inventory collected when the Click-to-Run client updates registry settings for new binaries. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdateapply

Office set up and inventory data collected when the Click-to-Run client shuts down running apps if needed and installs new files that were downloaded. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_AvailableVersion to-** What version of Office is available to update

  - **Data\_CompletedWithoutActionInfo -** Why we didn’t complete the scenario, i.e. Apps were open

  - **Data\_CompletionState -** If we completed the task

  - **Data\_CorruptionChecksOnly –-** If we’re only checking for corruption and not updating

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_HardlinkingException -** The exception we encountered when trying to create hardlinks

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_PackageOperationSuccessful -** True if we successfully completed our task on the Office package

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -**  Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-**  Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

  - **Data\_WorkstationLockState -** True if we think the computer is locked

### Office.ClickToRun.Scenario.UpdateTaskUpdateclientdownload

Office set up and inventory data collected when the Click-to-Run client downloads a newer version of itself. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName-** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdatedetection

Office set up and inventory data collected when the Click-to-Run client checks if there is a new update available. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_AvailableVersion -** What version of Office is available to update to

  - **Data\_ComAction -** An int representing a com action we’re performing

  - **Data\_CompletedWithoutActionInfo -** Why we didn’t complete the scenario, i.e. Apps were open

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource  -** Where the error took place

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_PackageUpdateAvailable -** True if we have a new version of Office available

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-**  what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-**  Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdatedownload

Office set up and inventory data collected when the Click-to-Run client is downloading a new update. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -**  What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_AvailableVersion -** What version of Office is available to update to

  - **Data\_CompletedWithoutActionInfo-** Why we didn’t complete the scenario, i.e. Apps were open

  - **Data\_CompletionState -** If we completed the task

  - **Data\_CorruptionChecksOnly -** If we’re only checking for corruption and not updating

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_FoundCorruptFiles -** True if we found corrupt files

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_PackageOperationSuccessful -** True if we successfully completed our task on the Office package

  - **Data\_PipelineExitCode -** The exit code our file pipeline returned

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdatefinalize

Office set up and inventory data collected when the Click-to-Run Client is cleaning up from the update and restoring apps that were previously open. Used to measure success or failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion-**  What version of Office 15 we’re updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we’re updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we’re adding 

  - **Data\_AddingProducts -** What products we’re asked to add 

  - **Data\_CompletionState -** If we completed the task

  - **Data\_ErrorCode -** The error code we failed with 

  - **Data\_ErrorDetails-** Extra details about an error 

  - **Data\_ErrorMessage -** An error message on what went wrong 

  - **Data\_ErrorSource -** Where the error took place 

  - **Data\_ExceptionType -** The exception we failed with 

  - **Data\_IsErrorCodeIgnorable -** If the error code we failed with is ignorable 

  - **Data\_IsErrorCodeIgnorableForScenarioHealth -** If we believe the error code is ignorable 

  - **Data\_NewestPackageVersion -** The newest version of Office on the machine 

  - **Data\_OldestPackageVersion -** The oldest version of Office on the machine 

  - **Data\_ProductsToAdd -** What Office products we’re adding 

  - **Data\_ProductsToRemove-** what Office products we’re removing 

  - **Data\_RemovingFixedProducts-** The products we’re removing 

  - **Data\_RemovingProducts -** The products we’re asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we’re running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID -** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or cancelled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Transport

Reports on the file download actions to determine the success of the operation, type of download performed and diagnostic information.


- **BytesFromGroupPeers -**	Bytes from group peers, only for downloads using Delivery Optimization

- **BytesFromHttp -**	 Bytes from http, only for downloads using Delivery Optimization

- **ByteFromInternetPeers -**	Bytes from internet peers, only for downloads using Delivery Optimization 

- **BytesFromLanPeers -**	Bytes from Lan peers, only for downloads using Delivery Optimization 

- **CancelledJobs -**	 Number of cancelled requests in the session

- **Connected -**	Whether connected to source

- **ErrorCode -**	The code of last error

- **ErrorDetails -**	 The detail of last error

- **ErrorMessage -**	The message of last error 

- **ErrorSource -**	The source of last error, e.g. Connection, LoadFile or LoadRange

- **FailedJob -**	Number of failed requests in the session

- **FileSize -**	Size of the resource

- **SourcePathNoFilePath -**	Source path of the resource only http source is reported, local file path or UNC path is filtered

- **SucceededJobs -**	Number of succeeded requests in the session

- **TotalJobs -**	 Total number of requests in the session

- **TotalRequestedBytes -**	 Total requested bytes in the session

- **TotalTransferTime -**	Total transfer time in the session

- **TransferredBytes -** 	Total transferred bytes in the session

- **TransportType -**	Type of transport, e.g. (In memory Delivery Optimization, HTTP, Background Intelligent Transfer Service)



### Office.ClickToRun.Transport.ExperimentalTransport.PipelineCreateTransport

Office set up and inventory data collected when the Click-to-Run client is creating a transport stream to download Office files. Used for determining the health of various transport technologies (e.g., HTTP, BITS, DO) which is critical to downloading Office properly for installation and updates.

The following fields are collected:

  - **Data\_IsForeGroundStreaming** – If we’re streaming in the foreground or background

  - **Data\_IsInstallMode** – 1 if we’re installing and downloading files, 0 if not

  - **Data\_SourceProtocol –** If we’re downloading from a content data network, CDN, the machine we’re installing on, local, or from a resource on the local area network,

  - **Data\_Status** – Success or failure 

### Office.ClickToRun.UpdateStatus

Office set up and inventory data collected when the Click-to-Run client is finishing an update status

The following fields are collected:

  - **Data\_build** - Currently installed Office version

  - **Data\_channel** – The channel that the user is on

  - **Data\_errorCode** – An integer code specifying the type of error that occurred, if there was one

  - **Data\_errorMessage** – A string giving a description of the error that occurred, if there was one

  - **Data\_status** – A short status of what happened during the update, such as Succeeded or Downloaded

  - **Data\_targetBuild -** -The Office version that we are attempting to update to


### Office.ClickToRun.UniversalBootstrapper.Application

Reports the result of the end-to-end installation attempt

 - **ErrorCode –**	Integer value associated with an unhandled exception

 - **ErrorDetails –**	String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

 - **ErrorMessage –**	String defined at the point where an unhandled exception was thrown, describing the nature of the failure

 - **ErrorType –**	String describing the category of an unhandled exception

 - **ExitCode –**	Integer value associated with the result of running the bootstrapper, indicating success vs. specific types of failure

### Office.ClickToRun.UniversalBootstrapper.CalculateParameters

Reports on the action that reason over the input collected using CollectParameters

- **BitField –**	Integer value of the BitField argument which tells us whether an explicit installation/update channel requested (Monthly, Insiders Slow, Insiders Fast, Semi-Annual, Semi-Annual Targeted)

- **ChannelID –**	Integer representing the enum value of the selected update/install channel (Monthly, Insiders Slow, Insiders Fast, Semi-Annual, Semi-Annual Targeted, Invalid)

- **CMDMode –**	The friendly string corresponding to which overall mode switch was detected in the cmd arguments passed to the exe.

- **C2RClientUICulture –**	Culture of the C2R Client to install

- **ErrorCode –**	Integer value associated with an unhandled exception

- **ErrorDetails –**	String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage –**	String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType –**	String describing the category of an unhandled exception

- **ExcludedApps –**	String listing the individual Office application names requested to be excluded from the Office suites installed

- **InstalledCabVersion –**	The "16.0.xxxxx.yyyyy" version of an Office C2R Client already installed

- **InstalledProductVersion –**	The "16.0.xxxxx.yyyyy" version of an Office C2R product already installed

- **IsC2RServiceRunning –**	Boolean flag that indicates whether a modern C2R Client's local machine service is up and running on the device

- **IsElevatedFlagSet –**	Boolean flag indicating whether the bootstrapper has already attempted to gain admin elevation

- **IsFireFlyInstalled –**	Boolean flag indicating whether the Office 2013 RTM C2R Client is currently installed

- **IsFireflyServiceRunning –**	Boolean flag that indicates whether a 2013 RTM C2R Client's local machine service is up and running on the device

- **IsOfficeInstalled –**	Boolean flag indicating whether a modern Office client is installed already

- **OfficeCultures –**	Serialized list of Office cultures to be installed

- **OfficeSourceType –**	Friendly string associated with the enum value of the installation source (CDN, HTTP, UNC, CMBITS, DVD, LOCAL)

- **Origin –**	String value telling us which of the supported origins (Puerto Rico [PR], Singapore [SG], Dublin [DB]) should be used for initial installation streaming

- **PlatformFromLink –**	String indicating the requested x86|x64|default bitness of Office requested from the C2R Setup service

- **PlatformOfExistingInstallation –**	String indicating whether x86 vs. X64 Office was already installed on the device

- **PlatformToInstall –**	String indicating the final decision on whether x86 vs. X64 Office should be installed. Possibilities are:  autorun, configure, consumer, download, help, packager

- **PRID –**	String value representing the requested Product Release ID in a consumer installation scenario (for example, "O365ProPlusRetail")

- **ProductsToAdd –**	The serialized string that instructs C2R Client on which Product/Culture combinations it should be installing

- **ProductsToRemove –**	The serialized string that instructs C2R Client on which Product/Culture combinations it should be uninstalling

- **SharedComputerLicensing –**	Boolean indicating whether an IT Admin requested setup to enable the "SharedComputerLicensing" feature

- **ShouldActivate –**	Boolean indicating whether an IT Admin requested an automatic licensing activation attempt in their configuration.xml

- **VersionToInstall –**	String value of the Office "16.0.xxxxx.yyyyy" version that is being installed
 

### Office.ClickToRun.UniversalBootstrapper.CollectEmbeddedSignature

Reports on the action that reads tagged input from the exe's embedded signature.  This is an unproven concept the previous iteration of setup.exe did not implement, and is what we're relying on to carry the user's product/language/bitness choices from web page to in-process within setup.exe.
 
- **ErrorCode –**	Integer number associated with an unhandled exception

- **ErrorDetails –**	String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage –**	String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType –**	String describing the category of an unhandled exception

### Office.ClickToRun.UniversalBootstrapper.CollectParameters

Reports the parameters used for the Office installation

- **BitField –**	Integer value of the BitField argument which tells us whether an explicit installation/update channel requested (Monthly, Insiders Slow, Insiders Fast, Semi-Annual, Semi-Annual Targeted)

- **ChannelID –**	Integer representing the enum value of the selected update/install channel (Monthly, Insiders Slow, Insiders Fast, Semi-Annual, Semi-Annual Targeted, Invalid)

- **CMDMode –**	The friendly string corresponding to which overall mode switch was detected in the cmd arguments passed to the exe. Possibilities are:  autorun, configure, consumer, download, help, packager

- **C2RClientUICulture –**	Culture of the C2R Client to install

- **ErrorCode –**	Integer value associated with an unhandled exception

- **ErrorDetails –**	String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage –**	String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType –**	String describing the category of an unhandled exception

- **ExcludedApps –**	String listing the individual Office application names requested to be excluded from the Office suites installed

- **InstalledCabVersion –**	The "16.0.xxxxx.yyyyy" version of an Office C2R Client already installed

- **InstalledProductVersion –**	The "16.0.xxxxx.yyyyy" version of an Office C2R product already installed

- **IsC2RServiceRunning –**	Boolean flag that indicates whether a modern C2R Client's local machine service is up and running on the device

- **IsElevatedFlagSet –**	Boolean flag indicating whether the bootstrapper has already attempted to gain admin elevation

- **IsFireFlyInstalled –**	Boolean flag indicating whether the Office 2013 RTM C2R Client is currently installed

- **IsFireflyServiceRunning –**	Boolean flag that indicates whether a 2013 RTM C2R Client's local machine service is up and running on the device

- **IsOfficeInstalled –**	Boolean flag indicating whether a modern Office client is installed already

- **OfficeCultures –**	Serialized list of Office cultures to be installed

- **OfficeSourceType –**	Friendly string associated with the enum value of the installation source (CDN, HTTP, UNC, CMBITS, DVD, LOCAL)

- **Origin –**	String value telling us which of the supported origins (Puerto Rico [PR], Singapore [SG], Dublin [DB]) should be used for initial installation streaming

- **PlatformFromLink –**	String indicating the requested x86|x64|default bitness of Office requested from the C2R Setup service

- **PlatformOfExistingInstallation –**	String indicating whether x86 vs. X64 Office was already installed on the device

- **PlatformToInstall –**	String indicating the final decision on whether x86 vs. X64 Office should be installed

- **ProductsToRemove –**	The serialized string that instructs C2R Client on which Product/Culture combinations it should be uninstalling

- **PRID –**	String value representing the requested Product Release ID in a consumer installation scenario (for example, "O365ProPlusRetail")

- **ProductsToAdd –**	The serialized string that instructs C2R Client on which Product/Culture combinations it should be installing

- **SharedComputerLicensing –**	Boolean indicating whether an IT Admin requested setup to enable the "SharedComputerLicensing" feature

- **ShouldActivate–**	Boolean indicating whether an IT Admin requested an automatic licensing activation attempt in their configuration.xml

- **VersionToInstall–**	String value of the Office "16.0.xxxxx.yyyyy" version that is being installed

### Office.ClickToRun.UniversalBootstrapper.Execute

Reports on the machine-impactful actions taken, as determined by the reasoned-over data from "CalculateParameters"

- **AvailableClientVersionText –**	String value of the C2R Client "16.0.xxxxx.yyyyy" version found in the Version Descriptor XML, which is used to determine whether a currently installed C2R Client should be updated

- **CleanFireflyAction –**	"true" if the CleanFireFlyAction task is scheduled to run during this installation

- **CleanO15Action –**	"true" if the CleanO15Action task is scheduled to run during this installation

- **CMDMode –**	The friendly string corresponding to which overall mode switch was detected in the cmd arguments passed to the exe. Possibilities are:  autorun, configure, consumer, download, help, packager

- **DeliveryMechanism –**	The "FFNRoot" guid extracted from the Version Descriptor XML (stamped by RDX), which tells us which audience/channel the build source came from

- **DownloadC2RClientAction –**	"true" if the DownloadC2RClientAction task is scheduled to run during this installation

- **ErrorCode –**	Integer value associated with an unhandled exception

- **ErrorDetails –**	String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage –**	String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType –**	String describing the category of an unhandled exception

- **ExitCode –**	Integer value associated with the result of running the Execute phase of the bootstrapper, indicating success vs. specific types of failure

- **LaunchAction –**	"true" if the LaunchAction task is scheduled to run during this installation

- **LaunchUpdateAction –**	"true" if the LaunchUpdateAction task is scheduled to run during this installation

- **PreReqResult –**	The integer enum value of the result when PreReq checks were performed (pass/fail/re-run)

- **UnexpectedAction –**	"true" if the UnexpectedAction task (an error case) is scheduled to run during this installation

- **VersionToInstall –**	String value of the Office "16.0.xxxxx.yyyyy" version that is being installed


## Enhanced Configuration Service (ECS) events

### Office.Experimentation.FeatureQueryBatched

Collects information about Feature gates/Change gates queried by executed code.

The following fields are collected:

  - **Count** - Number of queried feature gates in this batched event

  - **Features** - Information about the queried gate.

  - **Sequence** - Order in which FeatureGate was queried

### Office.Experimentation.FlightNumberLine

Collects the list of configurations received by the client from ECS

The following fields are collected:

  - **ECSConfigs** - Comma separated list of ECS Configs

  - **LockType** - Type of FlightManager lock.

  - **TasFlightingVersion** - Version number

  - **TimeToLock** - Time between liblet initiation and FlightManager lock

  - **UnmergedConfigs** - List of configurations not merged


## Licensing events

### Office.Licensing.AcceptEulaForCurrentLicense 

This is collected when the user gets licensed and accepts EULA for the current license

It is used to detect if the user is in a good state or not, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **ACID** - A GUID identifier representing the Office product that the user is licensed for

  - **DwEulaId** – Numeric identifier of the type of EULA that was just accepted by the user

### Office.Licensing.Activation 

Post setting up the license on the machine, we attempt to activate the license by calling the AVS service. This reports the result of the activation call

It is critical in detecting how many users are facing activation issues. We have anomaly detection to detect any regression. This is super critical as we have an external dependency on AVS and this signal points whether our external partners are healthy . It is also used for diagnostic purposes and system health if a user reports an issue with their machine

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for

  - **ReferralData** – Identifier of the OEM that installed Office on the machine

### Office.Licensing.ActivationWizard 

If we are not able to automatically activate the license for some reason, we show an activation wizard to the user. This reports that the wizard is being shown to the user. It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

This event collects no fields.

### Office.Licensing.EnforceSignInQualified 

This is the signal that tells us if the experiment that we are running to enforce user sign as part of licensing is successful. This is critical in detecting the success or failure of the experiment that is forcing the users to login which is a required step for the modern licensing stack. Failure to sign in will result in the users not being able to use the app.

The following fields are collected:

  - **Qualified** – Identifies whether the user qualified for the sign in enforcement

### Office.Licensing.ExpirationDialogShown

This is collected when we show the expiration dialog to the user that says that their license has expired It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **LicNotificationState** – An enumerator that tells us what kind of notification is being shown to the user

### Office.Licensing.FullValidation 

This is collected on every session that reports the licensing state of the machine and reports the errors that the user is seeing due to which they are not able to use the application. This event indicates if the user's machine is healthy or not. We have anomaly detection set up for this event to indicate if a regression is causing bad user behavior. This is also critical when diagnosing user issues and for monitoring system health

The following fields are collected:

  - **Acid** – A GUID identifier representing the Office product that the user is licensed for 

  - **IsSessionLicensing** – Whether we are currently running under shared computer activation mode or not 

  - **LicenseCategory** – Category of the Office license that the user is using 

  - **Licenses** – List of names of all the  Office licenses that are present on the machine 

  - **LicenseStatuses** – Status of all the Office licenses present on the machine 

### Office.Licensing.GetEntitlement 

We collect this when the user is setting up a device and we call our licensing service to detect if the logged in user has an Office entitlement or not. This reports the result of that call. It is critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

This event collects no fields.

### Office.Licensing.Heartbeat 

On every session we check if 72 hours have passed since the last license renewal and try to extend the expiry of the current license. This event reports the success or failure of the call that we make to ensure we can extend the expiry of the license and keep the user's Office installation functional. It is critical in diagnosing subscription related issues and service issues for the user and is critical in detecting regressions for already activated subscription users.

The following fields are collected:

  - **Mode** – An enumerator representation of the Office licensing stack that is being used on this machine

### Office.Licensing.InRFM 

If the device enters reduced functionality mode, we send out this signal to indicate that the machine is not in a healthy state. It is critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **ACID** - A GUID identifier representing the Office product that the user is licensed for

  - **DaysRemaining** - Number of days remaining before the current Office license expires

  - **Mode** – An enumerator representation of the Office licensing stack that is being used on this machine

  - **ProductName** – Name of the product that the user is currently using

  - **Reason** – The error code indicating the reason for the current status of the license

### Office.Licensing.InstallKey

This is collected when we try to install a key on the device to license the machine. It reports whether the installation was successful and if it was not then the error code. It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **Prid** – Name of the product group for which a key is being installed

  - **SkuId** - A GUID identifier representing the Office product for which a key is being installed 

### Office.Licensing.InvokeLicenseWizard

In case we see problems with the Activation workflow, we trigger a license wizard and send out this signal to indicate the same It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for

  - **LicenseStatus** – Status of the Office license that the user is using

  - **MachineKey** - An alphanumeric identifier of the license key that was issued to the user

### Office.Licensing.LicensingBar

If the device is facing licensing issues and we end up showing a busbar to the user, we send out this signal which also reports the type of busbar shown to the user. It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **SuppressNotification** – Indicates if we suppressed the licensing busbar

  - **Title** – The title of the licensing busbar that was shown to the user

  - **Type** – The type of the licensing busbar shown to the user

### Office.Licensing.LicExitOfficeProcess 

If we end up closing or crashing Office due to a licensing issue, we send out this signal to indicate the same. It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **ExitCode** – The internal code which caused the app to exit

### Office.Licensing.LoadIdentityTicket

In the process of trying to license the device, the app tries load the user's identity in order to see if the user has Office entitlement or not. This event reports the success or failure of the same along with the error code It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **FederationProvider** – A string that identifies the federation provider for the currently logged in user

  - **IdentityProvider** – A string that identifies the identity provider for the currently logged in user

### Office.Licensing.LVUX.EULAExplicitCrash 

This is collected if we showed the EULA to the user and the user chose to not accept it as a result of which we crash/close the app. It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for

  - **OptInShown** – Indicates whether the opt in dialog shown on the first boot of the app has already been shown

### Office.Licensing.NextUserLicensingEligible 

This signal tells us if a user is qualified to move to our new licensing stack. This is critical to quantify the impact on existing users as we roll out our new licensing stack and make sure that users are not losing functionality.

This event collects no fields.

### Office.Licensing.Nul.Fetcher.FetchModelFromOls

When the device is on the modern licensing stack, we try to get a license file directly from the service. This event reports the success or failure along with the error code of that service call. It is critical to detect if the user is in a good state on the modern licensing stack, used for system health and used for diagnostic purposes if a user reports an issue with their machine .

The following fields are collected:

  - **MetadataValidationResult** – Result of the validation of the metadata of the license to verify that it has not been tampered with

  - **SignatureValidationResult** – Result of the validation of the signature of the license to verify that it has not been tampered with

### Office.Licensing.Nul.Validation.FullValidation 

This is collected on every session of a device that is running on the modern licensing stack. It reports the licensing state of the machine and reports the errors that the user is seeing due to which they are not able to use the app This event indicates if the user's machine is healthy on the modern licensing stack. We have anomaly detection set up for this event to indicate if a regression is causing bad user behavior. This is also critical when diagnosing user issues and for monitoring system health.

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for 

  - **AllAcids** – List of all the GUIDs of the product that the user is currently licensed for 

  - **Category** - Category of the Office license that the user is using 

  - **DaysRemaining** – Number of days remaining before the current Office license expires 

  - **LicenseId** – An alphanumeric identifier of the license that was issued to the user 

  - **LicenseType** - Type of the Office license that the user is using 

### Office.Licensing.OfficeClientLicensing.DoLicenseValidation 

This is licensing metadata that is collected from the device on every boot that reports the license acid, license status, type and other properties of the license that are critical in identifying the features set available to the user. This is critical in identifying the feature set available to the user and if any functionality is missing for the user. It is also used for Daily active users/Monthly active user calculations and various other reports by various teams across Office as this tells the type product that the user is using, whether it is a subscription product and whether they are missing any critical functionality.

The following fields are collected:

  - **FullValidationMode** – Mode indicating that we are in full validation of license verification 

  - **IsRFM** – Indicates whether the user is in reduced functionality mode or not 

  - **IsSCA** – Indicates whether we are running in Shared computer activation mode 

  - **IsSubscription** – Indicates whether the user is using a subscription license or not 

  - **IsvNext** – Indicates whether we are using the new modern licensing stack or not 

  - **LicenseCategory** - Category of the Office license that the user is using 

  - **LicenseStatus** – Status of the Office license that the user is using 

  - **LicenseType** - Type of the Office license that the user is using 

  - **LicensingACID** - A GUID identifier representing the Office product that the user is licensed for 

  - **OlsLicenseId** - An alphanumeric identifier of the license that was issued to the user 

  - **SkuIdIsNull** – Indicates whether we encountered an error and don’t know the product that the user is running 

  - **SlapiIsNull** – Indicates whether we encountered a problem in populating one of the licensing objects 

### Office.Licensing.OnlineRepair 

If we are not able to activate a user for some reason and have to show them a dialog that asks them to go online and try repair steps, this event is fired. It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

This event collects no fields.

### Office.Licensing.Purchase 

We have an experiment that gives the user an option to try and setup autopay for Office directly from an app without ever leaving the context of the app. This reports the success orfailure of that experiment along with the error code It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **StorePurchaseStatus** – Represents the error code/success code of the purchase call that was made through windows store

### Office.Licensing.SearchForSessionToken

If the user is running under shared computer activation mode, we try to search for a session token on the machine which allows the user to use the app. This event reports the success orfailure of the scenario along with the error code It is critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **LoadLicenseResult** – Represents the error code/success code of whether we were able to load the licenses for the current user

  - **OpportunisticTokenRenewalAttempted** – Indicates whether we attempted to renew the user’s session token opportunistically

  - **SetAcidResult** – Represent the error code/success code of whether we were able to set the acid to the expected value

### Office.Licensing.ShowNewDeviceActivationDialog

On the first boot of an Office app, we will try to show a sign in dialog pre-populated with the credentials the user employed to download Office. The user can then continue to sign-in with those credentials, use different credentials or dismiss the dialog. This event reports the action taken by the user when presented with this dialog. It is critical for detecting if a user is in a good state on the modern licensing stack, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **UserAction** – Identifier for the action taken by the user when presented with the dialog.

### Office.Licensing.SkuToSkuConversion

As part of licensing the user, if we have to change the user's SKU from one SKU to another, we send this signal out along with the success or failure code. It is critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **DestinationSku** – Name of the SKU to which the currently installed product should be converted to

  - **PendingAcid** – Id of the product for which a SKU conversion is pending

  - **SourceSku** – Name of the original SKU that was installed on the machine

  - **UninstallProduct** – Indicates whether the old product will be uninstalled as part of the conversion

### Office.Licensing.UseGraceKey

For some reason if we are unable to license the user, we install a grace key and send out this signal that signifies. It is critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **OpportunisticTokenRenewalAttempted** – Indicates if we attempted an opportunistic renewal for the user in shared computer activation mode

  - **ReArmResult** – Indicates the result of rearming the installed key which can extend the expiry of the current license

## Microsoft AutoUpdate (MAU) events

### appdelegate_launch

This event denotes that an attempt to launch the app occurred. We log its result (failure or success). We use this event to identify cases in which MAU fails to launch

The following fields are collected:

- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under

- **AppversionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

 - **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - A set of static text indicating launch status.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### appdelegate_terminate

This event denotes that a graceful Application Exit occurred. We use this event to distinguish Graceful Application Exits from ungraceful ones.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience
	
- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier
	
- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wifi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text indicating Microsoft Autoupdate has terminated.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### appinstall_connecttoxpc

This event denotes that errors occurred connecting to MAU Helper (a component that performs application installation).  This event denotes a potential corruption of the MAU application. The device will not be able to install updates.

The following fields are collected:	

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains error information on the connection issue.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### appregistry_info

This event denotes that the application launched. We use this event to list the applications for which MAU can control updates, the number of copies available as well as their version and install location (default or other).

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on list of identifiers application uses to register with Microsoft Autoupdate services and number of installations registered for the application.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### appregistry_remove

This event denotes that an attempt to remove an App from the list of applications Managed by MAU took place. We use this event to confirm that only MAU-released applications are managed via MAU (no AppStore apps should appear here).

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Name and identifier of the application being removed, whether the application still exists in the registered location and if the application was installed from AppStore.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### catalog_errorsignature

This event denotes that a failure while performing code sign validation on an update collateral file occurred.  Any collateral failing code sign verification should be considered invalid.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains name of the catalog file with invalid signature. Different static text describes different error conditions.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### cloningtask_helpertoolconnection

This event records issues with install on clone (i.e. either we fail to connect to the helper to apply an update, or we connect but the helper is unable to apply the update). If we ever get a record reported, this means install on clone has failed and will now have to fallback to an in-place update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an ID to identify a single update activity, and Proxy Error reported during cloning process.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### configuration_channel

This event records attempts to switch Channels (Audience Group) in MAU.  We use this to log attempts and their results (success or failure).

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains selected Channel Name.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### configuration_metadata

This event is logged whenever MAU is initializing. It is a MAU heartbeat type of event

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text indicating either individual metadata is being initialized, or configuration is being initialized.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session.


### controller_alertmanager_reinstallresponse

This event denotes that MAU fell into an unusable/unrecoverable state and needs to be reinstalled. This event denotes an unrecoverable error and user intervention is required.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference of checking for updates

- **Payload** - Contains enumerated user selection.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_alertmanager_tmpdiskfull

This event denotes that insufficient disk space was detected. We will not be able to install updates due to insufficient disk space.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_alertmanager_tmpdiskfullretry

This event denotes that a retry attempt to install an update was initiated after Insufficient disk space was detected. We retry the installation after not being able to install updates due to insufficient disk space.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session
	

### controller_alertmanager_tmpdiskfullretrycancel

This event denotes that a cancellation on an install-retry attempt after Insufficient disk space was detected. We use this event to determine if our fallback mechanism was enough to guide the user thru the update process when insufficient disk was detected.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)
	
- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates
	
- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_checkwindow_noupdatefoundok

This event denotes that a check for updates resulted in no updates found We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	

### controller_checkwindow_updatecheck

This event denotes that a check for updates was performed. We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier
	
- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_checkwindow_updatecheckcancel

This event denotes that the process of checking for updates was cancelled (either by the user or by the system). We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_checkwindow_updatecheckcanceluser

This event denotes that the process of checking for updates was cancelled by the user.  We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version
	
- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_checkwindow_updatesfound

This event denotes that the process of checking for updates resulted in updates found.  We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_checkwindow_uptodate

This event denotes that the process of checking for updates resulted no updates because apps in the device are up to date.  We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_applaunchwithpendingupdate

This event denotes that an app that is in the process of getting updates was launched. We use this event for ensuring updates are offered correctly. We should prevent opened apps from getting updates. Apps must be closed prior to update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address
	
- **SessionId** - The identifier for the session

	
### controller_downloadwindow_closeapplicationdialog

This event denotes that an app that is in the process of getting updates was launched. We use this event for ensuring updates are offered correctly. We should prevent opened apps from getting updates. Apps must be closed prior to update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_downloadwindow_curtasknull

This event denotes that an unexpected error occurred while attempting to apply an update. We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_downloadwindow_downloadcancel

This event denotes that the download process was cancelled by user.  We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_downloadwindow_downloadfailed

This event denotes that a failure occurred when downloading an update. We use this event for ensuring updates are offered and downloaded correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_downloadwindow_downloadfailedok

This event denotes that a failure occurred when downloading an update and the user was notified. We use this event for ensuring updates are offered and download correctly, and that in case of failure, a notification is served to the user.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_downloadpathmissing

This event denotes that a failure occurred when downloading an update. We use this event for ensuring updates are offered and downloaded correctly. This event indicates a download URL is missing.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_downloadtasknull

This event denotes that a failure occurred when downloading an update. We use this event for ensuring updates are offered and downloaded correctly. This event indicates that Microsoft Autoupdate was asked to pause/resume a download but could not find corresponding download manager.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_filesignaturenotverified

This event denotes that a failure occurred when downloading an update. This event indicates that Microsoft Autoupdate was unable to verify that this update was published by Microsoft. We use this event for ensuring updates are offered and downloaded correctly. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that contains download URL. This is a Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_installcomplete

This event denotes that the installation of all updates offered by Microsoft Autoupdate completed. We use this event for ensuring updates are offered and downloaded correctly. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under
	
- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_networkunavailablealert

This event denotes that network connectivity was lost while downloading updates.  We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_downloadwindow_networkunavailablealertok

This event denotes that network connectivity was lost while downloading updates. It also denotes that the user was notified of this error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_downloadwindow_noconnectionok

This event denotes that network connectivity was lost while downloading updates. It also denotes that the user was notified of this error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_repairrequired

This event denotes that the update process failed. It also denotes that an update was completed but Microsoft Autoupdate found a problem with updated application and repair is required. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)
	
- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device
	
- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### controller_downloadwindow_updateaborted

This event denotes that the update process was aborted. It also denotes that an update was already in progress by Daemon and user clicked OK to abort download. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_updatefailed

This event denotes that one or more updates from the current batch failed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_updatesuccessful

This event denotes that all updates from the current batch were successful. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_userpaused

This event denotes that all updates from the current batch were successful. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_downloadwindow_userresumed

This event denotes that the download updates process was resumed successfully after going into pause. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_mainwindow_setautomaticdownloadinstall

This event denotes that the device was enrolled into Automatic Update mode. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_mainwindow_setmanualchecking

This event denotes that the device was enrolled into Manual Update mode. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_templateawindow_cancel

This event denotes that the user chose to cancel or ignore a provided warning message. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_templateawindow_enroll

This event denotes that the user chose to follow a provided warning recommendation. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates
	
- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session



### controller_templateawindow_install

This event denotes that the user chose to follow a provided warning recommendation related to initiating a software installation action. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_updatewindow_begindownloadingapps

This event denotes that the download for updates was started via Update Window. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains a dictionary of available update packages and an indication whether user selected to install that entry.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_updatewindow_networkretry

This event denotes that a retry was triggered at the Update Sheet due to network failure. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_updatewindow_networkretrycancel

This event denotes that a retry could not be triggered at the Update Sheet due to network failure. This event indicates user elected to cancel updates after being alerted of network becoming unavailable. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_updatewindow_networkunavailable

This event denotes that network connectivity was suddenly lost. This event indicates server is not reachable when attempting to download an update package. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_updatewindow_noupdateavailable

This event denotes that there was a search for updates that resulted in no updates being available. This event indicates no available updates were found by Microsoft Autoupdate. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller_updatewindow_noupdatestoselect

This event denotes that an error occurred resulting in an empty list of updates. This event indicates Microsoft Autoupdate is showing an empty update sheet. This should not happen. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### Controller_UpdateWindow_UpdateAvailable

This event denotes that there was a search for updates that resulted in updates being offered. We use this even to determine whether updates are being offered for the user to see, whether the proper updates are being shown, or whether update blocking is working as expected. We use this event to ensure the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains a dictionary of available update packages and user selection status for each.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### controller_updatewindow_updateavailablecancel

This event denotes that a user cancelled after we displayed the update sheet listing updates. We use this even to explain reasons for not updating (i.e. user willingly cancels). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadactor_pause

This event denotes that the user issued a request to pause the download. We use this even to explain reasons for updates apparently not completing. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadactor_redirect

This event denotes that the downloader agent is pointed to an endpoint that issues a URL redirect for the download request. We use this even to explain reasons for download failure and diagnose proxy issues. It can also help diagnose reasons why users are observed to install older builds. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains redirected URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### downloadactor_resume

This event denotes the user issues a request to resume a paused download. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadactor_resumeerror

This event denotes the user issues a request to resume a paused download. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download URL path. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### downloadactor_status

This event logs that there are attempts to fetch collateral files and their result (Success or Failure). We want to know the collaterals and packages being fetched. A wrong file being fetched can indicate a build/collateral issue. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download URL, and an error code in case of failure. Download URL is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_downloadcatalogfail

This event a download failure occurred. The file that failed to download is logged. We want to know the collaterals and packages being fetched. A failure to download a manifest can point to either a build collateral generation failure, a CDN configuration error, a client configuration error, a network error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### downloadmanifest_downloadcatalogsuccess

This event denotes that a file was successfully downloaded. A failure to download a manifest can point to either a build collateral generation failure, a CDN configuration error, a client configuration error, a network error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_downloadfail

This event denotes that a download error occurred. The manifest or package file that failed to download as well as error details are logged. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_downloadfromurl

This event denotes that the downloading of a catalog file has started. We log the URL from which the catalog file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_downloading

This event denotes that the downloading of a catalog file has started. We log the URL from which the catalog file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_downloadsuccess

This event denotes that the downloading of an XML and package file has succeeded. We log the URL from which the file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### downloadmanifest_downloadurl

This event denotes that a request to download a file occurred. We log the URL from which the file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_filenameerror

This event denotes that an unexpected error occurred. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_invalidhash

This event denotes a security validation of our files failed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains name of the downloaded file with invalid hash value.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_missingdaemon

This event denotes a user attempted to check for updates and we discovered that MAU was missing a core component (daemon). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_signatureerror

This event denotes that the code signature verification failed for a package. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains a name of the downloaded file with invalid hash value.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest_status

This event logs a summarized aggregation of attempts/failures hit during the download process for manifest and package files. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information including URL (Microsoft address), prefix of the file being downloaded, any errors encountered, etc.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmgr_downloadend

This event logs a marker that indicates the download process completed on its own. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information including URL (Microsoft address), prefix of the file being downloaded, any errors encountered, etc.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmgr_downloadstart

This event logs the update that is about to be downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the name of the update being downloaded.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadtask_downloadfailure

This event logs that an error occurred downloading a package file. We log the update path and the error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the name of the update being downloaded and the error observed.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadtask_downloadsuccess

The successful downloading a package file. We log the update path used. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the update path for the successful download.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_checkforupdate

This event denotes that a background process is checking for updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_checkforupdateskip

This event denotes that a background process skipped update due to MAU GUI being opened. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_launchstatus

This event logs MAU’s daemon failures while attempting to launch. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains OSStatus (Apple status code) reflecting launch status.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_silentupdateoptin

This event denotes that the user is Opting into silent updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_skipforcedupdate

This event indicates forced update check is being skipped due to open applications. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_startforcedupdate

This event indicates that an attempt to apply a forced update has occurred. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_terminate

This event indicates that the MAU daemon terminated normally. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba_updatefound

This event indicates that the MAU daemon has found available updates to offer. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains number of available updates found.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### fba_updatetimer

This event indicates Microsoft Autoupdate Daemon process became active to check for updates after sleeping for set amount of time. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains current date time information.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_allappsclosed

This event logs if all apps were closed prior an install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience
	
- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_applaunchafterupdate

This event logs an attempt to relaunch the app after a silent update and the update mode (clone or not). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the application be launched.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)
	
- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_applaunchwileinstalling

We log when an app launch was made while installing an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_appneedtoclose

We log when an update process was kicked off and we find that the application to update was opened. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of an update and application bundle ID.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_appterminationeventreceived

This event indicates Microsoft Autoupdate has received an apple event informing the application has been terminated. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and application bundle ID. This may also contain an error string if Microsoft Autoupdate determines the application is still running even though termination event was received.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_codesignfailure

This event logs the result of codesign verification after applying an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the result of the codesign verification operation.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_download

This event denotes that an update is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of an update.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_downloadfailed

This event denotes that a failure occurred while downloading an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of an update.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_downloadinbackground

This event denotes that we are starting the download a set of updates in the background (we log the number of updates being concurrently downloaded). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains number of updates queued.

	- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_downloadingrepairupdate

This event denotes that we have initiated an attempt to download a repair for a failed update. We log the version and the update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of an update.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_duplicatedownloadattempted

This event denotes that an error occurred. We should only be downloading one update for a given app at a time. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_installattemptfailed

This event denotes that an installation attempt for an update (version) failed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_installcomplete

This event denotes that all updates on the batch finished installing. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_installed

This event denotes that an individual update was installed successfully. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event. Contains the update identifier.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### fbasilentupdate_installing

This event denotes that an individual update was initiated. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of an update and update package name.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_notificationremoved

This event denotes that an update that was blocked is no longer blocked. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an application ID (identifier application uses to register with Microsoft Autoupdate service) for the previously blocked application
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_queueinstall

This event denotes that an update will be queued for silent installation. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the update.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_requiredappsclosed

We log when an application that has a pending update has been closed. This indicates the time at which the actual install can proceed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, application bundle ID.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_updateavailablenotification

This event indicates an update available notification is triggered. We must ensure the flow to prompt for updates is triggered when an update is detected. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_userclicknotification

This event indicates user clicked content section of the update available notification and Microsoft Autoupdate GUI is being launched. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_userselectinstalllater

This event indicates user opted to install later after shown update available notification. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate_userselectinstallnow

This event indicates user opted to install now after shown update available notification. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installdata_checkrunning

This event logs the result of a check between the apps to be installed and whether the installation attempt will proceed based on the app being opened. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installdata_cleanup

Package files should be removed after installation. This event records instances in which we fail to remove them. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains downloaded file name and error details.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installedapp_invalidbundle

This event indicates Microsoft Autoupdate could not retrieve bundle information for the registered application at given path. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application name.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installedapp_invalidpreference

This event logs cases in which the user preference contains an invalid application entry. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference of checking for updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installedapp_nilbundleid

This event logs cases in which the bundle ID was missing for an app. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application name.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installedapp_nilbundlename

This event logs cases in which the bundle name was missing for an app. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application name.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installstatus_codesign

This event logs the status of the OS codesign binary. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installstatus_daemon

This event logs the status of the status of the Microsoft AutoUpdate daemon. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an indication whether Daemon component exists at expected location and whether it is codesigned.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installstatus_helper

This event logs the status of the status of the Microsoft AutoUpdate helper tool. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an indication whether PrivilegedHelperTool component exists at expected location and whether it is codesigned.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installupdatestask_applaunched

This event indicates Microsoft Autoupdate has detected application launch for a blocked update but could not find matching installer. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains name of the launched application.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installupdatestask_applaunchwithpendingupdate

This event indicates Microsoft Autoupdate detected application launch for an application with a pending update. Launched application will be terminated. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installupdatestask_codesignverificationfail

This event denotes that CodeSign verification failed for an app update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of the updated application and failure code.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_codesignverificationstart

This event denotes that CodeSign verification started for an app update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the updated application.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_codesignverificationsuccess

This event denotes CodeSign verification success for an app update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the updated application.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_failsilentinstall

This event logs failures while applying silent updates and whether this was a cloned or regular install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 
	
- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and the type of update.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installupdatestask_multiplerelocatablepackage

This event indicates Microsoft Autoupdate has found multiple instances of application entry for a given update package in downloaded manifest. We use this event to ensure the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of update

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installupdatestask_removeclone

This event denotes that a clone was removed. We remove a clone when either the Install On clone process completed, or when a new process starts, and an older cloned version is found in the machine. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update, update package name, remove clone status / error details.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_retryfail

This event denotes that errors were encountered during the installation retry process. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update and whether install should be performed via Install On Clone

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_retryproxyerror

This event logs intra-process communication errors (communication with MAU helper tool). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update and details on proxy error reported.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### installupdatestask_retryproxyerror

This event logs intra-process communication errors (communication with MAU helper tool). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update and details on proxy error reported.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	

### installupdatestask_retryresponse

This event logs that a retry did not work. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update, application version, update package name and an indication whether Install On Clone was on, whether install was successful and any errors reported on failure.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_retrysuccess

This event logs a successful update installation after a retry. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update, application version, update package name and an indication whether Install On Clone was on.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask_setreopengui

This event indicates whether setting preference to reopen GUI after install was successful. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text indicating success of operation.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate_cli_eventhandler_applyupdates_appids

This event indicates a CLI (client-line interface) command was issued to apply an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains list of application Ids to be updated.
	
- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate_cli_eventhandler_config

This event indicates Microsoft Autoupdate Command Line Interface module received an apple event to configure. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate_cli_eventhandler_updates

This event indicates Microsoft Autoupdate Command Line Interface module received an apple event to list updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### msupdate_monitor_progress_downloaded

This event indicates that updates were downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates downloaded

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate_monitor_progress_failure

This event logs a list of queued updates that failed to be applied. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### msupdate_monitor_progress_finished

This event logs a list of queued updates that completed install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate_monitor_progress_queued

This event logs a list of queued updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### Optinnotificationaction

This event logs the user’s response to opt-in dialog for enrolling into silent updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains static text representing user selection for opting into Automatic Download and Install.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### sauupdateinfoprovider

This event logs whenever a manifest key is missing from a collateral. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the string used to look for update location or size.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatecore_appregistration

This event logs attempts to register an app and the result/reason. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, indication whether preference is available, indication if this is re-registration and an indication whether registration is required.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatecore_loadinglaunchagent

This event indicates Launch Agent is being loaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatecore_server_connectionfail

This event logs errors hit while reaching out to the CDN. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on server name, whether server is valid and if server is reachable.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper_cannotretrievebuilddate

We can filter updates via MAU Service only when the update being offered is not older than certain amount of days. Here we log that we could not retrieve the date from the app metadata. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application id.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper_invalidresponsefromupdatefiltering

We can filter updates via MAU Service only when the update being offered is not older than certain amount of days. Here we log the date is missing from the app metadata. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 
	
- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper_missingbuilddate

We can filter updates via MAU Service only when the update being offered is not older than certain amount of days. Here we log the date is missing from the app metadata. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper_updatebypassedoldage

We can filter updates via MAU Service only when the update being offered is not older than certain amount of days. Here we log the service is bypassed due to old update date. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_check_start

This event logs whenever we initiate a check for updates operation. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on updates to offer, registered applications and temporary location downloaded files will save to.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_check_status

This event aggregates the status of the check for update operations (the funnel from searching until downloading). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on updates to offer, registered applications and temporary location downloaded files will save to.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_check_updatefound

We log whenever a check for updates results in updates found. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_check_updatenotfound

We log whenever a check for updates results in no updates offered due to no updates being found. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_check_uptodate

We log whenever a check for updates results in no updates offered due to all apps being already up to date. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_offerupdates_minoscheckfail

We log whenever we blocked an update due to not meeting OS requirements. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains minimum required OS version as specified in downloaded manifest file.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_offerupdates_nullbundleforappid

This event indicates Microsoft Autoupdate was unable to load bundle information for the application ID specified in downloaded manifest file. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_offerupdates_updaterulematched

This event denotes that an update was found for an app and baseline. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID and bundle version information.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### updatefinder_registeredapps

We log the apps that are installed/registered/Controlled by MAU. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID and bundle version information.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### updatefinder_suite_missingcollateral

Suite Update - We log whenever a suite update is not applicable due to collateral missing. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_suite_staleversion

Suite Update - We log whenever a suite update is not applicable due to baseline version being too old. We log the baseline version and the Suite AppId. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains suite name.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_suite_updateapplicable

Suite Update - We log whenever a suite update is applicable. We log the baseline version and the Suite AppId. We log the baseline version and the Suite AppId. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_suite_updatenotapplicabledefaultpath

Suite Update - We log whenever a suite update is not offered due not all suite apps being install under the default path. We log the baseline version and the Suite AppId. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### updatefinder_suite_updatenotapplicableversion

Suite Update - We log whenever a suite update is not offered due not all suite apps being in the same baseline version. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_suite_updatenotoffered

Suite Update - We log whenever a suite update is not offered due to suite size being larger than individual updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains suite name.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder_suite_updateoffered

Suite Update - We log whenever a suite update is offered. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatemanager_checkupdate

This event logs number of updates found by Microsoft Autoupdate while checking for available updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains count of available updates found.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### updatemanager_updatespending

This event denotes that updates were found and are pending install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains indication whether the task is running on main thread, and number of pending updates.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### webservices_checkforsilentupdates

This event denotes that silent-update candidates were found. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains count of updates found and application ID.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### webservices_deltaupdater

This event logs interactions between the client code and the feature gate that controls whether the client should allow for Delta updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains response from web-services and updater type to applied.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### webservices_serviceaction

We log any errors resulting from an unexpected webservice response. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains details of action being pushed from web-services.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### webservices_serviceaction

We log any errors resulting from an unexpected webservice response. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains details of action being pushed from web-services.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### webservices_serviceresponse

This event logs requests to MAU Service, response times and Errors. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains request ID, application name, response time and/or status code.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

	
### webservices_silentupdate

We log requests to check for any "force update" applicability rules, i.e. we must take a user from build N to build N+1 due to some major issue. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains request ID, application name, response time and/or status code.

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session



### webservices_webcontent

We log requests and responses received into webservices. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains web-service caller ID

- **PipelineInfo_ClientCountry** - The device country (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

## OneNote sync events

### Office.OneNote.Storage.NotebookSyncResult
 
This event logs notebook sync result. It is used for figuring out how many unique sync targets when calculating OneNote sync score.
 
The following fields are collected

- **CachedError_Code** - a numbered or alphanumeric code used to determine the nature of the cached error, and/or why it occurred

- **CachedError_Description** – a description of the cached error

- **CachedError_Tag** – indicate where in the code throws the cached error

- **CachedError_Type** – the type of the cached error, e.g. Win32Error, etc.

- **ExecutionTime** – time in milliseconds taken to replicate the notebook

- **Gosid** – global object space ID

- **IdentityType** – identity type, e.g. Windows Live, Org ID, etc.

- **InitialReplicationInSession** – is this replication the first notebook replication after open or not

- **IsBackgroundSync** – is this a background sync or not

- **IsCachedErrorSuppressed** – is the cached error suppressed or not

- **IsCachedErrorUnexpected** – is the cached error unexpected or not

- **IsNotebookErrorSuppressed** – is the notebook level sync error suppressed or not

- **IsNotebookErrorUnexpected** – is the notebook level sync error unexpected or not

- **IsSectionErrorSuppressed** – is the section sync error suppressed or not

- **IsSectionErrorUnexpected** – is the section sync error unexpected or not

- **IsUsingRealtimeSync** – is the notebook sync using modern page content sync or not

- **LastAttemptedSync** – timestamp when the notebook was attempted to be synced last time

- **LastBackgroundSync** – timestamp when the latest background sync was attempted

- **LastNotebookViewedDate** – the date when the notebook was last viewed

- **LastSuccessfulSync** – timestamp when the notebook successfully synced before

- **NeedToRestartBecauseOfInconsistencies** – does the sync need to restart because of inconsistencies or not

- **NotebookErrorCode** – notebook level sync error code saved on notebook graph space

- **NotebookId** – notebook ID

- **NotebookType** – notebook type

- **ReplicatingAgainBecauseOfInconsistencies** – does the sync restart because of inconsistencies or not

- **SectionError_Code** – a numbered or alphanumeric code used to determine the nature of the section sync error, and/or why it occurred

- **SectionError_Description** – a description of the section sync error

- **SectionError_Tag** – indicate where in the code throws the section sync error

- **SectionError_Type** – the type of the section sync error, e.g. Win32Error, etc.

- **Success** – is the notebook sync successful or not

- **SyncDestinationType** – sync destination type, i.e. OneDrive or SharePoint Online

- **SyncId** – a number unique to each notebook sync

- **SyncWasFirstInSession** – is this sync the first sync in current session

- **SyncWasUserInitiated** – is this sync user initiated or not

- **TenantId** – SharePoint tenant ID

- **TimeSinceLastAttemptedSync** – time since last notebook sync attempt

- **TimeSinceLastSuccessfulSync** – time since last successful notebook sync

### Office.OneNote.Storage.RealTime.WebSocketSessionInfo
 
This event logs WebSocket sync result for both OneNote modern page content sync modern hierarchy sync. It is used for figuring out how many unique sync targets when calculating OneNote sync score. It is also used for OneNote modern sync performance dashboard.
 
The following fields are collected:
 
- **CloseReason** - WebSocket close reason, e.g. Abnormal close, etc.

- **DataIsFreshCount** - number of successful pull requests in the WebSocket session

- **DeviceSessionId** - Device session ID

- **DownloadCount** - number of downloads in the WebSocket session

- **Error** - is basically Exception_Type + Exception_Description + Exception_Code + Exception_Tag

- **Exception_Code** - a numbered or alphanumeric code used to determine the nature of an error, and/or why it occurred

- **Exception_Description** - a description of the error

- **Exception_Tag** - indicate where in the code throws the error

- **Exception_Type** - the type of the error, e.g. Win32Error, etc.

- **FirstUpdateSize** - first update message length

- **HasError** - whether there is an error during the WebSocket session 

- **IsEducationNotebook** - Is the current notebook education notebook or not

- **IsHierarchyResource** - Is the current resource a page or a section

- **NotebookId** - OneNote notebook ID

- **OperationWithError** - in which operation did the error happen, e.g. WebSocket.Close, WebSocket.Open, etc.

- **ResourceId** - OneNote page or section resource ID

- **SectionId** - OneNote section ID

- **ServerSessionId** - session ID used to correlate WebSocket request to onenote.com

- **SessionDurationInMs** - the duration in milliseconds of the WebSocket session

- **TenantId** - SharePoint tenant ID

- **TimeToFirstUpdateInMs** - time in milliseconds taken to receive first update from the server side after the WebSocket session is established

- **UploadAckCount** - number of acknowledges for upload in the WebSocket session

- **WebUrl** - PII scrubbed web URL 

### Office.OneNote.Storage.SectionSyncResult
 
This event logs section sync result. It is used for figuring out how many unique sync targets when calculating OneNote sync score. It is also used for OneNote modern sync performance dashboard.
 
The following fields are collected

- **Error_Code** - a numbered or alphanumeric code used to determine the nature of an error, and/or why it occurred

- **Error_Description** - a description of the error

- **Error_Tag** - indicate where in the code throws the error

- **Error_Type** - the type of the error, e.g. Win32Error, etc.

- **ErrorLast** - the error code of last seen error 

- **ExecutionTime** - time in milliseconds taken to replicate the section

- **InitialReplicationInSession** - is this replication the first notebook replication after open or not

- **IsAttachedViaShortcut** - is the section attached via shortcut or not

- **IsBackgroundSync** - is this a background sync or not

- **IsEncrypted** - is the section encrypted or not

- **IsErrorSuppressed** - is this error suppressed or not 

- **IsErrorTransient** - is this error transient or not

- **IsErrorUnexpected** - is this error unexpected or not

- **IsUsingRealtimeSync** - is the section sync using modern page content sync or not

- **NotebookId** - notebook ID

- **NotebookPath** - PII scrubbed notebook URL

- **SectionPath** - PII scrubbed section URL

- **SectionReplicatingIsOutbound** - is this replication an outbound replication or not

- **SectionReplicatingIsSameIdentity** - is this replication based on the same file identity or not

- **SectionResourceId** - OneNote section resource ID

- **Success** - is the section sync successful or not

- **SyncDestinationType** - sync destination type, i.e. OneDrive or SharePoint Online

- **SyncId** - a number unique to each section sync

- **SyncWasFirstInSession** - is this sync the first sync in current session

- **SyncWasUserInitiated** - is this sync user initiated or not

- **TenantId** - SharePoint tenant ID

- **UnmappedGosid** - section ID before applying the mapping GUID


### Office.OneNote.Storage.SyncScore
 
This event logs all negative factors in sync experience that are visible to users. It is used to calculate OneNote sync score, which is a critical metric to evaluate OneNote users' sync experience.
 
The following fields are collected

- **AutoShowSyncStatus** - whether sync status is auto shown or not

- **Cause** - what caused OneNote pages/sections moved to misplaced sections

- **Context** - an enum categorizes what user is trying to do, e.g. rename a section, reopen a notebook, etc.

- **Error_Code** - a numbered or alphanumeric code used to determine the nature of an error, and/or why it occurred

- **Error_Description** - a description of the error

- **Error_Tag** - indicate where in the code throws the error

- **Error_Type** - the type of the error, e.g. Win32Error, etc.

- **ErrorText** - error text shown in the UI

- **Explanation** - explains what kind of pending outbound changes that need to be moved to misplaced sections

- **fishbowlType** - type of fishbowl, e.g. page fishbowl, section fishbowl, etc.

- **IDS** - an integer identifier for the text shown in the UI

- **idsFishbowl** - an integer identifier for the fishbowl error shown in the UI

- **IsUsingRealtimeHierarchySync** - Is using modern hierarchy sync or not

- **NotebookId** - notebook id

- **PageSyncUIState** - page sync status string, e.g., UpToDate, Syncing, SaveOffline, SyncError, etc. 

- **ServerGosid** - resource id for newly created conflict page

- **Source** - an enum indicates which event triggered the UI, i.e. created a new redx image, sync error in the sync UI, error dialog displayed, etc.


## Services Configuration events

No required service diagnostic data events are collected by Services Configuration.

## Telemetry events

### Office.System.IdentityChanged

User identity information required to fulfill data subject requests.

The following fields are collected:

  - **IdentityChanged** - Always true. The identity changed.

  - **TimerDetectedChange** - Whether the change was detected by regularly timed ping.

### Office.System.PrivacyFallbackToSettingsStore

Used to determine if there are failures with reading the user's privacy settings from the Roaming store.

The following fields are collected:

  - **Tag -** The code tag indicating which setting has fallen back to the settings store.

### Office.System.SessionDataO365

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **AppId -** Identifier for what Office application this data refers to.

  - **ApplicationArchitecture -** What processor architecture Office is built for.

  - **AppVersionBuild -** The Build version of the Office application.

  - **AppVersionMajor -** The Major version of the Office application.

  - **AppVersionMinor -** The Minor version of the Office application.

  - **AppVersionUpdate -** The Build Revision of the Office application.

  - **CollectorVersion -** A version identifier for the client collection logic.

  - **DeviceHash -** A one-way hash of the operating system device identifier.

  - **DeviceName -** Name of the Device Office is run on.

  - **Domain -** Domain of the Device Office is run on.

  - **IsCeip -** Whether the install of Office was enrolled in the defunct Customer Experience Improvement Program.

  - **IsDebug -** Whether this is a debug build of Office.

  - **IsImmersive -** Whether the Office application is a Universal Windows or Immersive application.

  - **IsLaptop -** Whether the device Office is running on is a laptop.

  - **IsMicrosoftInternal -** Whether the Windows user running Office is a Microsoft employee.

  - **IsO365 -** Whether the Office installation is part of the defunct Outlook 365 program.

  - **IsTablet -** Whether the device Office is running on is a tablet.

  - **IsTerminalServer -** True/false is terminal server client

  - **MaxMemory -** The maximum amount of random-access memory available to the device running Office.

  - **OsArchitecture -** The CPU architecture the operating system running Office is built for,

  - **OsVersionBuild -** The Build version of the Operating System.

  - **OsVersionMajor -** The Major version of the Operating System.

  - **OsVersionMinor -** The Minor version of the Operating System.

  - **OsVersionUpdate -** OS build revision

  - **ProcessFileName -** The running application’s executable name.

  - **ProcessorArchitecture -** What processor architecture Office is running on.

  - **ProcessorFrequency -** The speed of the processor on the devices Office is running on in Megahertz.

  - **SessionStart -** The time at which the running Office process started.

  - **UserName -** The name of the account running Office.

### Office.System.SystemHealthCoreMetadata

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **AppBuild -** The Build version of the Office application.

  - **AppBuildRevision -** The Build Revision of the Office application.

  - **AppMajorVer -** The Major version of the Office application.

  - **AppMinorVer -** The Minor version of the Office application.

  - **CID -** Pseudonymized user identity

  - **CollectibleClassifications -** The set of data classifications that can be collected.

  - **CollectionTime -** Time at which the metadata was collected.

  - **DeviceManufacturer -** The manufacturer of the device Office is being run on.

  - **DeviceModel -** The model of the device Office is being run on.

  - **FirstRunTime -** The first time an Office application was run.

  - **IsClickToRunInstall -** Whether the Office application was installed using Click -To-Run

  - **IsDebug -** Whether this is a debug build of Office.

  - **IsLabMachine -** Whether Office is being run in a Microsoft lab.

  - **IsLaptop -** Whether the device Office is running on is a laptop.

  - **IsMsftInternal -** Whether the Windows user running Office is a Microsoft employee.

  - **IsSubscription -** Whether the Office application is installed under a subscription license.

  - **IsTablet -** Whether the device Office is running on is a tablet.

  - **IsTerminalServer -** Whether Office is being run on a terminal server.

  - **MsoAppId -** Identifier for what Office application this data refers to.

  - **OfficeArchitectureText -** What processor architecture Office is built for.

  - **OsBuild -** The Build version of the Operating System.

  - **OsBuildRevision -** OS build revision

  - **OSEnvironment -** Identifier for what environment Office is running on.

  - **OsMajorVer -** The Major version of the Operating System.

  - **OsMinorVer -** The Minor version of the Operating System.

  - **OSVersionString -** The Operating System version as a string.

  - **ProcessorArchitecture -** What processor architecture Office is running on.

  - **ProcessorCount -** The count of processors on the device Office is running on.

  - **ProcSpeedMHz -** The speed of the processor on the devices Office is running on in Megahertz.

  - **RamMB -** The amount of RAM available in the device Office is run on.

  - **SqmUserId -** A random identifier for the install of Office.

### Office.System.SystemHealthDesktopSessionLifecycleAndHeartbeat

Provides information on system health metrics.

The following fields are collected:

  - **InstallMethod** - Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

  - **PreviousBuild** - The version of Office this build was upgraded to or rolled back from.

  - **State** - State which the session changed to.

  - **Time** - Time when the session state changed.

### Office.System.SystemHealthEssentialIdentityCount

Collects the count of signed-in user identities

The following fields are collected:

  - **AllIdentityCount** - Count of all identities

  - **ValidIdentityCount** - Count of validated identities

### Office.System.SystemHealthEssentialMetadataAllIdentities

Monitors the state of accounts recognized by Office in this session. Used to isolate a failure to an account login type if the failure is specific to a type.

The following fields are collected:

  - **CollectionTime** - The time at which the identity information was collected.

  - **IdentityType** - The type of authentication or account

  - **IdentityUniqueId** - Pseudonymized identity identifier

  - **IdentityUniqueIdHashed** - One-way hash of the identity unique ID

### Office.System.SystemHealthMetadataApplicationAdditional

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **Alias -** If the user running Office is a Microsoft employee, their company internal alias.

  - **AppBuild -** The Build version of the Office application.

  - **AppBuildRevision -** The Build Revision of the Office application.

  - **AppMajorVer -** The Major version of the Office application.

  - **AppMinorVer -** The Minor version of the Office application.

  - **CID -** Pseudonymized user identity

  - **CollectibleClassifications -** The set of data classifications that can be collected.

  - **DeviceManufacturer -** The manufacturer of the device Office is being run on.

  - **DeviceModel -** The model of the device Office is being run on.

  - **DeviceProcessorModel -** The processor model of the device Office is run on.

  - **DigitizerInfo -** Information about the digitizer attached to the device Office is run on.

  - **DomainName -** The name of the domain the machine running Office is joined to (if any).

  - **FirstRunTime -** The first time an Office application was run.

  - **HorizontalResolution -** Horizontal screen resolution

  - **IsDebug -** Whether this is a debug build of Office.

  - **IsImmersive -** Whether the Office application is a Universal Windows or Immersive application.

  - **IsJoinedToDomain -** Whether the device running Office is domain joined.

  - **IsLabMachine -** Whether Office is being run in a Microsoft lab.

  - **IsLaptop -** Whether the device Office is running on is a laptop.

  - **IsMsftInternal -** Whether the Windows user running Office is a Microsoft employee.

  - **IsOEMInstalled -** Whether the running Office application was installed by an OEM.

  - **IsRunAsAdmin -** Whether the Office application is running as Administrator.

  - **IsSubscription -** Whether the Office application is installed under a subscription license.

  - **MsoAppId -** Identifier for what Office application this data refers to.

  - **NumProcPhysCores -** Number of physical cores in the processor.

  - **OfficeBuild -** The Build version of the Office shared libraries.

  - **OfficeBuildRevision -** The Build Revision version of the Office shared libraries.

  - **OfficeMajorVer -** The Major version of the Office shared libraries.

  - **OfficeMinorVer -** The Minor version of the Office shared libraries.

  - **OsBuild -** The Build version of the Operating System.

  - **OsBuildRevision -** OS build revision

  - **OsMajorVer -** The Major version of the Operating System.

  - **OsMinorVer -** The Minor version of the Operating System.

  - **PowerPlatformRole -** An identifier of the OEM preferred computer role of the device Office is run on.

  - **ProcessFileName -** The running application’s executable name.

  - **ProcessorCount -** The count of processors on the device Office is run on.

  - **RamMB -** The amount of RAM available in the device Office is run on.

  - **SqmUserId -** A random identifier for the install of Office.

  - **StudyId -** Software Quality Metrics study identifier.

  - **VerticalResolution -** Vertical screen resolution

  - **WinUserActType -** Whether the Windows user running Office is a local administrator, power user, or normal user.

### Office.System.SystemHealthMetadataApplicationAndLanguage

Metadata is required to isolate a failure reproduction.

The following fields are collected:

  - **AppBuild -** The Build version of the Office application.

  - **AppBuildRevision -** The Build Revision of the Office application.

  - **AppMajorVer -** The Major version of the Office application.

  - **AppMinorVer -** The Minor version of the Office application.

  - **AppState -** Identifier for what state the Office application is in.

  - **Click2RunPackageVersionBuild -** The Build version of the click-to-run installer package.

  - **Click2RunPackageVersionMajor -** The Major version of the click-to-run installer package.

  - **Click2RunPackageVersionMinor -** The Minor version of the click-to-run installer package.

  - **Click2RunPackageVersionRevision -** The Build Revision of the click-to-run installer package.

  - **DistributionChannel -** The channel by which Office was distributed.

  - **InstallType -** An identifier for the method by which Office was installed.

  - **IsClickToRunInstall -** Whether the Office application was installed using click-to-run

  - **IsDebug -** Whether this is a debug build of Office.

  - **IsImmersive -** Whether the Office application is a Universal Windows or Immersive application.

  - **IsMsftInternal -** Whether the Windows user running Office is a Microsoft employee.

  - **IsOEMInstalled -** Whether the running Office application was installed by an OEM.

  - **IsRunAsAdmin -** Whether the Office application is running as Administrator.

  - **IsSubscription -** Whether the Office application is installed under a subscription license.

  - **MsoAppId -** Identifier for what Office application this data refers to.

  - **OfficeArchitectureText -** What processor architecture Office is built for.

  - **OfficeBuild -** The Build version of the Office shared libraries.

  - **OfficeBuildRevision -** The Build Revision version of the Office shared libraries.

  - **OfficeMajorVer -** The Major version of the Office shared libraries.

  - **OfficeMinorVer -** The Minor version of the Office shared libraries.

  - **OfficeMuiCount -** The count of Office language packs installed.

  - **OfficeSkuLanguage -** The installed SKU language.

  - **OfficeSkuLanguageTag -** The installed SKU language.

  - **OfficeUiLang -** The User Interface language for the Office application.

  - **OfficeUiLangTag -** The User Interface language for the Office application.

  - **ProcessFileName -** The running application’s executable name.

  - **SqmAppId -** Identifier for what Office application this data refers to.

### Office.System.SystemHealthMetadataDelayedLogin

User identity information required to fulfill data subject requests.

The following fields are collected:

  - **CID** - Pseudonymized user identity

### Office.System.SystemHealthMetadataDevice

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **CollectionTime -** Time at which the metadata was collected.

  - **ComputerSystemProductUuidHash -** One-way hash of Motherboard UUID.

  - **DeviceClass -** An identifier for the type of device Office is being run on.

  - **DeviceMake -** Hardware system family identifier of the device Office is run on.

  - **DeviceManufacturer -** The manufacturer of the device Office is run on.

  - **DeviceModel -** The model of the device Office is being run on.

  - **DigitizerInfo -** Information about the digitizer attached to the device Office is run on.

  - **IsLaptop -** Whether the device Office is running on is a laptop.

  - **IsTablet -** Whether the device Office is running on is a tablet.

  - **LicensingACID -** Licensing identifier for the install of Office.

  - **MachineName -** The name of the device Office is being run on.

  - **NumProcPhysCores -** Number of physical cores in the processor.

  - **NumProcShareSingleCache -** The Number of processors sharing a single cache on the device Office is run on.

  - **NumProcShareSingleCore -** The number of processors per physical core on the device Office is run on.

  - **OlsLicenseId -** Licensing service identifier for the install of Office.

  - **Platform -** An identifier for what environment Office is run on.

  - **PowerPlatformRole -** An identifier of the OEM preferred computer role of the device Office is run on.

  - **ProcessorCount -** The count of processors on the device Office is run on.

  - **ProcSpeedMHz -** The speed of the processor on the device Office is run on in Megahertz.

  - **ProcType -** The architecture of the processor.

  - **ProcTypeText -** The type of the processor on the device Office is run on.

  - **RamMB -** The amount of RAM available in the device Office is run on.

  - **SusClientId -** The Windows Update ID of the device Office is run on.

  - **SystemFamily -** Hardware system family identifier of the device Office is run on.

  - **SystemSKU -** Hardware system SKU identifier of the device Office is run on.

  - **SysVolFreeSpaceMB -** The amount of free space available on the System volume in megabytes.

  - **SysVolSizeMB -** The amount of space on the System volume in megabytes.

  - **WindowsErrorReportingMachineId -** Windows Error Reporting assigned machine identifier of the device Office is run on.

  - **WindowsSqmMachineId -** Windows assigned machine identifier of the device Office is run on.

### Office.System.SystemHealthMetadataDeviceConsolidated

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **BootDiskType -** Disk or solid-state drive

  - **ComputerSystemProductUuidHash -** One-way hash of Motherboard UUID.

  - **DeviceClass -** An identifier for the type of device Office is being run on.

  - **DeviceManufacturer -** The manufacturer of the device Office is run on.

  - **DeviceModel -** The model of the device Office is being run on.

  - **DeviceProcessorModel -** The processor model of the device Office is run on.

  - **DigitizerInfo -** Information about the digitizer attached to the device Office is run on.

  - **HasSpectreFix -** Whether the processor of the device Office is run on has a Spectre fix.

  - **IsLaptop -** Whether the device Office is running on is a laptop.

  - **IsTablet -** Whether the device Office is running on is a tablet.

  - **MachineName -** The name of the device Office is being run on.

  - **NumProcPhysCores -** Number of physical cores in the processor.

  - **NumProcShareSingleCache -** The Number of processors sharing a single cache on the device Office is run on.

  - **NumProcShareSingleCore -** The number of processors per physical core on the device Office is run on.

  - **Platform -** An identifier for what environment Office is run on.

  - **PowerPlatformRole -** An identifier of the OEM preferred computer role of the device Office is run on.

  - **powerPlatformRole -** An identifier of the OEM preferred computer role of the device Office is run on.

  - **ProcessorCount -** The count of processors on the device Office is run on.

  - **ProcSpeedMHz -** The speed of the processor on the device Office is run on in Megahertz.

  - **ProcType -** The architecture of the processor.

  - **ProcTypeText -** The type of the processor on the device Office is run on.

  - **RamMB -** The amount of RAM available in the device Office is run on.

  - **SusClientId -** The Windows Update ID of the device Office is run on.

  - **SysVolFreeSpaceMB -** The amount of free space available on the System volume in megabytes.

  - **SysVolSizeMB -** The amount of space on the System volume in megabytes.

  - **sysVolSizeMB -** The amount of space on the System volume in megabytes.

<!-- end list -->

  - **WindowsErrorReportingMachineId** - Windows Error Reporting assigned machine identifier of the device Office is run on.

  - **WindowsSqmMachineId** - Windows assigned machine identifier of the device Office is run on.

### Office.System.SystemHealthMetadataOperatingSystem

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **CollectionTime** - The time this event was queued for upload

  - **IsTerminalServer** - True/false is terminal server client

  - **OsBuild** - The Build version of the Operating System.

  - **OsBuildRevision** - OS build revision

  - **OSEnvironment** - Windows, iOS, Mac, Android, etc etc.

  - **OsMajorVer** - The Major version of the Operating System.

  - **OsMinorVer** - The Minor version of the Operating System.

  - **OSSDKVersionCode** - Version identifier for the Operating System SDK.

  - **OsSku** - OS SKU

  - **OsSuite2** - Operating System suite identifier.

  - **OSVersionString** - Operating System version identifier.

  - **ServicePackMajorVer** - OS service pack major version

  - **ServicePackMinorVer** - OS service pack minor version

### Office.System.SystemHealthMetadataOperatingSystemDevice

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **CollectionTime -** The time this event was queued for upload

  - **DeviceClass -** An identifier for the type of device Office is being run on.

  - **DeviceManufacturer -** The manufacturer of the device Office is run on.

  - **DeviceModel -** The model of the device Office is being run on.

  - **DigitizerInfo -** Information about the digitizer attached to the device Office is run on.

  - **IsLaptop -** Whether the device Office is running on is a laptop.

  - **IsTablet -** Whether the device Office is running on is a tablet.

  - **IsTerminalServer -** True/false is terminal server client

  - **MachineName -** The name of the device Office is being run on.

  - **NumProcPhysCores -** Number of physical cores in the processor.

  - **NumProcShareSingleCache -** The Number of processors sharing a single cache on the device Office is run on.

  - **NumProcShareSingleCore -** The number of processors per physical core on the device Office is run on.

  - **OsBuild -** The Build version of the Operating System.

  - **OsBuildRevision -** OS build revision

  - **OSEnvironment -** Windows, iOS, Mac, Android, etc.

  - **OsMajorVer -** The Major version of the Operating System.

  - **OsMinorVer -** The Minor version of the Operating System.

  - **OSSDKVersionCode -** Version identifier for the Operating System SDK.

  - **OsSku -** OS SKU

  - **OsSuite2 -** Operating System suite identifier.

  - **OSVersionString -** Operating System version identifier.

  - **Platform -** An identifier for what environment Office is run on.

  - **PowerPlatformRole -** An identifier of the OEM preferred computer role of the device Office is run on.

  - **ProcessorCount -** The count of processors on the device Office is run on.

  - **ProcSpeedMHz -** The speed of the processor on the device Office is run on in Megahertz.

  - **ProcTypeText -** Processor type

  - **RamMB -** The amount of RAM available in the device Office is run on.

  - **ServicePackMajorVer -** OS service pack major version

  - **ServicePackMinorVer -** OS service pack minor version

  - **SysVolFreeSpaceMB -** The amount of free space available on the System volume in megabytes.

  - **SysVolSizeMB -** The amount of space on the System volume in megabytes.

### Office.System.SystemHealthMetadataOS

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **CountryRegion -** Country/Region identifier Operating System setting.

  - **HorizontalResolution -** Horizontal screen resolution

  - **IsTerminalServer -** True/false is terminal server client

  - **KeyboardLanguage -** Device Keyboard language identifier

  - **KeyboardLanguageTag -** Device Keyboard language identifier

  - **OfficeWvd -** Identifies what state Windows Virtual Desktop is in.

  - **OsBuild -** The Build version of the Operating System.

  - **OsBuildRevision -** OS build revision

  - **OSEnvironment -** Windows, iOS, Mac, Android, etc.

  - **OsLocale -** Operating System locale identifier.

  - **OsLocaleTag -** Operating System locale identifier.

  - **OsMajorVer -** The Major version of the Operating System.

  - **OsMinorVer -** The Minor version of the Operating System.

  - **OSSDKVersionCode -** Operating System SDK Version identifier.

  - **OsSku -** Operating System SKU identifier.

  - **OsSuite2 -** Operating System suite identifier.

  - **OsUiLang -** Operating System user interface language.

  - **OSVersionString -** Operating System version identifier.

  - **ScreenDepth -** Screen depth

  - **ScreenDpi -** Screen dpi

  - **ServicePackMajorVer -** OS service pack major version

  - **ServicePackMinorVer -** OS service pack minor version

  - **SystemLocale -** Operating System default locale

  - **SystemLocaleTag -** Operating System default locale

  - **TimeZoneBiasInMinutes -** The difference in minutes between local time and UTC.

  - **VerticalResolution -** Vertical screen resolution

### Office.System.SystemHealthMetadataScreenCultureUserSqmId

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **Alias -** Microsoft employee or automated user alias

  - **CID -** Pseudonymized user identity

  - **CollectibleClassifications -** Data classifications that can be collected according the client privacy settings

  - **CollectionTime -** The time this event was queued for upload

  - **CountryRegion -** Country/Region identifier Operating System setting.

  - **DomainName -** Domain name of Microsoft domain

  - **HorizontalResolution -** Horizontal screen resolution

  - **IntegratedScreenSize -** Size of the integrated screen.

  - **IsJoinedToDomain -** True/false is the client domain joined

  - **IsLabMachine -** Is a Microsoft testing lab machine

  - **IsMsftInternal -** True/false is the machine in Microsoft corporate domain

  - **IsSubscription -** Whether the Office application is installed under a subscription license.

  - **KeyboardLanguage -** Device Keyboard language identifier

  - **KeyboardLanguageTag -** Device Keyboard language identifier

  - **OsLocale -** Operating System locale identifier.

  - **OsLocaleTag -** Operating System locale identifier.

  - **OsUiLang -** Operating System user interface language.

  - **ScreenDepth -** Screen depth

  - **ScreenDpi -** Screen dpi

  - **ScreenXDpi -** Screen X DPI

  - **ScreenYDpi -** Screen Y DPI

  - **SqmUserId -** A random identifier for the install of Office.

  - **StudyId -** Software Quality Metrics study identifier.

  - **SystemLocale -** Operating System default locale

  - **SystemLocaleTag -** Operating System default locale

  - **TimeZoneBiasInMinutes -** The difference in minutes between local time and UTC.

  - **VerticalResolution -** Vertical screen resolution

  - **WinUserActType -** Whether the Windows user running Office is a local administrator, power user, or normal user.

### Office.System.SystemHealthOfficeLensIdentity

User identity information required to fulfill data subject requests.

The following fields are collected:

  - **CID** - Pseudonymized user identity

### Office.System.SystemHealthRollbackSessionMetadata

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **InstallMethod** - New install, update, or rollback

  - **IsSubscription** - Whether the Office application is installed under a subscription license.

  - **PreviousBuild** - Previously installed build version

### Office.System.SystemHealthSessionLifecycleAndHeartbeat

Provides information on system health metrics.

The following fields are collected:

  - **InstallMethod** - Whether the current Office install was upgraded from, rolled back to, or a fresh install.

  - **InteractionSessionID** - Session Identifier.

  - **PreviousBuild** - The version of Office this build was upgraded to or rolled back from.

  - **State** - State which the session changed to.

  - **Time** - Point at which the session state changed.

### Office.System.SystemHealthSessionStartTime

Used with crash data to separate early vs late crashes (i.e. determine if the user used the app for some period before the crash)

The following fields are collected:

  - **SessionStart** - Time at which telemetry starts processing data.

### Office.System.SystemHealthUngracefulAppExitDesktop

Used to capture crash metrics.

The following fields are collected:

  - **AffectedProcessAppBuild -** Build version identifier for the affected process.

  - **AffectedProcessAppBuildRevision -** Build revision identifier for the affected process.

  - **AffectedProcessAppMinorVer -** Minor version identifier for the affected process.

  - **AffectedProcessAppName -** The name of the affected process.

  - **AffectedProcessExeBuildVersion -** The Build Version number of the affected process.

  - **AffectedProcessExeMajorVersion -** The Major Version number of the affected process.

  - **AffectedProcessExeMinorVersion -** The Minor Version number of the affected process.

  - **AffectedProcessExeRevisionVersion -** The Build Revision Version number of the affected process.

  - **AffectedProcessIsDebug -** Whether the affected process is a debug build.

  - **AffectedProcessIsLabMachine -** Whether the affected process is in a Microsoft lab.

  - **AffectedProcessOsEnvironment -** An operating system identifier for the affected process.

  - **AppName -** The name of the affected application.

  - **CrashedAssignedFlights -** The flights assigned to the crashed process.

  - **CrashedConfigIds -** The configuration assigned to the crashed process.

  - **CrashedEcsETag -** An experiment identifier for the crashed process.

  - **CrashedImpressionId -** The impression identifier of the crashed process.

  - **CrashedProcessSessionID -** A unique identifier of the crashed process.

  - **CrashedProcessSessionInitTime -** The time when the affected process started.

  - **CrashType -** Bucketing identifier for the type of crash.

  - **DetectionTime -** The time when the unexpected exit was detected.

  - **ErrorString -** Error description.

  - **ExceptionAddress -** Address in the program where the failure occurred.

  - **ExceptionCode -** Bucketing identifier for the exception.

  - **FaultAppName -** The name of the faulting app.

  - **InstallMethod -** Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

  - **InstallType -** An identifier for the method by which Office was installed.

  - **InstallTypeName -** An identifier for the method by which Office was installed.

  - **IsLabMachine -** Whether Office is being run in a Microsoft lab.

  - **IsMsftInternal -** Whether the Windows user running Office is a Microsoft employee.

  - **ModuleBaseAddress -** Base Address of the failing module.

  - **ModuleBuildVersion -** Failing module build version number.

  - **ModuleMajorVersion -** Failing module major version number.

  - **ModuleMinorVersion -** Failing module minor version number.

  - **ModuleName -** Failing module name.

  - **ModuleOffset -** Offset in bytes from the base address where the failure occurred.

  - **ModuleRevisionVersion -** Failing module build revision version number.

  - **ModuleSize -** Failing module size in bytes.

  - **OSEnvironment -** Identifier for what environment Office is running on.

  - **PreviousBuild -** Previously installed build version

  - **UAETypeName -** Bucketing identifier for how the app exited ungracefully.

  - **VerifyElseCrashTag -** Unique identifier for where the app crashed.

### Office.System.SystemHealthUngracefulAppExitImmersive

Used to capture crash metrics.

The following fields are collected:

  - **AffectedProcessAppBuild -** Build version identifier for the affected process.

  - **AffectedProcessAppBuildRevision -** Build revision identifier for the affected process.

  - **AffectedProcessAppMajorVer -** Major version identifier for the affected process.

  - **AffectedProcessAppMinorVer -** Minor version identifier for the affected process.

  - **AffectedProcessAppName -** The name of the affected process.

  - **AffectedProcessExeBuildVersion -** The Build Version number of the affected process.

  - **AffectedProcessExeMajorVersion -** The Major Version number of the affected process.

  - **AffectedProcessExeMinorVersion -** The Minor Version number of the affected process.

  - **AffectedProcessExeRevisionVersion -** The Build Revision Version number of the affected process.

  - **AffectedProcessIsDebug -** Whether the affected process is a debug build.

  - **AffectedProcessIsLabMachine -** Whether the affected process is in a Microsoft lab.

  - **AffectedProcessOsEnvironment -** An operating system identifier for the affected process.

  - **AppName -** The name of the affected application.

  - **CrashedAssignedFlights -** The flights assigned to the crashed process.

  - **CrashedConfigIds -** The configuration assigned to the crashed process.

  - **CrashedImpressionId -** The impression identifier of the crashed process.

  - **CrashedInteractionSessionID -** The interaction session identifier for the affected process.

  - **CrashedInteractionSessionTime -** The time when the affected process could be interacted with.

  - **CrashedProcessSessionID -** A unique identifier of the crashed process.

  - **CrashedProcessSessionInitTime -** The time when the affected process started.

  - **DetectionTime -** The time when the unexpected exit was detected.

  - **IsLabMachine -** Whether Office is being run in a Microsoft lab.

  - **IsMsftInternal -** Whether the Windows user running Office is a Microsoft employee.

  - **OSEnvironment -** Identifier for what environment Office is running on.

  - **PreviousLifecycleState -** The state of the affected process when it crashed.

  - **UAETypeName -** Bucketing identifier for how the app exited ungracefully.

### Office.System.SystemHealthUngracefulApplicationExitWin32

Used to capture crash metrics.

The following fields are collected:

  - **CrashedAppBuild -** Build version identifier for the affected process.

  - **CrashedAppMajor -** Major version identifier for the affected process.

  - **CrashedAppMinor -** Minor version identifier for the affected process.

  - **CrashedAppRevision -** Build version identifier for the affected process.

  - **CrashedConfigIds -** The configuration assigned to the crashed process.

  - **CrashedEcsETag -** An experiment identifier for the crashed process.

  - **CrashedImpressionId -** The impression identifier of the crashed process.

  - **CrashedModuleName -** Failing module name.

  - **CrashedSessionId -** A unique identifier of the crashed process.

  - **CrashedSessionInitTime -** The time when the affected process started.

  - **CrashType -** Bucketing identifier for the type of crash.

  - **DetectionTime -** The time when the unexpected exit was detected.

  - **ExceptionAddress -** Address in the program where the failure occurred.

  - **ExceptionCode -** Bucketing identifier for the exception.

  - **HexExceptionAddress -** Address in hexadecimal in the program where the failure occurred.

  - **HexExceptionCode -** Bucketing identifier in hexadecimal for the exception.

  - **HexModuleBaseAddress -** Base Address in hexadecimal of the failing module.

  - **HexModuleOffset -** Offset in bytes (in hexadecimal) from the base address where the failure occurred.

  - **HexModuleSize -** Failing module size in bytes in hexadecimal.

  - **HexVerifyElseCrashTag -** Unique identifier in hexadecimal for where the app crashed.

  - **InstallMethod -** Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

  - **IsLabMachine -** Whether Office is being run in a Microsoft lab.

  - **ModuleBaseAddress -** Base Address of the failing module.

  - **ModuleOffset -** Offset in bytes from the base address where the failure occurred.

  - **ModuleSize -** Failing module size in bytes.

  - **PreviousBuild -** Previously installed build version

  - **UAEOSEnvironment -** Operating System environment identifier.

  - **VerifyElseCrashTag -** Unique identifier for where the app crashed.

### Office.System.UngracefulApplicationExit.DesktopAppExit

Used to capture crash metrics.

The following fields are collected:

  - **AppBuildVersion -** Build version identifier for the affected process.

  - **AppMajorVersion -** Major Version number of the affected process.

  - **AppMinorVersion -** Minor version identifier for the affected process.

  - **AppName -** The name of the affected application.

  - **AppRevisionVersion -** Build revision identifier for the affected process.

  - **CrashedAssignedFlights -** The flights assigned to the crashed process.

  - **CrashedConfigIds -** The configuration assigned to the crashed process.

  - **CrashedImpressionId -** The impression identifier of the crashed process.

  - **CrashedInteractionSessionId -** The interaction session identifier of the crashed process.

  - **CrashedProcessSessionId -** A unique identifier of the crashed process.

  - **CrashType -** Bucketing identifier for the type of crash.

  - **ErrorString -** Error description.

  - **ExceptionAddress -** Address in the program where the failure occurred.

  - **ExceptionCode -** Bucketing identifier for the exception.

  - **FaultAppName -** The name of the faulting app.

  - **InstallMethod -** Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

  - **InstallType -** An identifier for the method by which Office was installed.

  - **IsDebug -** Whether this is a debug build of Office.

  - **IsHandledCrash -** Whether the crash handler was invoked in the crashing session.

  - **IsLabMachine -** Whether Office is being run in a Microsoft lab.

  - **ModuleBaseAddress -** Base Address of the failing module.

  - **ModuleName -** Failing module name.

  - **ModuleOffset -** Offset in bytes from the base address where the failure occurred.

  - **ModuleSize -** Failing module size in bytes.

  - **OSEnvironment -** Identifier for what environment Office is running on.

  - **PreviousBuild -** Previously installed build version

  - **PreviousInteractionSessionTime -** Time which the previous interaction session started.

  - **PreviousLifecycleState -** Previous session lifecycle state identifier.

  - **PreviousSessionInitTime -** Time when the previous session started.

  - **StackHash -** An identifier indicating where in code that the affected process crashed.

  - **VerifyElseCrashTag -** Unique identifier for where the app crashed.

### Office.System.UserChangedDiagnosticLevel

Information required to insure user privacy policy choices are being enforced.

The following fields are collected:

  - **DiagnosticLevelChanged**: Indicates that the user changed their diagnostic level.

  - **NewDiagnosticLevel**: The level after the user change.

  - **OldDiagnosticLevel**: The level the user was using prior to their change.

### Office.Telemetry.AriaEventSink.HandleMsaDeviceTokenResponse

Signal of an outage in Microsoft Account service.

The following fields are collected:

  - **RetryCount** - Number of reties connecting to the MSA service.

### Office.Telemetry.AriaEventSink.RequestMsaDeviceToken

Signal of an outage in Microsoft Account service.

The following fields are collected:

  - **RetryCount** - Number of reties connecting to the Microsoft account service.

### Office.Telemetry.ClientSamplingOverridden

Required to get reproduction rates right. Normally doesn't apply to Production audience group.

The following fields are collected:

  - **OverriddenMeasureEnabled** - Is the client set to send more than unsampled events

  - **OverriddenNumberlinePosition** - The new number line position for sampling

  - **OverriddenReportedSampleRate** - The new reported sample rate

  - **OverriddenSampleRate** - The new sample rate

  - **PreviousNumberlinePosition** - The sampling position on the number line.

  - **PreviousSampleRate** - The sample rate prior to being overridden.

  - **WasMeasureEnabled** - Was the client set to send more than unsampled events

### Office.Telemetry.Compliance.EventNotInBasicAllowList

Reports invalid telemetry implementations or deployments

The following fields are collected:

  - **EventName** - The name of the event that is not in the list

### Office.Telemetry.Compliance.MissingDataCategory​

Reports invalid telemetry implementations or deployments

The following fields are collected:

  - **EventName** - Event name that is missing a category

  - **IsFromRule** - Whether the event came from a telemetry rule

### Office.Telemetry.Compliance.MissingDataCategoryInRule​

Reports invalid telemetry implementations or deployments

The following fields are collected:

  - **RuleId** - The rule ID that is missing a data category

  - **RuleVersion** - The rule version that is missing a data category

### Office.Telemetry.DiagnosticDataViewerStateChanged

Validates that consumers can view the data as it leaves their machine using the Diagnostic Data Viewer.

The following fields are collected:

  - **DialogCancelled** - Was the diagnostic data viewer dialog cancelled

  - **NewState** - New diagnostic data viewer state

  - **WasDialogUsed** - Was the diagnostic data viewer dialog used

### Office.Telemetry.DynamicConfig.FetchConfigs

Data needed to measure health of Telemetry Config Service.

The following fields are collected:

  - **ParsedConfigCount** - Number of parsed dynamic configs

  - **ParsedConfigs** - Number of parsed dynamic configs

  - **RejectedConfigCount** - Number of rejected configs

  - **RejectedConfigs** - Number of rejected configs

  - **RejectedConfigsList** - Comma separated list of rejected configs.

### Office.Telemetry.DynamicConfig.ParseJsonConfig

Data needed to measure the health of Telemetry Config Service

The following fields are collected:

  - **ErrorMessage** - Parsing error message

  - **NodeName** - Node which failed to parse

### Office.Telemetry.DynamicConfig.PopulateTreeCalledAgain

Data needed to measure health of Telemetry Config Service.

This event collects no fields.

### Office.Telemetry.EventQuarantined

Used to verify other NSD events are working properly.

The following fields are collected:

  - **EventName** - Quarantined event name

  - **Reason** - Reason for quarantine

### Office.Telemetry.FlushEventBuffer 

Reports event buffer size and can indicate telemetry failures related to large buffer use.

The following fields are collected:

  - **EventCount** - Count of events in the buffer

  - **FirstPassCount** - First pass count of events

  - **SecondPassCount** - Second pass count of events

### Office.Telemetry.GetFilteredPayloadsFromDisk

Verifies certain parts of legacy telemetry pipeline are working on platforms that still use it.

This event collects no fields.

### Office.Telemetry.InvalidDataContractName​

Reports invalid telemetry implementations or deployments

The following fields are collected:

  - **DataContractName** - Name of the telemetry data contract

  - **EventName** - Name of the event with the invalid data contract

  - **IsRuleEvent** - True/false was this event implemented by a telemetry rule

### Office.Telemetry.InvalidDataFieldName ​

Reports invalid telemetry implementations or deployments

The following fields are collected:

  - **DataFieldName** - Name of the telemetry data field

  - **EventName** - Name of the event with the invalid field

  - **IsRuleEvent** - True/false was this event implemented by a telemetry rule.

### Office.Telemetry.InvalidEventContractName 

Reports invalid telemetry implementations or deployments

The following fields are collected:

  - **EventContractName** - The invalid telemetry contract name

  - **EventName** - Name of the event with the invalid contract name

  - **IsRuleEvent** - True/false was this event implemented by a telemetry rule

### Office.Telemetry.LoadXmlRules​

Reports whether parsing telemetry rules succeeded

The following fields are collected:

  - **DetachedDuration** - Detached duration in microseconds

### Office.Telemetry.MissingFieldDetails​

Reports missing field information to diagnose typos in telemetry configuration.

The following fields are collected:

  - **ErrorRuleId** - The telemetry rule ID that requested the missing field

  - **ErrorRuleVersion** - The telemetry rule version that requested the missing field

  - **EtwEventGuid** - The ETW GUID of the requested field

  - **EtwEventId** - The ETW event ID of the requested field

  - **MissingFieldName** - The requested field name

  - **UlsTagId** - The code tag of the missing field

### Office.Telemetry.ProcessIdleQueueJob

Reports that telemetry idle processing started as expected.

The following fields are collected:

  - **DetachedDuration** - Detached duration in microseconds

  - **FailureDiagnostic** - The failed operation

### Office.Telemetry.RedstoneInboxSampling

Sampling state of the client required to accurately interpret other metrics.

The following fields are collected:

  - **MeasuresEnabled** - Are measures enabled in this session?

  - **SamplingClientIdValue** - Sampling value for this client

  - **SamplingKey** - Sampling key for this client

  - **SamplingMethod** - Sampling method for this client

### Office.Telemetry.RedstoneInboxSamplingCritical

Sampling state of the client can be required to accurately interpret other metrics.

The following fields are collected:

  - **MeasuresEnabled** - Are measures enabled in this session?

  - **SamplingClientIdValue** - Sampling value for this client

  - **SamplingKey** - Sampling key for this client

  - **SamplingMethod** - Sampling method for this client

### Office.Telemetry.RuleErrorsAggregated

Telemetry health error reporting. Required to validate other data (including NSD).

The following fields are collected:

  - **ErrorCount** - Count of this error within the aggregation time window

  - **ErrorInfo** - Error diagnostic info number

  - **ErrorRuleId** - Telemetry rule ID that caused the error

  - **ErrorRuleVersion** - Telemetry rule version that caused the error

  - **WarningInfo** - Warning diagnostic info number

<!-- end list -->

  - **QueueFlushCount** - Number of queue flushes

  - **QueueFlushDueToSizeLimit** - Size at which telemetry flushes the queue

  - **QueueFlushesDueToSize** - Count of queue flushes caused by buffer size

  - **QueueHardLimit** - Telemetry shutdown limit

  - **QueueLimitHitTime** - When the shutdown limit was reached

  - **ResultTime** - Time of this event

### Office.Telemetry.RulesEngineDiskThrottled

Throttling DQ metrics. Required for confidence in all other data.

The following fields are collected:

  - **DiskWriteLimit** - Disk size limit for telemetry data

  - **DiskWriteTotal** - Disk write total for telemetry data

  - **SessionDiskWriteTotal** - Session disk write total for telemetry data

  - **ThrottlingTimestamp** - Time the session was throttled

### Office.Telemetry.RulesEngineMediumCostThrottled

Throttling DQ metrics. Required for confidence in all other data.

This event collects no fields.

### Office.Telemetry.RulesEngineSpikeThrottled

Throttling DQ metrics. Required for confidence in all other data.

The following fields are collected:

  - **CurrentLimit** - Current spike limit

  - **Duration** - Spike duration

  - **Factor** - Spike factor

  - **HighestImpactingRuleBytes** - The most bytes recorded by a telemetry rule

  - **HighestImpactingRuleId** - The rule ID that recorded the most bytes

  - **HighestImpactingRuleVersion** - The rule version that recorded the most bytes

  - **MaxLimit** - The maximum limit

  - **ThrottlingTimestamp** - When telemetry was throttled

### Office.Telemetry.RulesEngineThrottled

Throttling DQ metrics. Required for confidence in all other data.

The following fields are collected:

  - **ThrottlingTimestamp** - When telemetry was throttled

### Office.Telemetry.RulesEngineUlsQueueSizeBackgroundProcessingLevelReached​

Reports that there are too many events in the queue to process during app idle time.

The following fields are collected:

  - **BackgroundProcessingLevelInBytes** - The queue size to start processing in the background.

  - **CurrentQueueSize** - The number of events in the nULS queue.

  - **CurrentQueueSizeInBytes** - The size of the nULS queue in bytes.

  - **ReachedTimestamp** - The time when background processing began.

### Office.Telemetry.RulesResultUploadLatencyRule​

The Average, Min and Max upload Latency of rule results payload upload every hour

The following fields are collected:

  - **AverageLatency** - The average upload latency.

  - **CollectionTime** - The time when data on rule upload was collected.

  - **LatencyGE201LE400** - The number of uploads with a latency greater than or equal to 201ms and less than or equal to 400ms

  - **LatencyGE3001** - The number of uploads with a latency greater than or equal to 3001ms.

  - **LatencyGE401LE600** - The number of uploads with a latency greater than or equal to 401ms and less than or equal to 600ms.

  - **LatencyGE601LE800** - The number of uploads with a latency greater than or equal to 601ms and less than or equal to 800ms.

  - **LatencyLE200** - The number of uploads with a latency less than 200 milliseconds.

  - **MaxLatency** - The highest latency observed.

  - **MinLatency** - The lowest latency observed.

### Office.Telemetry.SamplingPolicy

Sampling state of the client required to accurately interpret other metrics.

The following fields are collected:

  - **MeasuresEnabled** - Are measures enabled in this session?

  - **SamplingClientIdValue** - Sampling value for this client

  - **SamplingKey** - Sampling key for this client

  - **SamplingMethod** - Sampling method for this client

### Office.Telemetry.SamplingPolicyEventTrigger

Sampling state of the client required to accurately interpret other metrics.

The following fields are collected:

  - **MeasuresEnabled** - Are measures enabled in this session?

  - **SamplingKey** - Sampling key for this client

  - **SamplingMethod** - Sampling method for this client

### Office.Telemetry.SessionTelemetryRulesChanged​

Reports that the set of telemetry rules has changed

The following fields are collected:

  - **ChangedRuleId** - The telemetry rule ID that changed in the current update

  - **ChangedRuleVersion** - The telemetry rule version that changed in the current update

  - **OperationType** - Add or remove operation tag

### Office.Telemetry.SessionTelemetryRulesCount​

Reports the count of loaded telemetry rules

The following fields are collected:

  - **CountOfLoadedRules** - How many telemetry rules are loaded

  - **HadRuleFileAtBoot** - Whether there was a telemetry rules file at app boot

### Office.Telemetry.SessionTelemetryRulesInitialState​

Reports the telemetry rules that were loaded at session start

The following fields are collected:

  - **HadRuleFileAtBoot** - Whether there was a telemetry rules file at app boot

  - **LoadedRulesCount** - How many telemetry rules are loaded

  - **LoadedRulesList** - List of loaded telemetry rules

### Office.Telemetry.SystemHealthMetadataNetworkCost

Network cost indicates our ability to get data or not.

The following fields are collected:

  - **NetworkCost** - New network metered or unmetered cost

  - **OldNetworkCost** - Previous network metered or unmetered cost

  - **Tag** - Source code tag that detected the change

### Office.Telemetry.SystemHealthMetadataNetworkCostChange

Network cost indicates our ability to get data or not.

The following fields are collected:

  - **NewNetworkCost** - New network metered or unmetered cost

  - **OldNetworkCost** - Previous network metered or unmetered cost

  - **Tag** - Source code tag that detected the change

### Office.Telemetry.TelemetryActivityAggregationWindowStatistics​

Reports the number of aggregated activity groups and instances in each activity being uploaded.

The following fields are collected:

  - **GroupCount** - The number of aggregated activities sending data.

  - **InstancesToSend** - The number of instances of aggregated Activities sending data.

### Office.Telemetry.TelemetryUlsQueueUsage

Telemetry health error reporting. Required to validate other data (including NSD).

The following fields are collected:

  - **AverageEventCount** - Average event count in the queue

  - **AverageQueueCB** - Average memory size of the queue

  - **PeakEventCount** - Peak event count of the queue

  - **PeakQueueCB** - Peak memory size of the queue

  - **QueueDisableRuleLimit** - Limit at which telemetry rules get disabled

### Office.Telemetry.UlsQueueTopThrottlingTags​

Reports the top tags that contributed to ULS queue being shut down.

The following fields are collected:

  - **Tag0 -** Tag which consumed the most queue

  - **Tag0Percent -** Percentage of queue used by tag0

  - **Tag1 -** Tag which consumed the 2nd highest amount of queue

  - **Tag10 -** Tag which consumed the 11th highest amount of queue

  - **Tag10Percent -** Percentage of queue used by tag10

  - **Tag11 -** Tag which consumed the 12th highest amount of queue

  - **Tag11Percent -** Percentage of queue used by tag11

  - **Tag12 -** Tag which consumed the 13th highest amount of queue

  - **Tag12Percent -** Percentage of queue used by tag12

  - **Tag13 -** Tag which consumed the 14th highest amount of queue

  - **Tag13Percent -** Percentage of queue used by tag13

  - **Tag14 -** Tag which consumed the 15th highest amount of queue

  - **Tag14Percent -** Percentage of queue used by tag14

  - **Tag1Percent -** Percentage of queue used by tag1

  - **Tag2 -** Tag which consumed the third highest amount of queue

  - **Tag2Percent -** Percentage of queue used by tag2

  - **Tag3 -** Tag which consumed the fourth highest amount of queue

  - **Tag3Percent -** Percentage of queue used by tag3

  - **Tag4 -** Tag which consumed the fifth highest amount of queue

  - **Tag4Percent -** Percentage of queue used by tag4

  - **Tag5 -** Tag which consumed the sixth highest amount of queue

  - **Tag5Percent -** Percentage of queue used by tag5

  - **Tag6 -** Tag which consumed the seventh highest amount of queue

  - **Tag6Percent -** Percentage of queue used by tag6

  - **Tag7 -** Tag which consumed the eighth highest amount of queue

  - **Tag7Percent -** Percentage of queue used by tag7

  - **Tag8 -** Tag which consumed the ninth highest amount of queue

  - **Tag8Percent -** Percentage of queue used by tag8

  - **Tag9 -** Tag which consumed the tenth highest amount of queue

  - **Tag9Percent -** Percentage of queue used by tag9

### Office.Telemetry.VolumeTrackingData​

Event volume tracking metrics for telemetry events

The following fields are collected:

  - **EventThreshold** - The maximum number of instances of a single event that can be sent in a window of time.

  - **HighestEventCount** - The highest number of instances of a single event sent this window.

  - **HighestEventName** - The name of the event with the highest number of instances in this window.

  - **TimeWindowInSeconds** - The duration of the window in seconds.

  - **TotalEvents** - The total number of events sent during the window.

  - **UniqueEvents** - The number of unique events sent during a window.

### Office.Telemetry.WritePayloadsToDisk

Verifies certain parts of legacy pipeline are working on platforms that still use it.

The following fields are collected:

  - **DetachedDuration** - Detached duration in microseconds
