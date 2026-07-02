---
layout: page
title: Qifinance Reserved
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

# `qifinance` Reserved Schema

Status: Reserved / Future

Purpose:
The `qifinance` schema is reserved for strict financial tables once the finance domain requires enforcement beyond flexible records.

Do not build this prematurely.

Candidate future tables:

* `qifinance.accounts`
* `qifinance.transactions`
* `qifinance.categories`
* `qifinance.merchants`
* `qifinance.receipts`
* `qifinance.reconciliations`
* `qifinance.transaction_splits`

Promotion rule:
Only promote from `qisystem.records` to `qifinance` after enough imported data exists to prove the stable field structure.
