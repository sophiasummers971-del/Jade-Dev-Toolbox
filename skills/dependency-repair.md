# Skill: Dependency Repair

## Goal
Resolve a dependency/security advisory with the smallest coherent change.

## Procedure
1. Confirm the advisory and affected dependency path.
2. Determine direct vs transitive ownership.
3. Check whether packages belong to a version-coupled family.
4. Select the smallest compatible fixed version.
5. Update manifests/lockfiles coherently.
6. Run the repository's complete relevant verification ladder.
7. Inspect the resulting diff for unrelated churn.
8. Record residual advisories separately.

Never hide a failing check to obtain a green report.
