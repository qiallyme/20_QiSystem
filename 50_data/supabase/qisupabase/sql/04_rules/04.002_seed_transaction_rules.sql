insert into qisystem.transaction_rules
  (rule_name, match_field, match_type, match_value, merchant, category, tags, priority)
values
  ('Hertz rentals', 'description', 'contains', 'HERTZ', 'Hertz', 'Transport', array['rental', 'car', 'work'], 10),
  ('Lyft platform', 'description', 'contains', 'LYFT', 'Lyft', 'Income / Gig Work', array['rideshare', 'gig_work'], 20),
  ('Cash App', 'description', 'contains', 'CASH APP', 'Cash App', 'Transfer', array['p2p', 'cash_app'], 30),
  ('McDonalds', 'description', 'contains', 'MCDON', 'McDonald''s', 'Food', array['fast_food'], 40),
  ('Walmart', 'description', 'contains', 'WALMART', 'Walmart', 'Shopping', array['retail'], 50),
  ('Gas fuel', 'description', 'regex', '(SHELL|BP|MARATHON|CIRCLE K|SPEEDWAY|MURPHY)', 'Fuel Merchant', 'Transport', array['fuel', 'vehicle'], 60)
on conflict do nothing;
