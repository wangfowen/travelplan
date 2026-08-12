# Decisions — Warsaw, Aug 13–16, 2026 run

## Research gaps / source failures

- **Agent tool and browser action tools (navigate, browser_batch) were down for an extended stretch** early in the gather phase due to a platform-side safety-classifier outage (not a Reddit block, not a permissions issue). Confirmed via repeated retries and a direct test of the Agent tool. Consequence: the three big drafts (things-to-do, food, events) were **not** parallelized to subagents as the skill recommends — I drafted everything directly myself once the browser recovered. This cost time but not coverage; all mandatory research passes below still ran.
- Michelin's own "full list of star restaurants" page 403'd on direct fetch; worked around via WebSearch snippets, which gave star/bib names but not the full 38-restaurant "recommended tier" roster. The recommended-tier gap is real — only stars and Bib Gourmand names are confirmed in food-editorial.md.
- Eater has no Warsaw coverage — confirmed absence, called out per source-tag rules (not used as a tag anywhere in the brief).
- Culinary Backstreets does not cover Warsaw — confirmed absence, same treatment.
- Reddit's dedicated "immersive art Warsaw" query returned zero results (re-ran with a "teamLab OR immersive" variant — also zero). Real, not a phrasing miss. Backfilled via web search (Art Box Experience, Melt Museum) as `my pick`.
- Reddit's "best view of Warsaw" query surfaced only generic "is Warsaw underrated" discourse — no specific viewpoint recommendation cleared the bar. Backfilled the BUW roof garden via web search, corroborated by its very strong Maps rating (4.8, ~7k reviews).
- Reddit's "cocktail bar" / "best cocktail bars" queries returned only generic "best bars for my age group" threads with no repeated venue naming — see Cocktail bars cut below.
- Reddit's "where to stay" queries surfaced relocation/expat-logistics threads rather than tourist-accommodation-area discussion; neighborhood character for Where to Stay came from web sources instead, not independently Reddit-corroborated this run (except Saska Kępa, which did come up in a Reddit thread).

## Things to do

**Shortlist:** Warsaw Rising Museum, Polish Vodka Museum, Art Box Experience (Top picks); Neon Museum, Museum of Warsaw (Unique to Warsaw); University of Warsaw Library roof garden (Views and nature); National Museum — Faras Gallery (Museums and galleries); Orange Umbrella Free Tour Warsaw, Walking Warsaw (Tours).

**Cut:**
- **Graffitifun Warsaw graffiti workshop** — surfaced in a web search as a Warsaw hands-on option; Maps verification revealed "Graffitifun" is a Netherlands-based company (Amsterdam/Utrecht/Rotterdam) with no Warsaw location at all. A real venue-existence catch from the verify phase — cut entirely, not just demoted.
- **Fragrance Workshop, Museum of Pharmacy** — genuinely hands-on and well-suited to this traveler, but runs Wednesdays only; the trip is Thursday–Sunday and never overlaps a Wednesday. Cut for schedule mismatch, not quality.
- **Bridge construction open-air museum, Dollhouse/Toys Museum, Warsaw Basilisk/Mermaid statues** — genuine Atlas Obscura-adjacent curiosities, but each is a quick look rather than a real "thing to do," and none had strong enough independent corroboration to displace what's in Unique to Warsaw. Left out for thinness, not falseness.
- **Żelazowa Wola (Chopin's birthplace) day trip** — real and reachable (~1hr by train + taxi, or organized tour), but the site itself (a modest manor house + park) didn't clear the "a reason to leave the city" bar for a 4-day trip, and the traveler's profile doesn't flag classical-music/Chopin as a specific interest. The Events section already covers the Chopin angle (Chopin Under the Open Sky, Ukrainian Freedom Orchestra) without needing a day trip too. Day trips section dropped entirely (no-trace rule).
- **Walkative!** (4.8★, 1.1k reviews on Maps) — strong candidate, but it operates as a walking-tour brand across multiple Polish/Eastern European cities, which reads as the same "multi-city chain" pattern the tours filter excludes (SANDEMANs, big bus companies). Cut in favor of the two single-city operators.

## Food

**Shortlist:** Local dishes — pierogi (Przegryź), żurek (Lindleya 14), flaki/pyzy (Pyzy Flaki Gorące), tatar (hub.praga), jagodzianki (Perełka). Top picks — hub.praga, Bar Mleczny Rusałka, Perełka, Pyzy Flaki Gorące. Creative — Garage Burger, Bar Rascal. Everyday institutions — Lindleya 14, Bambino, Przegryź, Hala Koszyki. Cafés and bakeries — El Cafetero, Baken. Asian food — Alon Omakase, Ahaan, Miss Kimchi, Thien Ly. Healthy staples — Poke Bowl Chmielna, Salad Story.

**Cut:**
- **Casa di Tuzza** (pizza) — genuinely loved on Reddit ("goated," repeated praise), but it's good Neapolitan-style pizza and nothing more; fails the non-local-cuisine "earn its place twice" test (replicable at home, no crossover angle). Cut from the headline tier entirely.
- **Kura (Buffalo Wings / Korean fried chicken)** — heavily named on Reddit (6 distinct commenters) but its cuisine identity is genuinely ambiguous — part American Buffalo-wings chain, part Korean-fried-chicken hybrid — and it doesn't clearly clear either the Everyday-institutions (not Polish cooking) or Asian-food (not consistently East/Southeast Asian in format) bar. Cut for categorization ambiguity rather than quality; flagged here because per the food.md checklist, the tally's top names need conscious rule-outs, not silent drops.
- **THC (Tres Hermanos Chicken)** — one strong claim ("best chicken in the city by far") but a single Reddit mention with no corroboration and an unclear cuisine identity. Cut for thin sourcing.
- **U Fukiera** — real 16th-century building, genuinely historic, but the sourcing found was all about the room and the history, not the food itself, which conflicts with the traveler's explicit bar (how good the food is, not the ambiance or the story). Cut.
- **A dedicated Zapiekanka entry** — the format map requires covering it, so this is a conscious rule-out, not an oversight. The one Reddit mention found (Mcquack at Plac Zawiszy) was weak ("pretty good, at least when I'm drunk"), and a separate, more confident Reddit comment states Warsaw's versions generally aren't good and to get real zapiekanka in Kraków instead. No candidate cleared the bar; the dish itself is mentioned in this file only, not in the brief.
- **Cocktail bars and breweries section** — omitted entirely. Web search surfaced generic listicle names (El Koktel, Aura Bar, Kamienica Krawiecka, Kufle i Kapsle) with no distinguishing craft fact (a house ferment, a local-only pour, a brewing tradition), and Reddit's cocktail-bar queries returned no repeated venue naming. Section requires "interesting — doing things no one else is doing"; nothing found cleared that bar with real evidence behind it.
- **Trigger (coffee roastery)** — the single most-named specialty-coffee source on Reddit (5 distinct commenters, strongest tally in the dossier), but Maps verification showed it's a small production roastery (36 reviews total) at a residential address with no clear café-going evidence — a much weaker fit for a 4-day tourist visit than an established café. Swapped for El Cafetero (2 physical locations, 4.8★ each, ~1,000 combined reviews, also independently named on Reddit) as the featured coffee pick. This is a case where the tally leader lost to a better-verified alternative for the traveler's actual use case (visiting a café, not buying beans) — flagged per the food.md checklist's "tally vs. draft" rule rather than silently substituted.
- **Uki / Uki Green (vegan ramen)** — 2 enthusiastic Reddit mentions, but vegan ramen is an adapted/fusion product rather than the traditional dish, and it was the weakest fit among 5 Asian-food candidates for the section's "authentic" bar. Cut to keep the section at 4 tight entries rather than 5 padded ones.
- **HAYB (coffee roastery)** — the most Reddit-discussed name after Trigger, but net-negative on inspection: 3 positive mentions against 5 warnings ("is shit," "distinctly average," "overrated and overpriced" for single origins). Genuine negative evidence, not just contrarian noise — left out.

## Events

**Shortlist:** Andrea Bocelli, Ukrainian Freedom Orchestra, Chopin Under the Open Sky (Music); Helena Rubinstein, A Frame of Suffering (Exhibitions).

**Cut:**
- **Cultural subsection dropped entirely** — the only candidate (general "Warsaw Uprising anniversary commemorations throughout August") had no specific dated events confirmed for the travel window, just a vague seasonal note. Rather than print an unconfirmed placeholder, the subsection was cut.
- **Shows subsection dropped entirely** — Teatr Wielki's own resident opera/ballet company appears to be on its summer break in mid-August (very sparse August listings relative to other months); no confirmed resident-company production found in the window.
- **Riverside Vistula Boulevards summer scene** — real and pleasant, but it's an ongoing all-summer feature of the city, not a dated event with a reason to be here specifically on these dates. Left out of Events; could be folded into a general Warsaw-in-summer note in a future run.
- **The Virginmarys, Chmury (Fri Aug 14)** — a real touring act in the window, but a small club show; cut in favor of the two stronger, more distinctive picks (Bocelli, Ukrainian Freedom Orchestra) to avoid padding the Music section with a act the traveler is less likely to already know.

## Where to stay

Powiśle, Żoliborz, Saska Kępa selected; Mokotów considered but cut — its web sourcing was generic expat-guide material without a specific corroborating hook (no Reddit or local-press detail), while the other three each had a sharper distinguishing fact.

## Book ahead

Only 2 rows survived the evidence bar (Bocelli, Ukrainian Freedom Orchestra). Also considered and dropped:
- **Warsaw Rising Museum** — advance booking is commonly recommended to skip queues, but the only concrete evidence found (some school-group time slots closing) isn't evidence of day-of failure for an independent tourist. Dropped per the "unverifiable → dropped entirely" rule.
- **Alon Omakase** — tiny room, open only Thursday–Saturday 7pm (which covers 3 of this trip's 4 nights), a real capacity constraint — but no direct evidence found of it actually selling out on a given night. Noted as a practical detail in its Food entry instead of given a Book-ahead row.
