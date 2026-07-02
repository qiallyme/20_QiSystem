---
layout: page
title: Config
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

# Package Classification: config

* **Name**: `config`
* **Package Name (package.json)**: `@qi/config`
* **Version**: `1.0.0`
* **Private**: Yes

## Classification
* **Status**: Active / Keep
* **Safe to Move**: No. It must stay in place.

## Technical Scope
* **Supabase**: No.
* **Cloudflare Workers**: No.
* **Database**: No.
* **Email**: No.
* **Frontend Code**: No.

## Inferred Purpose
Acts as the central configuration repository for the monorepo workspace. It houses shared settings for ESLint, Prettier, TypeScript compiler options, and repository rule definitions (such as JSON/YAML validation).

## Scripts
* None

## Recommendations & Notes
* This package is referenced by relative configuration paths across the codebase (e.g. ESLint extends `@qi/config`).
* Do not move or rename this directory.
