Write-Host ""
Write-Host -ForegroundColor Green "This script will add Wi-Fi. Then, add to the domain group."
Write-Host "__________________________________________________________________________"

# Prompt for username and password
$username = Read-Host -Prompt "Enter your username"
$password = Read-Host -Prompt "Enter your password" -AsSecureString

#Domain Name
$domainName = "domain.local"

# Get the computer's current hostname
$computerName = $env:COMPUTERNAME


#Add AIPL100
netsh wlan add profile filename="$PSScriptRoot\Profiles\domain-wifi.xml" interface="Wi-Fi"
Pause

Write-Host "Ping to Secondary Server..."
Test-Connection -ComputerName 192.168.0.1
Write-Host "Ping to Primary AD DC Server..."
if (Test-Connection -ComputerName 192.168.0.2 -Count 1 -Quiet) {
    "Ping successful."
    # Create a credential object
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)

    Write-Host "Current Computer NAME: "$computerName
    Write-Host "MAKE SURE THAT; ABOVE PC NAME IS NOT ALREADY EXSISTING IN AD-DS."
    Pause

    # Add the computer to the domain
    try {
        # Add the computer to the domain
        Add-Computer -DomainName $domainName -Credential $credential -force -Restart
    } catch {
        Write-Host "An error occurred: $_"
    }
} else {
    "Ping failed to primary AD DC server!"
}