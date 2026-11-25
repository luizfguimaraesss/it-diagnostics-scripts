<#
.SYNOPSIS
    IT Field Network & Connectivity Diagnostic Tool
.DESCRIPTION
    Performs automated checks on DNS resolution, gateway latency, active adapters, and external connectivity.
#>

Write-Host "=== IT FIELD NETWORK DIAGNOSTICS ===" -ForegroundColor Cyan
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "Scan started at: $timestamp`n"

# 1. Active Network Adapters
Write-Host "[1/4] Checking Active Network Adapters..." -ForegroundColor Yellow
Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object Name, InterfaceDescription, LinkSpeed | Format-Table -AutoSize

# 2. IP & Gateway Configuration
Write-Host "[2/4] Verifying IPv4 Configuration & Default Gateway..." -ForegroundColor Yellow
Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null } | Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer | Format-Table -AutoSize

# 3. External Connectivity & Latency Test
Write-Host "[3/4] Testing External Connectivity (Cloudflare & Google DNS)..." -ForegroundColor Yellow
$targets = @("1.1.1.1", "8.8.8.8")
foreach ($target in $targets) {
    $ping = Test-Connection -ComputerName $target -Count 2 -ErrorAction SilentlyContinue
    if ($ping) {
        $avg = ($ping | Measure-Object -Property ResponseTime -Average).Average
        Write-Host "  [OK] $target reachable - Average latency: ${avg}ms" -ForegroundColor Green
    } else {
        Write-Host "  [FAIL] $target unreachable" -ForegroundColor Red
    }
}

# 4. DNS Resolution Test
Write-Host "`n[4/4] Testing DNS Resolution..." -ForegroundColor Yellow
try {
    $dns = Resolve-DnsName -Name "github.com" -ErrorAction Stop
    Write-Host "  [OK] DNS resolved github.com successfully." -ForegroundColor Green
} catch {
    Write-Host "  [FAIL] DNS resolution failed." -ForegroundColor Red
}

Write-Host "`nDiagnostics complete." -ForegroundColor Cyan
