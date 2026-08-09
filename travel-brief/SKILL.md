---
name: travel-brief
description: Research a travel destination and publish a single-page briefing to the GitHub Pages site, covering things to do, events falling in the travel dates (festivals, concerts, shows, exhibitions), restaurants, neighborhoods, what to book ahead, practical basics including how to get around on transit versus rides, and country background including local culture. Takes a city and the travel dates, and asks for either if not given. Requires Claude Code with the Claude in Chrome extension connected. Use when the user names a city or country they are planning to visit, asks for trip research, a travel brief, or "what should I know about [place]".
---

# Travel Brief

Research a destination against a fixed checklist and publish the result as a new page on the GitHub Pages site (`https://wangfowen.github.io/travelplan/`).

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

## Hard requirements — check before any research

If either fails, stop and say what to fix. Never proceed to a degraded brief; without these it is not a thinner version of the product, it is a different and worse one.

1. **Claude Code.** The skill assumes subagents, the scratchpad, git, and a push to the publishing repo — it does not run from Claude chat or a phone.
2. **Claude in Chrome, connected.** Load the browser tools (ToolSearch `select:mcp__claude-in-chrome__tabs_context_mcp,mcp__claude-in-chrome__navigate,mcp__claude-in-chrome__get_page_text,mcp__claude-in-chrome__browser_batch,mcp__claude-in-chrome__tabs_create_mcp,mcp__claude-in-chrome__tabs_close_mcp`) and call `tabs_context_mcp`; a tab listing is the go signal. The browser is the only route to Reddit (the richest source), the only permitted source of ratings, the closure check, and the primary finder for Healthy staples. If it is not connected, tell the user to connect the extension and re-run — do not research anything first.

## Workflow

Run the phases in order — it is materially cheaper and faster than interleaving research with writing.

### 1. Plan

Read `reference/research.md` and fill the city-specific slots of its query plan: the food format map, the flagship venue list, the named local press, the local-language query variants.

### 2. Gather — once, for everything

Every finding lands in one dossier, tagged by source at birth (format in research.md). Gathering applies no selection bars — it collects, sections cut; a candidate wrongly dropped here is invisible to every section downstream. But no selection does not mean no compression: dossier entries are structured one-liners, never raw page or thread text — every drafter reads the dossier whole, so bloat here taxes every section at once.

Fan out the research subagents in parallel (split in research.md). They return raw text findings — no publishing, and no Google-ratings chasing (that is phase 5; doing it early wastes searches on candidates that get cut). While they run, do the browser pass yourself, serially — Reddit and the Maps category searches. The browser is one shared resource with one tab group: never hand it to parallel agents.

Budget rules are in research.md — if searches start bouncing off the session limit, tell the user rather than silently shipping a thinner brief.

### 3. Draft — one section at a time, from the dossier only

Sections, one file each under `reference/sections/`: `things-to-do`, `food`, `events`, `where-to-stay`, `book-ahead`, `practical`, `country`. Per section: read its file (plus shared.md, once), shortlist from the dossier.

The three big drafts — things-to-do, food, events — can go to parallel subagents: each gets shared.md, its own section file, and the dossier paths, and returns its draft as text. Draft the small sections yourself.

**Keep the cut list as you draft.** Every candidate consciously ruled out, with the reason as stated at the moment of the cut — per section, alongside the shortlist. It becomes `decisions.md` in the run record at publish, and it is the raw material `/travel-summary` audits after the trip; a cut without a recorded reason can't be learned from later.

**Gap-fill:** each section file names its mandatory coverage. If the dossier has nothing for a mandatory group, that is a failed search, not a thin city — run that one missing query (browser first; it costs no budget) and move on. Never reopen general research from inside a section.

### 4. Cross-section pass — yours, never delegated

- **Each place appears once in the whole brief.** A must-do museum sits in Things to do's Top picks, not Museums; a restaurant in exactly one food section; the blockbuster loan show in Events → Exhibitions, the permanent collection in Things to do.
- **Book ahead harvests the other drafts**: ticketed events flagged sellout-risk, restaurants and tours with booking friction found during drafting become its candidate rows — except Asian food and Healthy staples, which are craving-satisfiers, not destinations, and never feed Book ahead (reference/sections/food.md).
- **An omitted section leaves no trace** (the no-trace rule, shared.md) — delete the heading and move on. Two exceptions still get written: Book ahead's "nothing needs advance booking" line, and source-availability callouts ("Eater has no coverage of this city", "Reddit was unreachable — attempts listed").

### 5. Verify — only what survived drafting

Ratings for every drafted place, via batched Google Maps lookups in the browser (mechanics in shared.md → Ratings and links) — which also catches permanently closed venues. Event dates and runs on official pages per events.md; fares per practical.md. Verifying candidates you will cut is the main way runs blow their budget — verify after selection, never before.

### 6. Assemble, check, publish

Each section file carries its own checklist — run it while drafting that section. Then run this cross-section list on the assembled brief:

1. Each place appears once across the whole brief.
2. Every rating has a review count; none invented; every list sorted by rating descending, unrated last.
3. Every Things to do, Food, and Events entry carries all its source tags; every reddit tag links its thread; no aggregator-sourced entries or numbers.
4. Empty sections and groups deleted heading-and-all, no sentence noting the omission — except Book ahead's "nothing needs advance booking" line and source-availability callouts.
5. Years attached: every fare, award, GDP figure, funding total, and tipping norm.
6. Every section file's own checklist actually ran.

## Publishing

The brief publishes to the GitHub Pages site — never as a chat artifact, never as a loose HTML file handed to the user.

- Work in the publishing repo: `~/.claude/skills/travel-brief` is a symlink into it (`readlink` gives the real path; the repo root is its parent).
- Write the finished page to `docs/briefs/<city-slug>-<YYYY-MM-DD>.html` (research date; append `-2` if the name is taken). **Every run is a new file** — never overwrite or update an existing brief; the index links each city to its latest brief and collapses older versions under a toggle.
- Append one entry to the `entries` array in `docs/manifest.json`: `{"type": "brief", "city": "<City>", "file": "briefs/<filename>", "trip": "<trip dates as printed in the brief header>", "published": "<YYYY-MM-DD>"}`. The index page renders itself from the manifest — do not edit `index.html`.
- Save the run record to `runs/<city-slug>-<YYYY-MM-DD>/`: copy the dossier files in, and write `decisions.md` — per section, the final shortlist plus the cut list (every consciously ruled-out candidate with its reason) and any research gaps or source failures. This is what `/travel-summary` audits after the trip.
- Commit (`Add <City> travel brief <YYYY-MM-DD>`) and push. Confirm the push succeeded.
- Give the user two links: the brief at `https://wangfowen.github.io/travelplan/briefs/<filename>` and the index at `https://wangfowen.github.io/travelplan/` (Pages takes a minute or two to redeploy after the push).

## Output

One self-contained HTML page, following `reference/brief-template.html`.

- Title: `<City> — Travel Brief`. Header shows travel dates, research date, and one line of expected weather for the dates (typical high/low, rain likelihood, daylight — climate normals from own knowledge are fine, labeled per Accuracy rules).
- A one-line anchor nav under the header so each section is one tap away on a phone.
- Any section or group with nothing that cleared the bar is dropped heading-and-all, with no sentence noting the omission (Events subsections, nature entries, and Day trips are the usual cases; a food section can be empty too, but only after its own query pass ran and came back dry).
- Readable on a phone; works in light and dark themes; no external requests — all CSS inline, nothing remote loaded (links out are fine).
- Every place name links to Google Maps; ratings render as a visible badge; every Things-to-do, Events, and Food entry shows all its source tags; reddit tags link to their thread.
- Book-ahead entries render as a table with a visible lead-time column.

After publishing, give a three-or-four-line chat summary: the single highest-value thing to book immediately, anything notable falling in their dates, and anything you could not confirm.
