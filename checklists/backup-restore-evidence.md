# Offsite backup and restore proof gate

**Status: REFERENCE** | Harvested 2026-10-26. Design checklist; no successful restore drill was independently witnessed in this sweep.

## Distinct proof levels
- Configuration exists: workflow, storage, key management and permissions are documented.
- Job executed: scheduled/manual run has a dated success receipt.
- Artifact exists: remote object has expected size, checksum and retention metadata.
- Decryption works: a non-production recovery environment can decrypt it.
- Restore works: database/files recover with schema, constraints and representative synthetic records.
- Recovery objective met: measured RPO/RTO is within the stated requirement.

**A green deployment, healthy database, passing security test or empty recovery folder proves none of the later levels.**

## Checklist
- [ ] Identify all data classes: database, object storage, configuration references and migration history. Exclude plaintext secrets from logs and public reports.
- [ ] Confirm export identity has the necessary **read** privileges without broad write privileges.
- [ ] Export a consistent snapshot; check exit status, size and manifest.
- [ ] Encrypt before leaving the trusted boundary; use a supported authenticated scheme and separately managed recovery keys.
- [ ] Upload to access-controlled offsite storage with versioning/immutability and explicit retention.
- [ ] Read back metadata and bytes; verify checksum and integrity, not just HTTP success.
- [ ] Test decryption and restore into isolated disposable infrastructure; validate record counts, constraints and application queries.
- [ ] Exercise missing-key, corrupted-object, partial-upload, failed-schedule and stale-backup cases.
- [ ] Record run time, object age, checksum prefix, environment, test results and recovery duration without private IDs.
- [ ] Alert on missing recent artifacts and failed restore tests; verify at least two retained recovery points if policy requires it.

## Evidence table
| Gate | Status | Receipt |
|---|---|---|
| Workflow configured | NOT RUN | Link to reviewed revision |
| Scheduled execution | NOT RUN | Sanitized job result |
| Remote bytes verified | NOT RUN | Hash/size summary |
| Decryption tested | NOT RUN | Synthetic drill |
| Full restore tested | NOT RUN | Schema/query checks |

**Current vs stale:** a past successful backup is historical evidence, not current recoverability. Recheck freshness and perform a periodic restore drill.

Related: `guides/supabase-security-validation.md`, `checklists/secure-deployment-gate.md`.
