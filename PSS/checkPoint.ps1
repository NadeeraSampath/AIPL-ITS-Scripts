Write-Host "Enabling system protection and getting restore point..."
Enable-ComputerRestore -Drive "C:\"
vssadmin resize shadowstorage /on=C: /For=C: /MaxSize=4%
Checkpoint-Computer -Description "FreshWindowsScriptAuto"