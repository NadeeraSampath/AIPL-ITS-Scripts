$adminpassword = Read-Host -Prompt "Enter new administrator password" -AsSecureString

# Activate the administrator account
net user administrator /active:yes

# Set the password for the administrator account
$adminpasswordPlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($adminpassword))
net user administrator $adminpasswordPlainText