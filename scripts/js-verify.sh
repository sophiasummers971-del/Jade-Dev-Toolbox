#!/usr/bin/env sh
set -eu

run_if_present() {
  name="$1"
  if node -e "const p=require('./package.json'); process.exit(p.scripts && p.scripts['$name'] ? 0 : 1)" 2>/dev/null; then
    printf '\n== npm run %s ==\n' "$name"
    npm run "$name"
  else
    printf '\nSKIP: package.json has no %s script\n' "$name"
  fi
}

run_if_present typecheck
run_if_present lint
run_if_present test
run_if_present format:check
run_if_present schema:check
run_if_present build
run_if_present check:dist
