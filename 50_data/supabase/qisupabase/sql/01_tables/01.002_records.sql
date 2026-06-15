create table if not exists qisystem.records (
  id uuid primary key default gen_random_uuid(),

  library_id uuid not null
    references qisystem.libraries(id)
    on delete cascade,

  title text,
  module text,
  record_type text,

  data jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
