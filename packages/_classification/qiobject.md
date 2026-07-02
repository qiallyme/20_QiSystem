---
layout: page
title: Qiobject
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

# Package Classification: qiobject

* **Name**: `qiobject`
* **Package Name (package.json)**: None (No `package.json` file present)
* **Version**: N/A
* **Private**: N/A

## Classification
* **Status**: Labs / Reference
* **Safe to Move**: Should stay in place.

## Technical Scope
* **Supabase**: Yes, contains direct SQL schemas and inserts (`energy/`, `rides/`).
* **Cloudflare Workers**: Yes, contains a Cloudflare Worker configuration (`rides/worker/wrangler.toml`).
* **Database**: Yes, contains raw SQL creation and seeding scripts.
* **Email**: No.
* **Frontend Code**: Yes, contains web layouts/apps (`contacts/index.html`, `energy/index.html`, `rides/web/index.html`).

## Inferred Purpose
Domain-specific mini-systems and prototype databases grouped together:
* `contacts/`: Flat HTML contacts manager and raw CSV exports.
* `energy/`: Utilities, bill parsing scripts, lint settings, and SQL queries (`insert_bills.sql`, `update_bills_schema.sql`).
* `rides/`: Rideshare logging application with web dashboard, wrangler worker, and creation SQL (`database.sql`).

## Scripts
* None in root.

## Recommendations & Notes
* The SQL scripts inside `energy/` and `rides/` must be thoroughly reviewed and parsed before executing on the central Supabase database.
* Keep in place as a valuable functional reference.
