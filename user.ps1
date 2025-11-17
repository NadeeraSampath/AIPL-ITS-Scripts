Write-Host ""
Write-Host -ForegroundColor Green "This script is to active local administrator account, Remove current local account, rename computer and restart."
Write-Host "_____________________________________________________________________________________"

$pcname = Read-Host -Prompt "Enter computer name"
$adminpassword = Read-Host -Prompt "Enter new local administrator password" -AsSecureString
$currentaccount = $env:USERNAME

# Activate the administrator account
net user administrator /active:yes

# Set the password for the administrator account
$adminpasswordPlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($adminpassword))
net user administrator $adminpasswordPlainText

# Disable and remove current local account
Disable-LocalUser -Name $currentaccount

# Rename the computer and restart
Rename-Computer -NewName $pcname -Force -Restart