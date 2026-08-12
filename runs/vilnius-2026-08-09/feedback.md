# Feedback audit — Vilnius, trip Aug 9–13 2026, audited 2026-08-13

Source brief: `docs/briefs/vilnius-2026-08-09-c8f72c83.html` (run record: this directory).
Trip guide published: `docs/summaries/vilnius-2026-08-13.html`.

## Confidence caveat — the traveler used more than one brief version

Four places in the account exist only in the **Aug 8** Vilnius briefs, not in the Aug 9 source brief:
Amandus and Alchemikas (`vilnius-2026-08-08-3af96272.html`, `-65b4edb9.html`), Desertų klubas and
Velotakas (`-65b4edb9.html`). Those versions predate run records, so anything traced to them is
audited against the published HTML alone, with no dossier or decisions.md behind it.

Consequence for classification, confirmed by the traveler: **Velotakas and Desertų klubas are not
research gaps** — the pipeline did find both, in an earlier run, and the Aug 9 re-research lost them.
They are regressions, not misses. Their entries on the trip guide carry the tags they were born with
(`my pick`, `falstaff`), not `trip find`.

## 1. Hits confirmed

| Place | Section | Sources that called it |
|---|---|---|
| Republic of Užupis | Things to do → Top picks | reddit (`1egoz8t`), atlas obscura |
| Three Crosses Hill | Things to do → Top picks | reddit (`1egoz8t`), govilnius |
| Halės Market | Food → Everyday institutions | reddit (`1egoz8t`) |

**Calibration signal:** all three trace to the same thread — r/Vilnius "What should we add to our
itinerary?" (`1egoz8t`), whose OP had the same Aug 9–13 window. An itinerary thread whose dates
overlap the trip was the single highest-yield source in this dossier. Logged as calibration; not
proposed as a rule, since one thread in one city is not evidence about thread selection generally.

`decisions.md:13` also moved Halės Market out of Things to do into Food ("belongs in Food
(market-hall eating), not duplicated here") — the traveler's account is about eating there, so the
placement call was correct.

## 2. Selection errors

**(a) Amandus.** In the dossier (`reddit.md:38` — named 1× reddit + michelin recommended 2026 + lrt
top-30 #13; `food-editorial.md:29` — chef Deivydas Praspaliauskas, Lithuanian/Nordic tasting menu,
communal 7pm seating). Cut at `decisions.md:41`:

> Amandus (michelin recommended, LRT #13) — would be a third tasting-menu-format entry, exceeding the
> one-or-two-per-brief cap already filled by Gaspar's/Džiaugsmas.

Verified on Maps during this audit: **4.9 ★ (1,184)** — higher than any restaurant that made the
brief. It was the traveler's strongest food like ("really creative and tasty tasting menu, modern take
on lithuanian food").

Defect: `food.md`'s tasting-menu cap states *how many* slots exist but never *which* candidates fill
them, so the cap resolved on award rank and arrival order. Both Gaspar's and Džiaugsmas also interpret
the national cuisine, so the existing "national cuisine outranks the placeless tasting menu"
tie-breaker did not discriminate either. → **Proposal C**.

**(b) Gediminas Castle Tower.** In the dossier (`reddit.md:103` — "Gediminas Castle Tower / Cathedral
bell tower (Katedros varpinė) — scenic viewpoints"). Cut at `decisions.md:18`:

> Gediminas Castle Tower / Cathedral bell tower — paid climb-a-tower viewpoints, cut in favor of Three
> Crosses Hill (free, locals' spot) and TV Tower (singular edge-walk experience) already filling Views.

The traveler liked Gediminas Tower (4.7 ★, 13,153 — the highest review count of any viewpoint in the
city) and also climbed the St. John's campanile (4.8 ★, 464), which never entered the dossier at all.

**Not treated as evidence against the TV Tower.** The traveler clarified they skipped it because it
was farther out, not because it lost a comparison: *"TV tower was a bit farther so we didn't get to
go. hard to say if that would've been better."* The rule's preference for the free local spot over the
paid deck is therefore untested here — what is evidenced is only that two paid historic tower climbs
were wanted and neither was in the brief. Single-trip, taste-flavoured → logged to `proposals.md`, not
proposed as an edit.

## 3. Research gaps

Genuine — never entered any dossier:

- **Sculptures by Mykolas Sauka** (4.9 ★, 9) — stone figures in Viršuliškių forest park. The
  `immersive art <city>` query ran and came back dry (`decisions.md:27`); nothing else targets outdoor
  or sited art. Also squarely the profile's hands-on/visual case.
- **Vilnius White Bridge** (4.7 ★, 4,287) — `decisions.md:26` records the mandatory query failing:
  *"The dedicated `best view of <city>` query ran on Reddit but returned only general itinerary/guide
  threads, not a dedicated views thread."* The run logged the dry query and moved on. A 4,287-review
  pedestrian bridge with a documented skyline view was one Maps search away. → **Proposal A**.
- **Dominican Church of the Holy Spirit** (4.8 ★, 1,108) — never surfaced, while St. Anne's Church did
  and was cut at `decisions.md:17` as *"generic capital-city church attraction even with the Napoleon
  legend."* The category was dismissed on the strength of the one candidate that appeared. This is the
  Riga sibling-institution pattern recurring. → **Proposal A**.

Regressions rather than gaps (see caveat above):

- **Velotakas** (4.9 ★, 265) — `decisions.md:7`: *"Tours — omitted, no local/independent operator
  surfaced."* The Aug 8 brief carried it tagged `my pick`, i.e. it surfaced from model recall, never
  from a query. That is the mechanism: `things-to-do.md` defines a Tours group that feeds Top picks,
  and no query in `research.md` populates it. → **Proposal B**.
- **Desertų klubas** (4.4 ★, 92) — Cafés and bakeries ran at 2 entries after Beigelių krautuvėlė was
  confirmed permanently closed, with a conscious decision not to backfill (`decisions.md:61`). A
  depleted group had no Maps fallback. → **Proposal A**.

## 4. Bad recommendations

**Šnekutis.** In the brief under **Everyday institutions**: *"Oldest bohemian bar in Vilnius; stuffs
its own cepelinai and pours local craft beer."* Traveler: *"food line was crazy long, not food
focused, just beers."*

Separating the two defects `travel-summary` asks to separate: the **place** was not bad; the
**placement and description** were wrong. Both sources characterise it as a bar —
`food-editorial.md:57` quotes In Your Pocket calling it *"probably the best bar in Vilnius"*, and
`reddit.md:29` lists it as *"oldest bohemian bar in Vilnius, stuffs its own cepelinai."* The brief
filed a bar into a food category whose bar is *"where the city eats its own food on an ordinary
Tuesday"* and led the description with the cepelinai. Adjacent to the open Riga candidate on
service-format claims, but distinct: that one is about service mechanics, this is about venue
category. → logged to `proposals.md`, single sighting.

**Alchemikas.** Not in the Aug 9 brief or dossier — it is an Aug 8 entry, tagged `50 best discovery`
alone in `-3af96272` ("Alchemy-lab theme; around 200 cocktails made to order from memory, no fixed
menu handed to the table"). The traveler's specific complaint — *"claude had told me there were
interesting local ingredients like gimlet and that was completely wrong"* — **does not correspond to
any text in either Vilnius brief**; no version mentions gimlet or local ingredients at this venue. It
came from conversation, not the published page, and is therefore unauditable from the record. Logged,
no rule drawn.

What *is* auditable: the `-3af96272` entry was Discovery-only, which `shared.md` already forbids as a
stand-alone reason to include. See §6.

## 5. Taste signals

- **Bars are not destinations.** Both dislikes are bars, and the stated reason is general: *"i don't
  really care if it's not anything special and creative, don't care about going to a bar for the sake
  of a bar."* Note the traveler *does* want Skybar — a bar whose draw is the view. `food.md`'s
  Cocktail bars bar ("interesting — doing things no one else is doing") already encodes this and is
  well-aimed; the signal is that it should bite harder, or the section be dropped more readily.
  Single trip → `proposals.md`.
- **High vantage points, in the historic core.** Four data points: Gediminas Tower, St. John's
  campanile, Three Crosses Hill, and Skybar named as a want. → `proposals.md` (see §2b).
- **Ordinary lived-in public space.** The Sauka sculptures were valued partly for the walk afterwards
  ("cool to explore the nearby very local neighborhood after"), and the White Bridge almost entirely
  for it ("lots of locals hanging out in the sports courts"). Adjacent to the profile's existing
  "hands-on, interactive and visual" line but not the same thing. **Deliberately not logged as a
  profile candidate** — the withdrawn Riga specialist-retail entry is the cautionary case for
  inventing a category from two visits in one city.

## 6. Noise — logged, nothing changed

- Halės Market: *"baleboste not very worth it"* — one stall among dozens in a market hall.
- Lokys, Etno Dvaras, Lukiškės Prison 2.0 (all "mediocre"): each matched its description. Lokys was
  sold as a game specialist and delivered beaver; Etno Dvaras as certified traditional cooking and
  delivered a wide spread at tourist prices; Lukiškės as walkable cell blocks and delivered that. The
  verdicts are taste, not defects, and per `travel-summary` an unenthusiastic visit to an accurately
  described place is not a bad recommendation.

## 7. Proposals put to the user

| # | Classification | Canonical home | Outcome |
|---|---|---|---|
| A | Research gap ×3 (White Bridge, Dominican Church, Desertų klubas) + Riga sibling-sweep 2nd sighting | `research.md` → Maps category searches | **Applied** |
| B | Regression / mechanical — Tours group has no feeder query | `research.md` → Reddit queries, + `things-to-do.md` → Tours | **Applied** (extended, see below) |
| C | Selection error — Amandus | `food.md` → headline tier, tasting menus | **Applied** (reworded, see below) |

**A** — merged the Riga sibling-institution candidate with this trip's three Maps-findable misses into
one bullet rather than two overlapping rules, per the smallest-edit test. Replaces the narrower
"format-map format that Reddit came back thin on" bullet with a general backstop covering thin, dry,
depleted, and single-candidate results.

**B** — the mechanical half (adding `bike tour <city>` to the mandatory Things-to-do queries) went to
`research.md`. The traveler then added two selection preferences, which went to `things-to-do.md`'s
Tours group as their canonical home: prefer the operator's bike format over its walking format
(covers several times the ground), and rank operators on the guide — reviews naming a guide as
engaging or crediting real historical depth — pointing at `shared.md`'s existing profile line rather
than restating it.

**C** — reworded on traveler correction before applying. The drafted tie-break resolved the cap on
"rating and review count, and first-hand raves"; the traveler's actual criterion is inventiveness:
*"it's not just purely off stars, it's by how unique and creative the tasting menu seems to be."*
Applied text ranks on how far the dishes depart from the standard version, explicitly not on award
rank *or* rating. This also aligns the cap's tie-break with Creative and interesting's existing
"novelty is the ranking key."

## 8. Candidates that did not become proposals

- **Paid historic tower vs. free local viewpoint** (`things-to-do.md` → Views and nature). Strong
  within-trip signal but single-trip and taste-flavoured; the TV Tower comparison that would have
  sharpened it is void, since the traveler skipped it on distance. → `proposals.md`, 1 sighting.
- **A venue's primary format is a checkable fact** (`shared.md` → Accuracy rules). Šnekutis. →
  `proposals.md`, 1 sighting; related to but distinct from the open Riga service-format candidate.
- **Bar-section bar should bite harder** (`food.md` → Cocktail bars and breweries). →
  `proposals.md`, 1 sighting.
- **50 Best Discovery calibration** — **closed, no edit.** The open Riga candidate logged a
  Discovery-only entry (Gimlet) becoming a traveler highlight, as a data point *against*
  `shared.md`'s "never alone a reason to include." Vilnius supplies the second sighting pointing the
  other way: Alchemikas, also Discovery-only and uncorroborated, was a dislike. Two sightings with
  opposite outcomes is the definition of a noisy signal, which is exactly what the existing rule
  already assumes. The rule is correct as written; the candidate is removed from `proposals.md`
  rather than ripened.
- **Itinerary-thread date-overlap calibration** (§1). Interesting, but one thread in one city says
  nothing generalizable about source selection. Logged only.
