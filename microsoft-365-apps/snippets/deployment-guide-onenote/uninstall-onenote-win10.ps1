#############################################
######   OneNote for Windows 10  ############
######   Migration Script  ##################
#############################################

$localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
$outputFile = "C:\temp\OneNoteMigration\UWPBackUpResult.log"

function writeLogsToFileAndConsole {
    Param ([string]$logstring)
    Add-content $outputFile -value "$logstring"
    Write-Host "$logstring"
}

## Check if OneNote UWP is installed ##
function checkOneNoteUWPInstalled {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        writeLogsToFileAndConsole "OneNote UWP App is installed"
    }
    else {
        writeLogsToFileAndConsole "OneNote UWP App is not installed"
    }
}

function getWin32RegKeys {
    $registryPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\OneNote"
    $bootValueName = "FirstBootStatus"

    }
    $outputDir = "C:\temp\OneNoteMigration\"
    if(!(test-path $outputDir)){new-item -path "C:\temp\OneNoteMigration\" -ItemType directory -name OneNoteUWPBackup|out-null}
    new-item -path $outputDir -name UWPBackupResult.log -Type File -Force

$registry = Get-ItemProperty -Path $registryPath
    # get FRE status
    if ($registry.PSObject.Properties[$bootValueName]) {
        $bootValue = $registry.$bootValueName
        writeLogsToFileAndConsole "OneNote Win32 FRE Value: $bootValue"
    }

# get client version and audience data
    $registryPath = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"
    $versionValueName = "ClientVersionToReport"
    $audienceValueName = "AudienceData"
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.PSObject.Properties[$versionValueName]) {
        $versionValue = $registry.$versionValueName
        writeLogsToFileAndConsole "OneNote Win32 Version Value: $versionValue"
    }
    if ($registry.PSObject.Properties[$audienceValueName]) {
        $audienceValue = $registry.$audienceValueName
        writeLogsToFileAndConsole "OneNote Win32 Audience Value: $audienceValue"
    }

# get backup folder path if existed
    $registryPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\OneNote\Options\Paths"
    $backupValueName = "BackupFolderPath"
    if (Test-Path $registryPath) {
        $registry = Get-ItemProperty -Path $registryPath
        if ($registry.PSObject.Properties[$backupValueName]) {
            $backupValue = $registry.$backupValueName
            writeLogsToFileAndConsole "OneNote Win32 Backup Path Value: $backupValue"
        }
    }
    # get uwp version
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    $uwpVersion = $uwpApp.Version
    $uwpVersionObject = [System.Version]$uwpVersion
    writeLogsToFileAndConsole "UWP OneNote app version: $uwpVersion"

## Update OneNote for Windows 10 to the latest version available ##
function updateUWPVersion {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        $uwpVersion = $uwpApp.Version
        $uwpVersionObject = [System.Version]$uwpVersion

$updatedVersion = "16001.14326.21942.0"
        $updatedVersionObject = [System.Version]$updatedVersion

$unsupportedVersion = "16001.14327.10000.0"
        $unsupportedVersionObject = [System.Version]$unsupportedVersion

if ($uwpVersionObject -ge $unsupportedVersionObject)
        {
        writeLogsToFileAndConsole "Unsupported version of OneNote UWP app. Please check the Microsoft Store for updates"
            exit
    }

if ($uwpVersionObject -lt $updatedVersionObject)
        {
            writeLogsToFileAndConsole "You must upgrade OneNote UWP to a version higher than 16.0.14326.21942. Please check the Microsoft Store"
            exit
        }
        else
        {
            writeLogsToFileAndConsole "OneNote UWP version up to date"
        }
    }
    else
    {
        writeLogsToFileAndConsole "No OneNote UWP detected. No need for migration"
        exit
    }
}
## Terminate the OneNote for Windows 10 app before executing the rest of the migration script ##
function killProcess {
    if (Get-Process -Name "OneNoteIm" -ErrorAction SilentlyContinue)
    {
        try
        {
            $uwpProcess = Get-Process -Name "OneNoteIm"
            Stop-Process -Id $uwpProcess.Id -Force
            Start-Sleep -Seconds 10
        }
        catch
        {
            writeLogsToFileAndConsole "An error occurred when killing the current OneNote UWP process: $($_.Exception.GetType().FullName)"
            writeLogsToFileAndConsole "$($_.Exception.Message)"
            exit
        }

writeLogsToFileAndConsole "OneNote UWP process killed"
    }
}

function launchBackUp {
    try
    {
        $OneNoteUWPLaunch = (Get-AppxPackage -Name Microsoft.Office.OneNote).InstallLocation + "/onenoteim.exe"
        Start-Process "onenote-cmd://backup:" -filepath $OneNoteUWPLaunch
        Start-Sleep -Seconds 60
        writeLogsToFileAndConsole "OneNote UWP backup initiated."
    }
    catch
    {
        writeLogsToFileAndConsole "An error occurred when starting the backup: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }

writeLogsToFileAndConsole "OneNote UWP backup started"
}

## Parse the results in json files to read if backup was successful; if so and there were outbounding changes if files were backed up and migration can continue ##
 function parseJson {
    try
    {
        killProcess

$localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
        $jsonPath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\UWPBackUpStatus.json"
        if(!(test-path $jsonPath)){
            writeLogsToFileAndConsole "Backup Json file path is not valid"
            exit
        }
        $backupJsonFileContent = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
        $status = $backupJsonFileContent."UWP Backup Status: "
        if ($status -eq "Completed") {
            $jsonPath2 = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\UWPSyncStatus.json"
            if(test-path $jsonPath2)
            {
            $syncStatusJsonContent = Get-Content -Raw -Path $jsonPath2
            $syncStatusJsonObject = COnvertFrom-Json $syncStatusJsonContent
            foreach ($key in $syncStatusJsonObject.PSObject.Properties)
            {
                $value = $syncStatusJsonObject.$($key.Name)
                if ($value.StartsWith("Contains pending outbounding changes: true,"))
                {
                    if ($backupJsonFileContent."Number of sections Backed up" -eq 0)
                    {
                        writeLogsToFileAndConsole "No error occurred when backing up but outbounding changes were not backed up successfully"
                        exit
                    }
                    else
                    {
                        break
                    }
                }
            }
        }

writeLogsToFileAndConsole "OneNote UWP backup is completed and status is saved"
        }
        elseif ($status -eq "")
        {
            writeLogsToFileAndConsole "$status"
            writeLogsToFileAndConsole "No error occurred but backup did not finish. We cannot continue migration. Consider increasing the Start-Sleep time in line 130 and rerun the script"
            exit
        }
        else
        {
            writeLogsToFileAndConsole "No error occurred but backup status is $status. We cannot continue migration. Consider increasing the Start-Sleep time in line 130 and rerun the script"
            exit
        }
    }
    catch
    {
        writeLogsToFileAndConsole "An error occurred when finishing the backup: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }
}

## Copy backed up sections and migration result files to the output folder path determined above ##
 function moveBackup {
    try
    {
        $localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
        $sourcePath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\BackUp"
        $destinationPath = "C:\temp\OneNoteMigration\"

Copy-Item -Path $sourcePath\* -Destination $destinationPath -Recurse -Force

$sourcePath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0"
        $fileExtensions = "*.json", "*.txt"
        foreach ($fileExtension in $fileExtensions)
        {
            $files = Get-ChildItem -Path $sourcePath -Filter $fileExtension
            foreach ($file in $files) {
                Copy-Item -Path $file.FullName -Destination $destinationPath -Force
            }
        }
    }
    catch
    {
        writeLogsToFileAndConsole "An error occurred when moving the backup files: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }

writeLogsToFileAndConsole "Backup files copied successfully from $sourcePath to $destinationPath"
 }

function uninstallUWP {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        $uwpApp | Remove-AppxPackage
        writeLogsToFileAndConsole "OneNote UWP version uninstalled."
    }
}

function MainRoutine {
    checkOneNoteUWPInstalled
    getWin32RegKeys
    launchBackUp
    parseJson
    moveBackup
    updateUWPVersion
    killProcess
    uninstallUWP
}

# Execute the main routine
MainRoutine