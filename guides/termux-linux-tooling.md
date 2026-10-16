# Android Termux vs Linux tooling compatibility

**Status: REFERENCE** — derived from prior development incidents, validate versions in each environment.

- Check runtime first: `node -p 'process.platform + " " + process.arch'`, `which node`, `node --version`.
- Native Termux runs on Android ARM64; Linux-targeted binaries (Wrangler/workerd and some native npm modules) may report unsupported platform.
- A Debian Linux userland (e.g. proot-distro) may run compatible Linux ARM64 builds; install dependencies in that environment rather than reusing Android node_modules.
- Confirm CLI authentication with safe identity commands before modifying infrastructure. Never record the token.
- If Codex app-server fails due to unavailable sandbox/bubblewrap/socket support, test supported CLI modes rather than trying privileged device changes.
- Record exact environment, tool versions, error message, and workaround. A successful Linux build does not imply the Android toolchain works.
- Before deployment: check target project/account, branch, clean git state, scripts and bindings.
