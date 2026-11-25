<#
.SYNOPSIS
    Hardware & OS Health Audit Script
.DESCRIPTION
    Collects CPU, RAM, Disk health, OS uptime, and critical system info for field support tickets.
#>

Write-Host "=== SYSTEM & HARDWARE HEALTH AUDIT ===" -ForegroundColor Cyan

$os = Get-CimInstance Win32_OperatingSystem
$cs = Get-CimInstance Win32_ComputerSystem
$cpu = Get-CimInstance Win32_Processor
$uptime = (Get-Date) - $os.LastBootUpTime

Write-Host "`n[System Info]" -ForegroundColor Yellow
Write-Host "Hostname     : $($cs.Name)"
Write-Host "OS           : $($os.Caption) (Build $($os.BuildNumber))"
Write-Host "Uptime       : $($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m"
Write-Host "Processor    : $($cpu.Name)"

$totalRamGB = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2)
$freeRamGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
Write-Host "Memory (RAM) : $freeRamGB GB free / $totalRamGB GB total"

Write-Host "`n[Storage Volumes]" -ForegroundColor Yellow
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $free = [math]::Round($_.FreeSpace / 1GB, 2)
    $size = [math]::Round($_.Size / 1GB, 2)
    $pct = [math]::Round(($_.FreeSpace / $_.Size) * 100, 1)
    Write-Host "Drive $($_.DeviceID) -> $free GB free of $size GB ($pct% free)"
}

Write-Host "`nAudit finished." -ForegroundColor Cyan
