-- QiSystem Supabase namespaces.
-- Supabase default schemas like auth, storage, realtime, vault, graphql, pgbouncer,
-- extensions, and public are platform-owned. Do not build Qi domain tables there.

create schema if not exists qisystem;

-- Reserved future domain schemas. No domain tables are created here yet.
-- Use these later only when a domain has enough structure to justify it.
create schema if not exists qifinance;
create schema if not exists qicare;
create schema if not exists qiprojects;
