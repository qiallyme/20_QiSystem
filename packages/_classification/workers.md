---
layout: page
title: Workers
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

# Package Classification: workers

* **Name**: `workers`
* **Package Name (package.json)**: None (No `package.json` file present)
* **Version**: N/A
* **Private**: N/A

## Classification
* **Status**: Review / Keep
* **Safe to Move**: Keep in place.

## Technical Scope
* **Supabase**: No.
* **Cloudflare Workers**: No.
* **Database**: No.
* **Email**: No.
* **Frontend Code**: No.

## Inferred Purpose
TypeScript worker scripts (`constitution.ts`, `heartbeat.ts`, `ignore.ts`) likely executed by automation loops, cron jobs, or repository status checkers.
* `heartbeat.ts`: Handles worker process health validation.
* `constitution.ts`: Ensures workspace compliance rules.
* `ignore.ts`: Handles file exclusion and repository index exclusions.

## Scripts
* None

## Recommendations & Notes
* Check if these files are active triggers under any Github action or cron schedulers.
* Keep in place as system scripts.
