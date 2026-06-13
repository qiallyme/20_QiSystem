-- QID Auto-population RPC
-- Layer: 5 Metadata (MTA.010)
-- Purpose: Single source of truth for QID generation across all tables and files
-- Contract: Returns bigint (monotonic sequence counter)
-- Platform: Supabase (PostgreSQL)
--
-- Note: QID is a global monotonic sequence (bigint), not UUID.
-- The qid_counter table and claim_qid() function are defined in qios_brain_db_v1_1_patch.sql
--
-- This function is an alias/wrapper for claim_qid() to maintain consistent naming.
-- Returns text (cast from bigint) to match node.qid column type.

create or replace function qios_next_qid()
returns text
language plpgsql
as $$
begin
  return claim_qid()::text;
end;
$$;

comment on function qios_next_qid() is 'Generates next QID (Qios ID) for canonical nodes. Returns bigint counter value as text. Wrapper for claim_qid() to maintain consistent naming.';

-- Example usage:
-- select qios_next_qid(); -- Returns new QID as text
-- update node set qid = qios_next_qid() where qid is null;

