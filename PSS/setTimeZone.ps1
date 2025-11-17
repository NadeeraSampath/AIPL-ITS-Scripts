#Change time-zone
Write-Host "Changing time Zone and syncing..."
Set-TimeZone -Name "Sri Lanka Standard Time" -passThru
Start-Service W32Time
W32tm /resync
W32tm /config /update