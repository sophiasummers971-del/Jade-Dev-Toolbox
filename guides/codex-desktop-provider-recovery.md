# Desktop coding assistant: provider and sandbox triage

**Status: REFERENCE** | Harvested 2026-11-09. Historical configuration observation **VERIFIED** on 2026-11-07; successful authentication recovery **UNVERIFIED**.

## Separate the failure domains
A desktop application's installation, a coding CLI's provider selection, account authentication, and Windows Sandbox availability are distinct. A working desktop package does not prove that a CLI points at the intended API provider. Conversely, enabling Sandbox is not proof of an authentication fix.

## Safe diagnostic sequence (Windows / PowerShell)
1. Identify the installed application's exact package and version, and whether the failing component is the desktop UI, CLI, or an agent subprocess.
2. Inspect only provider selector keys and provider section headers in the relevant TOML configuration. **Never print the full file**, which may include private endpoints or credentials.
3. If a third-party provider is selected unexpectedly, back up the configuration first; then use the provider identifier supported by the installed CLI version and its official documentation. Do not blindly delete other provider blocks or credentials.
4. Restart the affected application or agent session and test a harmless authenticated request. Record the result separately from the config edit.
5. Inspect Sandbox/virtualization features only when the actual error implicates them. Record pending restart state; do not assume toggling a feature repaired provider routing.
6. If unsuccessful, check the precise error, effective config precedence, CLI version, login method, environment overrides and process logs with secrets redacted.

## Evidence boundary
- **VERIFIED historical observation, 2026-11-07:** A TOML provider selector explicitly pointed at a non-default third-party provider, and a corresponding provider section existed. This supports a provider-mismatch hypothesis for the CLI, not a general Windows defect.
- **REFERENCE:** Back up, correct the selector according to current CLI documentation, restart, and test.
- **UNVERIFIED:** A successful authenticated request after correction; whether Sandbox settings caused the original failure.
- **STALE by default:** Specific package versions, provider names, and paths from a previous machine/session.

## Security
Never publish local user paths, account names, API keys, tokens, TOML contents, environment variable values, or unredacted logs. Prefer key-name-only diagnostics and sanitized before/after evidence.

Related: `guides/lan-localhost-windows-cli.md`, `checklists/secure-deployment-gate.md`.
