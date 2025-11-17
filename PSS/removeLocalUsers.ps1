Write-Host "Please note current users from below list."
Get-LocalUser | Format-Table -Property Name, Enabled, Description -AutoSize
$option = "y"
While ($option -eq "y"){
    $rm_user = Read-Host -Prompt "Enter the Name of the local user to disable"
    Disable-LocalUser -Name $rm_user
    Remove-LocalUser -Name $rm_user
    $delAll = Read-Host "Need to delete Users data (C:\Users\UserName) permanately? (y/n)"
    Switch ($delAll) {
    "y" {
    $UserPath = "C:\Users\"+$rm_user
    Remove-Item -Path $UserPath -Recurse -Force
    }
    default {}
    }
    $option = Read-Host "Is there anyother user to remove? (y/n)"   
}
