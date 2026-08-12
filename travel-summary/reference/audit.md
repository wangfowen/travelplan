# The audit

Read `runs/proposals.md` before classifying anything, so recurring patterns are recognized instead of re-logged from scratch.

**Audit each item against the run behind the version it came from** — the one the resolution map says, not the base version by default. Load that run's record: `runs/<city-slug>-<date>/` at that version's research date (dossier files + `decisions.md`). Several versions in play means several run records open at once, and a rec judged against a run that never contained it manufactures a research gap that never happened — the query may have run perfectly in the version they actually read.

A **trip find** came from no version, so it is audited against the **base version's** run — the newest research, and the one that had the best chance to surface it.

If no record exists for a version (published before run records existed), say so and audit its items against that page alone. Label every gap-or-selection classification from such a version **"gap-or-cut ambiguous"** — without a dossier it cannot be told whether the item never surfaced or surfaced and was cut — and count those sightings at reduced weight toward the recurrence test.

## Classification

Classify every piece of feedback by where the pipeline went right or wrong:

1. **Hit confirmed** — they liked it, the version they read had it. Record which sources called it: this is calibration data about which tags to trust, and it goes to `runs/calibration.md` (Recording, below).
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

**An entry cut from the guide for silence is not feedback.** The guide drops everything the traveler didn't name, but only an actual dislike is a bad recommendation — the rest went unvisited, unnoticed, or unmentioned, which says nothing about the research. Never classify an unmentioned entry as a defect, and never count the guide's shrinkage as evidence about the brief.

## The generalization gate

Feedback comes from one city; the skill runs on every city. The failure mode to guard against is patching travel-brief so it would have aced this one trip. **Every proposed change must pass all of:**

- **City-swap test.** The change must be statable without naming this city, any venue, or any this-city fact. "Weight flat namings in local-language threads over editorial curiosity pieces" passes; "trust Reddit more about grill houses in the Baltics" does not. If it can't be stated generally, it is not a rule — it's a log entry.
- **Mechanism test.** Name the general mechanism that failed and how the edit changes behavior in a *different* city next run. An edit that only re-ranks this city's candidates has no mechanism.
- **Smallest-edit test.** Tighten, loosen, or reweigh an existing bar before adding a new rule. Never add exceptions, venue names, or per-city carve-outs to any travel-brief file.
- **Recurrence test.** One-trip evidence is logged (Recording, below), not applied. Propose an actual edit only when (a) a `proposals.md` candidate has sightings from two or more trips, or (b) the failure is mechanical rather than taste: a mandatory query that never ran, a source misread, a cut reason that violates the skill's own written rules. **The same defect seen in two runs of one city is one sighting, not two** — recurrence means two *trips*, and a city whose runs share a query plan will repeat its own misses. Log the repeat inside the single sighting line; it is evidence the miss was systematic, not evidence it generalizes.
- **Exception — the traveler profile.** `shared.md`'s profile describes the user, not cities, so a strong single-trip taste signal may update it directly — still phrased generally ("standing counters beat table service", never a venue name). The profile holds one orientation line per domain; if the signal is really a section-specific bar, it goes in that section's file instead.

## Where an approved edit lands

Every rule in travel-brief has exactly **one canonical home**, and an approved change edits that home — never restated in a second file. The homes:

- **Cross-section content rules** (entry style, ratings display, source-tag vocabulary, shortlist discipline, accuracy) → `reference/shared.md`.
- **One section's bars, structure, or mandatory coverage** → that section's file under `reference/sections/`. A checklist mirror of the rule goes only in the file whose pass enforces it.
- **Research mechanics, query plans, dossier format, budget** → `reference/research.md`.
- **Pipeline order, phase instructions, publishing** → `SKILL.md` — which points at reference files rather than restating them.
- **`reference/brief-template.html`** holds markup and rendering conventions only. Never write a selection bar, query, or content rule into a template comment — if a change needs new markup, the comment names the section file that owns the rule.

A rule two sections genuinely share (a handshake, like Events flagging sellout-risk for Book ahead) is stated in the file that owns it and referenced by a one-clause pointer from the other. Before writing any edit, search `travel-brief/` for existing statements of the same rule and update or point to them; if a proposed change touches more than its canonical home plus at most one checklist and one pointer, it is being sprayed — the extra copies are what drift out of sync later.

## Presenting proposals

Present each surviving proposal as: classification → evidence (quote the dossier or decisions.md line) → the exact diff, in the rule's canonical home per above → what behaves differently on a future city. Then stop and ask — the hard gate on travel-brief edits is in `SKILL.md` step 4.

## Recording the audit

Three files, committed together in the audit commit — one permanent per trip, two running and always current:

- **The run record: `runs/<city-slug>-<date>/feedback.md`** — opens with the resolution map and any version-confidence caveats, then the full audit: every classification with its evidence, the candidate rules including ones that failed the gate and why, and every proposal put to the user with its outcome. **One trip, one file**, even when its items were judged against several runs: it goes in the **base version's** run-record directory (create it if that version predates run records), and each classification names the run it was judged against — otherwise a later audit reading it can't tell which dossier a verdict was measured against. This is the permanent history; it is never trimmed.
- **`runs/proposals.md`** — the working queue, short enough to read at the start of every audit, in three sections:
  - **Awaiting recurrence** — open candidates only: each a generally-phrased candidate rule naming the file it would edit, with one sighting line per trip (city, audit date, one-line evidence pointing at that run's feedback.md). When a new audit re-observes an existing candidate, add a sighting rather than a new entry — two or more sightings is what ripens it under the recurrence test. An **applied** candidate is removed outright; the per-run files keep the record of what was done.
  - **Offered and declined** — standing candidates the user turned down, kept so a second sighting triggers a re-offer rather than a fresh derivation. Re-offered and declined again → stays; accepted → removed.
  - **Withdrawn / closed — do not re-log** — candidates that died on their merits: a mis-diagnosis the traveler corrected, or a signal the evidence resolved (two sightings pointing opposite ways is a noisy signal, and "the existing rule stands" is a legitimate closing outcome, not a failure). One line each on why, so no future audit re-derives them.
- **`runs/calibration.md`** — source-tag calibration, one line per trip per source: what the tag called that the traveler confirmed (class 1) or knocked (class 4), with a pointer to the feedback.md section. This is where "which sources to trust" accumulates across trips — single-trip calibration observations go here instead of being stranded in one feedback.md or shoehorned into proposals.md. A pattern with two or more trips behind it becomes a normal `shared.md` source-weighting proposal, through the same gate as everything else.
