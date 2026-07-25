# A Short Hike Translations

Community localization files for the game *A Short Hike*. Each `LANG_<Language>.yarn_lines.csv` is a translation of the game's dialogue, UI, and item-name text, loaded by the game's built-in custom-language mod system alongside `AShortHike.app/Contents/_LANG_Custom.yarn_lines.csv` (the source/reference template).

## Language

**Line**:
One row in a `yarn_lines.csv` file: an atomic piece of player-facing text identified by a stable `LineCode`, with columns `LineText` (the translation), `OriginalText` (the English source, left untouched), `Comment` (translator/dev notes, not player-facing), `Speaker`, and `StoryNode` (the Yarn dialogue node the line belongs to).
_Avoid_: Row, entry, string (when referring to a single translatable unit — use Line).

**In-game text**:
Any Line that is actually rendered by the game at runtime — dialogue, signage, item names/descriptions, controller-config hints. Everything in the source CSV *except* the three Store Lines.
_Avoid_: Player-facing text (too broad — Store Lines are also read by humans, just not in-game).

**Store Line**:
A Line whose `LineCode` is `store requirements`, `store description`, or `store short description` — Steam store-page marketing copy, explicitly out of scope for translation. These are left blank in translation files.

**Speaker voice**:
The typographic personality of a `Speaker` — e.g. `TimScared` uses ALL CAPS bursts for panic, `RefereeKid` stacks exclamation marks for hype, `AuntMayNPC` stays calm/lowercase. Distinct from *what* a character says — it's *how* it's capitalized/punctuated. Translations must preserve a character's existing typographic voice rather than normalizing punctuation/casing away.

**Length budget**:
The target ceiling for a translated Line's character count, set per-row at roughly 1.10–1.15× the `OriginalText` length (English). Exists because German text runs longer than English for equivalent meaning, and Lines must fit in fixed-size speech bubbles. Favors punchier, less literal phrasing over exceeding budget.

**Address form**:
Whether dialogue uses German's informal ("du") or formal ("Sie") second person. See [ADR-0001](./docs/adr/0001-informal-address-form.md).
