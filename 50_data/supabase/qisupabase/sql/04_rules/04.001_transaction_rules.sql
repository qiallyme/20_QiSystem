create table if not exists qisystem.transaction_rules (
  id uuid primary key default gen_random_uuid(),

  rule_name text not null,

  enabled boolean not null default true,
  priority integer not null default 100,

  -- What field inside normalized transaction data should be matched?
  -- description is the safest default.
  match_field text not null default 'description'
    check (match_field in ('description', 'counterparty', 'merchant', 'account')),

  -- contains = ILIKE %value%
  -- equals   = case-insensitive exact match
  -- regex    = Postgres case-insensitive regex match
  match_type text not null default 'contains'
    check (match_type in ('contains', 'equals', 'regex')),

  match_value text not null,

  merchant text,
  category text,
  tags text[] not null default array[]::text[],

  metadata jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

drop trigger if exists trg_transaction_rules_set_updated_at on qisystem.transaction_rules;

create trigger trg_transaction_rules_set_updated_at
before update on qisystem.transaction_rules
for each row
execute function qisystem.set_updated_at();
