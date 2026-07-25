# Translation Glossary (German)

Running reference for translating `LANG_German.yarn_lines.csv`. Read this before translating a new batch, and append any new proper noun, recurring phrase, or item name you coin so later batches stay consistent. Don't redefine an existing entry — if you think one is wrong, flag it in your final report instead of silently changing it.

## Conventions (see CONTEXT.md and docs/adr/ for full rationale)

- Uniform **"du"** address form for every character, no exceptions (ADR-0001).
- Translate proper nouns (place names, item names) into German (ADR-0002).
- Preserve each `Speaker`'s typographic voice (ALL CAPS bursts, stacked `!!`, ellipses, lowercase-only) — translate the words, keep the punctuation/casing pattern.
- Sentence-initial words stay lowercase to match the source's casual all-lowercase style — but German nouns are ALWAYS capitalized regardless of sentence position (that's German orthography, not a style choice).
- **DECIDED**: character/person names (Claire, Avery, Jim, Julie, Tim, etc.) must ALWAYS be capitalized, even though the source keeps them lowercase for stylistic reasons and even mid-sentence. This is stricter than the common-noun rule — German proper names have zero stylistic lowercase exception. Batches 1-9 translated names lowercase before this was decided; a global cleanup pass will fix those at the end. Batches from 10 onward: always capitalize names from the start.
- Target length: roughly 1.10-1.15x the `OriginalText` character count. Very short lines (under ~10 chars) will often overshoot this ratio since German needs more characters for the same fragment — that's fine, just keep the absolute length short.
- Keep casual, colloquial phrasing over textbook-correct German — contractions, dropped verb endings ("bring" not "bringe"), idioms like "oder so". Common English loanwords already naturalized in casual German speech (sorry, ok, cool, hey) can stay as-is rather than being translated.
- Never translate or alter markup: `<sprite name="...">`, `<color=red>...</color>`, `{{UseItemButton}}`, `{0}` `{1}` `{2}` placeholders, literal `\n` line-break escapes (keep as literal backslash-n, not an actual newline).
- Leave `Comment`, `Speaker`, `StoryNode`, `LineCode`, and `OriginalText` columns untouched — only ever edit `LineText`.
- The 3 store-page rows (`store requirements`, `store description`, `store short description`) stay blank — out of scope.

## Place names

- White Coast Trail → **Weißküstenpfad**
- Rangers Cabin → **Rangerhütte**
- Hawk Peak → **Habichtsgipfel** (the park/mountain's name — expect "Hawk Peak Provincial Park" etc. to compose from this)
- Hawk Peak Trail → **Habichtsgipfelpfad**
- Meteor Lake → **Meteorsee**
- Meteor Lake Overlook → **Meteorsee-Aussicht**
- Visitor Center → **Besucherzentrum**
- Sid Beach → **Sid-Strand**
- Shirley's Point → **Shirleys Landspitze**
- Blackwood Trail → **Schwarzholzpfad** (deliberately NOT "Schwarzwaldpfad" — avoids colliding with the real-world Schwarzwald/Black Forest region)
- Royal Ridge → **Königsgrat**
- Good Creek Path → **Gutbachweg**
- RESOLVED: "White Beach Trail" (line:665732, line:1024d7) was a source-text inconsistency for the same trail as "White Coast Trail" — unified to **Weißküstenpfad** everywhere (confirmed by human review; the WhiteCoastSign StoryNode name and 3-to-2 majority both pointed to White Coast Trail being canonical).
- Hawk Peak Provincial Park → **Habichtsgipfel-Provinzpark** (composes Hawk Peak → Habichtsgipfel with "Provinzpark", per existing entry above)
- Outlook Point → **Aussichtspunkt** (a named location — the destination of the shorter hike up the west side of the mountain, distinct from Hawk Peak itself)
- Harbord Ridge → **Harbord-Grat** (kept "Harbord" as an untranslated proper name — mirrors the Shirley's Point → "Shirleys Landspitze" pattern of keeping a personal/place name as-is and only translating the geographic-feature word)
- Pat's Point (`AuntDynamic`, Aunt May naming the "mysterious island" Claire swam to) → **Pats Landspitze** — same pattern as Shirley's Point → Shirleys Landspitze (personal name kept as-is, geographic-feature word translated, no apostrophe-s per German genitive convention)
- "firetower" (`AuntDynamic`, at Outlook Point) → **Feuerwachturm**
- Blackwood Forest → **Schwarzholzwald** (composes with the existing Blackwood Trail → Schwarzholzpfad entry; same deliberate avoidance of "Schwarzwald")
- Hawk Peak Island → **Habichtsgipfel-Insel** (composes Hawk Peak → Habichtsgipfel with "Insel", same pattern as Hawk Peak Provincial Park)
- Blackwood Forest Lighthouse (`Artist1Start`, "blackwood forest lighthouse") → **Schwarzholzwald-Leuchtturm** (composes existing Blackwood Forest → Schwarzholzwald with "Leuchtturm")
- Orange Islands (`OrangeIslandsSign`/`OrangeIslandsInfoStart`, signage naming a small island cluster whose rock is colored by iron oxide) → **Orangeninseln** — single compound noun (not hyphenated), deliberately reusing the "Orange" = fruit/color double meaning that already exists in the English name, since German "orange" (the color) derives from "die Orange" (the fruit) — "Orangeninseln" literally reads as "islands of oranges" while also meaning "the orange-colored islands", same ambiguity as the source.

## Recurring words/phrases

- "sorry" → **sorry** (kept as loanword)
- "ok" → **ok** (kept as loanword)
- "i see" → **achso**
- watch (wristwatch, casual dialogue reference) → **die Uhr** — formal item name is **Armbanduhr** (see Item names)
- "You found a {item}!" (`foundItemBefore`/`itemNameHighlight`/`foundItemAfter`) → **"Gefunden: {item}!"** — sidesteps German's gendered articles (der/die/das) and verb-final word order, which "You found a X" can't cleanly map to. Same pattern for `fishCatchBefore` ("you caught a") → **"Gefangen:"**. If you add any other "before item name" UI string, prefer this label-colon-item pattern over a literal sentence.
- credit/playtester/real-person names → **never translate**, copy verbatim.
- "custom", "credits", "gamepad", "vsync", "cheats", "audio", "info" → kept as common German-gaming-UI loanwords, unchanged.
- **Player character is female ("Claire")**, confirmed by an NPC addressing her by name in BeachFoxStart. Where German grammar forces a gender choice for a self-referential Player line (e.g. a noun like "Wanderer/Wanderin", a past participle like "geboren/geborene", an attributive adjective agreeing with a gendered self-description), use feminine forms. Predicate adjectives ("ich bin müde") don't inflect for gender in German, so most lines are unaffected — this only matters for the specific cases where German syntax requires picking one.
- "what's your deal?" / "so what's your deal" → **"was ist dein ding?"** — recurring casual idiom, use consistently.
- "see ya" (short dialogue-choice farewell) → **"man sieht sich"**
- "catch ya later!" → **"man sieht sich!"**
- "see ya around!" → **"man sieht sich!"** (same pattern as "catch ya later!")
- "keep it fresh!" (Frog's casual sign-off) → **"bleib frisch!"**
- "mom" (Claire's mother, phone-call dialogue) → **mama** (no prior entry existed; picked the casual/warm form consistent with the informal-du tone rather than formal "Mutter")
- "Aunt May" → **Tante May** (already established in earlier batches, e.g. AuntRunOffStart — reused here, not a new coinage)
- "Ranger May" (Shell Kid referring to Aunt May by her professional title, not "Aunt") → **Rangerin May** — feminine occupational form since May is confirmed female; no prior entry existed for this title form (distinct from "Tante May")
- "cottage" (Aunt May's home, casual reference) → **Hütte** — same word as the established Cabin → Hütte pattern (Rangers Cabin → Rangerhütte), kept consistent rather than coining a separate word for "cottage"
- "uncle" (Claire's uncle, mentioned by a jogger NPC) → **Onkel**
- "updraft" → **Aufwind** (already established via an existing translated line about "the hot springs... create these amazing updrafts" → "Aufwinde"; reused here, not new)
- "hot springs" (PolarBearStart tip, plural) → **heiße Quellen** (already established via the same "hot springs at the peak" line above; reused here, not new)
- RESOLVED: `VisitorCenterStart`'s "what kind of merch do you sell?" was fixed from "ihr" to "was für Merch verkaufst du?" to comply with ADR-0001 (no exceptions). Matches the `Strawberries` node's already-correct singular phrasing.
- "what's MY/YOUR deal?" (Tough Bird's retort, `ToughBirdWhatDeal`) → **"was ist MEIN/DEIN ding?"** — same idiom as the existing "what's your deal?" → "was ist dein ding?" entry, just re-cased/re-personed; reuse this pattern for any further variants.
- "basic" (Tough Bird's mild insult for "uninteresting/mainstream", per source Comment) → **basic** (kept as loanword — already naturalized in casual German youth slang with the same meaning)
- "kohle" (slang for money/cash, casual dialogue e.g. Tough Bird's "extra cash", "short on cash") → **Kohle** — established here as the casual money slang; prefer over literal "Geld" in flippant/casual money-talk lines
- "tough bird" (idiom describing Claire's resilient mom, `AuntFinalDialogue`, spoken by Aunt May) → **"ein zäher Vogel"** — translated literally rather than with a non-bird idiom, since the game world is populated by anthropomorphic animals and "Vogel" preserves the intentional pun (mom is literally a bird character)
- Rock Climbers Association (`RhinoStart`, ClimbSquirrel's all-caps rant) → **Kletterverein** — informal club-registry term, composes with the existing "climbing club" → "Kletterclub" usage elsewhere in the same scene
- "climbing club" / "the CLIMBING club!" → **Kletterclub** / **KLETTERclub** (case preserved for emphasis, per Speaker-voice rules)
- "student loan" (Tough Bird, `ToughBirdWhatsUp`) → **Studienkredit**
- "BEACHSTICKBALL" (invented game name, `VolleyKidStart`, RefereeKid/VolleyKid's shouted game) → **STRANDSTOCKBALL** (translated as a compound per ADR-0002, all-caps preserved for Speaker-voice emphasis)
- "i'll see you around" (Artist5's farewell, `Artist5Start`) → **"man sieht sich!"** — reused existing "see ya around!" farewell entry, not a new coinage
- "french toast" (`RelaxedFrogStart`, Frog listing breakfast foods) → **french toast** (kept as loanword — common enough in casual German food talk; "Armer Ritter" exists but is more obscure/old-fashioned than the tone calls for)
- "blackbelt" (Artist4's exaggerated rant about a critic, `Artist4Start`) → **Schwarzgurt**
- "curating" / "the exhibition" / "my exhibit" (Artist story arc, `Artist2Start`–`Artist6Start`) → **kuratieren** / **die Ausstellung** — used consistently across the Artist nodes for the recurring gallery-show subplot
- "contemporary artist" / "contemporary work" (Artist4's rant about Ian Artsworth) → **zeitgenössischer Künstler** / **zeitgenössische Kunst**
- "Ian Artsworth" (fictional famous artist, `Artist4Start`) → kept untranslated as a personal name, per the existing pattern of not translating character names
- "Julie" (RefereeKid's name, revealed in `RefereeKidStart` — Player greets her by name) → kept untranslated as a personal name
- "beachstickball" (lowercase, running-prose mentions of the game name, distinct from the shouted all-caps `BEACHSTICKBALL!!!` → `STRANDSTOCKBALL!!!` entry above) → **Strandstockball** (capitalized per German noun rules even at sentence-initial position, e.g. `VolleyballGameStart`/`FirstVolleyLost`) — same compound as the existing all-caps entry, just cased normally for prose
- "coop game" / "co-op game" (`FirstVolleyLost`, RefereeKid's mispronunciation gag corrected by Player) → **Koopspiel** / **Ko-op-Spiel** — the English pun relies on "coop" (chicken coop) vs. "co-op", which doesn't carry over into German; kept only the hyphen-vs-no-hyphen visual distinction between the two spellings so the correction beat still reads as a spelling nitpick, even though the literal pun is lost. Flag for a human: this joke doesn't really land in German as translated.
- "kohle" reused for `GiveVolleyPrize2`/`GiveVolleyPrize3` (VolleyKid casually giving away "all the money in my pocket") → extends the existing Kohle entry (previously only Tough Bird's "cash" lines) to this playful money-prize context; same flippant-money-talk register
- "holy moly" (`RegularVolleyLost`, VolleyKid's excited exclamation on hitting 30 points) → **"heiliger Strohsack"** — classic German colloquial exclamation of surprise, matches the register better than a literal translation
- "the abandoned building race" (`RaceSelectMenu`, Player dialogue-choice menu label; the actual race itself — `AveryBuildingSignStart`, `BuildingRaceIntro` — is out of scope for this batch and still untranslated) → **"das Rennen zum verlassenen Gebäude"**; "abandoned building" alone → **verlassenes Gebäude**. Coined here for the menu label only — reuse for the fuller `BuildingRaceIntro`/`AveryBuildingSignStart` dialogue in a later batch.
- "the mountaintop race" (`RaceSelectMenu` menu label, corresponds to the `MountainTopRaceIntro`/`MountainTopRaceRetry` nodes about racing to Hawk Peak's summit) → **"das Gipfel-Rennen"**
- "the lighthouse race" (`RaceSelectMenu` menu label, corresponds to `LighthouseRaceIntro`/`LighthouseRaceRetry`) → **"das Leuchtturm-Rennen"**
- "Avery" (racer NPC who proposes the mountaintop/lighthouse/building races, `Speaker` tagged `Original` in `AfterRaceIntro`/`MountainTopRaceIntro`/`LighthouseRaceIntro`/`BeginRace`/etc.) → kept untranslated as a personal name, per existing character-name pattern; her name itself doesn't appear as literal text in this batch's lines (only in `Comment` notes and other out-of-scope nodes like `AveryIntroduction`) but flagging here since her dialogue is now translated across 5 of this batch's nodes
- "junior ranger" (`CampCatStart`, camper cat asking Claire if she's one) → **Junior-Rangerin** — feminine occupational form since it addresses Claire (confirmed female), consistent with the existing "Ranger May" → "Rangerin May" pattern
- "you're a LIFESAVER!" (`CampCatStart`, addressed to Claire) → **"du bist eine LEBENSRETTERIN!"** — feminine form since it's a predicate noun agreeing with the (female) addressee, not just a predicate adjective
- CampCat (unnamed NPC in `CampCatStart`/`CampCatFreakout`, caught camping without a permit) — **gender not established** in the source text (no gendered pronouns found); self-referential ALL-CAPS lines like "I'M A TERRIBLE LIAR"/"I'M A MESS" were translated with masculine grammatical forms (**"ICH BIN EIN SCHRECKLICHER LÜGNER"**, **"ICH BIN EIN WRACK"**) as a default. Flag for a human/later batch: if CampCat's gender is established elsewhere (e.g. in `CampCatFreakout`, out of scope for this batch), these forms may need revision to feminine.
- "the {{FishName}}" pattern (`BuyFishQuip`/`BuyRareFishQuip`, the fish-buyer NPC naming the traded fish) → translated by **dropping the German definite article/adjective entirely** (e.g. "the {{FishName}}, eh?" → **"{{FishName}}, was?"**, "the rare {{FishName}}?!?" → **"{{FishName}} - so SELTEN?!?"**) rather than guessing "der/die/das", since `{{FishName}}` resolves to many different fish-species display names with different grammatical genders (see fish-species table) and the CSV can't restructure the template per-species. Same rationale as the existing `foundItemBefore`/`fishCatchBefore` label-pattern workaround above — reuse this dropped-article approach for any further "the {{FishName}}"-shaped lines.
- Where a rare-fish quip needed a pronoun to refer back to the caught fish (not the species name itself), used the generic **"der Fisch" → "er"** (masculine, matches the established generic Fish → Fisch entry) rather than a gendered pronoun tied to the specific species — e.g. `line:19bd98` "but here it is..." → "aber hier ist er...".
- "howdy!" / "howdy" (FishBuyer NPC's folksy greeting, `FishBuyerStart`) → **"moin!"** / **"moin"** — regional-casual greeting matching the character's folksy dialect voice (dropped g's, "ya"/"yer"/"gotta"); used consistently for both instances.
- "kid" (Fisher/Walrus in `FisherTalk` addressing Claire affectionately, e.g. "you've got spirit, kid") → **"kleine"** — feminine informal address term since it's directed at Claire (confirmed female), parallel to the existing feminine-occupational-term pattern (Rangerin, Junior-Rangerin) for lines that grammatically must pick a gender for Claire.
- "Dear Sign Reader:" (`AveryBuildingSignStart`/`AveryLighthouseSignStart`, Avery's written sign/letter addressed to whoever finds it — always Claire in practice) → **"Liebe Schildleserin:"** — feminine since addressed to Claire; note this sign-letter text uses standard sentence-initial capitalization (matching the source's own Title/Sentence-Case style for this written-letter node), unlike the game's usual all-lowercase casual-dialogue convention — don't lowercase these two nodes' letter body text in later batches if more of it surfaces.
- "look alive!" (Walrus fishing-tutorial line, `FishTutNibbleStart`) → **"aufgepasst!"** — idiomatic "pay attention" rather than literal "look alive"
- "gosh dang it!" (`BuyRareFishQuip`) → **"verflixt und zugenäht!"** — classic German folksy exclamation, matches the fisherman's homespun voice
- "WHAT THE HECKY?!" (`BuyRareFishQuip`) → **"WAS ZUM HENKER?!"**
- "no way!" / "yeah way!" (`BuyRareFishQuip`, a back-and-forth exclamation pair) → **"niemals!"** / **"doch, echt!"** — the English rhyme/echo ("way"/"way") doesn't carry over into German; flag for a human, this exchange loses its wordplay in translation (same category of loss as the existing `FirstVolleyLost` coop/co-op pun note).
- "PARKOUR RACING MASTER" (Avery's stated ambition, `AveryIntroduction`) → **PARKOUR-RENNMEISTER**; "PARKOUR RACING" (as a hobby/passion, `AveryStory`) → **PARKOUR-RENNEN** — both compounds, all-caps preserved per Speaker-voice rules since the source caps them for emphasis.
- "you BET YOUR BOTTOM DOLLAR (it's neat)!!" (`AveryIntroduction`, Avery's idiom for "you can be 100% sure") → translated with the German idiom **"DA KANNST DU GIFT DRAUF NEHMEN"** ("you can bet poison on it") rather than literally — same register of confident/playful idiom, caps preserved for emphasis on the idiom phrase instead of literally on "bottom dollar".
- "the abandoned building race" — the full `BuildingRaceIntro`/`BuildingRaceRetry` dialogue (not just the `RaceSelectMenu` menu label noted earlier) is now translated in this batch. "abandoned building" → **verlassenes Gebäude** reused consistently (`line:021dc4`, `eb3492`); no separate coinage needed, the earlier menu-label entry composes cleanly with plain dialogue mentions.
- "another route to race" / "route" (`BuildingRaceIntro`, Avery describing a race course) → **Rennstrecke** — compound noun for "race route/track", used for `line:b3bcd8` ("i've set up another route to race!" → "ich hab noch 'ne rennstrecke aufgebaut!"); prefer this compound over a literal "Route zum Rennen" for brevity in future race-course mentions.
- "k.o." (slang for exhausted/worn out, coined for `AveryStory`'s `line:775c7e` "i hope i haven't tired you out!" → "hoff, du bist nicht ganz k.o.!") → kept as a naturalized German loanword (from boxing "knock-out"), common in casual speech for physical exhaustion; reuse for future "tired you out" / "wore you out" style lines.
- "racing buddy" (`LoseGhost`, Avery calling Claire her racing partner) → **Renn-Buddy** — kept "buddy" as a casual loanword (already naturalized in youth/casual German) compounded with the German "Renn-" prefix, matching the informal register of the scene.
- Avery's aspirational self-description "on a quest to become a X" / "i bet if..." → translated loosely/idiomatically throughout rather than literally, favoring punchier casual German (e.g. dropped subject pronouns like "sollte..." for "ich sollte...", "schlag ich dich..." for "i could beat ya...") to stay within the length budget — consistent with the glossary's existing casual-over-literal preference.
- CampCat (`CampCatFreakout`, batch 10) — this node was checked specifically to try to resolve CampCat's gender per the flag left in the `CampCatStart` entry above. **Gender still not established**: all 5 lines in `CampCatFreakout` are first-person ("i've been on edge...", "the thought of...", "...being accused of camping without a permit...") with no self-referential noun/adjective/pronoun that would reveal gender. Kept the existing masculine default for consistency (no gendered forms actually appear in this batch's CampCatFreakout lines, so no revision was needed here either way). Still flagged for a human: if CampCat's gender surfaces in any other node, batch 7's masculine default may need revision.
- "artist" (`AuntDynamic`, Claire recapping "i met an artist today! ... their art was amazing" — refers to the Artist1Start–Artist6Start quest NPC) → translated with a **masculine default** ("einen Künstler", "er hat ... gemalt", "seine Kunst") since the Artist character's gender is not established anywhere in the source text checked so far (earlier Artist-node batches apparently never hit a line grammatically forcing a gender choice). Same category of flag as the CampCat gender guess — revise to feminine/neutral if a pronoun or gendered self-description for this character turns up elsewhere.
- "friend" (`AuntDynamic`, "i made a friend at outlook point!" — refers to the Dog NPC met at Outlook Point) → translated with a **masculine default** ("einen Freund") for the same reason as the Artist entry above: no established gender for this NPC in the text seen so far. Flag for later revision if contradicted.
- "prime minister" / "master architect" (`AuntDynamic`, Player joking about the Sandcastle Kid's ambitions) → deliberately translated with **grammatically gender-neutral nouns** instead of picking a gender for the Sandcastle Kid (whose gender is also unestablished): "a future prime minister" → **"ein zukünftiges Staatsoberhaupt"** (neuter noun, "head of state"), "a master architect" → **"ein wahres Baugenie"** (neuter noun via "-genie"). Prefer this gender-neutral-noun strategy over picking a default gender when a character's gender is unknown AND a neuter alternative exists that preserves the joke.
- "sandcastle kid" (`AuntDynamic`, the NPC behind the "election process"/sandcastle building questline, referenced but not directly speaking in this batch) → **Sandburgenkind** (neuter, sidesteps gender entirely — see entry above)
- "rangers hat" (`AuntDynamic`, casual dialogue reference to the item also formally named Provincial Park Hat → Provinzpark-Hut) → **Rangerhut** — casual spoken form, same pattern as Wristwatch's formal "Armbanduhr" vs. casual "die Uhr"; reuse "Rangerhut" for future casual mentions of this item, keep "Provinzpark-Hut" for formal item-name contexts.
- "gig economy" (`AuntDynamic`, "i think i joined the gig economy") → kept as **Gig Economy** (loanword, capitalized as a noun phrase per German orthography) — common enough as an untranslated English term in casual German economic/pop-culture talk.
- "money rock" (`AuntDynamic`, Animal Crossing reference, Player whacks a shovel against a rock and money comes out) → **Geldfelsen** (compound of Geld + Felsen)
- Ontario (`AuntDynamic`, real-world place name in Aunt May's joke) → kept as **Ontario**, capitalized per standard German orthography for proper nouns (not a new translation decision, just noting it's correctly capitalized here since the English source stylistically lowercases it)
- "speed demon" (`WinMedal`, Avery's ALL-CAPS praise for Claire after losing a race, "you are a SPEED DEMON" / "what speed demons get") → **Rennteufel** ("racing devil") — idiomatic German equivalent for a fast/reckless racer, keeps the informal punchy register better than a literal "Geschwindigkeitsdämon"; caps preserved on the single-instance line for Speaker-voice emphasis, lowercase in the following non-emphasized mention ("what speed demons get" → "was rennteufel bekommen").
- "AWARDS!!" (`WinMedal`, "they get AWARDS!!", paired with the "speed demon" line above) → translated as **"PREISE!!"** ("prizes") rather than a literal "Auszeichnungen" — shorter, keeps the punchy all-caps exclamation within length budget, and reads naturally in a racing-trophy context.
- "craft fair" (`Deer2`, Deer NPC making sunhats "for the upcoming craft fair") → **Bastelmarkt**
- "northern lights" (`IceHikerPeak`, hiker NPC photographing the aurora at Hawk Peak's summit) → **Nordlichter**
- "fire ban" / "fire caution" (`FireOutRangerStart`, distinguishing a full ban from a lesser warning) → **Feuerverbot** / **Feuerwarnung**
- "customer" (`BuyDeerHat`, Deer NPC calling Claire "you're my first customer!") → **Kundin** — feminine form since addressed to Claire (confirmed female), same pattern as the existing Rangerin/Junior-Rangerin/kleine entries for grammatically-forced gender choices on Claire.
- "thank YOU" (`BuyDeerHat`, Player's emphasized reply to being thanked) → **"danke DIR"** — caps emphasis moved onto "DIR" (the pronoun) since German's word order doesn't allow emphasizing a trailing "you" the same way English does.
- "dad" (generic address/reference noun, distinct from "Dad Deer" as a capitalized character/speaker name — used by Kid Deer talking *about* or *to* their father in `KidDeerStart`/`OfferBoat`/`KidBoatRequestChallenge`/`KidBoatAbandoned`/`BrokenBoatNoticedStart`/`DadFixedBoatStart`) → **papa** — kept lowercase even mid-sentence, matching the existing established precedent for "mom" → "mama" (glossary entry above), which is also kept lowercase throughout prior batches despite being a common noun. **Flag for a human**: this lowercase treatment of "mama"/"papa" technically conflicts with the glossary's own stated German-orthography rule that common nouns are always capitalized — but since "mama" was already committed lowercase across multiple earlier batches, "papa" was kept consistent with it rather than silently introducing a capitalized outlier. Worth a dedicated cleanup-pass decision (capitalize both, or formally document the lowercase-family-term exception) alongside the already-flagged character-name lowercase cleanup.
- Kid Deer / Dad Deer (recurring family duo NPCs, boat-rental questline: `KidDeerStart`, `DadDeerStart`, `DadDeerRent`, `DadDeerWhatUp`, `DadDeerRented`, `KidDeerChillStart`, `KidBoatFastPlease`, `KidBoatRequestChallenge`, `StartBoatChallenge`, `BeforeBoatRaceStart`, `KidBoatRaceActive`, `KidBoatRaceRunAway`, `KidBoatAbandoned`, `CrashedBoatStart`, `BrokenBoatNoticedStart`, `DadFixedBoatStart`) — Kid Deer's dialogue is tagged `Speaker` = `Original` in most nodes but `DeerKidBoat` in `DadFixedBoatStart`; Dad Deer is tagged `DadDeer` in some nodes but `Original` in others (e.g. `DadDeerStart`, `DadDeerRent`, `DadDeerRented`, `DadFixedBoatStart`) — distinguish by `StoryNode`/dialogue content, not just the `Speaker` column, same pattern as Avery/Julie sharing `Original`. Kid Deer's voice: bratty/dramatic teen register, ALL-CAPS outbursts ("I'M DYING!!!", "THIS IS MY FAULT"), internet-slang asides ("jk", "hashtag worst dad ever", "peace"). Dad Deer's voice: calm, mellow, dry ("now hold on there!", "well...").
- "boating challenge" (Kid Deer's invented water-checkpoint race, `KidBoatRequestChallenge`/`BeforeBoatRaceStart`/etc.) → **Boots-Challenge** — kept "challenge" as an established casual English loanword (parallel to existing "renn-buddy"/"ko-op-spiel" pattern of compounding a kept loanword with a German prefix), rather than translating to "Herausforderung" which would read too formal for Kid Deer's casual teen voice.
- "checkpoints" (`BeforeBoatRaceStart`, water checkpoints for the boat race) → **Checkpoints** (kept as loanword, common in German racing/gaming contexts)
- "motorboating safety and operations guide" / "boating manual" (`DadDeerRent`, formal in-world safety booklet Dad Deer references) → **Provinz-Leitfaden für Motorbootsicherheit** — casual spoken reference, composes with the existing `Boating Manual → Bootshandbuch` item-name entry (used for the actual readable item) but this is Dad Deer's own casual verbal description of it, not the formal item name.
- "omigosh!!" (Kid Deer's excited exclamation, `OfferBoat`) → **omg!!** — kept as a naturalized internet-slang loanword rather than a literal "meine güte", matching Kid Deer's casual teen-texting register.
- "level 2 play" (Avery's parkour-race slang for an impressive move, `UsedVehicleInRace`) → **Level-2-Move** — compound with kept English gaming loanwords ("Level", "Move"), matches Avery's existing pattern of English-loanword compounds (see "Renn-Buddy", "k.o." entries above).
- **DECIDED (batch 13)**: "dad" (Kid Deer's casual reference/address noun for Dad Deer, e.g. `BoatKidThanks`'s "not telling dad...") → **Papa**, now capitalized per standard German noun-capitalization — this REVERSES the earlier lowercase "papa"/"mama" precedent noted in the batch-9-era entry above (which was explicitly flagged there as an inconsistency to fix later). From batch 13 onward, always capitalize Papa/Mama; a global cleanup pass still needs to fix the lowercase instances in batches 1-9ish.
- "boating challenge" / "challenge" (Kid Deer, `KidRequestChallengeFixed`, continuing the boat-rental questline after the boat is fixed) → reused existing **Challenge** loanword (see "boating challenge" → "Boots-Challenge" entry above); bare "my challenge" → **"meine Challenge"**.
- "rampless boating fun" (Kid Deer, `KidRequestChallengeFixed`, joking about redoing the challenge without ramps) → **Boots-Spaß** — extends the existing Boots-Challenge compound pattern (Boots- prefix + kept/coined noun) for a second boat-related compound.
- "high five?" (Kid Deer offering then declining a high-five, `BoatRaceWon`) → **"High Five?"** — kept as a capitalized loanword noun phrase (standard German treatment of this borrowed term).
- "old friend meme" / "inside joke" (Kid Deer's slang for a running gag, `BoatRaceWon`) → **Insider-Meme** / **Insider-Witz** — translated the concept rather than the literal "old friend" wording, since "old friend meme" doesn't have a natural German equivalent; "meme" kept as an already-naturalized loanword.
- "Now THAT rocks!" (`OrangeIslandsInfoStart`, sign pun on "rocks" = the geology AND the idiom for "that's awesome") → translated as **"Jetzt wird's aber HART!"** ("hart" = hard/rock-hard, doubling as slang for "intense/cool") — an attempt to keep a rock-adjacent pun rather than a flat "das ist toll!", though it's not a 1:1 equivalent of the English wordplay; flag for a human if a tighter pun is found later.
- "niche" (adjective, `WhatchaReadingActualText`, "it's still pretty niche") → **nischig** — colloquial German adjective derived from "Nische", naturalized enough in casual speech for this book-nerd context; not in formal dictionaries but reads as intentional slang, matching the casual register.
- The Bolder Boulders book series (`WhatchaReadingActualText`, fictional in-world fantasy novel titles: "The Bolder Boulders Book 1: The Bedrock Battalion", "...Book 2: Between A Rock and a Hard Case", "...Book 3: All Ore Nothing", "...Book 4: Hearts of Stone", "...: Infinity") → kept **entirely untranslated, in English**, same treatment as personal/character proper nouns (e.g. "Ian Artsworth"). These titles are built on English puns ("Bolder"/"Boulder", "Ore"/"or", stone-themed idioms) that don't have a clean 1:1 German pun equivalent; re-coining new German puns felt riskier than preserving the joke shape in English, which reads naturally enough as "the book Claire is reading has an English title" in a localized game. Flag for a human: revisit if a full pun-preserving German title set is wanted later.
- Mega Fist / Stone Crusher (`WhatchaReadingActualText`, the two golem protagonists inside the Bolder Boulders books) → **Mega-Faust** / **Steinzermalmer** — UNLIKE the book titles above, these two epithet-style character names were translated rather than kept in English, since they're simple, transparent descriptive compounds (fist/crusher) that read naturally as fantasy-golem names in German and the joke doesn't depend on English wordplay. "Ronaldo" (their son, same node) was kept as-is, an ordinary personal name.

## Item names

Singular / Plural — German:

- Bait → Köder / Köder
- Bucket → Eimer / Eimer
- Camping Permit → Camping-Genehmigung / Camping-Genehmigungen
- Cellphone (incl. `IHighRes` duplicate) → Handy / Handys
- Coin → Münze / Münzen
- Compass → Kompass / Kompasse
- Fish (generic item) → Fisch / Fische
- Fish Journal → Fischtagebuch / Fischtagebücher
- Fishing Rod → Angelrute / Angelruten
- Golden Feather → Goldene Feder / Goldene Federn (item-name display, title case). In running dialogue prose, use normal German grammar instead: lowercase adjective + capitalized noun, e.g. "eine goldene Feder", "goldene Federn" — not title case mid-sentence.
- Golden Rod (rare fishing rod) → Goldrute / Goldruten
- Headband → Stirnband / Stirnbänder
- Baseball Cap → Baseballkappe / Baseballkappen
- Medal → Medaille / Medaillen
- Provincial Park Hat → Provinzpark-Hut / Provinzpark-Hüte
- Pickaxe → Spitzhacke / Spitzhacken
- Running Shoes → Laufschuhe / Paare Laufschuhe
- Shell → Muschel / Muscheln
- Shell Necklace → Muschelkette / Muschelketten
- Shovel → Schaufel / Schaufeln
- Silver Feather → Silberne Feder / Silberne Federn
- Stick → Stock / Stöcke
- Sunhat → Sonnenhut / Sonnenhüte
- Toast → Toast / Toasts
- Toy Shovel → Spielzeugschaufel / Spielzeugschaufeln
- Piece of Trash → Stück Müll / Stücke Müll
- Treasure Map → Schatzkarte / Schatzkarten
- Walkie Talkie → Walkie-Talkie / Walkie-Talkies
- Wristwatch → Armbanduhr / Armbanduhren (casual spoken reference: "die Uhr")
- Motorboat Key → Bootsschlüssel / Bootsschlüssel
- Boating Manual → Bootshandbuch / Bootshandbücher

Fish species (display name — these are also achievement/journal entries, keep consistent everywhere):

- Bluegill → Blauer Sonnenbarsch
- Brook Trout → Bachforelle
- Burbot → Quappe
- Common Carp → Karpfen
- Catfish → Wels
- Salmon (Chinook Salmon) → Lachs
- Crayfish → Flusskrebs
- Northern Pike → Hecht
- Pumpkinseed Fish → Kürbiskernbarsch
- Rainbow Trout → Regenbogenforelle
- Spotted Brook Trout → Getüpfelte Bachforelle
- White Bass → Weißbarsch
- White Perch → Silberbarsch
- Yellow Perch → Gelbbarsch
- "Tiny" (fish size tag) → Winzig; "Big" → Groß — kept as uninflected badge-style tags (not grammatically agreeing with the fish name), consistent with `fishTitleOrder` staying `{0} {1} {2}` (ADR — the template's word order/agreement can't be safely restructured from this CSV).
- "Actually" (rare rainbow trout modifier, pun on it being genuinely rainbow-colored) → Wirklich

## Character voice notes

- `TimScared`: ALL CAPS bursts for panic/nervousness.
- `RefereeKid`: stacked exclamation marks (`!!`) for hype/enthusiasm. Note: in `RefereeKidStart`, this same character (named "Julie" in-dialogue) is tagged with `Speaker` = `Original` rather than `RefereeKid` for her own lines — the stacked-`!!` voice still applies; go by which node/character is speaking, not just the `Speaker` column.
- `AuntMayNPC`: calm, lowercase, warm.
- Avery (racer NPC, see "Avery" entry above): also tagged `Speaker` = `Original` like Julie/RefereeKid — distinguish by `StoryNode` (`AveryIntroduction`, `AveryStory`, `BuildingRaceIntro`, `BuildingRaceRetry`, `ConsiderFeathersRace`, `CancelRaceShoes`, `WinRegular`, `WinGhost`, `LoseRegular`, `LoseGhost`, `GiveWalkieTalkie`, etc.). Voice: single ALL-CAPS words/short bursts for excitement/emphasis (GREAT!, EXCELLENT!, HI!!, AVERY!!, GOOD!, MACHINE) rather than RefereeKid's stacked `!!`; frequent trailing ellipses ("so...", "however", "welp") between excited bursts giving a chatty, self-interrupting rhythm. Consistently good-humored even when losing a race.
- `SitSquirrel` (Tim, the climber squirrel character, appears as `Original` in `IceSquirrelStart`/`SquirrelClimbStart` and as `SitSquirrel` in `IceRhinoStart`/`ClimbersRestTalk`/`PolarBearSitStart`/`DiscussedNovel`): mixed voice depending on context — calm/lowercase in one-on-one climbing-advice dialogue (`IceSquirrelStart`), but bursts into ALL CAPS hype/excitement in the group rest-stop scenes (`ClimbersRestTalk`'s "I JUST CONQUERED HAWK PEAK", `SquirrelClimbStart`'s panicked "THIS AIN'T HELPING CLAIRE!"). Preserve whichever casing the specific line uses rather than normalizing to one register.
- `SitBear` (Charlie, the bear working up the mountain, writing a secret novel — confirmed male via "he's got a lot of good stories" in `IceRhinoStart`): calm, measured, lowercase, understated even when correcting the group ("well technically...").
- `SitRhino` (unnamed rhino climber, appears in `IceSquirrelStart`/`IceRhinoStart`/`ClimbersRestTalk`/`DiscussedNovel`): calm, thoughtful, lowercase — the "voice of reason" of the climbing trio, e.g. arguing for happy endings and safety-first in `DiscussedNovel`/`ClimbersRestTalk`.
- Kid Deer (boat-rental questline, see glossary entry above for full node list and `Speaker`-tag caveat): dramatic/bratty teen voice, ALL-CAPS outbursts for exaggerated emotion, internet-slang asides ("jk", "peace", "hashtag ... ever"). Batch 13 adds the questline's final stretch: `DuckFixedBoatStart` (`Speaker`=`DeerKidBoat`), `CrashedBoat2`/`CrashedBoat3`/`KidBoatBroken` (Kid Deer tagged `Original`), `KidRequestChallengeFixed`, `DropOffKid`, `BeforeBoatRaceStartFixed`, `BoatRaceWon`, `BoatRaceLost`, `BoatKidThanks` — voice stays consistent (dramatic teen, "omg", casual slang) through this final rematch-and-farewell arc.
- Dad Deer (boat-rental questline, see glossary entry above): calm, mellow, dry — a foil to Kid Deer's drama, mild deadpan corrections ("now hold on there!"). Batch 13 adds a separate, calmer side-scene where Dad Deer sits reading a fantasy novel series (`WhatchaReading`, `DadDeerNoQuestions`, `DeerWhatsUpToBook`, `DeerDadSeeYa`, `WhatchaReadingActualText`, all `Speaker`=`Original`) — same understated, dry voice, mildly evasive/deflecting when asked about the book at first (`DadDeerNoQuestions`'s "what's what about?"), then opens up and eagerly recaps the whole series plot once asked properly (`WhatchaReadingActualText`).
- Duck mechanic (unnamed NPC who fixes the deer family's boat, `DuckFixedBoatStart`, `Speaker`=`Original` for the mechanic's own lines, distinguished from Kid Deer's `DeerKidBoat` lines in the same node) — new character introduced in batch 13, no dialogue elsewhere in this batch's scope. Voice: laid-back, casual, plain lowercase ("no problemo!", "alrighty", "heh") — a minor one-scene character, no strong quirks to preserve beyond general game-wide casualness. Gender not established in the text (no self-referential gendered forms occur in this batch's lines); flag for a human if it matters in a later batch.
