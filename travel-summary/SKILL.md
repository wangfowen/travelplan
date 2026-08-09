---
name: travel-summary
description: After a trip, turn the city's travel brief plus the traveler's account of what they actually did, liked, and disliked into a shareable traveler-tested guide published on the GitHub Pages site — then audit the original research run's dossier and decisions to propose generalizable improvements to the travel-brief skill. Use when the user is back from a trip, shares likes/dislikes about places from a brief, or asks for a friend-ready version of a guide.
---

# Travel Summary

Two jobs, in order: **publish the friend-ready guide**, then **audit the run that produced the original brief** and turn the feedback into travel-brief improvements — but only ones that survive the generalization gate below.

Runs in Claude Code, in the publishing repo (`~/.claude/skills/travel-summary` is a symlink into it; the repo root is the symlink target's parent). No browser needed; connect Claude in Chrome only if the traveler's own discoveries need ratings verified — an unrated `trip find` entry is fine.

## Input

- **The city**, and which brief version if they name one — default to the latest `"type": "brief"` entry for that city in `docs/manifest.json`.
- **The traveler's account**, freeform: what they did, loved, didn't like, skipped, and found on their own. Ask only if it's missing entirely; don't interrogate for completeness — work with what's given and leave the rest untouched.

## Part 1 — the trip guide

The trip guide **is the brief, corrected by the trip** — not a new document. Start from the source brief's HTML in `docs/briefs/<file>` and keep everything identical: template, header, section order, source tags, rating badges, styling. A friend reading it sees a normal travel brief; nothing on the page announces that it was revised, and no trip commentary appears anywhere.

Exactly two content operations:

- **Remove what the traveler disliked or says to drop.** Removal is silent and total — no "skip" lines, no explanations, no strikethrough; the no-trace rule applies exactly as in travel-brief, including deleting a section's heading if the removals empty it.
- **Add what they liked that the brief lacked.** Their discoveries become full entries in the normal entry style (`../travel-brief/reference/shared.md` → How to write an entry: concrete fact first, the dish to order, Maps link; rating badge only if verified in the browser, omitted otherwise), placed in the section where they belong, tagged `trip find` in the same tag style the page already uses.

**The traveler's own verdict outranks the research — it rebuilds Top picks.** What they named is first-hand evidence; what the brief guessed is not. So after a trip, **Top picks becomes exactly what the traveler named**, in every section that has a Top picks group:

- **Everything they named is promoted into Top picks** — their discoveries and the existing entries they confirmed alike. Promotion *moves* an entry; it never appears in both Top picks and its category group.
- **Everything they didn't name is bumped out of Top picks**, down into the category group it belongs to — Creative and interesting, Everyday institutions, Museums, and so on. Being unmentioned is not a demerit and never a reason to delete: only an actual dislike removes an entry. These keep their tags and descriptions untouched; they just stop being top picks.
- Where a named item doesn't belong in Top picks at all (a day trip, which is never promoted), it goes to the top of its own group instead, above every unmentioned entry there.
- This overrides `shared.md`'s rating-descending sort: traveler-named entries first, rating-descending among themselves, then the rest rating-descending.
- A group emptied by promotion loses its heading under the no-trace rule; a group that gains bumped-down entries keeps them in rating order below any named ones.

Judge the traveler's Top picks on their say-so alone — don't re-apply travel-brief's selection bars to them, and don't keep a highly-rated unmentioned entry up top because it looks stronger on paper. If they named only two things in a section, Top picks has two entries; the "three to five" target does not apply to a list built from first-hand evidence.

Everything the traveler didn't mention stays byte-for-byte as it was. If their feedback includes a concrete tip about an entry that stays ("the thing to order is X", "go at opening"), fold it into that entry's description in normal entry voice — never as meta commentary; "we loved this" does not appear on the page.

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
