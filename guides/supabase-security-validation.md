# Supabase tenant security and test-data lifecycle

**Status: REFERENCE** — reusable checklist, not a statement about current production state.

## Authorization
- Ensure cross-tenant operations are denied by the database as well as the UI.
- Exercise forged ownership claims, invalid JWT, cross-origin mutations and stale-update conflicts.
- SECURITY DEFINER RPC review: function owner, EXECUTE grants, fixed search_path, tenant predicates using trustworthy auth context, dynamic SQL, and RLS bypass implications.
- A 409 conflict should protect against stale writes; verify it end-to-end.

## Disposable E2E fixture
1. Create dedicated non-production test identity and synthetic records.
2. Verify import, approval, retrieval with cited provenance, export and purge.
3. Attempt cross-tenant access: require explicit rejection.
4. Delete fixtures in dependency-safe order, ideally guarded by exact IDs within a transaction.
5. Recheck application records, auth records and private storage for **zero residual** fixture data.
6. Record counts and non-sensitive test receipts.
7. Keep hosted restore, backup-retention and browser E2E as independent release gates.

Never paste real user records into tests. Never claim a passed unit suite proves hosted disaster recovery.
