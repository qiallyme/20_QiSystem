---
layout: page
title: Ai
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

# Package Classification: ai

* **Name**: `ai`
* **Package Name (package.json)**: `@qione/ai`
* **Version**: `0.1.0`
* **Private**: Yes

## Classification
* **Status**: Review / Possible active
* **Safe to Move**: Should stay in place for now until import dependencies are audited.

## Technical Scope
* **Supabase**: No direct references, but handles ingestion classification.
* **Cloudflare Workers**: No.
* **Database**: No.
* **Email**: No.
* **Frontend Code**: No.

## Inferred Purpose
Internal AI capabilities, prompt engineering templates, text classification algorithms, and semantic embedding functions to support automated record categorization (e.g., classifying Firefly or Chase transaction descriptions). It coordinates with the `@qi/gina` agent runtime.

## Scripts
* None

## Recommendations & Notes
* Check which packages or pipelines import `@qione/ai`.
* Keep as a potential active package. Do not modify or move.
