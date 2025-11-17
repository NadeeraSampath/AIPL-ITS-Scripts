Get-BitLockerVolume
Write-Host ""
Write-Host "DO CHECK BitLocker status..."
$offBitLock = "y"
While ($offBitLock -eq "y"){
    $offBitLock = Read-Host "Need to turn off any? (y/n)"
    Switch ($offBitLock) {
    "y" {
    	$offdrive = Read-Host "Enter the drive letter"
    	Disable-BitLocker -MountPoint $offdrive
    }
    default {}
    } 
}
Write-Host ""
Write-Host "Current Status"
Write-Host "______________"
Get-BitLockerVolume
