create table if not exists qisystem.event_links (
  event_id uuid
    references qisystem.events(id)
    on delete cascade,

  record_id uuid
    references qisystem.records(id)
    on delete cascade,

  role text not null default 'related',

  primary key (event_id, record_id, role)
);
