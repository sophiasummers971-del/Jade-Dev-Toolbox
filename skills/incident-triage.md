# Skill: Incident Triage

**Default:** READ-ONLY FIRST

## Goal
Find the failing layer before changing anything.

## Order
1. Reproduce or capture the exact failure.
2. Establish baseline and recent changes.
3. Classify layer: source, dependency, build, configuration, authentication, network, deployment, database, runtime.
4. Inspect evidence for that layer.
5. Form one testable hypothesis.
6. Run the least destructive test.
7. Change only after evidence points to a cause.
8. Re-run the original failing path after repair.

Avoid shotgun fixes. Preserve exact errors and timestamps where useful.
