# Git & GitHub

**Status:** REFERENCE

Repository = project/history. Commit = checkpoint identified by SHA. Branch = line of development. Pull request = proposed change set. Fetch retrieves remote history without merging. Pull fetches plus integrates. Push publishes local commits. Tag names a commit.

## Safe investigation
```sh
git status
git branch --show-current
git log --oneline --decorate -10
git remote -v
git fetch --all --prune
```

**SAFE:** status, log, diff, fetch, show.

**CHECK FIRST:** switch/checkout, pull, merge, rebase.

**DANGEROUS:** force push, hard reset, destructive clean, branch deletion. Never blindly run these from an unknown Gist.

For substantial work: verify baseline → isolated branch → implement → checks → commit → inspect → push → PR/review → merge/deploy only when intended.
