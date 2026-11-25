# IT Field Diagnostics Toolkit

An open-source collection of lightweight, dependency-free diagnostic scripts and maintenance utilities built for IT field technicians, sysadmins, and support engineers.

## Purpose

Field technicians often work in restricted environments where installing heavy third-party software is not permitted. This repository provides clean, auditable, native scripts to quickly isolate network bottlenecks, verify DNS/gateway routing, and gather hardware health metrics during on-site support.

## Available Tools

| Script | Platform | Description |
| :--- | :--- | :--- |
| `scripts/network-health-check.ps1` | Windows (PowerShell) | Checks active network adapters, IPv4 gateway config, external ICMP latency, and DNS resolution. |
| `scripts/system-audit.ps1` | Windows (PowerShell) | Generates a fast hardware/OS health summary including uptime, RAM allocation, and disk space thresholds. |

## Quick Usage

Run directly from an elevated or standard PowerShell terminal:

```powershell
# Run network diagnostics
.\scripts\network-health-check.ps1

# Run hardware and OS audit
.\scripts\system-audit.ps1
