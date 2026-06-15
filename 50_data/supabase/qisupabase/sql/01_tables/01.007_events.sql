create table if not exists qisystem.events (
  id uuid primary key default gen_random_uuid(),

  event_type text not null,
  occurred_at timestamptz not null default now(),

  metadata jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now()
);
