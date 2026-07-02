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

# QiSystem Core Database and Schemas

This repository represents the central schema definition, data pipelines, and database management system for **QiSystem**. It coordinates system-wide source models, database migrations, security policies, automated data processing pipelines, and local Supabase development.

## Project Architecture

The repository is structured around a central database-first and schema-first workflow:

```text
20_QiSystem/
├── 10_standards/          # System-wide standards, naming conventions, and coding guidelines
├── 20_schemas/            # Source models, CSV dictionaries, SQL drafts, and external integrations
├── 30_security/           # Row-level security rules, encryption guidelines, and SSL configs
├── 40_automation/         # Ingestion runners, automated schema checkers, and task scripts
├── 50_data/               # Supabase environment, connection mappings, migrations, and SQL code
│   └── supabase/
│       └── qisupabase/    # Local Supabase dev environment configurations
├── 60_quality/            # Database validation, smoke tests, and lint rules
├── 70_lifecycle/          # Retention policies, backup systems, and archival procedures
├── META/                  # Project level metadata
└── packages/              # Internal modules (database adapter, AI integrations, email, etc.)
```

## Directory Overview

### 1. `10_standards/`
Contains the conventions for naming tables, columns, indexes, functions, triggers, and Row Level Security guidelines. Ensure all SQL contributions adhere to these specifications.

### 2. `20_schemas/`
The source catalog for QiSystem models.
* Use this for reference data, CSV schemas, third-party integration layouts (e.g. Firefly, Chase, Cash App), and conceptual system designs.
* Do **not** store runnable target execution SQL files here.

### 3. `50_data/`
Contains the actual runnable database execution layers.
* **Supabase (`50_data/supabase/qisupabase/`)**: The core database platform configuration.
* **SQL Scripts (`50_data/supabase/qisupabase/sql/`)**: Ordered runnable scripts for setting up schemas, tables, views, rules, and seed data locally.
* **Migrations (`50_data/supabase/qisupabase/migrations/`)**: Tracked schemas promoted for staging and production deployments.

### 4. `packages/`
Internal microservices and adapters:
* `packages/database/`: Shared database adapter for connecting applications to PostgreSQL/Supabase.
* `packages/gina/`: Core AI agent orchestration and tool services.
* `packages/qinode/`: Engine integration layer.

---

## Quick Start (Local Database Setup)

1. **Verify Prerequisites**:
   * Install the Supabase CLI: `npm install -g supabase` (or equivalent package manager).
   * Docker must be installed and running.

2. **Initialize Environment**:
   * Copy `50_data/supabase/.env.example` to `50_data/supabase/.env`.
   * Configure environment secrets for local and testing runtimes.

3. **Start Supabase**:
   * Navigate to `50_data/supabase/` and run:
     ```bash
     supabase start
     ```

4. **Initialize Database Structure**:
   * Run the SQL scripts under `50_data/supabase/qisupabase/sql/` in the order documented in `50_data/supabase/qisupabase/sql/README_RUN_ORDER.md`.