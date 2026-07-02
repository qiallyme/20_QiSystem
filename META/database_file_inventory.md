---
layout: page
title: Database File Inventory
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

﻿# QiSystem Database and Import Files Inventory

This document lists the absolute paths of all database files, schemas, configurations, and CSV data files in the repository.

## 1. Supabase SQL Execution Scripts (21 files)
These are modular SQL files under `50_data/supabase/qisupabase/sql/` used to run up database structures locally.

* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\00_core\00.001_create_schemas.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\00_core\00.002_extensions.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\00_core\00.003_updated_at_function.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.001_libraries.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.002_records.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.003_record_links.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.004_tags.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.005_record_tags.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.006_attachments.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.007_events.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.008_event_links.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\01_tables\01.009_records_updated_at_trigger.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\02_indexes\02.001_core_indexes.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\03_seed\03.001_libraries_seed.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\04_rules\04.001_transaction_rules.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\04_rules\04.002_seed_transaction_rules.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\04_rules\04.003_apply_transaction_rules.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\05_pipeline\05.001_transaction_normalization_contract.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\05_pipeline\05.002_firefly_staging.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\05_pipeline\05.003_firefly_transform.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\sql\99_verify\99.001_smoke_tests.sql`

## 2. Supabase Deployment Migrations (9 files)
These are versioned, deployment migration files under `50_data/supabase/qisupabase/migrations/`.

* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\001_ingestion_queue.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\002_semantic_profile_file_level.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\20260401000000_qione_admin_invite.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\20260404000001_qios_modular_mode_pivot.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\20260507045840_add_daily_care_notes.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\20260508112922_medication_hold_and_inventory_workflows.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\20260510090423_desktop_admin_admin_console_foundation.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\qicase_schema.sql`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\migrations\qievidence.sql`

## 3. SQL Files Located in Packages (25 files)
These are legacy or domain-specific prototype SQL files located inside `packages/`.

* `C:\QiLabs\20_QiSystem\packages\database\src\adapters\supabase\bootstrap_tenant.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0001_qione_core.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0002_qiarchive_spine.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0003_qisys_ops.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0004_qigraph_index.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0005_qiknowledge.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0006_qially_comms.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0007_namespace_registry.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0007_qichronicle_time.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0008_get_tenant_members_with_roles.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0008_qihome_ledger.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0009_household_bootstrap_final.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0009_qitax_returns.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0010_qicase_matters.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0010_upsert_tenant_member.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0011_add_display_name_to_members.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0011_qicrm_contacts.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0012_qivault_docs.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0013_qicms_web.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0014_registry.namespace_allocations.sql`
* `C:\QiLabs\20_QiSystem\packages\database\src\migrations\0015_registry_namespace_bands.sql`
* `C:\QiLabs\20_QiSystem\packages\qiobject\energy\insert_bills.sql`
* `C:\QiLabs\20_QiSystem\packages\qiobject\energy\insert_bills_detailed.sql`
* `C:\QiLabs\20_QiSystem\packages\qiobject\energy\update_bills_schema.sql`
* `C:\QiLabs\20_QiSystem\packages\qiobject\rides\database.sql`

## 4. Database & Runtime Configurations (8 files)
These are environment configuration files, wrangler settings, or CLI configuration files.

* `C:\QiLabs\20_QiSystem\50_data\supabase\.env.example`
* `C:\QiLabs\20_QiSystem\50_data\supabase\qisupabase\config.toml`
* `C:\QiLabs\20_QiSystem\packages\ai\wrangler.toml`
* `C:\QiLabs\20_QiSystem\packages\database\.env`
* `C:\QiLabs\20_QiSystem\packages\gina\.env`
* `C:\QiLabs\20_QiSystem\packages\qiobject\energy\.env`
* `C:\QiLabs\20_QiSystem\packages\qiobject\rides\.env`
* `C:\QiLabs\20_QiSystem\packages\qiobject\rides\worker\wrangler.toml`

## 5. Reference System CSVs (36 files)
These are conceptual source system-definition CSVs located under `20_schemas/`.

* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_API Recovery Keys & Related.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Brand Assets.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Chargers.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Communication Logs.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Core Registry.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Daily Metrics.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_database outline.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_db_groups_db.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_DirectoryTrees db.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Domains.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_FieldDependencyRelation_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Fields_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Issue Tracking.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_job_titles_db.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_LayoutFieldProperties_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Layout_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Lists db Industries.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Lists.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Log.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Master Code Matrix with Numerical Values.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Master Services Catalog.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Modules_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Notification Center (1).csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Notifications.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_PickListFieldProperties_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Processes & Checklists.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_QiAlly_Addons_Import_Final.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_QIVerse DB.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_speedometer-3-2025-11-15T22_11_11.487Z.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Spread List.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Tools Checklist.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Tools.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Translation_Codes_001.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Triggers Detail.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_Types.csv`
* `C:\QiLabs\20_QiSystem\20_schemas\reference_csv\system\system_usage_timeline_rows.csv`

## 6. Flat Source Data CSVs (sheets/) (142 files)
These are flat CSV registers containing historical record sets or import candidate files.

* `C:\QiLabs\20_QiSystem\sheets\20251116_app_code_gallery_database.csv`
* `C:\QiLabs\20_QiSystem\sheets\activity_merged.csv`
* `C:\QiLabs\20_QiSystem\sheets\AES_Usage_Timeline.csv`
* `C:\QiLabs\20_QiSystem\sheets\Company_Details_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\conversations.csv`
* `C:\QiLabs\20_QiSystem\sheets\gina_memory_rows.csv`
* `C:\QiLabs\20_QiSystem\sheets\ignore_list_v1.csv`
* `C:\QiLabs\20_QiSystem\sheets\Notifications.csv`
* `C:\QiLabs\20_QiSystem\sheets\Programming Languages.csv`
* `C:\QiLabs\20_QiSystem\sheets\qially_llc_account_list.csv`
* `C:\QiLabs\20_QiSystem\sheets\QiNote Systems.csv`
* `C:\QiLabs\20_QiSystem\sheets\qi_rules_template.csv`
* `C:\QiLabs\20_QiSystem\sheets\raw_emails_combined.csv`
* `C:\QiLabs\20_QiSystem\sheets\realms_registry.csv`
* `C:\QiLabs\20_QiSystem\sheets\sensitivity_classification_matrix_v1.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\businesses_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\business_Industry Reports.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\calls_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\engagements_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\experience_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\meetings_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\products_services_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\qially_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\skills_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\socials_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\tasks_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\business\territories_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\client\client_Client Docs.csv`
* `C:\QiLabs\20_QiSystem\sheets\contacts\contacts_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\contacts\contacts_insights_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\coa_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\coa_schc_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_billpay_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_cashapp_converted_sample_format.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_cashapp_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Chart_of_Accounts.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_chart_of_accounts_clean.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Email Templates for Client Portal.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_iisiTax Service Agreement Template.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Internal COA (OS).csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Invoices_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_IRS Tax Professional Resources.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_items_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_plates_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_QIALLY LLC_Account List.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_QiAlly me 360 Plan Details.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Quotes_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Register.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Sales Orders_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Summary Total 1.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Summary _1.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Tax Home Expenses.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Tax Home Percentage DB.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Tax Ledger DB.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Tax Mileage DB.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Tax Resolution Packet Full.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_tax_returns_master_template.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Transaction Rules.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\financial_Yard Sale Summary.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\tarot_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\financial\taxwise_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\insurance\insurance_Auto Ins Drivers db.csv`
* `C:\QiLabs\20_QiSystem\sheets\insurance\insurance_Auto Ins Events db.csv`
* `C:\QiLabs\20_QiSystem\sheets\insurance\insurance_Auto Ins Vehicle db.csv`
* `C:\QiLabs\20_QiSystem\sheets\insurance\insurance_Auto Insurance db.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Code Gallery and Snippets Database.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Coding Resources.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_conversations.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Copy To Notion Web Clips.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_db RawEmails KB.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_db_SOPs.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Knowledge Base.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Resources.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Tags.csv`
* `C:\QiLabs\20_QiSystem\sheets\knowledge\knowledge_Translation_Language_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Background Check Adjudication Grid (TO REVIEW).csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Background Check Policies Database.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Charge_Types_and_Degrees.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Consulate Appointment 2024 07 12 1.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Consulate Appointment 2024 07.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Crisis Management.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_DocumentChecklist.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_EIN APPLICATION 2024 07.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_EIN_APPLICATION_2024_07_12.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Flow Docs_C_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Immigration Case Events _1.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Immigrations Forms List.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Internal Background Check Grid.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Joel Immigration Case Binder 1.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Mandated Training.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_New Text Document.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_QiAlly Master Legal Binder.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_SRV INDIANA FILINGS 2024 07 12 1.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_SRV INDIANA FILINGS 2024 07.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_SRV1 Doc Prep 2024 07 12 1.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_SRV1 Doc Prep 2024 07.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_SRV1_Doc_Prep_2024_07_12.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_SRV_INDIANA_FILINGS_2024_07_12.csv`
* `C:\QiLabs\20_QiSystem\sheets\legal\legal_Tony Walker Documents.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Blood Glucose Log.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Blood Pressure Log.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Drive Health Tracker.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Encounters 1c1f84a04402800cac10d16222dd88b6_all.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Medical History Log.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Medical Tests Log.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Medication.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Paranoia & Behavior Log.csv`
* `C:\QiLabs\20_QiSystem\sheets\medical\medical_Vaccination Log.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_allergies_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_bookmarks_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Daily Tracker.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_generic_notes_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Gig Job.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Habit.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Letters & Voice Notes From Me (DB).csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Letters.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Lively Hood (DB).csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_medical_appointments_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_medications_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Meeting Notes.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Memory Shelf (DB).csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_merged_account email_account open date_account password_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_merged_appliance_device_daily kwh _w _ hrs _ 1000__est_ monthly cost_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_merged_assignee_cody rice-velasquez_files_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_merged_category-type_date sold_date sold summary_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_merged_created by_edited by_editing date_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_merged_date_expense_income_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Messages to Cody (DB).csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Notes.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Personal Inventory.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_qimessages_C_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Reading Journal.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_StickyNotes_001.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Tesla_Charging_History_2024-06-16T06-09-49.532Z_1e0e91da.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Untitled 1_12.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Untitled 1_2.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Untitled 1_22.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Untitled all 1_2.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_vaccinations_db.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_Vianey & Carlos.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_What Iâ€™m Navigating Codyâ€™s Guide to Understanding  219f84a04402814bac9aeb70a7ba0031_all.csv`
* `C:\QiLabs\20_QiSystem\sheets\personal\personal_You Thought That You Knew Me.csv`

