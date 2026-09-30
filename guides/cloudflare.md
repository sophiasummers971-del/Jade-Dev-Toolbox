# Cloudflare

**Status:** REFERENCE

Cloudflare may provide Pages/Workers, routing, scheduled jobs, observability and database connectivity such as Hyperdrive.

Verification order: confirm repo/config → bindings/environment → build/tests → deployment target → deploy only when intended → verify live critical path → inspect logs/monitoring.

Document secret names and purpose, never values. Preview and production can have different URLs, OAuth redirects, bindings and secrets. Preview success does not prove production configuration.
