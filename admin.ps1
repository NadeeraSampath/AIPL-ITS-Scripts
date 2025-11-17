Write-Host ""
Write-Host -ForegroundColor Green "Welcome! This will do all as administrator."
Write-Host "_____________________________________________________"

#Set keybpard layout
Set-Culture "en-US"
Set-WinUserLanguageList -Force "en-US"

#Connect internet
Write-Host "Connecting Wi-Fi 4G LTE Test SSID"
$ProfileName = "4G LTE Test SSID"
$Password = "123"
netsh wlan add profile filename="$PSScriptRoot\Profiles\Dialog-4G-Test-SSID.xml" interface="Wi-Fi"
Start-Sleep -Seconds 2
netsh wlan connect name="$ProfileName"
Start-Sleep -Seconds 5

#Change time-zone
Write-Host "Changing time Zone and syncing..."
Set-TimeZone -Name "Sri Lanka Standard Time" -passThru
Start-Service W32Time
$googlePingResult = ping.exe 8.8.8.8
if ($googlePingResult -match "Reply from") {
    "Ping successful to Google.com"
    W32tm /resync
    W32tm /config /update
} else {
    "Ping failed to Google.com; Set Time Manually!"
}


Write-Host "Removing local user account..."
$needremoveuserprofile = Read-Host -Prompt "Do you need to remove all files of previous local user (y/n)"
switch ($needremoveuserprofile) {
    "y" {
        net user
        $rmvuserprofile = Read-Host -Prompt "Enter the local user account name to remove"
        if ($rmvuserprofile) {
            Remove-LocalUser -Name $rmvuserprofile
            Remove-Item -Path "C:\Users\$rmvuserprofile" -Force -Recurse
        } else {
              Write-Host "Variable rmvuserprofile is empty. Aborting."
        }
    }
    "n" {}
    Default {}
}



Write-Host "Enabling desktop icons...(Control Pannel, Computer, Network, Users Files)"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value 0 -PropertyType DWORD -Force
$Desktop = New-Object -ComObject Shell.Application
$Desktop.Namespace(0x10).Self.InvokeVerb("Refresh")
Write-Host "Do refresh to appear icons in the desktop..."




Write-Host "Enabling system protection and getting restore point..."
Enable-ComputerRestore -Drive "C:\"
vssadmin resize shadowstorage /on=C: /For=C: /MaxSize=4%
Checkpoint-Computer -Description "FreshWindowsAuto"





Get-BitLockerVolume
Write-Host "Do check bitlocker status..."
Start-Sleep -Seconds 3




# Enable Hibernate
Write-Host "Enabling Hibernate option..."
powercfg /hibernate on
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings"
$regName = "ShowHibernateOption"
if (-not (Test-Path $regPath)) {
    Write-Host "Registry path not found. Creating it..."
    New-Item -Path $regPath -Force | Out-Null
}
if (-not (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
    Write-Host "Registry value not found. Creating it..."
    New-ItemProperty -Path $regPath -Name $regName -Value 1 -PropertyType DWord -Force | Out-Null
} else {
    Write-Host "Registry value found. Setting it to 1..."
    Set-ItemProperty -Path $regPath -Name $regName -Value 1
}
Write-Host "Hibernate enabled."




Write-Host "Starting software installations..."

Write-Host "Installing HPS..."
Start-Process -FilePath ".\Software\HP.exe" -ArgumentList "/s" -Wait

Write-Host "Installing chrome..."
Start-Process -FilePath ".\Software\Chrome.exe" -ArgumentList "/silent", "/install" -Wait

Write-Host "Installing winrar..."
Start-Process -FilePath ".\Software\WinRar.exe" -ArgumentList "/s" -Wait

Write-Host "Installing AnyDesk.exe..."
Start-Process -FilePath ".\Software\AnyDesk.exe" -ArgumentList "/silent", "/install"

Write-Host "Installing AcroRdr.exe..."
Start-Process -FilePath ".\Software\AcroRdr.exe" -ArgumentList "/quiet" -Wait


Write-Host "Installing nitro..."
Get-Content -Path ".\Software\Nitro PDF Professional\nitro_pro_key.txt" | Set-Clipboard
Start-Process -FilePath ".\Software\Nitro PDF Professional\nitro_pro.exe" -ArgumentList "/silent", "/install" -Wait
Write-Host "Nitro_Pro activation key has copied to clipboard. paste it where necessary."

Write-Host "Installing foxit..."
Invoke-Item ".\Software\Foxit PhantomPDF\FoxitPhantom.msi"
<#
$foxitMsiPath = ".\Software\Foxit PhantomPDF\FoxitPhantom.msi"
$foxitArguments = "/i `"$foxitMsiPath`" /passive /norestart"
Start-Process msiexec.exe -ArgumentList $foxitArguments -Wait -NoNewWindow
#>
pause
Copy-Item -Path ".\Software\Foxit PhantomPDF\Crack Fix\plugins" -Destination "C:\Program Files (x86)\FOXIT SOFTWARE\FOXIT PHANTOMPDF" -Recurse -Force -PassThru
Copy-Item -Path ".\Software\Foxit PhantomPDF\Crack Fix\FoxitPhantomPDF.exe" -Destination "C:\Program Files (x86)\FOXIT SOFTWARE\FOXIT PHANTOMPDF" -Recurse -Force -PassThru

Write-Host "Installing vnc..."
Get-Content -Path ".\Software\Real VNC Enterprise\vnc_key.txt" | Set-Clipboard
Start-Process -FilePath ".\Software\Real VNC Enterprise\vnc.exe" -ArgumentList "/silent", "/install" -Wait
Write-Host "RealVNC_Enterprise activation key has copied to clipboard. paste it where necessary."

Write-Host "Installing O365..."
Copy-Item -Path ".\Software\O365" -Destination "C:\" -Recurse -Force -PassThru 
Start-Process -FilePath "C:\O365\Command.bat" -Wait


Write-Host "Installing sophos..."
Start-Process -FilePath ".\Software\Sophos.exe" -ArgumentList "--quiet" -Wait


Write-Host "Installing Microsoft Teams..."
Copy-Item -Path ".\Software\MSTeams-x64" -Destination "C:\Program Files" -Recurse -Force -PassThru
Start-Process -FilePath "C:\Program Files\MSTeams-x64\ms-teams.exe" -ArgumentList "/s"
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


Write-Host "Press Enter to delete O365 folder in C:\"
Pause
Remove-Item -Path C:\O365\ -Recurse

Write-Host "Press Enter to delete current Wi-Fi profile."
Pause
netsh wlan disconnect name="$ProfileName"
netsh wlan delete profile name="$ProfileName"

Write-Host "Press Enter to RESET execution policies"
Pause
Set-ExecutionPolicy Restricted

exit