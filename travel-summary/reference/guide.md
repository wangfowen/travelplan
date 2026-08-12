# The trip guide

The trip guide is **what the traveler recommends to others**, wearing the brief's clothes. Start from the base version's HTML (`docs/briefs/<file>`, or `docs/summaries/<file>` if the user named a trip guide) and keep the presentation identical: template, header, section order, entry style, source tags, rating badges, styling.

**The no-trace rule, once and for the whole page:** a friend reading it sees a normal travel brief. Nothing on the page announces that it was revised; no trip commentary, meta notes, hedging language, "skip" lines, or strikethrough appear anywhere; every description reads as a normal entry. The two provenance tags — `trip find` and `didn't make it` — are the only marks of the trip, and they are tags in the existing style, not notes. The brief itself stays published and reachable under the index's older-versions toggle — that is where recommendations sourced from research alone live on, so the guide never has to carry them.

## Things to do, Events and Food carry only what the traveler named

In those three sections, every entry traces to one of the three surviving registers — liked, mediocre, want to go — or to something they found themselves:

- **Liked — keep it, from whichever version the resolution map says has it**: the entry moves onto the new guide unchanged, keeping its description, tags and rating badge. An entry pulled forward from an older version is not re-verified — its rating is the one that run confirmed, and the guide's header carries its own research date.
- **Add what they found.** Their own discoveries become full entries in the normal entry style (`../../travel-brief/reference/shared.md` → How to write an entry: concrete fact first, the dish to order, Maps link; rating badge only if verified in the browser, omitted otherwise), placed in the group where they belong, tagged `trip find` in the same tag style the page already uses.
- **Mediocre — decide one at a time, on what was mediocre about it.** If the flat part was incidental to why the entry exists — one dish off, a slow night, a room they disliked — the place keeps its spot. If the flat part *is* why the entry exists — the food at a restaurant, the view at a viewpoint, the collection at a museum — cut it: a friend sent there gets precisely the experience the traveler shrugged at. This is the same read travel-brief applies to a local knocking an institution (`../../travel-brief/reference/sections/food.md` → Weighing the evidence): judge the specific complaint, not the temperature of it — a mediocre verdict outranks every rating and tag stacked behind the entry. When it stays, fold the concrete half of the reservation into the description in normal entry voice ("the grilled plates carry it, the stews don't"). **Mediocre carries no tag; keeping it is the recommendation**, and its position in the group is the only signal (sorting below).
- **Want to go — carried, and marked `didn't make it`**, keeping its researched description, source tags and rating. One that appears in no version gets a full entry written in the normal entry style, tagged `didn't make it` **alone** — `trip find` means they went.
- **Delete what they disliked, and everything they never mentioned.** Removal is silent and total. Being unmentioned is not a verdict against an entry; it is only an absence of first-hand evidence, and the brief keeps it.
- **A section left with nothing is deleted** — heading, groups, and its link in the header nav. Food is the one section that survives an empty venue list, because Local dishes to try stays (below).

**A trip guide has no Top picks group.** Every entry on the page is there because the traveler named it, so a Top picks heading distinguishes nothing — the tier sort below carries what ranking the page has: drop it from Things to do and Food, and file each surviving entry in the category group it belongs to by that group's own definition — the group it would have sat in had the brief never promoted it (`../../travel-brief/reference/sections/things-to-do.md` and `food.md` → Structure). Each entry still appears exactly once.

**Groups sort in three tiers — liked, then want-to-go, then mediocre** — rating-descending inside each tier per `shared.md`, unrated last. The order is the guide's confidence signal: a place they went to and shrugged at is the weakest thing on the page, while an untested entry is unknown rather than disappointing. Trip finds sort with liked; nothing else is layered on top, since within a tier everything is equally traveler-chosen. A group nothing lands in is gone heading-and-all. Day trips is unaffected — it was never a Top picks feeder.

## Every other section stays as researched

Edited only where the traveler said something about it:

- **Where to stay** — keep the researched neighborhoods; drop one they disliked, add one they would recommend, fold in a concrete thing they learned about one that stays. Silence leaves the section untouched.
- **Book ahead** — **re-derived from the finished page, never carried over.** Book ahead is a harvest of the sections around it (that is how travel-brief builds it), so re-run the harvest after the other sections settle: a row lives only if what it books still has an entry on the guide, and a venue cut in any register — disliked, mediocre, unmentioned — takes its booking row with it, or the page tells a friend to book something it no longer recommends. Add a row for anything the traveler wishes they had booked; its venue is on the page anyway, since wishing is the want-to-go register. A hard-won booking lesson enters the row as researched fact ("same-week tables are rarely available"), in the same voice as every other cell.
- **Local dishes to try** — the city's dish canon, not a recommendation list. It stays whole and keeps opening Food. A `Where:` pointer may name a venue that no longer has an entry; that is fine — it is a place to eat the dish, not an endorsement of the venue.
- **Practical and the country section** stay as they are.

Judge inclusion on the traveler's say-so alone — don't re-apply travel-brief's selection bars to what they named, and don't keep a highly-rated entry because it looks stronger on paper than what they chose. The one judgment call on the page is the mediocre keep-or-cut above. The "three to five per group" target does not apply to a page built from first-hand evidence: if they named two restaurants, Food has two restaurants.

If their feedback includes a concrete tip about an entry that stays ("the thing to order is X", "go at opening"), fold it into that entry's description in normal entry voice.

## Checklist — run on the finished page before publishing

1. Every entry in Things to do, Events and Food traces to a register or a trip find; nothing the traveler didn't name survived in those sections.
2. Tags are exact: `trip find` only where they went; `didn't make it` alone where they didn't; mediocre keeps carry no tag; a carried entry keeps the tags and rating of the version it resolved to.
3. No Top picks group; every group sorts liked-then-want-to-go-then-mediocre, rating-descending inside each tier, unrated last; empty groups and sections are gone heading-and-all, nav links included.
4. Book ahead was re-harvested: every row books something that still has an entry on the page.
5. Read the page as the friend it's for: no trip voice anywhere — no "we", "this trip", "was just OK" — in entries, Book ahead cells, or anywhere else; the two tags are the only marks of the trip.
6. Local dishes is whole and still opens Food; Practical and the country section match the base version unless the traveler spoke to them.
