---
name: travel-brief
description: Research a travel destination and produce a single-page briefing artifact covering things to do, local events and festivals falling in the travel dates, restaurants, neighborhoods, what to book ahead, practical basics including how to get around on transit versus rides, and country background including local culture. Takes a city and the travel dates, and asks for either if not given. Use when the user names a city or country they are planning to visit, asks for trip research, a travel brief, or "what should I know about <place>".
---

# Travel Brief

Research a destination against a fixed checklist and publish the result as a single self-contained HTML artifact.

## Input

Two things are required: **a city and the travel dates.**

- If they name only a country, ask which city or cities before researching — most of the brief is city-scoped.
- If they do not give dates, **ask for them before researching.** Dates drive the Events section and the Book-ahead lead times, and both are wrong or unwritable without them. Approximate dates are fine ("mid-May", "the first week of October") — say that when you ask, so the user does not think you need an itinerary.

Ask for whatever is missing in one message, then research. Do not start the brief and ask afterwards.

## Traveler profile

The brief is written for one specific traveler. Their taste drives what gets included and what gets cut:

- **Things to do.** Highest priority is what is *unique to this place and unavailable anywhere else*. After that: world-class nature, then museums that are themselves worth the trip.
- **Museums** are one category, not split by art/history. The bar is high: include a museum only if it is unique to this place, covers something genuinely interesting, or is world class. A competent regional museum with a standard collection does not go in, however well reviewed.
- **Nature** is not included for its own sake. Only world-class hikes and sights — the ones that are a reason to go. A pleasant city park is not one. **If nothing in the city clears that bar, omit the Nature section entirely** rather than filling it with green space — silently, with no line explaining the omission.
- **Tours.** Walking and biking tours run by locals or small independent operators. Aggregator listings and multi-city chains (GetYourGuide, Viator, SANDEMANs, big bus companies) do not go in the brief at all — this is a filter, not a preference, so there is no need to label the survivors as local. Food tours are welcome when the tour itself is interesting and the city is genuinely known for food.
- **Food.** The bar is **how good the food is**, and nothing else. Not the room, not the ambiance, not the seasonality, not the farm the vegetables came from, not the award. A tasting menu of foraged seasonal produce in a beautiful space is worth nothing here if the cooking is merely competent — and "seasonal", "locally sourced" and "own farm" describe procurement, not flavour, so they are not reasons to include a place and not what the description should lead with. Two things earn a spot: **cooking that is genuinely excellent**, and **food that is distinctive to this place** — the everyday institution where the country actually eats its own food.
- **Tasting menus are not a category worth chasing.** They are the default format of every ambitious restaurant on earth, which makes them the least distinguishing thing about a city. One or two, when the cooking is the reason, is plenty for a whole brief. A food section that is mostly tasting menus has described the global fine-dining circuit rather than this city.
- **A cuisine that is not the local one has to earn its place twice.** Good Italian in Vilnius, good French in Bangkok, good steak in Lisbon — the traveler can eat that at home, so "it is very good" is not sufficient. It has to be doing something unavailable at home: an unexpected crossover, a diaspora cuisine with real roots in this city, a technique applied to ingredients it never meets elsewhere. Indian cooking built on Lithuanian produce earns it. A well-executed Neapolitan pizzeria does not, whatever its rating. (Asian food is the standing exception — see its own section under Food.)
- **Everyday institutions count as much as ambitious kitchens.** A canteen, a market-hall counter, a workers' lunch hall, a beloved domestic chain — if it is where locals eat the national dishes, it belongs in the brief, often above a tasting menu. This traveler will remember a €10 plate of grey peas at the local canteen longer than a competent nine-course menu, because the canteen only exists here.
- **Where to stay.** Somewhere they could imagine living for a week, not somewhere convenient to the sights. Walkable or on a real transit line, quiet, with ordinary daily-life infrastructure in reach — a supermarket, a gym, somewhere to run. A party district is a mark against, not a draw, and closeness to the attractions is close to irrelevant.
- **Not wanted.** Generic city attractions available in any European/Asian/American capital, and "hidden gem" cafés indistinguishable from ones at home. **On chains, the test is "interchangeable with home," not "has multiple locations."** An international franchise, or a local imitation of one, is out. A chain that exists only in this country and is the mass vehicle for its national cooking is the opposite — its scale is evidence it is an institution, and it goes in.

## Be short

Every section is a shortlist, not a survey. Include something only if you would genuinely tell a friend to go. **Three to five entries per group is the target, and fewer is better than padded** — a group with two strong entries beats one with six where three are filler.

**An omitted section leaves no trace.** If a group has nothing that clears the bar, delete the heading and move on — do not write a line explaining that you looked and found nothing, and do not name what you rejected or why. "Nature: nothing near this city clears a world-class bar, so this section is omitted" is exactly the sentence not to write. The reader is not auditing your process; a section that is not there reads as "not applicable here," which is the whole message.

Two things are not covered by this rule, and both still get written:

- A section whose *absence is itself the answer to a question the traveler is asking*. Book ahead is the case: "nothing here needs booking in advance" is a useful fact that saves them worrying, so that one gets its single line (see below). No other section qualifies.
- A **source** that produced nothing, as opposed to a section that did — "Eater has no coverage of this city," "Reddit was unreachable this run." That is a note about the brief's evidence base, it tells the reader why the tags skew the way they do, and it is required under **Source tags** above. Keep those. The rule here is about not narrating your *selection* decisions, not about hiding your sourcing.

## How to write an entry

The selection bars in this skill decide **what goes in**. They are not what you write. Once something is in the brief, the reader already knows you vouch for it — the description's whole job is to say **what the thing is and what is distinctive about it**, in one line or two.

Describe, do not sell. Concretely, that means:

- **No superlatives or endorsement language.** Cut "world-class", "genuinely unique", "unmissable", "a must", "worth the trip", "one of the best in Europe", "in a way no other museum does", "clears the bar", "raved about". If you find yourself writing why something deserves its place, delete the sentence — the entry's presence already says that.
- **Lead with the concrete fact that makes it distinctive.** "The only surviving wooden synagogue in the country, interior painted 1780" beats "a truly exceptional example of regional heritage architecture". A specific noun, date, technique, material, or number does the work that an adjective was trying to do.
- **No comparison to what you rejected.** "Not just a nice park" and "unlike the usual tourist trap" describe your filtering process, which is not information.
- **No hedged enthusiasm.** "Widely loved", "people rave about it", "much talked about" are about reception, not the thing. Reception is already carried by the rating and the source tags — do not restate it in prose.
- **For restaurants**, say what the cooking is: cuisine, technique, format, and one or two dishes to order. Not the award, not the acclaim.
- **For events**, say what happens at it and what makes it particular to this place. "Residents float candlelit wreaths down the river at dusk" — not "a beloved local celebration".

A useful test: if the sentence would still be true of a different, mediocre place in the same category, it is not describing anything. Rewrite it with a fact.

Keep it tight — one line is normal, two is the ceiling. The reader is scanning on a phone.

## Ratings and links

Every named place — attraction, restaurant, café, bar, bakery, tour operator — gets, where obtainable:

- A **Google Maps link**. Build it as `https://www.google.com/maps/search/?api=1&query=<url-encoded name + city>`. This form is stable and does not require a place ID.
- Its **Google star rating with the review count**, e.g. `4.6 ★ (2,341)`. Search for it — do not recall it from memory.

**The review count is not optional.** A bare `4.9 ★` is close to useless — 4.9 from 12 reviews and 4.9 from 12,000 are different facts. Always show both numbers together. If you can confirm a rating but not its count, write the count as `(count unknown)` so the gap is visible rather than hidden.

**Never invent a rating.** If a search does not surface the current Google rating, omit the rating for that entry rather than estimating. A fabricated number here is worse than a missing one. Review counts drift, so approximate counts (`~2.3k`) are fine.

**Google ratings only.** Do not substitute a TripAdvisor or Yelp score when the Google rating is missing — different scales, different populations, not comparable, and not a source this traveler trusts. Write "no rating found" and move on.

**Sort every list by rating, descending**, so the best-rated entry appears first. Where the section is grouped by category (see Things to do), sort within each group. Entries with no confirmed rating go at the bottom of their group.

## Source tags

**Every entry in Things to do, Events and Food carries a visible source tag** — no exceptions, including your own recommendations. The tag says where the entry came from:

| Tag | Means |
|---|---|
| `reddit` | Surfaced on Reddit. Link the thread on the tag itself. |
| `atlas obscura` | From an Atlas Obscura entry. |
| `michelin` | On the Michelin guide — append the year (`michelin ★ 2026`, `michelin bib 2026`). |
| `50 best` | Ranked on a 50 Best list — append year and rank, and say which list when it is not the World restaurants one (`50 best #34 2026`, `50 best bars #12 2026`, `asia's 50 best #7 2026`). |
| `50 best discovery` | On the 50 Best Discovery platform but **not ranked on any list**. A weaker signal — see below. |
| `eater` | Covered by Eater. Link the article. |
| *named publication* | Any other real editorial source, tagged by its actual name — `lrt`, `condé nast`, `in your pocket`, `falstaff`. Link it. |
| `my pick` | Your own knowledge, not surfaced by any search. |

**50 Best Discovery is a different thing from the ranked lists.** It is 50 Best's year-round platform of venues that Academy members voted for or recommended without those venues placing on a ranked list — roughly 3,000+ restaurants and bars worldwide, organised as city guides. That makes it far more useful than the top-50 lists for any city outside the handful that produce ranked entries, and it is the main reason to check 50 Best for a mid-sized city at all.

It is also a much weaker signal than a rank, and the two must not be blurred. Tag a Discovery-only venue `50 best discovery`, never plain `50 best`, and never invent a rank for it. Being on Discovery is not on its own a reason to include a place — the volume is in the thousands. Treat it as one corroborating source among several, useful mainly when it agrees with Reddit or local press.

**There is no generic `guides` tag.** It was removed because it hid the distinction that matters — whether a recommendation came from a real editorial voice or from a scraped listicle. Name the actual publication, or use `my pick` if it is really your own judgment. If a place surfaced only somewhere you would not want to cite by name, that is a signal not to include it.

**Do not source from large review aggregators.** TripAdvisor, Yelp, Wanderlog, RestaurantGuru and the SEO listicle farms that rewrite them are not acceptable sources — they are not a signal this traveler trusts, and their ratings must not stand in for a Google rating either. Prefer Reddit, Atlas Obscura, Eater, Michelin, 50 Best, local press, and city tourism boards.

**If a place appears in more than one source, show every applicable tag.** A restaurant Reddit raves about that Eater also covered gets both `reddit` and `eater`. Cross-source agreement is the most useful signal in the brief, and stacked tags are how the reader sees it.

Tags describe provenance, not endorsement — a `michelin` tag is not a reason to include something. See the Food rules below.

If a source category is unreachable during research, say so plainly in a callout near the affected section rather than silently substituting another source under the wrong tag.

## Reaching Reddit

Reddit is the most valuable source in this brief and the most likely to fail.

**Known as of August 2026:** direct fetches of `reddit.com` are refused at the tool level, with a message naming the domain (`unable to fetch from www.reddit.com`) rather than an HTTP error. This is a deliberate blocklist, not rate limiting or bot detection — retrying, changing user agent, or using `.json` / `old.reddit.com` endpoints does not help. Public front-ends (redlib, safereddit) were dead when last checked, and `curl` reaches the host but gets a bot-block interstitial.

Also: **`site:reddit.com` inside a query string does not work.** The search backend ignores it and returns travel-listicle results, which is how earlier runs concluded "Reddit unreachable" while never actually querying Reddit.

**Browser control is the route that works — verified August 2026.** Claude in Chrome (`mcp__claude-in-chrome__*` in Claude Code, the browser extension on claude.ai) drives the user's own logged-in browser rather than fetching server-side, which is why it clears the block. Search results and full comment threads both read fine.

Use Reddit's own search UI in the browser and stay inside it. **This costs zero web-search budget** — a significant advantage given how search-hungry the rest of the brief is.

1. Navigate to `https://www.reddit.com/r/<citysubreddit>/search/?q=<query>&restrict_sr=1&sort=top&t=year`. Swap `restrict_sr=1` out to search all of Reddit when the local subreddit is thin. `get_page_text` returns the result list with vote and comment counts.
2. Pick threads by comment count, not upvotes — recommendations live in the comments, and a 3-upvote thread with 24 comments beats a 200-upvote photo post.
3. `find` the thread link to get its href, then navigate and `get_page_text`. Batch the navigate + read into one `browser_batch` call.
4. Close tabs you opened when done.

If the extension is not connected, say so plainly rather than reporting Reddit as blocked — the user can connect it and re-run. Only then fall back:

- **Domain-filtered search.** Use the search tool's domain-restriction parameter, never a `site:` prefix — in Claude Code that is `WebSearch` with `allowed_domains: ["reddit.com"]`. This may surface thread titles and URLs even when fetching is refused, which is still useful for pointing the browser at the right threads.
- **Ask the user to paste threads.** Say what you would search for. This is a better outcome than silently shipping a brief with no Reddit signal.

Never report Reddit as unreachable without naming the specific attempts you made.

**Do the Reddit pass serially, in one agent.** The browser is a single shared resource with one tab group — parallel subagents driving it will navigate each other's tabs out from under themselves. Fan out the rest of the research (ratings, Michelin, Eater, local press, events calendars, country background) across subagents as usual, but keep Reddit in a single sequential pass and hand its results to whoever assembles the brief.

**When Reddit is unavailable, lean harder on Eater and named local press** rather than backfilling with aggregators. Those sources cover much of the same ground — where people actually eat and go — and remain reachable.

**Watch the search budget.** A session has a fixed web-search allowance and this skill is search-hungry — a full brief can exhaust it, especially when farmed out to parallel subagents. Spend it on Reddit and on Google ratings first; those are the two things nothing else substitutes for. If searches start returning budget errors, stop and tell the user rather than quietly writing a thinner brief.

**Never claim a source was blocked when you did not try it.** Reporting "unreachable" for something you never queried, or that merely returned no results, is worse than reporting nothing — it sends the user chasing an infrastructure problem that does not exist. Say which specific attempts you made.

## Research procedure

Work through the sections below using web search. Search each source category separately rather than issuing one broad query — the point of this skill is consistent coverage, not speed.

### 1. Things to do

Four groups, in this order, sorted by rating within each:

1. **Unique to this city** — things that exist here and effectively nowhere else. The heart of the brief; give it the most room.
2. **Nature** — world-class hikes and sights only. **Omit this group entirely if the city has none** rather than listing parks to fill it, and without a note saying you did.
3. **Museums** — art and history together in one group. Include only museums that are unique to this place, cover something genuinely interesting, or are world class. Skip small regional museums and standard collections you could see anywhere. This group is often only one or two entries, and that is the correct length.
4. **Tours** — walking and biking, run by locals or small independent operators. Name the operator. Drop aggregator and chain listings entirely rather than including them with a caveat; since every tour listed is local by definition, do not tag them as such. Food tours only if the city warrants one.

Three or four entries per group, and only ones genuinely worth the traveler's time — see **Be short** above.

Draw candidates from three passes, and tag every entry with all sources that surfaced it:

- **Reddit.** Work the ladder in **Reaching Reddit** above — domain-filtered search first, never a bare `site:` prefix. Query for things to do, itineraries, and the city or country subreddit. Weight recommendations recurring across multiple independent threads over a single enthusiastic comment. Prefer threads from the last ~2 years. **Collect suggestions only** — the traveler does not want Reddit's warnings, tourist-trap callouts, or locals-vs-tourists commentary. Just what to go see. Link the thread you took it from.
- **Atlas Obscura.** Search `site:atlasobscura.com <city>`. Pull the genuinely odd entries, not the ones that are just the city's main museum.
- **Your own picks.** Add recommendations from your own knowledge that the above missed, tagged `my pick` — they are your judgment, not a citation.

### 2. Events and festivals

What is happening in the city **during the user's dates specifically** — not a year-round calendar. Check each date against the trip window before including anything; a festival two weeks after they leave is noise.

**The bar is the same as Things to do: unique to this place.** Include an event only if it is a reason to be in this city on those dates rather than any other city. Good candidates:

- Festivals particular to the city or country — a saint's day, a harvest or seasonal rite, a local carnival, a tradition with a name locals would recognize.
- One-off or annual cultural events with real standing: a film, music, literature or arts festival the city is actually known for.
- Seasonal phenomena tied to the place — a bloom, a migration, a light season, an opening or closing day that only happens here.
- A genuinely notable one-time occurrence in that window: a major exhibition on loan, an anniversary, a landmark reopening.

**Excluded, without exception:** generic club nights and DJ sets, touring acts and stadium concerts that play thirty other cities, food-truck rallies, farmers' markets, craft fairs, seasonal markets indistinguishable from ones anywhere else, running events, and anything a comparable city has its own version of. A Christmas market is only in scope if that particular market is itself famous.

**Omit the whole section if nothing clears the bar** — heading included, so the brief goes straight from Things to do to Food. This is the expected outcome for most cities in most weeks. Do not write "nothing major is scheduled, but you could check X," and do not list the festivals you checked and ruled out for falling outside the window.

Research it:

- Search the city tourism board's events calendar for the specific month and year.
- Search named local press and city-listings publications for the month — these carry the things the tourism board misses.
- Ask on the Reddit pass: `what's happening in <city> <month> <year>`, `<city> festivals <month>`. Reddit is good at surfacing the local tradition nobody writes an English-language page about.
- Search the festival by name once you have a candidate, to confirm this year's dates. **Recurring festivals move** — do not assume last year's dates carry over, and do not carry a date from your own memory.

For each event include: name, **confirmed dates**, one line on what actually happens at it and what makes it particular to this place, whether it needs tickets, and a link to the official page. Where the event has a fixed venue, link it to Google Maps as usual. Source-tag entries the same way as everything else.

**Never state dates you have not confirmed for the user's travel year.** If you find a festival that plausibly falls in the window but cannot confirm this year's dates, say exactly that in the entry rather than printing a date. And if an event needs tickets that sell out, it belongs in **Book ahead** as well.

### 3. Food

Seven sections, each sorted by rating, each a shortlist. Search all four source categories before writing any of them:

- **Reddit** — best restaurants, where to eat, the local subreddit. Work the ladder in **Reaching Reddit**. Ask the everyday question as well as the best-of one: `where do locals actually eat in <city>`, `<city> cheap local food`, `most Latvian/Thai/Portuguese meal in <city>`. Ask the Asian question separately, since it never surfaces on its own: `best asian food <city>`, `best ramen/sushi/chinese/thai/vietnamese <city>`, and the diaspora framing — `where do the chinese/japanese/korean expats eat in <city>` — which is the query that finds the real one. **Weight what recurs across independent threads above a single enthusiastic comment** — and note that the everyday institution is named flatly rather than raved about, so judge it by how many separate people name it, not by how excited they sound.

  **Before you write the food sections, check the recurrence list against the draft.** If the place named by the most separate commenters is missing, or has been demoted to a supporting mention under a dish, that is a filtering error until proven otherwise — name the reason you cut it, and if the reason is "it is a chain" or "the cooking is not ambitious", it is not a reason. Cross-source and cross-thread agreement is the strongest signal in this brief; a draft that buries the top-recurring place has thrown away its best evidence.
- **Eater** — search `eater.com <city>`, and the city's Eater map/guide pages if it has a local edition. Eater covers where people actually eat rather than where guides say to, so it is worth a pass of its own.
- **Michelin** — the current guide for the city, stars and Bib Gourmand.
- **50 Best** — four things, not one:
  - **World's 50 Best Restaurants**, including the extended 51–100.
  - The **relevant regional restaurants list** — Asia's, Latin America's, Middle East & North Africa's, and so on.
  - **World's 50 Best Bars**, its 51–100, and the regional bars list where one exists (Asia's, North America's). This feeds the cocktail bars section.
  - **50 Best Discovery** — the city guide at `theworlds50best.com/discovery`, covering both restaurants and bars. Most cities have Discovery entries and no ranked ones, so for anywhere outside the major capitals this is the only part of 50 Best that will return anything. Search `50 best discovery <city>` and read the city page.

  Ranked entries get `50 best` with the list, year and rank; Discovery-only entries get `50 best discovery` and no rank. See **Source tags** for why the distinction matters and how little weight Discovery carries alone.

Then distribute what you found across the sections below, tagging each entry with every source it appeared in.

- **Top picks.** The three to five places the traveler would be sorriest to miss — **regardless of category, price, format or cuisine**. This section leads the food coverage. Draw from all sources and tag accordingly: `reddit`, `eater`, `michelin ★ 2026`, `50 best #34 2026`, or several at once.

  **This is not the fine-dining tier.** A canteen, a market-hall counter, a grill house, a bakery and one ambitious kitchen can all sit in this list together, and the strongest version of this section usually does. The question is "would I tell a friend they have to eat here", not "which of these is the most serious restaurant."

  **If every entry is the same kind of place, the section is wrong.** All tasting menus, all €50+, all one price band — that means the list got sorted by prestige rather than by how much the food is worth eating. Before publishing, check the spread: at least one entry should be somewhere a local eats on an ordinary weekday, and if the whole list could have been generated from the Michelin guide alone, rebuild it.

  **A listing is not a reason to include something.** Only include a restaurant here when it is genuinely raved about — recurring across independent Reddit threads, a strong rating, or specific praise for the food itself. A starred restaurant nobody enthuses about does not belong; a beloved place on no list does. When a place carries an award tag, the description still describes the cooking — see **How to write an entry**.
- **Everyday institutions.** Where the city eats its own food on an ordinary Tuesday: canteens and self-service halls, market-hall counters, a long-running domestic chain, a workers' lunch place, a bakery-counter lunch. The bar is that **it is an institution here and could not be transplanted** — not that the cooking is ambitious. Cheap, unglamorous, and enormously popular is the profile, and none of those are marks against it.

  **Look for it deliberately — this section will not fill itself.** The research passes are biased toward it being empty: Michelin and 50 Best do not list canteens, Eater rarely covers them, and Reddit names them in flat, unexcited language ("just go to X", "all the locals eat there") that reads as weak signal next to an enthusiastic paragraph about a tasting menu. Ask the question directly: *where do people eat lunch here, and what is the place that exists in this country and nowhere else?*

  **A high review count with a middling rating is the signature of an institution**, not a warning — 9,000 reviews at 4.4 is a different and often more interesting fact than 300 reviews at 4.8. Do not let the rating sort talk you out of the entry.
- **Creative and interesting.** Only genuinely unusual cooking — an unfamiliar technique, an ingredient pairing you would not expect, a format that does not exist elsewhere.

  **"Seasonal tasting menu of local produce" is not unusual.** It is the house style of every ambitious restaurant in every city, so it does not qualify a place for this section no matter how well executed. Nor does an open kitchen, a chef's table, a restaurant's own farm, or a room in a converted historic building — those are settings and supply chains, not cooking. If the only thing separating an entry from a Top pick is that it is expensive and ambitious, it belongs in Top picks or nowhere.

  This section is frequently empty, and that is the correct outcome in most cities. Same tagging rules apply.
- **Local dishes.** The dishes genuinely specific to this city or country — what they are, and one or two specific places to eat each. This is about the dish first, the restaurant second.

  **This section is not a parking spot for a restaurant that deserved its own entry.** Naming a place here as "where to eat the dish" demotes it to a supporting mention. If the venue is itself the point, give it an entry in Top picks or Everyday institutions and reference it from here.
- **Asian food.** This traveler wants good Asian food wherever in the world they are, so it is worth naming even in a city with no connection to it. This is the standing exception to the rule that a non-local cuisine must be unavailable at home.

  **The bar is high and the default is to omit the section.** Mediocre ramen, supermarket-grade sushi and generic wok stir-fries do not count, and neither does "the best Thai in a city that has no Thai food" — being the top of a weak field is not a recommendation. Include a place only on real evidence that it is the article: a cook making their own cuisine, a diaspora community that actually eats there, Reddit threads where that diaspora or resident expats vouch for it by name, or a rating and review volume that holds up against the city's best restaurants generally. **Zero entries is a common and correct outcome** — omit the section silently, per **Be short**.

  **Be regionally specific in the description** — the specificity is most of the information. *Hakata-style tonkotsu*, *Sichuan*, *Isaan*, *Kerala*, *Shaanxi hand-pulled noodles*, *Cantonese roast meats*. Not "Asian", and usually not even "Chinese" or "Japanese". Name the dish to order.
- **Cafés and bakeries.** Only ones with real local reputation — a specific specialty, a distinctive bake, a long-standing institution. Skip anything interchangeable with a good café at home.
- **Cocktail bars and breweries.** Same bar: well-known, distinctive, or doing something specific to the region. Omit the section entirely — heading and all, without comment — if the city has no notable scene, rather than padding it.

  This is where the **50 Best Bars** results land — the World list and its 51–100, the regional list, and Discovery's bar entries for the city. Tag them like any other 50 Best entry (`50 best bars #12 2026`, or `50 best discovery`). The same rule applies as for restaurants: a ranking is provenance, not a reason to include, and the description says what they pour, not where they placed.

**Each restaurant appears once across the food coverage.** If a place fits two sections, give it the one that says more about why it matters — Everyday institutions over Local dishes for a canteen, Top picks over Creative for an ambitious kitchen, Top picks over Asian food for an Asian restaurant good enough to be a must-go — and let the description carry the rest. Repeating an entry in two sections wastes the reader's time; demoting it to the weaker section wastes the entry.

### 4. Where to stay

**Two or three neighborhoods, not a survey of the city.** Pick the ones that fit this traveler and leave the rest out — a menu of five with a nightlife pick and a families pick is written for someone else.

What qualifies:

- **Walkable, or on a transit line that actually runs.** They move around on foot and on transit, not by car.
- **Quiet.** Residential beats central. The bar strip and the street everyone recommends for a night out are disqualifying, not a feature — **nightlife is never a reason to list an area** for this traveler.
- **Ordinary daily life within reach** — a supermarket, a gym, a park or river path to run on. This is what separates somewhere you can live out of from somewhere you only sleep.
- **Somewhere they could see themselves living for a week.** That is the summary test. If a neighborhood only makes sense as a base for sightseeing, it does not qualify.

**Proximity to the tourist sights is not a criterion.** Do not list an area because it is close to the attractions, and do not rank by how central it is.

For each: one line on what the area is actually like to be in, a note on the daily-life practicalities above, and the tradeoff — what they give up by staying there. Flag an area as best avoided only when the traveler might genuinely book it and regret it (reads central on a map but is a nightlife strip; cut off once the buses stop). A general crime survey of districts they would never consider is noise — leave it out.

### 5. Book ahead

Include an entry **only when a source shows people actually struggle to get in day-of** — a booking page showing weeks of unavailability, an operator stating a cutoff, a lottery or permit system, reviews or threads reporting sellouts. Cite what the evidence was.

If you cannot verify that something is hard to book, **leave it out entirely**. Do not list it as "unconfirmed," do not estimate a lead time, and do not include a restaurant merely because it is popular or a site merely because it sells timed tickets. A short, true table is the goal; padding it with maybes defeats the section.

Cover restaurants, tours/sites/experiences, and any ticketed event from the Events section. Flag anything booking more than a month out. Name the booking channel (own site, Tock, Resy, phone only, operator direct).

Lead times are relative to the user's dates — say when to book, not just how far ahead.

If nothing in the city genuinely requires advance booking, say exactly that in one line and skip the table.

### 6. Practical basics

Three things. The first two are one line each; **Getting around is a real subsection** and the one the traveler actually uses.

- **Tap water** — potable or not, plus the local caveat.
- **Tipping** — expected or not, roughly how much, in which contexts (restaurants, taxis, bars, hotels).

#### Getting around

Answer "how do I actually move around this city". **Two rows and a verdict — Transit, Rides, then the call.** Keep each row to a few lines: the details are there to support the verdict, not to be a fare table. Payment mechanics, prices and hours are one-liners folded into their row, not rows of their own.

- **Transit.** What the city actually has — metro (and how many lines), tram, trolleybus, bus, commuter rail, ferry, funicular — and the part that matters most: **whether the network reaches where a visitor goes**, or whether it is a commuter system that misses the old town and the sights. Then fold in, a line each: how you pay (contactless bank card, a **named** local transit card, a **named** app, paper tickets, cash to the driver — and flag it if foreign-issued cards fail on the readers, or if tickets must be validated on board and there is a fine, since both catch visitors); the single fare and a day or multi-day pass in local currency **with a USD conversion**; and roughly when service stops at night. Mention a tourist card only if it is actually worth buying.
- **Rides.** Which apps genuinely operate there, **by name** — Uber, Bolt, Grab, Didi, Yandex, inDrive, local equivalents; do not assume Uber is everywhere. Whether street-hailing or phone-ordered metered taxis are the norm instead, and whether the meter is reliably used. A typical short cross-town fare and the **airport-to-center** fare, local currency and USD, so they can be compared against the transit fare. Flag the standard airport-taxi overcharge if the city has one.
- **The verdict.** One or two lines, and the point of the whole section: rely on transit, default to rides, or walk and use rides for the edges — with the reason. **Walking and bikes belong here**, since they are part of the answer rather than a category of their own: whether the center is walkable end to end and roughly how long that takes, plus a bike-share scheme by name if there is a usable one. Cities genuinely differ — a €1.20 metro that goes everywhere plus a €4 cross-town Bolt gives a different answer than a €2.50 tram plus a €25 airport taxi.

Search for the fares and ride prices rather than recalling them — fares get revised annually. **Never invent a fare or a ride estimate**; write "could not confirm" and keep the rest. Attach the year to anything you did confirm.

### 7. Country background

- GDP — nominal total and per capita, with the source and year.
- Main drivers of the economy, three to four.
- **Tech and startup scene** — the country's largest and most notable startups and tech companies: what each does, total funding raised or valuation, and whether it reached unicorn status or exited. Note the year of any funding or valuation figure, and name any local sector concentration (fintech licensing, gaming, semiconductors, biotech). Search for current figures; these date fast.
- History in about five beats, ending at the present. Enough to make what the user sees legible.
- **Culture** — see below.
- Languages spoken, including how far English gets you.

#### Culture

**Three or four things** that are culturally distinctive about this country — the things a traveler would notice, wonder about, and not be able to guess. **Fewer is better than padded, and there is no floor.** Two strong entries beat five where three are filler; a country where only two things clear the bar gets two. This section is unusually prone to quota-filling because the format invites it — if you are reaching for a fifth entry, that is the signal to stop, not to lower the bar.

This is the section that makes the place legible rather than the one that tells them how to behave, though etiquette that would actually trip them up belongs here too. Candidates:

- A **national obsession or pastime** with real hold on the country — a sport, a game, a music form, a sauna or bathhouse culture, a mushroom-picking or beach-going season the whole country observes.
- A **social custom or piece of etiquette** a visitor would get wrong: shoes off indoors, how greetings and handshakes work, toasting rules, what happens when you sit down at a table, whether haggling is expected, gestures that read differently here.
- **Religion, folk belief, or ritual** that is visibly present — what you will see people doing and when.
- A **daily-rhythm difference**: when people eat dinner, whether shops shut midday or on Sundays, when the workday ends, what the weekend looks like.
- A distinctive **art form, craft, or design tradition** — but only where the traveler meets it in life rather than in a shop window: what it is for, who still makes or uses it, when it appears. "Which streets sell the good souvenirs" is retail information, not culture.
- An **attitude or self-understanding** that shapes public life — a relationship to a neighbor country, a founding grievance or pride, a strain of humor — where it explains something the traveler will actually see or hear.

The same writing rules apply as everywhere else: **lead with the concrete fact, not the characterization.** "Public saunas run to 90°C and strangers share them naked; asking to keep a swimsuit on reads as odd" is a culture entry. "Sauna culture is deeply important to the national identity" is not — it would be true of any country you inserted, and tells the reader nothing they can use.

Cut anything that would be equally true of most countries: that family matters, that people are proud of their food, that hospitality runs deep, that the young are more Westernized. If an entry survives swapping the country name, delete it.

**Then apply the encounter test: will the traveler actually run into this, or does it explain something they would otherwise misread?** If neither, it is trivia, and trivia is what fills this section when the real material runs out. Three kinds in particular keep getting in and should not:

- **Shopping and souvenir logistics.** Which streets sell amber, where to buy the good ceramics, how to spot a fake. That is a retail directory, and it tells you nothing about how anyone lives.
- **One-off news items and municipal gestures.** A street renamed to needle an embassy, a mayor's stunt, a statue erected last year. These are clever anecdotes with no life behind them — the traveler will not see it, cannot participate in it, and learns nothing that makes the country legible. A single event is not a culture.
- **Traditions that live somewhere the traveler is not going.** A folk craft practised in villages 200km away, a festival in another region, a UNESCO listing attached to a site outside the trip. If it is not present in this city or in national daily life, it is background for a different trip.

The entries that survive tend to be the same shapes: something a large share of the population does or follows, something that will visibly interrupt the traveler's day, or something they would get wrong without being told.

Keep each entry to one or two lines. Do not turn this into a do's-and-don'ts list, and do not moralize about respecting local customs.
- About ten travel phrases in the main language: native script, phonetic rendering, and English. Hello, please, thank you, excuse me, yes/no, do you speak English, how much is this, the bill please, where is the bathroom, cheers.

## Accuracy rules

- Anything drawn from your own knowledge rather than a search must be labeled as such.
- Never fabricate a Google rating, review count, funding figure, booking lead time, or event date. Omit rather than estimate.
- Award lists, GDP figures, funding totals, and tipping norms all drift. Attach a year to each.
- Prefer "could not confirm" to a plausible guess — except in Book ahead, where an unconfirmed entry is simply dropped.

## Output

Produce **one self-contained HTML artifact**, following the structure and styling in `reference/brief-template.html`.

How you create it depends on where you are running:
- **Claude chat** — emit the artifact directly. Do not write files.
- **Claude Code** — write the HTML to a scratch file, then publish it with the Artifact tool and give the user the URL. Do not save it into the user's project.

Requirements:
- Title it `<City> — Travel Brief`.
- Include the travel dates and the research date near the top.
- Any section or group with nothing that cleared the bar is dropped heading-and-all, with no sentence anywhere noting the omission — Events, Nature, and Cocktail bars are the usual cases.
- Readable on a phone; the user will open this while traveling.
- Works in both light and dark themes.
- Every place name links to Google Maps; ratings render as a visible badge.
- Every Things-to-do, Events and Food entry shows its source tag(s); entries found in multiple sources show all of them.
- Reddit tags link to the thread they came from.
- Book-ahead entries render as a table with a visible lead-time column.
- No external requests — inline all CSS, embed nothing remote. Links out are fine; loaded assets are not.

After publishing, give the user a three-or-four-line summary in chat: the single highest-value thing to book immediately, anything notable falling in their dates, and anything you could not confirm.
