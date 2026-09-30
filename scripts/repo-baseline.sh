#!/usr/bin/env sh
set -eu

printf '%s\n' '== Repository baseline =='
printf 'Path: '; pwd
printf 'Branch: '; git branch --show-current
printf 'HEAD: '; git rev-parse HEAD
printf '%s\n' '-- Status --'
git status --short --branch
printf '%s\n' '-- Remotes --'
git remote -v
printf '%s\n' '-- Recent commits --'
git log --oneline --decorate -10

printf '%s\n' 'Read-only baseline complete. No pull, reset, merge, push or deployment was performed.'
