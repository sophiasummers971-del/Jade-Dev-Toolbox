# VPN tunnel protocol/key mismatch triage

**Status: REFERENCE** | Harvested 2026-10-26. The error signature below was **VERIFIED in supplied client logs** on 2026-10-25; remediation was discussed but not independently retested here.

## Historical observation
A tunnel client reported `InvalidPublicKeyLength` while using a public-key format incompatible with the configured tunnel protocol. Other requests returned HTTP 401/404. A brief “connected” indicator did not prove a stable data tunnel.

## Diagnostic sequence
- [ ] Confirm the active tunnel protocol and enrolled device profile from the official client UI.
- [ ] Match key type/length to that protocol; never paste actual private or public keys into tickets or a public repo.
- [ ] Check device enrollment and account authorization separately from transport negotiation.
- [ ] Read sanitized logs for protocol errors, HTTP status and disconnect timestamps.
- [ ] If the profile and client disagree, follow official re-enrollment guidance for that provider; back up non-secret settings first.
- [ ] Recheck tunnel establishment, DNS resolution and actual traffic flow, not just the UI's connected state.
- [ ] Keep unrelated DNS, routing and certificate settings unchanged until evidence implicates them.

**Do not** manually install unknown Wi-Fi certificates or repeatedly rotate keys to mask a protocol mismatch. Treat 401/404 as separate evidence until the endpoint and context are known. Historical observation is not a statement about current service health.
