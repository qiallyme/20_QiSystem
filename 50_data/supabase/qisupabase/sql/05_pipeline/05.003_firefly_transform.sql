-- Transform Firefly staging rows into normalized QiSystem records.
-- Preserves raw source data and prevents duplicate imports by external_id.

insert into qisystem.records (
  library_id,
  title,
  module,
  record_type,
  data
)
select
  l.id as library_id,

  coalesce(nullif(s.description, ''), 'Firefly transaction') as title,

  'finance' as module,
  'transaction' as record_type,

  jsonb_build_object(
    'source', 'firefly',

    'raw', jsonb_build_object(
      'id', s.id,
      'date', s.date,
      'description', s.description,
      'amount', s.amount,
      'type', s.type,
      'account_name', s.account_name,
      'category_name', s.category_name,
      'notes', s.notes,
      'tags', s.tags
    ),

    'normalized', jsonb_build_object(
      'amount', abs(nullif(regexp_replace(coalesce(s.amount, ''), '[^0-9\.\-]', '', 'g'), '')::numeric),
      'signed_amount', nullif(regexp_replace(coalesce(s.amount, ''), '[^0-9\.\-]', '', 'g'), '')::numeric,
      'direction',
        case
          when nullif(regexp_replace(coalesce(s.amount, ''), '[^0-9\.\-]', '', 'g'), '')::numeric < 0
            then 'outflow'
          else 'inflow'
        end,
      'account', s.account_name,
      'counterparty', s.description,
      'merchant', null,
      'timestamp', nullif(s.date, '')::timestamptz,
      'description', s.description,
      'external_id', s.id
    ),

    'enriched', jsonb_build_object(
      'category', s.category_name,
      'tags',
        coalesce(
          (
            select jsonb_agg(trim(tag_value))
            from unnest(string_to_array(coalesce(s.tags, ''), ',')) as tag_value
            where trim(tag_value) <> ''
          ),
          '[]'::jsonb
        ),
      'confidence', 1.0
    )
  ) as data

from qisystem.staging_firefly_transactions s
join qisystem.libraries l
  on l.name = 'Transactions'
where nullif(regexp_replace(coalesce(s.amount, ''), '[^0-9\.\-]', '', 'g'), '') is not null
  and not exists (
    select 1
    from qisystem.records r
    where r.module = 'finance'
      and r.record_type = 'transaction'
      and r.data->>'source' = 'firefly'
      and r.data->'normalized'->>'external_id' = s.id
  );
