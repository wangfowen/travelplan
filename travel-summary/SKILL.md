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
- **Recurrence test.** One-trip evidence goes to `runs/feedback-log.md` (date, city, classification, observation, candidate rule) — not into the skill. Propose an actual edit only when (a) the log shows the same pattern across two or more trips, or (b) the failure is mechanical rather than taste: a mandatory query that never ran, a source misread, a cut reason that violates the skill's own written rules.
- **Exception — the traveler profile.** `shared.md`'s profile describes the user, not cities, so a strong single-trip taste signal may update it directly — still phrased generally ("standing counters beat table service", never a venue name).

## Applying changes

Never edit travel-brief silently. Present each surviving proposal as: classification → evidence (quote the dossier or decisions.md line) → the exact diff → what behaves differently on a future city. Apply only what the user approves. Either way, append the full audit — including proposals that failed the gate and why — to `runs/feedback-log.md`, and commit it with the trip guide: the log is how one-off observations accumulate into patterns that eventually earn a rule.
