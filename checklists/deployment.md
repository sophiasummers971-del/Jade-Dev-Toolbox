# Deployment Checklist

**Status:** REFERENCE

Before deployment:
- [ ] Repository and target environment confirmed
- [ ] Branch and commit SHA confirmed
- [ ] Change set understood
- [ ] Relevant typecheck/tests/lint/build complete
- [ ] Environment/bindings checked without exposing values
- [ ] Migrations reviewed when applicable
- [ ] OAuth production URLs checked when applicable
- [ ] Rollback point identified

After deployment:
- [ ] Live URL responds
- [ ] Critical path tested
- [ ] Authentication tested when applicable
- [ ] Logs/monitoring checked
- [ ] Exact deployed SHA recorded

Implementation, merge and deployment are separate actions.
