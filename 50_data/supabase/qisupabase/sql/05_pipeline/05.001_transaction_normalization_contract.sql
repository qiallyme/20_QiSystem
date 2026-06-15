-- Transaction normalization contract.
-- Reference file only. This file intentionally creates no database objects.

/*
Every financial import should move through:

CSV/source export
  -> staging table
  -> qisystem.records row with:
     module = 'finance'
     record_type = 'transaction'

data shape:

{
  "source": "firefly|cash_app|chase|manual|...",
  "raw": {
    "...": "exact source columns preserved"
  },
  "normalized": {
    "amount": 0.00,
    "signed_amount": 0.00,
    "direction": "inflow|outflow",
    "account": "",
    "counterparty": "",
    "merchant": "",
    "timestamp": "",
    "description": "",
    "external_id": ""
  },
  "enriched": {
    "category": "",
    "tags": [],
    "confidence": 0.0,
    "rule_id": ""
  }
}
*/
