---
name: travel-summary
description: After a trip, turn the city's travel brief plus the traveler's account of what they actually did, liked, and disliked into a shareable guide of the places they personally recommend, published on the GitHub Pages site — then audit the original research run's dossier and decisions to propose generalizable improvements to the travel-brief skill. Use when the user is back from a trip, shares likes/dislikes about places from a brief, or asks for a friend-ready version of a guide.
---

# Travel Summary

Two jobs, in order: **publish the friend-ready guide**, then **audit the run that produced the original brief** and turn the feedback into travel-brief improvements — but only ones that survive the generalization gate below.

Runs in Claude Code, in the publishing repo (`~/.claude/skills/travel-summary` is a symlink into it; the repo root is the symlink target's parent). No browser needed; connect Claude in Chrome only if the traveler's own discoveries need ratings verified — an unrated `trip find` entry is fine.

## Input

- **The city**, and which brief version if they name one — default to the latest `"type": "brief"` entry for that city in `docs/manifest.json`.
- **The traveler's account**, freeform: what they did, loved, didn't like, skipped, and found on their own. Ask only if it's missing entirely; don't interrogate for completeness — work with what's given. What they name is what the guide is built from, so a short account makes a short guide, and that is the correct outcome, not a gap to fill.

## Part 1 — the trip guide

The trip guide is **what the traveler recommends to others**, wearing the brief's clothes. Start from the source brief's HTML in `docs/briefs/<file>` and keep the presentation identical: template, header, section order, entry style, source tags, rating badges, styling. A friend reading it sees a normal travel brief; nothing on the page announces that it was revised, and no trip commentary appears anywhere. The brief itself stays published and reachable under the index's older-versions toggle — that is where recommendations sourced from research alone live on, so the guide never has to carry them.

**Things to do, Events and Food carry only what the traveler vouched for.** In those three sections, every entry is either something they named liking or something they found themselves:

- **Keep what they named.** Entries the brief already had and they confirmed stay exactly as written.
- **Add what they found.** Their own discoveries become full entries in the normal entry style (`../travel-brief/reference/shared.md` → How to write an entry: concrete fact first, the dish to order, Maps link; rating badge only if verified in the browser, omitted otherwise), placed in the group where they belong, tagged `trip find` in the same tag style the page already uses.
- **Delete everything else** — what they disliked and what they simply never mentioned alike. Removal is silent and total: no "skip" lines, no explanations, no strikethrough, and the no-trace rule applies exactly as in travel-brief. Being unmentioned is not a verdict against an entry; it is only an absence of first-hand evidence, and the brief keeps it.
- **A section left with nothing is deleted** — heading, groups, and its link in the header nav. Food is the one section that survives an empty venue list, because Local dishes to try stays (below).

**A trip guide has no Top picks group.** Every entry on the page is a top pick now, so the heading distinguishes nothing: drop it from Things to do and Food, and file each surviving entry in the category group it belongs to by that group's own definition — the group it would have sat in had the brief never promoted it (`../travel-brief/reference/sections/things-to-do.md` and `food.md` → Structure). Each entry still appears exactly once. Groups sort rating-descending per `shared.md`, with no traveler-first ordering layered on top: everything left is traveler-chosen. A group nothing lands in is gone heading-and-all. Day trips is unaffected — it was never a Top picks feeder.

**Every other section stays as researched**, edited only where the traveler said something about it:

- **Where to stay** — keep the researched neighborhoods; drop one they disliked, add one they would recommend, fold in a concrete thing they learned about one that stays. Silence leaves the section untouched.
- **Book ahead** — same rule: keep the researched list, drop what they disliked, add what they wish they had booked. Every line must stand on its own, so a line whose venue no longer has an entry on the page carries its own name, link and lead time rather than pointing at a deleted one.
- **Local dishes to try** — the city's dish canon, not a recommendation list. It stays whole and keeps opening Food. A `Where:` pointer may name a venue that no longer has an entry; that is fine — it is a place to eat the dish, not an endorsement of the venue.
- **Practical and the country section** stay as they are.

Judge inclusion on the traveler's say-so alone — don't re-apply travel-brief's selection bars to what they named, and don't keep a highly-rated entry because it looks stronger on paper than what they chose. The "three to five per group" target does not apply to a page built from first-hand evidence: if they named two restaurants, Food has two restaurants.

If their feedback includes a concrete tip about an entry that stays ("the thing to order is X", "go at opening"), fold it into that entry's description in normal entry voice — never as meta commentary; "we loved this" does not appear on the page.

Publish, same mechanics as travel-brief: write `docs/summaries/<city-slug>-<YYYY-MM-DD>.html`, append `{"type": "summary", "city": "<City>", "file": "summaries/<filename>", "trip": "<trip dates>", "published": "<YYYY-MM-DD>"}` to `docs/manifest.json`, commit (`Add <City> trip guide`), push, and give the live URL. The index automatically makes the newest trip guide the city's main link, demoting the brief to the older-versions toggle — no index edit needed. The page is public, built for sending to friends.

## Part 2 — the audit

Load the run record for the source brief: `runs/<city-slug>-<date>/` (dossier files + `decisions.md`). If no record exists (briefs published before records existed), say so and audit against the brief alone, flagging the reduced confidence.

Classify every piece of feedback by where the pipeline went right or wrong:

1. **Hit confirmed** — they liked it, the brief had it. Record which sources called it: this is calibration data about which tags to trust.
2. **Selection error** — they liked it, the dossier had it, the brief cut it. `decisions.md` has the stated reason; that reason is the defect to examine.
3. **Research gap** — they liked it and it never entered the dossier. Name the query or source that should have surfaced it.
4. **Bad recommendation** — the brief recommended it, they disliked it. Name what endorsed it and what was over-weighted; separate "the place was bad" from "the description oversold it" — those are different defects.
5. **Taste signal** — feedback about the traveler, not the research ("too many museums", "we never used transit").

Anything that fits none of these is noise — a kitchen's off night, weather, luck. Log it, change nothing.

**An entry cut from the guide for silence is not feedback.** Part 1 drops everything the traveler didn't name, but only an actual dislike is a bad recommendation — the rest went unvisited, unnoticed, or unmentioned, which says nothing about the research. Never classify an unmentioned entry as a defect, and never count the guide's shrinkage as evidence about the brief.

## The generalization gate

Feedback comes from one city; the skill runs on every city. The failure mode to guard against is patching travel-brief so it would have aced this one trip. **Every proposed change must pass all of:**

- **City-swap test.** The change must be statable without naming this city, any venue, or any this-city fact. "Weight flat namings in local-language threads over editorial curiosity pieces" passes; "trust Reddit more about grill houses in the Baltics" does not. If it can't be stated generally, it is not a rule — it's a log entry.
- **Mechanism test.** Name the general mechanism that failed and how the edit changes behavior in a *different* city next run. An edit that only re-ranks this city's candidates has no mechanism.
- **Smallest-edit test.** Tighten, loosen, or reweigh an existing bar before adding a new rule. Never add exceptions, venue names, or per-city carve-outs to any travel-brief file.
- **Recurrence test.** One-trip evidence goes to the run record's `feedback.md` and its candidate rule to `runs/proposals.md` (see "Recording the audit") — not into the skill. Propose an actual edit only when (a) a proposals.md candidate has sightings from two or more trips, or (b) the failure is mechanical rather than taste: a mandatory query that never ran, a source misread, a cut reason that violates the skill's own written rules.
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

- **The run record: `runs/<city-slug>-<date>/feedback.md`** — the full audit: every classification with its evidence, the candidate rules including ones that failed the gate and why, and every proposal put to the user with its outcome (applied or declined). Written once per audited trip, like the dossier, into the source brief's run-record directory (create the directory if the brief predates run records). This is the permanent history; it is never trimmed.
- **`runs/proposals.md`** — open, actionable candidates only: each a generally-phrased candidate rule naming the file it would edit, with one sighting line per trip (city, audit date, one-line evidence pointing at that run's feedback.md). When a new audit re-observes an existing candidate, add a sighting rather than a new entry — two or more sightings is what ripens it under the recurrence test. **Remove an entry the moment it is actioned** — applied or declined — so the file only ever lists things waiting to happen; the per-run files keep the record of what was done. This file stays short enough to read at the start of every audit: do read it, so recurring patterns are recognized instead of re-logged from scratch.
