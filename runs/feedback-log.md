# Feedback log

One entry per audited trip. One-trip observations live here, not in the skill; a rule is earned when the same pattern shows up across two or more trips.

---

## 2026-08-09 — Riga (brief `briefs/riga-2026-08-08-1344ffee.html`, trip Aug 1–8, 2026)

**Confidence: reduced.** No run record exists — `runs/` did not exist when this brief was produced, so there is no dossier and no `decisions.md`. Every "research gap" below is therefore **gap-or-cut ambiguous**: it cannot be told whether the item never entered the dossier or entered and was cut. Treat the classifications as provisional and do not count them toward the recurrence test at full weight.

Traveler supplied highlights only — no dislikes. Absence of a complaint is not evidence an entry was good; nothing here is classified as a bad recommendation.

### 1. Hits confirmed

| Entry | Sources that called it |
|---|---|
| The Corner House | reddit (r/Riga things-to-do thread) |
| Riga Central Market | atlas obscura + reddit |
| Lido | reddit; brief itself noted it recurred across nearly every thread searched |
| Folkklubs Ala Pagrabs | reddit |
| Gimlet Nordic Cocktail Bar | **50 best discovery, sole source** |
| Riga Free Tours | reddit — operator correct, format incomplete (see 3d) |

Calibration: r/Riga threads produced 5 of 6 hits. Worth noting against `shared.md`'s line that 50 Best Discovery is "never … alone a reason to include" — here a Discovery-only entry with no corroboration became a traveler highlight. One data point, and it was included anyway, so no harm occurred. Logged, not acted on.

### 2. Selection errors

Indeterminable without `decisions.md`. Any of the items in section 3 could belong here.

### 3. Research gaps (gap-or-cut ambiguous)

- **a. RSU Anatomy Museum** — 4.8 ★ (483). The brief carried the *adjacent* institution, Paula Stradiņa Museum of the History of Medicine (4.5, atlas obscura), and not this one. Candidate mechanism: Atlas-Obscura-led discovery lands the museum with the famous single artifact and does not sweep for sibling institutions in the same category and city. **Candidate rule:** when a category yields one museum via an editorial-curiosity source, check Maps for same-category neighbours before settling. Not proposed — one trip, no mechanism failure against written rules.
- **b. Jāņa sēta map shop** — 4.8 ★ (180). Specialist retail (maps, records, books) has no group in `things-to-do.md` and no query in `research.md`. **Candidate rule:** a specialist-retail sweep. Not proposed — this would be a *new* category, and the smallest-edit test says tighten existing bars first; one trip is far too thin for a new group.
- **c. 3 pavāru restorāns** — 4.6 ★ (1.4k), Michelin-recommended. The brief carried five other Michelin entries (Max Cekot, Milda, Māsa, Shōyu, The Catch), so the Michelin sweep clearly ran. Cannot tell whether this was missed or cut. Logged only.
- **d. Riga Free Tours bike tour** — **mechanical.** `shared.md` defines tours as "walking/biking run by locals", and `brief-template.html:244` writes the heading as "— walking and biking, locally run". The published brief hardcoded "— walking, locally run" and described only walking tours for an operator that runs both. The operator was found; its formats were never enumerated. → **proposed edit (T)**.
- **e. Skyline Bar** — 4.5 ★ (6,351). **Mechanical, and the clearest finding in this audit.** `things-to-do.md:18` lists `best view of <city>` as a *mandatory* query, and `:7` defines a **Views and nature** group ("a hilltop, a waterfront walk, a rooftop"). The published Riga brief **has no Views and nature group at all**, and the one view entry it did carry — National Library viewing floors — sits misfiled under "Unique to Riga". So the group was dropped under the no-trace rule despite having a qualifying candidate, and a 6.4k-review rooftop in the city centre never surfaced. → **proposed edit (V)**.

### 4. Bad recommendations

None reported.

### 5. Taste signals

- **Visceral and Soviet/Cold-War material rates highest.** Anatomy museum ("really stirs something in you"), KGB headquarters, Cold War military maps were three of the four top-named items. Generalizes as: uncomfortable, physical, or authoritarian-history material over decorative or architectural sightseeing.
- **Protein-forward, pay-by-weight and self-serve formats.** "Juicy meats", "try a bit of everything", "great for macros" — the traveler's read on a canteen is portion control and protein, not price.
- **Markets are used at stall level.** The useful unit was six named stalls and what to order at each, not "go to the market". The brief's market entries described the building.
- **Being taught counts.** Gimlet walking them through raw infusions, and the map-shop owner's enthusiasm, were both given as the reason the visit landed.
- **A good bike/walking tour makes standalone landmark entries redundant.** The traveler cut Riga Motor Museum, House of the Blackheads and the Art Nouveau district from Top picks on the grounds that the bike tour already covered that ground. **Candidate rule:** when a tour entry covers a set of landmark sights, those landmarks should not also hold Top-picks slots. Strong and clearly general, but it reweighs the relationship between two groups — logged, awaiting a second trip.

### Proposals put to the user

**Both applied 2026-08-09 with user approval** (`things-to-do.md`). Two, both qualifying under the recurrence test's mechanical clause (b) — each is a failure against travel-brief's own written text, not a taste preference:

- **(V) Views and nature — enforce the mandated group.** `things-to-do.md` checklist gains a line: a Views group may only be dropped when the mandatory `best view of <city>` query ran and returned nothing that cleared the bar; a venue whose draw is the view is filed under Views and nature and judged on the view, even when its form is a bar or restaurant that would fail the Food bar. Different-city effect: rooftop bars, hilltop cafés and observation restaurants stop falling through the gap between Food and Things to do.
- **(T) Tours — enumerate an operator's formats.** `things-to-do.md:9` gains: once an operator qualifies, list which formats it actually runs (walking, bike, boat) and name the one worth taking; the heading note follows the formats present rather than defaulting to "walking". Different-city effect: a qualifying operator's bike or boat tour is no longer invisible because the walking tour was found first.

Failed the gate, logged only: 3a (sibling-institution sweep), 3b (specialist retail — new category), 3c (indeterminable), the 50 Best Discovery calibration note, and the tour-covers-landmarks rule from section 5 — all single-trip taste or structural evidence with no mechanism failure against written rules.

Traveler-profile updates (permitted directly under the profile exception) were **not** applied — offered and declined this round; candidates remain signals 1 and 2 in section 5.
