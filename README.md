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

Run directly from a PowerShell terminal:

- Network diagnostics: `.\scripts\network-health-check.ps1`
- Hardware and OS audit: `.\scripts\system-audit.ps1`

## Roadmap

- [ ] Linux Bash equivalents (`network-check.sh`, `sys-audit.sh`)
- [ ] Automated HTML/CSV report export for field service tickets
- [ ] Localized documentation (`pt-BR`) for Brazilian IT support teams

## Contributing

Contributions, bug reports, and new diagnostic modules are welcome! Feel free to open an issue or submit a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.
