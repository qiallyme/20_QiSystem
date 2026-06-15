insert into qisystem.libraries (name, description) values
  ('Tasks', 'Actionable items'),
  ('Transactions', 'Financial activity normalized from imported sources'),
  ('Care Log', 'Medical, caregiving, and support events'),
  ('Documents', 'Files, records, scans, PDFs, and source documents'),
  ('People', 'Contacts, individuals, providers, family, support network'),
  ('Projects', 'Major work containers and active efforts'),
  ('System Log', 'Operational system notes, imports, migrations, and decisions')
on conflict (name) do nothing;
