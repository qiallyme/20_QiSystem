# `qicare` Reserved Schema

Status: Reserved / Future

Purpose:
The `qicare` schema is reserved for strict care, medical, medication, vitals, appointment, and care coordination tables.

Do not build this prematurely.

Candidate future tables:

* `qicare.people`
* `qicare.patients`
* `qicare.care_logs`
* `qicare.vitals`
* `qicare.medications`
* `qicare.medication_events`
* `qicare.appointments`
* `qicare.providers`
* `qicare.equipment`
* `qicare.care_tasks`

Promotion rule:
Use `qisystem.records` for fast capture first.
Promote to `qicare` only after repeated care data shapes become stable.
