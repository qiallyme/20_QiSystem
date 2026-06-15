create table if not exists qisystem.record_tags (
  record_id uuid
    references qisystem.records(id)
    on delete cascade,

  tag_id uuid
    references qisystem.tags(id)
    on delete cascade,

  created_at timestamptz not null default now(),

  primary key (record_id, tag_id)
);
