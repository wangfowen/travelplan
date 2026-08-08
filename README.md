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

## Layout

```
travel-brief/
  SKILL.md                        the procedure
  reference/brief-template.html   output structure + styling
```

## Installing into Claude chat

Rebuild the zip after any edit:

```sh
./build.sh
```

Then in Claude — Settings → Capabilities → Skills → **Upload skill**, and pick `dist/travel-brief.zip`.

Re-uploading replaces the previous version.

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

`SKILL.md` is the behavior — what gets researched, how sources are weighted, the accuracy rules. `reference/brief-template.html` is only the look and section order. Changing a section in one means changing it in the other.
