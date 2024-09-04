#############################################
######   OneNote for Windows 10  ############
######   External Migration Script v5  ######
#############################################

## Creates backupFolder and writes log from script to UWPMigrationResult.log File and Console ##

function writeLogsToFileAndConsole {
    Param ([string]$logstring)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logstringWithTimestamp = "[$timestamp] $logstring"
    $backupFolder = [System.Environment]::GetFolderPath('LocalApplicationData') + "\Microsoft\OneNote\16.0\Backup"
    $outputFile = $backupFolder + "\UWPMigrationResult.log"

    if (-not (Test-Path $backupFolder)) {
        New-Item -Path $backupFolder -ItemType Directory
    }

    if (-not (Test-Path $outputFile)) {
        New-Item -Path $outputFile -ItemType File
    }

    Add-content $outputFile -value "$logstringWithTimestamp"
    Write-Host "$logstringWithTimestamp"
}

## Checks if OneNote UWP is installed and if app data exists, writes version to log file and console ##

function checkOneNoteUWPInstall {
    $folderPath = "$env:LOCALAPPDATA\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote"
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
	$uwpVersion = $uwpApp.Version
	$uwpVersionObject = [System.Version]$uwpVersion
        writeLogsToFileAndConsole "UWP OneNote app version: $uwpVersion"
    } else {
        writeLogsToFileAndConsole "OneNote UWP App is not installed"
	exit
    }

    if (Test-Path $folderPath) {
        Write-Host "AppData folder detected"
    } else {
        ($null -ne $uwpApp) 
        $uwpApp | Remove-AppxPackage
        writeLogsToFileAndConsole "AppData folder does not exist and OneNote UWP will now be uninstalled"
    exit
    }
}

## Checks if OneNote Win32 is installed by checking the existence of the executable file and checks the version ##

function checkOneNoteWin32Install {
    $oneNotePath = Join-Path $env:ProgramFiles "Microsoft Office\root\Office16\ONENOTE.EXE"
    $registryPath = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"
    $versionValueName = "ClientVersionToReport"
    $registry = Get-ItemProperty -Path $registryPath
    
    if (Test-Path $oneNotePath) {
        if ($registry.PSObject.Properties[$versionValueName]) {
            $versionValue = $registry.$versionValueName
            writeLogsToFileAndConsole "OneNote Win32 Version Value: $versionValue is installed at path $oneNotePath"   
    } else {
        writeLogsToFileAndConsole "OneNote Win32 is not installed"
        exit
    }
 }   

## Checks for backup folder path
  
    $registryPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\OneNote\Options\Paths"
    $backupValueName = "BackupFolderPath"
    if (Test-Path $registryPath) {
        $registry = Get-ItemProperty -Path $registryPath
        if ($registry.PSObject.Properties[$backupValueName]) {
            $backupValue = $registry.$backupValueName
            writeLogsToFileAndConsole "OneNote Win32 Backup Path Value: $backupValue"
        }
    }
}

## Updates OneNote for Windows 10 to the latest version available ##

function updateUWPVersion {
    $uwpApp = Get-AppxPackage | Where-Object {$_.Name -eq "Microsoft.Office.OneNote"}
    if ($null -ne $uwpApp) {
        $uwpVersion = $uwpApp.Version
        $uwpVersionObject = [System.Version]$uwpVersion

        $updatedVersion = "16001.14326.22008.0"
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
            writeLogsToFileAndConsole "You must upgrade OneNote UWP to a version higher than 16.0.14326.21802. Please check the Microsoft Store"
            exit
        }
    else
        {
            writeLogsToFileAndConsole "OneNote UWP will backup and uninstall"
        }
    }
    else
    {
        writeLogsToFileAndConsole "No OneNote UWP detected therefore no need for migration"
        exit
    }
}
## Terminates the OneNote for Windows 10 app before executing the rest of the migration script ##

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
        Start-Process "onenote-uwp://backup:"
        Start-Sleep -Seconds 60
        writeLogsToFileAndConsole "OneNote UWP backup initiated"
    }
    catch
    {
        writeLogsToFileAndConsole "An error occurred when starting the backup: $($_.Exception.GetType().FullName)"
        writeLogsToFileAndConsole "$($_.Exception.Message)"
        exit
    }

    writeLogsToFileAndConsole "OneNote UWP backup in progress"
}

## Parses the results in the json files to validate that the backup was successful ##

 function parseJson {
    try
    {
        $localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
        $jsonPath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\UWPBackUpStatus.json"
        if(!(test-path $jsonPath)){
            writeLogsToFileAndConsole "Backup Json file path is not valid"
            exit
        }
        $backupJsonFileContent = Get-Content -Path $jsonPath -Raw | ConvertFrom-Json
        $status = $backupJsonFileContent."UWP Backup Status"
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

## Copies the backup files to the local app data folder ##

 function moveBackup {
    try
    {
        $localAppDataPath = [System.Environment]::GetFolderPath('LocalApplicationData')
	    $sourcePath = "$localAppDataPath\Packages\Microsoft.Office.OneNote_8wekyb3d8bbwe\LocalState\AppData\Local\OneNote\16.0\BackUp\"
        $destinationPath = [System.Environment]::GetFolderPath('LocalApplicationData') + "\Microsoft\OneNote\16.0\Backup\"

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
        writeLogsToFileAndConsole "OneNote UWP version uninstalled"
    }
}

function MainRoutine {
    checkOneNoteWin32Install
    checkOneNoteUWPInstall
    updateUWPVersion
    launchBackUp
    killProcess
    parseJson
    moveBackup
    uninstallUWP
}

## Executes the main routine ##

MainRoutine
