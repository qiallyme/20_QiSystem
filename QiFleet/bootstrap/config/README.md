---
layout: page
title: Readme
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

# Configuration Root

This folder houses the configuration for the enrolled edge nodes.

* `global/`: Rules pushed down from the Fleet Control Plane. Should not be modified locally.
* `local/`: Node-specific settings and active assignments.
* `secrets/`: Keystore and tokens for agent execution.
