# Proposed changes — running log

The audit's working queue. Section rules and outcome vocabulary live in `travel-summary/reference/audit.md` → Recording the audit; the full detail behind each sighting lives in that run's `feedback.md` (`runs/<city-slug>-<date>/`).

## Awaiting recurrence

- **A tour that covers a set of landmarks empties their Top-picks slots.** When a tour entry covers a set of landmark sights, those landmarks should not also hold Top-picks slots. Would edit: `things-to-do.md`. Sightings: Riga 2026-08-09 (bike tour made Blackheads / Art Nouveau district / Motor Museum redundant, §5).

- **A venue's primary format is a checkable fact, not an inference from its menu.** A place the sources characterize as a bar does not become a food entry because it also serves food; file it by what the sources call it, and lead the description with that. Would edit: `shared.md` → Accuracy rules (adjacent to, but distinct from, the service-mechanics candidate below — that one is about *how* you order, this is about *what the venue is*). Sightings: Vilnius 2026-08-13 (Šnekutis filed into Everyday institutions and led with its cepelinai; both sources call it the city's oldest bar, §4).

- **Service-format claims are checkable facts.** Assert pay-by-weight / counter-order / table-service mechanics only when a source states them; otherwise describe what is served and leave the mechanics out. Would edit: `shared.md` → Accuracy rules. Sightings: Riga 2026-08-09 (Lido wrongly described as pay-by-weight, §4).

- **A paid historic structure you climb is not the "paid observation deck" the free-spot preference is aimed at.** Views and nature prefers the free local spot over the paid deck; a historic tower, campanile or belfry in the old core is a different category and should not lose to a modern deck on price alone. Would edit: `things-to-do.md` → Views and nature. Sightings: Vilnius 2026-08-13 (Gediminas Castle Tower cut as a "paid climb-a-tower viewpoint"; it and the St. John's campanile were both traveler highlights — §2b. Note the run's stated comparator, the TV Tower, went unvisited on distance, so the free-vs-paid trade itself is untested).

- **A bar earns its place on the view or the room, not on the drinks program.** "Interesting — doing things no one else is doing" is the written bar, and it selects for technique (fermentation programs, rotovaps, unusual ingredient sets) — but this traveler's bar recommendations are consistently the ones with something else on offer, and the technique-led ones consistently go unmentioned or disliked. **Ripe: 2 sightings.** Would edit: `food.md` → Cocktail bars and breweries. Sightings: Vilnius 2026-08-13 (Alchemikas and Šnekutis were both of the trip's two dislikes, *"don't care about going to a bar for the sake of a bar"*, while Skybar — a view bar — was named as a want, §5); Lisbon 2026-08-13 (all three bars named are two rooftops and a chef's theatre bar; the base brief's three technique-led cocktail bars are named by neither, §5 — reduced weight, no run record).

- **Healthy staples: the stated archetype was not taken.** `research.md` already describes what the Maps healthy search surfaces — "a local fast-casual chain with several locations and strong ratings" — but a run can still ship two single-site my-picks instead. Watching whether the archetype needs to be stated as a preference rather than an observation. Would edit: `research.md` → Maps category searches. Sightings: Lisbon 2026-08-13 (Honest Greens, 10+ branches, missed while Soul & Sip and Wel Well were carried, §3c — reduced weight, no run record).

- **The Views group runs thin in cities defined by their views.** Third city running where view coverage came up short, and the first two fixes (Riga: enforce the group; Vilnius: Maps backstop on a dry query) do not reach this case — the query was not dry, it just returned one entry and the run settled. Would edit: `things-to-do.md` → Views and nature. Sightings: Lisbon 2026-08-13 (one Views entry in a city of miradouros and rooftop bars; the traveler names four view spots, §3e — reduced weight, no run record).

## Offered and declined — standing candidates, re-offer on a second sighting

- **Traveler profile: protein-forward, self-serve canteen formats read as portion control and protein, not price.** Declined 2026-08-09. Sightings: Riga 2026-08-09 (§5, signal 2).

## Withdrawn — mis-diagnosed, do not re-log

- **Specialist-retail coverage** (logged Riga 2026-08-09 from the Jāņa sēta map shop, 3b). Withdrawn 2026-08-09 on traveler correction: the visit landed because a passionate shopkeeper walked them through historical artifacts they could look at, not because the shop sold maps. The general signal is hands-on/taught/visual, now carried by the traveler-profile candidate above — a specialist-retail category or query would have been the wrong mechanism.

- **50 Best Discovery calibration** (logged Riga 2026-08-09 from Gimlet, §1, as a data point against `shared.md`'s "never alone a reason to include"). Closed 2026-08-13 with no edit: Vilnius supplied a second sighting pointing the opposite way — Alchemikas, also Discovery-only and uncorroborated, was a dislike (Vilnius 2026-08-13, §4/§6). Two sightings with opposite outcomes is a noisy signal, which is what the existing rule already assumes. The rule stands as written.
