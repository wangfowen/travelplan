---
name: travel-summary
description: After a trip, turn the city's travel brief plus the traveler's account of what they liked, disliked, found mediocre, and wanted but never reached into a shareable guide of the places they personally recommend, published on the GitHub Pages site — then audit the dossier and decisions of the research run behind each version they used, to propose generalizable improvements to the travel-brief skill. Use when the user is back from a trip, rates places from a brief as liked/disliked/mediocre or names ones they wanted but did not reach, or asks for a friend-ready version of a guide.
---

# Travel Summary

Two jobs, in order: **publish the friend-ready guide**, then **audit the run that produced the original brief** and turn the feedback into travel-brief improvements — but only ones that survive the generalization gate below.

Runs in Claude Code, in the publishing repo (`~/.claude/skills/travel-summary` is a symlink into it; the repo root is the symlink target's parent). No browser needed; connect Claude in Chrome only if the traveler's own discoveries need ratings verified — an unrated `trip find` entry is fine.

## Input

- **The city.** A city can have several published pages — earlier briefs, earlier trip guides — and the traveler may be recommending things they read in any of them, not only the newest. List every `docs/manifest.json` entry for the city up front, newest first. **That set, not a single file, is what the account gets resolved against.**
- **The base version** — the page whose researched sections the new guide inherits: the latest `"type": "brief"` entry for the city, or whichever version the user names.
- **The traveler's account**, freeform, in four registers — **liked**, **disliked**, **mediocre**, **want to go** (wanted it, didn't get there) — plus whatever they found on their own. They may not label them; read the account for which register each place falls in, and ask only where one is genuinely ambiguous, since liked and mediocre are treated differently on the page and in the audit. Ask for the account itself only if it is missing entirely; don't interrogate for completeness — work with what's given. What they name is what the guide is built from, so a short account makes a short guide, and that is the correct outcome, not a gap to fill.

## Part 1 — the trip guide

The trip guide is **what the traveler recommends to others**, wearing the brief's clothes. Start from the base version's HTML (`docs/briefs/<file>`, or `docs/summaries/<file>` if the user named a trip guide) and keep the presentation identical: template, header, section order, entry style, source tags, rating badges, styling. A friend reading it sees a normal travel brief; nothing on the page announces that it was revised, and no trip commentary appears anywhere. The two provenance tags — `trip find` and `didn't make it` — are the only marks of the trip on the page, and they are tags in the existing style, not notes. The brief itself stays published and reachable under the index's older-versions toggle — that is where recommendations sourced from research alone live on, so the guide never has to carry them.

**Things to do, Events and Food carry only what the traveler named.** In those three sections, every entry traces to one of the three surviving registers — liked, mediocre, want to go — or to something they found themselves:

- **Liked — keep it, from whichever version has it.** Resolve every place they name against the city's published pages, **newest first**, and take the entry as written in the first page that has it: it moves onto the new guide unchanged, keeping its description, tags and rating badge. An entry pulled forward from an older version is not re-verified — its rating is the one that run confirmed, and the guide's header carries its own research date. Only a place that appears in none of them is a trip find. **Note which version each entry resolved to** — Part 2 audits it against that version's run, and re-deriving the mapping later from a finished page is guesswork.
- **Add what they found.** Their own discoveries become full entries in the normal entry style (`../travel-brief/reference/shared.md` → How to write an entry: concrete fact first, the dish to order, Maps link; rating badge only if verified in the browser, omitted otherwise), placed in the group where they belong, tagged `trip find` in the same tag style the page already uses.
- **Mediocre — decide one at a time, on what was mediocre about it.** If the flat part was incidental to why the entry exists — one dish off, a slow night, a room they disliked — the place keeps its spot. If the flat part *is* why the entry exists — the food at a restaurant, the view at a viewpoint, the collection at a museum — cut it: a friend sent there gets precisely the experience the traveler shrugged at. This is the same read travel-brief applies to a local knocking an institution (`food.md` → Weighing the evidence): judge the specific complaint, not the temperature of it. When it stays, fold the concrete half of the reservation into the description in normal entry voice ("the grilled plates carry it, the stews don't") — never a "was just OK" note. **Mediocre carries no tag; keeping it is the recommendation**, and its position in the group is the only signal (sorting below).
- **Want to go — carried, and marked `didn't make it`.** A place they wanted and didn't reach stays on the page, tagged `didn't make it` in the same tag style as `trip find`, keeping its researched description, source tags and rating. One that appears in no version gets a full entry written in the normal entry style, tagged `didn't make it` **alone** — `trip find` means they went. The tag is the entire disclosure: the description still reads as a normal entry, with no hedging language layered on top.
- **Delete what they disliked, and everything they never mentioned.** Removal is silent and total: no "skip" lines, no explanations, no strikethrough, and the no-trace rule applies exactly as in travel-brief. Being unmentioned is not a verdict against an entry; it is only an absence of first-hand evidence, and the brief keeps it.
- **A section left with nothing is deleted** — heading, groups, and its link in the header nav. Food is the one section that survives an empty venue list, because Local dishes to try stays (below).

**A trip guide has no Top picks group.** Every entry on the page is there because the traveler named it, so a Top picks heading distinguishes nothing — the tier sort below carries what ranking the page has: drop it from Things to do and Food, and file each surviving entry in the category group it belongs to by that group's own definition — the group it would have sat in had the brief never promoted it (`../travel-brief/reference/sections/things-to-do.md` and `food.md` → Structure). Each entry still appears exactly once.

**Groups sort in three tiers — liked, then want-to-go, then mediocre** — rating-descending inside each tier per `shared.md`, unrated last. The order is the guide's confidence signal: a place they went to and shrugged at is the weakest thing on the page, while an untested entry is unknown rather than disappointing. Trip finds sort with liked; nothing else is layered on top, since within a tier everything is equally traveler-chosen. A group nothing lands in is gone heading-and-all. Day trips is unaffected — it was never a Top picks feeder.

**Every other section stays as researched**, edited only where the traveler said something about it:

- **Where to stay** — keep the researched neighborhoods; drop one they disliked, add one they would recommend, fold in a concrete thing they learned about one that stays. Silence leaves the section untouched.
- **Book ahead** — same rule: keep the researched list, drop what they disliked, add what they wish they had booked. Every line must stand on its own, so a line whose venue no longer has an entry on the page carries its own name, link and lead time rather than pointing at a deleted one.
- **Local dishes to try** — the city's dish canon, not a recommendation list. It stays whole and keeps opening Food. A `Where:` pointer may name a venue that no longer has an entry; that is fine — it is a place to eat the dish, not an endorsement of the venue.
- **Practical and the country section** stay as they are.

Judge inclusion on the traveler's say-so alone — don't re-apply travel-brief's selection bars to what they named, and don't keep a highly-rated entry because it looks stronger on paper than what they chose. The one judgment call on the page is the mediocre keep-or-cut above, and it is made on what they said about the place, never on the brief's bars: a mediocre verdict outranks every rating and tag stacked behind the entry. The "three to five per group" target does not apply to a page built from first-hand evidence: if they named two restaurants, Food has two restaurants.

If their feedback includes a concrete tip about an entry that stays ("the thing to order is X", "go at opening"), fold it into that entry's description in normal entry voice — never as meta commentary; "we loved this" does not appear on the page.

Publish, same mechanics as travel-brief: write `docs/summaries/<city-slug>-<YYYY-MM-DD>.html`, append `{"type": "summary", "city": "<City>", "file": "summaries/<filename>", "trip": "<trip dates>", "published": "<YYYY-MM-DD>"}` to `docs/manifest.json`, commit (`Add <City> trip guide`), push, and give the live URL. The index automatically makes the newest trip guide the city's main link, demoting the brief to the older-versions toggle — no index edit needed. The page is public, built for sending to friends.

## Part 2 — the audit

**Audit each item against the run behind the version it came from** — the one Part 1 resolved it to, not the base version by default. Load that run's record: `runs/<city-slug>-<date>/` at that version's research date (dossier files + `decisions.md`). Several versions in play means several run records open at once, and a rec judged against a run that never contained it manufactures a research gap that never happened — the query may have run perfectly in the version they actually read.

A **trip find** came from no version, so it is audited against the **base version's** run — the newest research, and the one that had the best chance to surface it.

If no record exists for a version (published before run records existed), say so and audit its items against that page alone, flagging the reduced confidence.

Classify every piece of feedback by where the pipeline went right or wrong:

1. **Hit confirmed** — they liked it, the version they read had it. Record which sources called it: this is calibration data about which tags to trust.
2. **Selection error** — they liked it, that run's dossier had it, its brief cut it. `decisions.md` has the stated reason; that reason is the defect to examine.
3. **Research gap** — they liked it and it never entered that run's dossier. Name the query or source that should have surfaced it.
4. **Bad recommendation** — the version they read recommended it, they disliked it **or found it mediocre**. Name what endorsed it and what was over-weighted; separate "the place was bad" from "the description oversold it" — those are different defects. **Mediocre is the same class at lower amplitude and is often the more diagnostic of the two**, so record what specifically fell flat rather than the verdict: "the food is forgettable" indicts the sources that named it, "fine, but a 40-minute wait nobody mentioned" indicts the description, and "good, just not worth the trip across town" indicts the promotion into Top picks. A mediocre verdict on a place several sources stacked behind is the strongest calibration signal an audit produces. This holds whether the entry was kept on the guide or cut — the keep decision is about whether a friend should go, not about whether the research erred.
5. **Taste signal** — feedback about the traveler, not the research ("too many museums", "we never used transit").

Anything that fits none of these is noise — a kitchen's off night, weather, luck. Log it, change nothing.

**Where the versions disagree, the disagreement is the finding.** Classify against the run the rec came from, then check the other runs before writing it up:

- **Present in one run's dossier, absent from another's** — a selection error in the run that had it and cut it, a research gap in the run that never found it. The second is usually the more useful finding: the same query plan surfaced the place once and missed it once, so name what differed rather than logging it as a plain gap.
- **In an older version, dropped from a newer one** — the newer run either cut it consciously (its `decisions.md` has the reason, and that reason is now contradicted by first-hand evidence: a selection error) or never resurfaced it (a research gap in the newer run). Check which; they are different defects.
- **Traced to a prior trip guide's `trip find`** — no research provenance at all: a previous trip put it on the page, no dossier ever held it. Not a hit confirmed, and not a research gap on its own. It becomes one only if a later brief's research should have picked the place up by then and didn't — which, with the venue named in the city's own published guide, is worth checking.

**A `want to go` entry is not evidence about the research.** They never went, so it can be neither a hit confirmed nor a bad recommendation, and carrying it onto the guide is not a vote. What it does carry is a **taste signal**: the description was good enough to make them want the place, and the trip was not long enough to hold it. Several want-to-gos landing in the same group across trips says that section runs longer than a trip can absorb — a length finding, not a selection one, and the only kind of proposal this register should ever produce.

**An entry cut from the guide for silence is not feedback.** Part 1 drops everything the traveler didn't name, but only an actual dislike is a bad recommendation — the rest went unvisited, unnoticed, or unmentioned, which says nothing about the research. Never classify an unmentioned entry as a defect, and never count the guide's shrinkage as evidence about the brief.

## The generalization gate

Feedback comes from one city; the skill runs on every city. The failure mode to guard against is patching travel-brief so it would have aced this one trip. **Every proposed change must pass all of:**

- **City-swap test.** The change must be statable without naming this city, any venue, or any this-city fact. "Weight flat namings in local-language threads over editorial curiosity pieces" passes; "trust Reddit more about grill houses in the Baltics" does not. If it can't be stated generally, it is not a rule — it's a log entry.
- **Mechanism test.** Name the general mechanism that failed and how the edit changes behavior in a *different* city next run. An edit that only re-ranks this city's candidates has no mechanism.
- **Smallest-edit test.** Tighten, loosen, or reweigh an existing bar before adding a new rule. Never add exceptions, venue names, or per-city carve-outs to any travel-brief file.
- **Recurrence test.** One-trip evidence goes to the run record's `feedback.md` and its candidate rule to `runs/proposals.md` (see "Recording the audit") — not into the skill. Propose an actual edit only when (a) a proposals.md candidate has sightings from two or more trips, or (b) the failure is mechanical rather than taste: a mandatory query that never ran, a source misread, a cut reason that violates the skill's own written rules. **The same defect seen in two runs of one city is one sighting, not two** — recurrence means two *trips*, and a city whose runs share a query plan will repeat its own misses. Log the repeat inside the single sighting line; it is evidence the miss was systematic, not evidence it generalizes.
- **Exception — the traveler profile.** `shared.md`'s profile describes the user, not cities, so a strong single-trip taste signal may update it directly — still phrased generally ("standing counters beat table service", never a venue name). The profile holds one orientation line per domain; if the signal is really a section-specific bar, it goes in that section's file instead.

## Where an approved edit lands

Every rule in travel-brief has exactly **one canonical home**, and an approved change edits that home — never restated in a second file. The homes:

- **Cross-section content rules** (entry style, ratings display, source-tag vocabulary, shortlist discipline, accuracy) → `reference/shared.md`.
- **One section's bars, structure, or mandatory coverage** → that section's file under `reference/sections/`. A checklist mirror of the rule goes only in the file whose pass enforces it.
- **Research mechanics, query plans, dossier format, budget** → `reference/research.md`.
- **Pipeline order, phase instructions, publishing** → `SKILL.md` — which points at reference files rather than restating them.
- **`reference/brief-template.html`** holds markup and rendering conventions only. Never write a selection bar, query, or content rule into a template comment — if a change needs new markup, the comment names the section file that owns the rule.

A rule two sections genuinely share (a handshake, like Events flagging sellout-risk for Book ahead) is stated in the file that owns it and referenced by a one-clause pointer from the other. Before writing any edit, search `travel-brief/` for existing statements of the same rule and update or point to them; if a proposed change touches more than its canonical home plus at most one checklist and one pointer, it is being sprayed — the extra copies are what drift out of sync later.

## Applying changes

**No file under `travel-brief/` is ever edited without the user confirming that specific change first.** This is a hard gate, not a courtesy: the whole failure mode this skill guards against is over-fitting the brief skill to one trip, and the user is the check on that. It applies to every travel-brief file including `shared.md`'s traveler profile, and it holds however obvious, small, or mechanical the change looks — a one-word tightening still gets asked. Never bundle an unapproved edit in with an approved one, and never treat silence, a general "sounds good", or approval of a *different* proposal as consent.

Present each surviving proposal as: classification → evidence (quote the dossier or decisions.md line) → the exact diff, in the rule's canonical home per "Where an approved edit lands" → what behaves differently on a future city. Then stop and ask. Apply only the proposals the user explicitly accepts; drop the rest without argument.

Publishing the trip guide is not gated this way — Part 1 proceeds on its own. Only travel-brief edits wait.

## Recording the audit

Two files, committed with the trip guide — one permanent per trip, one running and always current:

- **The run record: `runs/<city-slug>-<date>/feedback.md`** — the full audit: every classification with its evidence, the candidate rules including ones that failed the gate and why, and every proposal put to the user with its outcome (applied or declined). **One trip, one file**, even when its items were judged against several runs: it goes in the **base version's** run-record directory (create it if that version predates run records), and each classification names the run it was judged against — otherwise a later audit reading it can't tell which dossier a verdict was measured against. This is the permanent history; it is never trimmed.
- **`runs/proposals.md`** — open, actionable candidates only: each a generally-phrased candidate rule naming the file it would edit, with one sighting line per trip (city, audit date, one-line evidence pointing at that run's feedback.md). When a new audit re-observes an existing candidate, add a sighting rather than a new entry — two or more sightings is what ripens it under the recurrence test. **Remove an entry the moment it is actioned** — applied or declined — so the file only ever lists things waiting to happen; the per-run files keep the record of what was done. This file stays short enough to read at the start of every audit: do read it, so recurring patterns are recognized instead of re-logged from scratch.
