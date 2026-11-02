# Sentinel caretaker: architecture and evidence boundary

**Status: REFERENCE with narrowly scoped VERIFIED observations** | Reviewed 2026-11-02. This is a technical status snapshot, not a live-health guarantee.

## Components
- Existing scheduled Cloudflare Worker: HTTP interactions, periodic Discord configuration reconciliation and a general welcome-channel message.
- Separate Node/Discord Gateway listener: intended for per-member greetings and AutoMod event reporting.
- Optional public-release polling: must use a trusted release manifest, publication verification and durable deduplication.
- Discord's native welcome screen is separate from personal Gateway greetings.

## Latest directly checked evidence (2026-11-02)
- **VERIFIED:** The separate hosted Node environment contains the Gateway code and dependencies. Its three message-format tests passed (welcome mention, non-HTTPS release rejection, valid release formatting).
- **VERIFIED:** The host reported **zero configured managed services** at inspection. A provisioned environment is not an always-running bot.
- **UNVERIFIED:** Bot token configured in the Gateway host, privileged Server Members Intent enabled, live Gateway session, personal member-join event, AutoMod reporting, public release feed and persistence under restart.
- **USER-REPORTED, not independently verified:** A general Discord welcome message appeared. This does not establish that the personal greeting fired.

## Release gate
A deployment or a local test is not acceptance. Require a real test-account join after Gateway connection, a single targeted mention, a verified synthetic release posted once, an AutoMod test to a restricted channel, and a restart/reconnect with no unexpected duplicates. Record each gate independently. Do not use private account email addresses or token values in evidence.

**Staleness rule:** This status expires as soon as the host/service configuration changes. Reinspect service state, Discord permissions and observed messages before marking live.

Related: `guides/discord-gateway-event-acceptance.md`, `checklists/project-closeout-board.md`.
