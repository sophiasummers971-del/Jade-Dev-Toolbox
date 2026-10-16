# Secure release and deployment gate

**Status: REFERENCE**

- [ ] Record intended repository, branch, target environment and baseline commit.
- [ ] Confirm working tree clean and local/remote SHA relationship understood.
- [ ] Run typecheck, tests, lint/format and production build; record separate outcomes.
- [ ] Review secret bindings by **name only**, redirects, auth and origin restrictions.
- [ ] Test critical user paths, negative authorization cases, and cleanup.
- [ ] Verify logging does not leak query strings, tokens or private data; choose retention explicitly.
- [ ] Check pricing implications before enabling metered services.
- [ ] Separate code readiness, hosted restore drills, and owner acceptance.
- [ ] Never merge or deploy production changes without explicit project-specific authorization.
- [ ] If deployment is authorized, verify live health and prepare rollback.
- [ ] Avoid `npm audit fix --force` as a blind solution: inspect dev-only vs production vulnerabilities and breaking changes first.
