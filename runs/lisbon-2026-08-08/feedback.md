# Feedback audit — Lisbon, audited 2026-08-13

Base version: `docs/briefs/lisbon-2026-08-08-fe4977a0.html`. Trip guide published:
`docs/summaries/lisbon-2026-08-13.html`.

**Confidence: reduced, throughout.** None of the three Lisbon briefs has a run record — all
predate `runs/`. There is no dossier and no `decisions.md` for any version, so every gap below is
**gap-or-cut ambiguous**: it cannot be told whether an item never entered a dossier or entered and
was cut. Sightings from this audit count at reduced weight toward the recurrence test.

Second caveat specific to this account: the traveler **lived in Lisbon**. The account is their
standing recommendation list, not a trip report — so it is far denser than a visitor's, and
everything in it is first-hand. There are **no dislikes, no mediocre verdicts and no want-to-gos**,
which means this audit can produce hits, gaps and taste signals but structurally cannot produce a
bad recommendation.

## Resolution map

Three published Lisbon versions, newest first: `-fe4977a0` (base, Aug 8), `-af55bf32` (Aug 8),
`-1d3907f7` (Aug 7).

| Named | Register | Resolved to |
|---|---|---|
| Ramiro | liked | base, Food → Top picks (world of mouth, culinary backstreets) |
| Miradouro (their sunset link) | liked | base, Views → **Miradouro da Senhora do Monte** (reddit) — their shortlink resolves to the same place |
| Belém Tower / "statues along the water" | liked | base, Museums → Jerónimos & Belém Tower (my pick) |
| Sintra, Pena Palace | liked | base, Day trips → Quinta da Regaleira & Palácio da Pena (reddit, my pick) |
| Alfama, Café da Garagem, Parque Eduardo VII, LX Factory, Avenida da Liberdade | liked | **no version** — trip finds |
| Cascais, Boca do Inferno, Parque Marechal Carmona, Indie, Lisbon Bike Rentals, Hífen | liked | **no version** — trip finds |
| Ofício, Copo Largo, Come Prima, O Frade, Frangasqueira Nacional | liked | **no version** — trip finds |
| Pastéis de Belém, rhodo bagels, Nivà Gelato, Tiffin Cafe, Honest Greens | liked | **no version** — trip finds |
| Javá, Lumi Rooftop, Mini Bar | liked | **no version** — trip finds |

Four resolved, nineteen did not. Ratings for all trip finds were verified on Maps during this audit.

## 1. Hits confirmed

| Place | Sources that called it |
|---|---|
| Ramiro | world of mouth + culinary backstreets |
| Miradouro da Senhora do Monte | reddit (r/Lisbon "20 things to do at least once") |
| Jerónimos & Belém Tower | my pick |
| Quinta da Regaleira / Pena | reddit (same thread) + my pick |

**Calibration:** the single r/Lisbon "20 things to do" thread produced two of the four hits — the
same one-thread-carries-the-run pattern logged for Vilnius. Logged to `calibration.md`, not
proposed: two cities is not yet evidence about thread selection generally.

## 2. Selection errors

Indeterminable — no `decisions.md` exists for any Lisbon version. Any item in §3 could belong here.

## 3. Research gaps (all gap-or-cut ambiguous)

Nineteen first-hand recommendations appear in no version. The ones with a nameable mechanism:

- **a. Cascais — the Day trips group has no feeder query.** All three briefs carry Sintra and
  nothing else. `things-to-do.md:10` defines a Day trips group; `research.md`'s Reddit query plan
  has **no `day trip from <city>` query** — the group is populated only by whatever the general
  itinerary threads happen to mention. This is the identical defect the Vilnius audit found and
  fixed for Tours (proposal B, applied 2026-08-13: `bike tour <city>` added because "the Tours
  group has no other feeder"). Same mechanism, different group. → **Proposal A**.
- **b. Pastel de nata missing from Local dishes, in Lisbon.** The base brief's Local dishes lists
  bacalhau, bifana, bitoque, sardines and caracóis — and not the pastel de nata, while the same
  brief's Cafés and bakeries carries **Manteigaria**, described as a "pastel de nata specialist",
  and the traveler's own must-do is Pastéis de Belém (4.6 ★, 99.9k — the most-reviewed food venue
  in the city). The canon list and the venue list inside one published page disagree with each
  other, which is checkable without any dossier. → **Proposal B**.
- **c. Honest Greens — the Healthy staples archetype, missed.** `research.md` states the archetype
  the Maps healthy search surfaces: "a local fast-casual chain with several locations and strong
  ratings". Honest Greens is exactly that (10+ Lisbon branches, 4.1–4.7). The brief instead carried
  two single-site my-picks (Soul & Sip, Wel Well). Cannot tell whether the Maps search ran.
  Logged, 1 sighting.
- **d. No churrasqueira anywhere in the brief.** Frangasqueira Nacional is charcoal roast chicken —
  and grilled/piri-piri chicken is one of the formats Lisbon lives on. No entry in any version
  represents the format, which `food.md`'s checklist 5 would have caught had the format map
  included it. Evidence that the format map was thin, not that a rule is wrong. Logged.
- **e. Rooftops and miradouros, in the city defined by them.** The base brief's Views group holds
  exactly one entry. The traveler names four view spots (Senhora do Monte, Parque Eduardo VII's
  observation deck, Javá, Lumi). The mandatory `best view of <city>` query was not dry here — it
  returned Senhora do Monte — so the Maps backstop applied after the Vilnius audit would not have
  fired. Third consecutive city where view coverage runs thin (Riga: no group at all; Vilnius:
  White Bridge missed). Logged as a new candidate, 1 sighting under this framing.
- **f. O Frade (4.6 ★, 2.9k) is in the Michelin guide** and `food.md` mandates the full Michelin
  city selection including the plain recommended tier. Either the sweep missed it or it was cut.
  Indeterminable. Logged only.

## 4. Bad recommendations

**None possible.** No dislikes and no mediocre verdicts in the account. Nothing the brief carried
was reported as bad; the brief's unmentioned entries are silence, not verdicts, and per
`audit.md` are never classified as defects.

## 5. Taste signals

- **Bars earn their place on the view or the room, not the drinks program.** All three bars named
  are a rooftop over the river (Javá), a hotel terrace over Bairro Alto (Lumi), and a chef's
  theatre bar behind a bookcase (Mini Bar). The base brief's three cocktail bars are all
  technique-led (fermentation programs, rotovaps, centrifuges) and none is named. **Second
  sighting** — Vilnius recorded the same thing from the other direction: two bar dislikes, plus
  Skybar (a view bar) named as a want. Sighting added to the open `proposals.md` candidate.
- **The favourites cluster in the €15–40 neighbourhood-restaurant band.** Ofício, Copo Largo,
  O Frade, Come Prima are all mid-priced chef-driven rooms; the brief's headline tier ran from
  tascas to a two-star (Belcanto), and neither end is on the list. One sighting, and confounded by
  the traveler having lived there — a resident's list is priced differently from a visitor's.
  Logged, no candidate drawn.
- **Walk-shaped recommendations.** Three of four half-days are a route rather than a destination
  (Alfama with no fixed itinerary, the Belém waterfront, LX Factory into Alcântara). The brief's
  Things to do is venue-shaped throughout. Interesting but not actionable as a rule yet; logged.

## 6. Mechanical finding from this audit's own verification

**A permanently-closed Maps result can be one branch of a live business.** Verifying Nivà Cremeria
by name search returned a location on Rua Prior do Crato marked **permanently closed**; the
traveler's own link resolved to **Nivà Gelato Príncipe Real**, open, 4.8 ★ (1.5k). Had this run
been a brief rather than a guide, `SKILL.md` phase 5 ("A permanently-closed venue is cut here")
would have cut a live, well-rated venue on a wrong-branch match. Not a Lisbon fact and not
dependent on any dossier. → **Proposal C**.

## 7. Proposals put to the user

| # | Classification | Canonical home | Outcome |
|---|---|---|---|
| A | Research gap — group with no feeder query (2nd sighting of the mechanism, after Vilnius/Tours) | `research.md` → Reddit queries, + `things-to-do.md` → Mandatory coverage | Offered 2026-08-13 |
| B | Research gap — dish canon contradicts the brief's own venue entry | `food.md` → Checklist | Offered 2026-08-13 |
| C | Mechanical — closed-branch misread would cut a live venue | `SKILL.md` → phase 5 Verify | Offered 2026-08-13 |

## 8. Candidates that did not become proposals

- **Healthy staples archetype not taken** (`research.md`). 1 sighting → `proposals.md`.
- **Views group runs thin in view-dense cities** (`things-to-do.md` → Views and nature). 1 sighting
  under this framing, though it is the third city in a row with a views weakness → `proposals.md`.
- **Format map missed the city's chicken-house format.** Evidence about one run's format map, not
  about any written rule. Logged only.
- **Michelin recommended-tier completeness** (O Frade). Indeterminable without a dossier. Logged only.
