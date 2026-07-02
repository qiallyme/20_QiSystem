create table if not exists qisystem.attachments (
  id uuid primary key default gen_random_uuid(),

  record_id uuid
    references qisystem.records(id)
    on delete cascade,

  storage_bucket text,
  file_path text,
  file_name text,
  mime_type text,

  metadata jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now()
);
