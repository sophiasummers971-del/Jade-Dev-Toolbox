# Testing & CI

**Status:** REFERENCE

Use scripts actually defined by the repository. Common checks:
```sh
npm run typecheck
npm run lint
npm run test
npm run format:check
npm run build
```

Some projects add schema, dist or native checks. Report every check as PASS, FAIL or NOT RUN. Never describe an unavailable check as verified.

For dependency repairs, prefer the smallest coherent update and keep coupled package families aligned. Re-run the relevant verification ladder afterward.
