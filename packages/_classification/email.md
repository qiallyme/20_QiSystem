# Package Classification: email

* **Name**: `email`
* **Package Name (package.json)**: None (No `package.json` file present)
* **Version**: N/A
* **Private**: N/A

## Classification
* **Status**: Review / Keep
* **Safe to Move**: Should stay in place.

## Technical Scope
* **Supabase**: Yes, contains custom Supabase Auth templates (`supabase-auth/`).
* **Cloudflare Workers**: No.
* **Database**: No.
* **Email**: Yes, contains headers/footers, SMTP YAML configs, and email layout html files.
* **Frontend Code**: No.

## Inferred Purpose
Acts as the central repository for email and auth layout templates. It contains partial templates (header, footer), Supabase authorization templates (OTP, recovery, invite, confirmation, magic link), and application template structures for billing, projects, and tax notices. It also features a rendering helper script `render.ts`.

## Scripts
* None

## Recommendations & Notes
* Crucial for maintaining custom brand experiences for Supabase auth emails.
* Ensure files under `supabase-auth/` are copied to the active Supabase dashboard configuration or handled via local deployment scripts.
