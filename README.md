# travelplan

A Claude skill that researches a destination against a fixed checklist and outputs a one-page travel briefing as an artifact.

Authored here, run in Claude chat.

## What it covers

| Section | Sources |
| --- | --- |
| Things to do | Reddit, Atlas Obscura, Claude's own picks (labeled separately) |
| Events & festivals | City tourism boards, local press, Reddit — only what falls in the travel dates |
| Food | Reddit, Eater, Michelin, World's 50 Best (global + regional, incl. Discovery), plus unlisted local |
| Where to stay | Neighborhoods, with the tradeoff for each |
| Book ahead | Restaurants *and* tours/sites, with lead times and booking channel |
| Practical | Tap water, tipping, and getting around (transit vs. rides, with fares) |
| Country | GDP, economy, tech/startup scene, history, culture, languages, ~10 phrases |

Every entry in Things to do, Events and Food carries a source tag (`reddit`, `michelin`, `50 best`, `my pick`, etc.) so you can see where a recommendation came from.

## How it works

1. **Plan** — fill in the city-specific query slots (food formats, flagship venues, local press, local-language queries).
2. **Gather, once** — every source is queried a single time into one shared dossier of structured one-line entries (name, source tags, link, key facts). No section-by-section re-querying: a Reddit food thread that mentions a canteen feeds Local dishes, Everyday institutions, and Top picks alike from the same entry. Gathering doesn't judge quality — a recommended place stays in the dossier even if other sources pan it, with the criticism attached to its entry as evidence, not deleted — but it does compress: raw thread and article text never enters, only the structured facts.
3. **Draft per section** — each section (Things to do, Events, Food, ...) is written from the dossier using only its own selection bars, with no other section's rules in context.
4. **Cross-section pass** — dedupe so each place appears once brief-wide, and harvest Book ahead's candidates from the other finished drafts.
5. **Verify** — ratings, closures, and event dates get checked only for what survived drafting, not every candidate considered.
6. **Assemble and publish** as one artifact.

## Layout

```
travel-brief/
  SKILL.md                          the pipeline: phases, orchestration, cross-section rules
  reference/
    shared.md                       traveler profile, entry style, ratings, source tags, accuracy
    research.md                     source mechanics, the consolidated query plan, dossier format
    brief-template.html             output structure + styling
    sections/
      things-to-do.md               selection bars + checklist, one file per brief section
      events.md
      food.md
      where-to-stay.md
      book-ahead.md
      practical.md
      country.md
```

Research runs once against all sources into a shared dossier; each section file is then loaded on its own to select from that pool, so one section's rules never sit in another section's context and nothing gets researched twice.

## Installing into Claude chat

Rebuild the zip after any edit:

```sh
./build.sh
```

Then in Claude — Settings → Customize → Skills → **Upload skill**, and pick `dist/travel-brief.zip`. The upload runs a short security scan (1–2 minutes) before the skill is usable.

Re-uploading replaces the previous version.

The uploader rejects a SKILL.md whose frontmatter `description` contains angle brackets (they read as XML tags) — write placeholders as `[place]`, not `<place>`.

## Installing into Claude Code

Symlinked into the user skills directory, so edits here apply with no rebuild:

```sh
ln -sfn "$PWD/travel-brief" ~/.claude/skills/travel-brief
```

Available in every Claude Code session as `/travel-brief`. Uninstall by deleting the symlink.

## Using it

> travel brief for Lisbon

Claude researches, publishes the artifact, and summarizes what to book first and what it couldn't confirm. In Claude Code the artifact comes back as a URL; in chat it renders inline.

Web search must be enabled or the skill has nothing to research with.

Reddit — the richest source in the brief — blocks plain web fetches, so the skill drives it through the Claude in Chrome extension instead. Connect it for full Reddit coverage; without it, the skill falls back to domain-filtered search or asks you to paste in threads.

## Editing

`SKILL.md` is the pipeline only. What gets researched lives in `reference/research.md`; how sources are weighted and cited in `reference/shared.md`; each section's selection bars in its file under `reference/sections/`. `reference/brief-template.html` is only the look and section order — adding or removing a section means changing both the section file and the template.
