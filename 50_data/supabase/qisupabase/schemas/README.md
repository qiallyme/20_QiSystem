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

# Supabase Schema Documentation

This folder documents the database schemas used inside the QiSystem Supabase project.

This is documentation and data dictionary space, not the runnable SQL execution folder.

Runnable SQL belongs in:

`../sql/`

Versioned deployment migrations belong in:

`../migrations/`

Current Supabase platform schemas include:

* `auth`
* `extensions`
* `graphql`
* `graphql_public`
* `pgbouncer`
* `public`
* `realtime`
* `storage`
* `vault`

QiSystem-owned or reserved schemas:

* `qisystem` — active flexible life data layer
* `qifinance` — reserved for future strict finance tables
* `qicare` — reserved for future strict care/medical tables
* `qiprojects` — reserved for future strict project tables
