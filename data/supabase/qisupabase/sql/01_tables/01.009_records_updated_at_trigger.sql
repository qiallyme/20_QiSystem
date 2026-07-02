drop trigger if exists trg_records_set_updated_at on qisystem.records;

create trigger trg_records_set_updated_at
before update on qisystem.records
for each row
execute function qisystem.set_updated_at();
