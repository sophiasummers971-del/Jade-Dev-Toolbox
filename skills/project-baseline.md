# Skill: Project Baseline

**Default:** READ-ONLY

## Goal
Produce a trustworthy snapshot before implementation.

## Procedure
1. Identify repository and intended environment.
2. Read default/canonical branch.
3. Resolve its current HEAD SHA.
4. Inspect relevant open/closed PRs only when they matter to the task.
5. Inspect CI/check status.
6. Inspect deployment/runtime state when available and relevant.
7. Compare observed state with any supplied baseline.
8. Report contradictions explicitly.
9. Recommend the smallest next verification step.

## Output
- Repository
- Canonical branch
- Current SHA
- Relevant PR/CI state
- Deployment state, if checked
- Verified facts
- Unverified claims
- Contradictions
- Safest next step

Do not modify, merge, reset, force-push or deploy during a baseline audit.
