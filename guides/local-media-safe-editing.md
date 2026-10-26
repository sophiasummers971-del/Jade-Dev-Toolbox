# Local-first media library and non-destructive editing

**Status: REFERENCE** | Harvested 2026-10-26. Design and troubleshooting pattern; device-level behavior not re-tested in this sweep.

## Safe ownership boundary
- User selects folders explicitly; library scanning must not silently expand to the entire device or cloud.
- Keep originals immutable by default. Write renders, sidecars, thumbnails and proxies to separate managed paths.
- Treat duplicate detection as a **candidate list**, not deletion authority. Compare hashes and file metadata; account for visually similar but non-identical media.
- Preview edits before export; make export target and overwrite policy explicit.
- Use a two-step quarantine/trash flow with restoration before irreversible removal.
- Keep operations local unless the user explicitly requests network sharing or upload.

## Media pipeline checks
- [ ] Discover FFmpeg/ffprobe and record their versions and supported codecs.
- [ ] Validate paths, file types, duration, streams and free disk space before processing.
- [ ] Create temporary output on the intended filesystem; verify output before atomic rename.
- [ ] Confirm audio/video synchronization, orientation, color range, silence trimming and frame boundaries.
- [ ] Bound CPU, memory and parallel jobs for older hardware; cancel and resume without corrupting originals.
- [ ] Test empty folder, unreadable file, duplicate filename, malformed media, full disk and interrupted render.
- [ ] Scan newly attached phone folders only with permission; avoid auto-importing private content.
- [ ] Keep backups on a **separate physical device**, not merely a second partition on a failing disk.
- [ ] For hardware retirement, verify copied projects, media, metadata and restore ability before wiping.

## Evidence
Mark per-feature PASS / FAIL / NOT RUN. A feature appearing in the UI does not prove the FFmpeg operation, export integrity, quarantine or recovery path works. Physical-device and real-file tests are separate from mocked tests.
