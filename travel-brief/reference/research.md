# Research — the gather phase

One pass, all sources, one dossier. Sections select from it later; they do not re-search. The query plan below is organized **by source, not by section**, so nothing is searched twice — one Reddit food thread feeds Local dishes, Everyday institutions, and Top picks alike.

Gathering filters **form, not candidates**. No selection bars: judging quality is the sections' job, done later with their own bars in context, and a candidate dropped here is invisible to every section. But hard compression: the dossier holds structured one-line entries, never raw thread or article text. Every drafting agent reads the dossier whole, so its size taxes every section at once — a dossier of pasted transcripts buries the signal it exists to carry.

## The dossier

- **In Claude Code:** files in the session scratchpad, one per gathering track — `dossier/reddit.md`, `dossier/food-editorial.md`, `dossier/events.md`, `dossier/city.md`, `dossier/country.md`. Subagents return raw text; you write it to the files. **In Claude chat:** the same tracks as structured running notes in the conversation.
- **Every finding records:** name — one line on what it is — source tag(s) at birth, per shared.md's table — the link that proves it (thread, article, venue page) — plus whatever detail matters (dates for events, dish names, fares, quotes). An entry surfaced by several sources gets all its tags now; retrofitting tags later is where provenance gets lost.
- **One entry per place, merged across sources.** The same venue surfaced by Reddit, Michelin, and local press is one entry with stacked tags, not three. Repeated raves collapse into the tally count, never repeated quotes — keep at most one short quote per entry, and only when the wording itself is evidence (a local flatly naming a place, a specific dish call).
- **Negative evidence rides on the entry — it never deletes the entry.** A place the sources recommend stays in the dossier even when other sources pan it: cut it at gather and the section can't consciously rule it out (food.md's checklist requires exactly that), and it resurfaces later as a my-pick or gap-fill candidate with its warning lost. Record the knock as attributed fact, not verdict — "4 commenters in [thread] say quality dropped after the 2023 expansion" is evidence; "probably skip" is commentary. Count warnings beside the tally, separately from recommendations: `named 9× / warned 4×`. Reading the complaint (touristy vs. the-food-is-bad) is the section's job, with its own rules in context.
- **A place with only negative evidence and no recommender** is usually not a candidate at all — skip it. The exception is a place prominent enough to resurface on its own (editorially famous, an obvious my-pick): give it a one-line entry with the warning and link, so the warning is standing there when the name comes back.
- **What never enters the dossier:** raw page text, thread transcripts, source boilerplate, generic Reddit discourse (tourist-trap debates, locals-vs-tourists threads, safety moralizing — place-specific knocks attach to their entry per the rule above), and your own verdicts on candidates ("probably too touristy" is a selection judgment — the sections make those). If a finding can't be stated as a one-line entry with tags and a link, compress it until it can.
- **The food tally:** a running count of how many *distinct commenters* name each place, across all threads — including local-language threads and threads opened for another reason (a neighborhood thread, a concert-trip thread; where the thread pointed is not part of the evidence). Institutions get named flatly ("just go to X"), so count namings, not enthusiasm. The tally rides in the Reddit dossier file and food.md checks the draft against it.

## City-specific slots (fill during phase 1)

1. **Food format map.** Before any query, write down the venue formats and everyday dishes this city invented or lives on — the seafood beer hall, the charcoal-chicken takeaway, the standing sandwich counter, the grill house, the market canteen. Generic best-restaurant queries miss whole formats, and the city's most-loved institutions live inside them; a format left unsearched is a category silently missing from the brief. One query per format, on Reddit and on Maps.
2. **Flagship venues:** the two or three main concert halls, the opera/theater companies, the arenas — their season calendars are the Events source.
3. **Named local press:** the city's what's-on and culture coverage, the national critic, the local Time Out edition, the serious blogs you would cite by name.
4. **Local-language variants** of the food queries (`melhor <format> <city>`, `restaurantes bons e baratos`): locals answer locals in their own language, and the flatly-named neighborhood institutions — especially diaspora ones — often appear *only* in those threads.

## Reaching Reddit

Reddit is the most valuable source in this brief and the most likely to fail. Verified as of Aug 2026:

- Server-side fetches of `reddit.com` are refused at the tool level — a deliberate blocklist, not rate limiting. Retries, user-agent changes, `.json`/`old.reddit.com` do not help; public front-ends (redlib, safereddit) were dead when last checked; `curl` gets a bot interstitial.
- `site:reddit.com` inside a query string is **ignored** by the search backend and returns travel listicles — which is how earlier runs concluded "Reddit unreachable" without ever querying Reddit.
- **Browser control works.** Claude in Chrome drives the user's logged-in browser, which clears the block — and costs **zero web-search budget**. Stay inside Reddit's own search UI:
  1. `https://www.reddit.com/r/<citysubreddit>/search/?q=<query>&restrict_sr=1&sort=top&t=year` — drop `restrict_sr=1` when the local sub is thin. `get_page_text` returns results with vote and comment counts.
  2. Pick threads by **comment count, not upvotes** — recommendations live in the comments; a 3-upvote thread with 24 comments beats a 200-upvote photo post. Prefer threads from the last ~2 years.
  3. Navigate + `get_page_text` per thread, batched in one `browser_batch` call. Close your tabs when done.

If the extension is not connected, say so plainly — the user can connect it and re-run. Only then fall back: domain-filtered search (`WebSearch` with `allowed_domains: ["reddit.com"]`, never a `site:` prefix) to at least surface thread URLs, or ask the user to paste threads, naming what you would search. When Reddit is genuinely unavailable, lean harder on Eater and named local press — not aggregators. **Never report a source as unreachable or blocked without naming the specific attempts you made.**

## The browser pass (yours, serial — never parallelized)

### Reddit queries

- **Things to do:** the things-to-do and itinerary threads on the city and country subreddits, plus two dedicated queries the general threads miss: `immersive art <city>` and `best view of <city>`. **Suggestions create entries** — Reddit's generic tourist-trap and locals-vs-tourists discourse stays out, but a specific warning about a candidate rides on that candidate's entry as negative evidence (dossier rules above).
- **Events:** `what's happening in <city> <month> <year>`.
- **Food:** the best-of queries plus the everyday ones (`where do locals actually eat in <city>`, `<city> cheap local food`); one query per native format from the format map; `what dishes must I try in <city>`; the Asian queries — **one query per cuisine** (`best ramen <city>`, `best sichuan <city>`, `best pho <city>`…): a combined `ramen sushi chinese thai` query matches nothing on Reddit's search and returns zero results, and a zero-result query means re-run it split, not move on — plus the diaspora framing (`where do the chinese/korean expats eat in <city>` — the query that finds the real one); the café queries (`best bakery <city>`, `best sourdough <city>`, `best specialty coffee <city>`); the bar queries (`best cocktail bar <city>`, `craft beer <city>`); and the local-language variants from the slot above.
- **Stay / living here:** `where to stay in <city>` and expat living-here threads — these double as the secondary source for Healthy staples.

### Maps category searches

- **Healthy staples:** `healthy bowls <city>`, `salad <city>`, `poke <city>`. **Maps is the primary finder for this category, not a verification step** — it costs no search budget, and the archetype it surfaces is a local fast-casual chain with several locations and strong ratings. Web-searching this category returns recipe listicles and aggregator noise; never delegate it to a search subagent.
- Any format-map format that Reddit came back thin on gets a Maps category search too.

## Web-search subagents (Claude Code — run in parallel with the browser pass)

Search each source category separately — the point is consistent coverage, not speed. Subagents return raw text findings; they do not publish artifacts and do not chase Google ratings (that is phase 5 — early ratings-chasing wastes searches on candidates that get cut, and WebSearch mostly surfaces banned aggregator numbers anyway).

1. **Food editorial:** Michelin — the **full city selection, not just the awards**: stars, Bib Gourmand, and the plain recommended tier (the recommended tier is where the institutions land; a city's legendary seafood hall is often in the guide without a star, and querying only stars and Bibs skips it entirely). 50 Best — the World list and its 51–100, the relevant regional list, the Bars lists, and the **Discovery** city guide at `theworlds50best.com/discovery` (usually the only one with entries). World of Mouth — app-first but publicly readable at `worldofmouth.app/destinations/<city>` plus its "best restaurants in <city>" article; recommendations come from named chefs, sommeliers and food writers, and the selection reaches the institution tier, not just fine dining. Eater — `eater.com <city>` and its map/guide pages; often absent outside Eater's cities — then note the absence in the dossier for the brief's callout. Named local food press plus **Culinary Backstreets** where it covers the city — local bureau writers on everyday food culture, the one international outlet that reliably covers the institution tier; this layer catches the beloved neighborhood kitchens routinely invisible to Eater, Michelin, and Reddit's tourist-facing threads alike.
2. **Events:** the tourism board's calendar for the month and year; the flagship venues' and resident companies' season calendars for the travel window; a concert listings service (Songkick, Bandsintown) as a **finder only** — record the venue/artist page for confirmation later; named local press what's-on coverage.
3. **City:** Atlas Obscura (`site:atlasobscura.com <city>` — the genuinely odd entries, not the ones that are just the city's main museum); local culture press as a things-to-do source; neighborhoods with daily-life facts (transit lines that actually run, quiet vs. bar strips, supermarket/gym/running access); transit modes, payment mechanics, current fares, ride apps operating **by name**, airport-to-center options.
4. **Country:** GDP nominal and per capita with source year; economy drivers; the notable startups/tech companies with funding or valuation figures and years; history in beats; culture-section candidates; languages and how far English gets you.

**Beli is app-only and stays out of the research loop.** It has no web surface — browser automation drives Chrome, not a phone app — so its rankings and leaderboards are unreachable; never imply it was checked. If the traveler uses Beli, they can paste their city leaderboard or lists into the chat: treat that as a real source, tag it `beli`, and weight it as the traveler's own network rather than editorial.

## Budget

**Watch the search budget.** It is session-wide, and subagent fanout can exhaust it. Reddit-in-browser and Maps-in-browser cost none of it; spend WebSearch on editorial sources, events, and country facts. If searches start bouncing off the limit, tell the user rather than silently shipping a thinner brief.
