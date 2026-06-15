# Supabase Imports

This folder receives only prepared import batches from QiCapture.

Do not place chaotic raw exports here.

Raw source data starts in:

`../../../40_automation/qicapture/intake/00_raw/`

Prepared files arrive here after profiling, cleaning, merging, and normalization.

Folder meanings:

* `ready_for_load/` — prepared files ready to import into Supabase staging tables
* `loaded/` — batches already loaded or archived after import
* `logs/` — import logs, receipts, row counts, and verification notes
