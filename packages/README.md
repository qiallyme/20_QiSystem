# QiSystem Packages

This folder contains code packages, shared tooling, worker prototypes, legacy app packages, and experimental utilities.

This is not the active Supabase database folder.

The active Supabase project lives at:

`../50_data/supabase/qisupabase/`

## Package Status

| Package     | Status                     | Notes                                                                                 |
| ----------- | -------------------------- | ------------------------------------------------------------------------------------- |
| `config`    | Active / Keep              | Shared linting, formatting, TypeScript, YAML, JSON, and repo rules                    |
| `ai`        | Review / Possible active   | AI worker or semantic router prototype                                                |
| `database`  | Legacy reference           | Old package-level database migrations and TS schemas; not the current Supabase source |
| `email`     | Review / Keep              | Email and Supabase auth templates                                                     |
| `gina`      | Legacy / Archive candidate | Old Lina/Gina app prototype and business-era material                                 |
| `qinode`    | Labs / Prototype           | Node/graph/Rust/Obsidian-style experiment                                             |
| `qiobject`  | Labs / Reference           | Object-specific mini systems such as contacts, energy, rides                          |
| `qitax-cli` | Labs / Tooling             | Tax CLI utility                                                                       |
| `workers`   | Review / Keep              | Worker utilities such as heartbeat/constitution/ignore                                |

## Rules

* Do not delete packages without review.
* Do not move package folders until workspace references are checked.
* Do not use `packages/database` as the active Supabase migration source.
* Promote only reviewed SQL into `50_data/supabase/qisupabase/sql/`.
* Archive legacy prototypes only after confirming no active imports or scripts depend on them.
