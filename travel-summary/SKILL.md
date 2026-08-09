---
name: travel-summary
description: After a trip, turn the city's travel brief plus the traveler's account of what they actually did, liked, and disliked into a shareable traveler-tested guide published on the GitHub Pages site — then audit the original research run's dossier and decisions to propose generalizable improvements to the travel-brief skill. Use when the user is back from a trip, shares likes/dislikes about places from a brief, or asks for a friend-ready version of a guide.
---

# Travel Summary

Two jobs, in order: **publish the friend-ready guide**, then **audit the run that produced the original brief** and turn the feedback into travel-brief improvements — but only ones that survive the generalization gate below.

Runs in Claude Code, in the publishing repo (`~/.claude/skills/travel-summary` is a symlink into it; the repo root is the symlink target's parent). No browser needed; connect Claude in Chrome only if the traveler's own discoveries need ratings verified — an unrated `field find` entry is fine.

## Input

- **The city**, and which brief version if they name one — default to the latest `"type": "brief"` entry for that city in `docs/manifest.json`.
- **The traveler's account**, freeform: what they did, loved, didn't like, skipped, and found on their own. Ask only if it's missing entirely; don't interrogate for completeness — work with what's given and leave the rest untouched.

## Part 1 — the trip guide

Read the source brief from `docs/briefs/<file>`. Build a new page in the same template family (`../travel-brief/reference/brief-template.html`), titled `<City> — Trip Guide`, header line "traveler-tested · <month year> · based on the <date> brief". This page is for friends: what to actually do, from someone who went.

Editorial rules — the brief's entry style (concrete facts, no endorsement adjectives; `../travel-brief/reference/shared.md` → How to write an entry) still applies:

- **Endorsed entries** stay, with the traveler's verdict folded in as the lead. Their one-liner ("get the cold beet soup, skip the dumplings") outranks the researched description — compress the original entry to make room for it.
- **Their own discoveries** become full entries tagged `field find` — the only tag on this page; research source tags come off, since the endorsement is now the traveler, not the sources. Maps link always; rating only if verified.
- **Disliked recommendations are cut.** If the place is famous enough that a friend would find it anyway, keep a single "skip" line with the traveler's actual reason — otherwise it vanishes without trace.
- **Untried entries drop** by default. Keep a short "researched, untested" list only if the traveler asks for it.
- **Events and Book ahead drop entirely** — they were date-bound to a trip that already happened. Practical basics and phrases stay, corrected by anything the trip taught ("card worked everywhere", "buses stopped earlier than posted"). Country background trims to Culture unless asked.

Publish, same mechanics as travel-brief: write `docs/summaries/<city-slug>-<YYYY-MM-DD>.html`, append `{"type": "summary", "city": "<City>", "file": "summaries/<filename>", "trip": "<trip dates>", "published": "<YYYY-MM-DD>"}` to `docs/manifest.json`, commit (`Add <City> trip guide`), push, and give the live URL — the page is public, built for sending to friends.

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
