---
layout: page
title: Platform Default Schemas
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

# Supabase Platform Schemas

These schemas are created or managed by Supabase/Postgres and should be treated as platform infrastructure.

Do not place QiSystem domain tables here.

## Platform Schemas

| Schema           | Purpose                                                   |
| ---------------- | --------------------------------------------------------- |
| `auth`           | Supabase users, identities, sessions, auth metadata       |
| `extensions`     | PostgreSQL extensions                                     |
| `graphql`        | Supabase/Postgres GraphQL internals                       |
| `graphql_public` | Public GraphQL exposure layer                             |
| `pgbouncer`      | Connection pooling                                        |
| `public`         | Default Postgres schema; avoid for QiSystem domain tables |
| `realtime`       | Supabase realtime support                                 |
| `storage`        | Supabase storage buckets and objects                      |
| `vault`          | Supabase secrets/vault support                            |

## Rule

QiSystem-owned domain tables should live in Qi-owned schemas, starting with:

`qisystem`

Do not casually build in `public`.
