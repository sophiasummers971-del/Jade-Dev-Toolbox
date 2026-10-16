# Toolbox harvest prompt

**Status: REFERENCE**

Review recent technical work for reusable, generalizable engineering knowledge.

- Extract prompts, commands, error diagnoses, verification methods, skills and checklists, not entire transcripts.
- First inspect INDEX.md and destination file to avoid duplicates.
- Sanitize everything: strip names, emails, private URLs, account identifiers, tokens, data and personal records.
- Put cross-project lessons in guides/, actionable gates in checklists/, agent instructions in prompts/, and only nonsensitive architecture mappings in projects/.
- For each addition distinguish VERIFIED (tested), REFERENCE (guidance), STALE (historical).
- Reconcile conflicting prior notes rather than appending contradictions.
- Never alter production systems or other projects as a side effect of organizing documentation.
- Output changed paths, precise provenance category, and unverified assumptions.
