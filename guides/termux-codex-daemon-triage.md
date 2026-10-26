# Termux Codex daemon and Linux-userland triage

**Status: REFERENCE** | Harvested 2026-10-26. Error signatures were **VERIFIED as observed in user-supplied CLI output** in October 2026; fixes below have **not** been verified on that device.

## Observed failure signatures (historical, not current health)
- `app server did not become ready` with a missing `app-server-control.sock`.
- CLI suggests `--no-daemon` to bypass the background server.
- Retrying with `--no-daemon` instead reports `account/read failed` and `workspace routing discovery failed (code -32603)`.

The second failure is a **different layer** from the socket error. Do not keep restarting the daemon and claim the authentication/workspace issue is fixed.

## Read-only diagnostic order
1. Record Android/Termux version, CPU architecture, executable location, CLI version and the complete sanitized error.
2. Check whether running in native Termux (Android) or a Debian/other Linux userland. Their binaries and dependency trees are not interchangeable.
3. Run `command -v codex`, `codex --version`, `uname -m`, `node --version` where available.
4. Check for documented CLI modes and supported account setup. Never paste session cookies, tokens or config secrets into chat/logs.
5. If a daemon socket fails, use the CLI's **documented** foreground mode once to separate daemon failure from account/workspace routing.
6. If account/workspace routing still fails, stop treating it as a socket problem. Check official service status and supported login/workspace configuration.
7. For Linux-only binaries, install a supported architecture-specific build **inside** the Linux userland; do not reuse Android `node_modules`.
8. Before changing any installation, preserve a copy of project files and record a rollback plan.

## Avoid
- Do not disable sandboxing, force privileged Android changes or delete app data merely to make a daemon start.
- Do not assume Debian/proot solves remote account routing.
- Do not treat a successful `--version` as proof the CLI can authenticate or run jobs.

Related: `guides/termux-linux-tooling.md`, `guides/lan-localhost-windows-cli.md`.
