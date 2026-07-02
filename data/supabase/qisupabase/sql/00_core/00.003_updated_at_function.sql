-- Shared helper for timestamp maintenance.

create or replace function qisystem.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;
