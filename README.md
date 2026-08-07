# travelplan

A Claude skill that researches a destination against a fixed checklist and outputs a one-page travel briefing as an artifact.

Authored here, run in Claude chat.

## What it covers

| Section | Sources |
| --- | --- |
| Things to do | Reddit, Atlas Obscura, Claude's own picks (labeled separately) |
| Food | Michelin, World's 50 Best (global + regional), plus unlisted local |
| Where to stay | Neighborhoods, with the tradeoff for each |
| Book ahead | Restaurants *and* tours/sites, with lead times and booking channel |
| Practical | Tap water, tipping, rideshare apps |
| Country | GDP, economy, history, languages, ~10 phrases |

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

## Editing

`SKILL.md` is the behavior — what gets researched, how sources are weighted, the accuracy rules. `reference/brief-template.html` is only the look and section order. Changing a section in one means changing it in the other.
