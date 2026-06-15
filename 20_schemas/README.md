# QiSystem Source Schemas

This folder contains QiSystem-wide schema source material, reference CSVs, legacy schema drafts, system catalogs, field definitions, and external system mappings.

This is not the runnable Supabase SQL folder.

Use this folder for:

* CSV source models
* old schema drafts
* system catalogs
* import/export references
* field and layout definitions
* external system mappings

Do not run SQL directly from here unless it has been reviewed and promoted into:

`50_data/supabase/qisupabase/sql/`

Folder meanings:

* `reference_csv/` — CSV source models and system catalogs
* `drafts_sql/` — old or experimental SQL that must be reviewed before use
* `external_systems/` — provider-specific mapping references such as Firefly, Cash App, Chase, National
* `_archive/` — inactive historical material
