# Out of Lane CSV Inventory

This document lists all CSV files located outside the designated database, schema reference, raw intake, and flat sheet folders.

## Inventory List

### 1. `import_manifest.csv`
* **Full Path**: `C:\QiLabs\20_QiSystem\40_automation\qicapture\manifests\import_manifest.csv`
* **Parent Folder**: `manifests`
* **Likely Domain**: `system`
* **Recommended Action**: `leave_in_place`
* **Notes**: Central QiCapture control plane manifest tracking ingestion and import pipeline parameters.

---

### 2. `INDEX.csv`
* **Full Path**: `C:\QiLabs\20_QiSystem\META\INDEX.csv`
* **Parent Folder**: `META`
* **Likely Domain**: `system`
* **Recommended Action**: `leave_in_place`
* **Notes**: Repository-wide index catalog database registry. Kept as metadata reference.

---

### 3. `raw_export_DO_NOT_TOUCH.csv`
* **Full Path**: `C:\QiLabs\20_QiSystem\packages\qiobject\contacts\qicontacts\files\raw_export_DO_NOT_TOUCH.csv`
* **Parent Folder**: `files`
* **Likely Domain**: `personal` (contacts)
* **Recommended Action**: `review_needed`
* **Notes**: Legacy contacts raw export nested in object packaging. Review if it should be staged into raw intake `personal/` or archived.

---

### 4. `activity.csv`
* **Full Path**: `C:\QiLabs\20_QiSystem\packages\qiobject\energy\activity.csv`
* **Parent Folder**: `energy`
* **Likely Domain**: `personal` (energy)
* **Recommended Action**: `review_needed`
* **Notes**: Utility metrics history from prototype energy tracking module. Review if it should be staged into raw intake `personal/` or archived.

---

### 5. `data.csv`
* **Full Path**: `C:\QiLabs\20_QiSystem\packages\qiobject\energy\data.csv`
* **Parent Folder**: `energy`
* **Likely Domain**: `personal` (energy)
* **Recommended Action**: `review_needed`
* **Notes**: Source data files for energy billing tracking. Review if it should be staged into raw intake `personal/` or archived.
