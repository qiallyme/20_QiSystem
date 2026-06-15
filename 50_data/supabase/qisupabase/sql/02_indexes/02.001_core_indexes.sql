create index if not exists idx_records_library
  on qisystem.records(library_id);

create index if not exists idx_records_module
  on qisystem.records(module);

create index if not exists idx_records_record_type
  on qisystem.records(record_type);

create index if not exists idx_records_module_type
  on qisystem.records(module, record_type);

create index if not exists idx_records_created_at
  on qisystem.records(created_at);

create index if not exists idx_records_data
  on qisystem.records using gin(data);

create index if not exists idx_links_from
  on qisystem.record_links(from_record_id);

create index if not exists idx_links_to
  on qisystem.record_links(to_record_id);

create index if not exists idx_events_type
  on qisystem.events(event_type);

create index if not exists idx_events_occurred_at
  on qisystem.events(occurred_at);
