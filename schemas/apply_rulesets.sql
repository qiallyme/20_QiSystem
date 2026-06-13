-- ====================================
-- LINK: WHICH RULESETS APPLY TO WHICH NODES
-- ====================================

create table public.qios_filesystem_node_rules (
  node_path     text not null references public.qios_filesystem_nodes(path) on delete cascade,
  ruleset_id    uuid not null references public.qios_filesystem_rulesets(id) on delete cascade,
  -- Optional per-node overrides on top of the ruleset config
  override_config jsonb default null,
  primary key (node_path, ruleset_id),
  created_at    timestamptz not null default now()
);

create index qios_node_rules_node_idx
  on public.qios_filesystem_node_rules(node_path);

create index qios_node_rules_ruleset_idx
  on public.qios_filesystem_node_rules(ruleset_id);
