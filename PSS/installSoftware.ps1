Write-Host "__________________________________________________________"
$ISloop = "y"
While ($ISloop -eq "y"){

    $ISOpts = @(
    "   	1 - HP Support Assistant", 
    "   	2 - Sophos Endpoint Agent", 
    "   	3 - Office 365",
    "   	4 - Microsoft Office 2019", 
    "   	5 - Activate Office 2016 or 2019", 
    "   	6 - Teams Work or School (msix package)",
    "   	7 - Teams Work or School (Copy to C:\Program Files)", 
    "   	8 - ", 
    "   	9 - Microsoft Edge WebView 2 Runtime InstallerX64", 
    "   	0 - Exit")
    Write-Output $ISOpts

    Write-Host ""
    $ISOption = Read-Host -Prompt "Which software need to be installed "

    switch ($ISOption) {
        "1" {
		Write-Host "Installing HPS..."
		Start-Process -FilePath ".\Software\HP.exe" -ArgumentList "/s" -Wait
	    }
        "2" {
		Write-Host "Installing Sophos..."
		Start-Process -FilePath ".\Software\Sophos.exe" -ArgumentList "--quiet" -Wait
	    }
        "3" {
		Write-Host "Installing O365..."
		Copy-Item -Path ".\Software\O365" -Destination "C:\" -Recurse -Force -PassThru 
		Start-Process -FilePath "C:\O365\Command.bat" -Wait
        Write-Host ""
        $del365copy = Read-Host -Prompt "Need to delete O365 copy (y/n)"
        switch ($del365copy) {
            "y" {Remove-Item -Path C:\O365\ -Recurse}
            "n" {}
            default {Remove-Item -Path C:\O365\ -Recurse}
            }
        }
        "4" {
		Set-MpPreference -DisableRealtimeMonitoring $true
        Write-Host "Disable Antivirus software..."
        Start-Process "windowsdefender://threat"
		Pause
        $currentLocation = (Get-Location).Path
        $relativeISOLocation = "\Resources\OfficePro2019.ISO"
        $absoluteISOLocation = $currentLocation + $relativeISOLocation
        Mount-DiskImage -ImagePath $absoluteISOLocation
        #Get driveletter of Ofiice2019ISO
        $allCdDrives = Get-WmiObject -Class Win32_CDROMDrive
        $office2019isoDrive = $allCdDrives | Where-Object { $_.VolumeName -like "16.0.11629.20246" } 
        $office2019isoDriveLetter = $office2019isoDrive.Drive
        $office2019FullPath = $office2019isoDriveLetter+"\OInstall.exe"
        Start-Process -FilePath $office2019FullPath -Wait
        Pause
        Set-MpPreference -DisableRealtimeMonitoring $false
        Dismount-DiskImage -ImagePath $absoluteISOLocation
        }
        "5" {irm https://get.activated.win | iex}
        "6" {
        Write-Host "Installing Microsoft Teams..."
        $teamsMsixPath = ".\Resources\MSTeams-x64.msix"
        #Add-AppxPackage -Path $teamsMsixPath -AllowUnsigned
        Start-Process $teamsMsixPath
        }
        "7" {Write-Host "Copping Microsoft Teams to Program Files..."
        Copy-Item -Path ".\Software\MSTeams-x64" -Destination "C:\Program Files" -Recurse -Force -PassThru
        Write-Host "Creating a shortcut of Microsoft Teams in the desktop..."
        $targetPath="C:\Program Files\MSTeams-x64\ms-teams.exe"
        $shortcutPath=Join-Path "C:\Users\Public\Desktop" "MS-Teams.lnk"
        $wshShell= New-Object -ComObject WScript.shell
        $shortcut = $wshShell.CreateShortcut($shortcutPath)
        $shortcut.TargetPath = $targetPath
        $shortcut.WorkingDirectory = Split-Path $targetPath
        $shortcut.WindowStyle = 1
        $shortcut.Description = "Shortcut -  Microsoft teams"
        $shortcut.IconLocation = "$targetPath, 0"
        $shortcut.Save()
        Write-Output "Teams shortcut created at $shortcutPath.."
        Start-Process -FilePath "C:\Program Files\MSTeams-x64\ms-teams.exe" -ArgumentList "/s"
        }
        "8" {}
        "9" {
        Write-Host "Microsoft Edge WebView 2 Runtime..."
		Start-Process -FilePath ".\Resources\MicrosoftEdgeWebView.exe" -ArgumentList "/s" -Wait
        }
        "0" {
        exit
        }
        default {
            Write-Host "INVALID INPUT!"
        }
    }


}
