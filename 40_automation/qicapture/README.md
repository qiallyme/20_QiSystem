---
layout: page
title: Readme
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

# QiCapture

QiCapture is the intake and normalization layer for messy source files before they reach Supabase.

Raw exports, legacy CSV sheets, finance exports, care records, legal registers, and other source files should start here.

Supabase should only receive cleaned, normalized, ready-for-load import batches.

Flow:
source file -> raw intake -> profile -> map -> clean -> normalize -> ready_for_supabase -> Supabase imports -> staging -> canonical records

Folder meanings:

* `intake/00_raw/` — copied raw source files; do not edit
* `intake/01_profiled/` — column profiles, row counts, quality notes
* `intake/02_mapped/` — source-column to target-field mapping files
* `intake/03_cleaned/` — cleaned but not yet canonical files
* `intake/04_normalized/` — canonical normalized CSVs
* `intake/05_ready_for_supabase/` — final import batches
* `intake/06_loaded/` — records of loaded batches
* `intake/_quarantine/` — broken, duplicate, suspicious, or unclear files
* `manifests/` — import tracking manifests
* `mappings/` — reusable mapping specs
* `scripts/` — profiling/cleaning/normalization scripts
* `logs/` — process logs
