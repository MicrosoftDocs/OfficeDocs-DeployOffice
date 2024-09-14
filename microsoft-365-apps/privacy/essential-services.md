---
title: "Essential services for Office"
description: "Provides Office admins with information about essential services in Office, such as Click-to-Run and Licensing, and provides a list of events and data fields for those essential services."
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.topic: reference
ms.service: o365-proplus-itpro
ms.localizationpriority: high
ms.collection: privacy-microsoft365
hideEdit: true
ms.date: 09/16/2024
---

# Essential services for Office

> [!NOTE]
> For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

Office consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. While you can control many of the connected experiences that are available to you, or to your users if you're the admin in your organization, there are a set of services that are essential to how Office functions and therefore can't be disabled. For example, the licensing service that confirms that you're properly licensed to use Office. Required service data about these services is collected and sent to Microsoft, regardless of any other privacy-related policy settings that you have configured.

For more information, see the following articles:

- [Required service data for Office](required-service-data.md)
- [Connected experiences in Office](connected-experiences.md)

If you're the admin for your organization, you might also be interested in the following articles:

- [Overview of privacy controls for Microsoft 365 Apps for enterprise](overview-privacy-controls.md)
- [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)
- [Use policy settings to manage privacy controls for Office for the web applications](office-web-privacy-controls.md)

## List of essential services for Office 

The following table provides a list of the essential services for Office and a description of each service.

| **Service**  | **Description**  |
| ------ | ---- |
| [Authentication](#authentication-events) | Authentication is a cross-platform service that validates your Office user identity. It's required to enable you to sign in to Office, activate your Office license, access your files stored in the cloud, and provides a consistent experience across Office sessions and your devices.    |
| [Click-to-Run](#click-to-run-events) | Click-to-Run is the installation technology used to install and update Office on Windows. It checks for new versions of Office, and when a new version is available, downloads and installs it. Click-to-Run will detect the need for, perform the download of, and install Office updates, including security updates.     |
|[Consent Service](#consent-service-events)|The Consent Service provides a consistent and comprehensive experience for managing user privacy settings associated with their accounts. The service is used to determine which privacy notifications need to be shown to the user when an application launches. It also tracks the responses the user has given to any prior privacy notifications. |
| [Enhanced Configuration Service (ECS)](#enhanced-configuration-service-ecs-events) | ECS provides Microsoft the ability to reconfigure Office installations without the need for you to redeploy Office. It's used to control the gradual rollout of features or updates, while the impact of the rollout is monitored from diagnostic data being collected. It's also used to mitigate security or performance issues with a feature or update. In addition, ECS supports configuration changes related to diagnostic data to help ensure that the appropriate events are being collected. |
| [Licensing](#licensing-events)     | Licensing is a cloud-based service that supports your Office activation for new installations and maintains the license on your devices after Office has been activated. It registers each of your devices and activates Office, checks the status of your Office subscription, and manages your product keys.    |
|[Microsoft AutoUpdate (MAU)](#microsoft-autoupdate-mau-events)|Microsoft AutoUpdate (MAU) is the technology used to update Microsoft applications produced for macOS, such as Office. MAU will detect the need for, perform the download of, and install application updates, including security updates.|
|[OneNote sync](#onenote-sync-events)|OneNote for Mac only supports notebooks stored on the internet in OneDrive or SharePoint Online. OneNote for Mac continually syncs all of the user's notes with OneDrive or SharePoint Online. This lets users open, view, and edit their notebooks on all their devices so their notebooks are always up to date.
 [Services Configuration](#services-configuration-events)  | Services Configuration provides the ability to make updates to Office configuration settings to enable or disable client features. It's called every time an Office application is started and provides details about other Office configurations and services. Services Configuration also controls which services are designated as essential services.  |
| [Telemetry ](#telemetry-events)  | The Telemetry service is used to collect diagnostic data from Office applications. It enables the collection of the diagnostic data generated by Office, both required and optional diagnostic data. It's also responsible for the collection of some required service data for Office.  |

## Events and data fields for essential services for Office

The next sections provide the following information:

- A list of events for each essential service
- A description of each event
- A list of data fields in each event
- A description of each data field


## Authentication events

These diagnostic data events are collected when Office attempts to acquire an authentication token, either silently or through prompting.

### Office.Android.MSAGuestToAAD

This event helps in understanding how many users are getting prompted for providing personal account password, while accessing work resource, as their personal account could be a valid guest to work account's tenant.

This data helps us understand how many users are going through the pain of sign in re-prompts to prioritize Microsoft Entra token acquisition silently based on a Microsoft account SAML (Security Assertion Markup Language) assertion.

The following fields are collected:

- **Tag** - Indicates that user got sign-in prompt for personal account, while accessing work account resource.


### Office.Identity.FbaPromptWin32

Collected when Office shows the user a Forms-Based-Auth sign-in prompt.

Along with silent token acquisitions, authentication prompts are used to determine if user is in a broken authentication state which, for the user, results in what is essentially an Offline Client state, or in the worst case, broken authentication may prevent license acquisition and result in a completely unusable client.

Forms-Based-Auth (FBA) sign-in prompts are used for some on-premises authentication scenarios and typically we want to make sure this isn't happening, as everyone should be using Modern-Auth because of security vulnerabilities associated with FBA.

The following fields are collected:

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

Knowing the user is signed out makes it possible to classify other events, such as prompts, as expected, so those events can be correctly computed in reliability / ship-readiness metrics and avoid alerting or rolling back builds on the faulty premise that the user is experiencing unexpected sign-in prompts.

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

Windows SSPI prompts are used for authenticating with Exchange (for mail synchronizing) when the user's Exchange resource hasn't been set up for multi-factor authentication.

These events, along with the Office.MATS namespace events, are used for the following purposes:

1\) Identify whether clients can successfully obtain an authentication token or have entered a broken authentication state.

2\) Evaluate whether changes that have occurred on the client or services have resulted in critical regressions in the user's authentication experience and reliability

3\) When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

4\) These signals power various ship readiness and health monitors, which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical user-blocking failures

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

4\) These signals power various ship readiness and health monitors, which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical user-blocking failures.

The following fields are collected:

  - **AdalWAMUsed** – the tag that indicates result if ADAL-atop-WAM is used

  - **CallTag** – the tag that indicates the caller of sign in UI

  - **Context** - the sign in context for the prompt

  - **EndTagIdentityProviderRequested** - the tag where the identity provider is requested

  - **HrdShownTag** - the tag where the HRD sign in dialog is shown

  - **IdentityProviderResulted** - the identity provider type it's requesting

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

4\) These signals power various ship readiness and health monitors, which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical failures.

The following fields are collected:

  - **Actiontype** - Which authentication library is used

  - **Appaudience** - Is the app build for internal or external use

  - **Appforcedprompt** - Did the app override cache and force a prompt to be shown

  - **Appname** - Name of the application doing authentication

  - **Appver** - Version of the application doing authentication

  - **Askedforcreds** - Did the application ask the user to enter credentials for this action

  - **Authoutcome** - Did the authentication attempt succeed, fail, or was canceled

  - **Blockingprompt** - Did the application throw a prompt requiring user interaction

  - **Correlationid** - GUID used for joining with services data

  - **Count** - Count of events in cases of aggregation

  - **Data\_accounttype** - Consumer or organizational account

  - **Devicenetworkstate** - Was the user online

  - **Deviceprofiletelemetryid** - Anonymous device ID used to measure device experience

  - **Duration** - How long the authentication took

  - **Duration_Max** - If this signal is aggregated, the maximum duration of any aggregated event.

  - **Duration_Min** - If this signal is aggregated, the minimum duration of any aggregated event.

  - **Duration_Sum** - If this signal is aggregated, the sum of the durations of all the aggregated events.

  - **Endtime** - When the authentication event ended

  - **Error** - Error code if the authentication failed

  - **Errordescription** - Brief description of the error

  - **Errorsource** - Did the error come from service, authentication library, or application

  - **Identityservice** - Was Microsoft Service Account (MSA) or Microsoft Entra service invoked

  - **Interactiveauthcontainer** - What type of prompt was shown

  - **Issilent** - Was a prompt shown

  - **Microsoft**\_**ADAL**\_**adal**\_**version** - Version of the Azure Active Directory Authentication Library (ADAL)

  - **Microsoft\_ADAL\_api\_error\_code** - Error code emitted by authentication library for this authentication attempt

  - **Microsoft\_ADAL\_api\_id** - API invoked for this authentication attempt

  - **Microsoft\_ADAL\_authority** – Microsoft Entra authority URL responsible for authenticating the user

  - **Microsoft\_ADAL\_authority\_type** – Consumer / Microsoft Service Agreement (MSA) vs organizational / Microsoft Entra ID; currently always Microsoft Entra ID

  - **Microsoft\_ADAL\_authority\_validation\_status** – Tells whether authentication completed on the service-side

  - **Microsoft\_ADAL\_broker\_app** - Tells whether ADAL used a broker for authentication

  - **Microsoft\_ADAL\_broker\_app\_used** – Tells the name of the broker (for example, Windows Account Management)

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

  - **Microsoft\_ADAL\_client\_id** - Hashed Microsoft Entra app ID

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

  - **Microsoft\_ADAL\_user\_cancel** - True / false if the user interface window was canceled.

  - **Microsoft_ADAL_was_request_throttled** – True / false indicating if this event was throttled by ADAL due to too many requests.
 
  - **Microsoft\_ADAL\_x\_ms\_request\_id** – Additional request ID provided in HTTP header to service by ADAL.

  - **Platform** - Win32/WinRT/Android/iOS/Mac

  - **Promptreasoncorrelationid** – For prompts, this is the correlation id of another event which explains why the user might be seeing an authentication prompt.

  - **Resource** – The resource that the user is requesting a token for, such as Exchange or SharePoint.

  - **Scenarioid** – GUID. Multiple events may belong to a single scenario, for example, the scenario may be adding a new account but there are multiple prompts that occur as part of that scenario. This ID enables correlation to happen.

  - **Scenarioname** – The name of the scenario that this authentication event belongs to.

  - **Sessionid** - GUID identifying the boot session

  - **Skdver** - Version of MATS client SDK used to produce this data

  - **Starttime** - Time at which the Start\*Action MATS API was called

  - **Tenantid** - GUID identifying the tenant the authenticated user belongs to (in non-ADAL cases).

  - **Uploadid** - Unique GUID for this event, used for de-duping

  - **Wamapi** - Identifies which WAM API is called

  - **Wamtelemetrybatch** - Currently unused. In the future, allows the WAM component to dispatch additional information regarding the authentication event.


### Office.MATS.OneAuth.ActionMicrosoftOfficeAndroid

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. When acquisition attempts fail, error information is included. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an authentication token from the service, or have entered a broken authentication state.

- Evaluate when changes occur on the client or services, whether they result in critical regressions in the user's authentication experience and reliability

- When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

- These signals power various ship readiness and health monitors which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical failures.

The following fields are collected:

- **ActionEndTime** - When the authentication event ended

- **actionname** - Friendly name for this event if one was provided.

- **ActionStartTime** - Time at which the authentication event began.

- **actiontype** - Specifies the type of authentication library in use.

- **appaudience** - Is the app build for internal or external use

- **appname** - Name of the application doing authentication

- **appver** - Version of the application doing authentication

- **askedforcreds** - Did the application ask the user to enter credentials for this action

- **authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

- **blockingprompt** - Did the application throw a prompt requiring user interaction

- **correlationid** - Identifier used to join information regarding this individual event with services data

- **count** - The total number of aggregated actions reported in this one data event.

- **data_signing_time** - Records the time taken for signing data using the key

- **devicenetworkstate** - Is the device connected to the internet.

- **deviceprofiletelemetryid** - Anonymous device ID used to measure device-wide authentication experience and reliability.

- **duration_max** - Max duration of any one of the aggregated events

- **duration_min** - Min duration of any one of the aggregated events

- **duration_sum** - Sum of the duration of all the aggregated events

- **error** - Error code if the authentication failed

- **errordescription** - Brief description of the error

- **errorsource** - Did the error come from service, authentication library, or application

- **eventtype** - Is this event reporting an authentication datapoint, or a data quality error event. Used to measure data quality.

- **hasadaltelemetry** - Indicates whether the Azure Active Directory Authentication Library (ADAL) provided telemetry for this event.

- **identityservice** - Was Microsoft Service Account (MSA) or Microsoft Entra service invoked

- **interactiveauthcontainer** - What type of prompt was shown

- **issilent** - Was a prompt shown or was this a silent (background) authentication event.

- **key_creation_time** - Records the time taken for asymmetric key pair creation

- **key_load_time** - Records the time taken for loading an existing key pair

- **MSAL_access_token_expiry_time** - Access token expiry time in UTC returning to the application.

- **MSAL_all_error_tags** - All error tags the Microsoft Authentication Library (MSAL) encountered during the authentication flow.

- **MSAL_api_error_code** - If MSAL encounters an error bubbled up from the OS, platform error codes are stored here.

- **MSAL_api_error_context** - String containing additional human readable details about the last error MSAL encountered.

- **MSAL_api_error_tag** - Unique string for the place in code where this error occurred.

- **MSAL_api_name** - Name of the MSAL top level API called to start this authentication flow.

- **MSAL_api_status_code** - Status code MSAL returned for this authentication flow result.

- **MSAL_async_events_started** - If this action started/kicked off additional sub-actions to be completed asynchronously, this field will be added to the telemetry batch, with a count of the events started ("1", "2", "3" …)

- **MSAL_auth_flow** - Steps MSAL attempted during this authentication flow (AT, PRT, LRT, FRT, ART, IRT). Separated by the pipe | symbol for easy parsing.

- **MSAL_auth_flow_last_error** - Error code we received from the server on the 2nd to last item in AuthFlow. (Ex: if AuthFlow = PRT|LRT, PRT's error would be in AuthFlowLastError).

- **MSAL_authority_type** - Was this request for a user in: Microsoft Entra ID, Federated, or MSA.

- **MSAL_authorization_error_subcode** - If we received a sub error code from the authorization/UI call, it's put here. (Ex: "bad_token")

- **MSAL_authorization_type** - Means of acquiring an access token supported by MSAL used for this flow (Ex: ImportedRefreshToken, CachedRefreshToken)

- **MSAL_broker_accounts_count** - Number of accounts the system broker returns during an account discovery call. (Ex: 1, 0, 1337)

- **MSAL_broker_app_used** - Was a broker app used in this auth flow.

- **MSAL_broker_version** - Version of the iOS/Android authentication brokers.

- **MSAL_browser_navigation_count** - Indicates the number of navigation events that occurred within MSAL interactive flows.

- **MSAL_client_id** - Client ID of the calling application

- **MSAL_correlation_id** - Unique GUID for this event, used to join actions across client, server, and app logs.

- **MSAL_data_signing_time** - The length of time in milliseconds that it took to sign the request header with the PoP key.

- **MSAL_delete_token** - List of tokens that were deleted from cache during this authentication flow.

- **MSAL_delete_token_last_error** - System error code in case of a token deletion error, same as read/write token last error.

- **MSAL_http_call_count** - Number of HTTP calls MSAL made during the authentication flow.

- **MSAL_http_call_count_max** - If this signal is aggregated, max network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_min** - If this signal is aggregated, min network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_sum** - If this signal is aggregated, sum of the network calls made by MSAL of all the aggregated events

- **MSAL_is_pkey_auth_token_sent** - True/false did we send a signed JWT in response to a PKeyAuth challenge.

- **MSAL_is_successful** - Was the authentication flow successful.

- **MSAL_key_creation_time** - How long it took in milliseconds to generate the Proof of Possession key.

- **MSAL_key_load_time** - How long it took in milliseconds to load the Proof of Possession Key.

- **MSAL_last_http_response_code** - If MSAL made one or more HTTP call(s), this is the last HTTP response code we received.

- **MSAL_migration_adal_accounts_found** - Number of Adal accounts found in the migration flow

- **MSAL_migration_adal_accounts_succeeded** - Number of Adal accounts successfully migrated in the migration flow

- **MSAL_msalruntime_version** - MSAL Runtime's version string, format X.X.X

- **MSAL_msal_version** - MSAL's version string, format X.X.X+(OneAuth, local, or a commit hash).

- **MSAL_pkeyauth_cert_type** - “empty”/ ”windows_issuer” / “windows_thumbprint” / “apple keychain” – How/where did we find the cert used to complete PKeyAuth

- **MSAL_prt_enabled** - Was PRT functionality enabled for this request

- **MSAL_prt_protocol_version** - Specifies the prt protocol version used by user

- **MSAL_read_account_error** - If there's an error reading from disk during an account read, the error context goes here (Ex: Same as read_token_error)

- **MSAL_read_token** - Tokens that were read from cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_read_token_last_error** - If MSAL encountered an error reading from cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on macOS).

- **MSAL_req_cnf_response_pop** - Contains the success/failure information when retrieving the Proof of Possession key payload

- **MSAL_request_duration** - How long the request took from when MSAL's top level API was called, until we returned a result.

- **MSAL_request_eligible_for_broker** - True if broker is enabled and request type is eligible to use the broker. Doesn't indicate if broker was actually invoked.

- **MSAL_request_id** - Request ID for the last call we made to Microsoft's secure token service.

- **MSAL_request_new_prt** - Will MSAL request a new PRT on this request

- **MSAL_server_error_code** - Microsoft specific secure token service numeric error code if we received one.

- **MSAL_server_spe_ring** - Microsoft secure token service's Secure Production Enterprise ring info if we received it.

- **MSAL_server_suberror_code** - Microsoft specific secure token service sub error code string if we received one.

- **MSAL_start_time** - Time MSAL request was started at the top level public API.

- **MSAL_stop_time** - Time MSAL finished processing the request and returned a result to the caller.

- **MSAL_storage_accounts_count** - How many accounts were found in total on the box during a discover accounts call. (broker_accounts_count + non-broker/OneAuth accounts)(Ex: 0, 5, 1337)

- **MSAL_tenant_id** - Microsoft GUID identifying the tenant the user exists in.

- **MSAL_ui_event_count** - Number of UI prompts MSAL displayed on screen.

- **MSAL_was_request_throttled** - True if MSAL throttled this request and prevented it from hitting network. If this is ever true, there's most likely a loop in the calling app.

- **MSAL_write_account_status** - If there's an error writing to disk during an account cache, the error context goes here (Ex: Same as write_token_error)

- **MSAL_write_token** - Tokens that were wrote to cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_write_token_last_error** - If MSAL encountered an error writing to cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on macOS).

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_AppId** - Specifies the application Id of the application invoking OneAuth.

- **oneauth_SubStatus** - Integer code returned when there's a user impacting issue; indicates reason for the failure (e.g., UserPasswordExpired = 6005, EnterProductKey = 6301, etc.)

- **oneauth_transactionuploadid** - Specifies the randomly generated internal GUID that maps to the specific invocation of a OneAuth API.

- **oneauth_version** - The version of the OneAuth SDK.

- **platform** - OS Platform (0: Windows Desktop, 1: Android, 2: iOS, 3: macOS, 4: UWP)

- **promptreasoncorrelationid** - A correlation identifier that can be used to lookup a previous authentication event, which is used to explain why the user was prompted to authenticate.

- **resource** - The resource for which a token is requested for.

- **scenarioid** - Multiple events may belong to a single scenario, e.g., the scenario may be adding a new account but there are multiple prompts that occur as part of that scenario. This identifier enables correlation of those related events. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **scenarioname** - Name of the application scenario where authentication was required, e.g., first-boot, licensing check, etc.

- **scope** - The scope for which a token is requested for.

- **SdkVersion** - Version of Microsoft Auth Telemetry System library used to produce this data

- **sessionid** - Identifier for the boot session

- **tenantid** - GUID identifying the tenant the authenticated user belongs to (in non-ADAL cases)

- **uploadid** - Unique GUID for this event, used for de-duping


### Office.MATS.OneAuth.ActionMicrosoftOfficeiOS

This event is triggered when Office attempts to acquire an authentication token, either silently or through prompting. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an auth token or are in a broken auth state
- Identify critical regressions in the user's auth experience when there are changes on the client or services. This includes powering alerts so engineers can mitigate quickly
- Failure signals emit important error codes from the responsible component used for triage, diagnosis, and mitigation

The following fields are collected:

- **Actinidine** - When the authentication event ended

- **Actionname** - Friendly name for this event if one was provided.

- **ActionStartTime** - Time at which the authentication event began.

- **actiontype** - Specifies the type of authentication library in use.

- **appaudience** - Is the app build for internal or external use

- **appname** - Name of the application doing authentication

- **appver** - Version of the application doing authentication

- **askedforcreds** - Did the application ask the user to enter credentials for this action

- **authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

- **blockingprompt** - Did the application throw a prompt requiring user interaction

- **correlationid** - Identifier used to join information regarding this individual event with services data

- **count** - The total number of aggregated actions reported in this one data event.

- **data_signing_time** - Records the time taken for signing data using the key

- **devicenetworkstate** - Is the device connected to the internet.

- **deviceprofiletelemetryid** - Anonymous device ID used to measure device-wide authentication experience and reliability.

- **duration_max** - Max duration of any one of the aggregated events

- **duration_min** - Min duration of any one of the aggregated events

- **duration_sum** - Sum of the duration of all the aggregated events

- **error** - Error code if the authentication failed

- **errordescription** - Brief description of the error

- **errorsource** - Did the error come from service, authentication library, or application

- **eventtype** - Is this event reporting an authentication datapoint, or a data quality error event. Used to measure data quality.

- **hasadaltelemetry** - Indicates whether the Azure Active Directory Authentication Library (ADAL) provided telemetry for this event.

- **identityservice** - Was Microsoft Service Account (MSA) or Microsoft Entra service invoked

- **interactiveauthcontainer** - What type of prompt was shown

- **issilent** - Was a prompt shown or was this a silent (background) authentication event.

- **key_creation_time** - Records the time taken for asymmetric key pair creation

- **key_load_time** - Records the time taken for loading an existing key pair

- **MSAL_access_token_expiry_time** - Access token expiry time in UTC returning to the application.

- **MSAL_all_error_tags** - All error tags the Microsoft Authentication Library (MSAL) encountered during the authentication flow.

- **MSAL_api_error_code** - If MSAL encounters an error bubbled up from the OS, platform error codes are stored here.

- **MSAL_api_error_context** - String containing additional human readable details about the last error MSAL encountered. 

- **MSAL_api_error_tag** - Unique string for the place in code where this error occurred.

- **MSAL_api_name** - Name of the MSAL top level API called to start this authentication flow.

- **MSAL_api_status_code** - Status code MSAL returned for this authentication flow result.

- **MSAL_async_events_started** - If this action started/kicked off additional sub-actions to be completed asynchronously, this field will be added to the telemetry batch, with a count of the events started.

- **MSAL_auth_flow** - Steps MSAL attempted during this authentication flow (AT, PRT, LRT, FRT, ART, IRT). Separated by the pipe | symbol for easy parsing.

- **MSAL_auth_flow_last_error** - Error code we received from the server on the second to last item in AuthFlow. (Ex: if AuthFlow = PRT|LRT, PRT's error would be in AuthFlowLastError).

- **MSAL_authority_type** - Was this request for a user in: Microsoft Entra ID, Federated, or MSA.

- **MSAL_authorization_error_subcode** - If we received a sub error code from the authorization/UI call, it's put here. (Ex: bad_token)

- **MSAL_authorization_type** - Means of acquiring an access token supported by MSAL used for this flow (Ex: ImportedRefreshToken, CachedRefreshToken)

- **MSAL_broker_accounts_count** - Number of accounts present in the broker.

- **MSAL_broker_app_used** - True if this request reached the broker. False if this request could use the broker but didn't. Blank/Omitted if the broker isn't enabled or this request isn't eligible for the broker.

- **MSAL_broker_version** - Version of the iOS/Android authentication brokers.

- **MSAL_browser_navigation_count** - Indicates the number of navigation events that occurred within MSAL interactive flows.

- **MSAL_cached_pop_key_stored_in_hw** - True/False indicating if the Proof of Possession (PoP) Key used in this operation was stored in hardware

- **MSAL_client_id** - Client ID of the calling application

- **MSAL_correlation_id** - Unique GUID for this event, used to join actions across client, server, and app logs.

- **MSAL_data_signing_time** - The length of time in milliseconds that it took to sign the request header with the PoP key.

- **MSAL_delete_token** - List of token types that were deleted from cache during this authentication flow.

- **MSAL_delete_token_last_error** - System error code in case of a token deletion error, same as read/write token last error.

- **MSAL_http_call_count** - Number of HTTP calls MSAL made during the authentication flow.

- **MSAL_http_call_count_max** - If this signal is aggregated, max network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_min** - If this signal is aggregated, min network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_sum** - If this signal is aggregated, sum of the network calls made by MSAL of all the aggregated events

- **MSAL_is_pkey_auth_token_sent** - True/false did we send a signed JSON Web Token in response to a Primary Key Auth challenge.

- **MSAL_is_successful** - Was the authentication flow successful.

- **MSAL_key_creation_time** - How long it took in milliseconds to generate the Proof of Possession key.

- **MSAL_key_load_error** - System crypto/TPM error code in case of Proof of Possession key load error

- **MSAL_key_load_time** - How long it took in milliseconds to load the Proof of Possession Key.

- **MSAL_last_http_response_code** - If MSAL made one or more HTTP call(s), this is the last HTTP response code we received.

- **MSAL_migration_adal_accounts_found** - Number of Adal accounts found in the migration flow

- **MSAL_migration_adal_accounts_succeeded** - Number of Adal accounts successfully migrated in the migration flow

- **MSAL_msal_version** - MSAL's version string, format X.X.X+(OneAuth, local, or a commit hash).

- **MSAL_msalruntime_version** - MSAL Runtime's version string, format X.X.X

- **MSAL_pkeyauth_cert_type** - “empty”/ ”windows_issuer” / “windows_thumbprint” / “apple keychain” – How/where did we find the cert used to complete PKeyAuth

- **MSAL_prt_enabled** - Is Primary Refresh Token functionality enabled for this request

- **MSAL_prt_protocol_version** - Specifies the Primary Refresh Token protocol version used by user

- **MSAL_read_account_error** - If there's an error reading from disk during an account read, the error context goes here (Ex: Same as read_token_error)

- **MSAL_read_token** – Token types that were read from cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_read_token_last_error** - If MSAL encountered an error reading from cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on MacOS).

- **MSAL_req_cnf_response_pop** - Contains the success/failure information when retrieving the PoP key payload

- **MSAL_request_duration** - How long that the request took from when MSAL's top level API was called until a result was returned.

- **MSAL_request_eligible_for_broker** - True if broker is enabled and request type is eligible to use the broker. Doesn't indicate if broker was actually invoked.

- **MSAL_request_id** - Request ID for the last call we made to Microsoft's secure token service.

- **MSAL_request_new_prt** - Will MSAL request a new PRT on this request

- **MSAL_server_error_code** - Microsoft specific secure token service numeric error code if we received one.

- **MSAL_server_spe_ring** - Microsoft secure token service's Secure Production Enterprise ring info if we received it.

- **MSAL_server_suberror_code** - Microsoft specific secure token service sub error code string if we received one.

- **MSAL_start_time** - Time MSAL request was started at the top-level public API.

- **MSAL_stop_time** - Time MSAL finished processing the request and returned a result to the caller.

- **MSAL_storage_accounts_count** - How many accounts were found in total on the box during a discover accounts call. (broker_accounts_count + non-broker/OneAuth accounts) (Ex: 0, 5, 1337)

- **MSAL_tenant_id** - Microsoft GUID identifying the tenant the user exists in.

- **MSAL_time_get_broker_account** - Time it took for the broker to return the shared/FLW account on a device

- **MSAL_ui_event_count** - Number of UI prompts MSAL displayed on screen.

- **MSAL_was_request_throttled** - True if MSAL throttled this request and prevented it from hitting network. If this is ever true, there's most likely a loop in the calling app.

- **MSAL_write_account_status** - If there's an error writing to disk during an account cache, the error context goes here

- **MSAL_write_token** - Token types that were written to cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_write_token_last_error** - If MSAL encountered an error writing to cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on MacOS).

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_AppId** - Specifies the application Id of the application invoking OneAuth.

- **oneauth_SubStatus** - Integer code returned when there's a user impacting issue; indicates reason for the failure (e.g., UserPasswordExpired = 6005, EnterProductKey = 6301, etc.)

- **oneauth_transactionuploadid** - Specifies the randomly generated internal GUID that maps to the specific invocation of a OneAuth API.

- **oneauth_version** - The version of the OneAuth SDK.

- **platform** - OS Platform (0: Windows Desktop, 1: Android, 2: iOS, 3: MacOS, 4: UWP)

- **promptreasoncorrelationid** - A correlation identifier that can be used to lookup a previous authentication event, which is used to explain why the user was prompted to authenticate.

- **resource** - The resource for which a token is requested for.

- **scenarioname** - Name of the application scenario where authentication was required, e.g., first-boot, licensing check, etc.

- **scope** - The scope for which a token is requested for.

- **SdkVersion** - Version of Microsoft Auth Telemetry System library used to produce this data

- **sessionid** - Identifier for the boot session

- **tenantid** - GUID identifying the tenant the authenticated user belongs to

- **uploadid** - Unique GUID for this event, used for de-duping


### Office.MATS.OneAuth.ActionMicrosoftOfficeMac

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an auth token or are in a broken auth state
- Identify critical regressions in the user's auth experience when there are changes on the client or services. This includes powering alerts so engineers can mitigate quickly
- Failure signals emit important error codes from the responsible component used for triage, diagnosis, and mitigation

The following fields are collected:

- **ActionEndTime** - When the authentication event ended

- **actionname** - Friendly name for this event if one was provided.

- **ActionStartTime** - Time at which the authentication event began.

- **actiontype** - Specifies the type of authentication library in use.

- **appaudience** - Is the app build for internal or external use

- **appname** - Name of the application doing authentication

- **appver** - Version of the application doing authentication

- **askedforcreds** - Did the application ask the user to enter credentials for this action

- **authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

- **blockingprompt** - Did the application throw a prompt requiring user interaction

- **correlationid** - Identifier used to connect information regarding this individual event with services data

- **count** - The total number of aggregated actions reported in this one data event.

- **data_signing_time** - Records the time taken for signing data using the key

- **devicenetworkstate** - Is the device connected to the internet.

- **deviceprofiletelemetryid** - Anonymous device ID used to measure device-wide authentication experience and reliability.

- **duration_max** - Max duration of any one of the aggregated events

- **duration_min** - Min duration of any one of the aggregated events

- **duration_sum** - Sum of the duration of all the aggregated events

- **error** - Error code if the authentication failed

- **errordescription** - Brief description of the error

- **errorsource** - Did the error come from service, authentication library, or application

- **eventtype** - Is this event reporting an authentication datapoint, or a data quality error event. Used to measure data quality.

- **hasadaltelemetry** - Indicates whether the Azure Active Directory Authentication Library (ADAL) provided telemetry for this event.

- **identityservice** - Was Microsoft Service Account (MSA) or Microsoft Entra service invoked

- **interactiveauthcontainer** - What type of prompt was shown

- **issilent** - Was a prompt shown or was this a silent (background) authentication event.

- **key_creation_time** - Records the time taken for asymmetric key pair creation

- **key_load_time** - Records the time taken for loading an existing key pair

- **MSAL_access_token_expiry_time** - Access token expiry time in UTC returning to the application.

- **MSAL_all_error_tags** - All error tags the Microsoft Authentication Library (MSAL) encountered during the authentication flow.

- **MSAL_api_error_code** - If MSAL encounters an error bubbled up from the OS, platform error codes are stored here.

- **MSAL_api_error_context** - String containing additional human readable details about the last error MSAL encountered. 

- **MSAL_api_error_tag** - Unique string for the place in code where this error occurred.

- **MSAL_api_name** - Name of the MSAL top level API called to start this authentication flow.

- **MSAL_api_status_code** - Status code MSAL returned for this authentication flow result.

- **MSAL_async_events_started** - If this action started/kicked off additional sub-actions to be completed asynchronously, this field will be added to the telemetry batch, with a count of the events started ("1", "2", "3" …)

- **MSAL_auth_flow** - Steps MSAL attempted during this authentication flow (AT, PRT, LRT, FRT, ART, IRT). Seperated by the pipe | symbol for easy parsing.

- **MSAL_auth_flow_last_error** - Error code we received from the server on the 2nd to last item in AuthFlow. (Ex: if AuthFlow = PRT|LRT, PRT's error would be in AuthFlowLastError).

- **MSAL_authority_type** - Was this request for a user in: Microsoft Entra ID, Federated, or MSA.

- **MSAL_authorization_error_subcode** - If we received a sub error code from the authorization/UI call, it's put here. (Ex: "bad_token")

- **MSAL_authorization_type** - Means of acquiring an access token supported by MSAL used for this flow (Ex: ImportedRefreshToken, CachedRefreshToken) 

- **MSAL_broker_accounts_count** – Number of accounts present in the broker.

- **MSAL_broker_app_used** - True if this request actually hit/invoked the broker. False if this request could use the broker but didn't. Blank/Omitted if the broker isn't enabled or this request isn't eligible for the broker.

- **MSAL_browser_navigation_count** - Indicates the number of navigation events that occurred within MSAL interactive flows.

- **MSAL_cached_pop_key_stored_in_hw** - True/False was the PoP Key used in this operation stored in hardware

- **MSAL_client_id** - Client ID of the calling application

- **MSAL_correlation_id** - Unique GUID for this event, used to join actions across client, server, and app logs.

- **MSAL_data_signing_time** - The length of time in milliseconds that it took to sign the request header with the PoP key.

- **MSAL_delete_token** - List of token types that were deleted from cache during this authentication flow.

- **MSAL_delete_token_last_error** - System error code in case of a token deletion error, same as read/write token last error.

- **MSAL_http_call_count** - Number of HTTP calls MSAL made during the authentication flow.

- **MSAL_http_call_count_max** - If this signal is aggregated, max network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_min** - If this signal is aggregated, min network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_sum** - If this signal is aggregated, sum of the network calls made by MSAL of all the aggregated events

- **MSAL_is_pkey_auth_token_sent** - True/false did we send a signed JWT in response to a PKeyAuth challenge.

- **MSAL_is_pkey_auth_token_sent** - True/false did we send a signed JWT in response to a PKeyAuth challenge

- **MSAL_is_successful** - Was the authentication flow successful.

- **MSAL_key_creation_time** - How long it took in milliseconds to generate the Proof of Possession key.

- **MSAL_key_load_error** - System crypto/TPM error code in case of PoP key load error

- **MSAL_key_load_time** - How long it took in milliseconds to load the Proof of Possession Key.

- **MSAL_last_http_response_code** - If MSAL made one or more HTTP call(s), this is the last HTTP response code we received.

- **MSAL_migration_adal_accounts_found** - Number of Adal accounts found in the migration flow

- **MSAL_migration_adal_accounts_succeeded** - Number of Adal accounts successfully migrated in the migration flow

- **MSAL_msal_version** - MSAL's version string, format X.X.X+(OneAuth, local, or a commit hash).

- **MSAL_msalruntime_version** - MSAL Runtime's version string, format X.X.X

- **MSAL_pkeyauth_cert_type** - “empty”/ ”windows_issuer” / “windows_thumbprint” / “apple keychain” – How/where did we find the cert used to complete PKeyAuth

- **MSAL_prt_enabled** - Was PRT functionality enabled for this request

- **MSAL_prt_protocol_version** - Specifies the PRT protocol version used by user

- **MSAL_read_account_error** - If there's an error reading from disk during an account read, the error context goes here (Ex: Same as read_token_error)

- **MSAL_read_token** - Tokens that were read from cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_read_token_last_error** - If MSAL encountered an error reading from cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on MacOS).

- **MSAL_req_cnf_response_pop** - Contains the success/failure information when retrieving the PoP key payload

- **MSAL_request_duration** - Duration from when MSAL's top level API was called until we returned a result.

- **MSAL_request_eligible_for_broker** - True if broker is enabled and request type is eligible to use the broker. Doesn't indicate if broker was actually invoked.

- **MSAL_request_id** - Request ID for the last call we made to Microsoft's secure token service.

- **MSAL_request_new_prt** - Will MSAL request a new PRT on this request

- **MSAL_server_error_code** - Microsoft specific secure token service numeric error code if we received one.

- **MSAL_server_spe_ring** - Microsoft secure token service's Secure Production Enterprise ring info if we received it.

- **MSAL_server_suberror_code** - Microsoft specific secure token service sub error code string if we received one.

- **MSAL_start_time** - Time MSAL request was started at the top-level public API.

- **MSAL_stop_time** - Time MSAL finished processing the request and returned a result to the caller.

- **MSAL_storage_accounts_count** - How many accounts were found in total on the box during a discover accounts call. (broker_accounts_count + non-broker/OneAuth accounts)(Ex: 0, 5, 1337)

- **MSAL_tenant_id** - Microsoft GUID identifying the tenant the user exists in.

- **MSAL_ui_event_count** - Number of UI prompts MSAL displayed on screen.

- **MSAL_was_request_throttled** - True if MSAL throttled this request and prevented it from hitting network. If this is ever true, there's most likely a loop in the calling app.

- **MSAL_write_account_status** - If there's an error writing to disk during an account cache, the error context goes here (Ex: Same as write_token_error)

- **MSAL_write_token** - Tokens that were written to cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_write_token_last_error** - If MSAL encountered an error writing to cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on MacOS).

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_AppId** - Specifies the application Id of the application invoking OneAuth.

- **oneauth_SubStatus** - Integer code returned when there's a user impacting issue; indicates reason for the failure (e.g., UserPasswordExpired = 6005, EnterProductKey = 6301, etc.)

- **oneauth_transactionuploadid** - Specifies the randomly generated internal GUID that maps to the specific invocation of a OneAuth API.

- **oneauth_version** - The version of the OneAuth SDK.
platform** - OS Platform (0: Windows Desktop, 1: Android, 2: iOS, 3: MacOS, 4: UWP)

- **promptreasoncorrelationid** - A correlation identifier that can be used to lookup a previous authentication event, which is used to explain why the user was prompted to authenticate.

- **resource** - The resource for which a token is requested for.

- **scenarioname** - Name of the application scenario where authentication was required, e.g., first-boot, licensing check, etc.

- **scope** - The scope for which a token is requested for.

- **SdkVersion** - Version of Microsoft Auth Telemetry System library used to produce this data

- **sessionid** - Identifier for the boot session

- **tenantid** - GUID identifying the tenant the authenticated user belongs to (in non-ADAL cases)

- **uploadid** - Unique GUID for this event, used for de-duping

### Office.MATS.OneAuth.ActionMicrosoftOfficeWin32

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. When acquisition attempts fail, error information is included. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an authentication token from the service, or have entered a broken authentication state.

- Evaluate when changes occur on the client or services, whether they result in critical regressions in the user's authentication experience and reliability

- When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

- These signals power various ship readiness and health monitors, which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical failures.

The following fields are collected:

- **Accounttype** - Type of the account used for this authentication event, for example, consumer or organizational. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ActionEndTime** - When the authentication event ended

- **Actionname** - Friendly name for this event, if one was provided.

- **ActionStartTime** - When the authentication event began

- **Actiontype** - Specifies the type of authentication library in use.

- **Appaudience** - Is the app build for internal or external use

- **Appforcedprompt** - Did the app override cache and force a prompt to be shown

- **Appname** - Name of the application doing authentication

- **Appver** - Version of the application doing authentication

- **Askedforcreds** - Did the application ask the user to enter credentials for this action

- **Authoutcome** - Did the authentication attempt succeed, fail, or was canceled

- **Blockingprompt** -  Did the application throw a prompt requiring user interaction

- **Correlationid** - Identifier used to join information regarding this individual event with services data

- **Count** - The total number of aggregated actions reported in this one data event.

- **Devicenetworkstate** - Is the device connected to the internet.

- **Deviceprofiletelemetryid** - Anonymous device ID used to measure device-wide authentication experience and reliability.

- **Duration** - How long the authentication took

- **duration_max** - Max duration of any one of the aggregated events

- **duration_min** - Min duration of any one of the aggregated events

- **duration_sum** - Sum of the duration of all the aggregated events

- **endtime** - When the authentication event ended

- **error** - Error code if the authentication failed

- **errordescription** - Brief description of the error

- **errorsource** - Did the error come from service, authentication library, or application

- **eventtype** - Is this event reporting an authentication datapoint, or a data quality error event. Used to measure data quality.

- **from_cache** - Boolean representing whether the record is from the WAM core cache, or the plugin

- **hasadaltelemetry** - Indicates whether the Azure Active Directory Authentication Library (ADAL) provided telemetry for this event.

- **Identityservice** - Was Microsoft Service Account (MSA) or Microsoft Entra service invoked

- **Interactiveauthcontainer** - What type of prompt was shown

- **Issilent** - Was a prompt shown or was this a silent (background) authentication event.

- **Microsoft_ADAL_adal_version** - Version of the Azure Active Directory Authentication Library (ADAL) *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_api_error_code** - Error code emitted by authentication library for this authentication attempt *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_api_id** - API invoked for this authentication attempt *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_application_name** - The name of the application / process using ADAL. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_application_version** - The version of the application using ADAL. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_authority** - Microsoft Entra authority URL responsible for authenticating the user *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_authority_type** - Consumer / Microsoft Service Agreement (MSA) vs organizational / Microsoft Entra ID; currently always Microsoft Entra ID *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_authority_validation_status** - Tells whether authentication completed on the service-side *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_broker_app** - Tells whether ADAL used a broker for authentication *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_broker_app_used** - Tells the name of the broker (for example, Windows Account Management) *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_broker_version** - Tells the version of the broker if used *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_event_count** - Number of cache events ADAL performed while retrieving token *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_event_count_max** - If this signal is aggregated, max cache events of any one of the aggregated events *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_event_count_min** - If this signal is aggregated, min cache events of any one of the aggregated events *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_event_count_sum** - If this signal is aggregated, sum of the cache events of all the aggregated events *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_read_count** - How many times the API read from the disk cache. Present if there was at least one read *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_read_error_count** - How many times the disk cache read failed. Is present if there was at least one failure *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_read_last_error** - ADAL error code. Present if there was at least one read failure  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_read_last_system_error** - System error code.  Is present if there was at least one read failure *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_write_count** - How many times the API wrote to the disk cache. Present if there was at least one write *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_write_error_count** - How many times the disk cache-write failed. Present if there was at least one failure *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_write_last_error** - ADAL error code. Present if there was at least one write failure *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_cache_write_last_system_error** - System error code. Present if there was at least one write failure *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_client_id** - Hashed Microsoft Entra app ID *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_device_id** - ADAL-generated local device id. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_error_domain** - The domain/component that generated the error code. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_error_protocol_code** - OAuth protocol error code returned by the service, recorded by ADAL. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_extended_expires_on_setting** - True/false telling if the token has an extended lifetime *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_http_event_count** - Number of HTTP requests generated by ADAL. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_idp** - The Identity Provider (idp) used by ADAL. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_network_event_count** - Count of network calls made by ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_http_event_count_max** - If this signal is aggregated, max of http calls made by ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_http_event_count_min** - If this signal is aggregated, min of http calls made by ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_http_event_count_sum** - If this signal is aggregated, sum of http calls made by ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_network_event_count_max** - If this signal is aggregated, max network calls made by ADAL of any aggregated event *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_network_event_count_min** - If this signal is aggregated, min network calls made by ADAL of any aggregated event *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_network_event_count_sum** - If this signal is aggregated, sum of the network calls made by ADAL of all the aggregated events *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_is_silent_ui** - True/false telling if UI was shown (prompt) by ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_is_successful** - True/false telling if ADAL API succeeded *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_is_successfull** - True/false telling if ADAL API succeeded (macOS) *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_logging_pii_enabled** - True/false telling if ADAL full logging mode is enabled. This data is only logged locally, not emitted in telemetry  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_ntlm** - True/false telling if ADAL used basic auth (NTLM).  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_oauth_error_code** - OAuth protocol error code returned by the service *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_prompt_behavior** - log-in or none network parameter passed to service to specify if user interface can be shown *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_request_id** - Transactional GUID for the request emitted by ADAL to the service *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_response_code** - network response code from the service *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_response_time** - How long it took service to return to ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_response_time_max** - If the signal is aggregated, the max time it took ADAL to return from its API among any of the aggregated events  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_response_time_min** - If the signal is aggregated, the min time it took the service to respond to ADAL among any of the aggregated events *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_response_time_sum** - If the signal is aggregated, the sum of the time it took ADAL to return from its API among all aggregated events *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_rt_age** - Age of the refresh token *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_server_error_code** - Error code returned by the server *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_server_sub_error_code** - Sub error code returned by the server to help disambiguate why the request failed *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_spe_info** - True/false telling if the user was using the Secure Production Enterprise inner ring (Microsoft employees only) *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_spe_ring** - True/false telling if the user was using the Secure Production Enterprise inner ring (Microsoft employees only) *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_start_time** - Time the ADAL API call was made *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_status** - Success/Failure status on the overall ADAL invocation *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_stop_time** - Time the ADAL API call returned *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_telemetry_pii_enabled** - True/false telling if ADAL full telemetry mode is enabled. The name is a misnomer, as no PII/EUII is emitted *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_tenant_id** - GUID identifying the tenant that the authenticated user belongs to *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_token_acquisition_from_context** - Describes the ADAL behavior based on the tokens in the authentication context *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_token_frt_status** - Status of the refresh token: whether it was tried, not needed, not found, or deleted. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_token_mrrt_status** - Status of the MultiResourceRefreshToken: whether it was tried, not needed, not found, or deleted. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_token_rt_status** - Status of the refresh token: whether it was tried, not needed, not found, or deleted. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_token_type** - Either refresh token (RT) or multi-resource refresh token (MRRT) *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_ui_event_count** - Count of prompts shown to the user. May have been silent *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_user_cancel** - True / false if the user interface window was canceled *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_x_ms_request_id** - Additional request ID provided in network header to service by ADAL *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_x_client_cpu** - Information regarding the CPU Architecture of the device *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_x_client_os** - The device OS Version. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_x_client_sku** - The name of the device OS SKU. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Microsoft_ADAL_x_client_ver** - The version of the ADAL library. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **MSAL_aad_wam_account_creation_failed** - If present, account creation failed in Web Account Manager (WAM). Only legal value is "true"

- **MSAL_aad_wam_find_accounts_error** - Integer error code bubbled from WAM

- **MSAL_aad_wam_find_accounts_status** - String describing account lookup status, from enum

- **MSAL_aad_wam_haid** - Where did the HAID we're using for WAM come from? (Ex: "missing_key"/"from_clientinfo"/"from_msal_localaccountid")

- **MSAL_access_token_expiry_time** - Access token expiry time in UTC returning to the application.

- **MSAL_additional_query_parameters_count** - Number of query parameters that passed validation and were added.

- **MSAL_all_error_tags** - All error tags the Microsoft Authentication Library (MSAL) encountered during the authentication flow.

- **MSAL_api_error_code** - If MSAL encounters an error bubbled up from the OS, platform error codes are stored here.

- **MSAL_api_error_context** - String containing additional human readable details about the last error MSAL encountered. 

- **MSAL_api_error_tag** - Unique string for the place in code where this error occurred.

- **MSAL_api_name** - Name of the MSAL top-level API called to start this authentication flow.

- **MSAL_api_status_code** - Status code MSAL returned for this authentication flow result.

- **MSAL_asymmetric_key_vsm_pop** - Status of Proof of Possession (PoP) key virtual isolation. If this is equal to VSM_PROP_SET, then the key was indeed stored in hardware (as opposed to erroring out or falling back to software).

- **MSAL_asymmetric_pop_key_external** - "true"/"false"** - Is the PoP key used to sign the SHR external to MSAL (managed by WAM)

- **MSAL_async_events_started** - If this action started/kicked off additional sub-actions to be completed asynchronously, this field will be added to the telemetry batch, with a count of the events started ("1", "2", "3" …)

- **MSAL_auth_flow** - Steps MSAL attempted during this authentication flow (AT, PRT, LRT, FRT, ART, IRT). Separated by the pipe "|" symbol for easy parsing.

- **MSAL_auth_flow_last_error** - Error code we received from the server on the second to last item in AuthFlow. (Ex: if AuthFlow = "PRT|LRT", PRT's error would be in AuthFlowLastError).

- **MSAL_authority_type** - Was this request for a user in: Microsoft Entra ID, Federated, or MSA.

- **MSAL_authorization_error_subcode** - If we received a sub error code from the authorization/UI call, it's put here. (Ex: "bad_token")

- **MSAL_authorization_type** - Means of acquiring an access token supported by MSAL used for this flow (Ex: ImportedRefreshToken, CachedRefreshToken)

- **MSAL_broker_accounts_count** - Number of accounts the system broker returns during an account discovery call. (Ex: 1, 0, 1337)

- **MSAL_broker_app_used** - Was a broker app used in this auth flow.

- **MSAL_browser_navigation_count** - Indicates the number of navigation events that occurred within MSAL interactive flows.

- **MSAL_cached_pop_key_stored_in_hw** - True/False was the PoP Key used in this operation stored in hardware

- **MSAL_client_id** - Client ID of the calling application

- **MSAL_correlation_id** - Unique GUID for this event, used to join actions across client, server, and app logs.

- **MSAL_data_signing_time** - The length of time in milliseconds that it took to sign the request header with the PoP key.

- **MSAL_delete_token** - List of tokens that were deleted from cache during this authentication flow.

- **MSAL_delete_token_last_error** - System error code in case of a token deletion error, same as read/write token last error.

- **MSAL_http_call_count** - Number of HTTP calls MSAL made during the authentication flow.

- **MSAL_http_call_count_max** - If this signal is aggregated, max network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_min** - If this signal is aggregated, min network calls made by MSAL of any aggregated event

- **MSAL_http_call_count_sum** - If this signal is aggregated, sum of the network calls made by MSAL of all the aggregated events

- **MSAL_is_pkey_auth_token_sent** - True/false did we send a signed JWT in response to a PKeyAuth challenge.

- **MSAL_is_successful** - Was the authentication flow successful.

- **MSAL_key_creation_time** - Time in milliseconds to generate an asymmetric keypair for PoP (Ex: 0, 100, 5)

- **MSAL_key_load_error** - System crypto/TPM error code in case of PoP key load error

- **MSAL_key_load_time** - How long it took in milliseconds to load the Proof of Possession Key.

- **MSAL_last_http_response_code** - If MSAL made one or more HTTP call(s), this is the last HTTP response code we received.

- **MSAL_migration_adal_accounts_found** - Number of Adal accounts found in the migration flow

- **MSAL_migration_adal_accounts_succeeded** - Number of Adal accounts successfully migrated in the migration flow

- **MSAL_msa_wam_account_creation_failed** - If present, account creation failed in WAM. Only legal value is "true"

- **MSAL_msa_wam_find_accounts_error** - Integer error code bubbled from WAM

- **MSAL_msa_wam_find_accounts_status** - String describing account lookup status, from enum

- **MSAL_msal_version** - MSAL's version string, format X.X.X+("OneAuth", "local", or a commit hash).

- **MSAL_msalruntime_version** - MSAL Runtime's version string, format X.X.X

- **MSAL_pkeyauth_cert_type** - “empty”/ ”windows_issuer” / “windows_thumbprint” / “apple keychain” – How/where did we find the certificate used to complete PKeyAuth

- **MSAL_pop_gen_auth_header_success** - Was the POP manager able to generate the POP header

- **MSAL_prefer_vsm_asymmetric_key** - Indicates if the hardware key was requested for pop token signing.

- **MSAL_prt_enabled** - Was Primary Refresh Token (PRT) functionality enabled for this request

- **MSAL_prt_protocol_version** - Specifies the PRT protocol version used by user

- **MSAL_read_account_error** - If there's an error reading from disk during an account read, the error context goes here (Ex: Same as read_token_error)

- **MSAL_read_token** - Tokens that were read from cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_read_token_last_error** - If MSAL encountered an error reading from cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on macOS).

- **MSAL_req_cnf_response_pop** - Contains the success/failure information when retrieving the PoP key payload; "success" IFF PopManagerImpl::GetReqCnf() succeeds (Ex: "success" is only defined value. Omitted if action fails or doesn't happen during flow)

- **MSAL_request_duration** - How long the request took from when MSAL's top-level API was called, until we returned a result.

- **MSAL_request_eligible_for_broker** - True if broker is enabled and request type is eligible to use the broker. Doesn't indicate if broker was actually invoked.

- **MSAL_request_id** - Request ID for the last call we made to Microsoft's secure token service.

- **MSAL_request_new_prt** - Will MSAL request a new PRT on this request

- **MSAL_server_error_code** - Microsoft specific secure token service numeric error code if we received one.

- **MSAL_server_spe_ring** - Microsoft secure token service's Secure Production Enterprise ring info if we received it.

- **MSAL_server_suberror_code** - Microsoft specific secure token service suberror code string if we received one.

- **MSAL_start_time** - Time MSAL request was started at the top-level public API.

- **MSAL_stop_time** - Time MSAL finished processing the request and returned a result to the caller.

- **MSAL_tenant_id** - Microsoft GUID identifying the tenant the user exists in.

- **MSAL_transfer_token_added** - "Succeeded" if transfer went through. Omitted from the batch otherwise

- **MSAL_transfer_token_error** - WAM error code from transfer process. Field can be PII wrapped in stdException cases

- **MSAL_transfer_token_request** - Did the token transfer request succeed? Possible values: "failed" "succeeded" "stdException" "winrtException"

- **MSAL_ui_event_count** - Number of UI prompts MSAL displayed on screen.

- **MSAL_vsm_key_creation_status_code** - the Hex error code from the TPM as to why hardware asymetric key generation failed (Ex: 0x(some hex code from Windows))

- **MSAL_wam_cache_invalidated** - If WAMSynchronousWrapper::InvalidateWamCacheIfRequired() wiped cache on a given WAM call, "1" is set (Ex: "1" is the only defined value. If not present, it's safe to assume this code didn't wipe the WAM cache)

- **MSAL_wam_cached_time_diff** - Time difference in seconds between cached WAM response and current time.

- **MSAL_wam_cancel_ui_error** - WAM error code

- **MSAL_wam_cancel_ui_timeout** - Status of WAM UI cancelation timer. If value is present, and error occurred in shutting down WAM

- **MSAL_wam_telemetry** - Contains a batch of WAM telemetry data in a JSON string that will be parsed and converted to the fields in this document that are sourced from WAM.

- **MSAL_was_request_throttled** - True if MSAL throttled this request and prevented it from hitting network. If this is ever true, there's most likely a loop in the calling app.

- **MSAL_write_account_status** - If there's an error writing to disk during an account cache, the error context goes here (Ex: Same as write_token_error)

- **MSAL_write_token** - Tokens that were written to cache (AT, ART, FRT, LRT, IRT, PRT, EAT [EAT = Expired AT was read, but discarded]).

- **MSAL_write_token_last_error** - If MSAL encountered an error writing to cache, we'll store info here. (Ex: Disk read error bubbled from OS, Keychain error on macOS).

- **oneauth_api** - OneAuth API invoked for this authentication attempt.

- **oneauth_transactionuploadid** - GUID specifying an individual call to the OneAuth API.

- **oneauth_version** - The version of the OneAuth SDK.

- **Platform** - OS Platform (0: Windows Desktop, 1: Android, 2: iOS, 3: macOS, 4: UWP)

- **Promptreasoncorrelationid** - A correlation identifier that can be used to look up a previous authentication event, which is used to explain why the user was prompted to authenticate.

- **Resource** - The resource for which a token is requested.

- **Scenarioid** - Multiple events may belong to a single scenario, for example, the scenario may be adding a new account but there are multiple prompts that occur as part of that scenario. This identifier enables correlation of those related events. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Scenarioname** - Name of the application scenario where authentication was required, for example, first-boot, licensing check, etc.

- **Scope** - The scope for which a token is requested.

- **Sdkver** - Version of Microsoft Auth Telemetry System library used to produce this data

- **Sessionid** - Identifier for the boot session

- **Starttime** - Time at which the authentication event began.

- **Tenantid** - GUID identifying the tenant the authenticated user belongs to (in non-ADAL cases)

- **Uploadid** - Unique GUID for this event, used for de-duping

- **wamapi** - Identifies which Windows Web Account Management (WAM) API is called

- **wamtelemetrybatch** - Currently unused. In the future, allows the WAM component to dispatch additional information regarding the authentication event

- **WAM_account_join_on_end** - Account join state at the end of a WAM operation.  Possible values: “primary”, “secondary”, “not_joined”

- **WAM_account_join_on_start** - Account join state at the start of a WAM operation.  Possible values: “primary”, “secondary”, “not_joined”

- **WAM_api_error_code** - If an error response came from the Microsoft Entra WAM plugin, this field will exist and will contain that error code

- **WAM_authority** - String containing the authority url—this should be the login.windows.net endpoint used

- **WAM_broker_version** - Present if WAM was used, this is the broker version string

- **WAM_cache_event_count** - The number of WAM cache events within the operation

- **wam-cache-invalidated** - value indicating if WAM cache has been invalidated before token acquisition

- **WAM_cached_time_diff** - number indicating number of seconds since was response was created/cached.

- **WAM_client_binary_version** - Binary version of the Microsoft Account Web Account Management client.

- **WAM_client_id** - Identifier for joining with services data, this identifies the client application.

- **WAM_correlation_id** - Identifier for joining events with services data

- **WAM_device_join** - The device join state; possible values are “aadj”, “haadj”

- **WAM_network_event_count** - Present if at least one network call happened; the number of network calls to the service for that WAM operation

- **WAM_network_status** - Present if at least one network call happened, contains an HTTP error code if the network request failed.

- **WAM_idp** - Specifies if the WAM consumer or organizational auth plugin was used.

- **WAM_is_cached** - Specifies if the response provided by WAM was retrieved from cache.

- **WAM_oauth_error_code** - Contains the error code returned by the service as part of the oauth protocol.

- **WAM_prompt_behavior** - Specifies if this prompt is forced by the app, or, if this request might skip prompting if it can silently authenticate.

- **WAM_provider_id** - Specifies the Microsoft endpoint for the authority in use for the auth scenario.

- **WAM_redirect_uri** - The redirect URI registered for the application in Microsoft Entra ID.

- **WAM_resource** - The resource for which a token is requested.

- **WAM_scope** - The scope requested by the client which the token must work for.

- **WAM_server_error_code** - The error code returned by the service to WAM.

- **WAM_server_sub_code** - An additional error code used to further break down the causes for failure, returned by the service.

- **WAM_silent_bi_sub_code** - Sub-error providing deeper fidelity into the api error code

- **WAM_silent_code** - The error code encountered by the internal silent attempt WAM makes, prior to prompting the user.

- **WAM_silent_mats** - Unused.  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **WAM_silent_message** - The error message associated with the internal silent attempt WAM makes, prior to prompting the user.

- **WAM_silent_status** - The success/fail status for the internal silent attempt WAM makes, prior to prompting the user.

- **WAM_tenant_id** - An identifier for the tenant the authenticated Microsoft Entra user belongs to, if returned by the service

- **WAM_ui_allowed** - Whether the user may be prompted for Microsoft Account credentials if silent token acquisition fails.

- **WAM_ui_visible** - Present if at least one UI window was shown to the user, either ‘true’ or ‘false’

- **WAM_wam_account_on_end** - The status of the connected account after the flow has concluded.

- **WAM_wam_account_on_start** - The status of the connected account as the flow is beginning.

- **WAM_wam_blob_version** - Version of the Web Account Management telemetry json batch.

- **WAM_web_flow_result** - Error code from prompting the user for their Microsoft Account credentials.

- **WAM_x_ms_clitelem** - Present if service returns header “x-ms-clitelem"



### Office.MATS.OneAuth.TransactionMicrosoftOfficeAndroid

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. This event is a parent of one or more ActionMicrosoftOfficeAndroid events, allowing related events to be grouped together. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an authentication token from the service, or have entered a broken authentication state.

- Evaluate when changes occur on the client or services, whether they result in critical regressions in the user's authentication experience and reliability

- When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

- These signals power various ship readiness and health monitors which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical failures.

The following fields are collected:

- **Actiontype** - "oneauthtransaction" is the only value.

- **Appaudience** - Application audience (Automation, Preproduction or Production)

- **Appname** - App name

- **Appver** - App version

- **Authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

- **Correlationid** - Identifier used to join information regarding this individual event with services data

- **Count** - Number of times the error occurred

- **Devicenetworkstate** - Device network state

- **Deviceprofiletelemetryid** - Device profile telemetry ID (string used by MATS to identify a specific device)

- **duration_max** - Minimum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_min** - Maximum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_sum** - Sum of durations, in milliseconds, of the transactions aggregated on this signal.

- **Endtime** - Time at which the OneAuth transaction ended.

- **Error** - OneAuth status code.

- **Eventtype** - Event type

- **Issilent** - False if UI was shown; true if it was a background event.

- **oneauth_AadAccountCount** - Shows the count of unique Microsoft Entra accounts in the device.

- **oneauth_Activeflights**- The list of flights that are active in the session, used for AB testing.

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_Domain** - If the API call resulted in an error, this is the system domain of that error.

- **oneauth_ErrorCode** - Error code representing the internal error state for OneAuth. Replaces the old oneauth_errortag field.

- **oneauth_errortag** - Numerical identifier for a line of code that was responsible for generating an error.

- **oneauth_ExecutionFlow** - A series of tags identifying the codepath this API invocation took.

- **oneauth_GenericAccountCount** - Shows the count of unique generic accounts in the device.

- **oneauth_internalerror** - Error code representing the internal error state for OneAuth.

- **oneauth_MsaAccountCount** - Shows the count of unique generic accounts in the device.

- **oneauth_Optional** - OneAuth optional diagnostics.

- **oneauth_PublicStatus** - Contains the public status of the OneAuth API call that this transaction pertains to.

- **oneauth_ServerErrorCode** - The server error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_SubStatus** - Integer code returned when there's a user impacting issue; indicates reason for the failure (e.g., UserPasswordExpired = 6005, EnterProductKey = 6301, etc.)

- **oneauth_SystemErrorCode** - The system error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_Tag** - The OneAuth tag designating the final place in code reached at the conclusion of this API call.

- **oneauth_transactionuploadid** - Specifies the randomly-generated internal GUID that maps to the specific invocation of a OneAuth API. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **oneauth_version** - The version of the OneAuth SDK.

- **Platform** - OS Platform (0: Win32, 1: Android, 2: iOS, 3: macOS, 4: WinRT)

- **Scenarioname** - Name of the scenario for which auth is necessary, specified by the calling application.

- **Schemaver** - Schema Version

- **Sdkver** - Version of the MATS sdk

- **Sessionid** - Session ID

- **severityError** - severity

- **sovereignty** - National cloud: a physically isolated instance of Azure (Global, Germany, China, US Government)

- **starttime** - Time at which the OneAuth transaction began.

- **Timestamp** - Timestamp

- **Type** - Error type

- **Uploaded** - Unique identifier for this particular event, for de-duping purposes.


### Office.MATS.OneAuth.TransactionMicrosoftOfficeiOS

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. This event is a parent of one or more ActionMicrosoftOfficeiOS events, allowing related events to be grouped together. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an auth token or are in a broken auth state
- Identify critical regressions in the user's auth experience when there are changes on the client or services. This includes powering alerts so engineers can mitigate quickly
- Failure signals emit important error codes from the responsible component used for triage, diagnosis and mitigation

The following fields are collected:  

- **actiontype** - "oneauthtransaction" is the only value.

- **appaudience** - Application audience (Automation, Preproduction or Production)

- **appid** - The ID of the application used for credential storage isolation.

- **appname** - App name

- **appver** - App version

- **authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

- **correlationid** - Identifier used to connect information regarding this individual event with services data

- **count** - The total number of aggregated transactions reported in this one data event.

- **devicenetworkstate** - Device network state

- **deviceprofiletelemetryid** - Device profile telemetry ID (string used by MATS to identify a specific device)

- **duration_max** - Minimum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_min** - Maximum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_sum** - Sum of durations, in milliseconds, of the transactions aggregated on this signal.

- **endtime** - Time at which the OneAuth transaction ended.

- **error** - OneAuth status code.

- **eventtype** - Event type

- **issilent** - False if UI was shown; true if it was a background event.

- **oneauth_AadAccountCount** - Shows the count of unique Microsoft Entra accounts in the device.

- **oneauth_ActiveFlights** - Lists all the flights that are active during the transaction.

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_Domain** - If the API call resulted in an error, this is the system domain of that error.

- **oneauth_ErrorCode** - Error code representing the internal error state for OneAuth. Replaces the old oneauth_errortag field.

- **oneauth_errortag** - Numerical identifier for a line of code that was responsible for generating an error.

- **oneauth_ExecutionFlow** - A series of tags identifying the code path that this API invocation took.

- **oneauth_GenericAccountCount** - Shows the count of unique generic accounts in the device.

- **oneauth_internalerror** - Error code representing the internal error state for OneAuth.

- **oneauth_MsaAccountCount** - Shows the count of unique MSA accounts in the device.

- **oneauth_Optional** - OneAuth optional diagnostics.

- **oneauth_PublicStatus** - Contains the public status of the OneAuth API call that this transaction pertains to.

- **oneauth_ServerErrorCode** - The server error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_SubStatus** - Integer code returned when there's a user impacting issue; indicates reason for the failure (e.g., UserPasswordExpired = 6005, EnterProductKey = 6301, etc.)

- **oneauth_SystemErrorCode** - The system error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_Tag** - The OneAuth tag designating the final place in code reached at the conclusion of this API call.

- **oneauth_version** - The version of the OneAuth SDK.

- **platform** - OS Platform (0: Win32, 1: Android, 2: iOS, 3: MacOS, 4: WinRT

- **scenarioname** - Name of the scenario for which auth is necessary, specified by the calling application.

- **schemaver** - Schema Version

- **sdkver** - Version of the MATS sdk

- **sessionid** - Session ID

- **severity** - Error severity

- **sovereignty** - National cloud: a physically isolated instance of Azure (Global, Germany, China, US Government)

- **starttime** - Time at which the OneAuth transaction began.

- **telemetryregion** - Describes the country or region that the user account belongs to, for the purpose of telemetry routing.

- **timestamp** - Timestamp

- **type** - Error type

- **uploadid** - Unique identifier for this particular event, for de-duping purposes.

### Office.MATS.OneAuth.TransactionMicrosoftOfficeMac

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. This event is a parent of one or more ActionMicrosoftOfficeMac events, allowing related events to be grouped together. These events help our users avoid entering broken authentication states by:

-	Identifying whether clients can successfully obtain an auth token or are in a broken auth state
-	Identify critical regressions in the user's auth experience when there are changes on the client or services. This includes powering alerts so engineers can mitigate quickly
-	Failure signals emit important error codes from the responsible component used for triage, diagnosis, and mitigation

The following fields are collected:

- **actiontype** - "oneauthtransaction" is the only value.

- **appaudience** - Application audience (Automation, Preproduction or Production)

- **appid** - The ID of the application used for credential storage isolation.

- **appname** - App name

- **appver** - App version

- **authoutcome** - Did the authentication attempt succeed, fail, or was cancelled

- **correlationid** - Identifier used to join information regarding this individual event with services data

- **count** - The total number of aggregated transactions reported in this one data event.

- **devicenetworkstate** - Device network state

- **deviceprofiletelemetryid** - Device profile telemetry ID (string used by MATS to identify a specific device)

- **duration_max** - Minimum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_min** - Maximum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_sum** - Sum of durations, in milliseconds, of the transactions aggregated on this signal.

- **endtime** - Time at which the OneAuth transaction ended.

- **error** - OneAuth status code.

- **eventtype** - Event type

- **issilent** - False if UI was shown; true if it was a background event.

- **oneauth_AadAccountCount** - Shows the count of unique Microsoft Entra accounts in the device.

- **oneauth_ActiveFlights** - Lists all the flights that are active during the transaction.

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_Domain** - If the API call resulted in an error, this is the system domain of that error.

- **oneauth_ErrorCode** - Error code representing the internal error state for OneAuth. Replaces the old oneauth_errortag field.

- **oneauth_errortag** - Numerical identifier for a line of code that was responsible for generating an error.

- **oneauth_ExecutionFlow** - A series of tags identifying the codepath this API invocation took.

- **oneauth_GenericAccountCount** - Shows the count of unique generic accounts in the device.

- **oneauth_internalerror** - Error code representing the internal error state for OneAuth.

- **oneauth_MsaAccountCount** - Shows the count of unique MSA accounts in the device.

- **oneauth_Optional** - OneAuth optional diagnostics.

- **oneauth_PublicStatus** - Contains the public status of the OneAuth API call that this transaction pertains to.

- **oneauth_ServerErrorCode** - The server error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_SystemErrorCode** - The system error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_Tag** - The OneAuth tag designating the final place in code reached at the conclusion of this API call.

- **oneauth_version** - The version of the OneAuth SDK.

- **platform** - OS Platform (0: Win32, 1: Android, 2: iOS, 3: MacOS, 4: WinRT

- **scenarioname** - Name of the scenario for which auth is necessary, specified by the calling application.

- **schemaver** - Schema Version

- **sdkver** - Version of the MATS Software Developer Kit (SDK)

- **sessionid** - Session ID

- **severity** - Error severity

- **sovereignty** - National cloud: a physically isolated instance of Azure (Global, Germany, China, US Government)

- **starttime** - Time at which the OneAuth transaction began.

- **telemetryregion** - Describes the country or region that the user account belongs to, for the purpose of telemetry routing.

- **timestamp** - Timestamp

- **type** - Error type

- **uploadid** - Unique identifier for this particular event, for de-duping purposes.


### Office.MATS.OneAuth.TransactionMicrosoftOfficeWin32

Microsoft Auth Telemetry System (MATS) is collected when Office attempts to acquire an authentication token, either silently or through prompting. This event is a parent of one or more ActionMicrosoftOffice events, allowing related events to be grouped together. These events help our users avoid entering broken authentication states by:

- Identifying whether clients can successfully obtain an authentication token from the service, or have entered a broken authentication state.

- Evaluate when changes occur on the client or services, whether they result in critical regressions in the user's authentication experience and reliability

- When failures occur, these signals emit important failure codes from the responsible component (Office client code, authentication libraries, or authority services) which can be used for triage, diagnosis and mitigation

- These signals power various ship readiness and health monitors, which fire alerts so our engineers can engage quickly and reduce the time to mitigation of critical failures.

The following fields are collected:

- **Actiontype** - "oneauthtransaction" is the only value.

- **Appaudience** - Application audience (Automation, Preproduction, or Production)

- **Appname** - App name

- **Appver** - App version

- **Authoutcome** - Did the authentication attempt succeed, fail, or was canceled

- **Correlationid** - Identifier used to join information regarding this individual event with services 
data

- **Count** - Number of times the error occurred

- **Devicenetworkstate** - Device network state

- **Deviceprofiletelemetryid** - Device profile telemetry ID (string used by MATS to identify a 
specific device)

- **duration_max** - Minimum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_min** - Maximum duration, in milliseconds, of the transactions aggregated on this signal.

- **duration_sum** - Sum of durations, in milliseconds, of the transactions aggregated on this signal.

- **Endtime** - Time at which the OneAuth transaction ended.

- **Error** - OneAuth status code.

- **Eventtype** - Event type

- **Issilent** - False if UI was shown; true if it was a background event.

- **oneauth_Activeflights** - The list of flights that are active in the session, used for AB testing.

- **oneauth_api** - Specifies the public API of OneAuth that was invoked.

- **oneauth_Domain** - If the API call resulted in an error, this is the system domain of that error.

- **oneauth_ErrorCode** - Error code representing the internal error state for OneAuth. Replaces the old oneauth_errortag field.

- **oneauth_errortag** - Numerical identifier for a line of code that was responsible for generating an error.

- **oneauth_ExecutionFlow** - A series of tags identifying the codepath this API invocation took.

- **oneauth_internalerror** - Error code representing the internal error state for OneAuth.

- **oneauth_ServerErrorCode** - The server error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_SubStatus** - Integer code returned when there's a user impacting issue; indicates reason for the failure (e.g., UserPasswordExpired = 6005, EnterProductKey = 6301, etc.)

- **oneauth_SystemErrorCode** - The system error returned to OneAuth at the conclusion of this API call, if one was encountered.

- **oneauth_Tag** - The OneAuth tag designating the final place in code reached at the conclusion of this API call.

- **oneauth_transactionuploadid** - Specifies the randomly generated internal GUID that maps to the specific invocation of a OneAuth API.

- **oneauth_version** - The version of the OneAuth SDK.

- **Platform** - OS Platform (0: Win32, 1: Android, 2: iOS, 3: macOS, 4: WinRT

- **Scenarioname** - Name of the scenario for which auth is necessary, specified by the calling application.

- **Schemaver** - Schema Version

- **Sdkver** - Version of the MATS sdk

- **Sessionid** - Session ID

- **severityError** - severity

- **starttime** - Time at which the OneAuth transaction began.

- **Timestamp** - Timestamp

- **Type** - Error type

- **Uploaded** - Unique identifier for this particular event, for de-duping purposes.

### Office.Outlook.Mac.AddAccountConfigSession

This event is triggered when a user tries to add their account into Outlook Mac. The data from this event is used to build the user action funnel in the "add account session."

The following fields are collected:

- **AccountCount** - Total account number

- **AccountFlowSessionIdentifier** - UUID to track the “add account” session

- **Activation Type** - Client activated license type

- **CommercialAccountCount** - Total commercial account number

- **ConfigurePhase** - The current phase the user is in, in the “add account” process

- **DaysPassedOnDevice** - How many days have passed since the app was installed on device

- **EntryPoint** - The entry point to add the account

- **EUPlacementPref** - Account's EU Placement preference

- **HasCommercialAccount** - Is there any commercial account

- **HasCompletedFirstRun** - Has app completed first run before going through this session

- **HasEUPlacementPref** - If the account has EU placement preference set

- **HasPremiumAccount** - Is there any paid account

- **InstallSource** - Where the client is installed from

- **IsAADC** - Is there any account that hasn't passed the age eligibility check

- **IsAppStoreSKU** - Is the account downloaded from Apple App store

- **IsFreenix** - Is the client in freenix mode

- **IsFRESession** - Is the session a first run time experience

- **IsLicensed** - Is the client licensed

- **IsPreview** - Is the client in Phoenix mode

- **IsSessionAdsEligible** - Is the client eligible for Ads

- **IsSessionAdsSupported** - Is the Ads supported by the client

- **License Type** - Client license type

- **PremiumAccountsCount** - Total premium account number

- **Result** - Add account session is successful

- **ServiceProviderType** - What is the current sync type of the account

- **SourceTagDescription** - The description of the current event

- **SyncType** - What is the current sync type of the account

### OneNote.SignIn.SSOExternalAppsAccountFound
 
This event is logged when an account with a valid refresh token is found among the list of accounts provided by TokenSharingManager.  This scenario is specific to Single Sign-on (SSO).
 
The following fields are collected:
 
- **AccountType** - Logs the type of account

- **ProviderPackageID** - Logs the package ID of the app that provided this account

### OneNote.SignIn.SSOExternalAppsInvalidAccount

This event is logged when there was an error when attempting to obtain a refresh token for an account in the list of accounts provided by TokenSharingManager. This scenario is specific to Single Sign-on (SSO)
 
The following fields are collected:
 
- **RawError** - Logs the raw error obtained when attempting to get a refresh token with the given account

### OneNote.StickyNotes.FetchTokenCompleted
 
This event is logged post authentication, once fetching of refresh token is completed.
 
The following fields are collected:
 
- **ErrorMessage** - If fetching of token failed, this would log the error message 

- **Result** - Logs the result of token fetching attempt

- **StickyNoteAccountType** - Logs type of the account for which the app was trying to fetch refresh token


## Click-to-Run events

### Office.ClickToRun.Bootstrapper 

Office set up and inventory data collected when the user is running Office setup.exe to modify their installed Office products. Used to measure success / failure of a full user-initiated Office installation including pre-requisite checks.

The following fields are collected:

  - **Data\_BootStrapperStateFailure\_ErrorCode** – The error code we failed with

  - **Data\_BootStrapperStateFailure\_ErrorSource** – The function we failed in

  - **Data\_BootStrapperStateFailure\_FailingState** – The part that we failed in the boostrapperbootstrapper

  - **Data\_BootStrapperStateFailure\_OExceptionType** – The type of exception we failed with

  - **Data\_Culture** - the culture we're running this exe with, i.e. en-us

  - **Data\_HashedOLSToken** - a sha-256 hash of a token the OLS service gives us

  - **Data\_Platform** - x64 or x86 install

  - **Data\_PrereqFailure\_Type** – The prerequisite failure we hit, i.e. the operating system isn't supported

  - **Data\_ProductReleaseId** - Product we're installing, i.e. Microsoft 365 Apps for enterprise

### Office.ClickToRun.CorruptionCheck

Office set up and inventory data collected when Click-to-Run client is running a corruption check to make sure that Office binaries are correct. Used to measure corruption of Office binaries, and which binaries are corrupt.

The following fields are collected:

  - **Data\_Active -** The current stream manifest we're checking on disk

  - **Data\_ActivePackages -** what packages the manifest contains

  - **Data\_ActiveVersion -** the version of the manifest

  - **Data\_AddFileCount -** how many files we're adding

  - **Data\_AddFileFiles -** a sample of the files we're adding

  - **Data\_CompressionLevel -** how the files are compressed

  - **Data\_CorruptionCheckLevel -** how deeply we're checking for corruption, stages

  - **Data\_CorruptSizeCount -** how many files have a corrupt size

  - **Data\_CorruptSizeFiles -** a sample of the files that have a corrupted size

  - **Data\_CorruptVersionCount -** how many files have a corrupted version

  - **Data\_CorruptVersionFiles -** a sample of the files that have a corrupted version

  - **Data\_FileBadDigestCount -**how many files we failed to open

  - **Data\_FileBadDigestFiles -** a sample of the files that we were unable to open

  - **Data\_FileNotSignedCount -** have many files that aren't signed

  - **Data\_FileNotSignedFiles -** a sample of the files that aren't signed

  - **Data\_FileNotTrustedCount -** how many files aren't trusted

  - **Data\_FileNotTrustedFiles -** a sample of the files that we don't trust

  - **Data\_IncompleteFileCount -** how many files seem to be incomplete

  - **Data\_IncompleteFileFiles -** a sample of the files that are incomplete

  - **Data\_KeepFileCount -** how many files we're not doing anything to

  - **Data\_KeepFileFiles -** a sample of files we're keeping

  - **Data\_KeepIncompleteFileCount -** how many files we're not changing despite them being incomplete

  - **Data\_KeepIncompleteFileFiles -** a sample of the files we're keeping that are incomplete

  - **Data\_MismatchSizeCount -** how many files have a size that doesn't match our manifest

  - **Data\_MismatchSizeFiles -** a sample of the files that are mismatched in size

  - **Data\_MismatchVersionCount -** how many files that have a version different than our manifest

  - **Data\_MismatchVersionFiles -** a sample of the files that have mismatched versions

  - **Data\_MissingFileCount -** how many files seem to be missing

  - **Data\_MissingFileFiles -** a sample of the files that are missing

  - **Data\_NotToBeStreamedFileCount -** how many files we're not streaming

  - **Data\_RemoveFileCount -** how many files we're removing

  - **Data\_RemoveFileFiles -** a sample of the files we're removing

  - **Data\_StreamUnitsMismatchCount -** how many files have units that don't match the manifest

  - **Data\_StreamUnitsMismatchFiles -** a sample of the files that have a stream with units mismatched

  - **Data\_TimeElapsed -** how long we took to check for corruption

  - **Data\_UpdateFileCount -** how many files we're updating

  - **Data\_UpdateFileFiles -** a sample of the files we're adding

  - **Data\_Working -** the new manifest we're checking

  - **Data\_WorkingVersion -** the version of the new manifest

### Office.ClickToRun.MachineMetadata

Office set up and inventory data that provides necessary metadata for setup and inventory and is used to determine an accurate install base.

The following fields are collected:

  - **Data\_C2RClientVer** – The version of OfficeClickToRun.exe on the machine

  - **Data\_OfficeBitness** – The bitness that Office is installed in, x86 or x64

  - **Data\_OfficeVersion** - The version Office is installed in

  - **Data\_Sku** - The SKU that's installed, i.e. Microsoft 365 Apps for enterprise

  - **Data\_SqmMachineID** – Unique Machine ID used by Windows SQM Data\_SusClientID- Machine Office update identifier

### Office.ClickToRun.ODT

Office set up and inventory data collected when an IT Admin is running the Office Deployment Tool Click-to-Run setup.exe to modify their users' installed Office products. It's used to measure success / failure of full IT Admin initiated Office installations including pre-requisite checks.

The following fields are collected:

  - **Data\_BootStrapperStateFailure\_ErrorCode-** The error code we failed with

  - **Data\_BootStrapperStateFailure\_ErrorSource-** The function we failed in

  - **Data\_BootStrapperStateFailure\_FailingState-** The part that we failed in the boot-strapper

  - **Data\_BootStrapperStateFailure\_OExceptionType-** The type of exception we failed with

  - **Data\_ConfigurationHost-** The host where the configuration.xml came from

  - **Data\_ConfigurationId-** The ID we get from a configuration.xml

  - **Data\_ConfigurationSource-** We the configuration.xml came from

  - **Data\_Culture-** the culture we're running this exe with, i.e. en-us

  - **Data\_HashedOLSToken-** a sha-256 hash of a token the OLS service gives us

  - **Data\_MigrateArchRequest-** If we're migrating the user from x86 to x64 or vice-versa

  - **Data\_MigrateArchRequestValid-** If we believe the migrate request is valid

  - **Data\_Platform-** x64 or x86 install

  - **Data\_PlatformMigratedFrom-** Starting platform, i.e. x86

  - **Data\_PlatformMigratedTo-** Ending platform, i.e. x64

  - **Data\_PrereqFailure\_Type-** The prerequisite failure we hit

  - **Data\_ProductReleaseId-** Product we're installing, i.e. Microsoft 365 Apps for enterprise

### Office.ClickToRun.RepomanLogger

Reports on the status for the new Click-to-Run update pipeline ("Repoman") and if it successfully downloads and applies Office updates.

The following fields are collected:

  - **ApplySucceeded -** True if the pipeline successfully applied an Office update, false if not.
  
  - **DownloadSucceeded -** True if the pipeline successfully downloaded an Office update, false if not.

  - **ErrorCode -** The code of the last error that occurred in the Click-to-Run Repoman pipeline.

  - **ErrorDetails -**  Additional error details of the last error that occurred in the Click-to-Run Repoman pipeline.
 
  - **ErrorMessage -** The message of the last error that occurred in the Click-to-Run Repoman pipeline.

  - **OpenStreamSessionSucceeded -** True if the pipeline successfully creates a session for streaming an Office update, false if not.

  - **RepomanErrorMessage -** The error message received from the repoman.dll.
 

### Office.ClickToRun.Scenario.InstallTaskConfigure

Office set up and inventory data collected when the Office installer is placing newly downloaded files. Used to measure the success / failure of an Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled -** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove -** what Office products we're removing 

  - **Data\_RemovingFixedProducts -** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID -** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskConfigurelight

Office set up and inventory data collected when the Office installer is deciding which files need to be downloaded. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -**What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -**what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-**Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskFinalintegrate

Office set up and inventory data collected when the Office installer is installing licenses and registry settings. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we're updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled -** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion  -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove -** what Office products we're removing 

  - **Data\_RemovingFixedProducts -** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskFonts

Office set up and inventory data collected when the Office installer is installing fonts. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -**what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID   -** Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskInitupdates

Office set up and inventory data collected when the Office installer is creating settings for updates to work properly. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID –-**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskIntegrateinstall

Office set up and inventory data collected when the Office installer is creating registry entries for the Office applications Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we're updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskLastrun

Office set up and inventory data collected when Office installer is finishing the installation, pinning shortcuts and creating final registry settings. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we're updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-**  what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskMigrate

Office set up and inventory data collected when the Office Installer is migrating settings from older versions of Office. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we're updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts -** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName  -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-**  Machine Office update identifier

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskPublishrsod

Office set up and inventory data collected when the Office installer is publishing the virtual registry for the AppV virtualization layer. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -** What version of Office 15 we're updating to

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running, i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -** Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.InstallTaskRemoveinstallation2

*[This event was previously named Office.ClickToRun.Scenario.InstallTaskRemoveinstallation.]*

This event collects Office set up and inventory data when the Office uninstaller is removing parts of Office from the user's device. The data is used to measure success or failure of Office installation.

The following fields are collected:

- **Data_15_SourceType** - Where the Office 15 source is located, i.e., CDN, Content Delivery Network, or Local 

- **Data_15_UpdatesEnabled** - If Office 15 updates are enabled 

- **Data_15_UpdateVersion** - What version of Office 15 we’re updating to 

- **Data_15_Version** - The Office 15 version 

- **Data_16_SourceType** - Where the Office 16 source is located i.e., CDN or Local 

- **Data_16_UpdatesEnabled** - If Office 16 updates are enabled 

- **Data_16_UpdateVersion** - What version of Office 16 we’re updating to 

- **Data_16_Version** - The Office 16 version 

- **Data_AddingFixedProducts** - The products we’re adding 

- **Data_AddingProducts** - What products we’re asked to add 

- **Data_CompletionState** - If we completed the task

- **Data_ErrorCode** -The error code we failed with 

- **Data_ErrorDetails** - Extra details about an error 

- **Data_ErrorMessage** - An error message on what went wrong 

- **Data_ErrorSource** - Where the error took place 

- **Data_ExceptionType** - The exception we failed with 

- **Data_IsErrorCodeIgnorable** - If the error code we failed with is ignorable 

- **Data_IsErrorCodeIgnorableForScenarioHealth** - If we believe the error code is ignorable 

- **Data_NewestPackageVersion** - The newest version of Office on the machine 

- **Data_OldestPackageVersion** - The oldest version of Office on the machine 

- **Data_ProductsToAdd** - What Office products we're adding 

- **Data_ProductsToRemove** - What Office products we’re removing 

- **Data_RemovingFixedProducts** - The products we're removing 

- **Data_RemovingProducts** - The products we’re asked to remove 

- **Data_ScenarioInstanceID** - A unique GUID for the running scenario 

- **Data_ScenarioName** - What scenario is running. i.e., install 

- **Data_ScenarioSubType** - What type of scenario we’re running, i.e., Uninstall, reinstall 

- **Data_SourceType** - Where our source is, i.e., CDN 

- **Data_SqmMachineID** - Unique Machine ID used by Windows SQM

- **Data_SusClientID** - Machine Office update identifier 

- **Data_TaskState** - What state the task is in like running or cancelled 

- **Data_TotalClientCabSize** - The size of our client cab 

- **Data_TriggeringUI** - What triggered the UI 

- **Data_UpdatesEnabled** - If Office updates are enabled 

- **Data_Version** - The version of Office 


### Office.ClickToRun.Scenario.InstallTaskStream2

*[This event was previously named Office.ClickToRun.Scenario.InstallTaskStream.]*

Office set up and inventory data collected when the Office installer is downloading new files for Office. The data is used to measure success or failure of Office installation.

The following fields are collected:

- **Data_15_SourceType** - Where the Office 15 source is located, i.e., CDN, Content Delivery Network, or Local 

- **Data_15_UpdatesEnabled** - If Office 15 updates are enabled 

- **Data_15_UpdateVersion** - What version of Office 15 we’re updating to 

- **Data_15_Version** - The Office 15 version 

- **Data_16_SourceType** - Where the Office 16 source is located i.e., CDN or Local 

- **Data_16_UpdatesEnabled** - If Office 16 updates are enabled 

- **Data_16_UpdateVersion** - What version of Office 16 we’re updating to 

- **Data_16_Version** - The Office 16 version 

- **Data_AddingFixedProducts** - The products we’re adding 

- **Data_AddingProducts** - What products we’re asked to add 

- **Data_CompletionState** - If we completed the task

- **Data_ErrorCode** - The error code we failed with 

- **Data_ErrorDetails** - Extra details about an error 

- **Data_ErrorMessage** - An error message on what went wrong 

- **Data_ErrorSource** - Where the error took place 

- **Data_ExceptionType** - The exception we failed with 

- **Data_IsErrorCodeIgnorable** - If the error code we failed with is ignorable 

- **Data_IsErrorCodeIgnorableForScenarioHealth** - If we believe the error code is ignorable 

- **Data_NewestPackageVersion** - The newest version of Office on the machine 

- **Data_OldestPackageVersion** - The oldest version of Office on the machine 

- **Data_ProductsToAdd** - What Office products we’re adding 

- **Data_ProductsToRemove** - what Office products we’re removing 

- **Data_RemovingFixedProducts** - The products we’re removing 

- **Data_RemovingProducts** - The products we’re asked to remove 

- **Data_ScenarioInstanceID** - A unique GUID for the running scenario 

- **Data_ScenarioName** - what scenario is running. i.e., install 

- **Data_ScenarioSubType** - What type of scenario we’re running, i.e., Uninstall, reinstall 

- **Data_SourceType** - Where our source is, i.e., CDN 

- **Data_SqmMachineID** - Unique Machine ID used by Windows SQM 

- **Data_SusClientID** - Machine Office update identifier 

- **Data_TaskState** - What state the task is in like running or cancelled 

- **Data_TotalClientCabSize** - The size of our client cab 

- **Data_TriggeringUI** - What triggered the UI 

- **Data_UpdatesEnabled** - If Office updates are enabled 

- **Data_Version** - The version of Office 


### Office.ClickToRun.Scenario.InstallTaskUninstallcentennial

Office set up and inventory data collected when the Office installer is uninstalling a previous version of Office installed from the Store. Used to measure success / failure of Office installation.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskFinalintegrate

Office set up and inventory data collected when the Office repair client republishes .msi files and Office extensions. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion-**  What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskFullrepair2

*[This event was previously named Office.ClickToRun.Scenario.RepairTaskFullrepair.]*

Office set up and inventory data collected when the Office repair client downloads the latest version of the Click-to-Run client to prepare the computer for uninstall and reinstall. The data is used to measure success or failure of Office repair.

The following fields are collected:

- **Data_15_SourceType** - Where the Office 15 source is located, i.e., CDN, Content Delivery Network, or Local 

- **Data_15_UpdatesEnabled** - If Office 15 updates are enabled 

- **Data_15_UpdateVersion** - What version of Office 15 we’re updating to 

- **Data_15_Version** - The Office 15 version 

- **Data_16_SourceType** - Where the Office 16 source is located i.e., CDN or Local 

- **Data_16_UpdatesEnabled** - If Office 16 updates are enabled 

- **Data_16_UpdateVersion** - What version of Office 16 we’re updating to 

- **Data_16_Version** - The Office 16 version 

- **Data_AddingFixedProducts** - The products we’re adding 

- **Data_AddingProducts** - What products we’re asked to add 

- **Data_CompletionState** - If we completed the task

- **Data_ErrorCode** - The error code we failed with 

- **Data_ErrorDetails** - Extra details about an error 

- **Data_ErrorMessage** - An error message on what went wrong 

- **Data_ErrorSource** - Where the error took place 

- **Data_ExceptionType** - The exception we failed with 

- **Data_IsErrorCodeIgnorable** - If the error code we failed with is ignorable 

- **Data_IsErrorCodeIgnorableForScenarioHealth** - If we believe the error code is ignorable 

- **Data_NewestPackageVersion** - The newest version of Office on the machine 

- **Data_OldestPackageVersion** - The oldest version of Office on the machine 

- **Data_ProductsToAdd** - What Office products we’re adding 

- **Data_ProductsToRemove** - what Office products we’re removing 

- **Data_RemovingFixedProducts** - The products we’re removing 

- **Data_RemovingProducts** - The products we’re asked to remove 

- **Data_ScenarioInstanceID** - A unique GUID for the running scenario 

- **Data_ScenarioName** - what scenario is running. i.e., install 

- **Data_ScenarioSubType** - What type of scenario we’re running, i.e., Uninstall, reinstall 

- **Data_SourceType** - Where our source is, i.e., CDN 

- **Data_SqmMachineID** - Unique Machine ID used by Windows

- **Data_SusClientID** - Machine Office update identifier 

- **Data_TaskState** - What state the task is in like running or cancelled 

- **Data_TotalClientCabSize** - The size of our client cab 

- **Data_TriggeringUI** - What triggered the UI 

- **Data_UpdatesEnabled** - If Office updates are enabled 

- **Data_Version** - The version of Office 


### Office.ClickToRun.Scenario.RepairTaskIntegraterepair

Office set up and inventory data collected when the Office repair client attempts to repair some known troublesome registry entries. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.RepairTaskRemoveinstallation

Office set up and inventory data collected when the Office repair client removes Office from the device to prepare for a reinstall when repairing. Used to measure success / failure of Office repair.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion  -**What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-**  what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskIntegrateupdate 

Office set up and inventory data collected when the Click-to-Run client updates licenses if necessary. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskPublishrsod

Office set up and inventory collected when the Click-to-Run client updates registry settings for new binaries. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-** Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdateapply

Office set up and inventory data collected when the Click-to-Run client shuts down running apps if needed and installs new files that were downloaded. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

  - **Data\_AvailableVersion to-** What version of Office is available to update

  - **Data\_CompletedWithoutActionInfo -** Why we didn't complete the scenario, i.e. Apps were open

  - **Data\_CompletionState -** If we completed the task

  - **Data\_CorruptionChecksOnly –-** If we're only checking for corruption and not updating

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-** what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install 

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID  -**  Unique Machine ID used by Windows SQM

  - **Data\_SusClientID-**  Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

  - **Data\_WorkstationLockState -** True if we think the computer is locked

### Office.ClickToRun.Scenario.UpdateTaskUpdateclientdownload2

*[This event was previously named Office.ClickToRun.Scenario.UpdateTaskUpdateclientdownload.]*

Office set up and inventory data collected when the Click-to-Run client downloads a newer version of itself. The data is used to measure success or failure of Office update.

The following fields are collected:

- **Data_15_SourceType** - Where the Office 15 source is located, i.e., CDN, Content Delivery Network, or Local 

- **Data_15_UpdatesEnabled** - If Office 15 updates are enabled 

- **Data_15_UpdateVersion** - What version of Office 15 we’re updating to 

- **Data_15_Version** - The Office 15 version 

- **Data_16_SourceType** - Where the Office 16 source is located i.e., CDN or Local 

- **Data_16_UpdatesEnabled** - If Office 16 updates are enabled 

- **Data_16_UpdateVersion** - What version of Office 16 we’re updating to 

- **Data_16_Version** - The Office 16 version 

- **Data_AddingFixedProducts** - The products we’re adding 

- **Data_AddingProducts** - What products we’re asked to add 

- **Data_CompletionState** - If we completed the task

- **Data_ErrorCode** - The error code we failed with 

- **Data_ErrorDetails** - Extra details about an error 

- **Data_ErrorMessage** - An error message on what went wrong 

- **Data_ErrorSource** - Where the error took place 

- **Data_ExceptionType** - The exception we failed with 

- **Data_IsErrorCodeIgnorable** - If the error code we failed with is ignorable 

- **Data_IsErrorCodeIgnorableForScenarioHealth** - If we believe the error code is ignorable 

- **Data_NewestPackageVersion** - The newest version of Office on the machine 

- **Data_OldestPackageVersion** - The oldest version of Office on the machine 

- **Data_ProductsToAdd** - What Office products we’re adding 

- **Data_ProductsToRemove** - what Office products we’re removing 

- **Data_RemovingFixedProducts** - The products we’re removing 

- **Data_RemovingProducts** - The products we’re asked to remove 

- **Data_ScenarioInstanceID** - A unique GUID for the running scenario 

- **Data_ScenarioName** - what scenario is running. i.e., install 

- **Data_ScenarioSubType** - What type of scenario we’re running, i.e., Uninstall, reinstall 

- **Data_SourceType** - Where our source is, i.e., CDN 

- **Data_SqmMachineID** - Unique Machine ID used by Windows SQM

- **Data_SusClientID** - Machine Office update identifier 

- **Data_TaskState** - What state the task is in like running or cancelled 

- **Data_TotalClientCabSize** - The size of our client cab 

- **Data_TriggeringUI** - What triggered the UI 

- **Data_UpdatesEnabled** - If Office updates are enabled 

- **Data_Version** - The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdatedetection

Office set up and inventory data collected when the Click-to-Run client checks if there's a new update available. Used to measure success / failure of Office update.

The following fields are collected:

  - **Data\_15\_SourceType -** Where the Office 15 source is located, i.e. CDN or Local 

  - **Data\_15\_UpdatesEnabled -** If Office 15 updates are enabled 

  - **Data\_15\_UpdateVersion -** What version of Office 15 we're updating to 

  - **Data\_15\_Version -** The Office 15 version 

  - **Data\_16\_SourceType -** Where the Office 16 source is located i.e. CDN or Local 

  - **Data\_16\_UpdatesEnabled-** If Office 16 updates are enabled 

  - **Data\_16\_UpdateVersion -** What version of Office 16 we're updating to 

  - **Data\_16\_Version -** The Office 16 version 

  - **Data\_AddingFixedProducts-** The products we're adding 

  - **Data\_AddingProducts -** What products we're asked to add 

  - **Data\_AvailableVersion -** What version of Office is available to update to

  - **Data\_ComAction -** An int representing a com action we're performing

  - **Data\_CompletedWithoutActionInfo -** Why we didn't complete the scenario, i.e. Apps were open

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

  - **Data\_ProductsToAdd -** What Office products we're adding 

  - **Data\_ProductsToRemove-**  what Office products we're removing 

  - **Data\_RemovingFixedProducts-** The products we're removing 

  - **Data\_RemovingProducts -** The products we're asked to remove 

  - **Data\_ScenarioInstanceID -** A unique GUID for the running scenario 

  - **Data\_ScenarioName -** what scenario is running. i.e. install

  - **Data\_ScenarioSubType -** What type of scenario we're running, i.e. Uninstall, reinstall 

  - **Data\_SourceType -** Where our source is, i.e. CDN 

  - **Data\_SqmMachineID -**  Unique Machine ID used by Windows SQM 

  - **Data\_SusClientID-**  Machine Office update identifier 

  - **Data\_TaskState -** What state the task is in like running or canceled 

  - **Data\_TotalClientCabSize -** The size of our client cab 

  - **Data\_TriggeringUI -** What triggered the UI 

  - **Data\_UpdatesEnabled -** If Office updates are enabled 

  - **Data\_Version -** The version of Office 

### Office.ClickToRun.Scenario.UpdateTaskUpdatedownload2

*[This event was previously named Office.ClickToRun.Scenario.UpdateTaskUpdatedownload.]*

Office set up and inventory data collected when the Click-to-Run client is downloading a new update. Used to measure success or failure of Office update.

The following fields are collected:

- **Data_15_SourceType** - Where the Office 15 source is located, i.e., CDN, Content Delivery Network, or Local 

- **Data_15_UpdatesEnabled** - If Office 15 updates are enabled 

- **Data_15_UpdateVersion** - What version of Office 15 we’re updating to 

- **Data_15_Version** - The Office 15 version 

- **Data_16_SourceType** - Where the Office 16 source is located i.e., CDN or Local 

- **Data_16_UpdatesEnabled** - If Office 16 updates are enabled 

- **Data_16_UpdateVersion** - What version of Office 16 we’re updating to 

- **Data_16_Version** - The Office 16 version 

- **Data_AddingFixedProducts** - The products we’re adding 

- **Data_AddingProducts** - What products we’re asked to add 

- **Data_AvailableVersion** - What version of Office is available to update to

- **Data_CompletedWithoutActionInfo** - Why we didn’t complete the scenario, i.e., Apps were open

- **Data_CompletionState** - If we completed the task

- **Data_CorruptionChecksOnly** - If we’re only checking for corruption and not updating

- **Data_ErrorCode** - The error code we failed with 

- **Data_ErrorDetails** - Extra details about an error 

- **Data_ErrorMessage** - An error message on what went wrong 

- **Data_ErrorSource** - Where the error took place

- **Data_ExceptionType** - The exception we failed with 

- **Data_FoundCorruptFiles** - True if we found corrupt files

- **Data_IsErrorCodeIgnorable** - If the error code we failed with is ignorable 

- **Data_IsErrorCodeIgnorableForScenarioHealth** - If we believe the error code is ignorable 

- **Data_NewestPackageVersion** - The newest version of Office on the machine 

- **Data_OldestPackageVersion** - The oldest version of Office on the machine 

- **Data_PackageOperationSuccessful** - True if we successfully completed our task on the Office package

- **Data_PipelineExitCode** - The exit code our file pipeline returned

- **Data_ProductsToAdd** - What Office products we’re adding 

- **Data_ProductsToRemove** - what Office products we’re removing 

- **Data_RemovingFixedProducts** - The products we’re removing 

- **Data_RemovingProducts** - The products we’re asked to remove 

- **Data_ScenarioInstanceID** - A unique GUID for the running scenario 

- **Data_ScenarioName** - what scenario is running. i.e., install 

- **Data_ScenarioSubType** - What type of scenario we’re running, i.e., Uninstall, reinstall 

- **Data_SourceType** - Where our source is, i.e., CDN 

- **Data_SqmMachineID** - Unique Machine ID used by Windows SQM 

- **Data_SusClientID** - Machine Office update identifier 

- **Data_TaskState** - What state the task is in like running or cancelled 

- **Data_TotalClientCabSize** - The size of our client cab 

- **Data_TriggeringUI** - What triggered the UI 

- **Data_UpdatesEnabled** - If Office updates are enabled 

- **Data_Version** - The version of Office


### Office.ClickToRun.Scenario.UpdateTaskUpdatefinalize2

*[This event was previously named Office.ClickToRun.Scenario.UpdateTaskUpdatefinalize.]*

Office set up and inventory data collected when the Click-to-Run Client is cleaning up from the update and restoring apps that were previously open. Used to measure success or failure of Office update.

The following fields are collected:

- **Data_15_SourceType** - Where the Office 15 source is located, i.e., CDN, Content Delivery Network, or Local 

- **Data_15_UpdatesEnabled** - If Office 15 updates are enabled 

- **Data_15_UpdateVersion** - What version of Office 15 we’re updating to 

- **Data_15_Version** - The Office 15 version 

- **Data_16_SourceType** - Where the Office 16 source is located i.e., CDN or Local 

- **Data_16_UpdatesEnabled** - If Office 16 updates are enabled 

- **Data_16_UpdateVersion** - What version of Office 16 we’re updating to 

- **Data_16_Version** - The Office 16 version 

- **Data_AddingFixedProducts** - The products we’re adding 

- **Data_AddingProducts** - What products we’re asked to add 

- **Data_CompletionState** - If we completed the task

- **Data_ErrorCode** - The error code we failed with 

- **Data_ErrorDetails** - Extra details about an error 

- **Data_ErrorMessage** - An error message on what went wrong 

- **Data_ErrorSource** - Where the error took place 

- **Data_ExceptionType** - The exception we failed with 

- **Data_IsErrorCodeIgnorable** - If the error code we failed with is ignorable 

- **Data_IsErrorCodeIgnorableForScenarioHealth** - If we believe the error code is ignorable 

- **Data_NewestPackageVersion** - The newest version of Office on the machine 

- **Data_OldestPackageVersion** - The oldest version of Office on the machine 

- **Data_ProductsToAdd** - What Office products we’re adding 

- **Data_ProductsToRemove** - what Office products we’re removing 

- **Data_RemovingFixedProducts** - The products we’re removing 

- **Data_RemovingProducts** - The products we’re asked to remove 

- **Data_ScenarioInstanceID** - A unique GUID for the running scenario 

- **Data_ScenarioName** - what scenario is running. i.e., install 

- **Data_ScenarioSubType** - What type of scenario we’re running, i.e., Uninstall, reinstall 

- **Data_SourceType** - Where our source is, i.e., CDN 

- **Data_SqmMachineID** - Unique Machine ID used by Windows SQM 

- **Data_SusClientID** - Machine Office update identifier 

- **Data_TaskState** - What state the task is in like running or cancelled 

- **Data_TotalClientCabSize** - The size of our client cab 

- **Data_TriggeringUI** - What triggered the UI 

- **Data_UpdatesEnabled** - If Office updates are enabled 

- **Data_Version** - The version of Office 


### Office.ClickToRun.Transport2

*[This event was previously named Office.ClickToRun.Transport.]*

This event is triggered whenever Click-To-Run tries to download a file that it needs for the Office install. The data is used to determine the success of the operation, type of download performed and diagnostic information.
 
The following fields are collected:

- **BytesFromGroupPeers** - Bytes from group peers, only for downloads using Delivery Optimization (DO)

- **BytesFromHttp** - Bytes from http, only for downloads using Delivery Optimization (DO) 

- **ByteFromInternetPeers** - Bytes from internet peers, only for downloads using Delivery Optimization (DO) 

- **BytesFromLanPeers** - Bytes from Lan peers, only for downloads using Delivery Optimization (DO) 

- **CancelledJobs** - Number of cancelled requests in the session

- **Connected** - Whether connected to source 

- **ErrorCode** - The code of last error 

- **ErrorDetails** - The detail of last error

- **ErrorMessage** - The message of last error 

- **ErrorSource** - The source of last error, e.g., Connection, LoadFile or LoadRange

- **FailedJob** - Number of failed requests in the session

- **FileSize** - Size of the resource

- **SourcePathNoFilePath** - Source path of the resource only http source is reported, local file path or UNC path is filtered

- **SucceededJobs** - Number of succeeded requests in the session

- **TotalJobs** - Total number of requests in the session

- **TotalRequestedBytes** - Total requested bytes in the session

- **TotalTransferTime** - Total transfer time in the session

- **TransferredBytes** - Total transferred bytes in the session

- **TransportType** - Type of transport, e.g., In memory Delivery Optimization, HTTP, Background Intelligent Transfer Service (BITS)

### Office.ClickToRun.Transport.ExperimentalTransport.PipelineCreateTransport

Office set up and inventory data collected when the Click-to-Run client is creating a transport stream to download Office files. Used for determining the health of various transport technologies (e.g., HTTP, BITS, DO) which is critical to downloading Office properly for installation and updates.

The following fields are collected:

  - **Data\_IsForeGroundStreaming** – If we're streaming in the foreground or background

  - **Data\_IsInstallMode** – 1 if we're installing and downloading files, 0 if not

  - **Data\_SourceProtocol –** If we're downloading from a content data network, CDN, the machine we're installing on, local, or from a resource on the local area network,

  - **Data\_Status** – Success or failure 

### Office.ClickToRun.UpdateStatus

Office set up and inventory data collected when the Click-to-Run client is finishing an update status

The following fields are collected:

  - **Data\_build** - Currently installed Office version

  - **Data\_channel** – The channel that the user is on

  - **Data\_errorCode** – An integer code specifying the type of error that occurred, if there was one

  - **Data\_errorMessage** – A string giving a description of the error that occurred, if there was one

  - **Data\_status** – A short status of what happened during the update, such as Succeeded or Downloaded

  - **Data\_targetBuild -** -The Office version that we're attempting to update to


### Office.ClickToRun.UniversalBootstrapper.Application2

*[This event was previously named Office.ClickToRun.UniversalBootstrapper.Application.]*

This event is triggered when a user runs the Office installer to modify their Office installation. The data is used to report the result of the end-to-end installation attempt.
  
- **ErrorCode** - Integer value associated with an unhandled exception

- **ErrorDetails** - String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage** - String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType** - String describing the category of an unhandled exception

- **ExitCode** - Integer value associated with the result of running the bootstrapper, indicating success vs. specific types of failure


### Office.ClickToRun.UniversalBootstrapper.CalculateParameters2

*[This event was previously named Office.ClickToRun.UniversalBootstrapper.CalculateParameters.]*

Reports on the action that reason over the input collected using CollectParameters

- **BitField –**    Integer value of the BitField argument, which tells us whether an explicit installation/update channel requested. For example, Beta Channel, Current Channel (Preview), Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), or Semi-Annual Enterprise Channel.

- **ChannelID –**    Integer representing the enum value of the selected update/install channel. For example, Beta Channel, Current Channel (Preview), Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), Semi-Annual Enterprise Channel, or Invalid.

- **CMDMode –**    The friendly string corresponding to which overall mode switch was detected in the cmd arguments passed to the exe. Possibilities are: autorun, configure, consumer, download, help, packager

- **C2RClientUICulture –**    Culture of the C2R Client to install

- **ErrorCode –**    Integer value associated with an unhandled exception

- **ErrorDetails –**    String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage –**    String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType –**    String describing the category of an unhandled exception

- **ExcludedApps –**    String listing the individual Office application names requested to be excluded from the Office suites installed

- **InstalledCabVersion –**    The "16.0.xxxxx.yyyyy" version of an Office C2R Client already installed

- **InstalledProductVersion –**    The "16.0.xxxxx.yyyyy" version of an Office C2R product already installed

- **IsC2RServiceRunning –**    Boolean flag that indicates whether a modern C2R Client's local machine service is up and running on the device

- **IsElevatedFlagSet –**    Boolean flag indicating whether the bootstrapper has already attempted to gain admin elevation

- **IsFireFlyInstalled –**    Boolean flag indicating whether the Office 2013 RTM C2R Client is currently installed

- **IsFireflyServiceRunning –**    Boolean flag that indicates whether a 2013 RTM C2R Client's local machine service is up and running on the device

- **IsOfficeInstalled –**    Boolean flag indicating whether a modern Office client is installed already

- **OfficeCultures –**    Serialized list of Office cultures to be installed

- **OfficeSourceType –**    Friendly string associated with the enum value of the installation source (CDN, HTTP, UNC, CMBITS, DVD, LOCAL)

- **Origin –**    String value telling us which of the supported origins (Puerto Rico [PR], Singapore [SG], Dublin [DB]) should be used for initial installation streaming

- **PlatformFromLink –**    String indicating the requested x86|x64|default bitness of Office requested from the C2R Setup service

- **PlatformOfExistingInstallation –**    String indicating whether x86 vs. X64 Office was already installed on the device

- **PlatformToInstall –**    String indicating the final decision on whether x86 vs. X64 Office should be installed. 

- **PRID –**    String value representing the requested Product Release ID in a consumer installation scenario (for example, "O365ProPlusRetail")

- **PridsToMigrateFromCentennial-**    String of Office products to migrate from Store installations to Click-To-Run

- **ProductsToAdd –**    The serialized string that instructs C2R Client on which Product/Culture combinations it should be installing

- **ProductsToMigrateFromO15C2R -**  String of Office products and cultures to migrate from an Office 2013 Click-To-Run installation

- **ProductsToRemove –**    The serialized string that instructs C2R Client on which Product/Culture combinations it should be uninstalling

- **SharedComputerLicensing –**    Boolean indicating whether an IT Admin requested setup to enable the "SharedComputerLicensing" feature

- **ShouldActivate –**    Boolean indicating whether an IT Admin requested an automatic licensing activation attempt in their configuration.xml

- **ShouldUninstallCentennial -** Boolean flag indicating whether Office products from the Store should be uninstalled

- **VersionToInstall –**    String value of the Office "16.0.xxxxx.yyyyy" version that is being installed
 

### Office.ClickToRun.UniversalBootstrapper.CollectEmbeddedSignature2

*[This event was previously named Office.ClickToRun.UniversalBootstrapper.CollectEmbeddedSignature.]*

RThis event is triggered when a user runs the Office installer to modify their Office installation. The data allows us to carry the user's product, language, and choice of 64- or 32-bit Office to in-process within setup.exe.
 
The following fields are collected:

- **ErrorCode** - Integer number associated with an unhandled exception

- **ErrorDetails** - String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage** - String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType** - String describing the category of an unhandled exception


### Office.ClickToRun.UniversalBootstrapper.CollectParameters2

*[This event was previously named Office.ClickToRun.UniversalBootstrapper.CollectParameters.]*

This event is triggered when a user runs the Office installer to modify their Office installation.  The data is used to report the parameters used for the Office installation and keep it running as expected.

- **BitField** - Integer value of the BitField argument which tells us whether an explicit installation/update channel requested. For example, Beta Channel, Current Channel (Preview), Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), or Semi-Annual Enterprise Channel.

- **C2RClientUICulture** - Culture of the Click-to-Run (C2R) Client to install

- **ChannelID** - Integer representing the enum value of the selected update/install channel. For example, Beta Channel, Current Channel (Preview), Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), or Semi-Annual Enterprise Channel, or Invalid.

- **CMDMode** - The friendly string corresponding to which overall mode switch was detected in the cmd arguments passed to the exe. Possibilities are: autorun, configure, consumer, download, help, packager

- **ErrorCode** - Integer value associated with an unhandled exception

- **ErrorDetails** - String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage** - String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType** - String describing the category of an unhandled exception

- **ExcludedApps** - String listing the individual Office application names requested to be excluded from the Office suites installed

- **InstalledCabVersion** - The "16.0.xxxxx.yyyyy" version of an Office Click-to-Run (C2R) Client already installed

- **InstalledProductVersion** - The "16.0.xxxxx.yyyyy" version of an Office Click-to-Run (C2R) product already installed

- **IsC2RServiceRunning** - Boolean flag that indicates whether a modern Click-to-Run (C2R) Client's local machine service is up and running on the device

- **IsElevatedFlagSet** - Boolean flag indicating whether the bootstrapper has already attempted to gain admin elevation

- **IsFireFlyInstalled** - Boolean flag indicating whether the Office 2013 RTM Click-to-Run (C2R) Client is currently installed

- **IsFireflyServiceRunning** - Boolean flag that indicates whether a 2013 RTM Click-to-Run (C2R) Client's local machine service is up and running on the device

- **IsOfficeInstalled** - Boolean flag indicating whether a modern Office client is installed already

- **OfficeCultures** - Serialized list of Office cultures to be installed

- **OfficeSourceType** - Friendly string associated with the enum value of the installation source (CDN, HTTP, UNC, CMBITS, DVD, LOCAL)

- **Origin** - String value telling us which of the supported origins (Puerto Rico [PR], Singapore [SG], Dublin [DB]) should be used for initial installation streaming

- **PlatformFromLink** - String indicating the requested (x86 vs x64) default bits of Office requested from the Click-to-Run (C2R) Setup service

- **PlatformOfExistingInstallation** - String indicating whether x86 vs. X64 Office was already installed on the device

- **PlatformToInstall** - String indicating the final decision on whether x86 vs. X64 Office should be installed. 

- **PRID** - String value representing the requested Product Release ID in a consumer installation scenario (for example, "O365ProPlusRetail")

- **PridsToMigrateFromCentennial** - String of Office products to migrate from Store installations to Click-To-Run

- **ProductsToAdd** - The serialized string that instructs Click-to-Run (C2R) Client on which Product/Culture combinations it should be installing

- **ProductsToMigrateFromO15C2R** - String of Office products and cultures to migrate from an Office 2013 Click-To-Run installation

- **ProductsToRemove** - The serialized string that instructs Click-to-Run (C2R) Client on which Product/Culture combinations it should be uninstalling

- **SharedComputerLicensing** - Boolean indicating whether an IT Admin requested setup to enable the "SharedComputerLicensing" feature

- **ShouldActivate** - Boolean indicating whether an IT Admin requested an automatic licensing activation attempt in their configuration.xml

- **ShouldUninstallCentennial** - Boolean flag indicating whether Office products from the Store should be uninstalled

- **VersionToInstall** - String value of the Office "16.0.xxxxx.yyyyy" version that is being installed


### Office.ClickToRun.UniversalBootstrapper.Execute2

*[This event was previously named Office.ClickToRun.UniversalBootstrapper.Execute.]*

This event is triggered when a user runs the Office installer to modify their Office installation. The data is used to report on the machine-impactful actions taken, as determined by the reasoned-over data from "CalculateParameters"
 
- **AvailableClientVersionText** - String value of the C2R Client "16.0.xxxxx.yyyyy" version found in the Version Descriptor XML, which is used to determine whether a currently installed C2R Client should be updated

- **CleanFireflyAction** - "true" if the CleanFireFlyAction task is scheduled to run during this installation

- **CleanO15Action** - "true" if the CleanO15Action task is scheduled to run during this installation

- **CMDMode** - The friendly string corresponding to which overall mode switch was detected in the cmd arguments passed to the exe. Possibilities are: Autorun, configure, consumer, download, help, packager

- **DeliveryMechanism** - The "FFNRoot" guid extracted from the Version Descriptor XML (stamped by RDX), which tells us which audience/channel the build source came from

- **DownloadC2RClientAction** - "true" if the DownloadC2RClientAction task is scheduled to run during this installation

- **ErrorCode** - Integer value associated with an unhandled exception

- **ErrorDetails** - String that describes the location of where an unhandled exception occurred (function, file, line number, additional parameters set by the thrower)

- **ErrorMessage** - String defined at the point where an unhandled exception was thrown, describing the nature of the failure

- **ErrorType** - String describing the category of an unhandled exception

- **ExitCode** - Integer value associated with the result of running the Execute phase of the bootstrapper, indicating success vs. specific types of failure

- **LaunchAction** - "true" if the LaunchAction task is scheduled to run during this installation

- **LaunchUpdateAction** - "true" if the LaunchUpdateAction task is scheduled to run during this installation. 

- **PreReqResult** - The integer enum value of the result when PreReq checks were performed (pass/fail/re-run)

- **UnexpectedAction** - "true" if the UnexpectedAction task (an error case) is scheduled to run during this installation

- **VersionToInstall** - String value of the Office "16.0.xxxxx.yyyyy" version that is being installed


### Office.ServiceabilityManager.InventoryAddon.Heartbeat

*[This event has been removed from current builds of Office, but might still appear in older builds.]*

This event is used to acquire standard metadata on each run of the Inventory add-on, which is part of the Office Serviceability Manager and is used for inventory Office information on those machines for which an IT admin has opted in. The metadata of specific interest here's the session ID, and it's used for linking to other data stored within a per-tenant cloud service.

This event contains no extra fields since only the metadata is relevant.

### Office.ServiceabilityManager.InventoryAddon.Results

This event is logged when the call to the webservice made within the Click-to-Run Serviceability Manager Inventory add-on completes, irrespective of whether it succeeds or fails. This is essentially the last operation within the add-on to track the overall operation status.

The following fields are collected:

- **ActionDetail** - Additional details for when a failure occurs.

- **Result** - Numeric error code flags returned by the Office webservice call APIs. For example, 3 would mean that there was a problem initializing the HTTP headers.

- **Type** - Additional type information. In the case of the Inventory, this information specifies the type of payload being sent. For example, full or just a delta of changes. 

- **Version** - The full four-part version number of Office. For example, 16.0.10000.10000. (Note that for these events, the standard version field is populated with the Windows version as this runs as part of a Windows process.)

-  **WebCallSource** - An enumeration value (specified as an integer) indicating the Serviceability Manager add-on that was the source of the call.
   

### Office.ServiceabilityManager.WebserviceFailure

Whenever a call to a webservice within one of the Office Serviceability Manager add-ins fails, this statement is logged. Failures can be due to internal failures or an inability to connect to the webservice.

The following fields are collected:

- **Add-on** - The Click-to-Run Serviceability Manager add-on from which the webservice call was made. This can have values like inventory, manageability, etc. encoded as a numeric value.

- **Correlation ID** - A randomly generated GUID specific to the current instance that is sent to the webservice to correlate calls between the client and the server.

- **ErrorInfo** - Numeric error code information returned by the Office webservice call APIs.

- **ErrorMessage** - A message providing further insight into the failure. Each error type maps to a hardcoded string, with some error types mapping to potentially multiple strings depending on the specific nature of the failure.

- **Function** - The function in the code from which the current call occurred.

- **Status** - The HTTP status code returned by the call to the webservice, e.g. 404, 500, etc.

## Consent Service events

### Office.Android.DocsUI.PaywallControl.PriceNoticeUIClickEvent

This event is triggered when user acknowledges the price notification. The information is used to record user response to the price notices and help ensure compliance with Google Play Store requirements.

The following fields are collected:

- **EventDate** - Timestamp of the event occurrence. 

- **ProductId** - String - ProductId of the SKU being purchased.

- **SessionID** - GUID to connect events by session.

### Office.Android.DocsUI.PaywallControl.PriceNoticeUIShown

This event is triggered when there's any change in SKU pricing and price update notice is displayed. The information is used to record price notifications shown to users and help ensure compliance with Google Play Store requirements.

The following fields are collected:

- **EventDate** - Timestamp of the event occurrence 

- **ProductId** - String - ProductId of the SKU being purchased.

- **SessionID** - GUID to connect events by session

### Office.Privacy.UnifiedConsent.API.ConsentGetFailed   

This event logs a failure in a request to get information from the consent service. Data is used to understand the frequency of successes and failures in client components, allowing detection and mitigation of common issues.

The following fields are collected:   

- **ConsentLanguage** - The language that the consent is being shown to the user in

- **ConsentSurface** - The specific technology being used to retrieve and render the consent experience

- **CorrelationId** - A unique identifier used to link data from the client and the service for the purpose of debugging failures

- **EventCode** - A numeric code used to provide details on why a failure may have occurred while getting data from the Consent Service.

- **EventMessage** - A human readable message related to the result of the get call. The values are drawn from a list of expected messages.

- **FormFactor** - A value indicating the shape and nature of the device sending the data

- **ModelType** - The type of message being shown to the user, e.g., Consent, Notice, etc.

- **Os** - The operating system of the device sending the data

- **Region** - The country or region being used to determine what version of a consent to show the user

- **Result** - The internal result code for the client server communication with consent service

- **ResultExt** - The extension of the internal result code for the client server communication with consent service


### Office.Privacy.UnifiedConsent.API.ConsentPatchFailed

This event is triggered by a failure in our ability to make a call to the consent service. Data is used to understand the frequency of successes and failures in client components, allowing detection and mitigation of common issues.

The following fields are collected:  

- **ConsentLanguage** - The language that the consent is being shown to the user in

- **ConsentSurface** - The specific technology being used to retrieve and render the consent experience

- **ConsentType** - The type of consent presented to the user, i.e., Prominent Notice, Consent, etc.

- **CorrelationId** - A unique identifier used to link data from the client and the service for the purpose of debugging failures

- **EventCode** - A numeric code used to provide details on why a failure may have occurred while getting data from the Consent Service.

- **EventMessage** - A human readable message related to the result of the get call. The values are drawn from a list of expected messages.

- **FormFactor** - A value indicating the shape and nature of the device sending the data

- **ModelId** - A unique identifier indicating which model was the basis for the consent or notice shown to the user

- **ModelType** - The type of message being shown to the user, e.g., Consent, Notice, etc.

- **ModelVersion** - Data indicating which version of a consent or notice was presented to the user

- **Os** - The operating system of the device sending the data

- **ReConsentReason** - An indicator of why a user is seeing a given consent an additional time.

- **Region** - The country or region being used to determine what version of a consent to show the user

- **Result** - The internal result code for the client server communication with consent service

- **ResultExt** - The extension of the internal result code for the client server communication with consent service


### Office.Privacy.UnifiedConsent.API.ConsentPatchSuccess

This event logs successful communication with the consent service. Data is used to understand the frequency of successes and failures in client components, allowing detection and mitigation of common issues.

The following fields are collected:

- **ConsentLanguage** - The language that the consent is being shown to the user in

- **ConsentSurface** - The specific technology being used to retrieve and render the consent experience

- **ConsentType** - The type of consent presented to the user, i.e., Prominent Notice, Consent, etc.

- **CorrelationId** - A unique identifier used to link data from the client and the service for the purpose of debugging failures

- **EventCode** - A numeric code used to provide details on why a failure may have occurred while getting data from the Consent Service.

- **EventMessage** - A human readable message related to the result of the get call. The values are drawn from a list of expected messages.

- **FormFactor** - A value indicating the shape and nature of the device sending the data

- **ModelId** - A unique identifier indicating which model was the basis for the consent or notice shown to the user

- **ModelType** - The type of message being shown to the user, e.g., Consent, Notice, etc.

- **ModelVersion** - Data indicating which version of a consent or notice was presented to the user

- **Os** - The operating system of the device sending the data

- **ReConsentReason** - An indicator of why a user is seeing a given consent an additional time.

- **Region** - The country or region being used to determine what version of a consent to show the user



## Enhanced Configuration Service (ECS) events

### Office.Experimentation.FeatureQueryBatched

Collects information about Feature gates/Change gates queried by executed code.

The following fields are collected:

  - **Count** - Number of queried feature gates in this batched event

  - **Features** - Information about the queried gate.

  - **Sequence** - Order in which FeatureGate was queried

### Office.Experimentation.FlightNumberLine

This event is triggered when a new Office session is started to collect the list of configurations received by the client from the Experimentation and Configurations Service. The data is used to ensure that flighting and configuration infrastructure is operating as designed to keep the product secure and working as expected.  

The following fields are collected:

- **ECSConfigs** - Comma separated list of ECS Configs 

- **ExpStaleUserId** - Indicator for configurations User ID matching with session User ID

- **LockType** - Type of FlightManager lock.

- **TasFlightingVersion** - Version number

- **TimeToLock** - Time between liblet initiation and FlightManager lock

- **UnmergedConfigs** - List of configurations not merged

### Office.Experimentation.TriggerAnalysis

This event helps scope analysis of product usage and performance metrics (such as crashes, hangs, etc.) to the subset of users or devices that are eligible to use the feature, thereby helping ensure that the product is working properly.

The following fields are collected:

  - **FeatureGate -** Identifies the set of features for which the trigger analysis is applicable.

### OneNote.FlightDefault
 
This event is logged when OneNote asks ECS server for flight values.  This is used to enable experimental features to those users who have opted in for receiving such flights.
 
The following fields are collected:
 
- **ConfigParam** - The config for which the value is being accessed

## Licensing events

### Office.Android.DocsUI.PaywallControl.AutoRedeemPendingPurchaseResult

Critical engineering telemetry to log the result of automatic attempt of trying to redeem pending purchases of a user. Product telemetry used for reconciliation of purchase transaction information with Microsoft’s commerce system to enable associated subscription benefits.

The following fields are collected:

- **EventDate** – Timestamp of the event occurrence 

- **orderID** - Order ID string of the purchase made.

- **Result** – Int denoting the enum result of the operation. 

- **SessionID** – GUID to connect events by session

### Office.Android.DocsUI.PaywallControl.PaywallUIShown

Critical Usage telemetry for when Paywall control is shown to the user. Used to understand the in app purchase experience for the user and optimize the same for future versions.

The following fields are collected:

- **EventDate** – Timestamp of the event occurrence 

- **IsModeFRE** – Boolean to indicate experience type, Upsell dialog or SKU Chooser *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **SessionID** – GUID to connect events by session

- **startMode** - Integer value to indicate startMode type where 0 means FRE (First Run Experience), 1 means SkuChooser (Personal or Family related paywall), and 2 means CopilotPro.

### Office.Android.DocsUI.PaywallControl.PurchaseButtonClicked

Critical usage telemetry to know when user clicks on the Purchase Button. Used to infer the usage pattern and conversion metric for users who attempt to buy a subscription in the app.

The following fields are collected:

- **Card** - Integer – Carousel index of last feature card seen by user before attempting a purchase.

- **EventDate** – Timestamp of the event occurrence

- **IsDefaultSku** – Boolean indicating if user is attempting to purchase the Sku that showed up first/default

- **ProductID** – String identifying which subscription user is attempting to purchase as configured in the store

- **SessionID** – GUID to connect events by session

### Office.Android.DocsUI.PaywallControl.PurchaseResult

Critical engineering telemetry to log the result of purchase attempt triggered manually by user. Product telemetry used for reconciliation of purchase transaction information with Microsoft’s commerce system to enable associated subscription benefits.

The following fields are collected:

- **EventDate** – Timestamp of the event occurrence 

- **IsModeFre** – Boolean indicating if purchase was made from upsell FRE screen or Sku Chooser

- **orderID** - Order ID string of the purchase made.

- **ProductId** - String - ProductId of the SKU being purchased.

- **Result** – Int denoting the enum result of the operation.

- **SessionID** – GUID to connect events by session

### Office.Android.DocsUI.PaywallControl.PurchaseTokenRedemptionResponse

*[This event was previously named Office.Android.DocsUI.Views.PurchaseTokenRedemptionResponse.]*

This product telemetry is collected for tracking and logging the internal transaction status and reconciliation information to improve reliability and performance. Microsoft uses this data to analyze and improve the reliability and performance of the internal transaction processing and reconciliation mechanisms.

The following fields are collected:

- **MicrosoftPurchaseOrderId** - Microsoft Order Id sent by Retail Federation Service (RFS) for tracking purposes.

- **ResponseCode** - HTTP Response code (int)

- **StatusCode** - RFS response status code (RFS defined Enum int- finite)

### Office.Android.DocsUI.PaywallControl.SaveFlowUserActionEvent

This event is triggered when offer notification is presented to the user. The data is used to determine if the user has accepted the offer/discount to go ahead with the subscription renewal or purchase. 

The following fields are collected:

- **EventDate** - Timestamp of the event occurrence 

- **ProductId** - String - ProductId of the SKU being purchased.

- **SessionID** - GUID to connect events by session

- **UserAction** - 0, 1 and 2 where 0 indicates user has clicked to resubscribe, 1 indicates that user has clicked on “No Thanks”, and 2 indicates that user hasn't taken any action and dismissed the bottom sheet by either pressing the back button or any other way to dismiss it.

### Office.Android.DocsUI.PaywallControl.SeeAllFeaturesAnalytics

We collect this usage telemetry to see how much time the user spends on the “See more benefits” screen.  The data is used to understand usage of the “See more benefits” feature and further optimize the experience in future versions.

The following fields are collected:

- **Duration** - Long integer indicating time spent by user on “See All Features” screen in milliseconds

- **EventDate** - Timestamp of the event occurrence 

- **MostExplored** - Integer denoting the index of the most toggled item in a list of Microsoft 365 apps and their features

- **SessionID** - Globally Unique Identifier (GUID) to connect events by session

### Office.Android.DocsUI.PaywallControl.SkuChooserAnalytics

Usage telemetry to see how much time user spends on SKU Chooser screen. Usage telemetry to see how much time user spends on Sku Chooser screen.

The following fields are collected:

- **CardCount** - Integer - Number of cards seen by user before exiting from SKU Chooser screen

- **Duration** – Long integer indicating time spent by user on Sku Chooser screen in milliseconds

- **EventDate** – Timestamp of the event occurrence

- **SessionID** – GUID to connect events by session


### Office.Android.DocsUI.PaywallControl.SkuDetailsNullDuringPurchaseEvent

This event is triggered when user clicks on the "Start 30 days free trial” button but the Stock Keeping Unit (SKU) details are found to be null. The data is used to understand what the underlying reason is for when the user is trying to make a purchase. This is needed to log errors when the upsell experiences aren't performing as expected and come up with solutions to improve reliability for users.

The following fields are collected:

- **EventDate** - Timestamp of the event occurrence

- **Reason** - Integer – Indicating the reason behind the SKU details being null.


### Office.Android.DocsUI.PaywallControl.SkuPriceDiscountErrorEvent

The event is triggered when a user lands on the SKU chooser screen of the app and the prices are fetched from the Google Playstore for different subscriptions. The event identifies price differences between monthly and annual plan offered in different countries and in different currencies. The data is used to ensure that the pricing configuration is working as expected. 

The following fields are collected:

- **CountryCode** - To identify the country or region where purchase is made.

- **Discount** - Discount Percentage offered based on price differences between monthly and annual SKU of the both the personal and family plans.

- **ProductIndex** - To identify whether personal or family plan.

- **StoreCurrencyCode** - To identify the currency in which the app store is offering the end users the subscriptions plans.


### Office.Android.DocsUI.PaywallControl.StoreConnectionResponse

This telemetry is logged when establishing connection with Google’s Billing Client fails during Paywall Initialization. The purpose of the telemetry is to determine reasons behind the connection failure in case it's not performing as expected.

The following fields are collected:

- **BillingClientResponse** - Integer – Response from Google’s Billing Client indicating the reason for failure.

- **EventDate** - Timestamp of the event occurrence

- **TriggerPoint** - Integer – Indicating how the paywall initialization was triggered.


### Office.Android.DocsUI.PaywallControl.StoreQueryPurchasesResponse

This telemetry is logged when querying purchases with Google’s Billing Client fails. This telemetry is needed to know the reason of the failure if the response isn't received as expected. 

The following fields are collected:

- **BillingClientResponse** - Integer – Response from the Google’s Billing Client indicating the reason for failure while querying purchases.

- **EventDate** - Timestamp of the event occurrence

- **ProductType** - Integer - identifying the product type (Subscription or one time) for which queryPurchases has failed

- **TriggerPoint** - Integer – Indicating when the query purchases was triggered; initialization during app boot, user clicked on the diamond to land on SkuChooser screen showing FRE/Purchase Flow


### Office.Android.DocsUI.PaywallControl.StoreSkuDetailsResponse

This telemetry is logged when Google’s Billing Client doesn't return the prices for the product IDs passed to it. It's used to know the reasons for Sku Details fetching failure and the SKUs for which failure is happening during cases when the response isn't as expected.

The following fields are collected:

- **BillingClientResponse** - Integer – Response from the Google’s Billing Client indicating the reason for failure while fetching the Sku Details.

- **EventDate** - Timestamp of the event occurrence

- **ProductID** - String - Identifying for which product price fetching failed.

- **TriggerPoint** - Integer – Indicating when the Sku Details fetching was triggered : during app boot/user clicked diamond to land on SkuChooser screen/showing FRE


### Office.Android.DocsUI.Views.DimeError

This event is collected for the Office app for Android (released on Huawei and in China Stores). This event indicates that an attempt to purchase a Microsoft 365 subscription through Dime (a webURL loaded in client webview) has failed. Only the error scenarios are captured. This event data is error data only and is used to ensure the health of the Dime purchase flow in the client.

The following fields are collected:

- **CorrelationID** - ID that uniquely identifies a Dime purchase session.

- **ErrorReason** - Indicates the reason for the error that happened.
  - 0 – Unknown error
  - 1 – Internet not available
  - 2 – Universally unique identifier (UUID) validation failed
  - 3 - Universally unique identifier (UUID) is null or empty
  - 4 – JavaScript injection error where the Office app for Android can’t pass authToken to Dime
  - 5 – Base WebURL loaded on client is invalid


### Office.Android.DocsUI.Views.PremiumFeatureUpsell

This event captures clicks by a free user clicks to view a feature behind the pay wall. The data is used to measure the interaction of users with the contextual upsell experience and understand which features are preferred by the user which drives them to buy a subscription. This helps us invest to improve those preferred set of entry points. 

The following fields are collected:

- **featureId** - TCID for premium feature

- **featureName** - Premium Feature Title

- **seePlanButtonClick** - How many times “See plan buttons” gets clicked in upsell UI

### Office.Android.EarlyTelemetry.IrisPushNotificationClicked

This event is logged when a notification from a campaign is clicked on users’ devices on the Microsoft 365 app. The data is required to track the performance of the notifications as a feature. 

The following fields are collected:

- **CreativeId** - String – To know which CreativeId from a campaign is shown in the notification.

### Office.Android.EarlyTelemetry.IrisPushNotificationShown

This event is collected when a notification from a campaign is received on users’ devices via the Microsoft 365 app. The data is used to track the performance of the notifications as a feature. 

The following fields are collected:

- **CreativeId** - String – To know which CreativeId from a campaign is shown in the notification

### Office.Apple.IAPReviewYourSubscriptioniOS

This event captures session-based metadata when the In-App-Purchase (IAP) UI is shown to the user and the buttons the user subsequently interacts with. This data is used to help us understand the friction in the purchase flow and compare it with the funnel of a different purchase experience to understand which experience is better for the user. 

The following fields are collected:

- **FlowType** - Integer – Flow from where IAP was launched.

- **Restore** - String – rule tag is logged when restore button is clicked

- **PremiumFeatures** - String – rule tag is logged when “PremiumFeatures” button is clicked

- **Product** - String - The SKU selected by the users


### Office.Apple.InAppPurchaseContext

This event measures critical usage telemetry for the point of entry of the in-app purchase screen. The data helps understand and improve the user experience by identifying the preferred entry point for an in-app purchase.

The following fields are collected:

- **context** - String – The flow through which the user landed on the in app purchase page

### Office.Apple.Licensing.AutoRenewViewCTAPerformed

User actions to accept or dismiss the subscription Renewal screen triggers this event. The data is used to determine if the user has accepted the offer/discount to go ahead with the subscription renewal or purchase. 

The following fields are collected:

 -**actionType** - int - 1 -> renew button pressed; 2-> I already renewed; 3-> Continue without subscription.

-**IsOffer** -Bool – True – if user is presented with an offer/discount; False - otherwise.

### Office.Apple.Licensing.CommonPaywallControl

This event is used to understand the in-app purchase (IAP) experience for the user. It allows us to ensure IAP performs as expected and helps us understand user issues so we can optimize the IAP experience. Collection occurs through one of the following sub-events.

- **Office.iOS.Paywall.Activation.Response**- This event is created to log the response of user during the activation of a subscription plan on the paywall control. The data is used to measure the performance of the end-to-end paywall experience and help improve purchase reliability.
 
   The following fields are collected: 
 
   - **status** - String – To know the response during activation (successful, failed, or skipped)

- **Office.iOS.Paywall.BottomSheet.Stats** - Usage telemetry to measure how many users expanded/dismissed bottom sheet UI of subscription-plan (SKU) chooser screen. The data is used to understand usage of the SKU chooser and optimize the in-app purchase experience in future versions. 

   The following fields are collected:

  - **isDimissed** - Bool - true if user dismissed the drawer.
  - **isExpanded** - Bool - true when user expanded the bottom sheet.


- **Office.iOS.Paywall.ExistingUserSignInButtonClicked** - To log how many people are clicking on the sign-in button on the SKU chooser screen. The data is used to measure the performance of the Sign-in button and is triggered every time a user clicks this button.

- **Office.iOS.Paywall.Paywall.Presented** - Data is collected when paywall control is shown to the user. The data is used to build a view to measure the conversion rate at every step and ensure that the user interface is performing as expected with users experiencing minimal friction during the purchase experience.

   The following fields are collected:
  - **CPCVersion** - Integer -The version of customer paywall control we're presenting. We determine this based on experiment flag.
  - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”
  - **isFRE** - Boolean – Are we showing the First Run Experience or regular UI?
  - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session

- **Office.iOS.Paywall.Paywall.Stats** - Data is collected when the paywall user interface is shown to the user, the duration of the interaction and whether a purchase was attempted, succeeded, or failed. The data is used to measure the performance of the user interface and ensure that it performing as expected. 

   The following fields are collected:
   - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”.
   - **isFRE** - Boolean – Check to see if the First Run Experience or regular UI is showing.
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **status** - String – Exit status of Paywall. Like “initiated”, “paymentDone”, “provisionFailed”.
   - **userDuration** - Double – Duration in milli-seconds the user spent on Paywall

- **Office.iOS.Paywall.Provisioning.Response** - Critical Engineering Telemetry and Contract with Retail Federation Service (RFS) to collect the information provided in this. RFS is the internal service used within Microsoft for crosschecking the purchase. This is used to get the health of the API call made to RFS which would help in understand that the performance of the integration is as expected.  

   The following fields are collected:

   - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”.
   - **failureReason** - String – Only added when status is “failure”. Indicating the error response given by the RFS Provisioning response.
   - **MicrosoftPurchaseOrderId** - String - Microsoft Order Id for the purchase.
   - **OriginalTransactionId** - String - Apple Transaction Id for the purchase.
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **productId** - String – App Store ID of the product the request was made for
   - **status** - String – Success or Failure, indicating if the request succeeded or failed


- **Office.iOS.Paywall.PurchaseCompleteScreen.Shown** - To log how many users have failed to complete the StoreKit API (Apple’s flow), Provisioning API (Retail Federation flow) and Activation API (Licensing flow) and see the success screen. The data is used to measure the performance of the end-to-end paywall experience and help improve purchase reliability.

- **Office.iOS.Paywall.PurchaseFailedScreen.OpenSettingsButtonTap** - To log how many users have tapped on Open Settings Button when they see it during network error while trying to complete the StoreKit API (Apple’s flow), Provisioning API (Retail Federation flow), and Activation API (Licensing flow). The data is used to measure the performance of the end-to-end paywall experience and help improve purchase reliability.

- **Office.iOS.Paywall.PurchaseFailedScreen.RetryButtonTap** - Data collected when the Purchase/Provisioning/Activation failed, and the user tapped the retry button. The data is used to troubleshoot purchase error scenarios and fix it to ensure that it performs as expected. *[This sub-event was previously named Office.iOS.Paywall.FailedScreen.RetryButtonTap.]*

   The following fields are collected:

   - **failureReason** - String – Indicates what the failure was the user is retrying; for example, “provisioningFailed”, “purchaseFailed”, “activationFailed”.
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **productId** - String – App Store ID of the product for which user is retrying the failed request.


- **Office.iOS.Paywall.PurchaseFailedScreen.Shown** - To log how many users have failed to complete the StoreKit API (Apple’s flow), Provisioning API (Retail Federation flow) and Activation API (Licensing flow) and see the failure screen. The data is used to measure the performance of the end-to-end paywall experience and help improve purchase reliability.
 
   The following fields are collected: 
 
   - **failureReason** - String – To know the failure reason

  
- **Office.iOS.Paywall.SignIn.Response** - The event is collected when users complete SignIn during upsell flow, which is triggered for PreSignIn upsell scenarios like the PreSignIn FRE and PreSignInDiamond. This can be used to check the SignIn rates during the Upsell flow and help us analyse the PreSign scenarios.

  The following fields are collected:

  - **authToken** - String - The Auth token of the signed in user. Used to debug issues where auth token is invalid and provisioning for the account fails. If the token is nil, logged as “nil-auth-token”.  
  - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”.
  - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session.
  - **status** - String – The SignIn status of the user. Can be Cancelled, Failure, PremiumSignIn or Success (Non-Premium Signin)


- **Office.iOS.Paywall.SigninAlertShowUpsellButtonTapped** - To log how many users are tapping on show upsell button on CPC signin alert. The data is used to measure the number of non-premium users coming back to CPC screen post successful signin from CPC.
 
- **Office.iOS.Paywall.SKUChooser.BuyButtonTap** - Data is collected when user taps the Purchase/Buy Button. The data is used to measure the performance of the button and ensure that it performing as expected.

   The following fields are collected:

   - **currentFeatureCard** - String – The title of the current feature card on display just before the Purchase/Buy Button was tapped
   - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”.
   - **isDefaultSKU** - Bool – If the user is purchasing the product, we recommended for them, by displaying it by default.
   - **isFloatingDock** - Bool - Will reflect if the buy button was tapped on floating dock or the plan cards.
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **productId** - String – App-store product-id of the product for which the Buy Button was tapped.
   - **toggleCount** - Int – Number of times the user switched between viewing various products, before they tapped the Buy Button, in the current session of Paywall. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Office.iOS.Paywall.SKUChooser.MoreBenefits.Stats** - Data collected when users tap on “See More Benefits” to see all the services, apps and features included in the purchase. They must expand sections detailing the features for each of the apps. This event collects which features and apps they expanded, along with the duration of time spent. The data is used to ensure that the UI offered to end users to learn about the benefits is performing as expected. 

   The following fields are collected:

   - **appsExpanded** - String – Comma-separated list of services/apps for which the benefits were expanded.
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **productId** - String – App Store ID of the product for which user is viewing more benefits offered
   - **userDuration** - Double – Duration in milli-seconds the user spent on the Benefits Screen.

- **Office.iOS.Paywall.SKUChooser.ProductSwitched** - Usage telemetry to view the end user’s interaction with the UI provided to switch between different SKUs and ensure that it's performing as expected. 

   The following fields are collected:

  - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
  - **productId** - String – App Store ID of the product the user just switched to viewing from the available products on the SKU chooser.

- **Office.iOS.Paywall.SKUChooser.Stats** - Data collected to see how the user entered the SKU Chooser, how much time the user spends on the SKU Chooser screen and why they exited the SKU Chooser. Using the information, we can ensure that the SKU Chooser is performing as expected, and we'll be able to optimize and improve the end user experience.

   The following fields are collected:

   - **cardsVisited** - Int – number of displayed feature cards the user has seen
   - **compTableInteracted** - Bool - If user toggled the comparison table column selection throughout the session.
   - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”.
   - **exitReason** - String – Exit reason of SKU Chooser. Like “BuyButton”, “CloseButton”
   - **floatingDDInteracted** - Bool - If user ever clicked on drop down in floating dock.
   - **floatingToggleCount** - Int - Number of times the user switched between monthly and yearly on the floating dock
   - **graceLeftoverDays** - Int – number of days left for grace period
   - **isFRE** - Boolean – Are we showing the First Run Experience or regular UI?
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **scrollDepth** - Double - Scroll depth throughout the current session of paywall.
   - **userDuration** - Double – Duration in milli-seconds the user spent on the SKU chooser.
   - **toggleCount** - Int - Number of times the user switched between viewing various products, before they tapped the Buy/Cancel Button, in the current session of Paywall.  

- **Office.iOS.Paywall.SKUChooser.ToggleTap** - Data is collected when user taps the Toggle. The data is used to measure the performance of the toggle and ensure that it performing as expected. 
 
   The following fields are collected: 
 
   - **selectedPlanType** - Int - Check the selected toggle plan type monthly/ yearly (1 for monthly, 2 for yearly)


- **Office.iOS.Paywall.StoreKit.Response** - Critical engineering telemetry to log the result of purchase attempt triggered manually by user and the App store response to the event. The data is used to measure the status of a purchase attempt and reasons of failure (if any) and take corrective actions to ensure that the IAP and all the entry points as performing as expected.

   The following fields are collected:

   - **entryPoint** - String – The Button/Flow from which Paywall was displayed. Like “Premium Upgrade Button” or “First Run Flow”.
   - **failureReason** - String – Only added when status is “failure”. Indicating the error response given by the App-store response.
   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **productId** - String – Only for “MakePurchase”, “PendingPurchase”, the app-store ID of the product for which the request was made.
   - **productsCount** - Int – Only for “ProductsFetch”, the number of products returned by Store.
   - **requestType** - String – Type of StoreKit request. Like “ProductsFetch”, “PendingPurchase”, "Restore"
   - **status** - String – Success or Failure, indicating success or failure of the request.
   - **trialInfo** - String: Bool - Captures trial info of all the products fetched from App Store. This will be empty if trial info fetching fails.


- **Office.iOS.Paywall.StoreKit.RestorePurchase** - This event is triggered for a user who is restoring a previous purchase by clicking on “Restore Previous Purchase” on the paywall control. The data is used to measure the performance of the end-to-end paywall experience and help improve purchase reliability.

   The following fields are collected: 

   - **status** - String – To know the response during of this restore process (successful, failed, or unexpected)


- **Office.iOS.Paywall.SuccessScreen.SeeAllBenefitsButtonTap** - This event is collected when the user taps “See All Benefits” after a successful purchase to see the apps and features included in the purchase. The data is used to measure that the user interface is performing as expected.

   The following fields are collected:

   - **PaywallSessionId** - String – Collected to uniquely identify a Paywall session in an app session
   - **productId** - String – App Store ID of the product for which user is viewing all benefits offered.

### Office.Apple.Licensing.CommonPaywallDetails

This event logs the user details before Paywall control is shown to the user. The data is used to diagnose issues with Common Paywall Control (CPC) and will be used in conjunction with the table Office.Apple.Licensing.CommonPaywallControl to check if there are any issues in the code or to debunk any data anomalies with regard to CPC. 

The following fields are collected: 

- **canUserSeeUpsell** - Boolean: True if the SignedIn user isn't underage and qualified to see upsell screen

- **DidShowPromotedSubscription** - Boolean: True if the user has triggered first app boot from promoted subscription.

- **EffectiveIdentityType** - Boolean: Sign in type of the user. Can be -1 (Unsigned), 1 (MSA), 2 (OrgId)

- **HasSubscription** - Boolean: True if the user has an active Microsoft 65 subscription

- **IsCPCOnSignInEnabled** - Boolean: True if the FeatureGate Microsoft.Office.LicensePurchase.FollowSignInWithCPC is enabled  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **isFREUpsellToUnsignedUsersEnabled** - Boolean: True if the FeatureGate Microsoft.Office.LicensePurchase.FREUpsellToUnsignedUsers is enabled  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **IsProClassDisplay** - Boolean: If the users’ device is a pro class display (Screen size > 10.1 inch) or not

- **ShowCPC** - Boolean: If CPC First Run Experience (FRE) is to be shown to the user.

- **SKUEffectiveIdentityType** - Int: Sign in type of the user. Can be -1 (Unsigned), 1 (MSA), 2 (OrgId)

- **SKUHasSubscription** - Boolean: True if the user has an active Microsoft 365 subscription 

- **SKUIsCommonPaywallControlEnabled** - Boolean: True if the FeatureGate Microsoft.Office.LicensePurchase.UseCPC is enabled  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **SKUIsPreSignInDiamondEnabled** - Boolean: True if the FeatureGate Microsoft.Office.LicensePurchase.PreSignInDiamond is enabled  *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **SKUIsProClassDisplay** - Boolean: If the users’ device is a pro-class display (Screen size greater than 10.1 inch) 

- **SKUShowCPC** - Boolean: If CPC SKU Chooser is to be shown to the user


### Office.Apple.Licensing.GracePeriodForPremiumIpad

This event is triggered when the user lands on the "You're Eligible for Free Pass" user interface (UI) and clicks any of the call-to-action buttons:

- "Cancel" button on right top corner
- "Activate Free Pass" button in the center
- "Skip" button on bottom center.

The data is used to ensure that the feature is working as expected and the users are able to get the Free Pass license key if they opt for it. 

The following fields are collected:

- **ActivateButtonClick** - bool – User clicks on activate button on Free Pass UI

- **ActivatedGraceLicenseKey** - bool – Grace license activated

- **CancelButtonClick** - bool – User clicks on cancel button on Free Pass UI

- **SkipButtonClick** - bool – User clicks on skip button on Free Pass UI


### Office.Apple.Licensing.PremiumFeatureUpsell

This event is triggered when a free user clicks to view a feature behind the paywall. The data is used to measure the interaction of users with the contextual upsell experience and ensure that it's working as expected.

The following fields are collected:

- **CanUserSeeUpsell** - Captured when the state of the users allow them to see an upsell CTA

- **dismissUpsellUI** - Captured when users click on “Cancel Button” in alert box or user dismiss the bottom sheet to 

- **featureId** - Identifier for the premium feature which users are trying to use

- **learnMoreButtonClick** - Captured when users click on “Learn More” button

- **LicensingUpgradeUIShown** - Captured when users see the upsell alert box

- **seePlanButtonClick** - Captured when users click on “See plans” button 


### Office.Dime.Sdk.Health

This event captures data that helps in monitoring the health of the components that host the in-app purchase flow for a Microsoft 365 subscription to ensure the flow is working as expected.

The following fields are collected:

- **Data_ActivityErrorDescription** - Error description of the activity

- **Data_ActivityErrorMessage** - Error message of the activity 
 
- **Data_ActivityId** - ActivityId to correlate dime with partners that use ActivityId

- **Data_CampaignId** - Campaign ID for attribution

- **Data_ContentId** - Based on the Experience ID; it's mapped to a Flow ID and a Content ID

- **Data_CorrelationVector** - Correlation Vector to correlate dime with partners that use correlation vector

- **Data_CustomerImpacted** - Used for troubleshooting if customer is impacted in loading the flow

- **Data_DimeActivityDuration** - Duration time 

- **Data_DimeActivityMetadata** - Activity metadata

- **Data_DimeActivityName** - Activity name for health monitoring

- **Data_DimeActivityResult** - Activity result, Success/ Error/ Expected Error

- **Data_DimeVersion** - Build Version

- **Data_DurationLevel** - Severity - 0/1/2

- **Data_EcsConfigIds** - IDs for the experiments

- **Data_EcsCountry** - Detected country or region

- **Data_EcsETag** - Flights information

- **Data_Environment** - Dime Environment production/pre-production

- **Data_ExperienceId** - Experience to load 

- **Data_FlowId** - Based on the Experience ID; it's mapped to a Flow ID and a Content ID

- **Data_Language** - Culture

- **Data_LaunchId** - Unique ID for each launch instance

- **Data_Market** - Detected market

- **Data_OTelJS_Version** - Office telemetry version

- **Data_PageSessionId** - Session ID of the page

- **Data_PartnerId** - Caller App

- **Data_ProductId** - Product ID selected (not neccessarily purchased) by customer

- **Data_ProductName** - Friendly product name of product selected (not neccessarily purchased) by customer

- **Data_QosLevel** - Severity 0/1/2

- **Data_SDX_AssetId** - Asset ID of the Service Delivered Experience (SDX) hosting content for Win32

- **Data_SDX_BrowserToken** - Token of the browser for Win32

- **Data_SDX_HostJsVersion** - JavaScript library version for Win32

- **Data_SDX_Id** - Service Delivered Experience Id for Win32

- **Data_SDX_InstanceId** - Instance ID of the SDX for Win32

- **Data_SDX_MarketplaceType** - SDX Marketplace Type for Win32

- **Data_SDX_OfficeJsVersion** - Office JS Version for Win32

- **Data_SDX_SessionId** - Session ID of the SDX for Win32

- **Data_SDX_Version** - SDX Version for Win32

- **Data_SkuId** - SKU ID selected (not neccessarily purchased) by customer

- **Data_TimestampUTC** - Timestamp of the event

- **Data_TsgId** - Troubleshooting Guide Id for each activity

- **Data_UserAgent** - Header Tags


### Office.Docs.Shared.PremiumFeatureMessageBar

This event collects free users’ taps on a premium feature that resides behind the paywall. The data is used to understand the set of features consumers are interacting with as they convert to a paid user. This tells us the preferred entry points of the users and improve the user experience.

The following fields are collected:

- **featureId** - TCID for premium feature on which user taps


### Office.Licensing.AcceptEulaForCurrentLicense 

This is collected when the user gets licensed and accepts license terms for the current license

It's used to detect if the user is in a good state or not, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **ACID** - A GUID identifier representing the Office product that the user is licensed for

  - **DwEulaId** – Numeric identifier of the type of license terms that was accepted by the user


### Office.Licensing.ActivateDeviceEntitlement

This event gets triggered when we're trying to activate a device-based perpetual Office offer for the user. We use this data to monitor the health of the systems and services.

The following fields are collected:	

- **Activity_Success** - tells us if the device is licensed with a device-based perpetual Office offer.

- **Data_Count** - tells us the number of device-based perpetual Office entitlement associated with the device. Technically, there should be no more than one.

- **Data_EligibleEntitlementsCount** - tells us the number of eligible entitlements. Because service will return all the device entitlements associated with the device, but we need to check those offers that are relevant to the Office application that’s being running.

- **Data_Errors** - a string with a list of errors while we’re fetching licenses for the entitlements, separated by comma.

- **Data_LicensedEntitlementsCount** - tells us the number of entitlements that we successfully fetch a license for. There could be entitlement errors that lead us to not be able to get a license. 


### Office.Licensing.Activation 

Post setting up the license on the machine, we attempt to activate the license by calling the AVS service. This reports the result of the activation call

It's critical in detecting how many users are facing activation issues. We have anomaly detection to detect any regression. This is super critical as we have an external dependency on AVS and this signal points whether our external partners are healthy. It's also used for diagnostic purposes and system health if a user reports an issue with their machine

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for

  - **ReferralData** – Identifier of the OEM that installed Office on the machine

### Office.Licensing.ActivationWizard 

If we aren't able to automatically activate the license for some reason, we show an activation wizard to the user. This reports that the wizard is being shown to the user. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

This event collects no fields.

### Office.Licensing.BusBar.CheckForDynamicBusbarExperiment

This event is triggered once for every licensing business bar type that will be shown that has the dynamic business bar flight on (treatment group). This data event reports whether there's a Lifecycle Programming Platform dynamic business bar campaign ready on disk. Data will be used to measure the health of the new Lifecycle Programming Platform dynamic licensing business bar technology.

The following fields are collected:

- **DoesCampaignExist (bool)** - Indicates if the campaign is on disk

- **Type (int32)** - Indicates the licensing business bar type


### Office.Licensing.BusBar.ShowStashedBusbar

This event is triggered when the dynamic Lifecycle Programming Platform business bar fails to show and stashed static business bar needs to be shown instead. This data event will be used to make sure fallback to static business bar is successful.

The following fields are collected:

- **Type (int32)** - Indicates the licensing business bar type


### Office.Licensing.Dialogs.ReactNativeDialog.RekaService.CloseAndStoreUserAction

This event is triggered when a Licensing Validation User Experience (LVUX) 2.0 ReactNative dialog is closed. The data is used to verify that the ReactNative dialog events are occurring and triggering expected behavior and successfully closing the ReactNative dialogs.

The following fields are collected:

- **Action** - User action taken on LVUX RN dialog.

- **DialogView** - Specifies LVUX RN dialog.

- **Flow** - Entry flow type of LVUX session.


### Office.Licensing.Dialogs.ReactNativeDialog.RekaService.HandleAction

The event is triggered when an event occurs on a Licensing Validation User Experience (LVUX) 2.0 ReactNative dialog. The data is used to verify that the ReactNative dialog events are occurring and triggering expected behavior.

The following fields are collected:

- **Action** - User action taken on LVUX RN dialog.

- **DialogView** - Specifies LVUX RN dialog.

- **Flow** - Entry flow type of LVUX session.


### Office.Licensing.Dialogs.ReactNativeDialog.Show

This event is triggered when a Licensing Validation User Experience (LVUX) 2.0 ReactNative dialog is shown. Used to verify that the ReactNative dialog are launching as expected.

The following fields are collected:

- **DialogView** - Specifies LVUX RN dialog.

- **Flow** - Entry flow type of LVUX session.


### Office.Licensing.Dialogs.WebViewDialog.Close
 
This event is used as a signal to tell us that the in-app purchase experience is being closed either by the user or by the application. The data is used to monitor and alert on the health of the in-app purchase flow to ensure it's working as expected.  
 
The following fields are collected:
 
- **Data_ClosedDialog** - flag indicating the user closed the dialog

### Office.Licensing.Dialogs.WebViewDialog.HandleErrorNotification
 
This event is used as a signal to tell us that the in-app purchase experience attempted to load, but an error occurred which resulted in the dialog not showing. The data is used to monitor and alert on the health of the in-app purchase flow to ensure it's working as expected.  
 
The following fields are collected:
  
- **Data_MoeErrorCode** - Error code seen in the web dialog framework

### Office.Licensing.Dialogs.WebViewDialog.Preload
 
This event is used as a signal to tell us that the in-app purchase experience is being loaded in the background. The data is used to monitor and alert on the health of the in-app purchase flow to ensure it's working as expected.  
 
The following fields are collected:

 - None

### Office.Licensing.Dialogs.WebViewDialog.Show
 
This event is used as a signal to tell us that the in-app purchase experience is being shown to the user. The data is used to monitor and alert on the health of the in-app purchase flow.  

The following fields are collected:

 - None

### Office.Licensing.Dialogs.WebViewDialog.Timeout

This event is used as a signal to tell us that the in-app purchase experience attempted to load but timed out. The data is used to monitor and alert on the health of the in-app purchase flow to ensure it's performing as expected. 

The following fields are collected:

 - None


### Office.Licensing.EnforceSignInQualified 

This is the signal that tells us if the experiment that we're running to enforce user sign as part of licensing is successful. This is critical in detecting the success or failure of the experiment that is forcing the users to log in which is a required step for the modern licensing stack. Failure to sign in will result in the users not being able to use the app.

The following fields are collected:

  - **Qualified** – Identifies whether the user qualified for the sign in enforcement

### Office.Licensing.Erfm.ErfmSubTriggerEvent

This event is triggered when the user goes through the Licensing UX flow in order to attempt to go from an unlicensed to a licensed state. The data is used to make sure that Microsoft Office Licensing is performing as expected.

The following fields are collected:

- **AdsEnabled** - This informs us whether ads are enabled for the client.

- **Flow** - This informs us of the exact sub-flow of the Licensing UX that the user is going through.

### Office.Licensing.Erfm.InitializeERFM

This event is triggered for users running Microsoft Office under Enhanced Reduced Functionality Mode. The data is used to make sure that Microsoft Office Licensing is performing as expected.

The following fields are collected:

- **AdsEnabled** - This informs us whether ads are enabled for the client.

- **FailureReason** - This informs us of the type of failure encountered by the ad platform.

- **TryToReconstructToolbarsResult** - This informs us whether toolbars were successfully reconstructed following initialization.


### Office.Licensing.ExpirationDialogShown

This is collected when we show the expiration dialog to the user that says that their license has expired. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **LicNotificationState** – An enumerator that tells us what kind of notification is being shown to the user


### Office.Licensing.Flows.GenericRFMDialog

This event is triggered when the generic RFM (Reduced Functionality Mode) dialog is shown in the Office client. The data is used to verify that the user is seeing appropriate licensing dialog in the Office client license experience (LVUX: Licensing Validation User Experience) and make sure user actions are handled appropriately.

The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

- **UserAction** - User action taken on LVUX ReactNative dialog.


### Office.Licensing.Flows.GraceDialog

This event is triggered when grace license notification dialogs are shown during in the Office client. The data is used to verify that the user is seeing appropriate licensing dialog in the Office client license experience (LVUX: Licensing Validation User Experience) and make sure user actions are handled appropriately. The grace period is a one-time, five -day free license to use the installed Office product on new PCs.

The following fields are collected:

- **ACID** - License SKU ID for which grace key was installed.

- **MainFlow** -  Entry flow type of LVUX session.


### Office.Licensing.Flows.GraceEula

This event is triggered when the grace license terms is shown in the Office client. The data is used to verify that the user is seeing appropriate licensing dialog in the Office client license experience (LVUX: Licensing Validation User Experience) and ensure user actions are handled appropriately. The grace period is a one-time, five-day free license to use the installed Office product on new PCs. The grace license terms is the license agreement a user must accept before activating the grace license.

The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

- **UserAction** - User action taken on LVUX ReactNative dialog.


### Office.Licensing.Flows.GraceLicenseActiveDialog

This event is triggered when the active grace license dialog is shown in the Office client. The data is used to verify that the user is seeing appropriate licensing dialog in the Office client license experience (LVUX: Licensing Validation User Experience) and make sure user actions are handled appropriately. The grace period is a one-time, five-day free license to use the installed Office product on new PCs.

The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

- **UserAction** - User action taken on LVUX ReactNative dialog.


### Office.Licensing.Flows.GraceLicenseExpiredDialog

This event is triggered when the expired grace license dialog is shown in the Office client. The data is used to verify that the user is seeing appropriate licensing dialog in the Office client license experience (LVUX: Licensing Validation User Experience) and make sure user actions are handled appropriately. The grace period is a one-time, five-day free license to use the installed Office product on new PCs.
The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

- **UserAction** - User action taken on LVUX ReactNative dialog.


### Office.Licensing.Flows.GraceState

This event is triggered when a user enters the grace license state. The data is used to verify the resilience grace license flow in the Office client license experience (LVUX: Licensing Validation User Experience) and make sure users are receiving a grace period before Reduced Functionality Mode, the unlicensed state of Office apps (RFM). The grace period is a one-time, five-day free license to use the installed Office product on new PCs. 

The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

### Office.Licensing.Flows.GraceWin11Reset

This event is triggered when the Windows 11 Grace dialog is shown in the Office client. The data is used to verify that the user is seeing the appropriate licensing dialog in the Office client license experience and to be sure user actions are handled appropriately.

The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

- **UserAction** - User action taken on LVUX ReactNative dialog.


### Office.Licensing.Flows.GraceWin11ResetConfirmation

This event is triggered when the confirmation dialog following the Windows 11 Grace dialog is shown in the Office client. The data is used to verify that the user is seeing appropriate licensing dialog in the Office client license experience (Licensing Validation User Experience/LVUX) and make sure user actions are handled appropriately.

The following fields are collected:

- **MainFlow** - Entry flow type of Licensing Validation User Experience (LVUX) session.

- **UserAction** - User action taken on LVUX ReactNative dialog.

### Office.Licensing.Flows.InstallGrace

This event is triggered when Office installs a grace license. The data is used to make sure this method of activating Microsoft Office is performing as expected.
 
The following fields are collected:

- **GraceInstallResult** - This tells us whether we were successful installing the grace license


### Office.Licensing.Flows.PurchaseProduct

This event is triggered when the user enters the inline purchase flow in the Office client. The data is used to verify that the purchase flow is launched as expected.

The following fields are collected:

- **MainFlow** - Entry flow type of LVUX session.

- **IdentityAvailable** - Indicates whether the LVUX session is running with active user identity or not.

- **WebDialogResult** - Indicates result of inline purchase dialog.


### Office.Licensing.Flows.SearchForSCAToken

This event is triggered when the user boots Office with a shared computer activation configured. The data is used to make sure this method of activating Microsoft Office is performing as expected.
 
The following fields are collected:

- **CurrentTokenRemainingDays** - This tells us the number of days of validity left on the token when this search was made

- **IsSilentRenewal** - This tells us the search is triggered because we're trying to opportunistically renew the session token on disk

- **IsUserTriggeredRenewal** - This tells us the search is triggered by the user through a click on a message bar asking them to verify their account

- **TokenCount** - This tells us the number of valid session tokens on disk


### Office.Licensing.Flows.ShowWebPurchaseExperience

This event is triggered when user is sent to web purchase flow from the Office client. The data is used to verify that purchase flow is launched as expected.

The following fields are collected:

- **MainFlow** - Entry flow type of Licensing Validation User Experience (LVUX) session.


### Office.Licensing.Flows.StartFlow

This event is triggered when a new Licensing Validation User Experience (LVUX) flow is started in the Office client. The data is used to verify that users are launching and entering LVUX 2.0 flows as expected.

The following fields are collected:

- **FlowStatesExecuted** - Indicated flow states (components of flow) executed in LVUX 2.0 before falling back to LVUX 1.0 or exiting LVUX 2.0.

- **FlowTypesExecuted** - Indicates types of flows executed in LVUX 2.0 before falling back to LVUX 1.0 or exiting LVUX 2.0.

- **LvuxFallbackState** - Indicates fallback state from LVUX 2.0 to LVUX 1.0.

- **MainFlow** - Entry flow type of LVUX session.


### Office.Licensing.FullValidation 

This is collected on every session that reports the licensing state of the machine and reports the errors that the user is seeing due to which they aren't able to use the application. This event indicates if the user's machine is healthy or not. We have anomaly detection set up for this event to indicate if a regression or activation mechanism is causing bad user behavior. This is also critical when diagnosing user issues and for monitoring system health.

The following fields are collected:

  - **Acid** – A GUID identifier representing the Office product that the user is licensed for 
  
  - **ActivationAttributes** - Type of activation mechanism that the user is using.

  - **IsSessionLicensing** – Whether we're currently running under shared computer activation mode or not 

  - **LicenseCategory** – Category of the Office license that the user is using 

  - **Licenses** – List of names of all the  Office licenses that are present on the machine 

  - **LicenseStatuses** – Status of all the Office licenses present on the machine 

### Office.Licensing.GetEntitlement 

We collect this when the user is setting up a device and we call our licensing service to detect if the logged in user has an Office entitlement or not. This reports the result of that call. It's critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

- **EntitlementCount** – Number of entitlements the user has


### Office.Licensing.GetNextUserLicense

This event gets triggered when fetching license for the chosen user-based Office entitlement during the activation first run experience. We use this data to monitor the health of the systems and services.

The following fields are collected:

- **Activity_Success** - Boolean: tells us if we successfully fetched a license for the device to be activated on its Office application.

- **Data_AllowNULPerpetual** - Boolean: tells us if the flight to enable vNext Perpetual is on.

- **Data_AttemptNulReactivation** - Boolean: tells us if this is a reactivation scenario.

- **Data_CurrentMode** - 0 means SPP (the legacy licensing stack), 2 means vNext (the modern licensing stack).

- **Data_HasError** - Boolean: tells us if we got any error when trying to get a license for the chosen user-based entitlement.

- **Data_IsSubscription** - Boolean: tells us if the reactivation is for subscription office.

- **Data_NewMode** - 0 means SPP (the legacy licensing stack), 2 means vNext (the modern licensing stack). We should expect 2 most of the time.

- **Data_SkuToSkuNeeded** - Boolean: tells us if we need to do SKU to SKU conversion due to the entitled Office SKU not matching the installed Office SKU.


### Office.Licensing.Heartbeat 

On every session, we check if 72 hours have passed since the last license renewal and try to extend the expiry of the current license. This event reports the success or failure of the call that we make to ensure we can extend the expiry of the license and keep the user's Office installation functional. It's critical in diagnosing subscription-related issues and service issues for the user and is critical in detecting regressions for already activated subscription users.

The following fields are collected:

  - **Mode** – An enumerator representation of the Office licensing stack that is being used on this machine

### Office.Licensing.InClientPinRedemption.CallPinRedemptionAPI

This telemetry tracks the results of Office's pin redemption service call.

The following fields are collected:

- **ClientTransactionId** - Unique identifier for the service call.

- **ErrorCategory** - Each error type can fall into a more general category, such as "Retryable".

- **ErrorType** - Reason of failure, such as "AlreadyRedeemedByOther".

- **InAFOFlow** - A Boolean indicating if we are in the Activation for Office redemption flow.

- **StatusCode** - One-word result of the service call, such as "Created".

- **StatusMessage** - Details of the status code, such as 'Successfully provisioned."

- **UsingNulApi** - A Boolean indicating if we're using the new licensing stack.


### Office.Licensing.InGrace

This event is triggered when the licensing flow has finished, and the user is in a grace state. Used to validate that the user has a grace license, and the acquisition flows are working correctly.

The following fields are collected:

- **ACID** - The Globally Unique Identifier (GUID) representing the license SKU

- **DaysRemaining** - Days remaining on the license

- **Mode** - Which licensing stack we're using (0 = Legacy, 2 = NUL)

- **ProductName** - The user-friendly name of the SKU

- **Reason** - The license status


### Office.Licensing.InRFM 

If the device enters reduced functionality mode, we send out this signal to indicate that the machine isn't in a healthy state. It's critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **ACID** - A GUID identifier representing the Office product that the user is licensed for

  - **DaysRemaining** - Number of days remaining before the current Office license expires

  - **Mode** – An enumerator representation of the Office licensing stack that is being used on this machine

  - **ProductName** – Name of the product that the user is currently using

  - **Reason** – The error code indicating the reason for the current status of the license

### Office.Licensing.InstallKey

This is collected when we try to install a key on the device to license the machine. It reports whether the installation was successful and if it wasn't then the error code. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **Prid** – Name of the product group for which a key is being installed

  - **SkuId** - A GUID identifier representing the Office product for which a key is being installed 

### Office.Licensing.InvokeLicenseWizard

In case we see problems with the Activation workflow, we trigger a license wizard and send out this signal to indicate the same. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for

  - **LicenseStatus** – Status of the Office license that the user is using

  - **MachineKey** - An alphanumeric identifier of the license key that was issued to the user

### Office.Licensing.LaunchSetupOffice

This event is triggered when we redeem an Office offer for the user who either bought a device bundled with an OEM Office pre-entitlement or has entered a product key. We use this data to monitor the health of the systems and services.

The following fields are collected:

- **Activity_Result_Tag** - tells us how we finished this event.

- **Data_DialogResult** - tells us the overall result of the redemption process.

- **Data_Scenario** - tells us the scenario where the redemption occurred for.

- **Data_ShowingSignIn** - tells us whether as part of redemption we decided to show a Sign In prompt or not.

- **Data_UsingRefactoredFlow** - identifies the version for the redemption process.

### Office.Licensing.Licensed

This event is triggered when the licensing flow has finished, and the user is in a licensed state. It's used to validate if the user has a valid license and/or if the licensing state changed.

The following fields are collected:

- **ACID** - The GUID representing the license SKU

- **DaysRemaining** - Days remaining on the license

- **Mode** - Which licensing stack we’re using (0 = Legacy, 2 = NUL)

- **ProductName** - The user-friendly name of the SKU

- **Reason** - The license status


### Office.Licensing.LicensingBar

If the device is facing licensing issues and we end up showing a busbar to the user, we send out this signal which also reports the type of busbar shown to the user. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **SuppressNotification** – Indicates if we suppressed the licensing busbar

  - **Title** – The title of the licensing busbar that was shown to the user

  - **Type** – The type of the licensing busbar shown to the user

### Office.Licensing.LicExitOfficeProcess 

If we end up closing or crashing Office due to a licensing issue, we send out this signal to indicate the same. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **ExitCode** – The internal code which caused the app to exit

### Office.Licensing.LoadIdentityTicket

In the process of trying to license the device, the app tries load the user's identity in order to see if the user has Office entitlement or not. This event reports the success or failure of the same along with the error code. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **FederationProvider** – A string that identifies the federation provider for the currently logged in user

  - **IdentityProvider** – A string that identifies the identity provider for the currently logged in user

### Office.Licensing.LoadIdentityTicketInSignInProvider

This event is triggered when we to load the user's identity ticket to see if the user has an Office entitlement or not. The data is used to make sure that Microsoft Office Licensing is performing as expected.

The following fields are collected:

  - None

### Office.Licensing.LVUX.EULAExplicitCrash 

This is collected if we showed the license terms to the user and the user chose to not accept it as a result of which we crash/close the app. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **Acid** - A GUID identifier representing the Office product that the user is licensed for

  - **OptInShown** – Indicates whether the opt-in dialog shown on the first boot of the app has already been shown

### Office.Licensing.NextUserLicensingEligible 

This signal tells us if a user is qualified to move to our new licensing stack. This is critical to quantify the impact on existing users as we roll out our new licensing stack and make sure that users aren't losing functionality.

This event collects no fields.

### Office.Licensing.Nul.Fetcher.FetchModelFromOls

When the device is on the modern licensing stack, we try to get a license file directly from the service. This event reports the success or failure along with the error code of that service call. It's critical to detect if the user is in a good state on the modern licensing stack, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

- **Data_CountUsableIdentitiesInProfileList** - Reports the number of user identities associated with profiles signed into Microsoft Office.

- **Data_CountUsableIdentitiesInUnfilteredIdentityList** - Reports the number of user identities in an unfiltered list of all identities signed into Microsoft Office, including those with pending action that requires a fix in order to authenticate.

- **MetadataValidationResult** – Result of the validation of the metadata of the license to verify that it hasn't been tampered with

- **SignatureValidationResult** – Result of the validation of the signature of the license to verify that it hasn't been tampered with

### Office.Licensing.Nul.Validation.FullValidation 

This is collected on every session of a device that is running on the modern licensing stack. It reports the licensing state of the machine and reports the errors that the user is seeing due to which they aren't able to use the app. This event indicates if the user's machine is healthy on the modern licensing stack. We have anomaly detection set up for this event to indicate if a regression is causing bad user behavior. This is also critical when diagnosing user issues and for monitoring system health.

The following fields are collected:

- **Acid** - A GUID identifier representing the Office product that the user is licensed for 

- **AllAcids** – List of all the GUIDs of the product that the user is currently licensed for 

- **Category** - Category of the Office license that the user is using 

- **DaysRemaining** – Number of days remaining before the current Office license expires 

- **EntitlementValidityDaysRemaining** - Number of days remaining before license on the user's Microsoft or organizational account expires. *[This field was previously named DaysRemaining.]*

- **LicenseId** – An alphanumeric identifier of the license that was issued to the user 

- **LicenseType** - Type of the Office license that the user is using 

- **LicenseValidityDaysRemaining** - Number of days remaining before the license file on disk expires. 

### Office.Licensing.OfficeClientLicensing.DoLicenseValidation 

This is licensing metadata that is collected from the device on every boot that reports the license acid, license status, type and other properties of the license that are critical in identifying the features set available to the user. This is critical in identifying the feature set available to the user and if any functionality is missing for the user. It's also used for Daily active users/Monthly active user calculations and various other reports by various teams across Office as this tells the type product that the user is using, whether it's a subscription product and whether they're missing any critical functionality.

The following fields are collected:

  - **FullValidationMode** – Mode indicating that we are in full validation of license verification 

  - **IsRFM** – Indicates whether the user is in reduced functionality mode or not 

  - **IsSCA** – Indicates whether we're running in Shared computer activation mode 

  - **IsSubscription** – Indicates whether the user is using a subscription license or not 

  - **IsvNext** – Indicates whether we're using the new modern licensing stack or not 

  - **LicenseCategory** - Category of the Office license that the user is using 

  - **LicenseStatus** – Status of the Office license that the user is using 

  - **LicenseType** - Type of the Office license that the user is using 

  - **LicensingACID** - A GUID identifier representing the Office product that the user is licensed for 

  - **OlsLicenseId** - An alphanumeric identifier of the license that was issued to the user 

  - **SkuIdIsNull** – Indicates whether we encountered an error and don't know the product that the user is running 

  - **SlapiIsNull** – Indicates whether we encountered a problem in populating one of the licensing objects 

### Office.Licensing.OnlineRepair 

If we aren't able to activate a user for some reason and have to show them a dialog that asks them to go online and try repair steps, this event is fired. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

This event collects no fields.

### Office.Licensing.OOBE.HandleDigitalAttachFailure

This event is triggered when the service check (see Office.Licensing.OOBE.SearchForDigitalAttach) didn’t find a claimable Digital Attach offer on this device. Based on the different conditions of the device, we'll show different dialogs to user. This event will log various scenarios on how we handle digital attach failure.

The following fields are collected:

- **Activity_Result_Tag** tells us how we transition user to various error states.
   - 0x222e318f - We should keep searching Activation for Office offer.
   - 0x222e318e - We'll fall back to OEM mode in this session for when this device doesn’t come with any Digital Attach offer.
   - 0x222e318d - No internet connectivity, which will lead us to show NoInternetConnectivity dialog to user 
   - 0 - We'll show various error UI to user based on their specific error code.

- **Data_DigitalAttachErrorType** - tells us what the specific error code is from the service call.

- **Data_FallbackFlight** - tells us if the UseAFOAsFallBack flight is turned ON or not.


### Office.Licensing.OOBE.HandleDigitalAttachSuccess

This event is triggered when the service check finds a claimable Digital Attach offer on this device. Based on the different conditions of the device, we'll show different dialogs to user. This event will log various scenarios on how we handle digital attach success.

The following fields are collected:

- **Activity_Result_Tag** - tells us how we handle the Digital Attach Success scenarios.
   - 0 - We’re able to auto load identity and we’ve shown the "You've got Office" (with account) UI to the user.
   - 0x222e3191 - We’re not able to auto load identity, so we’re going to show them the "You've got Office" (without account) UI.
   - 0x222e3193 - We’ve shown the "You've got Office" (without account) UI to the user, or we don’t need to show any "You've got Office" UI to the user because it’s a device-based offer.

- **Data_IsClaimTypeDevice** - tells us if the claim type of the digital attach offer is device based.

### Office.Licensing.OOBE.PopulateDigitalAttachOfferSignInDEX

Original Equipment Manufacturers (OEM) sell machines that come with Office (one-year subscriptions or perpetual) which are paid for when the customer purchases their machine. This event tracks when an Office pre-entitlement is found for the device and the user is already signed in with a Microsoft Account to allow us to monitor the health of the system and services.

The following fields are collected:

- **Data_ExpirationDate** - tells us the expiration date for the subscription offer

- **Data_IsSubscription** - tells us if the to-be-claimed product is subscription SKU or perpetual SKU

- **Data_ProductName** - tells us the product name of the digital attach offer


### Office.Licensing.OOBE.SearchForDigitalAttach

Original Equipment Manufacturers (OEM) sell machines that come with Office (one-year subscriptions or perpetual) which are paid for when the customer purchases their machine. Machines that are setup with a specific regkey (OOBEMode: OEMTA) might have an Office offer digitally attached to it. When we boot Office, we perform service checks to see if a digitally attached Office offer is found. This activity is instrumented to track this. 

The following fields are collected:

- **Activity_Result_Tag** - tells us the overall result of this service check. 
   - 0x222e318c	Digital Attach Flight is turned OFF, so no service check is made.
   - 0x222e318b	The client doesn’t have internet, so no service check is made.
   - 0x222e318a	Found a redeemable Digital Attach offer
   - 0x222e3189	Found a non-redeemable Digital Attach offer

- **Data_EnableDAFlight** - tells us if the Digital Attach flight that enables this service check is ON or not.


### Office.Licensing.OOBE.ShowTouchlessAttachFailureDialog

Original Equipment Manufacturers (OEM) sell machines that come with Office (one-year subscriptions or perpetual) which are paid for when the customer purchases their machine. This event is triggered when an error occurs in the Digital Attach redemption and activation flow for OEM PCs that come pre-entitled with Office.  We use this data to monitor the health of the systems and services and fix issues related the OEM Office activation flow.

The following fields are collected:

- **Data_Continue** - tells us if user clicks “Continue” on the dialog.

- **Activity_Result_Tag** - tells us the button the user clicked on the dialog.
   - 0x222e319d - User clicks “Retry” on the dialog
   - 0x222e319c - User clicks “Continue” on the dialog
   - 0 - User exits out of the dialog

- **Data_IsForDigitalAttach** - tells us which platform and workflow the user is on – Legacy (Activation for Office (AFO)) or Modern (Digital Attach).

- **Data_Retry** - tells us if the user clicks “Retry” on the dialog.


### Office.Licensing.OOBE.ShowTouchlessAttachOfferDialog

Original Equipment Manufacturers (OEM) sell machines that come with Office (one-year subscriptions or perpetual) which are paid for when the customer purchases their machine. This event tracks when an Office pre-entitlement is found for the device and the user isn't signed in with a Microsoft Account to allow us to monitor the health of the system and services.

The following fields are collected:

- **Activity_Result_Tag** - tells us if an identity was found for the user
   - 0x222e3194 - We’re not able to get user identity (they either cancelled sign-in or authentication failed).
   - 0 - We got an identity from user.

- **Data_ExpirationDate** - tells us the expiration date for the subscription offer

- **Data_IsCentennial** - tells us if the running office application is on centennial platform

- **Data_IsForDigitalAttach** - tells us if this dialog is triggered from Digital Attach flow or Activation for Office flow.

- **Data_IsSubscription** - tells us if the to-be-claimed product is subscription SKU or perpetual SKU

- **Data_OExType** - tells us if user exits out the dialog after they click ChangeAccount link

- **Data_ProductName** - tells us the product name of the digital attach offer

- **Data_UseInAppRedemption** - tells us if we use in-app redemption of web redemption – this is only relevant to Activation for Office flow.


### Office.Licensing.OOBE.TryBuyChoice

Users with pre-installed Office on new machines who have no Office entitlement are shown a dialog through which they can try, buy or enter a product key to get licensed. This event captures the user action on the dialog. This event is used to track the user action taken on the dialog shown to users with no Office entitlement where Office was pre-installed on the machine and helps determining if the user is licensed or unlicensed by design.

The following fields are collected:

- **Buy** - Tells if the user clicked on the buy button or not

- **ForceAutoActivate** - Tells if in-app activation should be attempted or not

- **GoBackToSignIn** - Tells if the user wanted to sign in again (possibly with another account)

- **IsPin** - Tells if the user entered a pin

- **ProductKey** - Tells if the user tried to enter a product key

- **Try** - Tells if the user clicked on the try button or not

- **UserDismissed** - This tells if the user dismissed the dialog and thus would be in grace or reduced functionality mode because they didn't choose to buy office or get a trial

### Office.Licensing.Purchase 

*[This event has been removed from current builds of Office, but might still appear in older builds.]*

We have an experiment that gives the user an option to try and set up autopay for Office directly from an app without ever leaving the context of the app. This reports the success or failure of that experiment along with the error code It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **StorePurchaseStatus** – Represents the error code/success code of the purchase call that was made through windows store

### Office.Licensing.SearchForSessionToken

If the user is running under shared computer activation mode, we try to search for a session token on the machine which allows the user to use the app. This event reports the success or failure of the scenario along with the error code. It's critical in detecting if the user is in a good state and not missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **LoadLicenseResult** – Represents the error code/success code of whether we were able to load the licenses for the current user

  - **OpportunisticTokenRenewalAttempted** – Indicates whether we attempted to renew the user's session token opportunistically

  - **SetAcidResult** – Represent the error code/success code of whether we were able to set the acid to the expected value


### Office.Licensing.ShouldRunRedesignedGraceExperience

This event is triggered when determining if a user should fall into new Office client licensing experiences (LVUX 1.0) or old Office client licensing experiences (LVUX 2.0). Used to verify that users are entering LVUX 1.0/2.0 based on a set of eligibility criteria. LVUX = Licensing Validation User Experience.

The following fields are collected:

- None 


### Office.Licensing.ShowNewDeviceActivationDialog

On the first boot of an Office app, we'll try to show a sign in dialog pre-populated with the credentials the user employed to download Office. The user can then continue to sign-in with those credentials, use different credentials or dismiss the dialog. This event reports the action taken by the user when presented with this dialog. It's critical for detecting if a user is in a good state on the modern licensing stack, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **UserAction** – Identifier for the action taken by the user when presented with the dialog.

### Office.Licensing.SkuToSkuConversion

As part of licensing the user, if we have to change the user's SKU from one SKU to another, we send this signal out along with the success or failure code. It's critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine.

The following fields are collected:

  - **DestinationSku** – Name of the SKU to which the currently installed product should be converted to

  - **PendingAcid** – ID of the product for which a SKU conversion is pending

  - **SourceSku** – Name of the original SKU that was installed on the machine

  - **UninstallProduct** – Indicates whether the old product will be uninstalled as part of the conversion


### Office.Licensing.StartTrialPass

This event is triggered when the user accepts a 5-day, or 10-day trial pass and an associated license gets installed. It's used to verify that the user can start the 5-day or 10-day Trial pass.

The following fields are collected:

- **Acid** - The Globally Unique Identifier (GUID) representing the license SKU

- **GraceTime** - the total time granted by the grace license


### Office.Licensing.TelemetryFlow.OLSResults

When a user is unlicensed, we make several service calls to get the user into a licensed state and to activate their Office product.  This event gets triggered on calling the Office Licensing Service to check if the user has entitlements.  This event is going to be used to track the user licensing health after calling the Office Licensing Service and the Office Client health after attempting to get Office activated.

The following fields are collected:

- **EntitlementPickerShown** - Tells if the user had multiple entitlements and if the user had to manually choose from them to get licensed

- **GetAuthResult** - Tells various states the client might be in like if they got an empty product key from the Office Licensing Service or if they were entitled for another product and Office needs to be converted to the new product

- **GetEntitlementsCount** - Tells the number of entitlements the user has

- **GetEntitlementsSucceeded** - Tells if the call to an Office Licensing Service API to retrieve the user's entitlements succeeded or not

- **GetKeySucceeded** - Tells if the call to an Office Licensing Service API to retrieve a key succeeded

- **GetNextUserLicenseResult** - Tells if the modern licensing stack was able to work and if the user got licensed or not

- **InstallKeyResult** - Tells various reasons why the user might be in a bad state like if activation failed or the installation of the key failed

- **NotInitializedBeforeWhileAdding** - This is just informational and tells if the event was added to a telemetry manager map without explicitly registering for it

- **NotInitializedBeforeWhileSending** - This is just informational and tells if the event was attempted to be sent without explicitly registering for it in the telemetry manager map before hand

- **SentOnDestruction** - This is just informational and tells if the event was added to a telemetry manager map and wasn't sent explicitly

- **Tag** - Used for telling where in the code the event was sent from

- **VerifyEntitlementsResult** - Tells various states the user might be in after validating the entitlements retrieved from the Office Licensing Service

### Office.Licensing.TelemetryFlow.SearchForBindingResult

OEMs sell machines that come with Office (one-year subscriptions or perpetual).  These Office products are paid for when the customer purchases their machine. Machines that are set up with a specific regkey (OOBEMode: OEMTA) might have an Office binding associated with it.  When we boot Office on such machines, we perform service checks to see if an Office binding corresponding to the machine is found.

This telemetry activity tracks the success and failure points in searching for a binding so that we can ensure that machines that do have a binding can successfully fetch them, and that our services are healthy.  This activity doesn't track machines that turn out to not have any bindings associated with them after we check with our services.

The following fields are collected:

- **DexShouldRetry** - Signal that we’ve hit a retryable issue (no internet or servers are down)

- **GenuineTicketFailure** - Tells us the failure HRESULT when trying to get the machine's Windows genuine ticket/product key (WPK).

- **PinValidationFailure** - Tells us why the pin validation process failed. Possible errors:
    - GeoBlocked
    - InvalidFormat
    - InvalidPin
    - InvalidState
    - InvalidVersion
    - Unknown
    - Used

- **PinValidationResult** - Tells us the pin validation result of a pin that we failed to crack.

- **Pkpn** - The pkpn range that the pin belongs to.

- **Success** - Indicates that we successfully fetched a valid Office binding (pin) for the machine.

- **Tag** - Tells us at which step we stopped searching for a binding. Possible tags:
  - 0x03113809    No internet/service error while validating pin
  - 0x0311380a    Pin validation failure, sent with PinValidationFailure field
  - 0x0310410f    Success, sent with Success field
  - 0x0311380d    Retry-able errors (internet issues, unknown errors)
  - 0x0311380e    Non-retry-able errors (binding offer expired)
  - 0x0311380f    Other errors (unable to license)
  - 0x03104111    Failed to crack the Office pin, sent with PinValidationResult field

- **WpkBindingFailure** - Tells us the error code of getting the Office pin bound to the machine's WPK.

### Office.Licensing.TelemetryFlow.ShowAFODialogs

After successfully obtaining a valid Office pin bound to a machine pre-bundled with Office, we show the user either a sign-in dialog or a redemption dialog.  Once the pin is redeemed, we show the license terms dialog.  As a part of our modernizing Activation for Office feature, we refreshed the two dialogs to convey more information regarding the Office product that comes with the machine.  This telemetry is to track if our feature successfully reduces user friction in redeeming their product by tracking the flow and exit points of the redemption process (which dialog was dismissed).

The following fields are collected:

- **ActionActivate** - Signal that user clicked the “Activate” button.

- **ActionChangeAccount** -  Signal that user clicked the “Use a different account” hyperlink.

- **ActionCreateAccount** - Signal that user clicked the “Create account” button.

- **ActionSignIn** - Signal that user clicked the “Sign in” button.

- **CurrentView** - The type of dialog the user closed.

- **DialogEULA** -  Signal that we showed the ‘Accept license terms’ dialog. 

- **DialogRedemption** - Signal that we showed the Activation for Office redemption dialog.

- **DialogSignIn** - Signal that we showed the Activation for Office sign-in dialog.

- **EmptyRedemptionDefaults** - Signal that we failed to fetch default redemption information.
 
- **GetRedemptionInfo** - Signal that we’re fetching demographic information for pin redemption.

- **MalformedCountryCode** - Signal that the country or region code needed for pin redemption is malformed.

- **OExDetails** - The error details we get back when identity's sign-in dialog was dismissed.

- **OExType** - The error type we get back when identity's sign-in dialog was dismissed.

- **Tag** - Tells us at which step the user exits the Activation for Office redemption process. Possible tags:
    - 0x0311380b    User dismissed identity's sign-in dialog from redemption dialog
    - 0x0311380c    Failed to auto-load an identity post user sign-in from redemption dialog
    - 0x03113810    Failed to load the account's demographic information (country or region code, language,     currency, trial offer, and marketing preferences)
    - 0x03113805    User dismissed identity's sign-in dialog from sign-in dialog
    - 0x03113806    Failed to auto-load an identity post user sign-in from sign-in dialog
    - 0x03113807    Failed to auto-load an identity
    - 0x03113811    User closed the sign-in/redemption dialog
    - 0x03113812    User closed the accept license terms dialog
    - 0x03113808    User accepted the license terms
    - 0x03113811	  User closed a dialog
    - 0x2370e3a0	  User closed a dialog
    - 0x2370e3c1	  Go to web for pin redemption
    - 0x2370e3a1 	  Go to web for pin redemption
    - 0x2370e3c0	  Dialog sequence looped caused by user going back and forth in the dialog flow
    - 0x2370e3a3	  User clicked “Not now” hyperlink which skips the Activation for Office offer for that session
    - 0x2370e3a2	  User clicked on “Never show this to me” hyperlink which disables the Activation for Office offer


- **UseInAppRedemption** - Tells us if we're keeping users in-app for redemption or sending them to the web to redeem their fetched pin (pre-populated).

- **UseModernAFO** - Tells us if we're using the new or old Activation for Office experience.

### Office.Licensing.TelemetryFlow.ShowTryBuyDialogForOOBE

When new machines have Office pre-installed and the user doesn't have an entitlement we show a dialog which gives the user the option to try, buy or enter a product key so that the user can get licensed and this event tracks if the dialog was shown. This event will help with knowing if the dialog was shown to the user to try, buy or enter the product key and hence will help us determine if the user had the opportunity to get licensed.

The following fields are collected: 

- **ActiveView** - Tells the dialog ID shown to the user

- **CurrentOOBEMode** - Tells the pre-install mode (OOBE mode such as Activation for Office, OEM etc.)

- **NotInitializedBeforeWhileAdding** - This is just informational and tells if the event was added to a telemetry manager map without explicitly registering for it

- **SentOnDestruction** - This is just informational and tells if the event was added to a telemetry manager map and wasn't sent explicitly

- **ShowTryButton** - Tells if the Try Button was shown to the user on the dialog or not

- **Tag** - Used for telling where in the code the event was sent from

### Office.Licensing.TelemetryFlow.TrialFlow

When an unlicensed user of Office pre-installed on a machine is attempting to get a trial, this event gets triggered.  It's used to see which path the user would follow to get a trial and if there were any errors while getting the trial through in-app purchases.  Depending on the user action and the result of the in-app purchase the user could end up being unlicensed.

The following fields are collected:

- **HasConnectivity** - Tells if the user has internet connectivity and in case there isn't the user might have to use a grace license for five days or may be in reduced functionality mode

- **InAppTrialPurchase** - Tells if the flight is enabled for launching the Store Purchase SDK to capture PI and purchase a trial from within the application *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **IsRS1OrGreater** - Tells if the OS Version is greater than RS1 or not since the Store Purchase SDK should be used only if the OS Version is greater that RS1

- **NotInitializedBeforeWhileAdding**: This is just informational and tells if the event was added to a telemetry manager map without explicitly registering for it

- **OEMSendToWebForTrial** - Tells if the flight is enabled to send users to the web to redeem a trial

- **StoreErrorConditions** - Tells the various conditions under which the Store Purchase SDK could have failed *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **StoreErrorHResult** - Tells the error code returned from the Store Purchase SDK *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **StorePurchaseStatusResult** - Tells the result of calling the Store Purchase SDK and if the user made a purchase or not which will help determine if the user should get licensed to use Office *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **Tag** - Used for telling where in the code the event was sent from

- **UserSignedInExplicitly** - Tells if the user signed in explicitly in which case, we would re-direct users to the web for the trial *[This field has been removed from current builds of Office, but might still appear in older builds.]*

### Office.Licensing.UseGraceKey

For some reason if we're unable to license the user, we install a grace key and send out this signal that signifies. It's critical in detecting if the user is in a good state and missing functionality, used for system health and used for diagnostic purposes if a user reports an issue with their machine

The following fields are collected:

  - **OpportunisticTokenRenewalAttempted** – Indicates if we attempted an opportunistic renewal for the user in shared computer activation mode

  - **ReArmResult** – Indicates the result of rearming the installed key which can extend the expiry of the current license


### Office.Omex.Checkout.Analytics.CheckoutStageChangeActivity

The event is triggered as the user progresses through the steps required to complete purchase. It's used to monitor the purchase flow in various dimensions and troubleshoot its performance.

The following fields are collected:

- **AvailabilityId** - pricing variant of the product that the user is attempting to purchase.

- **CurrentStage** - current step of the purchase flow.

- **Error** - error description that is related to the given step of the purchase flow, if any.

- **PaymentInstrumentsNumber** - number of payment instruments that the user has on profile.

- **PreviousStage** - the step of the purchase flow that user arrived from.

- **ProductId** - product that the user is attempting to purchase.

- **Query.Flights** - information about features that has been enabled for the user.

- **Query.Language** - user experience language of the attempted purchase.

- **Query.Market** - market of the attempted purchase.

- **Query.PageURL** - browser URL that the user is using while attempting purchase.

- **Query.ReferralURL** - browser URL that referred user to purchase.

- **SelectedPaymentInstrumentFamily** - family of the payment instrument that is selected for the purchase.

- **SelectedPaymentInstrumentType** - type of the payment instrument that is selected for the purchase.

- **SkuId** - billing variant (SKU ID) of the product that the user is attempting to purchase.

- **Tracing.CheckoutVersion** - version of the purchase flow component.

- **Tracing.Environment** - environment that emits the event, e.g., production or pre-production.

- **Tracing.TraceId** - ID to correlate the event with other events from the same user session.


### Office.Omex.Checkout.MonitoringEvent

The event is triggered by the finished service call or operation triggered by the user. It's used to monitor the performance and diagnose the issues with the checkout process and services it's backed with.

The following fields are collected:

- **Agent.Datacenter** - identification of the monitoring agent; location of the datacenter that is hosting the checkout experience.

- **Agent.Role** - identification of the monitoring agent; type of service emitting the telemetry.

- **Agent.RoleInstance** - identification of the monitoring agent; service instance emitting the telemetry.

- **Agent.ServiceName** - identification of the monitoring agent; service emitting the telemetry.

- **Agent.Tenant** - identification of the monitoring agent; service cluster.

- **Duration** - duration of the operation execution, e.g., service call.

- **Metadata** - additional operation metadata, if applicable in specific scenario.

- **Result** - outcome of the operation, e.g., success or failure.

- **ScopeName** - identifier of operation result of which is being reported.

- **Subtype** - subtype of the operation, if applicable in specific scenario, e.g., a product user tried to buy when operation happened.

- **Tracing.CheckoutVersion** - version of the purchase flow component.

- **Tracing.Environment** - environment that emits the event, e.g., production or pre-production.

- **Tracing.TraceId** - ID to correlate the event with other events from the same user session.


### Office.SetupOffice.Sdx.Log 

This event is triggered when we redeem an Office offer for the user who either bought a device bundled with an OEM Office pre-entitlement or has entered a product key. This data is used for general log messages.

The following fields are collected:

- **Ctid (Data_Ctid)** - CorrelationId is used for linking different logs withing one redemption session.

- **Environment (Data_ Environment)** - dev environment (Pr, Edog, Prod, Int).

- **Message (Data_Message)** - The log message from setup.office.com. For example, "image ‘../img/spinner.csv’ can’t be loaded, cdn is used."

- **Type (Data_Type)** - The type of log message (Error, Warning, Info)

### Office.Taos.Hub.Windows.Device

This event gets triggered on app boot. This event is used to record the WebView version/metadata available on the user's device. 

The following fields are collected:

- **ApiVersion** - Version of the API.
 
- **AppInfo_Id** - The App ID.

- **AppInfo_Version** - Office desktop app version.

- **AppType** - The type of the container, from which logs are emitted.

- **BridgeInstanceId** -  A unique ID given to the office windows app instance, used to corelate all the events from a single app session. We can't derive any PII from this ID.

- **DeviceInfo_Id** - A unique device ID calculated by 1DS SDK.

- **DeviceInfo_Make** - The device make.

- **DeviceInfo_Model** - The device model.

- **DeviceInfo_NetworkCost** - Network cost type of the user (Unmetered, metered, etc.)

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown).

- **DeviceInfo_OsName** - OS name installed in the user's device.

- **DeviceInfo_OsVersion** - The OS version installed in the user's device. 

- **DeviceInfo_SDKUid** - Unique identifier for the SDK. 

- **EventInfo_BaseEventType** - The event type.

- **EventInfo_BaseType** - The type of the event.

- **EventInfo_Level** - The event level.

- **EventInfo_Name** - The name of the event.

- **EventInfo_PrivTags** - The event tags.

- **EventInfo_SdkVersion** - 1DS SDK version.

- **EventInfo_Source** - The source of the event. For example, OneCollector

- **EventInfo_Time** - The time of the event.

- **ExitCode** - The exit code.

- **FailReason** - The reason for the failure.

- **Feature** - The name of the Feature.

- **JsonResult** - The name of the calling method.

- **M365aInfo_EnrolledTenantId** - The Enrollment TenantID.

- **Method** - The name of the calling method.

- **PipelineInfo_AccountId** - Aria Pipeline account ID

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address).

- **PipelineInfo_ClientIp** - The first three octets of the IP address.

- **PipelineInfo_IngestionTime** - Ingestion time of the event.

- **UserInfo_TimeZone** - Time zone of the user.

- **Version** - Version of the WebView present in the user's device.


### Office.Taos.Hub.Windows.OfficeLicense

This event gets triggered on app boot. This event is used to record the license status of the installed Office apps. 

The following fields are collected:

- **ApiVersion** - Version of the API.
 
- **AppInfo_Id** - The App ID.

- **AppInfo_Version** - Office desktop app version.

- **AppType** - The type of the container, from which logs are emitted.

- **BridgeInstanceId** -  A unique ID given to the Office windows app instance, used to corelate all the events from a single app session. We can't derive any PII from this ID.

- **Count** - Count of licenses.

- **Description** - Description of the license.

- **DeviceInfo_Id** - A unique device id calculated by 1DS SDK.

- **DeviceInfo_Make** - The device make.

- **DeviceInfo_Model** - The device model.

- **DeviceInfo_NetworkCost** - Network cost type of the user (Unmetered, metered, etc.)

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown).

- **DeviceInfo_OsName** - OS name installed in the user's device.

- **DeviceInfo_OsVersion** - The OS version installed in the user's device. 

- **DeviceInfo_SDKUid** - Unique identifier for the SDK. 

- **EventInfo_BaseEventType** - The event type.

- **EventInfo_BaseType** - The type of the event.

- **EventInfo_Level** - The event Level.

- **EventInfo_Name** - The name of the event.

- **EventInfo_PrivTags** - The event tags.

- **EventInfo_SdkVersion** - 1DS SDK version.

- **EventInfo_Source** - The source of the event. For example, OneCollector

- **EventInfo_Time** - The time of the event.

- **Feature** - The name of the feature.

- **FetchDuration** - The duration of the fetch.

- **Licensed** - A boolean value indicating whether licensed or not.

- **M365aInfo_EnrolledTenantId** - The Enrollment TenantID.

- **Method** - The name of the calling method.

- **Name** - Name of the license.

- **PerformanceMarkerTimestamp** - The Performance Timestamp.

- **PipelineInfo_AccountId** - Aria Pipeline account ID

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address).

- **PipelineInfo_ClientIp** - The first three octets of the IP address.

- **PipelineInfo_IngestionTime** - Ingestion time of the event.

- **Reason** - License Status Reason.

- **Status** - Status of the license.

- **Timeout** - Timeout time in milliseconds.

- **UserInfo_TimeZone** - Time zone of the user.

- **VolumeActivationType** - Name of the Volume Activation Type.


### OneNote.EnrollmentResult
 
This event logs the status upon Intune enrollment.  This scenario is specific to Intune enabled accounts.
 
The following fields are collected:
 
- **EnrollmentResult** - The result of Intune enrollment

### SKU.PRODUCT.PRICE.NULL.EVENT

This event is used to capture events to quantify the impact of the bug due to which users today see “Null” instead of a price at the SKU chooser screen. The bug will be diagnosed further to determine a fix. 

The following fields are collected:

- **PriceNotFound** - Prices isn't found from the store.

- **StoreNotInitilized** - When store isn't initialized successfully.


## Microsoft AutoUpdate (MAU) events

### additionalappinfo.invalidpreference

This event reports on invalid preference set to display more information with respect to End of Service for a product. We use this information to advise customers to set correct preferences in order to see additional information.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **Reason** - Details on the invalid entry in preferences

- **SessionId** - The identifier for the session

### appdelegate.launch

This event denotes that an attempt to launch the app occurred. We log its result (failure or success). We use this event to identify cases in which MAU fails to launch

The following fields are collected:

- **App** - The application process sending the event
    
- **AppInfo_Language** - The language the application is running under

- **AppversionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - A set of static text indicating launch status.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### appdelegate.terminate

This event denotes that a graceful Application Exit occurred. We use this event to distinguish Graceful Application Exits from ungraceful ones.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience
    
- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier
    
- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wifi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text indicating Microsoft Autoupdate has terminated.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### appinstall.connecttoxpc

This event denotes that errors occurred connecting to MAU Helper (a component that performs application installation).  This event denotes a potential corruption of the MAU application. The device won't be able to install updates.

The following fields are collected:    

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains error information on the connection issue.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### appinstall.logscanned

This event is used to determine if log file was successfully processed. We use this event to detect and address any issues arise during application installation. 
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Reports on errors found during application install and/or scan completion status 

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session

### appinstall.xpcremoteobjecterror

This event reports on an error found while attempting to connect to Privileged Helper Tool via XPC connection. We use this event to track and address possible MAU installation issues.

The following fields are collected:

- **App** – The application process sending the event

- **AppID** – The application identifier.

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Contains information on the nature of proxy error encountered

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session


### appregistry.config

This event reports on any errors encountered while loading application registry information. Microsoft uses this report to advise corporate IT administrators of the correct format for setting up client application registrations.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Contains information on the nature of error encountered with application registration.

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **Reason** - String contain for detailed reason associated with the event.

- **SessionId** – The identifier for the session

### appregistry.info

This event denotes that the application launched. We use this event to list the applications for which MAU can control updates, the number of copies available as well as their version and install location (default or other).

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on list of identifiers application uses to register with Microsoft Autoupdate services and number of installations registered for the application.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### appregistry.remove

This event denotes that an attempt to remove an App from the list of applications Managed by MAU took place. We use this event to confirm that only MAU-released applications are managed via MAU (no AppStore apps should appear here).

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Name and identifier of the application being removed, whether the application still exists in the registered location and if the application was installed from AppStore.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### Campaign

This event is triggered when a campaign is found but the Microsoft Auto Update (MAU) client is unable to update the Office application. The data will show if the hyperlink is shown to the user and whether the user clicked on the link to act. The data enables the client to resolve the problem.  

The following fields are collected:

- **CampaignID** - Integer value indicating the Campaign ID, which is a unique identifier associated with each campaign sent from the server.

- **Payload** - Generic column containing event specific messages. This is only to be used in case of Campaign.Hyperlink.Clicked and would contain the URL shown to and clicked by the user.  

- **Reason** - String for detailed reason associated with the event. For this feature, it would contain the following strings:

  - **Campaign.Found** - This is triggered when there's a campaign available to the client after the client starts. A campaign is served to the MAU client when the client isn't able to update the Office application. This event will confirm that the campaign was served to the client correctly.

  - **Campaign.Hyperlink.Clicked** - This is triggered when the hyperlink containing instructions on the campaign dialog is clicked by the user. The link will contain information to fix the problem or to update the MAU app itself. The event shows whether the user clicked on the link provided in the campaign and was able to fix the problem.

  - **Campaign.Shown** - This is triggered after showing the campaign dialog to the user. Campaign dialog will contain textual information to help the user to fix the MAU client and start the application updates. This event will tell us if the user saw the message to act and that campaign was shown properly to the user.

 
### campaign.found

This event is triggered when Microsoft AutoUpdate finds a campaign available from the backend. This event reports that there was a campaign found by the client. The data is used to check if campaigns have been served to clients properly.

The following fields are collected: 

- **CampaignID** - Integer value indicating the Campaign ID


### catalog.errorsignature

This event reports on various problems with downloaded files, including vendor signature and hash value mismatch on downloaded file. We use this event to detect problems in publishing manifest set for applications.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **FileHash** – Hash value of the downloaded file

- **FileName** – The name of the file showing hash value mismatch

- **HashInCatalog** – Hash value entry in the corresponding catalog file

- **HowTocheck** - The preference for checking of updates

- **Payload** - contains information on the app reporting problem

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### catalog.invalid

This event logs an error condition pointing to invalid manifest catalog downloaded. We use this event to ensure no errors are present in published manifest files. 

The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **CatalogFile** – Name of the catalog file that caused error condition.

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry got received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first 3 octets of the IP address

- **SessionId** – The identifier for the session


### cloningtask.begin

This event indicates start of cloning task prior to application update. We use this event in conjunction with cloningtask.status event to determine volume of cloning failures in order to determine whether cloning feature should be throttled on different audience channels.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppID** – The application identifier.

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session

- **UpdateID** – The identifier for update.


### cloningtask.helpertoolconnection

This event records issues with install on clone (i.e. either we fail to connect to the helper to apply an update, or we connect but the helper is unable to apply the update). If we ever get a record reported, this means install on clone has failed and will now have to fall back to an in-place update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an ID to identify a single update activity, and Proxy Error reported during cloning process.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### cloningtask.status

This event indicates status of cloning process for the application to be updated. We use this event to determine success rate as well as types of errors encountered causing failures. This event is used to determine whether cloning feature should be throttled on different audience channels.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - The string contains error information if error occurred during cloning task.

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - The string representation of a Boolean variable.

- **UpdateID** - The identifier for update.

### cloningtask.status.finish

This event reports on the completion of “cloning” task. This event forms part of the update funnel report and we use it to determine health of application updates.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - Indication whether the cloning task succeeded

- **UpdateID** - The update identifier.


### configuration.channel

This event records attempts to switch Channels (Audience Group) in MAU.  We use this to log attempts and their results (success or failure).

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains selected Channel Name.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### configuration.metadata

This event is logged whenever MAU is initializing. It's a MAU heartbeat type of event

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text indicating either individual metadata is being initialized, or configuration is being initialized.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session.


### configuration.preference

This event is logged whenever Microsoft AutoUpdate encounters an issue with preferences. The data will be used to determine extent of issues caused by clients incorrectly setting applications dictionary.

The following fields are collected

- **Payload** - Static text.


### configuration.systemVersion

This event indicates an attempt to retrieve system version has failed. This also contains information on the information Microsoft Auto Update (MAU) was able to collect from the system. We use this event to determine whether MAU should cater for failures. Note that system version is used to determine whether an update can be applied to the client device.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on error encountered while retrieving macOS system version string.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### controller.alertmanager.reinstallresponse

This event denotes that MAU fell into an unusable/unrecoverable state and needs to be reinstalled. This event denotes an unrecoverable error and user intervention is required.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference of checking for updates

- **Payload** - Contains enumerated user selection.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.alertmanager.tmpdiskfull

This event denotes that insufficient disk space was detected. We won't be able to install updates due to insufficient disk space.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.alertmanager.tmpdiskfullretry

This event denotes that a retry attempt to install an update was initiated after Insufficient disk space was detected. We retry the installation after not being able to install updates due to insufficient disk space.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session
    

### controller.alertmanager.tmpdiskfullretrycancel

This event denotes that a cancellation on an install-retry attempt after Insufficient disk space was detected. We use this event to determine if our fallback mechanism was enough to guide the user through the update process when insufficient disk was detected.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)
    
- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates
    
- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.checkwindow.noupdatefoundok

This event denotes that a check for updates resulted in no updates found. We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    

### controller.checkwindow.updatecheck

This event denotes that a check for updates was performed. We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier
    
- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.checkwindow.updatecheckcancel

This event denotes that the process of checking for updates was canceled (either by the user or by the system). We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.checkwindow.updatecheckcanceluser

This event denotes that the process of checking for updates was canceled by the user.  We use this event for ensuring updates are offered correctly, optimizing service loads, and define how frequent our updates checks should be. We also want to optimize our release cadence based on user expectation of updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version
    
- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.checkwindow.updatesfound

This event denotes that the process of checking for updates resulted in updates found.  We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.checkwindow.uptodate

This event denotes that the process of checking for updates resulted no updates because apps in the device are up to date.  We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.applaunchwithpendingupdate

This event denotes that an app that is in the process of getting updates was launched. We use this event for ensuring updates are offered correctly. We should prevent opened apps from getting updates. Apps must be closed prior to update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address
    
- **SessionId** - The identifier for the session

    
### controller.downloadwindow.closeapplicationdialog

This event denotes that an app that is in the process of getting updates was launched. We use this event for ensuring updates are offered correctly. We should prevent opened apps from getting updates. Apps must be closed prior to update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.downloadwindow.curtasknull

This event denotes that an unexpected error occurred while attempting to apply an update. We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.downloadwindow.downloadcancel

This event denotes that the download process was canceled by user.  We use this event for ensuring updates are offered correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text. 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.downloadwindow.downloadfailed

This event denotes that a failure occurred when downloading an update. We use this event for ensuring updates are offered and downloaded correctly.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.downloadwindow.downloadfailedok

This event denotes that a failure occurred when downloading an update and the user was notified. We use this event for ensuring updates are offered and download correctly, and that in case of failure, a notification is served to the user.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.downloadpathmissing

This event denotes that a failure occurred when downloading an update. We use this event for ensuring updates are offered and downloaded correctly. This event indicates a download URL is missing.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.downloadtasknull

This event denotes that a failure occurred when downloading an update. We use this event for ensuring updates are offered and downloaded correctly. This event indicates that Microsoft Autoupdate was asked to pause/resume a download but couldn't find corresponding download manager.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.filesignaturenotverified

This event denotes that a failure occurred when downloading an update. This event indicates that Microsoft Autoupdate was unable to verify that this update was published by Microsoft. We use this event for ensuring updates are offered and downloaded correctly. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that contains download URL. This is a Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.installcomplete

This event denotes that the installation of all updates offered by Microsoft Autoupdate completed. We use this event for ensuring updates are offered and downloaded correctly. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under
    
- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.networkunavailablealert

This event denotes that network connectivity was lost while downloading updates.  We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.downloadwindow.networkunavailablealertok

This event denotes that network connectivity was lost while downloading updates. It also denotes that the user was notified of this error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.downloadwindow.noconnectionok

This event denotes that network connectivity was lost while downloading updates. It also denotes that the user was notified of this error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.repairrequired

This event denotes that the update process failed. It also denotes that an update was completed but Microsoft Autoupdate found a problem with updated application and repair is required. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)
    
- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device
    
- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### controller.downloadwindow.updateaborted

This event denotes that the update process was aborted. It also denotes that an update was already in progress by Daemon and user clicked OK to abort download. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.updatefailed

This event denotes that one or more updates from the current batch failed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.updatesuccessful

This event denotes that all updates from the current batch were successful. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.userpaused

This event denotes that all updates from the current batch were successful. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.downloadwindow.userresumed

This event denotes that the download updates process was resumed successfully after going into pause. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event
    
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.mainwindow.setautomaticchecking

This event denotes that the device was enrolled into Automatic Update mode. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

 - **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application Version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** – The Version of the Operating System

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first 3 octets of the IP address

- **SessionId** – The identifier for the session


### controller.mainwindow.setautomaticdownloadinstall

This event denotes that the device was enrolled into Automatic Update mode. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.mainwindow.setmanualchecking

This event denotes that the device was enrolled into Manual Update mode. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.templateawindow.cancel

This event denotes that the user chose to cancel or ignore a provided warning message. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.templateawindow.enroll

This event denotes that the user chose to follow a provided warning recommendation. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates
    
- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session



### controller.templateawindow.install

This event denotes that the user chose to follow a provided warning recommendation related to initiating a software installation action. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.updatewindow.begindownloadingapps

This event denotes that the download for updates was started via Update Window. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains a dictionary of available update packages and an indication whether user selected to install that entry.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.updatewindow.networkretry

This event denotes that a retry was triggered at the Update Sheet due to network failure. We use this event for ensuring the update process works as expected and to help troubleshoot errors.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.updatewindow.networkretrycancel

This event denotes that a retry couldn't be triggered at the Update Sheet due to network failure. This event indicates user elected to cancel updates after being alerted of network becoming unavailable. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.updatewindow.networkunavailable

This event denotes that network connectivity was suddenly lost. This event indicates server isn't reachable when attempting to download an update package. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.updatewindow.noupdateavailable

This event denotes that there was a search for updates that resulted in no updates being available. This event indicates no available updates were found by Microsoft Autoupdate. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### controller.updatewindow.noupdatestoselect

This event denotes that an error occurred resulting in an empty list of updates. This event indicates Microsoft Autoupdate is showing an empty update sheet. This shouldn't happen. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### Controller.UpdateWindow.UpdateAvailable

This event denotes that there was a search for updates that resulted in updates being offered. We use this even to determine whether updates are being offered for the user to see, whether the proper updates are being shown, or whether update blocking is working as expected. We use this event to ensure the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains a dictionary of available update packages and user selection status for each.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### controller.updatewindow.updateavailablecancel

This event denotes that a user canceled after we displayed the update sheet listing updates. We use this even to explain reasons for not updating (i.e. user willingly cancels). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadactor.pause

This event denotes that the user issued a request to pause the download. We use this even to explain reasons for updates apparently not completing. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadactor.redirect

This event denotes that the downloader agent is pointed to an endpoint that issues a URL redirect for the download request. We use this even to explain reasons for download failure and diagnose proxy issues. It can also help diagnose reasons why users are observed to install older builds. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains redirected URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### downloadactor.resume

This event denotes the user issues a request to resume a paused download. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadactor.resumeerror

This event denotes the user issues a request to resume a paused download. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download URL path. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### downloadactor.status

This event logs that there are attempts to fetch collateral files and their result (Success or Failure). We want to know the collaterals and packages being fetched. A wrong file being fetched can indicate a build/collateral issue. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download URL, and an error code in case of failure. Download URL is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.cachedupdate

This event is triggered when a download is requested and a cached file is already saved locally. This event reports on use of cached updates. The data is used to measure the success of cached update feature from the number of cached update packages located, used, failed verification, etc.

The following fields are collected:

- **AppID** - Identifier of application related to the event.

- **Reason** - String containing detailed reason associated with the event.

- **Success** - Boolean indicating success of operation related to the event.


### downloadmanifest.configuration

This event reports an error with Microsoft Auto Update (MAU) configuration - either with Custom Server setup in preferences or in endpoint definitions in Update Assistant in installed MAU components. We use this event to advise IT Admins to set correct Manifest Server endpoints.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **Payload** -Indicates whether error lies with custom server setup, or installed MAU components

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.downloadcatalogfail

This event a download failure occurred. The file that failed to download is logged. We want to know the collaterals and packages being fetched. A failure to download a manifest can point to either a build collateral generation failure, a CDN configuration error, a client configuration error, a network error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### downloadmanifest.downloadcatalogsuccess

This event denotes that a file was successfully downloaded. A failure to download a manifest can point to either a build collateral generation failure, a CDN configuration error, a client configuration error, a network error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
    
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.downloadfail

This event denotes that a download error occurred. The manifest or package file that failed to download as well as error details are logged. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.downloadfromurl

This event denotes that the downloading of a catalog file has started. We log the URL from which the catalog file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.downloading

This event denotes that the downloading of a catalog file has started. We log the URL from which the catalog file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.downloadsuccess

This event is triggered when the downloading of an XML and package file has succeeded. We log the URL from which the file is being downloaded. Microsoft uses this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier of application related to the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **CachedUpdate** - Indication whether a cached download is in use

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **LeapFrog**	- Boolean indicating whether the update is a “leapfrog” update. Leap Frog will offer delta updates to more recent version, but not to the latest version on offer.

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **Reason** - String contain for detailed reason associated with the event.

- **SessionId** - The identifier for the session

- **StaleCache** - Indication whether a download was necessary due to outdated cached update
    
### downloadmanifest.downloadurl

This event denotes that a request to download a file occurred. We log the URL from which the file is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
    
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains download error code and a download file URL. This is Microsoft download location except when the channel is set to Custom. For Custom channel, this value is set to "Custom Location".

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.filenameerror

This event denotes that an unexpected error occurred. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.invalidhash

This event indicates a security validation of our files failed. Microsoft uses this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier of application related to the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **CatalogID** - Identifier for the application catalog related to the event

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Error** - Indicates details on error encountered related to the event

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **File** - String showing current file name.

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains name of the downloaded file with invalid hash value.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.missingdaemon

This event denotes a user attempted to check for updates and we discovered that MAU was missing a core component (daemon). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.signatureerror

This event denotes that the code signature verification failed for a package. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains a name of the downloaded file with invalid hash value.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmanifest.status

This event logs a summarized aggregation of attempts/failures hit during the download process for manifest and package files. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information including URL (Microsoft address), prefix of the file being downloaded, any errors encountered, etc.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmgr.downloadend

This event logs a marker that indicates the download process completed on its own. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information including URL (Microsoft address), prefix of the file being downloaded, any errors encountered, etc.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### downloadmgr.downloadstart

This event logs the update that is about to be downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the name of the update being downloaded.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### downloadtask.downloadbegin

This event indicates start of download activity for an application update. This forms part of update funnel and we use this to determine health of application updates.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **BundleVersion** - Version of the application being updated

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **LeapFrog** - Boolean indicating whether the update is a “leapfrog” update. Leap Frog will offer delta updates to more recent version, but not to the latest version on offer.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **PreviousUpdateID** - Identifier for an application update

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdatePkg** - Name of the update package being applied

- **UpdateVersion** - Version of the application after the update


### downloadtask.downloadfailure

This event logs that an error occurred downloading a package file. We log the update path and the error. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** – The identifier of application that has download failure.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Error** – The error observed during download.

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the name of the update being downloaded and the error observed. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** – The identifier of the update being downloaded.


### downloadtask.downloadsuccess

The successful downloading a package file. We log the update path used. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** – The identifier of application.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the update path for the successful download.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** – The identifier of downloaded update.

### downloadtask.updatertypeerror

This event reports on an updater type error in the downloaded manifest file. We use this event to notify owner of the manifest file so that the error can be corrected.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdaterType** - Type of updater specified in the downloaded manifest file

- **UpdateURL** - URL of update package that needs to be applied

### downloadtask.urlerror

This event reports on an error in the URL specified in downloaded manifest file. We use this event to notify owner of the manifest file so that the error can be corrected.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **Error** - Indicates nature of error being encountered

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdateURL** - URL of update package that needs to be applied


### errorsandwarnings

This event is triggered by an abnormal condition detected while running Microsoft AutoUpdate. Microsoft uses the data to detect and address any issues found.

The following fields are collected:

- **AppID** - Identifier of application related to the event

- **Error** - Indicates details on error encountered related to the event

- **File** - String showing current file name.

- **Operation** - Indicates operation being performed when an error or a warning was encountered

- **UpdateID** - A unique identifier for an update. This identifier is used to correlate and identify any potential issues in update process.


### fba.changelastupdate

This event reports on when Microsoft Auto Update (MAU) has checked for updates. We use this event to debug when a particular device hasn't been offered an update for an extended period of time.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **Payload** - Contains date time of when MAU checked for updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### fba.checkforupdate

This event denotes that a background process is checking for updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba.checkforupdateskip

This event denotes that a background process skipped update due to MAU GUI being opened. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba.forceinstallmsgsent

This event indicates that a forced update is initiated from the user interface. This event forms part of funnel and is used to determine health of force update feature.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.forceupdatecheck

This event indicates update check is forced. We use this event to determine volume of forced update checks which happen outside normal update check cycle.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.guiappopen

This event indicates that the user interface is being launched under Automatic Check mode, as an application with applicable update is currently open. This event is used to determine volume of user interface launches from Automatic Check mode for future feature development.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.installpending

This event indicates Microsoft Auto Update (MAU) sent a notification regarding pending updates. This event is used to determine volume of updates that are initiated from user notifications and is used to enhance user experience by minimizing interruption to the user in the future releases.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.launch

This event indicates start of Microsoft Update Assistant with the method of being launched. This event is used to determine whether Microsoft Update Assistant is being launched in incorrect context.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.launchbyagent

This event indicates that the Microsoft Update Assistant has been launched via Launch Agent. This event is used to determine volume of Microsoft Update Assistant being launched from user interface for future development.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.launchfromprotocol

This event indicates that the Microsoft Update Assistant has been launched via URL protocol. This event is used to determine volume of Microsoft Update Assistant being launched via URL for future development.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains information about URL scheme and URL Host

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.launchgui

This event indicates that the Microsoft Update Assistant is attempting to launch Graphical User Interface (GUI). This event is used to determine volume of UI launches initiated from Microsoft Update Assistant, to help with future development, including minimizing user interruption from frequent UI launch.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### fba.launchstatus

This event logs MAU's daemon failures while attempting to launch. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Error** – Contains OSStatus (Apple status code) reflecting launch status.

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains OSStatus (Apple status code) reflecting launch status. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **Success** – The string Boolean indicating whether MAU daemon process was successfully launched.


### fba.mausilentupdate

This event indicates Microsoft Update Assistant is initiating silent updates. This event is used to determine volume of updates that are applied without user intervention, to help drive enhancements in user experience.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received
 
- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	Static text *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **Reason** - Static text indicating a silent update can't proceed as UI is open

- **SessionId** - The identifier for the session

### fba.moreinfofromappnotification

This event reports on information that a registered application is routing through Microsoft Auto Update (MAU). For example, end-of-service messages are pushed through MAU notification. We use this event to determine the volume of devices that are displaying this particular notification, to determine the success of information dissemination.

The following fields are collected:

- **AdditionalInfoID** - Uniquely identifies “More Info” being pushed through MAU.

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **NotificationEvent** - Static text indicating what type of notification is being applied.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.multipledaemon

This event indicates that another instance of Microsoft Update Assistant has been detected and current instance will be terminated. We'll be using this event to determine volume of devices that attempt to run multiple instances of Update Assistant and design a workaround if need arises.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.nofifyappclosed

This event indicates that the Microsoft Update Assistant is sending a notification for pending updates because there are no registered applications open and updates can proceed without interrupting the user. We use this event to determine volume of updates that can be applied but need user action to do so. This event is used to help drive enhancement in user experience.

The following fields are collected: 
	
- **App** - The application process sending the event
	
- **AppInfo_Language** - The language the application is running under
	
- **AppVersionLong** - The application version
	
- **Channel** - The preference for audience
	
- **Device_NetworkCountry** - The device country or region (based on IP address)
	
- **DeviceID** - The device identifier
	
- **DeviceInfo_Model** - The hardware model of the device
	
- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)
	
- **DeviceInfo_OsBuild** - The version of the operating system
	
- **Event_ReceivedTime** - The time at which telemetry was received
	
- **EventInfo_Name** - The name of the telemetry event being logged
	
- **EventInfo_Time** -	 The time at which the logged event took place 
	
- **HowToCheck** - How to check setting
	
- **Payload** -	 Static text
	
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)
	
- **PipelineInfo_ClientIp** - The first three octets of the IP address
	
- **SessionId** - The identifier for the session

### fba.nofifyappopen

This event indicates that the Microsoft Update Assistant is sending a notification for pending updates because there are registered applications open and updates will require the applications closed to proceed.  We use this event to determine volume of updates that require user intervention.  This event is used to help drive enhancement in user experience.

The following fields are collected:  

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under
	
- **AppVersionLong** - The application version
	
- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### fba.settimerfail  

This event indicates an attempt to set up timer to trigger a future update has failed. This event is critical, and we use this event to determine volume of failures to develop work-around if needed.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Contains information about last update time and calendar being used

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### fba.silentupdateoptin

This event denotes that the user is Opting into silent updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### fba.skipforcedupdate

This event indicates forced update check is being skipped due to open applications. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba.startforcedupdate

This event indicates that an attempt to apply a forced update has occurred. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba.terminate

This event indicates that the MAU daemon terminated normally. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fba.updatefound

This event indicates that the MAU daemon has found available updates to offer. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains number of available updates found.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### fba.updatetimer

This event indicates Microsoft Autoupdate Daemon process became active to check for updates after sleeping for set amount of time. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains current date time information.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.allappsclosed

This event logs if all apps were closed prior to an install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience
    
- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.applaunchafterupdate

This event logs an attempt to relaunch the app after a silent update and the update mode (clone or not). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** – The identifier of the application.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Error** – The detail of the error occurred during launching application after update.

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the application be launched. *[This field has been removed from current builds of Office, but might still appear in older builds.]*
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)
    
- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.applaunchwileinstalling

We log when an app launch was made while installing an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.appneedtoclose

We log when an update process was kicked off and we find that the application to update was opened. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of an update and application bundle ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.appterminationeventreceived

This event indicates Microsoft Autoupdate has received an Apple event informing the application has been terminated. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** – The identifier of the application.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Error** – The detail about error occurred during application termination.

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and application bundle ID. This may also contain an error string if Microsoft Autoupdate determines the application is still running even though termination event was received. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** – The identifier of the application update.


### FBASilentUpdate.ClientSession

This event is used to calculated critical update health metric for Microsoft Auto Update (MAU). This event allows us to indicate which update session (download or install) the backend is currently handling.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Indicates which update session (download or install) the backend is currently handling.

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session


### fbasilentupdate.codesignfailure

This event logs the result of codesign verification after applying an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the result of the codesign verification operation.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.download

This event denotes that an update is being downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of an update.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **ScreenLocked** – Indication whether download is initiated behind locked screen

- **SessionId** - The identifier for the session


### fbasilentupdate.downloadfailed

This event denotes that a failure occurred while downloading an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** – The identifier of the application.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Error** – The detail of error occurred during application update download.

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of an update. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** – The identifier of the application update.

- **UpdateName** – The name of the application update.


### fbasilentupdate.downloadinbackground

This event denotes that we're starting the download a set of updates in the background (we log the number of updates being concurrently downloaded). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains number of updates queued.

    - **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.downloadingrepairupdate

This event denotes that we have initiated an attempt to download a repair for a failed update. We log the version and the update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of an update.
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **ScreenLocked** – Indication whether download is initiated behind locked screen

- **SessionId** - The identifier for the session


### fbasilentupdate.duplicatedownloadattempted

This event denotes that an error occurred. We should only be downloading one update for a given app at a time. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.installattemptfailed

This event denotes that an installation attempt for an update (version) failed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.installcomplete

This event denotes that all updates on the batch finished installing. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.installed

This event denotes that an individual update was installed successfully. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event. Contains the update identifier.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### fbasilentupdate.installing

This event denotes that an individual update was initiated. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of an update and update package name.
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### fbasilentupdate.installstatus

This event reports on the status of the application update task. This event forms part of the application update funnel and we use it to monitor the health of application updates.

The following fields are collected: 

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Contains information whether progress view is shown

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** -	 Indication whether application update was successful

- **UpdateID** - Identifier for an application update

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

- **UpdatePkg** - Name of the update package being applied

### fbasilentupdate.notificationerror

This event reports on an error encountered while trying to send user notification. This event will be used to debug cause of error and take corrective actions.

The following fields are collected:  

- **App** - The application process sending the event
 
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **ErrType** -	Indicates nature of error encountered

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Message** - Content of notification

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Title** - Title of the notification

- **Type** - Type of notification

### fbasilentupdate.notificationremoved

This event denotes that an update that was blocked is no longer blocked. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an application ID (identifier application uses to register with Microsoft Autoupdate service) for the previously blocked application
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.queueinstall

This event denotes that an update will be queued for silent installation. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the update.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.requiredappsclosed

We log when an application that has a pending update has been closed. This indicates the time at which the actual install can proceed. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, application bundle ID.
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### FBASilentUpdate.TimerForAppTermination

This event is used to calculated critical update health metric for Microsoft Auto Update (MAU). This event allows us to keep track of the termination event of the opened application and the duration of its opened state.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Indicates whether a timer was set for an open application when its update installation was triggered. 

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session

### fbasilentupdate.updateavailablenotification

This event indicates an update available notification is triggered. We must ensure the flow to prompt for updates is triggered when an update is detected. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **CustomNotification** – Boolean indicating whether custom notification was used.

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.userclicknotification

This event indicates user clicked content section of the update available notification and Microsoft Autoupdate GUI is being launched. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.userselectinstalllater

This event indicates user opted to install later after shown update available notification. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### fbasilentupdate.userselectinstallnow

This event indicates user opted to install now after shown update available notification. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### gui.dashboardrowview.updatestate

This event reports on an error found while attempting to display application information in MAU UI. We use this event to ensure health of MAU and track and address failures.

The following fields are collected:

- **App** – The application process sending the event

- **AppID** – The application identifier.

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Contains information on the nature of error encountered

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session


### gui.dashboardview.appisopendialog.display 

This event indicates that the UI has shown a dialog to close an open application to proceed with application update. This event is used to determine volume of updates being delayed in order to provide future enhancements to minimize user interruption.

The following fields are collected: 

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

### gui.dashboardview.appisopendialogbutton.clicked

This event indicates whether application update is skipped, or another attempt is being made after showing an open application dialog. This event is used to determine volume of updates that are being skipped and used for future enhancements to minimize user interruption.

The following fields are collected:   

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **ButtonType** - Skip or Retry

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier 

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

### gui.dashboardview.updateinprogressdialog.display

This event logs whether a dialog was displayed to users indicating update is already in progress.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session

### gui.dashboardview.updatemodebutton.clicked

This event indicates update mode changed from UI control. This event is used to determine volume of devices that transition from one mode to another and is used to help determine why customers are moving away from automatic updates. 

The following fields are collected:

- **App** - The application process sending the event
 
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** -	 Indication whether automatic download is turned OFF

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### gui.feedbackwindow.buttonclicked

This event reports on whether feedback is submitted or canceled before submission. This event is used to help determine volume of feedback sent on a particular release version. This helps to isolate potential issues early.

The following fields are collected: 

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **ButtonType** - Indication whether feedback is sent or canceled

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system
 
- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### gui.preferenceview.consentsheet.display

This event indicates that a consent sheet for a given channel is displayed, if available. This event is used to determine volume of devices that newly enroll into applicable audience channel (Insider Fast / Insider Slow). We also use this event to ensure consent dialog display is functioning to show terms of usage to users.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **ChannelName** - Channel for which the consent dialog is displayed

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### gui.preferenceview.consentsheet.licenseerror

This event reports on the error encountered while attempting to show consent dialog. This event is critical and is used to correct any issues caused by a change in product, if applicable.

The following fields are collected: 

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **ErrorCode** - Error code encountered

- **ErrorDomain** - Error domain

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### gui.preferenceview.switchchannel

This event reports on transition between user selected channels. This event is used to help determine why customers are opting out of Insiders channels.  

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PickedFrom** - Old channel

- **PickedTo** - New channel

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### gui.updatemanager.applaunchduringupdate

This event reports that an application was launched while it was being updated, and Microsoft AutoUpdate is terminating the launched application. Note that launching an application while being updated may result in application corruption. We use this event to ensure update process isn't impacted by launched application before it's ready to be used.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The identifier of application that was launched during updates.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - The string Boolean value indicating whether application was successfully terminated.

- **UpdateID** - The identifier of application update.

### gui.updatemanager.downloadupdateforapp

This event reports on download completion status for an update. We use this event to ensure health of update process and track/address failure point.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **IsRepair** - The string Boolean indicates whether particular update is a repair download.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **isRepair** - Indication whether the download was for a repair download for a previously failed update.

- **UpdateID** - The update identifier.

- **UpdateName** - The update name.


### gui.updatemanager.error

This event reports back on any errors encountered during application updates. This may indicate error in Microsoft Auto Update (MAU) execution sequence.  We use this report to apply updates to MAU to cater for common error scenarios.

The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **Payload** – Contains information on error encountered during an application update.

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session

- **Success** – The string Boolean value indicating whether application was successfully terminated.

### gui.updatemanager.installcleanupforapp

This event indicates temporary files created during application installation were successfully cleaned up. This forms part of update funnel used to determine application update health.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppID** – The application identifier.

- **AppInfo_Language** – The language the application is running under

- **AppState** – The integer indicates the state of application after update attempt.

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry was received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first three octets of the IP address

- **SessionId** – The identifier for the session

- **UpdateID** – The update identifier.


### gui.updatemanager.installsuccessforapp

This event indicates successful application update. This event forms part of the update funnel which we use to determine update health.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - The string Boolean indicates whether updates were successfully installed.

- **UpdateID** - The update identifier.

### gui.updatemanager.installupdateforapp

This event indicates start of actual install process for an application update. This event forms part of application update funnel which we use to determine update health.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - The update identifier.

### gui.updatemanager.queueinstallforapp

This event indicates start of actual install process for an application update. This event forms part of application update funnel which we use to determine update health.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - The update identifier.

### gui.updatemanager.relaunchapp

This event logs whether applications were successfully relaunched after updates.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The application identifier.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - The string Boolean value indicating whether application was successfully terminated.

- **UpdateID** - The update identifier.

- **UpdateName** - The update name.

### installdata.checkrunning

This event logs the result of a check between the apps to be installed and whether the installation attempt will proceed based on the app being opened. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installdata.cleanup

Package files should be removed after installation. This event records instances in which we fail to remove them. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains downloaded file name and error details.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installedapp.acknowledgedcoreappleevent

This event indicates Microsoft Auto Update (MAU) has received an Apple event acknowledgment from a registered application to terminate the application to proceed with pending application update. This event is used to help develop future enhancement to minimize user interruption during application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppleEventClass** - Indicates type of event being sent/acknowledged

- **AppleEventID** - Unique identifier for the event being sent/acknowledged

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains retry count

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - The update identifier


### installedapp.invalidbundle

This event indicates Microsoft Autoupdate couldn't retrieve bundle information for the registered application at given path. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application name.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installedapp.invalidpreference

This event logs cases in which the user preference contains an invalid application entry. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference of checking for updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installedapp.nilbundleid

This event logs cases in which the bundle ID was missing for an app. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application name.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installedapp.nilbundlename

This event logs cases in which the bundle name was missing for an app. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application name.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installedapp.respondedcoreappleevent

This event indicates Microsoft Auto Update (MAU) has received an Apple event response code from a registered application to terminate the application in order to proceed with pending application update. This event is used to help develop future enhancement to minimize user interruption during application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppleEventClass** - Indicates type of event being sent/acknowledged

- **AppleEventID** - Unique identifier for the event being sent/acknowledged

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains retry count

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - The update identifier


### installedapp.sendcoreappleevent

This event indicates Microsoft Auto Update (MAU) is sending an Apple event to a registered application to terminate the application in order to proceed with pending application update. This event is currently being used to help develop future enhancement to minimize user interruption during application updates. 

The following fields are collected:

- **Acknowledged** - Indicates whether the subject application has acknowledged receipt of the event

- **App** - The application process sending the event

- **AppID** - Identifier of application related to the event

- **AppInfo_Language** - The language the application is running under

- **AppleEventClass** - String identifying type of Apple event class

- **AppleEventID** - Identifier for the Apple event being sent from Microsoft AutoUpdate to a registered application

- **AppToQuit**	- Indicates whether the application will self-terminate for Microsoft Autoupdate to apply update

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error**	- Indicates details on error encountered related to the event

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **InAppMsg**	- Indicates whether the application will show in-app message advising user to quit the app in order to update.

- **Payload** - Contains retry count

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **Retries**	- Retry count

- **SessionId** - The identifier for the session

- **Success** -	Indicates whether the subject application has reported success of operation

- **Timeout**	- Integer value indicating number of seconds to wait for an application to respond after sending an Apple event.

- **UpdateID** - A unique identifier for an update. This identifier is used to correlate and identify any potential issues in update process.
    
### installstatus.codesign

This event logs the status of the OS codesign binary. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
    
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installstatus.daemon

This event logs the status of the Microsoft AutoUpdate daemon. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **BundleReachable** – Boolean indicating whether there was a problem accessing Microsoft AutoUpdate application bundle.

- **Channel** - The preference for audience

- **Codesigned** – Boolean indicating whether the Update Assistant were codesigned correctly.

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **Exists** – Boolean indicating whether the Update Assistant exists on disk.

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an indication whether Daemon component exists at expected location and whether it's codesigned. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installstatus.helper

This event logs the status of the Microsoft AutoUpdate helper tool. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an indication whether PrivilegedHelperTool component exists at expected location and whether it's codesigned.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installupdatestask.applaunched

This event indicates Microsoft Autoupdate has detected application launch for a blocked update but couldn't find matching installer. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains name of the launched application.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installupdatestask.applaunchwithpendingupdate

This event indicates Microsoft Autoupdate detected application launch for an application with a pending update. Launched application will be terminated. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installupdatestask.codesignverificationfail

This event denotes that CodeSign verification failed for an app update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of the updated application and failure code.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask.codesignverificationstart

This event denotes that CodeSign verification started for an app update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the updated application.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask.codesignverificationsuccess

This event denotes CodeSign verification success for an app update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of the updated application.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask.failsilentinstall

This event logs failures while applying silent updates and whether this was a cloned or regular install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 
    
- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and the type of update.
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installupdatestask.multiplerelocatablepackage

This event indicates Microsoft Autoupdate has found multiple instances of application entry for a given update package in downloaded manifest. We use this event to ensure the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity and name of update

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### installupdatestask.removeclone

This event denotes that a clone was removed. We remove a clone when either the Install On clone process completed, or when a new process starts, and an older cloned version is found in the machine. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update, update package name, remove clone status / error details.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask.restoreclone

When the user attempts to restore a clone app, this event logs various stages of the restoring clone process. Microsoft uses this event to determine possible failure point when restoring clone to take required corrective measures.

The following fields are collected:

- **AppID** - Identifier of application related to the event

- **BundleVersion** - Indicates Version of the application installed prior to restore event

- **Error** - Indicates details on error encountered related to the event

- **Payload** - Static text.

- **Success** - Boolean indicating success of operation related to the event.

- **UpdateID** - A unique identifier for an update. This identifier is used to correlate and identify any potential issues in update process.

- **UpdateName** - Name of the update as it appears in the downloaded manifest file.

- **UpdatePkg** - Name of the update package being applied.


### installupdatestask.retryfail

This event denotes that errors were encountered during the installation retry process. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update and whether install should be performed via Install On Clone

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

   
### installupdatestask.retryproxyerror

This event logs intra-process communication errors (communication with MAU helper tool). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update and details on proxy error reported.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    

### installupdatestask.retryresponse

This event logs that a retry didn't work. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update, application version, update package name and an indication whether Install On Clone was on, whether install was successful and any errors reported on failure.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask.retrysuccess

This event logs a successful update installation after a retry. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, name of update, application version, update package name and an indication whether Install On Clone was on.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### installupdatestask.setreopengui

This event indicates whether setting preference to reopen GUI after install was successful. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text indicating success of operation. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **Success** – Boolean indicating success of operation.

### installupdatestask.updatestatus

This event reports on status of installation task. This event forms part of the update funnel and is used to determine health of application updates.

The following fields are collected: 

- **App** - The application process sending the event

- **AppID** - Identifier of application related to the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **BundleVersion** - Bundle version of the registered application.

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Indicates details on error encountered related to the event

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **IOC** - String indicating whether Install On Clone is applicable to this update.

- **LeapFrog**	- Boolean indicating whether the update is a “leapfrog” update. Leap Frog will offer delta updates to more recent version, but not to the latest version on offer.

- **NeedVerify** - Boolean indicating update needs verification.

- **Operation** - Indicates operation being performed when an error or a warning was encountered

- **Payload** - Static text to indicate beginning of install process if present

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** -	 Boolean indicating success of operation related to the event.

- **UpdateID** - A unique identifier for an update. This identifier is used to correlate and identify any potential issues in update process.

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

- **UpdatePkg** - Name of the update package being applied

### Lifecycle.complimentproclaunch

This event indicates attempt to launch Microsoft Update Assistant from Microsoft AutoUpdate or from Microsoft AutoUpdate from Microsoft Update Assistant. This event is used to determine and ensure health of Microsoft AutoUpdate and Microsoft Update Assistant.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Any error reported during launch attempt

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **Reason** - Reason for attempting to launch compliment process

- **SessionId** - The identifier for the session

- **Success** -	 Indication whether launch attempt was successful

### Lifecycle.launch

This event indicates start of Microsoft AutoUpdate or Microsoft Update Assistant. This event is also used to report any issues found during the launch process, as well as reporting method used to launch in the case of Microsoft Update Assistant.

*[This event replaces the fba.launch and appdelegate.launch events.]*

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** -	 The application Version

- **Channel** -	 The preference for audience

- **Device_NetworkCountry** -	 The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Any error found on launch

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **LaunchedBy** - String to indicate how the process is launched. Microsoft Update Assistant can either be launched by launch agent or launched directly.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### Lifecycle.periodiccheck

This event reports on status of MicrosoftAutoUpdate process periodically. Specifically, it reports on what remaining tasks process is waiting on for completion for Update Assistant, and in the case of UI it reports on whether process is terminating due to user inaction.  We use this event to determine what is preventing Update Assistant from completing updates and terminating and, whether the UI is terminating due to user inaction.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **dataCollectionDialog** - Boolean indicating whether the process is waiting for user response on Data Collection Dialog

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **forcedUpdateDialog** - Boolean indicating whether the process is waiting for user response on Forced Update Dialog

- **HowToCheck** - How To Check setting

- **isBusy** - Boolean indicating whether the process is busy with active update

- **isInactive** - Boolean indicating whether the process has been waiting for user action for prolonged period of time

- **isWaiting** - Boolean indicating whether the process is waiting for user response on notification

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

- **SessionLength** - Length of current process session in seconds


### lifecycle.previousexitdata

This event is triggered by Microsoft AutoUpdate (MAU) launch, and reports on the termination status of the previous session. Microsoft uses this data to monitor reliability of the MAU process for future improvement.

The following fields are collected:

- **DetectedHangCount** - Number of Hangs detected for previous session.

- **ExceptionEnum** - Numeric value identifying exception thrown that caused previous session to exit.

- **ExitWasGraceful** - String indicating whether previous session was exited gracefully. This is used to determine reliability of Microsoft AutoUpdate process.

- **LastULSLogTag** - Last ULS log encountered before the previous session ungraceful exit.

- **OSLocale** - OS Locale previous session was running under.

- **OSVersion** - OS Version previous session was running under.

- **ResidentMemoryOnCrash** - Resident Memory footprint for previous session.

- **SessionBuildNumber** - String identifying previous session build number.

- **SessionDurationSeconds** - Previous session duration in seconds.

- **SessionId** - String identifying previous session.

- **SessionLongBuildNumber** - String identifying previous session version in extended format.

- **SessionTerminationDurationSeconds** - Session termination duration in seconds.

- **SessionVersion** - String identifying previous session version.

- **StackHash** - Hash value of the crash stack detected.

- **UnsymbolicatedChecksum** - Checks sum of unsymbolicated crash data for previous session.

- **VirtualMemoryOnCrash** - Virtual Memory footprint for previous session.


### Lifecycle.terminate

This event indicates termination of Microsoft AutoUpdate or Microsoft Update Assistant. This event is used to determine the health of Microsoft AutoUpdate and Microsoft Update Assistant.

*[This event replaces the fba.terminate and appdelegate.terminate events.]*

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** -	 The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **SessionLength** -	Length of current process session in seconds



### msupdate.cli.eventhandler

This event is used to calculate the usage of various types of Microsoft Auto Update (MAU) Command Line Interface API.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - The identifier of application that sends command-line interface API to MAU.

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry got received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **EventType** - The type of event that is sent by application to MAU’s command-line interface API.

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### msupdate.cli.eventhandler.applyupdates.appids

*[This event has been removed from current builds of Office, but might still appear in older builds.]*

This event indicates a CLI (client-line interface) command was issued to apply an update. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains list of application IDs to be updated.
    
- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate.cli.eventhandler.config

*[This event has been removed from current builds of Office, but might still appear in older builds.]*

This event indicates Microsoft Autoupdate Command Line Interface module received an Apple event to configure. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate.cli.eventhandler.updates

*[This event has been removed from current builds of Office, but might still appear in older builds.]*

This event indicates Microsoft Autoupdate Command Line Interface module received an Apple event to list updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### msupdate.monitor.progress.downloaded

This event indicates that updates were downloaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates downloaded

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate.monitor.progress.failure

This event logs a list of queued updates that failed to be applied. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### msupdate.monitor.progress.finished

This event logs a list of queued updates that completed install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### msupdate.monitor.progress.queued

This event logs a list of queued updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains lists of updates.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### Office.Apple.Licensing.ReportLicenseStatusData

The event is triggered when launching Mac Office applications. This data is used to monitor licensing status and whether Office clients failed to retrieve it. License status is used to know what updates to provide.

The following fields are collected:

- **OfficeActivationLicense** - The type of activation license used.

### Optinnotificationaction

*[This event has been removed from current builds of Office, but might still appear in older builds.]*

This event logs the user's response to opt-in dialog for enrolling into silent updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains static text representing user selection for opting into Automatic Download and Install.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### sauforcedupdate.autodismiss

This event indicates displayed force update dialog is being dismissed due to user inactivity. This event is used to determine volume of forced updates that proceed without users providing any input to the displayed notification. This event is used to enhance user interface to minimize interruption.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device
  
- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** -The first three octets of the IP address

- **Reason** - Static text

- **SessionId** - The identifier for the session

### sauforcedupdate.close

This event indicates user has chosen to close forced update dialog. This event is used to determine volume of forced updates that are postponed by user action. This event is used to enhance user interface to minimize interruption. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.completeautodismiss

This event indicates that displayed forced update dialog from deadline feature is being dismissed due to user inactivity. This event is used to determine volume of forced updates that proceed without users providing any input to the displayed notification. This event is used to enhance user interface to minimize interruption for deadline feature.

The following fields are collected: 

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.completeclose

This event indicates successful completion of a forced update. This event is used to help determine health of the forced update feature. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.display

This event indicates that a forced update dialog has been displayed.  This event forms part of a forced update funnel and is used to determine the health of the forced update feature.

The following fields are collected: 

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.displayfinalhour

This event indicates that a forced update final hour dialog has been displayed. This event forms part of forced update funnel and is used to determine health of forced update feature.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.done

This event indicates that a forced update has successfully completed. This event forms part of forced update funnel and is used to determine health of forced update feature. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.enabled

This event is triggered when Microsoft Auto Update (MAU) determines forced update is applicable.  This event is used to determine health of forced update feature. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Enabled** - Indicates whether forced update is enabled

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **InvalidUpdates** - Count of forced updates set with invalid update versions

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.forcedupdatedismiss

This event indicates that the displayed force update final hour dialog is being dismissed due to user inactivity. This event is used to determine volume of forced updates that proceed without users providing any input to the displayed notification. This event is used to enhance the user interface to minimize interruption. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **Reason** - Static text

- **SessionId** - The identifier for the session

### sauforcedupdate.forcequitandupdatenow

This event indicates start of user initiated forced update. This event forms part of funnel and is used to determine health of forced update feature. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session 

### sauforcedupdate.forceterminate

This event indicates start of the forced update with application being terminated forcefully.  This event forms part of the funnel and is used to determine health of forced update feature.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains count of applications to be terminated

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.quitandupdatenow

This event indicates that the user has elected to close the application and apply update. This event forms part of a funnel and is used to determine the health of the forced update feature. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.snooze

This event indicates user has elected to postpone forced update. This event forms part of funnel and is used to determine health of forced update feature. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Duration** - Text indicating duration of snooze

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.terminate

This event indicates start of the forced update with application being terminated. This event forms part of the funnel and is used to determine health of forced update feature.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains count of applications to be terminated

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### sauforcedupdate.updatenow

This event indicates user has elected to update application now.  This event forms part of funnel and is used to determine health of forced update feature.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### sauupdateinfoprovider

This event logs whenever a manifest key is missing from a collateral. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the string used to look for update location or size.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### update.applaunchdetected

This event indicates an application was launched while an update was in progress. This event is used to determine the volume of applications that are launched during update and is used for enhancing user experience in future releases.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - Indicates whether launched app has successfully terminated

- **UpdateID** - Identifier for an application update

### update.appterminationreceived

This event indicates that an application with blocked update has been terminated and whether Microsoft Auto Update (MAU) can continue with the update. This event forms part of a funnel and is used to determine the health of application updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Indicates whether there are other instances of application still running, preventing MAU from continuing

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text to indicate MAU is continuing with update

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

### update.blockedappclosed

This event indicates Microsoft Auto Update (MAU) has detected an application with blocked update has closed and can continue with update. This event forms part of funnel and is used to determine health of application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received.

- **EventInfo_Name** - The name of the telemetry event being logged.

- **EventInfo_Time** - The time at which the logged event took place. 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

### update.blockedinstallskip

This event logs an error encountered when trying to skip an application update. This event is critical and is used to investigate reported errors.  

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains information on error encountered

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### update.clientsession

This event is reported when the status of client device changes, causing Microsoft Update Assistant to pause or resume update process. This event forms part of funnel and is used to determine health of application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Indicates whether Microsoft Auto Update (MAU) is resuming or pausing

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### update.clonedisablereason

This event logs a condition that an Install-On-Clone feature is disabled for a particular update. We use this event to monitor the health of Install-On-Clone feature and to provide improved service.

The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The hardware model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** – The version of the operating system

- **Event_ReceivedTime** – The time at which telemetry got received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first 3 octets of the IP address

- **Reason** – Reason why Install On Clone is disabled for this update.

- **SessionId** – The identifier for the session


### update.download.begin 

This event indicates start of the application update process. This event forms part of the update funnel and is used to determine the health of application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **IsRepair** - Indicates whether the update is to repair failed update

- **Payload** - Indicates whether a download was attempted previously

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

### update.download.finish

This event indicates completion of the download phase for application update. This event forms part of the update funnel and is used to determine the health of application updates.  

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **IsRepair** - Indicates whether the update is to repair failed update

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

### update.downloadresume

This event reports an error encountered while attempting to resume a paused download task. This event is critical and is used to investigate on reported errors. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Indicates nature of error encountered

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

### update.error

This event reports an error encountered while attempting to update registered application.  This event is critical and is used to investigate on reported errors. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Contains information on nature of error encountered

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains information on nature of error encountered

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### update.installcleanupforapp

This event indicates update install has completed and Microsoft Auto Update (MAU) is cleaning up.  This event forms part of update funnel and is used to determine health of application updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppState** - State of registered application. May indicate error, pending repair, etc.

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

### update.installupdateforapp

This event is used to report on start of application update install process. This event forms part of update funnel and is used to determine health of application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Encountered errors if any

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

### update.installupdateforapp.success

This event reports on the status of install task. This event forms part of update funnel and is used to determine health of application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **ForcedUpdate** - String indication whether an update is forced by IT Admin

- **HowToCheck** - How to check setting

- **Payload** - Indicates whether progress view has been displayed during install process

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - Success indication returned from install task

- **UpdateID** - Identifier for an application update

### Update.InstallVariance

This event is used to calculate critical update health metric for MAU. This event allows us to determine the success metrics of install priority feature and verify the integrity of the feature.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains the list of Application IDs and their corresponding install priority represented in numbers.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### update.multipleappupdates 

This event indicates multiple application updates are in progress in background. This event forms part of update funnel and is used to determine health of application updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier 

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains information on number of applications being updated

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### update.previousidnil

This event indicates a repair update package is being downloaded but there's no previous download information. This event is critical and is used to investigate reported errors. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Indicates nature of error encountered

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### update.queueinstallforapp 

This event indicates that a downloaded update package has been placed in a queue for install.  This event forms part of update funnel and is used to determine health of application updates.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text to indicate application needs to close, if present

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

- **UpdateName** - Name of the update as it appears in the downloaded manifest file

### update.relaunchafterupdate 

This event indicates application update has completed and is being re-launched. This event forms part of update funnel and is used to determine health of application updates. 

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Contains information on any errors encountered while attempting to relaunch application

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **UpdateID** - Identifier for an application update

### update.timerforapptermination 

This event indicates start/end of timer for checking on the status application. This event comes in a pair and is used to determine all timer objects are removed when application update progresses.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Indicates whether the timer was added or removed

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session


### updatecore.appregistration

This event logs attempts to register an app and the result/reason. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains an identifier used to track an update activity, indication whether preference is available, indication if this is re-registration and an indication whether registration is required.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatecore.loadinglaunchagent

This event indicates Launch Agent is being loaded. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### updatecore.runnstaskcommand

This event reports on an error while attempting to launch a task. This event is critical and is used to investigate reported errors.  

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains path to the command being executed

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### updatecore.server.connectionfail

This event logs errors hit while reaching out to the CDN. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on server name, whether server is valid and if server is reachable.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### updatecore.server.nullurl

This event reports an error indicating that a given server couldn't be reached. This event is used to determine update failure rate caused by network issue. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### updatefilterhelper.cannotretrievebuilddate

We can filter updates via MAU Service only when the update being offered isn't older than certain number of days. Here we log that we couldn't retrieve the date from the app metadata. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper.invalidappid

This event reports an error indicating that no matching manifest files could be found with application id retrieved from web response. This event is used to investigate reported error.

The following fields are collected: 

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains application ID in the web response

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### updatefilterhelper.invalidappidfromwebservices

This event reports an error indicating that application ID retrieved from web response isn't in expected format. This event is used to investigate reported error.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Static text

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### updatefilterhelper.invalidresponsefromupdatefiltering

We can filter updates via MAU Service only when the update being offered isn't older than certain number of days. Here we log the date is missing from the app metadata. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 
    
- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper.missingbuilddate

We can filter updates via MAU Service only when the update being offered isn't older than certain number of days. Here we log the date is missing from the app metadata. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefilterhelper.updatebypassedoldage

We can filter updates via MAU Service only when the update being offered isn't older than certain number of days. Here we log the service is bypassed due to old update date. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.appspecificupdatefilter

This event is triggered when the user checks for updates manually from Microsoft Auto Update (MAU) or when MAU periodically checks for updates in the background, and when app update has been found and there's an app specific update filter specified. This data will be aggregated to determine usage of update filter, how many app updates are filtered, and determine the health of the feature.

The following fields are collected

- **Payload** - Generic column contain event specific messages.  

### updatefinder.check.error

This event reports an error encountered while checking for updates. This event is critical and is used to investigate reported error. 

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Code** - Error code 

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Domain** - Error domain

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

 
### updatefinder.check.start

This event logs whenever we initiate a check for updates operation. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event
    
- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on updates to offer, registered applications and temporary location downloaded files will save to.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.check.status

This event aggregates the status of the check for update operations (the funnel from searching until downloading). We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains information on updates to offer, registered applications and temporary location downloaded files will save to.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.check.updatefound

We log whenever a check for updates results in updates found. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.check.updatenotfound

We log whenever a check for updates results in no updates offered due to no updates being found. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.check.uptodate

We log whenever a check for updates results in no updates offered due to all apps being already up to date. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.offerupdates.invalidappid

This event reports an error while trying to assess whether an update is applicable. This event is critical and is used to investigate reported error.  

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier of application related to the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **CatalogID** - Identifier for the accessed catalog

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **IsNullID** - Indicates whether ID is null

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### updatefinder.offerupdates.minoscheckfail

We log whenever we blocked an update due to not meeting OS requirements. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains minimum required OS version as specified in downloaded manifest file.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### updatefinder.offerupdates.missingtrigger

This event reports an error while attempting to evaluate triggers from downloaded application update manifest. This critical and is used to investigate reported error.  

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **TriggerKey** - Trigger key found in manifest

- **Triggers** - Dictionary of triggers found in manifest

### updatefinder.offerupdates.nullbundleforappid

This event indicates Microsoft Autoupdate was unable to load bundle information for the application ID specified in downloaded manifest file. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.offerupdates.updaterulematched

This event denotes that an update was found for an app and baseline. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID and bundle version information.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### updatefinder.registeredapps

We log the apps that are installed/registered/Controlled by MAU. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains application ID and bundle version information.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### updatefinder.suite.invalidsuiteversion

This event reports on a suite version error while assessing whether an update is applicable. This event is critical and is used to investigate reported error.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Suite** - Name of suite under consideration

### updatefinder.suite.keyvaluemissing

This event reports an error while attempting to add an application to suite. This event is critical and is used to investigate reported error.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session 

- **Suite** - Name of suite application is to be added

    
### updatefinder.suite.missingcollateral

Suite Update - We log whenever a suite update isn't applicable due to collateral missing. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Text that indicates the nature of the event.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.suite.staleversion

Suite Update - We log whenever a suite update isn't applicable due to baseline version being too old. We log the baseline version and the Suite AppId. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains suite name.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.suite.updateapplicable

Suite Update - We log whenever a suite update is applicable. We log the baseline version and the Suite AppId. We log the baseline version and the Suite AppId. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.suite.updatenotapplicabledefaultpath

Suite Update - We log whenever a suite update isn't offered due not all suite apps being install under the default path. We log the baseline version and the Suite AppId. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### updatefinder.suite.updatenotapplicableversion

Suite Update - We log whenever a suite update isn't offered due not all suite apps being in the same baseline version. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.suite.updatenotoffered

Suite Update - We log whenever a suite update isn't offered due to suite size being larger than individual updates. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains suite name.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatefinder.suite.updateoffered

Suite Update - We log whenever a suite update is offered. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains Name, Baseline and update version for the suite.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatemanager.checkupdate

This event logs number of updates found by Microsoft AutoUpdate while checking for available updates. Microsoft uses this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Detected** - Number of detected updates.

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **IsMainThread** - Boolean indicating whether the operation is being executed in main thread

- **Payload** - Contains count of available updates found.

- **Pending** - Number of updates pending.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### updatemanager.network

This event logs network availability. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** – The application process sending the event

- **AppInfo_Language** – The language the application is running under

- **AppVersionLong** – The application Version

- **Channel** – The preference for audience

- **Device_NetworkCountry** – The device country or region (based on IP address)

- **DeviceID** – The device identifier

- **DeviceInfo_Model** – The Hardware Model of the device

- **DeviceInfo_NetworkType** – The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** – The Version of the Operating System

- **Event_ReceivedTime** – The time at which telemetry got received

- **EventInfo_Name** – The name of the telemetry event being logged

- **EventInfo_Time** – The time at which the logged event took place 

- **HowTocheck** – The preference for checking of updates

- **PipelineInfo_ClientCountry** – The device country or region (based on IP address)

- **PipelineInfo_ClientIp** – The first 3 octets of the IP address

- **SessionId** – The identifier for the session

- **ServerReacheable** – Boolean indicating whether the network is available.

    
### updatemanager.updatespending

This event denotes that updates were found and are pending install. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains indication whether the task is running on main thread, and number of pending updates.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### UpdateStatus.Codesign

This event reports the status from codesign verification Microsoft Update Assistant runs after installing client application updates. We use this event to ensure that we provide packages that are valid and will update the installed application to newest version.

The following fields are collected:

- **App** - The application process sending the event

- **AppID** - Identifier for the application being updated

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Error** - Any errors that were seen during codesign verification process

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

- **Success** - Indicates whether codesign verification was successful

- **UpdateID** - Uniquely identifies applied update 

- **UpdateName** - Name of the update as described in update manifest

- **UpdatePkg** - Name of the update package applied

### urlutilities.getmauinfo

This event reports an error encountered while accessing Microsoft Auto Update (MAU) application bundle. This event is critical and is used to investigate reported error.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains information on error encountered

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session
   
### webservices.checkforsilentupdates

This event denotes that silent-update candidates were found. Microsoft uses this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Candidates** - Number of initial updates being examined.

- **Channel** - The preference for audience

- **Detected**	- Number of detected updates.

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains count of updates found and application ID.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### webservices.deltaupdater

This event logs interactions between the client code and the feature gate that controls whether the client should allow for Delta updates. Microsoft uses this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Static text.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **Reason** - String contain for detailed reason associated with the event.

- **SessionId** - The identifier for the session

- **UpdaterType** - String that identifies the type of updater (Full/FileDelta/BinaryDelta) being applied.

### webservices.serviceaction

We log any errors resulting from an unexpected webservice response. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains details of action being pushed from web-services.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session


### webservices.serviceresponse

This event logs requests to MAU Service, response times and Errors. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains request ID, application name, response time and/or status code.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

    
### webservices.silentupdate

We log requests to check for any "force update" applicability rules, i.e. we must take a user from build N to build N+1 due to some major issue. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains request ID, application name, response time and/or status code.

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### webservices.updatefiltering

This event indicates filtering performed on the list of applicable updates via web-services. We use this event to ensure application blocks are working correctly if we have to block an update.

The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The hardware model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** - The version of the operating system

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowToCheck** - How to check setting

- **Payload** - Contains information on number of updates blocked via web-services

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first three octets of the IP address

- **SessionId** - The identifier for the session

### webservices.webcontent

We log requests and responses received into webservices. We use this event for ensuring the update process works as expected and to help troubleshoot errors.
 
The following fields are collected:

- **App** - The application process sending the event

- **AppInfo_Language** - The language the application is running under

- **AppVersionLong** - The application Version

- **Channel** - The preference for audience

- **Device_NetworkCountry** - The device country or region (based on IP address)

- **DeviceID** - The device identifier

- **DeviceInfo_Model** - The Hardware Model of the device

- **DeviceInfo_NetworkType** - The type of network (Wi-Fi, Wired, Unknown)

- **DeviceInfo_OsBuild** - The Version of the Operating System

- **Event_ReceivedTime** - The time at which telemetry was received

- **EventInfo_Name** - The name of the telemetry event being logged

- **EventInfo_Time** - The time at which the logged event took place 

- **HowTocheck** - The preference for checking of updates

- **Payload** - Contains web-service caller ID

- **PipelineInfo_ClientCountry** - The device country or region (based on IP address)

- **PipelineInfo_ClientIp** - The first 3 octets of the IP address

- **SessionId** - The identifier for the session

### webservices.whatsnew

This event is triggered when Microsoft Auto Update (MAU) queries web-services on the “what’s new” feature for registered applications. This event is used to determine health of the “what’s new” feature. 

The following fields are collected:

- **App** -The application process sending the event

- **AppInfo_Language** -The language the application is running under

- **AppVersionLong** -The application version

- **Channel** -The preference for audience

- **Device_NetworkCountry** -The device country or region (based on IP address)

- **DeviceID** -The device identifier

- **DeviceInfo_Model** -The hardware model of the device

- **DeviceInfo_NetworkType** -The type of network (Wi-Fi, wired, unknown)

- **DeviceInfo_OsBuild** -The version of the operating system

- **Event_ReceivedTime** -The time at which telemetry was received

- **EventInfo_Name** -The name of the telemetry event being logged

- **EventInfo_Time** -The time at which the logged event took place 

- **HowToCheck** -How to check setting

- **Payload** -Contains information on number of applications with what’s new information

- **PipelineInfo_ClientCountry** -The device country or region (based on IP address)

- **PipelineInfo_ClientIp** -The first three octets of the IP address

- **SessionId** -The identifier for the session

## OneNote sync events

### Office.OneNote.Storage.NotebookSyncResult
 
This event logs notebook sync result. It's used for figuring out how many unique sync targets when calculating OneNote sync score.
 
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
 
This event logs WebSocket sync result for both OneNote modern page content sync modern hierarchy sync. It's used for figuring out how many unique sync targets when calculating OneNote sync score. It's also used for OneNote modern sync performance dashboard.
 
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

- **HasError** - whether there's an error during the WebSocket session 

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
 
This event logs section sync result. It's used for figuring out how many unique sync targets when calculating OneNote sync score. It's also used for OneNote modern sync performance dashboard.
 
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
 
This event logs all negative factors in sync experience that are visible to users. It's used to calculate OneNote sync score, which is a critical metric to evaluate OneNote users' sync experience.
 
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

- **NotebookId** - notebook ID

- **PageSyncUIState** - page sync status string, e.g., UpToDate, Syncing, SaveOffline, SyncError, etc. 

- **ServerGosid** - resource ID for newly created conflict page

- **Source** - an enum indicates which event triggered the UI, i.e. created a new redx image, sync error in the sync UI, error dialog displayed, etc.

### OneNote.App.Provisioning.MoveLocalNotebookToOnlineNotebookFailed
 
This event is logged when move of local notebook to drive fails.  This scenario is specific to delayed sign-in user. When the user signs in, their local notebook is transferred to their OneDrive storage. 
 
The following fields are collected:
 
- **ErrorMsg** - The error message corresponding to the failure.

### OneNote.Storage.ConnectivityChanged

The event logs if a user has internet connectivity or not. This is used to correlate the other sync health performance metrics by allowing us to ignore events that occur while a user doesn't have internet connectivity as we don't expect our service latency to be acceptable without internet connectivity. This allows us to calculate an accurate session count for our metrics across slices of customers (per-tenant, per-sector). We also use it to filter error reports as there are numerous sync errors that we expect to occur without network connectivity but that warrant investigation otherwise.

If we don't receive this data, we won't be able to accurately monitor our products performance or determine if errors experienced by a user are expected or require further investigation.

The following fields are collected:

- **InternetConnectivityNowAvailable** -  If the connectivity state has been changed so it's now Internet

### OneNote.Storage.LegacyInboundLatency

The critical signal used to track the performance of inbound sync operations that communicate directly with SharePoint including correlating information allowing us to monitor and investigate the performance of uploading data to our service. This signal is only collected for the worst performing download in the last 300 seconds (the number of seconds is configurable by Microsoft depending on service performance and condition).

This is used to ensure service health by allowing us to see which tenants are experiencing an unacceptably slow inbound of data to our service, information about the data they're uploading when they experienced the slow inbound and how widespread within a tenant that latency issue is. It's also used to report service health and performance across our customers to measure trends over time and alert on issues automatically for engineering mitigation. If we don't have this data it will prevent us from ensuring adequate download performance when a user syncs changes from SharePoint to their computer.

The following fields are collected: 

- **IsEducationNotebook** - A bool indicating if the notebook is an education notebook

- **NotebookId** - The ID of the notebook that this upload is part of

- **TimeToConfirmSyncedWithServerInMs** - The time in milliseconds it took to perform the upload

### OneNote.Storage.LegacyOutboundLatency

The critical signal used to track the performance of outbound sync operations that communicate directly with SharePoint including correlating information allowing us to monitor and investigate the performance of uploading data to our service. This signal is only collected for the worst performing download in the last 300 seconds (the number of seconds is configurable by Microsoft depending on service performance and condition).

This is used to ensure service health by allowing us to see which tenants are experiencing an unacceptably slow outbound of data to our service, information about the data they were uploading when they experienced the slow outbound and how widespread within a tenant that latency issue is. It's also used to report service health and performance across our customers to measure trends over time and alert on issues automatically for engineering mitigation. If we don't have this data, it will prevent us from ensuring adequate performance when syncing users changes up to SharePoint. 

The following fields are collected: 

- **IsEducationNotebook** - A bool indicating if the notebook is an education notebook

- **NotebookId** - The ID of the notebook that this upload is part of

- **TimeToConfirmSyncedWithServerInMs** - The time in milliseconds it took to perform the upload

### OneNote.Storage.RealTime.FileDataObjectDownload 

The critical signal used to track performance when a user inbounds a file data object (i.e. an embedded file or image) which is downloaded directly from our service and not as part of a sync operation on a page, section or notebook. This signal is only collected for the worst performing download in the last 300 seconds (the number of seconds is configurable by Microsoft depending on service performance and condition).

This is used to ensure service health and performance by allowing us to see which tenants are experiencing an unacceptably slow download of data from our service, and how widespread within a tenant that latency issue is, and report our behavior over time allowing us to measure service performance trends. If we see an unacceptable latency for a file object, we'll also use this data to correlate that with other signals from the client and service regarding the object to make improvements to our download process. We also split the data based on the extension of the file object downloaded as we have different expectations based on whether the file is presented inline in our canvas (e.g. an image) or is a non-inline file (such as a text document). If we don't receive this data, it will prevent us from monitoring the performance of these downloads

The following fields are collected: 

- **FileSizeInBytes** - The size of the file being downloaded in bytes 

- **IsImage** - A bool determining if the file being downloaded has an extension that matches a pre-determined list of common image formats (.bmp, .emf, .gif, .jpe, .jpeg, .jpg, .png) that we display inline in the canvas

- **TimeToDownload** - The length of time it took to successfully download the FDO from our blob storage to the device 

### OneNote.Storage.RealTime.WebSocketDownload

The critical signal used to track performance of inbound sync operations including correlating information allowing us to monitor and investigate the performance of downloading data from our service (onenote.com). This signal is only collected for the worst performing download in the last 300 seconds (the number of seconds is configurable by Microsoft depending on service performance and condition).

This is used to ensure service health by allowing us to see which tenants are experiencing an unacceptably slow inbound of data from our service, information about the data they were downloading when they experienced the slow inbound and how widespread within a tenant that latency issue is. It's also used to report service health and performance across our customers to measure trends over time and alert on issues automatically for engineering mitigation. 

If we see an unacceptable latency for a section or notebook we'll also use this data to correlate that with other signals from the client and service regarding the same document to identify client-side performance regressions allowing us to deliver a more performant service.

If we don't receive this data, we'll be unable to monitor the performance of this aspect of our service, or the impact of server side changes we may find necessary due to usage or other factors.

The following fields are collected:

- **DeviceSessionId** -  The ID of the device session

- **IsEducationNotebook** - A bool indicating if the notebook is an education notebook

- **IsHierarchyResource** - A bool indicating if the resource is a hierarchy resource

- **NotebookId** - The ID of the notebook that this upload is part of

- **ResourceId** - The ID of the resource that we're uploading

- **SectionId** - The ID of the section that this upload is part of

- **ServerSessionId** - The ID of the server session that this upload is part of

- **TimeToConfirmSyncedWithServerInMs** - The time in milliseconds between a user navigating to a page and the replication stack confirming that page is in sync with the server.

- **TimeToFirstUpdateInMs** - The time in milliseconds between the sync engine beginning inbound replication of a page and that replication operation reaching the in sync with the server state.

### OneNote.Storage.RealTime.WebSocketUpload

The critical signal used to track the performance of outbound sync operations including correlating information allowing us to monitor and investigate the performance of uploading data to our service (onenote.com)

This is used to ensure service health by allowing us to see which tenants are experiencing an unacceptably slow outbound of data to our service, information about the data they were uploading when they experienced the slow outbound and how widespread within a tenant that latency issue is. It's also used to report service health and performance across our customers to measure trends over time and alert on issues automatically for engineering mitigation. We'll also use this data to track the impact and effectiveness of improvements we make to our clients and services. 

If we see an unacceptable latency for a section or notebook we'll also use this data to correlate that with other signals from the client and service regarding the same document to identify performance regressions allowing us to deliver a more performant experience.

If we don't receive this data, we'll be unable to monitor the performance of this aspect of our service, or the impact of server side changes we may find necessary due to usage or other factors.

The following fields are collected: 

- **DeviceSessionId** - The ID of the device session

- **IsEducationNotebook** - A bool indicating if the notebook is an education notebook

- **IsHierarchyResource** - A bool indicating if the resource is a hierarchy resource

- **IsWorstTime** - A bool indicating if the time is a regular upload event, or the worst time we saw on this client in the last 300 seconds (the number of seconds is configurable by Microsoft depending on service performance and condition).

- **NotebookId** - The ID of the notebook that this upload is part of

- **RecommendedPutIntervalInMs** - The time the service has communicated to the client as its recommended put interval

- **ResourceId** - The ID of the resource that we're uploading

- **SectionId** - The ID of the section that this upload is part of

- **SenderRequestId** - The ID of the sender performing the upload

- **ServerSessionId** - The ID of the server session that this upload is part of

- **UploadNonSuspendedTimeInMs** - The time in milliseconds it took to perform the upload excluding the time when the application was suspended

- **UploadTimeInMs** - The time in milliseconds it took to actually perform the upload

- **WaitTimeInMs** - The time in milliseconds between an upload being requested and an upload starting

- **WebUrl** - The WebUrl of the upload (Logged as a PiiWz)

### OneNote.Storage.SyncHealth

The critical signal used to track errors and exceptions that have occurred inside the sync stack in the OneNote client allowing us to monitor and mitigate these unexpected conditions.

This is used to ensure service health by allowing us to see error reports from the clients in near real time, which lets us respond to sync issues as they arise. It's also used to identify how widespread an issue is, and how severe by cross-referencing the error tag with the client code to identify the source of failure. We also aggregate this data to get information on our performance over time and the impact and effectiveness of improvements we make to our clients and services. If we don't have this data, we won’t be able to proactively respond to error conditions in our sync service without customer escalation.

The following fields are collected: 

- **Service** - The sync service the client was using when the error occurred (Legacy or Modern Sync)

- **Tag** - The tag (an identifying value) representing the error that the client encountered during the sync operation

### OneNote.Sync.CreateNotebookFailed
 
This event is logged when creation of a notebook fails.  
 
The following fields are collected:
 
- **NetworkConnection** - Logs the connection type that the device is currently on e.g. Wi-Fi, offline, 3G 

- **ServerType** - Logs the server type where notebook was to be created.

### OneNote.Sync.FirstRunError
 
This event is logged when syncing of Quick Notes failed for a user during their First Run Experience on a device.  This is specific to the First Run scenario.
 
The following fields are collected:
 
- **NetworkConnection** - Logs the connection type that the device is currently on e.g. Wi-Fi, offline, 3G

- **ServerType** - Logs the server type where Quick Notes notebook was to be created

## Services Configuration events

No required service data events are collected by Services Configuration.

## Telemetry events

### app.deep.link

This event helps to track the usage of calendar meeting launch, across different endpoints. This event lets us detect two things when a meeting is launched via Skype for Business, and when a meeting is launched via Teams, and if the Teams app is installed.

The following fields are collected: 

- **account** - Hashed account information which performed the action

- **action_type** - action performed, such as launch meeting or install application

- **application** - Application that was launched via a deep link, such as Teams or Skype for Business

- **context** - The experience navigated to within the app, e.g., office_union - word, office_union – excel, etc.

- **one_drive_photo_exp_action_type** - The action type of OneDrive photo experimentation. For example: show_get_one_drive_card, click_get_one_drive_card, enable_camera_backup_succeeded, etc.

- **one_drive_photo_exp_plan_number** - The experimentation plan number of OneDrive photo experimentation for A/B/n test.

 - **one_drive_photo_exp_referral_type** - The referral type of OneDrive photo experimentation. For example: inline_card, bottom_card.

- **source** - The origin of an action, for example, initiated from the user, automatically by the client, etc.


### Office.Android.DocsUI.PaywallControl.PaywallOperationMetrics

*[This event was previously named Office.Android.DocsUI.Views.PaywallOperationMetrics.]*

Microsoft uses this to get the health of the feature, success, or error rates for the user for purchases, to ensure appropriate investments to improve the customers’ purchase experience across mobile platforms.

The following fields are collected:

- **OperationTimeInMs** - Time taken for the purchase operation to complete (long – milliseconds)

- **PaywallOperationResult** - Success / Error Code / User Canceled (Enum / int – finite)

- **PaywallOperationType** - Kind of Paywall operation (enum/ int - finite)

### Office.Android.DocsUI.PaywallControl.PaywallPrivacyUIEvent

This event is triggered when the consent-taking privacy screen is shown before the subscription paywall screen. Data collected here will be needed to understand if the screen and its elements is performing as expected and to also find the loss in user paywall sessions as a result of user's selection on the consent screen.

The following fields are collected:

- **FunnelPoint** - Integer – Indicating the encounter user has with the privacy consent screen. (0: Screen is shown to the user; 1: User accepts; 2: User declines)

### Office.Android.DocsUI.PaywallControl.PaywallSessionData

*[This event was previously named Office.Android.DocsUI.Views.PaywallSessionData.]*

Session-based metadata when Paywall UI is shown to the user. Microsoft uses this to get the user journey, and understand the device and OS versions the user is using, to help make decisions on investments in improving the experience in these areas.

The following fields are collected:

- **App Version** - Version code of the consuming application

- **ClientId** - Anonymous non-PII unique device identifier (guid / string)

- **DeviceNetworkType** - Integer – Indicating the type of network device is connected to. (0 : not connected, 1: wifi, 2: mobile, 3: ethernet)

- **Entry Point** - Unique identifier for contextual or constant entry points from the consuming application

- **isTablet** - Whether the device is showing tablet UX

- **OSVersion** - Android OS version of the device

- **SessionId** - Guid: Unique Paywall session identifier

- **V2Enabled** - Boolean – Flag denoting if experimental modern upsell UX was shown.

### Office.Apple.Licensing.AutoRenewData

This event is triggered when the user lands on the "Subscription Auto Renew Reminder" user interface (UI). The data is used to ensure that the feature is working as expected and for better service reliability. 

The following fields are collected:

- **isAROff** - Bool - true if user has their auto renew turned off.

- **IsSubscriptionPurchaser** - Bool - Boolean indicating whether the user is a subscription purchaser or not (beneficiary)

- **isTrial** - Bool - true if user has their trial period ongoing.

- **ProductId** - String - ProductId of the subscription product.

- **PurchaseApp** - String - App where the user purchased their subscription(Word/Excel/PowerPoint).

- **PurchasePlatform** - String - platform where the user purchased their subscription (iOS vs Windows vs Android).

- **SubscriptionExpirationDateTime** - String - Date and time when the subscription will expire.


### Office.Apple.Licensing.AutoRenewToastVisible

This event is triggered when the user lands on the "Subscription Renew Bizbar Notification" user interface (UI). The data is used to confirm that the notification was viewed by the user.

The following fields are collected:

- None


### Office.Apple.Licensing.AutoRenewViewVisible

This event is triggered when the user lands on the "Subscription Auto Renew Reminder" user interface (UI). The data is used to confirm that the screen  was viewed by the user.

The following fields are collected:

- None

### Office.Apple.Licensing.CPCOnFailure

This event is triggered when the subscription screen encounters issues, and the respective failure screen is shown instead. The data is used to track reasons for the Apple app store unknown errors and take suitable actions to address it.
 
The following fields are collected: 
 
- **hasNetworkConnection** - Boolean value of the network connectivity status of the device.

### Office.BusinessCheckout.AnalyticsEvent

The event is triggered by the user action or internal component operation. This event is emitted on every step of user journey through the purchase funnel in checkout component. This event is required to keeping the service performing as expected and identify drop-offs in the checkout flow.

The following fields are collected:

- **appName** - application name (business checkout)

- **checkoutStage** - current stage in checkout flow

- **correlationId** - identifier used for correlating events from a single session

- **environment** - business checkout environment (int, edog, prod)

- **flights** - represent flighting

- **language** - language selected for the application

- **market** - market of the attempted purchase 

- **partner** - partner application consuming business checkout (DIME)

- **platform** - platform of the partner application (Win32, WXP online, office.com)

- **product** - user selected product

- **puid** - persistent user identifiers

- **result** - result of the checkout flow (purchased, dropped etc)

- **seats** - number of licences purchased

- **sessionId** - identifier for each session

- **sku** - a variant of the user selected product (stock keeping unit)

- **tenantId** - Microsoft Entra tenant ID of the shadow tenant associated with the consumer user. Shadow tenant refers to the implementation details required for attaching the purchased license to MSA user.

- **version** - package build version

### Office.BusinessCheckout.DiagnosticEvent

The event is triggered by the user action or internal component operation. It's used to troubleshoot the checkout component if there are issues detected with the purchase.

The following fields are collected:

- **activityId** - unique identifier that represent a flow. It's a combination of activitySpanId and activityTraceId

- **activitySpanId** - unique identifier for subtasks

- **activityTraceId** - unique identifier for whole flow

- **checkoutStage** - current stage in checkout flow

- **environment** - business checkout environment (int, edog, prod)

- **flights** - represent flighting 

- **language** - language selected for the application

- **logLevel** - log level (info, debug etc)

- **market** - market of the attempted purchase.

- **message** - diagnostic message

- **ocid** - optional campaign ID

- **parentActivityId** - used for enabling trace tree structure between sub-activities

- **partner** - partner application consuming business checkout (DIME)

- **platform** - platform of the partner application (Win32, WXP online, office.com)

- **product** - user selected product

- **propertyBag** - represents additional meta data

- **puid** - persistent user identifiers

- **sku** - a variant of the user selected product (stock keeping unit)

- **tagId** - internal message source matching identifier.

- **tenantId** - Microsoft Entra tenant id of the shadow tenant associated with the consumer user

- **time** - time of the logging event

- **version** - package build version 

### Office.BusinessCheckout.MetricEvent

The event is triggered by the user action or internal component operation. Monitoring event is used for tracking the result and timing of operations. It's issued whenever a block wrapped into “monitoring scope” is completed.

The following fields are collected:

- **appName** - application name (business checkout)

- **market** - market of the attempted purchase

- **metadata** - represents additional meta data such as request / response of 

- **metricName** - name of the matric event, e.g., Duration, CrashCount, Count

- **metricValue** - value for matric name, e.g., Duration - time taken

- **name** - unique activity name

- **result** - result of the metric event (success, systemError, etc.)

- **subType** - information about the partner application consuming business checkout, e.g., partner/platform


### Office.FirstRun.Apple.TelemetryOptIn

This event is collected for Office applications running under Apple platforms. The event is used to monitor the health of our telemetry opt-in flow in First Run Experience. We collect a code that denotes what type of diagnostic data collection option was selected by the user.

The following fields are collected:

- **Data_EventId** – A code indicating the diagnostic data collection preference selected by the user.


### Office.iOS.Paywall.ShareSubscriptionScreen.ShareLinkTap

This event is triggered when the user taps on “Share Family invite” when they're presented with the share family subscription view. The data is used to detect the clicks and number of successful subscription shares.

The following fields are collected:

- **entryPoint** - Indicates the entryPoint through which ShareSubscriptionView is displayed when the user tapped on Share family invite. 


### Office.iOS.Paywall.ShareSubscriptionScreen.Shown

This event is triggered when users are presented with the share family subscription view. The data is used to log the number of users who came across this view. 

The following fields are collected:
 
- **entryPoint** - Indicates the entryPoint through which ShareSubscriptionView is displayed to the user.


### Office.Omex.Checkout.LoggingEvent

The event is triggered by the user action or internal component operation. It's used to troubleshoot the checkout component if there are issues with the purchase detected.

The following fields are collected:

- **Agent.Datacenter** - identification of the monitoring agent; location of the datacenter that is hosting the checkout experience.

- **Agent.Role** - identification of the monitoring agent; type of service emitting the telemetry.

- **Agent.RoleInstance** - identification of the monitoring agent; service instance emitting the telemetry.

- **Agent.ServiceName** - identification of the monitoring agent; service emitting the telemetry.

- **Agent.Tenant** - identification of the monitoring agent; service cluster.

- **Level** - severity level of the diagnostic message.

- **Message** - diagnostic message.

- **Query.Flights** - information about experiments that user is included in.

- **Query.Language** - user experience language of the attempted purchase.

- **Query.Market** - market of the attempted purchase.

- **Query.PageURL** - browser URL that the user is using while attempting purchase.

- **Query.ReferralURL** - browser URL that referred user to purchase.

- **Tag** - internal message source matching identifier.

- **Tracing.CheckoutVersion** - version of the purchase flow component.

- **Tracing.Environment** - environment that emits the event, e.g., production or pre-production.

- **Tracing.TraceId** - ID to correlate the event with other events from the same user session.


### Office.OneNote.GetSharePointIdsForDocument

The data collected logs the failure and success of fetching the SharePoint (SPO) IDs for a document URL. The success and the failure (including the reason for failure) of the call is logged for all platforms. This marker is required to track and diagnose the health of the call made to get the IDs. The IDs are required to have a OneNote page (belonging to SharePoint-stored notebooks) data displayed in the feed. 

The following fields are collected:

- **ErrorCode** - int value of error

- **ErrorMessage** - string describing error

- **FailureType** - string to determine type of error

- **HttpStatusCode** - HTTP error code for network call

- **InnerErrorCode** - int code

- **InnerErrorMesage** - message for error

- **IsSuccess** - Boolean value for is signal succeeded

### Office.OneNote.GetSharePointIdsForDocumentW32Old

The telemetry logs the failure scenarios and success of fetching the SharePoint (SPO) IDs for a Document URL. The success and the failure (including the reason for failure) of the call is logged. This is only logged in the old win32 platform. This marker is required to track and diagnose the health of the call made to get the IDs. The IDs are required to have the OneNote page (belonging to SharePoint-stored notebooks) data displayed in the feed. 

The following fields are collected:

- **ErrorCode** - int value of error

- **ErrorMessage** - string describing error

- **FailureType** - string to determine type of error

- **HttpStatusCode** - HTTP error code for network call

- **InnerErrorCode** - int code

- **InnerErrorMesage** - message for error

- **IsSuccess** - Boolean value for is signal succeeded


### Office.System.GracefulExit.GracefulAppExitDesktop

The event is triggered by a graceful application termination for Office client applications such as, but not limited to, Word, Excel, PowerPoint, and Outlook. We use Graceful Exit to measure the health of Office client products. It's intended to be a business-critical signal used by Office engineers to infer product stability.

The following fields are collected:

- **AppBuild** - Build version identifier for the affected process.

- **AppMajor** - Major version identifier for the affected process.

- **AppMinor** - Minor version identifier for the affected process.

- **AppRevision** - Build version identifier for the affected process.

- **BootCompleted** – Did Office process complete boot.

- **DetectionTime** - The time when the unexpected exit was detected.

- **EcsETag** - An experiment identifier for the process.

- **HasEdit** – Was document editing occurring during the Office process.

- **HasOpen** – Was document opened during the Office process.

- **InstallMethod** - Whether the current build of Office was upgraded from, rolled back to, or a fresh install.
 
- **LicenseId** - The licensing information of the user.

- **OfficeUILang** – Language of the Office process.

- **PreviousBuild** - Previously installed build version.

- **SafeMode** – Was Office process in safe mode.

- **SessionId** - A unique identifier of the process.

- **SessionInitTime** - The time when the affected process started.

### Office.System.GracefulExit.GracefulAppExitDesktopRealTime

The event is triggered by a graceful application termination for Office client applications such as, but not limited to, Word, Excel, PowerPoint, and Outlook. The data is reported immediately when termination occurs. The data is used to measure the health of Office client products and is a business-critical signal used by Office engineers to infer product reliability. 

The following fields are collected:

- **AppName** - Name of the App.

- **EcsETag** - An experiment identifier for the process.

- **InstallMethod** - Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

- **OfficeUILang** - Language of the Office Process

- **PreviousAppBuild** - Build version identifier for the affected process.

- **PreviousAppMajor** - Major version identifier for the affected process.

- **PreviousAppMinor** - Minor version identifier for the affected process.

- **PreviousAppRevision** - Build version identifier for the affected process.

- **PreviousBuild** - Previously installed build version

- **PreviousSessionId** - A unique identifier of the process.

- **PreviousSessionInitTime** - The time when the affected process started.

- **PreviousSessionUninitTime** - The time when the unexpected exit was detected.

- **ProcessorArchitecture** - Processor type.

- **SessionFlags** - System metadata about the state of the process.


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

  - **ProcessFileName -** The running application's executable name.

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

  - **OfficeArchitectureText** - The architecture of Office product as string (e.g. x86, arm).

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

This event is triggered when the Office session is launched. The data is used to ensure that the various components like identity, flighting and configurations, are operating as designed, to keep the product secure and working as expected. 

The following fields are collected:

- **Alias** - If the user running Office is a Microsoft employee, their company internal alias.

- **AppBuild** - The Build version of the Office application.

- **AppBuildRevision** - The Build Revision of the Office application.

- **AppMajorVer** - The Major version of the Office application.

- **AppMinorVer** - The Minor version of the Office application.

- **CID** - Pseudonymized user identity

- **CollectibleClassifications** - The set of data classifications that can be collected.

- **DeviceManufacturer** - The manufacturer of the device Office is being run on.

- **DeviceModel** - The model of the device Office is being run on.

- **DeviceProcessorModel** - The processor model of the device Office is run on.

- **DigitizerInfo** - Information about the digitizer attached to the device Office is run on.

- **DomainName** - The name of the domain the machine running Office is joined to (if any).

- **FirstRunTime** - The first time an Office application was run.

- **HorizontalResolution** - Horizontal screen resolution 

- **IsDebug** - Whether this is a debug build of Office.

- **IsImmersive** - Whether the Office application is a Universal Windows or Immersive application.

- **IsJoinedToDomain** - Whether the device running Office is domain joined.

- **IsLabMachine** - Whether Office is being run in a Microsoft lab.

- **IsLaptop** - Whether the device Office is running on is a laptop.

- **IsMsftInternal** - Whether the Windows user running Office is a Microsoft employee.

- **IsOEMInstalled** - Whether the running Office application was installed by an OEM.

- **IsRunAsAdmin** - Whether the Office application is running as Administrator.

- **IsSubscription** - Whether the Office application is installed under a subscription license.

- **MsoAppId** - Identifier for what Office application this data refers to.

- **NumProcPhysCores** - Number of physical cores in the processor.

- **OfficeBuild** - The Build version of the Office shared libraries.

- **OfficeBuildRevision** - The Build Revision version of the Office shared libraries.

- **OfficeMajorVer** - The Major version of the Office shared libraries.

- **OfficeMinorVer** - The Minor version of the Office shared libraries.

- **OsBuild** - The Build version of the Operating System.

- **OsBuildRevision** - OS build revision

- **OsMajorVer** - The Major version of the Operating System.

- **OsMinorVer** - The Minor version of the Operating System.

- **PowerPlatformRole** - An identifier of the OEM preferred computer role of the device Office is run on.

- **ProcessFileName** - The running application’s executable name.

- **ProcessorCount** - The count of processors on the device Office is run on.

- **RamMB** - The amount of RAM available in the device Office is run on.

- **SqmUserId** - A random identifier for the install of Office.

- **StudyId** - Software Quality Metrics study identifier.

- **VerticalResolution** - Vertical screen resolution

- **WinUserActType** - Whether the Windows user running Office is a local administrator, power user, or normal user.

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

  - **ProcessFileName -** The running application's executable name.

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

  - **WindowsErrorReportingMachineId** - Windows Error Reporting assigned machine identifier of the device Office is run on.

  - **WindowsSqmMachineId** - Windows assigned machine identifier of the device Office is run on.

### Office.System.SystemHealthMetadataOperatingSystem

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **CollectionTime** - The time this event was queued for upload

  - **IsTerminalServer** - True/false is terminal server client

  - **OsBuild** - The Build version of the Operating System.

  - **OsBuildRevision** - OS build revision

  - **OSEnvironment** - Windows, iOS, Mac, Android, etc.

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

This event is triggered every time an Office application is launched. This event collects information about the operating system the Office is running on.  The data is used to classify failures within the office application and help reproduce and mitigate the issue.

The following fields are collected:

  - **CountryRegion -** Country or region identifier Operating System setting.

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

  - **W365EnvironmentType** - Windows 365 OS type, Windows 365 Business, Windows 365 Enterprise

### Office.System.SystemHealthMetadataScreenCultureUserSqmId

Metadata required to isolate a failure reproduction.

The following fields are collected:

  - **Alias -** Microsoft employee or automated user alias

  - **CID -** Pseudonymized user identity

  - **CollectibleClassifications -** Data classifications that can be collected according to the client privacy settings

  - **CollectionTime -** The time this event was queued for upload

  - **CountryRegion -** Country or region identifier operating system setting.

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

The event is triggered by an abnormal application termination (Example: task manager kill, application hang, etc.) for Office client applications such as Word, Excel, PowerPoint, and Outlook. We use Ungraceful Application Exit metrics to measure the health of Office client products. It's a business-critical signal used to infer product stability.

The following fields are collected:

  - **AffectedProcessAppBuild -** Build version identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessAppBuildRevision -** Build revision identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessAppMajorVer** - Minor version identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessAppMinorVer -** Minor version identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessAppName -** The name of the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*
  
  - **AffectedProcessAppVersion** - Version identifier for the affected process.

  - **AffectedProcessExeBuildVersion -** The Build Version number of the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessExeMajorVersion -** The Major Version number of the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessExeMinorVersion -** The Minor Version number of the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessExeRevisionVersion -** The Build Revision Version number of the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessIsDebug -** Whether the affected process is a debug build. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessIsLabMachine -** Whether the affected process is in a Microsoft lab. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AffectedProcessOsEnvironment -** An operating system identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AppName -** The name of the affected application. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **AppUsedVirtualMemory** - Virtual memory utilized by office application

- **BucketId** - Watson bucket Identifier for crash

- **CabGuid** - GUID identifier for the Watson cab.

- **CallStack** - The Microsoft internal call stack causing the crash.

- **CallStackHash** - Hash of CallStack field (GUID format)

- **CrashedAssignedFlights -** The flights assigned to the crashed process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **CrashedConfigIds -** The configuration assigned to the crashed process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **CrashedEcsETag -** An experiment identifier for the crashed process.

- **CrashedImpressionId -** The impression identifier of the crashed process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **CrashedModuleName** - Failing module name

- **CrashedProcessSessionID -** A unique identifier of the crashed process. 

- **CrashedProcessSessionInitTime -** The time when the affected process started. 

- **CrashedProcessSessionUninitTime** - The time when the affected process ended.

- **CrashTag** - The unique identifier for the code of the crash.

- **CrashType -** Bucketing identifier for the type of crash.

- **DetectionTime -** The time when the unexpected exit was detected. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ErrorString -** Error description. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ExceptionAddress -** Address in the program where the failure occurred. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ExceptionCode -** Bucketing identifier for the exception.

- **ExceptionInfo** - System information for the exception.

- **FaultAppName -** The name of the faulting app. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **HangTypeCode** - Represents class of hang if the process hung during execution.

- **InstallMethod -** Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

- **InstallType -** An identifier for the method by which Office was installed. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **InstallTypeName -** An identifier for the method by which Office was installed. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **IsCustomerImpacting** - Whether the user was impacted negatively by the UAE.

- **IsLabMachine -** Whether Office is being run in a Microsoft lab. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **IsMsftInternal -** Whether the Windows user running Office is a Microsoft employee. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **LicenseID** - The licensing information of the user.

- **ModuleBaseAddress -** Base Address of the failing module. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleBuildVersion -** Failing module build version number. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleMajorVersion -** Failing module major version number. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleMinorVersion -** Failing module minor version number. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleName -** Failing module name. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleOffset -** Offset in bytes (in hexadecimal) from the base address where the failure occurred.

- **ModuleRevisionVersion -** Failing module build revision version number. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleSize -** Failing module size in bytes. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **ModuleVersion** - Version of the fault module responsible for a crash.

- **OfficeArchitectureText** - The architecture of the install: x64, x86, etc.

- **OfficeUILang** - The Language of the User Interface in the Office Build.

- **OSEnvironment -** Identifier for what environment Office is running on.

- **PreviousBuild -** Previously installed build version

- **ProcessorArchitecture** - Processor Architecture for the environment: x64, x86, etc.

- **SessionFlags** - Defines the conditions of the session such as: was file opened, or edited, was cloud document opened, was boot sequence completed, etc. 

- **StackHash** - Provides a hashed id for the failure stack in Office.

- **SystemAvailableMemory** - Available memory in the operating system

- **UAETypeName -** Bucketing identifier for how the app exited ungracefully. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **UninitLibletId** - The unique identifier for the failing component of the crash.

- **VerifyElseCrashTag -** Unique identifier for where the app crashed. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

- **WatsonBucket** - Watson bucket Identifier for crash (GUID format)

- **WatsonReportId** - Identifier of report sent to the Windows Watson service.

- **WerEventCreatedTime** - Time stamp for Windows Error Reporting event.

### Office.System.SystemHealthUngracefulAppExitDesktopRealTime

The event is triggered by an abnormal application termination for Office client applications such as Word, Excel, PowerPoint, and Outlook. We use Ungraceful Application Exit metrics to measure the health of Office client products. It's a business-critical signal used to infer product reliability. This event contains the same information as the following event: Office.System.SystemHealthUngracefulAppExitDesktop. The difference is that this event is reported as soon as the abnormal application termination occurs, while Office.System.SystemHealthUngracefulAppExitDesktop is reported later.
 
The following fields are collected:

- **AffectedProcessAppVersion** - Version identifier for the affected process.

- **AppName** – name of the application.

- **AppUsedVirtualMemor** - Virtual memory utilized by office application.

- **BucketId** - Windows reliability bucket Identifier for crash

- **CabGuid** - GUID identifier for the Windows reliability cab.

- **CallStack** - The Microsoft internal call stack causing the crash.

- **CallStackHash** - Hash of CallStack field (GUID format)

- **CrashedEcsETag** - An experiment identifier for the crashed process.

- **CrashedModuleNam** - Failing module name

- **CrashedProcessSessionId** - A unique identifier of the crashed process.

- **CrashedProcessSessionInitTime** - The time when the affected process started.

- **CrashedSessionUninitTime** - The time when the affected process ended.

- **CrashedTag** - The unique identifier for the code of the crash.

- **CrashType** - Bucketing identifier for the type of crash.

- **ExceptionCod** - Bucketing identifier for the exception.

- **ExceptionInfo** - System information for the exception.

- **HangTypeCode** - Represents class of hang if the process hung during execution.

- **InstallMethod** - Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

- **IsCustomerImpacting** - Whether the user was impacted negatively by the UAE.

- **LicenseID** - The licensing information of the user.

- **ModuleOffset** - Offset in bytes (in hexadecimal) from the base address where the failure occurred.

- **ModuleVersion** - Offset in bytes (in hexadecimal) from the base address where the failure occurred.

- **OfficeUILan** - The Language of the User Interface in the Office Build.

- **PreviousBuild** - Previously installed build version

- **ProcessorArchitecture** - Processor Architecture for the environment: x64, x86, etc.

- **ReleaseAudienceGroup** - AudienceGroup of the affected process.

- **ReleaseChannel** - Channel of the affected process.

- **ReleaseFork** - Fork of the affected process.

- **SessionFlag** - Defines the conditions of the session such as: was file opened, or edited, was cloud document opened, was boot sequence completed, etc.

- **StackHash** - Provides a hashed id for the failure stack in Office.

- **SystemAvailableMemory** - Available memory in the operating system

- **UninitLibletId** - The unique identifier for the failing component of the crash.

- **WatsonReportId** - Identifier of report sent to the Windows reliability service.

- **WerEventCreatedTime** - Time stamp for Windows Error Reporting event.



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

The event is triggers by an abnormal application termination (for example, task manager kill, application hang, etc.) for Office client applications such as, but not limited to, Word, Excel, PowerPoint, and Outlook. We use Ungraceful Application Exit metrics to measure the health of Office client products. It's a business-critical signal used by Office engineers to infer product stability.

The following fields are collected:

  - **AddinExecution** - Flag that informs if an add-in was executing and didn't finish during an ungraceful application exit. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **AppUsedVirtualMemory** - Virtual memory utilized by office application

  - **BootCompleted** - Was Office boot completed at the time of crash. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **BucketId** - Watson bucket Identifier for crash
 
  - **CabGuid** - Globally Unique Identifier (GUID) identifier for the Watson cab.

  - **CallStack** - The Microsoft internal call stack causing the crash.

  - **CrashedAppBuild** - Build version identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **CrashedAppMajor** - Major version identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*
 
  - **CrashedAppMinor** - Minor version identifier for the affected process. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **CrashedAppVersion** - Application version identifier for crashed process.

  - **CrashedEcsETag** - An experiment identifier for the crashed process.

  - **CrashedModuleName** - Failing module name.

  - **CrashedProcessSessionId** - A unique identifier of the crashed process.

  - **CrashedProcessSessionInitTime** - The time when the affected process started.

  - **CrashedProcessSessionUninitTime** - The time when the affected process ended.

  - **CrashTag** - The unique identifier for the code of the crash.

  - **CrashTime** - The time indicating the client terminated ungracefully. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **CrashType** - Bucketing identifier for the type of crash.

  - **DetectionTime** - The time when the unexpected exit was detected. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **ExceptionAddress** - Address in the program where the failure occurred. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **ExceptionCode** - Bucketing identifier for the exception.

  - **ExceptionInfo** - System information for the exception.

  - **HandOff** - Did the user create and hand off the Office process to a new session. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HangTypeCode** - Represents class of hang if the process hung during execution.

  - **HasEdit** - Was the user editing a document in the crashed client. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HasOpen** - Was a document open in the crashed client. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexCrashTag** -  The unique identifier for the code of the crash. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexExceptionAddress** - Address in hexadecimal in the program where the failure occurred. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexExceptionCode** - Bucketing identifier in hexadecimal for the exception. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexModuleBaseAddress** - Base Address in hexadecimal of the failing module. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexModuleOffset** - Offset in bytes (in hexadecimal) from the base address where the failure occurred. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexModuleSize** - Failing module size in bytes in hexadecimal. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **HexVerifyElseCrashTag** - Unique identifier in hexadecimal for where the app crashed. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **InstallMethod** - Whether the current build of Office was upgraded from, rolled back to, or a fresh install.

  - **IsLabMachine** - Whether Office is being run in a Microsoft lab. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **ModuleBaseAddress** - Base Address of the failing module. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **ModuleOffset** - Offset in bytes (in hexadecimal) from the base address where the failure occurred.

  - **ModuleSize** - Failing module size in bytes. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **ModuleStamp** - Failing module stamp.

  - **ModuleVersion** - Version of the fault module responsible for a crash.

  - **OfficeArchitectureText** - The architecture of Office product as string (e.g. x86, arm).

  - **OfficeUILang** - The language of the User Interface in the Office build.

  - **PreviousBuild** - Previously installed build version

  - **ProcessorArchitecture** - Processor Architecture for the environment x64, x86, etc.

  - **SafeMode** - Was the session booted in safe mode. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **SessionFlags** - Defines the conditions of the session such as: was file opened, or edited, was cloud document opened, was boot sequence completed, etc. 

  - **StackHash** - Provides a hashed id for the failure stack in Office.

  - **SystemAvailableMemory** - Available memory in the operating system

  - **UAEOSEnvironment** - Operating System environment identifier. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **UninitLibletId** - The unique identifier for the failing component of the crash.

  - **VerifyElseCrashTag** - Unique identifier for where the app crashed. *[This field has been removed from current builds of Office, but might still appear in older builds.]*

  - **WatsonReportId** - Identifier of report sent to the Windows Watson service.

  - **WerEventCreatedTime** - Time stamp for Windows Error Reporting event.


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

  - **EventName** - The name of the event that isn't in the list

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

  - **Dialogcanceled** - Was the diagnostic data viewer dialog canceled

  - **NewState** - New diagnostic data viewer state

  - **WasDialogUsed** - Was the diagnostic data viewer dialog used

### Office.Telemetry.DynamicConfig.FetchConfigs

Data needed to measure health of Telemetry Config Service.

The following fields are collected:

  - **ParsedConfigCount** - Number of parsed dynamic configs

  - **ParsedConfigs** - Number of parsed dynamic configs

  - **RejectedConfigCount** - Number of rejected configs

  - **RejectedConfigs** - Number of rejected configs

  - **RejectedConfigsList** - Comma-separated list of rejected configs.

### Office.Telemetry.DynamicConfig.ParseJsonConfig

Data needed to measure the health of Telemetry Config Service

The following fields are collected:

  - **ErrorMessage** - Parsing error message

  - **NodeName** - Node which failed to parse

### Office.Telemetry.DynamicConfig.PopulatedRequestIgnored

This event is generated when we fail to set up the telemetry configuration pipeline.

This event collects no fields.

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
