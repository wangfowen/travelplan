# Shared rules

Read before drafting anything; every drafting agent gets this file. These rules apply to every section; each section's own bars live in its file under `sections/`.

## Traveler profile

One specific traveler. Their taste decides what goes in and what gets cut:

- **Things to do:** unique-to-this-place first, then world-class nature, then museums that are themselves worth the trip. Never generic attractions available in any capital.
- **Views and nature:** nature only world-class — the kind that is a reason to go; a pleasant city park is not, and most cities have none. Views are city-scaled and the one exemption from the uniqueness test: most cities do have one or two spots genuinely worth going to just to take the city in.
- **Museums and galleries:** one group — art, history, and science together. High bar — interesting museums not seen elsewhere, or genuinely world-class ones. One or two entries is the normal length. A real gallery scene can add one more.
- **Tours:** walking/biking run by locals or small independent operators. Aggregators and multi-city chains (GetYourGuide, Viator, SANDEMANs, big bus companies) never appear — a filter, not a preference, so survivors need no "local" label. Food tours only where the city is genuinely known for food.
- **Food:** the bar is **how good the food is** — not the room, the ambiance, the award, or the sourcing story ("seasonal", "locally sourced", "own farm" describe procurement, not flavour, and are neither reasons to include nor what a description leads with). A €10 canteen plate that exists only here beats a competent nine-course menu. The per-section bars and the cuisine, chain, and tasting-menu rules live in `sections/food.md`.
- **Where to stay:** somewhere to live out of for a week — walkable or on real transit, quiet, with groceries, a gym, and somewhere to run in reach. Nightlife is a mark against, and closeness to the sights is close to irrelevant.

## Be short

Every section is a shortlist. Include something only if you would genuinely tell a friend to go. Three to five entries per group is the target, and **fewer beats padded** — two strong entries beat six with filler.

**The no-trace rule: an omitted section leaves no trace.** If nothing clears the bar, delete the heading and move on — no line saying you looked, no naming what you rejected. The reader is not auditing the process; absence reads as "not applicable here", which is the whole message. The only exceptions (written at assembly, not in drafts): Book ahead's "nothing needs advance booking" line, and source-availability callouts ("Eater has no coverage of this city", "Reddit was unreachable — attempts listed") — those explain the evidence base and are required under Source tags.

## How to write an entry

Selection bars decide what goes in; the description's only job is **what the thing is and what is distinctive about it** — one line, two at the ceiling, scanned on a phone.

- **No superlatives or endorsement language** ("world-class", "unmissable", "a must", "raved about"). Presence in the brief is the endorsement; a sentence arguing for inclusion gets deleted.
- **Lead with the concrete fact.** "The only surviving wooden synagogue in the country, interior painted 1780" beats "exceptional heritage architecture". A date, material, technique, dish, or number does the work the adjective was faking.
- **No comparisons to what you rejected** ("not just another park") and **no reception talk** ("widely loved") — the rating and tags carry reception.
- **Restaurants:** cuisine, technique, format, one or two dishes to order. **Events:** what physically happens, and — for Cultural — what makes it particular to this place.

Test: if the sentence would be true of a mediocre place in the same category, it describes nothing — rewrite it with a fact.

## Ratings and links

Every named place gets a Google Maps link — `https://www.google.com/maps/search/?api=1&query=<url-encoded name + city>` — and its Google rating **with the review count**: `4.6 ★ (2,341)`. The count is not optional — 4.9 from 12 reviews and from 12,000 are different facts; write `(count unknown)` when only the rating is confirmable.

**Verify ratings in the browser on Google Maps, not by web search.** Open the Maps query URL and read the page (`get_page_text`): it returns the live rating, count, price band, and — crucially — whether the place is **permanently closed**, which catches dead venues editorial sources still list. Batch several lookups per `browser_batch` call (navigate → wait 2s → get_page_text, repeated). Web search for ratings mostly surfaces aggregator numbers (Wanderlog, RestaurantGuru), which are banned as substitutes, and it burns budget the brief needs elsewhere. Verification happens in phase 5, after drafting — drafts carry candidates without ratings.

Never invent a rating — omit it instead. **Google only**: no TripAdvisor/Yelp/aggregator substitutes; write "no rating found" and move on. Approximate counts (`~2.3k`) are fine. **Sort every list by rating, descending**; unrated entries go last in their group.

## Source tags

**Every entry in Things to do, Events and Food carries a visible source tag** — no exceptions, including your own recommendations:

| Tag | Means |
|---|---|
| `reddit` | Surfaced on Reddit. Link the thread on the tag itself. |
| `atlas obscura` | From an Atlas Obscura entry. |
| `michelin` | On the Michelin guide — append the year (`michelin ★ 2026`, `michelin bib 2026`). |
| `50 best` | Ranked on a 50 Best list — append year and rank, and name the list when it is not the World restaurants one (`50 best bars #12 2026`, `asia's 50 best #7 2026`). |
| `50 best discovery` | On the 50 Best Discovery platform but **not ranked on any list**. |
| `eater` | Covered by Eater. Link the article. |
| `world of mouth` | Recommended on World of Mouth (chef/expert database). Link the restaurant's page there. |
| `beli` | Pasted by the traveler from their Beli app — user-supplied, never searched. |
| *named publication* | Any other real editorial source, by its actual name — `lrt`, `condé nast`, `in your pocket`. Link it. |
| `my pick` | Your own knowledge, not surfaced by any search. |

- **50 Best Discovery** is the unranked year-round platform (3,000+ venues in city guides) — usually the only part of 50 Best that returns anything outside the major capitals, and a much weaker signal than a rank. Never write a rank for it, and never treat it alone as a reason to include — it is corroboration, useful when it agrees with Reddit or local press.
- **There is no generic `guides` tag.** Name the publication or use `my pick`. If the only source is one you would not cite by name, that is a signal to cut the entry.
- **Never source from aggregators** — TripAdvisor, Yelp, Wanderlog, RestaurantGuru, and the listicle farms that rewrite them: not for entries, not for ratings.
- **Stack every applicable tag.** Cross-source agreement is the strongest signal in the brief, and stacked tags are how the reader sees it. Tags are provenance, not endorsement.
- A source category that is unreachable during research gets a plain callout near the affected section, never a silent substitution under the wrong tag.

## Accuracy rules

- Anything from your own knowledge rather than a search is labeled as such.
- Never fabricate a rating, review count, funding figure, booking lead time, fare, or event date — omit rather than estimate.
- Award lists, GDP figures, funding totals, fares, and tipping norms drift: attach a year to each.
- Prefer "could not confirm" to a plausible guess — except in Book ahead, where an unconfirmed entry is simply dropped.
