# Local development: phone access and Windows CLI traps

**Status: REFERENCE** | Harvested 2026-10-19. Troubleshooting guidance; re-check exact versions and network policy.

## Phone versus host
- On a phone, `localhost` refers to the **phone**, not the development computer. A service bound to the computer's loopback interface is not automatically reachable from another device.
- Start with a loopback-only server for safety. If physical-phone testing is required, deliberately bind to an appropriate LAN interface, use the computer's LAN address, and restrict access to a trusted network.
- A prototype with no authentication must not be exposed to the public internet. Confirm firewall rules and stop LAN exposure when testing ends.
- Check independently: process running, listening address, port, host firewall, same-network connectivity, HTTP status, API path and browser origin.
- Do not confuse CORS errors with connection failures. Same-origin pages and APIs can avoid unnecessary CORS complexity.

## Windows shell and tool hooks
- PowerShell may block `npm.ps1` under execution policy while `npm.cmd` works. Prefer the supported command shim rather than weakening system policy merely to run npm.
- A hook that invokes `pwsh` fails if PowerShell 7 is absent, even when Windows PowerShell exists. Inspect the hook executable and PATH before reinstalling the project.
- Restart a local server after code changes when no hot-reload is configured; verify the active process serves the intended revision.
- Preserve command output and distinguish shell/tooling failures from application defects.

## Evidence ladder
1. Record platform, runtime versions and exact failing command.
2. Check `node --version`, `npm.cmd --version` (Windows), and the configured start script.
3. Check process, listening address, port and HTTP response from the host.
4. Repeat from the phone on a trusted LAN only when explicitly needed.
5. Test the actual user flow and record separate host-browser and physical-phone results.

**Do not publish** local IP addresses, usernames, paths, screenshots with personal data, or authentication material in troubleshooting notes.
