---
name: travel-brief
description: Research a travel destination and produce a single-page briefing artifact covering things to do, events falling in the travel dates (festivals, concerts, shows, exhibitions), restaurants, neighborhoods, what to book ahead, practical basics including how to get around on transit versus rides, and country background including local culture. Takes a city and the travel dates, and asks for either if not given. Use when the user names a city or country they are planning to visit, asks for trip research, a travel brief, or "what should I know about <place>".
---

# Travel Brief

Research a destination against a fixed checklist and publish the result as a single self-contained HTML artifact.

## Input

Required: **a city and the travel dates.** If they name only a country, ask which city — most of the brief is city-scoped. If they give no dates, ask before researching — Events and Book-ahead are unwritable without them; approximate dates ("mid-May") are fine, and say so when asking. Ask for everything missing in one message, then research.

## Traveler profile

One specific traveler. Their taste decides what goes in and what gets cut:

- **Things to do:** unique-to-this-place first, then world-class nature, then museums that are themselves worth the trip. Never generic attractions available in any capital.
- **Views and nature:** nature only world-class — the kind that is a reason to go; a pleasant city park is not, and most cities have none. Views are city-scaled and the one exemption from the uniqueness test: most cities do have one or two spots genuinely worth going to just to take the city in.
- **Museums and galleries:** one group — art, history, and science together. High bar — interesting museums not seen elsewhere, or genuinely world-class ones. One or two entries is the normal length. A real gallery scene can add one more.
- **Tours:** walking/biking run by locals or small independent operators. Aggregators and multi-city chains (GetYourGuide, Viator, SANDEMANs, big bus companies) never appear — a filter, not a preference, so survivors need no "local" label. Food tours only where the city is genuinely known for food.
- **Food:** the bar is **how good the food is** — not the room, the ambiance, the award, or the sourcing story ("seasonal", "locally sourced", "own farm" describe procurement, not flavour, and are neither reasons to include nor what a description leads with). A €10 canteen plate that exists only here beats a competent nine-course menu. The per-section bars and the cuisine, chain, and tasting-menu rules live in the Food section of the research procedure.
- **Where to stay:** somewhere to live out of for a week — walkable or on real transit, quiet, with groceries, a gym, and somewhere to run in reach. Nightlife is a mark against, and closeness to the sights is close to irrelevant.

## Be short

Every section is a shortlist. Include something only if you would genuinely tell a friend to go. Three to five entries per group is the target, and **fewer beats padded** — two strong entries beat six with filler.

**An omitted section leaves no trace.** If nothing clears the bar, delete the heading and move on — no line saying you looked, no naming what you rejected. The reader is not auditing the process; absence reads as "not applicable here", which is the whole message. Two exceptions still get written: Book ahead's "nothing needs advance booking" line (that absence answers a question the traveler is asking), and source-level notes ("Eater has no coverage of this city", "Reddit was unreachable — attempts listed") — those explain the evidence base and are required under Source tags.

## How to write an entry

Selection bars decide what goes in; the description's only job is **what the thing is and what is distinctive about it** — one line, two at the ceiling, scanned on a phone.

- **No superlatives or endorsement language** ("world-class", "unmissable", "a must", "raved about"). Presence in the brief is the endorsement; a sentence arguing for inclusion gets deleted.
- **Lead with the concrete fact.** "The only surviving wooden synagogue in the country, interior painted 1780" beats "exceptional heritage architecture". A date, material, technique, dish, or number does the work the adjective was faking.
- **No comparisons to what you rejected** ("not just another park") and **no reception talk** ("widely loved") — the rating and tags carry reception.
- **Restaurants:** cuisine, technique, format, one or two dishes to order. **Events:** what physically happens, and — for Cultural — what makes it particular to this place.

Test: if the sentence would be true of a mediocre place in the same category, it describes nothing — rewrite it with a fact.

## Ratings and links

Every named place gets a Google Maps link — `https://www.google.com/maps/search/?api=1&query=<url-encoded name + city>` — and its Google rating **with the review count**: `4.6 ★ (2,341)`. The count is not optional — 4.9 from 12 reviews and from 12,000 are different facts; write `(count unknown)` when only the rating is confirmable.

**Verify ratings in the browser on Google Maps, not by web search.** Open the Maps query URL and read the page (`get_page_text`): it returns the live rating, count, price band, and — crucially — whether the place is **permanently closed**, which catches dead venues editorial sources still list. Batch several lookups per `browser_batch` call (navigate → wait 2s → get_page_text, repeated). Web search for ratings mostly surfaces aggregator numbers (Wanderlog, RestaurantGuru), which are banned as substitutes, and it burns budget the brief needs elsewhere.

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

## Reaching Reddit

Reddit is the most valuable source in this brief and the most likely to fail. Verified as of Aug 2026:

- Server-side fetches of `reddit.com` are refused at the tool level — a deliberate blocklist, not rate limiting. Retries, user-agent changes, `.json`/`old.reddit.com` do not help; public front-ends (redlib, safereddit) were dead when last checked; `curl` gets a bot interstitial.
- `site:reddit.com` inside a query string is **ignored** by the search backend and returns travel listicles — which is how earlier runs concluded "Reddit unreachable" without ever querying Reddit.
- **Browser control works.** Claude in Chrome drives the user's logged-in browser, which clears the block — and costs **zero web-search budget**. Stay inside Reddit's own search UI:
  1. `https://www.reddit.com/r/<citysubreddit>/search/?q=<query>&restrict_sr=1&sort=top&t=year` — drop `restrict_sr=1` when the local sub is thin. `get_page_text` returns results with vote and comment counts.
  2. Pick threads by **comment count, not upvotes** — recommendations live in the comments; a 3-upvote thread with 24 comments beats a 200-upvote photo post. Prefer threads from the last ~2 years.
  3. Navigate + `get_page_text` per thread, batched in one `browser_batch` call. Close your tabs when done.

If the extension is not connected, say so plainly — the user can connect it and re-run. Only then fall back: domain-filtered search (`WebSearch` with `allowed_domains: ["reddit.com"]`, never a `site:` prefix) to at least surface thread URLs, or ask the user to paste threads, naming what you would search. When Reddit is genuinely unavailable, lean harder on Eater and named local press — not aggregators. **Never report a source as unreachable or blocked without naming the specific attempts you made.**

## Workflow

Run in this order — it is materially cheaper and faster than interleaving:

1. **Fan out subagents in parallel** for the editorial legwork: Michelin + 50 Best + World of Mouth, events calendar + venue seasons + local press, neighborhoods + transit + country background. Subagents **return raw text findings** — they do not publish artifacts, and they do not chase Google ratings (that is step 3; doing it early wastes searches on candidates that get cut, and WebSearch mostly surfaces banned aggregator numbers anyway). Search each source category separately — the point is consistent coverage, not speed.
2. **Do the Reddit pass yourself, serially, in the browser.** The browser is one shared resource with one tab group — parallel agents navigate each other's tabs out from under themselves.
3. **Select, then verify.** Draft every shortlist first from the combined findings. Then verify ratings **only for places in the draft**, via batched Google Maps lookups in the browser (see Ratings and links) — which also catches permanently closed venues. Verifying candidates you will cut is the main way runs blow their budget.
4. **Assemble, publish, summarize** in chat.

**Watch the search budget.** It is session-wide, and subagent fanout can exhaust it. Reddit-in-browser and Maps-in-browser cost none of it; spend WebSearch on editorial sources, events, and country facts. If searches start bouncing off the limit, tell the user rather than silently shipping a thinner brief.

## Research procedure

### 1. Things to do

Structured like Food: **Top picks fed by the category groups.** Every candidate lands first in a category; the absolute must-dos get promoted to Top picks; each entry appears once — a must-do museum sits in Top picks, not Museums. Six groups, in order, rating-sorted within each, 3–4 entries each (see Be short):

1. **Top picks** — the absolute must-dos, regardless of category: the three to five things they would be sorriest to have missed. Fed by Unique to this city, Views and nature, Museums and galleries, and Tours — never by Day trips.
2. **Unique to this city** — explicitly the catch-all: everything worth going for that the other categories don't catch. The test stays "exists here and effectively nowhere else" — the singular sights, spaces, and experiences that aren't a museum, nature, or a tour. Immersive and experiential art (a Meow Wolf, a teamLab) lands here, and a handful of global locations does not disqualify it — the test stays "can't see this at home." The main feeder of Top picks; give it the most room.
3. **Views and nature** — two bars. Nature keeps the world-class bar: a reason to go in itself, which most cities have none of. Views are city-scaled: the one or two spots to actually take the city in — a hilltop, a waterfront walk, a rooftop — preferring the free spot locals use over the paid observation deck, unless the deck is itself the singular experience. One to three entries in most cities.
4. **Museums and galleries** — one combined group: art, history, and science together. Interesting museums not seen elsewhere, and/or world-class ones. One or two entries is the correct length. A real gallery scene earns one more entry — a gallery district or a first-Friday gallery walk written as a single line naming its two or three anchor spaces; individual commercial galleries almost never qualify alone.
5. **Tours** — named local operators only.
6. **Day trips** — separate, and never promoted into Top picks: a top pick is a reason to be in this city, a day trip is a reason to leave it. Zero to two, only when the destination is itself a reason to be in this region (an island castle, a UNESCO landscape) and reachable as a genuine day trip. Give the transit route and time from the city.

Three passes feed the candidate pool, every entry tagged with all sources that surfaced it:

- **Reddit** (per Reaching Reddit): things to do, itineraries, the city or country subreddit — plus two dedicated queries the general threads miss: `immersive art <city>` and `best view of <city>`. **Collect suggestions only** — not Reddit's warnings, tourist-trap callouts, or locals-vs-tourists discourse. Weight what recurs across independent threads; link the thread you took each entry from.
- **Atlas Obscura**: `site:atlasobscura.com <city>` — the genuinely odd entries, not the ones that are just the city's main museum.
- **Named local press**: the city's own what's-on and culture coverage — the same publications the Events pass reads double as a things-to-do source; tag by publication name.
- **Your own picks**, tagged `my pick`.

### 2. Events

Everything here is date-dependent: only what falls **inside the travel window**, in four subsections. A subsection with nothing is deleted heading-and-all, and losing the whole section is a normal outcome for most cities in most weeks — no "nothing major, but you could check X", no list of what you ruled out. Each entry: name, confirmed dates, one line on what physically happens, tickets or not, official link, venue Maps link, source tags. **Confirm every candidate's dates or run on its official page** — recurring events move, so never print a date you have not confirmed for the travel year (write "this year's dates unconfirmed" instead). An entry with sellout-risk tickets also gets a Book-ahead row.

1. **Cultural** — events unique to this place: a local saint's day or seasonal rite, a festival the city is actually known for, a seasonal phenomenon, a genuine one-off (anniversary, landmark reopening). The test: a reason to be in this city on those dates rather than any other city. Excluded without exception: club nights and DJ sets, food-truck rallies, farmers'/craft/seasonal markets (unless that market is itself famous), running events, and touring productions — those belong in Music or Shows if anywhere.
2. **Music** — artists playing the window and music festivals. The bar is an act or lineup the traveler would plan an evening around — a name with a real following or a festival with an identity — not every pub gig; touring is fine here, that is what concerts are. Discovery: the season calendars of the city's main halls and arenas, plus a concert listings service (Songkick, Bandsintown) as a finder only — then confirm on the venue's or artist's own page.
3. **Shows** — what's on stage during the window: musicals and theater runs, opera/ballet/symphony from resident companies' seasons, notable stand-up. The bar: a production they can't see at home, a resident company's season, a landmark venue where attending anything is the point (the Staatsoper, the Globe), or a comedian with a real following. Check the season calendars of the city's two or three flagship venues for the dates.
4. **Exhibitions** — the major temporary or loan exhibition on during the window: the show the museum itself is billing as the event of the season, not the permanent collection (that lives in Things to do).

Research: the tourism board's calendar for the month and year; named local press; flagship venue and club season calendars; the Reddit pass (`what's happening in <city> <month> <year>`).

### 3. Food

**Map the city's native formats first.** Before any source pass, write down the venue formats and everyday dishes this city invented or lives on — the seafood beer hall, the charcoal-chicken takeaway, the standing sandwich counter, the grill house, the market canteen — and run one query per format, on Reddit and on Maps. Generic best-restaurant queries miss whole formats, and the city's most-loved institutions live inside them; a format left unsearched is a category silently missing from the brief.

Then search all six source categories before writing anything:

- **Reddit** — the best-of queries plus the everyday ones (`where do locals actually eat in <city>`, `<city> cheap local food`), plus the standing-tier queries since those sections never surface on their own: the Asian queries — **one query per cuisine** (`best ramen <city>`, `best sichuan <city>`, `best pho <city>`…): a combined `ramen sushi chinese thai` query matches nothing on Reddit's search and returns zero results, and a zero-result query means re-run it split, not move on — plus the diaspora framing (`where do the chinese/korean expats eat in <city>` — the query that finds the real one), the café queries (`best bakery <city>`, `best sourdough <city>`, `best specialty coffee <city>`), and the bar queries (`best cocktail bar <city>`, `craft beer <city>`). Healthy staples runs on Maps instead — see its section. **Run the food queries in the local language too** (`melhor <format> <city>`, `restaurantes bons e baratos`): locals answer locals in their own language, and the flatly-named neighborhood institutions — especially diaspora ones — often appear *only* in those threads. Weight recurrence across independent threads over single enthusiastic comments — institutions get named flatly ("just go to X"), so keep an explicit tally of how many distinct commenters name each place across threads, not how excited they sound. The tally is one signal, not a ranking — but every place near the top of it gets consciously ruled in or out, never silently dropped. A recommendation harvested from a thread that was opened for another reason — a neighborhood thread, a concert-trip thread — enters the tally like any other; where the thread pointed is not part of the evidence. **Before writing, check the tally against the draft:** if the most-named place is missing or demoted to a dish mention, that is a filtering error until proven otherwise — and "it is a chain" or "the cooking is not ambitious" are not reasons.
- **Eater** — `eater.com <city>` and its map/guide pages. Often absent outside Eater's cities — then say so in the brief.
- **Michelin** — the **full city selection, not just the awards**: stars, Bib Gourmand, and the plain recommended tier. The recommended tier is where the institutions land — a city's legendary seafood hall is often in the guide without a star, and querying only stars and Bibs skips it entirely.
- **50 Best** — the World list and its 51–100, the relevant regional list, the Bars lists, and the **Discovery** city guide at `theworlds50best.com/discovery` (usually the only one with entries).
- **World of Mouth** — the chef-recommendation database: app-first but publicly readable at `worldofmouth.app/destinations/<city>` plus its "best restaurants in <city>" article. Recommendations come from named chefs, sommeliers and food writers, and the selection reaches the institution tier — the classic seafood hall, the grill house — not just fine dining. Link the restaurant's own page on the tag.
- **Named local press** — the city's own food coverage, by name: the local Time Out edition, the national newspaper's restaurant critic, the city's food magazine, the serious local blogs you would cite. Plus **Culinary Backstreets** where it covers the city — local bureau writers on everyday food culture, the one international outlet that reliably covers the institution tier. This layer catches the beloved neighborhood kitchens sitting between the everyday institutions and the Michelin tier — routinely invisible to Eater, Michelin, and Reddit's tourist-facing threads alike.

**Beli is app-only and stays out of the research loop.** It has no web surface — browser automation drives Chrome, not a phone app — so its rankings and leaderboards are unreachable; never imply it was checked. If the traveler uses Beli, they can paste their city leaderboard or lists into the chat: treat that as a real source, tag it `beli`, and weight it as the traveler's own network rather than editorial.

Distribute into eight sections, tagging every source. **Each restaurant appears once**, in the section that says most about it — Everyday institutions over Local dishes, Top picks over Creative. The sections split into two tiers:

- **The headline tier — Top picks, Creative and interesting, Everyday institutions.** One shared candidate pool: everything the source passes surfaced. Creative and Everyday institutions are real sections in their own right *and* the feeders for Top picks — a top pick is almost always the best of one of those two lists. Three rules apply to this tier (and only this tier):
  - **A non-local cuisine must earn its place twice.** The traveler can eat good Italian at home, so "very good" is not enough — it must do something unavailable at home: a real crossover, a diaspora cuisine with roots in this city, a technique meeting ingredients it never meets elsewhere. (East and Southeast Asian food is exempt — it has its own standing section below.)
  - **Chains:** the test is "interchangeable with home", not "multiple locations". International franchises are out; a domestic chain that is the mass vehicle for the national cooking is an institution, and goes in.
  - **Tasting menus** are the default format of ambitious restaurants everywhere — the least distinguishing thing about a city. One or two per brief, when the cooking is the reason, is plenty. Among ambitious kitchens, the one interpreting the national cuisine outranks the placeless international tasting menu — modern local cooking is the thing that exists only here, and an award does not override this ordering.
- **The standing tier — Asian food, Cafés and bakeries, Healthy staples, Cocktail bars and breweries.** These answer "if I feel like X in this city, where do I go" — so each is **researched independently with its own dedicated queries**, never filtered out of the general pool, and each earns its place even when nothing in it would make the headline tier. "Distinctive to this place" and the non-local rule do not apply here; each section has its own bar, stated below. A section whose queries never ran is a research gap, not a thin city.

**Local dishes belongs to neither tier** — it is the city's dish canon, not a venue list, and it **opens the Food section** as orientation before any restaurant appears; the venue sections follow it.

The sections, in render order:

- **Local dishes.** Three to five, and the list should be stable run to run — it is the city's canon, not whatever surfaced this time. Qualifies: the dishes this city or region is actually known for — the ones a local would insist a first-time visitor tries — plus anything with a seasonal window overlapping the dates (name the window). The candidates come from the format map's everyday-dish list and a dedicated Reddit query (`what dishes must I try in <city>`), not from recall. Per dish: what it is in one line, then one or two places to eat it. Not a parking spot for a restaurant that deserves its own entry — give the venue its full entry in a section below and reference it here.
- **Top picks.** The absolute must-gos: the three to five places they would be sorriest to miss, **regardless of category, price, format or cuisine** — not the fine-dining tier. A canteen, a grill house, a bakery and one ambitious kitchen belong in the same list. **The departure test, applied to every entry:** once home, could they replicate this meal? If yes — however good it is — it is not a top pick; the best ramen in a city not known for ramen belongs in Asian food, and awards or Reddit unanimity do not exempt it. Spread check before publishing: if every entry is a tasting menu, all €50+, or the list could have been generated from the Michelin guide alone, it got sorted by prestige — rebuild it; at least one entry should be somewhere a local eats on an ordinary weekday. A listing is never the reason to include — genuine raves, recurrence, or the food itself are.
- **Creative and interesting.** Optimized for **cooking no one else is doing**: an interesting take on the local cuisine, a fusion that could only happen here, an unfamiliar technique or ingredient set, a format that does not exist elsewhere. Novelty is the ranking key — between two good kitchens, the one doing something the other city's kitchens aren't wins. "Seasonal tasting menu of local produce" is the house style of every ambitious restaurant on earth and does not qualify; neither do open kitchens, chef's tables, or own farms — settings and supply chains, not cooking. The best entry here often graduates to Top picks; the section holds the rest. Omit only when the city genuinely has no kitchen doing something of its own.
- **Everyday institutions.** Canteens, market-hall counters, workers' lunch halls, a long-running domestic chain — where the city eats its own food on an ordinary Tuesday. Optimized for **what tastes good**, in an untransplantable local institution; cheap and unglamorous is the profile, not the bar. "Where locals actually go" is corroborating evidence, not the objective — locals also optimize for price, portions, and nostalgia, so a locals' favourite that tastes mediocre stays out, and tourists also loving a place is not a strike. **Search for these deliberately** — every source is biased against them. A high review count at a middling rating (9k at 4.4) is the signature of the category, not a warning — and Maps itself is the reliable finder: when an unfamiliar name at institution scale (10k+ reviews) surfaces in "People also search for" during ratings verification, that is a missed candidate to chase, not sidebar noise. When locals knock an institution, read *which* complaint it is: "touristy", "overhyped", "I haven't been in years" are not reasons to cut — locals are routinely embarrassed by their own beloved canteen chain; "the food is bad" is a reason. Judge the complaint actually being made, not the tone.
- **Asian food.** East and Southeast Asian only — Japanese, Chinese, Korean, Thai, Vietnamese, Malaysian, Indonesian. South Asian (Indian, Nepalese, Pakistani, Sri Lankan) does not appear, even when the local diaspora story is real. The bar is **authentic**: a cook making their own cuisine for people who grew up on it — no mediocre ramen, supermarket sushi, or generic stir-fries, and "the best Thai in a city with no Thai food" is not a recommendation. Include only on real evidence: a cook making their own cuisine, a diaspora that actually eats there, expat/diaspora threads vouching by name, or a rating that holds up against the city's best. **Rank the evidence right:** a local flatly naming a place in a local-language thread outranks an editorial writeup — the curiosity piece about a venue is a journalist's signal, the flat naming is an eater's. Diaspora food clusters where the diaspora lives, usually outside the tourist core — distance from the center is never a strike, and an outlying district being "not where the trip is based" is not a reason to drop its candidates. Every Asian candidate surfaced anywhere in the pass gets consciously ruled in or out against the ones already drafted — "the slot for that cuisine is filled" is not a comparison. Be regionally specific — *Hakata tonkotsu*, *Sichuan*, *Isaan* — and name the dish to order. Promotion into Top picks requires world-class by global standards, not best-in-this-city.
- **Cafés and bakeries.** Three things to look for, each on its own query: **sourdough** (a bakery doing real naturally-leavened bread), **good pastries** (proper lamination — or the local specialty bake done seriously), and **good coffee** (a specialty roaster or a shop that treats it as one). One place clearing two or three bars beats three clearing one. Craft is the whole test — a café this good would earn its place at home too, and that is fine here. Name the thing to order.
- **Healthy staples.** The repeatable healthy default for a week of eating out: **good macros and actually tasty** — grilled protein, vegetables, bowls done well, food you would choose rather than concede to. Provenance irrelevant; one or two entries. **Maps in the browser is the primary finder for this section, not a verification step:** run a category search (`healthy bowls <city>`, `salad <city>`, `poke <city>`) during the browser pass — it costs no search budget, and the archetype it surfaces is a local fast-casual chain with several locations and strong ratings. Web-searching this category returns recipe listicles and aggregator noise; do not delegate it to a search subagent, and treat "only one weak candidate found" as a failed search to re-run on Maps, not as the answer. Reddit's expat and living-here threads are the secondary source. If the city has no genuinely good option, omit the section — a mediocre salad chain is not a staple.
- **Cocktail bars and breweries.** The bar is **interesting — doing things no one else is doing**: a house fermentation program, a menu built on local ingredients no other bar touches, a brewing tradition or style particular to here. "Well-executed classics in a nice room" exists in every city and does not qualify. The 50 Best Bars results land here when they clear that bar — the ranking is provenance; the description says the interesting thing they pour. Omit the section if there is no real scene.

### 4. Where to stay

**Two or three neighborhoods that fit this traveler** — not a survey with a nightlife pick and a families pick; that menu is written for someone else. Qualifies: walkable or on transit that actually runs; quiet (a bar strip is disqualifying, and nightlife is never a reason to list an area); ordinary daily life in reach — supermarket, gym, a park or river path to run. The summary test: **could they live here for a week?** Proximity to the sights is not a criterion and not a ranking key.

Per entry: one line on what the area is like to be in, the daily-life note, and the tradeoff. Flag an area as "avoid" only when the traveler might genuinely book it and regret it (reads central on a map, is a party strip; cut off when the buses stop) — no crime surveys of districts they would never consider.

### 5. Book ahead

Only entries with **evidence of day-of failure**: a booking page showing weeks unavailable, an operator's stated cutoff, a lottery or permit system, reported sellouts — and cite the evidence. Unverifiable → dropped entirely: no "unconfirmed" rows, no lead-time estimates, no inclusion for mere popularity or timed tickets. Cover restaurants, tours/sites/experiences, and ticketed events from the Events section; flag anything booking more than a month out; name the channel (own site, Tock, Resy, phone only). Lead times are relative to the user's dates — say **when to book**, not just how far ahead. If nothing qualifies, one line saying so and no table.

### 6. Practical basics

Three one-liners, then Getting around as a real subsection:

- **Tap water** — potable or not, plus the local caveat.
- **Tipping** — expected or not, roughly how much, in which contexts.
- **Cash and cards** — can they tap a card for everything, or where is cash still needed (markets, small places, transit)?

#### Getting around

**Two rows and a verdict — Transit, Rides, the call.** Payment mechanics, prices and hours are one-liners folded into their row, not rows of their own.

- **Transit.** The modes that exist and — the part that matters — whether the network reaches where a visitor goes or is a commuter system that misses the sights. Fold in: how you pay (contactless bank card / **named** local card / **named** app / cash — flag foreign-card failures on readers and on-board validation plus the fine, both of which catch visitors); single and day-pass fares in local currency **with USD**; when service stops at night. Tourist card only if actually worth buying.
- **Rides.** Which apps genuinely operate, **by name** (Uber, Bolt, Grab, Didi, inDrive, local equivalents) — never assume Uber. Street-hail and meter norms. Typical short cross-town and airport-to-center fares (local + USD), so they compare against the transit fare. The standard airport-taxi overcharge if the city has one.
- **Verdict.** Rely on transit, default to rides, or walk + rides for the edges — with the reason, comparing the costs above. Walkability of the center (end-to-end time) and bike share by name belong here, as part of the answer.

Search the fares — they revise annually. Never invent a fare or ride estimate; write "could not confirm" and keep the rest. Attach the year to anything confirmed.

### 7. Country background

- **GDP** — nominal total and per capita, with source and year.
- **Economy** — three or four main drivers.
- **Tech scene** — the most notable startups/tech companies: what each does, funding or valuation with year, unicorn/exit status; name any sector concentration (fintech licensing, gaming, semiconductors). Search current figures — these date fast.
- **History in ~5 beats**, ending at the present — enough to make what they see legible.
- **Culture** — below.
- **Languages** — what is spoken, and how far English gets you.
- **~10 phrases** — native script, phonetic rendering, English: hello, please, thank you, excuse me, yes/no, do you speak English, how much is this, the bill please, where is the bathroom, cheers.

#### Culture

**Three or four entries, and there is no floor** — two strong entries beat five with filler, and reaching for a fifth is the signal to stop, not to lower the bar. The things a traveler would notice, wonder about, and not be able to guess: a national obsession with real hold; etiquette they would actually get wrong; visible religion or folk ritual; a daily-rhythm difference (dinner time, Sunday closures); a craft or art form met in life rather than in a shop window; an attitude or self-understanding that explains what they will see and hear.

Two tests, in order. **Swap the country name** — if the line survives, cut it ("sauna culture is deeply important to the national identity" survives; "public saunas run to 90°C and strangers share them naked" does not). Then the **encounter test** — will the traveler actually run into this, or does it explain something they would otherwise misread? If neither, it is trivia. The three kinds of trivia that keep getting in: **shopping and souvenir logistics** (which streets sell the amber — a retail directory, not culture); **one-off news items and municipal gestures** (a street renamed to needle an embassy — a single event is not a culture); **traditions living somewhere the traveler is not going** (a craft practised 200km away is background for a different trip).

One or two lines per entry, concrete fact first. No do's-and-don'ts list, no moralizing about respecting customs.

## Accuracy rules

- Anything from your own knowledge rather than a search is labeled as such.
- Never fabricate a rating, review count, funding figure, booking lead time, fare, or event date — omit rather than estimate.
- Award lists, GDP figures, funding totals, fares, and tipping norms drift: attach a year to each.
- Prefer "could not confirm" to a plausible guess — except in Book ahead, where an unconfirmed entry is simply dropped.

## Pre-publish checklist

Run this pass over the finished draft, in order, before assembling the artifact. These checks repeat rules stated above — that is the point; they are the ones that get lost between research and writing.

1. **Departure test, every Top pick:** once home, could they replicate this meal? If yes, move it to its category section or cut it — awards and Reddit unanimity do not exempt it.
2. **Spread check, Top picks:** not all tasting menus, not all €50+, not derivable from the Michelin guide alone; at least one entry is somewhere a local eats on an ordinary weekday.
3. **Things-to-do Top picks:** every entry was promoted from a category group (Unique, Views and nature, Museums and galleries, Tours), none is a day trip, and nothing appears in both Top picks and its category.
4. **Ambitious-kitchen slot:** if the brief includes one ambitious kitchen, it is the one interpreting the national cuisine, not the placeless tasting menu — regardless of which holds the award.
5. **Tally vs. draft:** every place named in any read thread — including local-language threads and threads opened for another reason — is either in the brief or was consciously ruled out for a reason that isn't "chain", "touristy", "not ambitious", or "wrong part of town".
6. **Query completeness:** every standing-tier section got its own pass — the per-cuisine Asian queries, the café/sourdough/coffee queries, the cocktail/craft-beer queries, and the Maps category search for Healthy staples — a section drafted from one weak candidate is a failed search, not a thin city.
7. **Format and dish coverage:** every native venue format and everyday dish named at the start of the Food pass is represented in the brief or was consciously ruled out — an unsearched or unrepresented one is a research gap, not an editorial choice.
8. **Events:** every printed date or run confirmed on the event's or venue's own page for the travel year, or marked "this year's dates unconfirmed". Nothing outside the travel window; empty subsections deleted heading-and-all.
9. **Ratings:** every rating has a review count; none invented; every list sorted by rating descending, unrated last.
10. **Source tags:** every Things to do, Events, and Food entry carries all its tags; every reddit tag links its thread; no aggregator-sourced entries or numbers.
11. **Empty sections:** anything that didn't clear the bar is deleted heading-and-all, leaving no trace — except Book ahead's "nothing needs advance booking" line and source-availability callouts.
12. **Book ahead:** every row cites its evidence; anything unverifiable is dropped, not hedged.
13. **Years attached:** every fare, award, GDP figure, funding total, and tipping norm carries its year.

## Output

One self-contained HTML artifact, following `reference/brief-template.html`. In Claude chat, emit the artifact directly (no files); in Claude Code, write to a scratch file and publish with the Artifact tool — never into the user's project.

- Title: `<City> — Travel Brief`. Header shows travel dates, research date, and one line of expected weather for the dates (typical high/low, rain likelihood, daylight — climate normals from own knowledge are fine, labeled per Accuracy rules).
- A one-line anchor nav under the header so each section is one tap away on a phone.
- Any section or group with nothing that cleared the bar is dropped heading-and-all, with no sentence noting the omission (Events subsections, nature entries, and Day trips are the usual cases; a food section can be empty too, but only after its own query pass ran and came back dry).
- Readable on a phone; works in light and dark themes; no external requests — all CSS inline, nothing remote loaded (links out are fine).
- Every place name links to Google Maps; ratings render as a visible badge; every Things-to-do, Events, and Food entry shows all its source tags; reddit tags link to their thread.
- Book-ahead entries render as a table with a visible lead-time column.

After publishing, give a three-or-four-line chat summary: the single highest-value thing to book immediately, anything notable falling in their dates, and anything you could not confirm.
