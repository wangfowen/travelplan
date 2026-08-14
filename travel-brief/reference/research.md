# Research — the gather phase

One pass, all sources, one dossier. Sections select from it later; they do not re-search. The query plan below is organized **by source, not by section**, so nothing is searched twice (the why lives in SKILL.md → "Why this shape").

Gathering filters **form, not candidates**. No selection bars: judging quality is the sections' job, done later with their own bars in context, and a candidate dropped here is invisible to every section. But hard compression: the dossier holds structured one-line entries, never raw thread or article text. A track is read whole by every section it feeds, so its size taxes each of them — a dossier of pasted transcripts buries the signal it exists to carry.

## The dossier

- Files in the session scratchpad, one per gathering track — `dossier/reddit.md`, `dossier/xiaohongshu.md`, `dossier/food-editorial.md`, `dossier/events.md`, `dossier/city.md`, `dossier/country.md`. **Each research subagent writes its own file** and returns only a one-line status; findings are never routed back through the main agent as text. `dossier/reddit.md` and `dossier/xiaohongshu.md` are the exceptions — the browser pass is the main agent's, so it writes those two itself. At publish, the dossier files are copied into the run record (`runs/` — see SKILL.md → Publishing).
- **One track per file, and drafters read only the tracks they need** (the dependency table in SKILL.md → Draft). Keep a finding in the track that found it rather than copying it across files: a duplicated entry is read twice and can drift.
- **Every finding records:** name — one line on what it is — source tag(s) at birth, per shared.md's table — the link that proves it (thread, article, venue page) — plus whatever detail matters (dates for events, dish names, fares, quotes). An entry surfaced by several sources gets all its tags now; retrofitting tags later is where provenance gets lost.
- **One entry per place, merged across sources.** The same venue surfaced by Reddit, Michelin, and local press is one entry with stacked tags, not three. Repeated raves collapse into the tally count, never repeated quotes — keep at most one short quote per entry, and only when the wording itself is evidence (a local flatly naming a place, a specific dish call).
- **Negative evidence rides on the entry — it never deletes the entry.** A place the sources recommend stays in the dossier even when other sources pan it: cut it at gather and the section can't consciously rule it out (food.md's checklist requires exactly that), and it resurfaces later as a my-pick or gap-fill candidate with its warning lost. Record the knock as attributed fact, not verdict — "4 commenters in [thread] say quality dropped after the 2023 expansion" is evidence; "probably skip" is commentary. Count warnings beside the tally, separately from recommendations: `named 9× / warned 4×`. Reading the complaint (touristy vs. the-food-is-bad) is the section's job, with its own rules in context.
- **A place with only negative evidence and no recommender** is usually not a candidate at all — skip it. The exception is a place prominent enough to resurface on its own (editorially famous, an obvious my-pick): give it a one-line entry with the warning and link, so the warning is standing there when the name comes back.
- **What never enters the dossier:** raw page text, thread transcripts, source boilerplate, generic Reddit discourse (tourist-trap debates, locals-vs-tourists threads, safety moralizing — place-specific knocks attach to their entry per the rule above), and your own verdicts on candidates ("probably too touristy" is a selection judgment — the sections make those). If a finding can't be stated as a one-line entry with tags and a link, compress it until it can.
- **The food tally:** a running count of how many *distinct commenters* name each place, across all threads — including local-language threads and threads opened for another reason (a neighborhood thread, a concert-trip thread; where the thread pointed is not part of the evidence). Institutions get named flatly ("just go to X"), so count namings, not enthusiasm. The tally rides in the Reddit dossier file and food.md checks the draft against it. **Keep it Reddit-scoped — do not fold 小红书 namings into it.** The two populations are not comparable: 小红书's audience is Chinese-speaking travelers and residents, so merging the counts would push Chinese restaurants to the top of a tally that is supposed to measure how flatly locals name a place. 小红书 corroboration stacks as a tag on the entry, and counts separately if you count it at all.

## City-specific slots (fill during phase 1)

1. **Food format map.** Before any query, write down the venue formats and everyday dishes this city invented or lives on — the seafood beer hall, the charcoal-chicken takeaway, the standing sandwich counter, the grill house, the market canteen. Generic best-restaurant queries miss whole formats, and the city's most-loved institutions live inside them; a format left unsearched is a category silently missing from the brief. One query per format, on Reddit and on Maps.
2. **Flagship venues:** the two or three main concert halls, the opera/theater companies, the arenas — their season calendars are the Events source.
3. **Named local press:** the city's what's-on and culture coverage, the national critic, the local Time Out edition, the serious blogs you would cite by name.
4. **The city's Chinese name** (`华沙` for Warsaw, `维尔纽斯` for Vilnius) — the 小红书 queries are unusable without it.
5. **Local-language variants** of the food queries (`melhor <format> <city>`, `restaurantes bons e baratos`): locals answer locals in their own language, and the flatly-named neighborhood institutions — especially diaspora ones — often appear *only* in those threads.

## Reaching Reddit

Reddit is the most valuable source in this brief and the most likely to fail. Verified as of Aug 2026:

- Server-side fetches of `reddit.com` are refused at the tool level — a deliberate blocklist, not rate limiting. Retries, user-agent changes, `.json`/`old.reddit.com` do not help; public front-ends (redlib, safereddit) were dead when last checked; `curl` gets a bot interstitial.
- `site:reddit.com` inside a query string is **ignored** by the search backend and returns travel listicles — which is how earlier runs concluded "Reddit unreachable" without ever querying Reddit.
- **Browser control works.** Claude in Chrome drives the user's logged-in browser, which clears the block — and costs **zero web-search budget**. Stay inside Reddit's own search UI:
  1. `https://www.reddit.com/r/<citysubreddit>/search/?q=<query>&restrict_sr=1&sort=top&t=year` — drop `restrict_sr=1` when the local sub is thin. `get_page_text` returns results with vote and comment counts.
  2. Pick threads by **comment count, not upvotes** — recommendations live in the comments; a 3-upvote thread with 24 comments beats a 200-upvote photo post. Prefer threads from the last ~2 years.
  3. Navigate + `get_page_text` per thread, batched in one `browser_batch` call. Close your tabs when done.

The extension being unavailable is handled before research starts (SKILL.md → Hard requirements) — a run never reaches this point without a working browser. If Reddit itself fails mid-run despite the browser (outage, forced logout), retry inside Reddit's own UI first; as a last resort, surface thread URLs via `WebSearch` with `allowed_domains: ["reddit.com"]` (never a `site:` prefix) and lean harder on Eater and named local press — not aggregators — with a callout in the brief. **Never report a source as unreachable or blocked without naming the specific attempts you made.**

## Reaching 小红书

小红书 is the Chinese-language travel layer — travelers and residents writing for each other, a source population with almost no overlap with Reddit's. Verified as of Aug 2026:

- **Use `www.rednote.com`, not `www.xiaohongshu.com`.** The `.com` mainland domain gates search behind a login wall (`登录后查看搜索结果`) even when the account is signed in; `rednote.com` is the international surface and serves results to the same session. A run that concludes "小红书 needs login" without trying `rednote.com` has not actually checked.
- Search URL: `https://www.rednote.com/search_result/?keyword=<url-encoded query>`. The grid returns title, author, date, and like count per post — `get_page_text` reads it fine.
- **A logged-in session is a hard requirement, checked in phase 1** (SKILL.md → Hard requirements). Logged out, the same URL renders skeleton cards and a QR modal.
- **Never enter the phone number or verification code** — that is the user's credentials into a form. The login is theirs to do by scanning the QR shown on the page.

### Reading a note — three traps

1. **Direct note URLs do not work.** `rednote.com/explore/<id>` without its `xsec_token` redirects to a 404 (`error_code=300031`). The token is issued when you open the post **from the search grid**, so the only route in is clicking the card; the tokenized URL then appears in the address bar and is what you record as the link.
2. **`get_page_text` reads the wrong element on a note page.** It latches onto the image-description div and returns a photo index (`图1 华沙地图 图2 老城广场…`) — which looks like a thin post and is not. The body is at **`#detail-desc`**; pull it with `javascript_tool` (`document.querySelector('#detail-desc').innerText`). On a 攻略 post that is typically a full structured itinerary with transit notes and 小贴士.
3. **Comments are separate and worth reading** — `document.querySelectorAll('.comment-item')`, `.innerText` each. They carry author, date, poster location and like count, and this is where the practical grit lives (fare payment, airport transfer times, whether a place has moved). Same rule as Reddit: the comments are the source, not the post title.

**Image-carousel posts exist and are not worth fighting.** When `#detail-desc` returns only a photo index and the substance is baked into the pictures, a screenshot-and-read pass costs a vision call per post. Take those only when the post is clearly central and the text tracks came back thin — otherwise move to the next post. Record the skip; a dry query still needs its Maps backstop.

## The browser pass (yours, serial — never parallelized)

**Run the query blocks in the order below — events and stay first, then things-to-do and food, then 小红书, Maps last.** Food is the long Reddit block by far, and the events and where-to-stay drafters unblock the moment their few queries are written to `dossier/reddit.md`; running them first puts those two sections on their way while the food pass is still going. 小红书 comes after the Reddit blocks because it mostly stacks tags onto places Reddit already found — running it first means merging blind and re-reading the file. Launch a drafter only once the queries it depends on are actually written — a drafter reading a half-written track silently gets a thin one.

### Reddit queries

- **Events:** `what's happening in <city> <month> <year>`.
- **Stay / living here:** `where to stay in <city>` and expat living-here threads — these double as the secondary source for Healthy staples.
- **Things to do:** the things-to-do and itinerary threads on the city and country subreddits, plus three dedicated queries the general threads miss: `immersive art <city>`, `best view of <city>`, and `bike tour <city>` (the Tours group has no other feeder — without it the group empties by default in every city). **Suggestions create entries** — Reddit's generic tourist-trap and locals-vs-tourists discourse stays out, but a specific warning about a candidate rides on that candidate's entry as negative evidence (dossier rules above).
- **Food:** the best-of queries plus the everyday ones (`where do locals actually eat in <city>`, `<city> cheap local food`); one query per native format from the format map; `what dishes must I try in <city>`; the Asian queries — **one query per cuisine** (`best ramen <city>`, `best sichuan <city>`, `best pho <city>`…): a combined `ramen sushi chinese thai` query matches nothing on Reddit's search and returns zero results, and a zero-result query means re-run it split, not move on — plus the diaspora framing (`where do the chinese/korean expats eat in <city>` — the query that finds the real one); the café queries (`best bakery <city>`, `best sourdough <city>`, `best specialty coffee <city>`); the bar queries (`best cocktail bar <city>`, `craft beer <city>`); and the local-language variants from the slot above.

### 小红书 queries

Two queries per city, in Chinese, written to `dossier/xiaohongshu.md`. Run them **after the Reddit food block** — 小红书 is the corroborating layer, and its entries mostly stack tags onto places Reddit already surfaced.

- **`<city中文名>攻略`** — the itinerary posts. Feeds things-to-do.
- **`<city中文名>美食`** — the food posts. Feeds food.

Only those two sections read this track (SKILL.md → Draft). These posts also carry practical detail — fare payment, airport transfer times, which ride app people actually use — but `practical` unblocks early on the city track and is not held behind the serial browser pass for it. Record such findings in the track anyway when they contradict or sharpen what the city track found, and fold them in during the phase 4 cross-section pass.

Use the city's Chinese name (`华沙`, not `Warsaw`) — the English name returns almost nothing. **Open about three posts per query**: sort by what the grid shows, prefer recent posts (dates are on the cards) with high like counts, and skip the ones whose titles are pure photo-op framing. Read `#detail-desc` and the comments for each, per the traps above.

The 美食 grid also renders **filter chips** — `中餐`, `本地人`, `老字号`, `性价比`, `牛肚汤`, `日式拉面` and similar, generated per city. They map onto queries this plan already runs elsewhere. Do not sweep them by default; they are the **backstop when a Reddit food query came back dry** — especially the Asian-cuisine and diaspora queries, which is where 小红书 is strongest and Reddit weakest in European cities.

Entries follow the same dossier rules as everything else — one line, tagged `小红书` at birth, merged into the existing entry when the place is already there rather than duplicated. Carry the note title and author beside the link (shared.md → link rot).

### Maps category searches

- **Healthy staples:** `healthy bowls <city>`, `salad <city>`, `poke <city>`. **Maps is the primary finder for this category, not a verification step** — it costs no search budget, and the archetype it surfaces is a local fast-casual chain with several locations and strong ratings. Web-searching this category returns recipe listicles and aggregator noise; never delegate it to a search subagent.
- **Maps is the backstop for a thin, dry, or depleted result** — a format-map format Reddit came back thin on, a mandatory dedicated query that returned nothing, a group left short when verification removes an entry, or a category that produced exactly one candidate (search it for same-kind neighbours before settling on the one). A dry query is a reason to run the Maps search, not a stopping point — record the dry run (the sections' coverage checks need it) and run the backstop.

## Web-search subagents (run in parallel with the browser pass)

Search each source category separately — the point is consistent coverage, not speed. Each subagent gets the absolute scratchpad path and **writes its own dossier file** (the track named below), then returns a one-line status: what it covered, what came back empty. They do not publish artifacts and do not chase Google ratings (that is phase 5 — early ratings-chasing wastes searches on candidates that get cut, and WebSearch mostly surfaces banned aggregator numbers anyway).

**A track finishing unblocks its sections immediately** — country and city return well before the browser pass does, and their drafters start then rather than at the end of gather (SKILL.md → Draft). The country track is factual retrieval rather than selection, and runs fine on a cheaper model; the tracks feeding food and things-to-do should not.

1. **Food editorial** (`dossier/food-editorial.md`)**:** Michelin — the **full city selection, not just the awards**: stars, Bib Gourmand, and the plain recommended tier (the recommended tier is where the institutions land; a city's legendary seafood hall is often in the guide without a star, and querying only stars and Bibs skips it entirely). 50 Best — the World list and its 51–100, the relevant regional list, the Bars lists, and the **Discovery** city guide at `theworlds50best.com/discovery` (usually the only one with entries). World of Mouth — app-first but publicly readable at `worldofmouth.app/destinations/<city>` plus its "best restaurants in <city>" article; recommendations come from named chefs, sommeliers and food writers, and the selection reaches the institution tier, not just fine dining. Eater — `eater.com <city>` and its map/guide pages; often absent outside Eater's cities — then note the absence in the dossier for the brief's callout. Named local food press plus **Culinary Backstreets** where it covers the city — local bureau writers on everyday food culture, the one international outlet that reliably covers the institution tier; this layer catches the beloved neighborhood kitchens routinely invisible to Eater, Michelin, and Reddit's tourist-facing threads alike.
2. **Events** (`dossier/events.md`)**:** the tourism board's calendar for the month and year; the flagship venues' and resident companies' season calendars for the travel window; a concert listings service (Songkick, Bandsintown) as a **finder only** — record the venue/artist page for confirmation later; named local press what's-on coverage.
3. **City** (`dossier/city.md`)**:** Atlas Obscura (`site:atlasobscura.com <city>` — the genuinely odd entries, not the ones that are just the city's main museum); local culture press as a things-to-do source; neighborhoods with daily-life facts (transit lines that actually run, quiet vs. bar strips, supermarket/gym/running access); transit modes, payment mechanics, current fares, ride apps operating **by name**, airport-to-center options.
4. **Country** (`dossier/country.md`)**:** GDP nominal and per capita with source year; economy drivers; the notable startups/tech companies with funding or valuation figures and years; history in beats; culture-section candidates; languages and how far English gets you.

**Beli is app-only and stays out of the research loop.** It has no web surface — browser automation drives Chrome, not a phone app — so its rankings and leaderboards are unreachable; never imply it was checked. (小红书 is not a counterexample: it is app-first too, but `rednote.com` is a genuine web surface reachable in Chrome. There is no route to a phone app — screen mirroring is not something the browser tools can drive, and no Claude surface offers general desktop control.) If the traveler uses Beli, they can paste their city leaderboard or lists into the chat: treat that as a real source, tag it `beli`, and weight it as the traveler's own network rather than editorial.

## Budget

**Watch the search budget.** It is session-wide, and subagent fanout can exhaust it. Reddit-in-browser and Maps-in-browser cost none of it; spend WebSearch on editorial sources, events, and country facts. If searches start bouncing off the limit, tell the user rather than silently shipping a thinner brief.
