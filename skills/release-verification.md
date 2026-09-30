# Skill: Release Verification

**Default:** READ-ONLY

## Goal
Determine whether the intended release is actually present and healthy.

## Procedure
1. Resolve intended release commit SHA.
2. Confirm what branch/tag contains it.
3. Confirm deployment target/environment.
4. Compare deployed metadata with intended SHA when available.
5. Test the live critical path.
6. Check authentication/OAuth when relevant.
7. Inspect health/logs/monitoring when available.
8. Report VERIFIED / UNVERIFIED / FAILED separately.

A successful build, merge, or deployment command alone does not prove a healthy release.
