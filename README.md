# travelplan

A personal trip-research system: two Claude Code skills and the GitHub Pages site they publish to.

**The site: https://wangfowen.github.io/travelplan** — one link per city to its latest guide. Once a post-trip guide exists it takes over as the city's link; briefs and older versions sit under a small toggle. Add it to your phone's home screen; that's the way in while traveling.

## The skills

- **`/travel-brief <city> <dates>`** — researches a destination against a fixed checklist and publishes a one-page brief as a new page on the site. Every run adds a new page and a manifest entry; old versions are never overwritten, so past research stays reachable.
- **`/travel-summary <city> + what you actually liked/didn't`** — after the trip: republishes the brief with dislikes silently removed and the traveler's own finds added, in the identical format (no "skip" notes, no commentary — it reads as a normal brief). The result becomes the city's main link on the index. Then it audits the original research run to propose improvements to `/travel-brief` — gated so only generalizable rules change, never city-specific patches.

## What a brief covers

| Section | Sources |
| --- | --- |
| Things to do | Reddit, Atlas Obscura, Claude's own picks (labeled separately) |
| Events & festivals | City tourism boards, local press, Reddit — only what falls in the travel dates |
| Food | Reddit, Eater, Michelin, World's 50 Best (global + regional, incl. Discovery), World of Mouth, plus unlisted local |
| Where to stay | Neighborhoods, with the tradeoff for each |
| Book ahead | Restaurants *and* tours/sites, with lead times and booking channel |
| Practical | Tap water, tipping, and getting around (transit vs. rides, with fares) |
| Country | GDP, economy, tech/startup scene, history, culture, languages, ~10 phrases |

Every entry in Things to do, Events and Food carries a source tag (`reddit`, `michelin`, `50 best`, `my pick`, etc.) so you can see where a recommendation came from.

## How a brief is researched

1. **Plan** — fill in the city-specific query slots (food formats, flagship venues, local press, local-language queries).
2. **Gather, once** — every source is queried a single time into one shared dossier of structured one-line entries. Gathering doesn't judge quality — criticism attaches to entries as evidence rather than deleting them — but it does compress: raw thread text never enters.
3. **Draft per section** — each section is written from the dossier using only its own selection bars, with no other section's rules in context. Cut candidates are recorded with their reasons.
4. **Cross-section pass** — dedupe so each place appears once brief-wide; harvest Book ahead from the other drafts.
5. **Verify** — ratings, closures, and event dates checked only for what survived drafting.
6. **Publish** — a new page under `docs/briefs/`, a manifest entry, a run record under `runs/`, commit, push.

## Requirements

- **Claude Code on a computer.** Not Claude chat, not mobile — the skills need subagents, git, and the browser, and refuse to run degraded.
- **Claude in Chrome connected** — a hard requirement for `/travel-brief`. Reddit (which blocks server-side fetches), Google Maps ratings and closure checks, and the Healthy-staples finder all run through the browser. The skill stops up front if the extension isn't there.
- **Web search enabled**, or there is nothing to research with.

## Layout

```
travel-brief/         the research skill
  SKILL.md            the pipeline: requirements, phases, publishing
  reference/
    shared.md         traveler profile, entry style, ratings, source tags, accuracy
    research.md       source mechanics, the consolidated query plan, dossier format
    brief-template.html
    sections/*.md     selection bars + checklist, one file per brief section
travel-summary/       the post-trip skill
  SKILL.md            trip guide rules, run audit, generalization gate
docs/                 the published site (GitHub Pages serves this from main)
  index.html          renders the guide list from manifest.json — never hand-edited per run
  manifest.json       one entry per published page
  briefs/             every brief, one file per run, all versions kept
  summaries/          traveler-tested trip guides
runs/                 per-run records: dossier + decisions.md + feedback.md; proposals.md is the running log of open candidates
```

## Installing

```sh
ln -sfn "$PWD/travel-brief"   ~/.claude/skills/travel-brief
ln -sfn "$PWD/travel-summary" ~/.claude/skills/travel-summary
```

Symlinked, so edits apply immediately — no build step.

## The feedback loop

`/travel-brief` saves what it found and why it cut what it cut (`runs/<city>-<date>/`: the dossier plus `decisions.md`). `/travel-summary` reads that record against real-trip feedback and classifies each item: hit confirmed, selection error, research gap, bad recommendation, or taste signal. Proposed skill edits must pass a generalization gate — statable without naming the city or venue, a named mechanism that changes behavior elsewhere, smallest possible edit, and recurrence across trips (each audit's full detail is written to that run's `feedback.md`; its candidate rules accumulate as sightings in `runs/proposals.md` until a pattern earns a rule, and leave that log once actioned; only traveler-profile updates can come from a single trip). Nothing is applied without approval.

## Editing

`travel-brief/SKILL.md` is the pipeline only. What gets researched lives in `reference/research.md`; how sources are weighted and cited in `reference/shared.md`; each section's selection bars in its file under `reference/sections/`. `reference/brief-template.html` is only the look and section order — adding or removing a section means changing both the section file and the template.
