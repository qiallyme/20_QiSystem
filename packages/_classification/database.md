# Package Classification: database

* **Name**: `database`
* **Package Name (package.json)**: `@qione/database`
* **Version**: `1.0.0`
* **Private**: No (has main and types pointing to `./src/index.ts`)

## Classification
* **Status**: Legacy reference / review needed
* **Safe to Move**: Should stay in place for now.

## Technical Scope
* **Supabase**: Yes, contains legacy migrations and Supabase adapters.
* **Cloudflare Workers**: No.
* **Database**: Yes, contains SQL migrations and schema files.
* **Email**: No.
* **Frontend Code**: No.

## Inferred Purpose
This package acts as an older, package-level database schema definition and adapter. It contains Prisma-style migrations (e.g. `0001_qione_core.sql` through `0015_registry_namespace_bands.sql`) and TypeScript models for database schemas. 

It is **not** the active Supabase project. The active project source of truth resides in `50_data/supabase/qisupabase/`.

## Scripts
* `"lint": "eslint ."`

## Recommendations & Notes
* Do **not** deploy or run SQL directly from this directory.
* Review the legacy SQL scripts (under `src/migrations/`) to identify if any schemas or structure need to be preserved or extracted.
* If any useful SQL needs to be saved, it should be moved to `20_schemas/drafts_sql/legacy_database_package/` or promoted to `50_data/supabase/qisupabase/sql/` after thorough review.
