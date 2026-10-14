# Decisions

One entry per decision. Unknowns are marked TODO (Ian).

## 1. Monthly budget: USD 10
- **Decision:** Budget is USD 10/month (the curriculum says 30). Runs on an Azure for Students subscription.
- **Why:** Cash.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian). Azure for Students expiry date must be checked: TODO (Ian).

## 2. LLMs: Gemini API free tier + Ollama locally
- **Decision:** Use the Gemini API free tier and Ollama locally. No paid LLM account yet. Radar task texts stay private (not sent to the free tier).
- **Why:** Free-tier prompts may be used by Google.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 3. Kill switch design
- **Decision:** `precheck()` before every call, `charge()` after. Limits are strictly-less-than (landing exactly on the limit is blocked). Unknown model = blocked. Ledger v0 is an in-memory list; SQLite later. KES rate configured at 130 (dated 2026-09-29), stored per row.
- **Why:** TODO (Ian)
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian) (ledger moves to SQLite later)

## 4. Postgres 17-alpine on host port 5434
- **Decision:** Postgres 17-alpine, exposed on host port 5434.
- **Why:** Ports 5432 and 5433 are used by other projects.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 5. Tooling and where work happens
- **Decision:** uv for Python. The dev container is the default place to work. Claude Code runs inside it, with its config in a Docker volume. Azure login only outside the container.
- **Why:** TODO (Ian)
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 6. Clock storage: Azure Blob, write-once
- **Decision:** Azure Blob with versioning ON. Write-once enforced in code (`overwrite=False`); only `manifest.json` is ever replaced. Managed identity with Storage Blob Data Contributor scoped to the "raw" container.
- **Why:** The role could overwrite blobs; versioning is the safety net.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 7. Container Apps environment mode: ConsumptionOnly
- **Decision:** Create the Container Apps environment in ConsumptionOnly mode.
- **Why:** New environments defaulted to "express", which does not support jobs or system-assigned identities (Oct 2026).
- **Date:** Oct 2026 (exact day TODO (Ian))
- **Revisit when:** TODO (Ian)

## 8. Images on GitHub Container Registry (public)
- **Decision:** Publish images to GitHub Container Registry (public) instead of Azure Container Registry.
- **Why:** Cost.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 9. No Log Analytics workspace
- **Decision:** No Log Analytics workspace; each run writes its own log to Blob.
- **Why:** Cost.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 10. Capturer limits
- **Decision:** Max 50 new files per source per run, saved file-by-file. Job timeout 2 hours.
- **Why:** TODO (Ian)
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 11. KNBS TLS: ship the missing intermediate
- **Decision:** Ship YE2 + ISRG Root YE cross-signed by X2. Verification is never disabled.
- **Why:** The KNBS server omits the intermediate certificate.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 12. Kenya Law crawl-delay
- **Decision:** Honour Kenya Law's crawl-delay of 5s, per source.
- **Why:** TODO (Ian)
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 13. One-time exception: agent edited tests/spec plumbing
- **Decision:** For the storage refactor, the agent was allowed to edit tests/spec plumbing, once. No assertions were removed or weakened (reviewed by Ian).
- **Why:** Storage refactor.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 14. ISO 8583 removed from CV
- **Decision:** Remove ISO 8583 from the CV.
- **Why:** Could not explain it.
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)

## 15. Phase 0 overrun: cut, don't push the calendar
- **Decision:** Phase 0 overran Unit 1's start (12 Oct). Rule applied: cut scope, don't push the calendar.
- **Why:** TODO (Ian)
- **Date:** TODO (Ian)
- **Revisit when:** TODO (Ian)
