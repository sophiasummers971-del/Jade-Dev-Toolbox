# Project closeout board — 2026-10-26

**Status: REFERENCE / UNVERIFIED**. This board turns prior design discussions into checkable outcomes. No production system is modified by this document. It is not a claim that the projects currently pass.

## Decision rule
Prioritise completing and testing an already-built critical path over introducing a new feature. Each item needs: owner, scope, acceptance test, evidence timestamp, and explicit disposition (DONE / BLOCKED / NOT STARTED).

## Priority 1: SJ-INSIDES / Sentinel (Cloudflare + Discord)
- [ ] Confirm Discord Community feature is enabled via a fresh guild API response.
- [ ] Verify Discord slash-command registration and interaction end-to-end, or deliberately retire the command if the caretaker is intended to be automatic-only.
- [ ] Verify existing scheduled tasks post once, detect missing channels, and do not duplicate announcements.
- [ ] Build **member-join events** through a supported Gateway listener or a separately designed event bridge. A Discord HTTP interactions endpoint does NOT receive arbitrary member-join gateway events.
- [ ] Implement newcomer greetings with a no-spam policy, opt-outs as appropriate, and clear rules link.
- [ ] Add release publishing via an explicitly chosen official feed or authorised source; use deduplication, attribution and rate limits.
- [ ] Configure/test Discord AutoMod separately; human review before irreversible sanctions.
- [ ] Reduce Sentinel permissions to least privilege AFTER onboarding and setup verification.
- [ ] Test failure handling and log a rollback/redeploy procedure.

## Priority 2: Cross-AI Memory Hub
- [ ] Reverify current login, import/review workflow and cited retrieval on deployed revision.
- [ ] Rerun isolation, forged-ownership, stale-edit and destructive-purge tests against an isolated test environment.
- [ ] Confirm backup and restore test before migrations. No personal source summaries in the toolbox.

## Priority 3: OSIRIS / PEGASUS
- [ ] Identify live revision and deployment pipeline; confirm login and case registry critical path.
- [ ] Check signed evidence downloads, authorisation boundaries, audit log and schema migrations.
- [ ] Keep payment gateway integration separate from security critical-path fixes; require explicit account-side approval for charges.
- [ ] Rerun test/typecheck/format individually and fix confirmed failures. Do not rely on historical test counts.

## Priority 4: Sector 7 workflow canvas
- [ ] Prove one real execute/review/approve/export path with stable settings snapshot.
- [ ] Verify persistence and recovery across restart.
- [ ] Check phone accessibility separately from responsive browser tests.

## Priority 5: Velvet Vault
- [ ] Confirm duplicate detection with real media, including near-duplicate false positives.
- [ ] Validate non-destructive editing, exports, quarantine and restore on the intended local device.
- [ ] Never modify or delete originals before verified backup and explicit per-batch approval.

## Priority 6: Ash & Signal publishing
- [ ] Check public music links, title/artist/album metadata and consistency of current releases.
- [ ] Maintain one canonical release ledger to avoid duplicates across platforms.
- [ ] Announce verified releases only, not scheduled tracks whose publication hasn't been confirmed.

## Closure evidence template
| Task | Owner | Environment / revision | PASS / FAIL / NOT RUN | Evidence time | Next action |
|---|---|---|---|---|---|
| | | | NOT RUN | | |

## Boundaries
- **Do not infer a live working system from documentation or a deployment receipt.**
- **No secrets, account IDs, personal records or transcript dumps in this repository.**
- Changes to live bots, payments, public content or destructive media operations require their own controlled implementation and validation.
