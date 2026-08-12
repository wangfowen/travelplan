---
name: travel-summary
description: After a trip, turn the city's travel brief plus the traveler's account of what they liked, disliked, found mediocre, and wanted but never reached into a shareable guide of the places they personally recommend, published on the GitHub Pages site — then audit the dossier and decisions of the research run behind each version they used, to propose generalizable improvements to the travel-brief skill. Use when the user is back from a trip, rates places from a brief as liked/disliked/mediocre or names ones they wanted but did not reach, or asks for a friend-ready version of a guide.
---

# Travel Summary

Two jobs from one account: **publish the friend-ready guide**, and **audit the research runs behind the versions the traveler used**, turning the feedback into travel-brief improvements — but only ones that survive the generalization gate. The jobs share one input, the resolution map built in step 1, and past it they share no state: run them concurrently, not in sequence.

This file is the pipeline. The content rules live in two reference files, each loaded only when its job runs:

| File | Holds | Load when |
|---|---|---|
| `reference/guide.md` | How the trip guide page is built: what carries, what is cut, tags, sorting, per-section rules | Building the guide — and it goes to the guide subagent if one is used |
| `reference/audit.md` | Feedback classification, the generalization gate, canonical homes for edits, how proposals are presented, what gets recorded where | Running the audit |

Runs in Claude Code, in the publishing repo (`~/.claude/skills/travel-summary` is a symlink into it; the repo root is the symlink target's parent). No browser needed; connect Claude in Chrome only if the traveler's own discoveries need ratings verified — an unrated `trip find` entry is fine.

## Input

- **The city.** A city can have several published pages — earlier briefs, earlier trip guides — and the traveler may be recommending things they read in any of them, not only the newest. List every `docs/manifest.json` entry for the city up front, newest first. **That set, not a single file, is what the account gets resolved against.**
- **The base version** — the page whose researched sections the new guide inherits: the latest `"type": "brief"` entry for the city, or whichever version the user names.
- **The traveler's account**, freeform, in four registers — **liked**, **disliked**, **mediocre**, **want to go** (wanted it, didn't get there) — plus whatever they found on their own. They may not label them; read the account for which register each place falls in, and ask only where one is genuinely ambiguous, since liked and mediocre are treated differently on the page and in the audit. Ask for the account itself only if it is missing entirely; don't interrogate for completeness — work with what's given. What they name is what the guide is built from, so a short account makes a short guide, and that is the correct outcome, not a gap to fill.

## 1. Resolve — one pass, feeds both jobs

Resolve every place the account names against the city's published pages, **newest first**: which register it falls in, and which version's entry it resolves to — a place appearing in none of them is a trip find. Write the map down before either job starts: it is the guide's build list and the audit's case list, and re-deriving it later from a finished page is guesswork. The map is recorded permanently as the **opening section of the run record's `feedback.md`** (`reference/audit.md` → Recording the audit), together with any version-confidence caveats it surfaces.

## 2. Fork — guide and audit, concurrently

The guide reads published HTML; the audit reads run records. Neither waits for the other:

- **The guide** (`reference/guide.md`) can go to a subagent: give it the resolution map, the base version's HTML path, the traveler's concrete tips, guide.md, and the exact output path. Or build it yourself while the audit's reads are in flight.
- **The audit** (`reference/audit.md`) needs `runs/proposals.md`, the run records behind the versions in the map, and — for versions predating run records — the published HTML alone.

The one ordering rule: **proposals go to the user last**, after the audit is complete — never piecemeal while classification is still moving.

## 3. Publish the guide

Same mechanics as travel-brief, not gated on the audit or on any approval: write `docs/summaries/<city-slug>-<YYYY-MM-DD>.html`, append `{"type": "summary", "city": "<City>", "file": "summaries/<filename>", "trip": "<trip dates>", "published": "<YYYY-MM-DD>"}` to `docs/manifest.json`, commit (`Add <City> trip guide`), push, and give the live URL. The index automatically makes the newest trip guide the city's main link, demoting the brief to the older-versions toggle — no index edit needed. The page is public, built for sending to friends.

## 4. Offer, apply, record

**No file under `travel-brief/` is ever edited without the user confirming that specific change first.** This is a hard gate, not a courtesy: the whole failure mode this skill guards against is over-fitting the brief skill to one trip, and the user is the check on that. It applies to every travel-brief file including `shared.md`'s traveler profile, and it holds however obvious, small, or mechanical the change looks — a one-word tightening still gets asked. Never bundle an unapproved edit in with an approved one, and never treat silence, a general "sounds good", or approval of a *different* proposal as consent.

Present each surviving proposal in the format in `reference/audit.md` → Presenting proposals, then stop and ask. Apply only the proposals the user explicitly accepts; drop the rest without argument.

Then record the audit (`reference/audit.md` → Recording the audit): the run record's `feedback.md`, `runs/proposals.md`, `runs/calibration.md`. If a classification changed what the published guide should show — most often a tag, e.g. a place that resolved to an earlier version is not a `trip find` — amend the guide page in place as part of this step: the audit correcting the guide it just audited is expected, and the never-overwrite rule is about briefs surviving later runs, not about this.

Commit separately (`Audit <City> trip; <what was applied, if anything>`) and push. The guide shipped in step 3; the audit gets its own commit because it finishes later and touches different files.

## Done when

- Trip guide pushed; live URL given.
- `feedback.md` written in the base version's run directory: resolution map, every classification with evidence, every proposal with its outcome.
- `runs/proposals.md` updated — new sightings added, actioned entries moved per its section rules.
- `runs/calibration.md` carries this trip's source lines.
- Every surviving proposal was actually offered; only accepted ones applied.
- Audit committed and pushed.
