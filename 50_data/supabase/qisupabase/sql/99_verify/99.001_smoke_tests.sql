-- Basic verification queries after setup/import.

select 'schemas' as check_type, schema_name
from information_schema.schemata
where schema_name in ('qisystem', 'qifinance', 'qicare', 'qiprojects')
order by schema_name;

select 'libraries' as check_type, name, description
from qisystem.libraries
order by name;

select 'finance_records_sample' as check_type, title, data->'normalized' as normalized
from qisystem.records
where module = 'finance'
  and record_type = 'transaction'
limit 20;

select 'rules' as check_type, rule_name, match_type, match_value, merchant, category, tags
from qisystem.transaction_rules
order by priority, rule_name;
