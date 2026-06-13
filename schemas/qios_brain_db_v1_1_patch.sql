-- QiOS Brain DB Patch v1.1
-- Adds worker_status, system_event, qid_counter, error_registry hooks.
-- Run after your v1 schema.

-- 1) System event table (observability vocabulary)
create table if not exists public.system_event (
  id uuid primary key default gen_random_uuid(),
  event_code text unique not null,        -- e.g. WKR.QUEUE_STALL, AUTH.MISSING_KEY
  severity text not null default 'info',   -- info|warn|error|critical
  description text not null,              -- human-readable meaning
  suggested_fix text,                     -- optional human fix guidance
  created_at timestamptz default now()
);

-- 2) Worker status table (live health)
create table if not exists public.worker_status (
  id uuid primary key default gen_random_uuid(),
  worker_id text unique not null,        -- stable slug, e.g. orchestrator, ingestion, linter
  name text not null,
  layer int,                              -- 0-7 if tied to linter layer
  state text not null default 'gray',     -- green|orange|red|gray
  last_heartbeat timestamptz,
  last_run_at timestamptz,
  last_success_at timestamptz,
  queue_depth int default 0,
  depends_on text[] default '{}',         -- worker_id dependencies
  last_error_code text,                  -- foreign-key-ish to system_event.event_code
  last_error_message text,
  meta jsonb default '{}'::jsonb,
  updated_at timestamptz default now(),
  created_at timestamptz default now()
);

create index if not exists worker_status_state_idx on public.worker_status(state);
create index if not exists worker_status_layer_idx on public.worker_status(layer);

-- 3) QID counter (if you haven't added already)
create table if not exists public.qid_counter (
  id boolean primary key default true,
  next_qid bigint not null,
  updated_at timestamptz default now()
);

insert into public.qid_counter (id, next_qid)
values (true, 1)
on conflict (id) do nothing;

create or replace function public.claim_qid()
returns bigint
language plpgsql
as $$
declare
  claimed bigint;
begin
  update public.qid_counter
  set next_qid = next_qid + 1,
      updated_at = now()
  where id = true
  returning next_qid - 1 into claimed;

  return claimed;
end;
$$;

-- 4) Optional: enforce that node.qid is unique if present
-- (already unique by column, but this ensures no empty-string collisions)
create unique index if not exists node_qid_unique_nonnull
on public.node(qid)
where qid is not null and qid <> '';

