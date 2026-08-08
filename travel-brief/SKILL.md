---
name: travel-brief
description: Research a travel destination and produce a single-page briefing artifact covering things to do, events falling in the travel dates (festivals, concerts, shows, exhibitions), restaurants, neighborhoods, what to book ahead, practical basics including how to get around on transit versus rides, and country background including local culture. Takes a city and the travel dates, and asks for either if not given. Use when the user names a city or country they are planning to visit, asks for trip research, a travel brief, or "what should I know about <place>".
---

# Travel Brief

Research a destination against a fixed checklist and publish the result as a single self-contained HTML artifact.

This file is the pipeline. The content rules live in reference files, each loaded only when its phase runs:

| File | Holds | Load when |
|---|---|---|
| `reference/shared.md` | Traveler profile, shortlist discipline, entry style, ratings and links, source tags, accuracy rules | Before drafting anything — and it goes to every drafting subagent |
| `reference/research.md` | Source mechanics (including Reddit-in-browser), the consolidated query plan, dossier format, search budget | At the start of the gather phase |
| `reference/sections/<name>.md` | One brief section's selection bars, structure, and checklist | When drafting that section — never draft a section without its file in context |
| `reference/brief-template.html` | Output structure and styling | At assembly |

Why this shape: **research runs once, against all sources, into one shared dossier.** Each section is then a selection problem over that pool, judged by its own file's bars with no other section's rules in context. Sections never run their own research pass — most findings serve several sections at once (a Reddit food thread feeds Local dishes, Everyday institutions, and Top picks alike), so re-searching per section is pure waste. The one exception is the targeted gap-fill defined in phase 3.

## Input

Required: **a city and the travel dates.** If they name only a country, ask which city — most of the brief is city-scoped. If they give no dates, ask before researching — Events and Book-ahead are unwritable without them; approximate dates ("mid-May") are fine, and say so when asking. Ask for everything missing in one message, then research.

## Workflow

Run the phases in order — it is materially cheaper and faster than interleaving research with writing.

### 1. Plan

Read `reference/research.md` and fill the city-specific slots of its query plan: the food format map, the flagship venue list, the named local press, the local-language query variants.

### 2. Gather — once, for everything

Every finding lands in one dossier, tagged by source at birth (format in research.md). Gathering applies no selection bars — it collects, sections cut; a candidate wrongly dropped here is invisible to every section downstream. But no selection does not mean no compression: dossier entries are structured one-liners, never raw page or thread text — every drafter reads the dossier whole, so bloat here taxes every section at once.

- **In Claude Code:** fan out the research subagents in parallel (split in research.md). They return raw text findings — no artifacts, and no Google-ratings chasing (that is phase 5; doing it early wastes searches on candidates that get cut). While they run, do the browser pass yourself, serially — Reddit and the Maps category searches. The browser is one shared resource with one tab group: never hand it to parallel agents.
- **In Claude chat:** no subagents and no scratchpad — run the same source passes yourself, sequentially, keeping the dossier as structured running notes in the conversation. Reaching Reddit's fallback ladder (research.md) applies.

Budget rules are in research.md — if searches start bouncing off the session limit, tell the user rather than silently shipping a thinner brief.

### 3. Draft — one section at a time, from the dossier only

Sections, one file each under `reference/sections/`: `things-to-do`, `events`, `food`, `where-to-stay`, `book-ahead`, `practical`, `country`. Per section: read its file (plus shared.md, once), shortlist from the dossier.

In Claude Code the three big drafts — food, things-to-do, events — can go to parallel subagents: each gets shared.md, its own section file, and the dossier paths, and returns its draft as text. Draft the small sections yourself. In Claude chat, draft sequentially, reading one section file at a time.

**Gap-fill:** each section file names its mandatory coverage. If the dossier has nothing for a mandatory group, that is a failed search, not a thin city — run that one missing query (browser first; it costs no budget) and move on. Never reopen general research from inside a section.

### 4. Cross-section pass — yours, never delegated

- **Each place appears once in the whole brief.** A must-do museum sits in Things to do's Top picks, not Museums; a restaurant in exactly one food section; the blockbuster loan show in Events → Exhibitions, the permanent collection in Things to do.
- **Book ahead harvests the other drafts**: ticketed events flagged sellout-risk, restaurants and tours with booking friction found during drafting become its candidate rows.
- **An omitted section leaves no trace** (the no-trace rule, shared.md) — delete the heading and move on. Two exceptions still get written: Book ahead's "nothing needs advance booking" line, and source-availability callouts ("Eater has no coverage of this city", "Reddit was unreachable — attempts listed").

### 5. Verify — only what survived drafting

Ratings for every drafted place, via batched Google Maps lookups in the browser (mechanics in shared.md → Ratings and links) — which also catches permanently closed venues. Event dates and runs on official pages per events.md; fares per practical.md. Verifying candidates you will cut is the main way runs blow their budget — verify after selection, never before.

### 6. Assemble, check, publish

Each section file carries its own checklist — run it while drafting that section. Then run this cross-section list on the assembled brief:

1. Each place appears once across the whole brief.
2. Every rating has a review count; none invented; every list sorted by rating descending, unrated last.
3. Every Things to do, Events, and Food entry carries all its source tags; every reddit tag links its thread; no aggregator-sourced entries or numbers.
4. Empty sections and groups deleted heading-and-all, no sentence noting the omission — except Book ahead's "nothing needs advance booking" line and source-availability callouts.
5. Years attached: every fare, award, GDP figure, funding total, and tipping norm.
6. Every section file's own checklist actually ran.

## Output

One self-contained HTML artifact, following `reference/brief-template.html`. In Claude chat, emit the artifact directly (no files); in Claude Code, write to a scratch file and publish with the Artifact tool — never into the user's project.

- Title: `<City> — Travel Brief`. Header shows travel dates, research date, and one line of expected weather for the dates (typical high/low, rain likelihood, daylight — climate normals from own knowledge are fine, labeled per Accuracy rules).
- A one-line anchor nav under the header so each section is one tap away on a phone.
- Any section or group with nothing that cleared the bar is dropped heading-and-all, with no sentence noting the omission (Events subsections, nature entries, and Day trips are the usual cases; a food section can be empty too, but only after its own query pass ran and came back dry).
- Readable on a phone; works in light and dark themes; no external requests — all CSS inline, nothing remote loaded (links out are fine).
- Every place name links to Google Maps; ratings render as a visible badge; every Things-to-do, Events, and Food entry shows all its source tags; reddit tags link to their thread.
- Book-ahead entries render as a table with a visible lead-time column.

After publishing, give a three-or-four-line chat summary: the single highest-value thing to book immediately, anything notable falling in their dates, and anything you could not confirm.
