# Identity audience and deployment provenance: two independent gates

**Status: REFERENCE** | Harvested 2026-11-02 from a historical Gateway staging investigation. Reverify all target-specific facts.

## Access authentication is not Worker authorization
- A user passing an identity-provider login or Cloudflare Access policy does **not** prove that the application accepted and verified the resulting token.
- A JWT verifier must validate signature/key source, issuer, expiry, expected audience and application-specific identity/authorization checks.
- The expected audience must belong to the **dedicated protected application**. A broad/default audience from an unrelated application can produce a valid login followed by an application-level 401/403.
- Diagnose in order: identity login result → request actually carries token → verifier issuer/key → token audience versus expected app audience → route and application policy.
- Never resolve an audience mismatch by disabling signature verification, accepting arbitrary audiences or broadening a production Access policy.

## Source-to-deployment proof
- [ ] Identify expected Git branch/commit and Worker script revision.
- [ ] Distinguish a successful manual CLI deployment from proof that GitHub auto-deploy is configured and functioning.
- [ ] Check staging and production route bindings separately; a green staging guard does not authorize production routing.
- [ ] Confirm deployed script, environment binding **names**, hostname behavior and CI all refer to the same revision.
- [ ] Use an authenticated request plus a denied/invalid-token request; record status and non-sensitive error category.
- [ ] Preserve rollback information and avoid deleting historical Workers/routes until their consumers are inventoried.

## Historical observation versus current state
**REFERENCE (historical, 2026-10-29):** One staging investigation observed successful Access login followed by Worker token rejection associated with a mismatched expected audience. A staging guard passed CI while end-to-end deployment and production routing remained unverified. This note intentionally omits account-specific audience IDs, hostnames and configurations.

**CURRENT:** Unknown until a fresh read-only inspection and request-level test. Do not treat the historical mismatch as a currently open incident.

Related: `guides/cloudflare-health-evidence.md`, `checklists/secure-deployment-gate.md`.
