$InterfaceAlias = "Ethernet"

Set-NetIPInterface -InterfaceAlias $InterfaceAlias -Dhcp Enabled
Get-NetIPAddress -InterfaceAlias $InterfaceAlias -AddressFamily IPv4 | Remove-NetIPAddress -Confirm:$false

Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ResetServerAddresses

Write-Output "Interface $InterfaceAlias is set to obtain IP automaticaly via DHCP."

Get-NetIPConfiguration -InterfaceAlias "Ethernet"