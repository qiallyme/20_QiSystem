-- Staging table for Firefly CSV imports.
-- Import CSV here first; do not import directly into qisystem.records.

create table if not exists qisystem.staging_firefly_transactions (
  id text,
  date text,
  description text,
  amount text,
  type text,
  account_name text,
  category_name text,
  notes text,
  tags text,

  imported_at timestamptz not null default now()
);
