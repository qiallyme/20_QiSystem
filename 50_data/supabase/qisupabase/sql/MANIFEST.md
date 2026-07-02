---
layout: page
title: Manifest
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

# Manifest

## 00_core
- `00.001_create_schemas.sql` — creates Qi schemas/reserved namespaces.
- `00.002_extensions.sql` — enables Postgres extensions.
- `00.003_updated_at_function.sql` — helper function for automatic `updated_at`.

## 01_tables
- `01.001_libraries.sql`
- `01.002_records.sql`
- `01.003_record_links.sql`
- `01.004_tags.sql`
- `01.005_record_tags.sql`
- `01.006_attachments.sql`
- `01.007_events.sql`
- `01.008_event_links.sql`
- `01.009_records_updated_at_trigger.sql`

## 02_indexes
- `02.001_core_indexes.sql`

## 03_seed
- `03.001_libraries_seed.sql`

## 04_rules
- `04.001_transaction_rules.sql`
- `04.002_seed_transaction_rules.sql`
- `04.003_apply_transaction_rules.sql`

## 05_pipeline
- `05.001_transaction_normalization_contract.sql`
- `05.002_firefly_staging.sql`
- `05.003_firefly_transform.sql`

## 99_verify
- `99.001_smoke_tests.sql`
