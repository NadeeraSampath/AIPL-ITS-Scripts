
Write-Host ""
Write-Host "Starting software installations..."
Write-Host "_______________________________________________________________"

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
#Start-Process -FilePath "msiexec.exe" -ArgumentList "/I `".\Software\Foxit PhantomPDF\FoxitPhantom.msi`"" -Wait
Invoke-Item ".\Software\Foxit PhantomPDF\FoxitPhantom.msi"
#Start-Process ".\Software\Foxit PhantomPDF\FoxitPhantom.msi"
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

Write-Host "Installing Microsoft Teams..."
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
