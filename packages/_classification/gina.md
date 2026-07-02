---
layout: page
title: Gina
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

# Package Classification: gina

* **Name**: `gina`
* **Package Name (package.json)**: `qios_v1`
* **Version**: `1.0.0`
* **Private**: No (points to `index.js`)

## Classification
* **Status**: Legacy / Archive candidate
* **Safe to Move**: Keep in place for now. Once we verify no active workflows or package imports depend on it, it can be safely archived.

## Technical Scope
* **Supabase**: Yes, references `@supabase/supabase-js` inside `package.json` and configures client credentials.
* **Cloudflare Workers**: Yes, contains Wrangler configuration and code for a Cloudflare Worker orchestrator (`gina-orchestrator`).
* **Database**: Yes, references and queries database endpoints.
* **Email**: No.
* **Frontend Code**: Yes, contains multiple React + Vite setups (`lina-lumara-ai` and `qios-launcher`).

## Inferred Purpose
This folder is the codebase for the Lina/Gina agent widget, desktop launcher interface, and Cloudflare Worker control plane. It includes demo applications, rule engines, resource graph nodes, mind maps, and interactive scripts.

## Scripts
* Root (`qios_v1`): `"test": "echo \"Error: no test specified\" && exit 1"`
* `frontend/` (`lina-lumara-ai`): `"dev": "vite"`, `"build": "vite build"`, `"preview": "vite preview"`
* `src/launcher/` (`qios-launcher`): `"dev": "vite"`, `"build": "vite build"`, `"preview": "vite preview"`
* `workers/orchestrator/` (`gina-orchestrator`): `"deploy": "wrangler deploy"`, `"dev": "wrangler dev"`

## Recommendations & Notes
* Mark for future archive. If no active apps import code from here, it should be relocated to `packages/_archive/gina_legacy/`.
* Audit the root `.env` file to ensure no sensitive credentials or keys are exposed.
