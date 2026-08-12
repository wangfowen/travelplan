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
| `reference/brief-template.html` | Output structure and styling | At assembly — and it goes to every drafting subagent, which writes its section as a finished fragment |

Why this shape: **research runs once, against all sources, into one shared dossier.** Each section is then a selection problem over that pool, judged by its own file's bars with no other section's rules in context. Sections never run their own research pass — most findings serve several sections at once (a Reddit food thread feeds Local dishes, Everyday institutions, and Top picks alike), so re-searching per section is pure waste. The one exception is the targeted gap-fill defined in phase 3.

## Input

Required: **a city and the travel dates.** If they name only a country, ask which city — most of the brief is city-scoped. If they give no dates, ask before researching — Events and Book-ahead are unwritable without them; approximate dates ("mid-May") are fine, and say so when asking. Ask for everything missing in one message, then research.

## Hard requirements — check before any research

If either fails, stop and say what to fix. Never proceed to a degraded brief; without these it is not a thinner version of the product, it is a different and worse one.

1. **Claude Code.** The skill assumes subagents, the scratchpad, git, and a push to the publishing repo — it does not run from Claude chat or a phone.
2. **Claude in Chrome, connected.** Loaded and checked in phase 1, in the same turn as the planning reads — a tab listing is the go signal. The browser is the only route to Reddit (the richest source), the only permitted source of ratings, the closure check, and the primary finder for Healthy staples. If it is not connected, tell the user to connect the extension and re-run — do not research anything first.

## Workflow

**Research runs once, before any drafting — never interleave the two.** Past that, the run pipelines: a section starts drafting the moment the dossier tracks it depends on exist, and its places are verified as soon as it is drafted. Only the sections that actually need the browser pass wait for it.

The phase numbers below are dependency order, not clock order — 3 and 5 overlap (each section is verified while others are still drafting), and 4 runs once all six drafts have landed.

**Every subagent gets the absolute scratchpad path.** Subagents do not inherit it. One that guesses writes into the void and its whole track is lost — pass the path and the exact output filename in the prompt, every time.

### 1. Plan — one turn, gate included

In a single turn: load the browser tools (ToolSearch `select:mcp__claude-in-chrome__tabs_context_mcp,mcp__claude-in-chrome__navigate,mcp__claude-in-chrome__get_page_text,mcp__claude-in-chrome__browser_batch,mcp__claude-in-chrome__tabs_create_mcp,mcp__claude-in-chrome__tabs_close_mcp`), call `tabs_context_mcp`, and read `reference/research.md`. No tab listing, no run (Hard requirements above) — nothing has been spent at this point.

Then fill the city-specific slots of research.md's query plan: the food format map, the flagship venue list, the named local press, the local-language query variants.

### 2. Gather — once, for everything

Every finding lands in one dossier, tagged by source at birth. Gathering collects, sections cut — the no-bars rule, the hard-compression rule, and the dossier format are in research.md.

Fan out the research subagents in parallel (split in research.md). **Each writes its own dossier file directly** — they do not return findings as text for you to transcribe; a track routed through your context is the same text generated twice. They return only a one-line status: what they covered and what came back empty. No publishing, and no Google-ratings chasing (that is phase 5).

While they run, do the browser pass yourself, serially — Reddit and the Maps category searches, written to `dossier/reddit.md` as you go. The browser is one shared resource with one tab group: never hand it to parallel agents.

Budget rules are in research.md.

### 3. Draft — one subagent per section, launched as its sources land

Sections, one file each under `reference/sections/`: `things-to-do`, `food`, `events`, `where-to-stay`, `book-ahead`, `practical`, `country`.

**Launch each drafter the moment its tracks are written — do not wait for the whole gather.** The browser pass is the long pole and most sections do not depend on it:

| Section | Waits on |
|---|---|
| `country` | country track |
| `practical` | city track |
| `events` | events track + the Reddit events query |
| `where-to-stay` | city track + the Reddit stay threads |
| `things-to-do` | full browser pass + city track |
| `food` | full browser pass + food-editorial track |
| `book-ahead` | every other draft — written by you in phase 4, never delegated |

Six drafters, all subagents; you draft none of them. Each gets: the scratchpad path, `shared.md`, its own section file, `reference/brief-template.html`, and **only the dossier files in its row above** — a country drafter has no use for reddit.md, and the dossier is read once per drafter, so scoping it is read time saved six times over.

Each drafter writes two files and returns neither as text:

- `draft/<NN>-<section>.html` — its section as a finished HTML fragment, following the template's markup conventions and the block under its own `── N. <SECTION>` marker. Numbered for render order: `10-things-to-do`, `20-food`, `30-events`, `40-where-to-stay`, `50-book-ahead`, `60-practical`, `70-country`.
- `decisions/<section>.md` — the final shortlist plus **the cut list**: every candidate consciously ruled out, with the reason as stated at the moment of the cut. These concatenate into `decisions.md` at publish, and they are the raw material `/travel-summary` audits after the trip; a cut without a recorded reason can't be learned from later.

It returns as text only: any research gap it hit, and any place needing a browser lookup it could not do itself.

**A drafter confirms what it can reach without the browser** — event dates and runs on official pages (events.md), fares (practical.md). Those are web fetches, not Maps, so they belong in the drafter rather than queued behind your serial browser work. Only Google ratings and closure checks come back to you.

**Gap-fill:** each section file names its mandatory coverage. If the dossier has nothing for a mandatory group, that is a failed search, not a thin city — the drafter reports it and you run that one missing query (browser first; it costs no budget). Never reopen general research from inside a section.

### 4. Cross-section pass — yours, never delegated

Read the fragments and fix them in place with targeted edits — never retype a section that already exists as a fragment.

- **Each place appears once in the whole brief.** A must-do museum sits in Things to do's Top picks, not Museums; a restaurant in exactly one food section; the blockbuster loan show in Events → Exhibitions, the permanent collection in Things to do.
- **Book ahead harvests the other drafts**: ticketed events flagged sellout-risk, restaurants and tours with booking friction found during drafting become its candidate rows (harvest rules and exclusions in reference/sections/book-ahead.md). You write `draft/50-book-ahead.html` and `decisions/book-ahead.md` yourself, in this pass.
- **Apply the no-trace rule** (shared.md → Be short) across the assembled brief — this is also the pass where its two write-anyway exceptions get written.

### 5. Verify — per section, as each draft lands

Ratings for every drafted place, **in the browser on Google Maps — never by web search**: open the Maps query URL (format in shared.md → Ratings and links) and read the page (`get_page_text`), which returns the live rating, count, price band, and — crucially — whether the place is **permanently closed**, catching dead venues editorial sources still list. Batch several lookups per `browser_batch` call (navigate → wait 2s → get_page_text, repeated); web search for ratings mostly surfaces banned aggregator numbers.

**Verify a section's places when its fragment lands, not in one pass at the end** — the browser is serial either way, so overlapping it with the drafters still running is free wall-clock. Write the ratings straight into the fragment. What this phase must never do is run *before* selection: verifying candidates you will cut is the main way runs blow their budget.

**Re-sort each group as you fill the ratings in.** Every list is sorted by rating descending, unrated last (shared.md → Ratings and links) — the drafter wrote its fragment before any rating existed and could not do it. A permanently-closed venue is cut here; a group the cut leaves short gets the Maps backstop (research.md → Maps category searches) before it is dropped heading-and-all.

### 6. Assemble, check, publish

Assembly is concatenation, not rewriting. Write `draft/00-shell.html` — the template through the end of `<header>`, with city, country, travel dates, research date, the weather line and the nav filled in (drop nav links for sections that came back empty) — and `draft/99-footer.html` (`</main></body></html>`). Then `cat draft/*.html` into the output path in glob order. The only content you generate at this phase is the header block.

Each section file carries its own checklist — the drafter runs it on its own section. Then run this cross-section list on the assembled page:

1. Each place appears once across the whole brief.
2. Every rating has a review count; none invented; every list sorted by rating descending, unrated last.
3. Every Things to do, Food, and Events entry carries all its source tags; every reddit tag links its thread; no aggregator-sourced entries or numbers.
4. Empty sections and groups deleted heading-and-all, no sentence noting the omission — except Book ahead's "nothing needs advance booking" line and source-availability callouts.
5. Years attached: every fare, award, GDP figure, funding total, and tipping norm.
6. Every section file's own checklist actually ran.

## Publishing

The brief publishes to the GitHub Pages site — never as a chat artifact, never as a loose HTML file handed to the user.

- Work in the publishing repo: `~/.claude/skills/travel-brief` is a symlink into it (`readlink` gives the real path; the repo root is its parent).
- Concatenate the fragments (phase 6) into `docs/briefs/<city-slug>-<YYYY-MM-DD>.html` (research date; append `-2` if the name is taken). **Every run is a new file** — never overwrite or update an existing brief; the index links each city to its latest brief and collapses older versions under a toggle.
- Append one entry to the `entries` array in `docs/manifest.json`: `{"type": "brief", "city": "<City>", "file": "briefs/<filename>", "trip": "<trip dates as printed in the brief header>", "published": "<YYYY-MM-DD>"}`. The index page renders itself from the manifest — do not edit `index.html`.
- Save the run record to `runs/<city-slug>-<YYYY-MM-DD>/`: copy the dossier files in **flat at the directory root, beside `decisions.md` — no `dossier/` subfolder** — and build `decisions.md` by concatenating `decisions/*.md` in section order — append any research gaps or source failures the drafters reported. This is what `/travel-summary` audits after the trip.
- Commit (`Add <City> travel brief <YYYY-MM-DD>`) and push. Confirm the push succeeded.
- Give the user two links: the brief at `https://wangfowen.github.io/travelplan/briefs/<filename>` and the index at `https://wangfowen.github.io/travelplan/` (Pages takes a minute or two to redeploy after the push).

## Output

One self-contained HTML page, following `reference/brief-template.html` — the template carries the page structure and rendering conventions (anchor nav, Maps links, rating badges, source tags, the Book-ahead table); the content rules live in shared.md and the section files.

- Title: `<City> — Travel Brief`. Header shows travel dates, research date, and one line of expected weather for the dates (typical high/low, rain likelihood, daylight — climate normals from own knowledge are fine, labeled per Accuracy rules).
- Readable on a phone; works in light and dark themes; no external requests — all CSS inline, nothing remote loaded (links out are fine).

After publishing, give a three-or-four-line chat summary: the single highest-value thing to book immediately, anything notable falling in their dates, and anything you could not confirm.
