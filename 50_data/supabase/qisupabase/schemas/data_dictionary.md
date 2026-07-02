---
layout: page
title: Data Dictionary
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

# Supabase Data Dictionary

## Active flexible model

### `qisystem.libraries`

User-facing record buckets.

Examples:

* Tasks
* Transactions
* Care Log
* Documents
* People
* Projects
* System Log

### `qisystem.records`

Primary flexible record table.

Important columns:

* `library_id`
* `title`
* `module`
* `record_type`
* `data`
* `created_at`
* `updated_at`

### `qisystem.record_links`

Relationships between records.

Examples:

* receipt -> transaction
* care log -> person
* task -> project
* document -> legal matter

### `qisystem.tags`

Canonical reusable tags.

### `qisystem.record_tags`

Many-to-many relationship between records and tags.

### `qisystem.attachments`

File/document attachment metadata.

### `qisystem.events`

Timeline/activity ledger.

### `qisystem.event_links`

Connects events to records.

### `qisystem.transaction_rules`

Rules for merchant cleanup, category assignment, and tagging.

### `qisystem.staging_firefly_transactions`

Raw Firefly import staging table.

## Transaction normalized JSON shape

Inside `qisystem.records.data`:

```json
{
  "source": "firefly",
  "raw": {},
  "normalized": {
    "amount": 0,
    "signed_amount": 0,
    "direction": "inflow|outflow",
    "account": "",
    "counterparty": "",
    "merchant": "",
    "timestamp": "",
    "description": "",
    "external_id": ""
  },
  "enriched": {
    "category": "",
    "tags": [],
    "confidence": 0,
    "rule_id": ""
  }
}
```
