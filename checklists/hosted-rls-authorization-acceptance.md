# Hosted authorization acceptance: RLS, grants and API clients

**Status: REFERENCE** | Harvested 2026-11-02. Use for case/evidence systems and any multi-tenant Postgres/Supabase application.

## Why this gate exists
Passing SQL unit tests does not prove that hosted Auth, PostgREST, service roles, migrations, client queries or connection pooling enforce the same boundary. A successful login proves authentication, not authorization.

## Minimum negative-test matrix
- [ ] Inventory affected tables, policies, direct grants, views, triggers and SECURITY DEFINER functions before changing anything.
- [ ] Create two disposable identities and unrelated synthetic parent records in an isolated hosted environment.
- [ ] As identity A, read and mutate A-owned records through the **real client API**; confirm intended positive paths.
- [ ] As A, attempt append/update/delete of B-owned child rows, including audit and evidence records; require denial.
- [ ] Test forged owner IDs, null/invalid claims, missing parent, cross-case foreign keys and attempts to bypass via RPC or upsert.
- [ ] Verify `USING` **and** `WITH CHECK` on inserts/updates, explicit `GRANT`/`REVOKE`, and privileged role/BYPASSRLS behavior.
- [ ] Inspect server-authored provenance separately. A user-permitted audit insert or cryptographic seal does not by itself prove independent server authorship.
- [ ] Run concurrent writes, stale-edit and rollback tests using exact application clients and connection modes.
- [ ] Capture only synthetic fixtures, timestamps, test counts and commit identifiers; delete all hosted fixtures and verify cleanup.
- [ ] Re-run application login, owner-scoped operations and negative tests after the candidate repair. Keep production SQL **unapplied** until isolated rehearsal, review and exact-change approval.

## Evidence ladder
1. **Source review**: candidate policies and migration text inspected.
2. **Local SQL tests**: native database negative cases reproduce the defect and pass after repair.
3. **Hosted integration**: real Auth/PostgREST and application clients enforce the policy in isolated staging.
4. **Production acceptance**: exact transaction authorized, applied, observed and reversible where feasible.

Never promote level 2 to level 3 or 4 by inference. If staging is unavailable, report **BLOCKED**, not PASS; do not run destructive authorization experiments against production.

## Historical case evidence
**VERIFIED within CI scope, 2026-10-29:** A draft authorization repair reproduced cross-case child-record append acceptance under old policies, then passed 26 native PostgreSQL ownership tests under the proposed policies; the repository also reported 223 passing tests on the final revision. See [the evidence-bearing draft PR](https://github.com/sophiasummers971-del/osiris-web/pull/63).

**UNVERIFIED / unapplied at that evidence point:** hosted Supabase Auth/PostgREST behavior, isolated managed staging, production migration, concurrency and privileged-role behavior. This is a dated case study, **not** a current production safety assertion.

Related: `guides/supabase-security-validation.md`, `checklists/secure-deployment-gate.md`.
