#HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\ 
#0/show , 1/hide

$path="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$desktop="{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
$control="{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"
$network="{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"
$usersfolder="{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
$recycle="{645FF040-5081-101B-9F08-00AA002F954E}"


Write-Host ""
Write-Host "__________________________________________________________"
Write-Host "Select an option from below list."
$options = @("        d - Desktop Icon", "        c - Control Panel Icon", "        n - Network Icon", "        u - Users Folder Icon", "        r - Recycle Bin Icon", "        a - All Icons" , "        b - Desktop & Users Folder Icons")
Write-Output $options

Write-Host ""
$option = Read-Host -Prompt "Enter your option (relavent latter) "


switch ($option) {
    "d" {
        $desExist="Get-ItemProperty -Path $path -Name $desktop"
        if ($desExist)
            {
                Set-ItemProperty -Path $path -Name $desktop -Value 0 -force
            }
        Else
            {
                New-ItemProperty -Path $path -Name $desktop -Value 0 -force
            }
        }
    "c" {
        $desExist="Get-ItemProperty -Path $path -Name $control"
        if ($desExist)
            {
                Set-ItemProperty -Path $path -Name $control -Value 0 -force
            }
        Else
            {
                New-ItemProperty -Path $path -Name $control -Value 0 -force
            }
        }
    "n" {
        $desExist="Get-ItemProperty -Path $path -Name $network"
        if ($desExist)
            {
                Set-ItemProperty -Path $path -Name $network -Value 0 -force
            }
        Else
            {
                New-ItemProperty -Path $path -Name $network -Value 0 -force
            }
        }
    "u" {
        $desExist="Get-ItemProperty -Path $path -Name $usersfolder"
        if ($desExist)
            {
                Set-ItemProperty -Path $path -Name $usersfolder -Value 0 -force
            }
        Else
            {
                New-ItemProperty -Path $path -Name $usersfolder -Value 0 -force
            }
        }
    "r" {
        $desExist="Get-ItemProperty -Path $path -Name $recycle"
        if ($desExist)
            {
                Set-ItemProperty -Path $path -Name $recycle -Value 0 -force
            }
        Else
            {
                New-ItemProperty -Path $path -Name $recycle -Value 0 -force
            }
        }
    "a" {
        New-ItemProperty -Path $path -Name $desktop -Value 0 -force
        New-ItemProperty -Path $path -Name $control -Value 0 -force
        New-ItemProperty -Path $path -Name $network -Value 0 -force
        New-ItemProperty -Path $path -Name $usersfolder -Value 0 -force
        New-ItemProperty -Path $path -Name $recycle -Value 0 -force
        }
    "b" {
        New-ItemProperty -Path $path -Name $desktop -Value 0 -force
        New-ItemProperty -Path $path -Name $usersfolder -Value 0 -force
        Set-ItemProperty -Path $path -Name $recycle -Value 0 -force
        }
    default {
        Write-Host "INVALID INPUT!"
    }
}





