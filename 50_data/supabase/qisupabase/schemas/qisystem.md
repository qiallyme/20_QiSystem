# `qisystem` Schema

Status: Active

Purpose:
The `qisystem` schema is the active flexible life-data layer.

It stores libraries, records, relationships, tags, attachments, events, rules, staging imports, and normalized records before domains are promoted into stricter schemas.

Core idea:

Record = thing
Event = what happened
Library = user-facing bucket
Rule = normalization/enrichment logic
Pipeline = import transformation path

Current core tables:

* `qisystem.libraries`
* `qisystem.records`
* `qisystem.record_links`
* `qisystem.tags`
* `qisystem.record_tags`
* `qisystem.attachments`
* `qisystem.events`
* `qisystem.event_links`
* `qisystem.transaction_rules`
* `qisystem.staging_firefly_transactions`

Finance data currently enters through:

* `qisystem.staging_firefly_transactions`
* `qisystem.records` with `module = 'finance'` and `record_type = 'transaction'`

Future extraction:
Finance may later move into `qifinance` once strict accounting tables are justified.
