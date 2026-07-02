---
layout: page
title: Qicare Reserved
slug: ""
summary: ""
status: active
created_at: ""
updated_at: ""
author: ""
owner: ""
tags: []
keywords: []
aliases: []
context: ""
sensitivity: internal
classification: business_internal
realm_label: ""
uid: ""
canonical_ref: ""
source_type: manual
template_key: master-template
---

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
