# Discord caretaker: Gateway events versus scheduled Workers

**Status: REFERENCE** | Harvested 2026-11-02. Architecture and acceptance guidance, not a claim of a live bot.

## Trigger boundary
- Scheduled HTTP/Cloudflare Workers can register slash commands, serve interaction webhooks, reconcile configuration and poll release feeds. They do **not** receive arbitrary `GUILD_MEMBER_ADD` Gateway events merely because an interactions endpoint exists.
- Personal join greetings require a connected Discord Gateway client with the appropriate privileged **Server Members Intent**, or a separately proven event transport.
- A generic welcome-channel post is **not** evidence of a personal `@member` greeting. Verify the message author, mention target and join-event correlation.
- Member screening can yield `pending` members. If a join handler skips pending users, implement a separate screening-completion path or the user may never receive a greeting.

## Acceptance sequence
1. Verify the Discord application and guild permissions by scope; keep bot tokens only in the host's secret manager. A write-only secret in one platform cannot be assumed transferable to another.
2. Prove the Gateway connection is actually running and can reconnect after restart; a source archive, unit tests or provisioned host is insufficient.
3. Have a disposable test account join **after** the listener is connected. Confirm exactly one personal greeting in the intended channel with only that user in `allowed_mentions.users`.
4. Exercise screening completion, reconnect, duplicate event delivery, missing channels, insufficient permissions and rate limiting. Record PASS/FAIL/NOT RUN separately.
5. Keep a reusable test account only with its owner's consent; do not automate login or handle personal account credentials.

## Release announcements
- Choose one authoritative public release ledger/feed. A production draft or scheduled timestamp is not proof that a track is publicly playable.
- Use stable release IDs, canonical URLs, publication confirmation, bounded retries and a durable announcement ledger.
- **Crash window:** sending a Discord message and saving the ledger are not atomic. A process crash between them can repost. Record message IDs, reconcile before retry and describe the remaining exactly-once limitation honestly.
- Seed existing releases without reposting the entire catalogue; test a new synthetic release separately. Avoid mass mentions and duplicate announcements.

## Moderation reporting
- Keep AutoMod enforcement and Gateway incident reporting distinct. Report rule/action IDs and a minimal reference in a restricted moderator channel; avoid copying private message content unnecessarily.
- Do not auto-kick or ban on a synthetic trigger. Test false positives, audit access, event permissions and human-review escalation.
- Review least-privilege permissions only after the actual event flows work.

## Verification scope
**VERIFIED, 2026-11-02:** Three isolated Node unit tests passed for greeting formatting, rejection of non-HTTPS release links and a valid announcement string. The host's managed service list was empty at inspection. These facts verify neither Gateway connectivity nor real Discord delivery.

**UNVERIFIED:** privileged intent configuration, live personal join, member screening completion, release feed publishing, moderation event delivery, durable exactly-once behavior and recovery.

Related: `checklists/project-closeout-board.md`, `checklists/secure-deployment-gate.md`.
