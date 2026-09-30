# Supabase

**Status:** REFERENCE

Common roles: PostgreSQL, authentication, storage and persistence.

Keep authorization boundaries explicit; treat client input as untrusted; keep private storage private; validate migrations; separate environment configuration from committed source.

OAuth redirect URIs are exact configuration. Preview and production URLs may both be needed. Verify rather than guessing.

Never commit service-role keys, tokens, passwords or private credentials.
