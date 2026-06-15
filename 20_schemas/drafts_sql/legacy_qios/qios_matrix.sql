create table if not exists qios_matrix (
  id text primary key,
  name text not null,
  type text not null,
  governs text[],
  depends_on text[],
  touched_by text[],
  produces text[],
  realm_effect text not null,
  created_at timestamp default now()
);

