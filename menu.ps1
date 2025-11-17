Write-Host ""
Write-Host "============================================="
Write-Host -ForegroundColor Green "WELCOME!"
Write-Host "============================================="

$looping = "y"
While ($looping -eq "y"){

    $menuOpts = @(
    "   1 - [user.ps1] Rename Computer & Enable Admin Account", 
    "   2 - [admin.ps1] SeT TimeZone, RestorePoints, Icons, Software(Include HP and O365)", 
    "   3 - Desktop Icons Settings",
    "   4 - Other Basic Settings", 
    "   5 - Software Installation", 
    "   6 - Install application(without HP, Sophos and O365)",
    "   7 - [allSoftware2019.ps1] Do all and Install aplications with Office 2019",
    "   8 - [domain.ps1] Add Domain Group", 
    "   9 - [printer.ps1] Add Printers", 
    "   0 - Exit")
    Write-Host ""
    Write-Output $menuOpts

    Write-Host ""
    $menuOption = Read-Host -Prompt "What you are looking for "

    switch ($menuOption) {
        "1" {
        & ".\user.ps1"
        }
        "2" {
        & ".\admin.ps1"
        }
        "3" {
        & "$PSScriptRoot\PSS\getIcons.ps1"
        }
        "4" {
        & "$PSScriptRoot\PSS\basicSettings.ps1"
        }
        "5" {
        & "$PSScriptRoot\PSS\installSoftware.ps1"
        }
        "6" {
        & "$PSScriptRoot\PSS\appSoftware.ps1"
        }
        "7" {
        & "$PSScriptRoot\PSS\allSoftware2019.ps1"
        }
        "8" {
        & ".\domain.ps1"
        }
        "9" {
        & ".\printer.ps1"
        #Start-Process "powershell.exe" -ArgumentList "-File $PSScriptRoot\printer.ps1"
        }
        "0" {
        # Wi-Fi profile name to search and delete
        $wifiProfileNameOne = "4G LTE Test SSID 1"
        $wifiProfileNameTwo = "4G LTE Test SSID 2"

        # Get all Wi-Fi profiles
        $profiles = netsh wlan show profiles

        # Check if the specified First profile exists
        if ($profiles -match $wifiProfileNameOne) {
            Write-Host "Profile '$wifiProfileNameOne' found. Deleting..."
            # Delete the Wi-Fi profile
            netsh wlan delete profile name="$wifiProfileNameOne"
        } else {
            #Write-Host "Profile '$wifiProfileNameOne' not found."
        }

        # Check if the specified Second profile exists
        if ($profiles -match $wifiProfileNameTwo) {
            Write-Host "Profile '$wifiProfileNameTwo' found. Deleting..."
            # Delete the Wi-Fi profile
            netsh wlan delete profile name="$wifiProfileNameTwo"
        } else {
            #ssWrite-Host "Profile '$wifiProfileNameTwo' not found."
        }

        Write-Host "============================================="
        Write-Host -ForegroundColor Green "GOOD BYE!"
        $currentpolicy = Get-ExecutionPolicy
        if ($currentpolicy -eq "Unrestricted")
            {Set-ExecutionPolicy Restricted
            Exit}
        else {Exit}
        }
        default {
            Write-Host "INVALID INPUT!"
        }
    }
}

