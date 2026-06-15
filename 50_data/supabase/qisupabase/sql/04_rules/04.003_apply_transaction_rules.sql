-- Applies the highest-priority matching transaction rule to each finance transaction.
-- Re-run after importing a new CSV or adding/editing rules.

with matches as (
  select
    r.id as record_id,
    tr.id as rule_id,
    tr.merchant,
    tr.category,
    tr.tags,
    row_number() over (
      partition by r.id
      order by tr.priority asc, tr.created_at asc
    ) as rn
  from qisystem.records r
  join qisystem.transaction_rules tr
    on tr.enabled = true
   and (
      case tr.match_field
        when 'description' then coalesce(r.data->'normalized'->>'description', '')
        when 'counterparty' then coalesce(r.data->'normalized'->>'counterparty', '')
        when 'merchant' then coalesce(r.data->'normalized'->>'merchant', '')
        when 'account' then coalesce(r.data->'normalized'->>'account', '')
      end
    ) is not null
   and (
      (
        tr.match_type = 'contains'
        and (
          case tr.match_field
            when 'description' then coalesce(r.data->'normalized'->>'description', '')
            when 'counterparty' then coalesce(r.data->'normalized'->>'counterparty', '')
            when 'merchant' then coalesce(r.data->'normalized'->>'merchant', '')
            when 'account' then coalesce(r.data->'normalized'->>'account', '')
          end
        ) ilike '%' || tr.match_value || '%'
      )
      or (
        tr.match_type = 'equals'
        and lower(
          case tr.match_field
            when 'description' then coalesce(r.data->'normalized'->>'description', '')
            when 'counterparty' then coalesce(r.data->'normalized'->>'counterparty', '')
            when 'merchant' then coalesce(r.data->'normalized'->>'merchant', '')
            when 'account' then coalesce(r.data->'normalized'->>'account', '')
          end
        ) = lower(tr.match_value)
      )
      or (
        tr.match_type = 'regex'
        and (
          case tr.match_field
            when 'description' then coalesce(r.data->'normalized'->>'description', '')
            when 'counterparty' then coalesce(r.data->'normalized'->>'counterparty', '')
            when 'merchant' then coalesce(r.data->'normalized'->>'merchant', '')
            when 'account' then coalesce(r.data->'normalized'->>'account', '')
          end
        ) ~* tr.match_value
      )
   )
  where r.module = 'finance'
    and r.record_type = 'transaction'
),
chosen as (
  select *
  from matches
  where rn = 1
)
update qisystem.records r
set data =
  jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          r.data,
          '{normalized,merchant}',
          to_jsonb(chosen.merchant),
          true
        ),
        '{enriched,category}',
        to_jsonb(chosen.category),
        true
      ),
      '{enriched,tags}',
      to_jsonb(chosen.tags),
      true
    ),
    '{enriched,rule_id}',
    to_jsonb(chosen.rule_id::text),
    true
  )
from chosen
where r.id = chosen.record_id;
