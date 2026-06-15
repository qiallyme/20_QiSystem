# `qifinance` Reserved Schema

Status: Reserved / Future

Purpose:
The `qifinance` schema is reserved for strict financial tables once the finance domain requires enforcement beyond flexible records.

Do not build this prematurely.

Candidate future tables:

* `qifinance.accounts`
* `qifinance.transactions`
* `qifinance.categories`
* `qifinance.merchants`
* `qifinance.receipts`
* `qifinance.reconciliations`
* `qifinance.transaction_splits`

Promotion rule:
Only promote from `qisystem.records` to `qifinance` after enough imported data exists to prove the stable field structure.
