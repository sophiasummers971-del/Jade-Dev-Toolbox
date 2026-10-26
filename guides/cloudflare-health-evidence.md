# Cloud deployment health: control plane versus user-facing service

**Status: REFERENCE** | Harvested 2026-10-26 from October incident/recovery reviews. These are diagnostic steps, not a current availability assertion.

## Keep independent evidence streams
1. **Control plane:** deployment exists, expected revision, traffic allocation, environment/binding names and service status.
2. **Origin/data plane:** application endpoint responds with expected status, authentication and API behavior.
3. **DNS/TLS:** authoritative records, resolver observations, certificate chain and hostname routing.
4. **Database:** health, migrations, permissions, row-level policies and privileged-function warnings.
5. **CI:** build, typecheck, tests, format/lint and dependency jobs, each with a dated result.
6. **Recoverability:** offsite backup artifacts, integrity checks and isolated restore tests.

A healthy Worker deployment is **not** proof that a custom hostname resolves or that the database is recoverable. A DNS lookup failure is **not** proof of a global platform outage.

## Triage sequence
- [ ] Record time (UTC), target environment and expected revision; omit account IDs and secret values.
- [ ] Check official provider status and deployment history before assigning an outage cause.
- [ ] Check a known platform hostname and the custom hostname independently, using an approved network vantage point.
- [ ] Inspect DNS answer, TLS handshake, HTTP status, response body shape and API errors as separate gates.
- [ ] Inspect binding **names** and permissions without printing credentials.
- [ ] Compare CI result to deployed revision; never equate a green test on another SHA with production health.
- [ ] Check DB migrations and security warnings; distinguish advisory findings from confirmed exploitability.
- [ ] Report PASS / FAIL / UNVERIFIED / NOT RUN for each gate with observation timestamp.
- [ ] Revalidate after any repair and document rollback route.

## Current versus historical
Deployment receipts expire as evidence of current availability. Never reuse an old successful control-plane check as a fresh live-HTTPS claim. See `checklists/backup-restore-evidence.md` for disaster-recovery proof.
