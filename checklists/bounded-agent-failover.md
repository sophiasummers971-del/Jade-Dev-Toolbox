# Bounded agent execution and failover gate

**Status: REFERENCE** | Harvested 2026-10-19. Architecture design checklist, not evidence of a working multi-agent system.

## Authority contract for every assignment
- [ ] Identify the principal, permitted task, target resources, allowed operations, expiry and maximum impact.
- [ ] Separate proposal, policy decision, execution and independent audit.
- [ ] Specify autonomy tier: observe, draft, reversible execute, or consequential execute with human approval.
- [ ] Bind approvals to the exact inputs, output preview and action version; reject stale or reused approvals.
- [ ] Default deny when authority is missing or the policy service cannot be reached.

## Failure behaviour
- [ ] Stop new unsafe dispatches if the controller or policy dependency fails.
- [ ] Reconcile persisted job state before resuming; distinguish pending, running, succeeded, failed and unknown.
- [ ] Give retries stable idempotency keys and bounded backoff; prove no duplicate external side effects.
- [ ] Isolate projects and capabilities; no automatic cross-project privileges or shared secrets.
- [ ] Define safe degraded mode for already-authorised reversible work only.
- [ ] Record an append-only, redacted decision receipt; protect it from execution workers.
- [ ] Provide a human stop/override path and a recovery drill using disposable work.

## Proof required before calling it operational
Demonstrate successful dispatch and return, interrupted-worker recovery, duplicate suppression, denied unauthorised action, stale approval rejection and independent policy failure. Record the actual environment and observed outputs.

**Caution:** A canvas, workflow graph or architecture diagram alone proves none of these properties.
