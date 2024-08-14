#############################################
######   OneNote for Windows 10  ############
######   Migration Script  ##################
#############################################

## Function: writeLogsToFileAndConsole
## Purpose: Creates a backup folder if it doesn't exist, and writes log messages to both a log file and the console.
function writeLogsToFileAndConsole {
    Param ([string]$logstring)
    $backupFolder = [System.Environment]::GetFolderPath('LocalApplicationData') + "\Microsoft\OneNote\16.0\Backup"
    $outputFile = $backupFolder + "\UWPMigrationResult.log"

    # Create backup directory if it doesn't exist
    if (-not (Test-Path $backupFolder)) {
        New-Item -Path $backupFolder -ItemType Directory
    }

    # Create log file if it doesn't exist
    if (-not (Test-Path $outputFile)) {
        New-Item -Path $outputFile -ItemType File
    }

    # Append log string to the log file and output to console
    Add-content $outputFile -value "$logstring"
    Write-Host "$logstring"
}

## Function: checkOneNoteUWPInstalled
## Purpose: Checks if the OneNote UWP application is installed and logs the result.
function checkOneNoteUWPInstalled {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        writeLogsToFileAndConsole "OneNote UWP version is installed"
    }
    else {
        writeLogsToFileAndConsole "OneNote UWP App is not installed"
    }
}

## Function: getWin32RegKeys
## Purpose: Retrieves and logs important OneNote registry values, including (a) the First Boot Status, 
## (b) client version, (c) audience data, and (d) backup folder path. (e) It also logs the UWP version of OneNote.
function getWin32RegKeys {
    $registryPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\OneNote"
    $bootValueName = "FirstBootStatus"
    $outputDir = [System.Environment]::GetFolderPath('LocalApplicationData') + "\Microsoft\OneNote\16.0\Backup\"
    $registry = Get-ItemProperty -Path $registryPath
    
    # (a) Retrieve First Boot Status registry value
    if ($registry.PSObject.Properties[$bootValueName]) {
        $bootValue = $registry.$bootValueName
        writeLogsToFileAndConsole "OneNote Win32 FRE Value: $bootValue"
    }
    else {
        writeLogsToFileAndConsole "OneNote Win32 RegKeys not detected"
        exit
    }

    # (b) and (c) Retrieve client version and audience data
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

    # (d) Retrieve OneNote Win32 backup folder path if it exists
    $registryPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\OneNote\Options\Paths"
    $backupValueName = "BackupFolderPath"
    if (Test-Path $registryPath) {
        $registry = Get-ItemProperty -Path $registryPath
        if ($registry.PSObject.Properties[$backupValueName]) {
            $backupValue = $registry.$backupValueName
            writeLogsToFileAndConsole "OneNote Win32 Backup Path Value: $backupValue"
        }
    }

    # (e) Retrieve and log UWP version of OneNote
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    $uwpVersion = $uwpApp.Version
    $uwpVersionObject = [System.Version]$uwpVersion
    writeLogsToFileAndConsole "UWP OneNote app version: $uwpVersion"
}

## Function: updateUWPVersion
## Purpose: Checks and updates OneNote UWP to the latest supported version. Logs the result and 
## exits if the version is unsupported or if an update is required.
function updateUWPVersion {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        $uwpVersion = $uwpApp.Version
        $uwpVersionObject = [System.Version]$uwpVersion

        # Define version thresholds
        $updatedVersion = "16001.14326.22008.0"
        $updatedVersionObject = [System.Version]$updatedVersion

        $unsupportedVersion = "16001.14327.10000.0"
        $unsupportedVersionObject = [System.Version]$unsupportedVersion

        # Check if UWP version is unsupported or needs an update
        if ($uwpVersionObject -ge $unsupportedVersionObject) {
            writeLogsToFileAndConsole "Unsupported version of OneNote UWP app. Please check the Microsoft Store for updates"
            exit
        }

        if ($uwpVersionObject -lt $updatedVersionObject) {
            writeLogsToFileAndConsole "You must upgrade OneNote UWP to a version higher than 16.0.14326.21802. Please check the Microsoft Store"
            exit
        }
        else {
            writeLogsToFileAndConsole "OneNote UWP will be removed"
        }
    }
    else {
        writeLogsToFileAndConsole "No OneNote UWP detected. No need for migration"
        exit
    }
}

## Function: killProcess
## Purpose: Terminates the OneNote UWP process if it is running, allowing for further operations 
## to proceed without conflicts. Logs the result.
function killProcess {
    if (Get-Process -Name "OneNoteIm" -ErrorAction SilentlyContinue) {
        try {
            $uwpProcess = Get-Process -Name "OneNoteIm"
            Stop-Process -Id $uwpProcess.Id -Force
            Start-Sleep -Seconds 10
        }
        catch {
            writeLogsToFileAndConsole "An error occurred when killing the current OneNote UWP process: $($_.Exception.GetType().FullName)"
            writeLogsToFileAndConsole "$($_.Exception.Message)"
            exit
        }

        writeLogsToFileAndConsole "OneNote UWP process killed"
    }
}

## Function: launchBackUp
## Purpose: Initiates the backup process for OneNote UWP and logs the progress. Exits if an error occurs.
function launchBackUp {
    try {
        Start-Process "onenote-uwp://backup:"
        Start-Sleep -Seconds 60
        writeLogsToFileAndConsole "OneNote UWP backup initiated"
    }
    catch {
        writeLogsToFileAndConsole "An error occurred when starting the backup: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }

    writeLogsToFileAndConsole "OneNote UWP backup in progress"
}

## Function: parseJson
## Purpose: Parses JSON files generated by the OneNote UWP backup process to verify 
## the success of the backup. Logs the results and exits if any issues are detected.
function parseJson {
    try {
        killProcess

        $localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
        $jsonPath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\UWPBackUpStatus.json"
        
        # Check if the backup JSON file exists
        if (!(Test-Path $jsonPath)) {
            writeLogsToFileAndConsole "Backup Json file path is not valid"
            exit
        }
        
        $backupJsonFileContent = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
        $status = $backupJsonFileContent."UWP Backup Status"

        # Evaluate the backup status
        if ($status -eq "Completed") {
            $jsonPath2 = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\UWPSyncStatus.json"
            if (Test-Path $jsonPath2) {
                $syncStatusJsonContent = Get-Content -Raw -Path $jsonPath2
                $syncStatusJsonObject = ConvertFrom-Json $syncStatusJsonContent
                foreach ($key in $syncStatusJsonObject.PSObject.Properties) {
                    $value = $syncStatusJsonObject.$($key.Name)
                    if ($value.StartsWith("Contains pending outbounding changes: true,")) {
                        if ($backupJsonFileContent."Number of sections Backed up" -eq 0) {
                            writeLogsToFileAndConsole "No error occurred when backing up but outbounding changes were not backed up successfully"
                            exit
                        }
                        else {
                            break
                        }
                    }
                }
            }

            writeLogsToFileAndConsole "OneNote UWP backup is completed and status is saved"
        }
        elseif ($status -eq "") {
            writeLogsToFileAndConsole "$status"
            writeLogsToFileAndConsole "No error occurred but backup did not finish. We cannot continue migration. Consider increasing the Start-Sleep time in line 130 and rerun the script"
            exit
        }
        else {
            writeLogsToFileAndConsole "No error occurred but backup status is $status. We cannot continue migration. Consider increasing the Start-Sleep time in line 130 and rerun the script"
            exit
        }
    }
    catch {
        writeLogsToFileAndConsole "An error occurred when finishing the backup: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }
}

## Function: moveBackup
## Purpose: Copies the backed-up sections and migration result files to the designated output folder. 
## Logs the success of the operation or any errors encountered.
function moveBackup {
    try {
        $localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
        $sourcePath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\BackUp\"
        $destinationPath = [System.Environment]::GetFolderPath('LocalApplicationData') + "\Microsoft\OneNote\16.0\Backup\"

        # Copy backup files to the destination folder
        Copy-Item -Path $sourcePath\* -Destination $destinationPath -Recurse -Force

        $sourcePath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0"
        $fileExtensions = "*.json", "*.txt"
        foreach ($fileExtension in $fileExtensions) {
            $files = Get-ChildItem -Path $sourcePath -Filter $fileExtension
            foreach ($file in $files) {
                Copy-Item -Path $file.FullName -Destination $destinationPath -Force
            }
        }
    }
    catch {
        writeLogsToFileAndConsole "An error occurred when moving the backup files: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }

    writeLogsToFileAndConsole "Backup files copied successfully from $sourcePath to $destinationPath"
}

## Function: uninstallUWP
## Purpose: Uninstalls the OneNote UWP application if it is installed and logs the result.
function uninstallUWP {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        $uwpApp | Remove-AppxPackage
        writeLogsToFileAndConsole "OneNote UWP version uninstalled"
    }
}

## Function: MainRoutine
## Purpose: Coordinates the migration process by calling the necessary functions in sequence.
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

# Execute the main routine to start the migration process
MainRoutine