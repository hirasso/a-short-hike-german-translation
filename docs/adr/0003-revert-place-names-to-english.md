---
status: supersedes ADR-0002 (place names only)
---

# Keep place names in English; only item/fish names stay translated

ADR-0002 translated both place names and item names into German. After playtesting the full German translation, we reversed the place-name half of that decision: place names (White Coast Trail, Hawk Peak, Sid Beach, Rangers Cabin, Visitor Center, etc.) now stay in their exact original English form everywhere they appear, embedded as-is inside otherwise-German sentences — the same way real German casually keeps foreign place names untranslated (e.g. "Central Park") rather than adapting them.

Item and fish names (Angelrute, Kompass, Hecht, Karpfen, etc.) are unaffected by this reversal and remain translated — they're generic vocabulary with a natural German equivalent and no risk of colliding with baked-in game UI, unlike place names (see ADR-0002's own risk callout).

Compound names built from a place name plus a translated descriptor (e.g. "Hawk Peak Provincial Park" → Habichtsgipfel-Provinzpark, "Blackwood Forest Lighthouse" → Schwarzholzwald-Leuchtturm) also revert in full — "Hawk Peak Provincial Park", "Blackwood Forest Lighthouse" — rather than keeping a hybrid German-descriptor suffix. This was a deliberate choice for consistency: a single rule ("place names are always exact English") is easier to apply correctly and audit than a rule that depends on whether a base name happens to be reused elsewhere in a compound.

The prior fully-German place-name translation is preserved as `LANG_German_Full.yarn_lines.csv` for reference/rollback rather than being deleted.
