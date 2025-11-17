<#
pnputil.exe /a ".inf"
Add-PrinterDriver -Name "" -InfPath "C:\Windows\System32\DriverStore\FileRepository\"
Add-PrinterPort -Name "" -PrinterHostAddress ""
Add-Printer -DriverName "" -Name "" -PortName ""
#>

Write-Host ""
Write-Host -ForegroundColor Green "This script will install printer drivers and add following printers."
Write-Host "________________________________________________________________________"

$anyother = "y"
While ($anyother -eq "y"){

    Write-Host "Please note available printers from below list."
    $options = @("	0a - HP M401dn (Ground floor SCMT)", 
    "	0b - Brother MFC-L2715DW (Ground floor SCMT)", 
    "	1a - HP M401dn (1st floor Med)", 
    "	1b - HP M401dn (1st floor SOMT)", 
    "	1c - EPSON L6490 (Color 1st floor)", 
    "	1d - RICOH MP3555 (Photocopy 1st floor)",
    "	1e - Brother MFC-L2715DW (1st floor HR)",  
    "	2a - HP M401dn (2nd floor Finance)", 
    "	2b - Brother MFC-L2715DW (2nd floor Finance)", 
    "	3a - HP P3015 (Kokila 3rd floor Ana)", 
    "	3b - HP M401dn (3rd floor Ana)", 
    "	3c - HP SmartTank750 (Color 3rd floor)", 
    "	3d - RICOH MP2501 (Photocopy 3rd floor)", 
    "	4a - HP M401dn (4th floor ASSD)", 
    "	4b - HP M401dn (4th floor E-Health)")
    Write-Output $options
    Write-Host ""
    $option = Read-Host -Prompt "Enter what you need to install (relavent code) "


    switch ($option) {
        "0a" {#HP M401dn (Ground floor SCMT)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (Ground floor SCMT)"
        }
        "0b" {#Brother MFC-L2715DW (Ground floor SCMT)
        $localINF="$PSScriptRoot\Drivers\Brother_MFC-L2715DW\BRXM17A.INF"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\brxm17a.inf_amd64_61e473e495249321\BRXM17A.INF"
        $driverName="Brother MFC-L2690DW XML Paper"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="Brother MFC-L2715DW (Ground floor SCMT)"
        }
        "1a" {#HP M401dn (1st floor Med)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (1st floor Med)"
        }
        "1b" {#HP M401dn (1st floor SOMT)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (1st floor SOMT)"
        }
        "1c" {#EPSON L6490 (Color 1st floor)
        $localINF="$PSScriptRoot\Drivers\EPSON_L6490_Series\WINX64\E_WF1Y7E.INF"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\e_wf1y7e.inf_amd64_f2433db0a65d6ab5\E_WF1Y7E.INF"
        $driverName="EPSON L6490 Series"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="EPSON L6490 (Color 1st floor)"
        }
        "1d" {#RICOH MP3555 (Photocopy 1st floor)
        $localINF="$PSScriptRoot\Drivers\RICOH_MP_3555\disk1\MP_2555_.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\mp_2555_.inf_amd64_6d34974c82b8c9d6\MP_2555_.inf"
        $driverName="RICOH MP 3555 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="RICOH MP3555 (Photocopy 1st floor)"
        }
        "1e" {#Brother MFC-L2715DW (Ground floor HR)
        $localINF="$PSScriptRoot\Drivers\Brother_MFC-L2715DW\BRXM17A.INF"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\brxm17a.inf_amd64_61e473e495249321\BRXM17A.INF"
        $driverName="Brother MFC-L2690DW XML Paper"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="Brother MFC-L2715DW (1st floor HR)"
        }
        "2a" {#HP M401dn (2nd floor Finance)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (2nd floor Finance)"
        }
        "2b" {#Brother MFC-L2715DW (2nd floor Finance)
        $localINF="$PSScriptRoot\Drivers\Brother_MFC-L2715DW\BRXM17A.INF"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\brxm17a.inf_amd64_61e473e495249321\BRXM17A.INF"
        $driverName="Brother MFC-L2690DW XML Paper"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="Brother MFC-L2715DW (2nd floor Finance)"
        }
        "3a" {#HP P3015 (Kokila 3rd floor Ana)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_P3015\hpcu300u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcu300u.inf_amd64_aefa9c4110ec2905\hpcu300u.inf"
        $driverName="HP Universal Printing PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP P3015 (Kokila 3rd floor Ana)"
        }
        "3b" {#HP M401dn (3rd floor Ana)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (3rd floor Ana)"
        }
        "3c" {#HP SmartTank750 (Color 3rd floor)
        $localINF="$PSScriptRoot\Drivers\HP_Smart_Tank_750_series\hpygid35_V4.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpygid35_v4.inf_amd64_844639538edae559\hpygid35_V4.inf"
        $driverName="HP Smart Tank 750 series PCL-3 (V4)"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP SmartTank750 (Color 3rd floor)"
        }
        "3d" {#RICOH MP2501 (Photocopy 3rd floor)
        $localINF="$PSScriptRoot\Drivers\RICOH_MP_2501\PCL 6 Popup Driver\64bit\disk1\OEMSETUP.INF"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\oemsetup.inf_amd64_dadacbf72f83714a\OEMSETUP.INF"
        $driverName="RICOH MP 2501 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="RICOH MP2501 (Photocopy 3rd floor)"
        }
        "4a" {#HP M401dn (4th floor ASSD)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (4th floor ASSD)"
        }
        "4b" {#HP M401dn (4th floor E-Health)
        $localINF="$PSScriptRoot\Drivers\HP_LaserJet_400_M401\hpcm401u.inf"
        $installedINF="C:\Windows\System32\DriverStore\FileRepository\hpcm401u.inf_amd64_66ea7775456f2bdb\hpcm401u.inf"
        $driverName="HP LaserJet 400 M401 PCL 6"
        $portName="192.168.0.1        
        $hostAddress="192.168.0.1        
        $printerName="HP M401dn (4th floor E-Health)"
        }
        default {
            Write-Host "INVALID INPUT!"
            $anyother = "n"
        }
    }
    if ($anyother -eq "y"){
        # Step 1: Check if the driver is already installed
        $driverInstalled = Get-WmiObject -Query "SELECT * FROM Win32_PrinterDriver WHERE Name = '$driverName'"
        if (-not $driverInstalled) {
            Write-Host "Installing driver..."
            pnputil.exe /a $localINF
            Add-PrinterDriver -Name $driverName -InfPath $installedINF
        } else {
            Write-Host "Driver is already installed."
        }
        # Step 2: Check if the printer port exists
        $portExists = Get-WmiObject -Class Win32_TCPIPPrinterPort | Where-Object { $_.Name -eq $portName }
        if (-not $portExists) {
            Write-Host "Adding port..."
            Add-PrinterPort -Name $portName -PrinterHostAddress $hostAddress
        } else {
            Write-Host "Port is already created."
        }
        # Step 3: Check if the printer is already installed
        $printerExists = Get-WmiObject -Class Win32_Printer | Where-Object { $_.Name -eq $printerName }
        if (-not $printerExists) {
            Write-Host "Adding printer..."
            Add-Printer -DriverName $driverName -Name $printerName -PortName $portName
            Write-Host "Printer is installed..."
        } else {
            Write-Host "Printer is already installed."
        }
    }
    else {
    # Clear variables
    Remove-Variable -Name localINF -ErrorAction SilentlyContinue
    Remove-Variable -Name installedINF -ErrorAction SilentlyContinue
    Remove-Variable -Name driverName -ErrorAction SilentlyContinue
    Remove-Variable -Name portName -ErrorAction SilentlyContinue
    Remove-Variable -Name hostAddress -ErrorAction SilentlyContinue
    Remove-Variable -Name printerName -ErrorAction SilentlyContinue
    }

    $anyother = Read-Host "Is there anyother pinter to install? (y/n)"   
}
Exit