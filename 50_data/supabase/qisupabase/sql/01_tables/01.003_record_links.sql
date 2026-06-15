create table if not exists qisystem.record_links (
  id uuid primary key default gen_random_uuid(),

  from_record_id uuid
    references qisystem.records(id)
    on delete cascade,

  to_record_id uuid
    references qisystem.records(id)
    on delete cascade,

  relationship_type text not null,
  metadata jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now(),

  constraint record_links_no_self_link
    check (from_record_id is null or to_record_id is null or from_record_id <> to_record_id)
);
