Get-NetAdapter

#Define network settings

$InterfaceAlias = "Ethernet"
$IPAddress = "192.168.0.1"
$PrefixLength = 24
$DefaultGateway = "192.168.0.2"
$DNSServers = @("192.168.0.3", "8.8.8.8")

#Clear old addresses
Get-NetIPAddress -InterfaceAlias $InterfaceAlias -AddressFamily IPv4 | Remove-NetIPAddress -Confirm:$false

#Set new addresses
New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $IPAddress -PrefixLength $PrefixLength -DefaultGateway $DefaultGateway

#Set DNS
Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses $DNSServers

#Restart Network Adapter
Restart-NetAdapter Ethernet -PassThru

Write-Output "Static IP applied to $InterfaceAlias"
Write-Host ""

$needDomain = Read-Host -Prompt "Need to add the Computer to the Domain? (y/n)"
switch ($needDomain) {
    y{
        $username = Read-Host -Prompt "Enter your username"
        $password = Read-Host -Prompt "Enter your password" -AsSecureString
        $domainName = "domain.local"
        $computerName = $env:COMPUTERNAME
        ping 192.168.0.1
        ping 192.168.0.2
        Write-Host ""
        Write-Host "Current Computer NAME: "$computerName -ForegroundColor Green
        Write-Host "MAKE SURE THAT; ABOVE PC NAME IS NOT ALREADY EXSISTING IN AD-DS."
        Pause        
        $credential = New-Object System.Management.Automation.PSCredential($username, $password)
        try {
            # Add the computer to the domain
            Add-Computer -DomainName $domainName -Credential $credential -force -Restart
        } catch {
            Write-Host "An error occurred: $_"
        }
    }
    n{exit}
    Default {exit}
}