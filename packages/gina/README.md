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

# Lina · Lumara Navigator

This repo hosts the **Lina – Lumara Navigator** demo:

- `index.html` – main landing page
- `lina-widget.html` – iframe-friendly widget for embedding
- `assets/js/lina-api-client.js` – shared API client
- `assets/js/lina-widget.js` – floating chat bubble widget
- `assets/js/lina-widget-drop.js` – one-line embed loader
- `functions/api/lina-chat.js` – Cloudflare Pages Function API (stubbed, ready for RAG/OpenAI)
- `lumara-lina-demo/` – prompts, branding, and a richer demo page

Designed to deploy on **Cloudflare Pages + Functions** and be embeddable on other sites.
