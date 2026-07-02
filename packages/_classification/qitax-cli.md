---
layout: page
title: Qitax Cli
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

# Package Classification: qitax-cli

* **Name**: `qitax-cli`
* **Package Name (package.json)**: None (No `package.json` file present)
* **Version**: N/A
* **Private**: N/A

## Classification
* **Status**: Labs / Tooling
* **Safe to Move**: Safe to move or stay in place for now.

## Technical Scope
* **Supabase**: No direct links.
* **Cloudflare Workers**: No.
* **Database**: Yes, references python-based storage adapters.
* **Email**: No.
* **Frontend Code**: No.

## Inferred Purpose
A standalone Python-based command-line tool (utility modules: `service.py`, `storage.py`, `__main__.py`) for managing tax filings and records processing inside the `@qione/qitax` workflow.

## Scripts
* None

## Recommendations & Notes
* Audited as a standalone python utility.
* Safe to maintain as-is or transition to an automation script area if no other system builds depend on it.
