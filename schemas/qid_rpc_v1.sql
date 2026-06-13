-- QiOS Brain DB: QID generator v1
-- Contract: single source of truth for immutable node IDs.

-- Extension for UUID generation
create extension if not exists pgcrypto;

-- QID minting function
create or replace function qios_next_qid()
returns uuid
language sql
as $$
  select gen_random_uuid();
$$;

comment on function qios_next_qid() is
'QiOS v1: mint a new immutable QID. All workers and UIs must use this.';

