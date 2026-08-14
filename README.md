# travelplan

A personal trip-research system: two Claude Code skills and the GitHub Pages site they publish to.

**These are Claude Code skills, not a program.** There is nothing to `npm install` and no command to run in a shell. You install them by symlinking two directories into `~/.claude/skills/`, then type `/travel-brief` inside a Claude Code session. They need [Claude Code](https://claude.com/claude-code) on a computer and the [Claude in Chrome](https://claude.com/chrome) extension connected — see [Requirements](#requirements) and [Setup](#setup) before anything else.

**The site: https://wangfowen.github.io/travelplan** — one link per city to its latest guide. Once a post-trip guide exists it takes over as the city's link; briefs and older versions sit under a small toggle. Add it to your phone's home screen; that's the way in while traveling.

## The skills

- **`/travel-brief <city> <dates>`** — researches a destination against a fixed checklist and publishes a one-page brief as a new page on the site. Every run adds a new page and a manifest entry; old versions are never overwritten, so past research stays reachable.
- **`/travel-summary <city> + what you actually liked/didn't`** — after the trip: republishes the brief in the identical format (no "skip" notes, no commentary — it reads as a normal brief), keeping what you liked, silently dropping dislikes, adding your own finds, sorting the mediocre-but-still-worth-it below the rest, and carrying places you wanted but missed under a `didn't make it` tag. Recommendations are resolved against every published version of the city, newest first, so a place remembered from an older brief or a previous trip's guide is found and carried forward. The result becomes the city's main link on the index. Then it audits each rec against the run that actually produced the version it came from, to propose improvements to `/travel-brief` — gated so only generalizable rules change, never city-specific patches.

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
2. **Gather, once** — every source is queried a single time into one shared dossier of structured one-line entries, one file per track, each written by the subagent that researched it. Gathering doesn't judge quality — criticism attaches to entries as evidence rather than deleting them — but it does compress: raw thread text never enters.
3. **Draft per section** — one subagent per section, each writing its section from the dossier using only its own selection bars, with no other section's rules in context, straight out as an HTML fragment. Cut candidates are recorded with their reasons.
4. **Cross-section pass** — dedupe so each place appears once brief-wide; harvest Book ahead from the other drafts.
5. **Verify** — ratings and closures checked in the browser, only for what survived drafting (event dates and fares are confirmed by their own drafter).
6. **Publish** — the fragments concatenated into a new page under `docs/briefs/`, a manifest entry, a run record under `runs/`, commit, push.

Steps 3–5 pipeline rather than running as phases: a section starts drafting as soon as the tracks it depends on are written, and its ratings are looked up as soon as it lands. Only Things to do and Food wait on the full browser pass.

## Requirements

- **Claude Code on a computer.** Not Claude chat, not the mobile app, not the API — the skills need subagents, git, and the browser, and refuse to run degraded. Both skills are invoked from inside a Claude Code session (`/travel-brief …`), never from a shell.
- **Claude in Chrome connected** — a hard requirement for `/travel-brief`. Reddit (which blocks server-side fetches), Google Maps ratings and closure checks, and the Healthy-staples finder all run through the browser. The skill checks for the extension in phase 1 and stops there if it isn't connected. Chrome must be running, and the extension needs site permissions granted for at least `reddit.com` and `google.com`.
- **Web search enabled**, or there is nothing to research with.
- **A GitHub repo you can push to**, with Pages enabled — the skills publish by committing to `docs/` and pushing. See Setup.

## Setup

**Fork this repo rather than cloning it.** The skills publish by pushing to their own repo and then hand the traveler a URL, so a clone that still points at `wangfowen/travelplan` will either fail to push or publish into someone else's site.

1. **Fork on GitHub**, then clone your fork and `cd` into it.

2. **Point the skills at your site.** The publishing URL is written into `travel-brief/SKILL.md` (the intro line and the Publishing section). Replace it with your own Pages URL:

   ```sh
   grep -rl 'wangfowen.github.io/travelplan' travel-brief travel-summary \
     | xargs -I{} sed -i '' 's|wangfowen.github.io/travelplan|<you>.github.io/<repo>|g' {}
   ```

   (drop the `''` after `-i` on Linux).

3. **Enable GitHub Pages** — repo Settings → Pages → Source: *Deploy from a branch*, branch `main`, folder `/docs`. The published site is whatever is in `docs/` on `main`; there is no build step and no Action.

4. **Install the skills** — symlinked, so edits apply immediately:

   ```sh
   mkdir -p ~/.claude/skills
   ln -sfn "$PWD/travel-brief"   ~/.claude/skills/travel-brief
   ln -sfn "$PWD/travel-summary" ~/.claude/skills/travel-summary
   ```

   Run this from the repo root. Once symlinked the skills are available in *any* Claude Code session — they locate this repo by resolving the symlink, so you don't have to be in this directory to use them.

5. **Start clean** (optional, but your index will otherwise list my trips):

   ```sh
   rm -f docs/briefs/*.html docs/summaries/*.html
   rm -rf runs/*/
   printf '{\n  "entries": []\n}\n' > docs/manifest.json
   ```

   Keep `docs/index.html`. Keep `runs/calibration.md` and `runs/proposals.md` too — but delete the entries under their headings, since those tallies are my trips talking, and the feedback loop will weigh your first trips against them otherwise.

6. **Make the traveler profile yours.** `travel-brief/reference/shared.md` opens with one specific traveler's taste, and every section file under `reference/sections/` carries selection bars written against it. That profile is not decoration — it decides what gets included and what gets cut. Edit it to describe yourself, or the briefs will be tuned to me.

Then, in Claude Code: `/travel-brief Lisbon Aug 10–15` — or just name a city and it will ask for the dates.

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

## The feedback loop

`/travel-brief` saves what it found and why it cut what it cut (`runs/<city>-<date>/`: the dossier plus `decisions.md`). `/travel-summary` reads that record against real-trip feedback and classifies each item: hit confirmed, selection error, research gap, bad recommendation, or taste signal. Proposed skill edits must pass a generalization gate — statable without naming the city or venue, a named mechanism that changes behavior elsewhere, smallest possible edit, and recurrence across trips (each audit's full detail is written to that run's `feedback.md`; its candidate rules accumulate as sightings in `runs/proposals.md` until a pattern earns a rule, and leave that log once actioned; only traveler-profile updates can come from a single trip). Nothing is applied without approval.

## Editing

`travel-brief/SKILL.md` is the pipeline only. What gets researched lives in `reference/research.md`; how sources are weighted and cited in `reference/shared.md`; each section's selection bars in its file under `reference/sections/`. `reference/brief-template.html` is only the look and section order — adding or removing a section means changing both the section file and the template.
