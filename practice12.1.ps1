function countstart
{
$start = Get-Service | ?{$_.Status -eq "Running"}
Write-Host "Total services in running state = "$start.count
}
function countstop
{
$stop = Get-Service | ?{$_.Status -eq "Stopped"}
Write-Host "Total services in stopped state = "$stop.count
}
countstart
countstop