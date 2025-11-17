Write-Host "This will restart the PC instantly...!"
$pcname = Read-Host -Prompt "Enter computer name"
# Rename the computer and restart
Rename-Computer -NewName $pcname -Force -Restart