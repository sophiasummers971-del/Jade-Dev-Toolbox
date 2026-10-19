# Local workflow canvas acceptance checklist

**Status: REFERENCE** | Harvested 2026-10-19. Apply to local prototypes; no checks were rerun for this document.

## Prove behaviour, not appearance
- [ ] Confirm a node actually transforms/dispatches work; drawing connected boxes is not execution.
- [ ] Follow one full path: load preset -> enter input -> apply settings -> save -> run -> review actual output -> approve/reject -> copy/export.
- [ ] Snapshot run settings. Changing an editor control after dispatch must not silently change a pending approval.
- [ ] Verify approvals display the exact output being authorised, not just the original input.
- [ ] Define explicit limits (input length, saved slots, authentication and permissions); test both limits and error messages.
- [ ] Confirm saved workflows and unrelated existing records remain byte-identical after upgrades, restarts and failed runs.
- [ ] Test interrupted jobs, retries, duplicate submissions and idempotent side effects. If no durable queue exists, say so.
- [ ] Test desktop and narrow viewports, then a physical phone separately. Browser emulation is not phone acceptance.
- [ ] Verify clipboard success and a manual-copy fallback on the physical device.
- [ ] Test server restart, reachable origin, and error handling after disconnection.
- [ ] Report checks independently: unit tests, browser checks, diff checks, persistence, phone and clipboard.

## Evidence template
| Gate | Result (PASS / FAIL / NOT RUN) | Evidence / environment |
|---|---|---|
| End-to-end transform and approval | | |
| Settings snapshot isolation | | |
| Persistence and unchanged legacy records | | |
| Restart and duplicate handling | | |
| Narrow viewport | | |
| Physical phone and clipboard | | |
| Auth and network exposure | | |

**Important:** A previously reported passing test count is not proof of a new release. Rerun and capture revision, environment and timestamp before labelling a project VERIFIED.
