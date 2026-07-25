# Translate place and item names into German

Place names (e.g. "White Coast Trail", "Hawk Peak", "Sid Beach") and item/treasure names appear throughout dialogue and signage Lines. We chose to translate these into German rather than leave them as English proper nouns, for full immersion and consistency with the surrounding translated dialogue that references them.

This carries a known risk: this translations repo has no visibility into other game surfaces that may reference these names in English and can't be edited from a CSV — Steam achievements, other baked-in UI, save-file text — since the game bundle contains no other localization files to cross-check against ([confirmed absent](../../CONTEXT.md) at the time of this decision). If a future translator discovers such a mismatch, that's grounds to revisit this ADR rather than a sign the translation is wrong.
