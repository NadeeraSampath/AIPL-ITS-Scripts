$BSloop = "y"
While ($BSloop -eq "y"){


    $BSOpts = @(
    "   	1 - Set Timezone to sri Lanka", 
    "   	2 - Enable Computer Protection and Get a Checkpoint", 
    "   	3 - Check and Off BitLocker Encription",
    "   	4 - Remove Local users and Their Users Folder", 
    "   	5 - Connect to Wi-Fi (4G LTE TEST SSID)", 
    "   	6 - Set Static IP Addresses",
    "   	7 - Reset IP Configuration to DHCP", 
    "   	8 - Enable Hibernate", 
    "   	9 - ", 
    "   	0 - Exit")
    Write-Host ""
    Write-Host "_______________________________________________________________________"
    Write-Output $BSOpts

    Write-Host ""
    $BSOption = Read-Host -Prompt "What do you what to do "

    switch ($BSOption) {
        "1" {
        & "$PSScriptRoot\setTimeZone.ps1"
        }
        "2" {
        & "$PSScriptRoot\checkPoint.ps1"
	}
        "3" {
        & "$PSScriptRoot\bitLocker.ps1"
	}
        "4" {
        & "$PSScriptRoot\removeLocalUsers.ps1"
	}
        "5" {
        Write-Host "Connecting Wi-Fi 4G LTE TEST SSID..."
        netsh wlan add profile filename=".\Profiles\4G-LTE-TEST-SSID.xml" interface="Wi-Fi"
        Start-Sleep -Seconds 1
        netsh wlan connect "4G LTE TEST SSID"
        }
        "6" {
        & "$PSScriptRoot\myIp.ps1"
	}
        "7" {
        & "$PSScriptRoot\resetIp.ps1"
	}
        "8" {
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
		}
        "9" {Write-Host "PSSript root is $PSScriptRoot."}
        "0" {
        exit
        }
        default {
            Write-Host "INVALID INPUT!"
        }
    }


}
