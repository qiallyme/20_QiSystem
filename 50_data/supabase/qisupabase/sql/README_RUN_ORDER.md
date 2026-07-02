---
layout: page
title: Readme Run Order
slug: ""
summary: ""
status: active
created_at: ""
updated_at: ""
author: ""
owner: ""
tags: []
keywords: []
aliases: []
context: ""
sensitivity: internal
classification: business_internal
realm_label: ""
uid: ""
canonical_ref: ""
source_type: manual
template_key: master-template
---

# QiSystem Supabase SQL Bundle v2

Drop this `sql/` folder into:

`C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\`

## Run order in Supabase SQL Editor

1. `sql/00_core/00.001_create_schemas.sql`
2. `sql/00_core/00.002_extensions.sql`
3. `sql/00_core/00.003_updated_at_function.sql`
4. `sql/01_tables/*` in numeric order
5. `sql/02_indexes/02.001_core_indexes.sql`
6. `sql/03_seed/03.001_libraries_seed.sql`
7. `sql/04_rules/04.001_transaction_rules.sql`
8. `sql/04_rules/04.002_seed_transaction_rules.sql`
9. `sql/05_pipeline/05.001_transaction_normalization_contract.sql`
10. `sql/05_pipeline/05.002_firefly_staging.sql`

Then import your Firefly CSV into `qisystem.staging_firefly_transactions`.

After CSV import, run:

11. `sql/05_pipeline/05.003_firefly_transform.sql`
12. `sql/04_rules/04.003_apply_transaction_rules.sql`
13. Optional verification: `sql/99_verify/99.001_smoke_tests.sql`

## Folder rule

- `sql/` = runnable SQL scripts
- `schemas/` = reference specs, CSV definitions, legacy drafts, and source models
- `migrations/` = versioned deployment migrations only after SQL is proven stable
- `policies/` = Row Level Security and access policies later
- `functions/` = Supabase Edge Functions
