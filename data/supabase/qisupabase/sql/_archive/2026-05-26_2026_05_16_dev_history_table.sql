-- Dev History Table
-- Purpose: Store structured development session history for QiLabs/QiAccess/QiOne work.
-- Recommended schema version: 1.0

create table if not exists public.dev_history (
  id uuid primary key default gen_random_uuid(),

  owner_id uuid references auth.users(id) on delete set null,

  session_id text unique,
  record_type text not null default 'dev_session',
  schema_version text not null default '1.0',

  session_date date not null default current_date,
  title text not null,
  project text,
  repo text,
  branch text,
  feature_area text,
  status text not null default 'draft',

  summary text,
  purpose text,
  context text,
  decisions jsonb not null default '[]'::jsonb,
  files_affected jsonb not null default '[]'::jsonb,
  database_notes jsonb not null default '[]'::jsonb,
  implementation_plan jsonb not null default '[]'::jsonb,
  risks jsonb not null default '[]'::jsonb,
  validation_checklist jsonb not null default '[]'::jsonb,
  next_actions jsonb not null default '[]'::jsonb,

  restart_prompt text,
  markdown_body text,

  tags text[] not null default '{}',
  related_files text[] not null default '{}',
  related_tables text[] not null default '{}',
  related_tools text[] not null default '{}',

  source text not null default 'manual',
  created_by text,
  metadata jsonb not null default '{}'::jsonb,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.dev_history enable row level security;

create policy if not exists "dev_history_select_own"
on public.dev_history
for select
to authenticated
using (owner_id = auth.uid() or owner_id is null);

create policy if not exists "dev_history_insert_own"
on public.dev_history
for insert
to authenticated
with check (owner_id = auth.uid() or owner_id is null);

create policy if not exists "dev_history_update_own"
on public.dev_history
for update
to authenticated
using (owner_id = auth.uid() or owner_id is null)
with check (owner_id = auth.uid() or owner_id is null);

create policy if not exists "dev_history_delete_own"
on public.dev_history
for delete
to authenticated
using (owner_id = auth.uid() or owner_id is null);

create index if not exists idx_dev_history_session_date
on public.dev_history (session_date desc);

create index if not exists idx_dev_history_project
on public.dev_history (project);

create index if not exists idx_dev_history_feature_area
on public.dev_history (feature_area);

create index if not exists idx_dev_history_status
on public.dev_history (status);

create index if not exists idx_dev_history_tags
on public.dev_history using gin (tags);

create index if not exists idx_dev_history_decisions
on public.dev_history using gin (decisions);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_dev_history_updated_at on public.dev_history;

create trigger trg_dev_history_updated_at
before update on public.dev_history
for each row
execute function public.set_updated_at();
