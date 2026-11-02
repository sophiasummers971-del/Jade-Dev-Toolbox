# Toolbox Index

| Need | Go to |
|---|---|
| Git / GitHub | `guides/git-github.md` |
| Termux | `guides/termux.md` |
| Cloudflare | `guides/cloudflare.md` |
| Cloudflare release notes (15 Oct 2026) | `guides/cloudflare-changelog-2026-10-15.md` |
| Supabase | `guides/supabase.md` |
| Android / WebToApp | `guides/android-webtoapp.md` |
| Testing / CI | `guides/testing-ci.md` |
| Deployment | `checklists/deployment.md` |
| Engineering handoff | `checklists/engineering-handoff.md` |
| Agent prompts | `prompts/README.md` |
| Project map | `projects/README.md` |

Search terms: git, branch, commit, SHA, PR, rollback, Termux, npm, pnpm, Vite, Cloudflare, Worker, Pages, Hyperdrive, Supabase, PostgreSQL, OAuth, redirect URI, Android, WebView, WebToApp, CI, typecheck, lint, tests, build, deployment.

**Rule:** if a note conflicts with the actual repository/configuration, the repository wins. Re-verify and update this toolbox.

## Recently harvested reusable material
- Android/Termux vs Linux-native tooling: `guides/termux-linux-tooling.md`
- Supabase tenant-security and cleanup: `guides/supabase-security-validation.md`
- Secure deployment gates: `checklists/secure-deployment-gate.md`
- Security review agent prompt: `prompts/security-review-agent.md`
- Weekly knowledge harvest prompt: `prompts/toolbox-harvester.md`

## Harvested 19 October 2026 (REFERENCE)
- Workflow canvas acceptance: `checklists/workflow-canvas-acceptance.md`
- Localhost/LAN and Windows CLI: `guides/lan-localhost-windows-cli.md`
- Bounded agent execution/failover: `checklists/bounded-agent-failover.md`
- Local prototype reviewer: `prompts/local-prototype-acceptance-review.md`

## Harvested 26 October 2026
- Agent trust boundaries and synthetic injection tests: `checklists/agent-input-trust-boundaries.md` (**REFERENCE**)
- Offsite backup integrity and restore proof: `checklists/backup-restore-evidence.md` (**REFERENCE**)
- Cloud control-plane versus DNS/HTTPS/data-plane verification: `guides/cloudflare-health-evidence.md` (**REFERENCE**)
- Termux Codex daemon versus account/workspace routing: `guides/termux-codex-daemon-triage.md` (**REFERENCE**; historical CLI errors observed)
- Local media preservation, exports and hardware retirement: `guides/local-media-safe-editing.md` (**REFERENCE**)
- Independent incident/recovery audit prompt: `prompts/incident-recovery-evidence-audit.md` (**REFERENCE**)
- VPN protocol/key mismatch diagnostic: `guides/warp-protocol-key-mismatch.md` (**REFERENCE**; historical log signature observed)

**Evidence labels:** VERIFIED = observed or independently tested with a dated receipt and scope; REFERENCE = guidance or untested proposal; STALE = superseded historical observation. A verified historical error does not establish current service health.

## Harvested 2 November 2026
- Discord Gateway versus scheduled Worker events, duplicate prevention and acceptance: `guides/discord-gateway-event-acceptance.md` (**REFERENCE**; 3 isolated formatting tests VERIFIED on 2026-11-02, live Gateway UNVERIFIED)
- Hosted RLS/authorization test ladder: `checklists/hosted-rls-authorization-acceptance.md` (**REFERENCE**; historical native SQL CI evidence VERIFIED, hosted integration UNVERIFIED)
- Access audience mismatch and source-to-deployment integrity: `guides/access-audience-deployment-provenance.md` (**REFERENCE**; historical observation, current state unknown)
- Sentinel Gateway architecture and dated evidence: `projects/sentinel-gateway-evidence.md` (**REFERENCE**; hosted unit tests and empty service inventory VERIFIED on 2026-11-02)

## Current closeout work
- Evidence-driven project finish-line board: `checklists/project-closeout-board.md` (**REFERENCE / UNVERIFIED**, 2026-10-26). Use before opening fresh feature work.
