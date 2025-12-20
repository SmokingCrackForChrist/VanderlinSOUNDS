/datum/job/jinglesack
	title = "Jinglesack" // If you spawn this in, I hope you're ready to make the Weaponsmith kill himself.
	tutorial = "It's Jinglesack the merry! Oh, gods... He's going to SPREAD his CHEER, the TIME of GIFTING is upon us! Beware, for he will DECLARE who is NAUGHTY OR NICE. \
	May the gods help you if you are NAUGHTY!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/jinglesack
	cmode_music = 'sound/music/cmode/nobility/CombatJester2.ogg'

/datum/outfit/jinglesack/pre_equip(mob/living/carbon/human/H)				// It's not following the standards, because nobody set standards compatible with this shit.
	var/datum/antagonist/new_antag = new /datum/antagonist/jinglesack()		// If you didn't like it, you should have added working reference material.
	H.mind?.add_antag_datum(new_antag)										// Not my fault I can't fucking code! I'm just a sound guy!
	head = /obj/item/clothing/head/helmet/heavy/necked/xylix				// I will be the first and last to admit this is probably some fucked up janky shit!
	neck = /obj/item/clothing/neck/chaincoif/iron
	pants = /obj/item/clothing/pants/trou/leather
	armor = /obj/item/clothing/armor/brigandine
	shirt = /obj/item/clothing/armor/chainmail
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black
	gloves = /obj/item/clothing/gloves/plate
	shoes = /obj/item/clothing/shoes/boots/armor
	r_hand = /obj/item/explosive/bottle
	l_hand = /obj/item/explosive/bottle
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored
	backpack_contents = list(
		/obj/item/explosive/bottle = 2,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/rope/chain = 1,
		/obj/item/flint = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)
	H.playsound_local(H, 'sound/chrimmy.ogg', 80, FALSE, pressure_affected = FALSE)
	to_chat(H, span_userdanger("I JUST LOVE THIS HOLIDAY AND THE MERRY FOLK CELEBRATING IT TOGETHER MY WHOLE MONTH IS JUST A WARM MERRY CAROL AND I ALWAYS WANT TO SPREAD HOLIDAY CHEER THIS IS THE EVE OF PSYDONMAS AND NO FRIEND WILL GO UNGIFTED I WILL PUT UNDER THE TREE AS MANY AS I CAN ITS TIME FOR ME TO GIVE AND ITS TIME FOR THEM TO RECEIVE MY YULETIDE SLAY RIDE BEGINS HERE"))
	ADD_TRAIT(H, TRAIT_FORAGER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHAKY_SPEECH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VILLAIN, TRAIT_GENERIC)
	H.change_stat(STATKEY_STR, 5)
	H.change_stat(STATKEY_END, 3)
	H.change_stat(STATKEY_CON, 3)
	H.change_stat(STATKEY_INT, 3)
	H.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_fuckingkillyou)
	H.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_haveanadequatefestiveperiod)
	H.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/puffer) // Terrifier
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE) // END OF COMBAT STATS, REJOICE!
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mathematics, 6, TRUE) // Do you SEE how much valuable shit is in that bag?
	H.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE) // He made a list, he's trimming it down.

/datum/outfit/jinglesack/post_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()

	if(alert("Do you wish for a random title? Just kidding, you don't have a choice. Welcome to hell.", "", "Yes") == "Yes")
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/title
		var/list/titles = list("The Merry", "The Festive", "Son of Jinglesack", "Son of Jinglesack II", "Jinglesack, son of Jinglesack", "The Jingling Sack", "THE LETHALLY MERRY", "The Yuletide Slayrider", "of the Crimson Snow", "He who is with Jinglesack", "of two Jingling Bells", "Jingle Balls", "Jingled Sack", "Of Jingled Balls", "The Ball Jingler", "The Overtly Festive", "Xylix's Festive Festive Man", "The Gift Bringer") //Have an adequate festive period!
		title = pick(titles)
		H.real_name = "[prev_real_name], [title]"
		H.name = "[prev_name], [title]"

// begin load bearing santa

// %%%%%%%%%%@+++++@%%%%%%%%%%%%%#++++++++++%%%%%%%%%%%%%%%%%%%#%@@@@@@@@@@@@
// %%%%%%%%%%%@#**+@%%%%%%%%%%%+++++==++=+=+#%%%%%%%%%%%%%%%%@@*#@%@%@@@@@*@@
// %%%%%%%%%%%%@+++#%%%%%%%%#*++++==++++====++++++++++++++++%@@@@@@@@@@@@@@@@
// ++++++++++++#++*+%%%%%%#+++================+++++++++++++#%%%%@@@@@@@@@@@@@
// ++++++++++++**+#%%%##**++====================+++++++++++*#%@@@@#@@@@@@@@@@
// +++++++++++*%%%%@%%++++++=====================++++++++++*%@@@@%%@@@@@@@@@@
// ++++++++++%%%@%%%%*++++++=================+==++++++++++%@@@%@@@@@@@@@@@@@@
// ++++++++%%%%%%%#%*++++++================++++++++++++++++%@%*#@@@@@@@@@%**%
// +++++#%%%%%%%*+++++++++++++++++++====++++*++++++++++++#@%@@@@@%@%@@@@@#*+#
// ++++%%%@@@%%#**+++++++++++++++++++++++**+++++++++++++%%@@@@@%%%@@@@@@@@@@@
// %%%%%@@@@@%#*+++++++++++++++++++++++++**++++*+++++++#*%@@@@@@@@@@@@@@@@@@@
// @@%@@@@@@@%****++++++++++++++++++++******#%%*++++++*#%%@@%@@@@@@@@@@@@@@@@
// @%@@@@@@@%%*****+++++++++++++++*#%%%##**#%%**++++++#%@@%@@@%@@@@@@@@@@@@@@
// @@@@@@@@@@%*++***+++++++++++++%#@%#%*##++*****+#**##%@#+*%@@@@@@@@@@@@@@@@
// @@@@@@@@@@%#*+++++++++++++++#*%#*+*****#*******+++*#@@%@%@@@@@@@@@@@@@@@@@
// @@@@@@@@@@%#**+++******#%*%*#*******+*###**##*#++++@@@@@@@@@%@@@@@@@@@@@@@
// @@@@@@@@@@%%#*********+%%%###****++**##+*#*#+#**++++%@@@@@@@@@@@@@@@@@%@@%
// @@@@@@@@@@#*%##********#*######**###**#+#@%+++*++++++#%@@@@@@@@@@@@@%@@@@@
// @@#*#@@@@%+####*****###****#####%##**+++++*##*++++++++%%%%%%%@@@@@@@@%@@@@
// @@*****%%%+#####%%*#*#**+***#####**++++****++++++++++++%%%%%%%%@@@@@@@@@@@
// @@***+++*++++++#%%##*******+*****#*###**+++++++++++++++*%%%%%%%%%@@@@@@@@@
// @@**++++++++++++###******++*+******++*+*++++++++++++++++#%%%%%%%%%%@@@@@@@
// @@#*+++++++++++++********+++++**+++++++++++++++++++++++*%%%%%%%%%%%%%@@@@%
// @%**++++++++++++++++++*++++++++++++++++++++++++++++++++*#%%%%%%%%%%%%%%%@@
// @#***+++++++++++++++++++++++++++++++++++++++++++++++++*+*%%%%%%%%%%%%%%%%@
// @**#***+++++++++++++++++++++++++++++++++++++++++++++++***#%%@%@%%%%%%%%%%%
// @***#**#+**++++++++++++++++++++++++++++++++++++++++++**+##%%@@%%%%%%%%%%%%
// @@@%%@@@@@%%#**++++++++++++++++++++++++++++++++++++++**###%%@@@%@@%%%%%@%%
// @@@@@@@@@@@@#*++++++++++++++++++++++++++++++++++++*****##%%%%@@@@@@%%@%@%%
// @@@@@@@@@@@@%%*++++++++++++++++++++++++++++++++++****##%%%%%@%@@@@@@%%%@%%
// @@@@@@@@@@@@@%%%#**+++++++++++++++*+*+++*++++++*******#%%@@%%@@@@@@%%@@%%%
// @@@@@@@@@@@@@@@@@%%*********+***++****++*++++++++*#%%%%%@@@@%@@@@@@%%@%@%@
// @@@@@@@@@@@@@@@@@@@@@@#@%%#**#******+++++++++++++*#%%%%%%@@@%@@@@@@@@@%@%%
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@##***+++++++++++++++++*#%%%%@@@@@%@@@@@@@%@%@%
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@%***++++++++++++++++++*#%%@@@@@@@%@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*++++++++++++++++++++#%@@@@@@@@%@%%@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@%@@@@@%%*+++++++++++++++++++*%@@@@@@@@%%@@%@@@@%%%#
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#++++++++++++++++++++*@@@@@@@@@%%#%%#**+++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+++++++++++++++++++++#@@@@@@@@%@@%****+++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#*+++++++++++++++++++*%@@@%@@%@@@@##*++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*++++++++++++++++++++*#%@@@@@%@@@@%**++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@**++++++++++++++++++++%%@%@@@%@@@@#*+++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*+++++++++++++++++++++*#@@@@%@@@@@#**++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*+++++++++++++++++++++*#@@@%@@@@@%#**++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*+++++++++++++++++++++#%@%%@@@@*+#*+++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%**++++++++++++++++++**%@@%@@@%++++++++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#*+++++++++++++++++++**%%%@@@*+++++++++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#**+++++++++++*+**+++++@@@@%+++++++++++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#**++++++***+++++++++*%@%+++++++++++++++++
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#**++++++++++++++*+%%@@++++++++++++++++++
// @@@@@@@@@@@@@@%%###*#@@@@@@@@@@@#***+++++++++***%%#%++*+++++++++++++++++++
// @@@@@@@@@@@%%%****+++*#%@@@@@@@@@%%#*#***%%%%%**@#++++++++++++++++++++++++
// @@@@@@@@%#****+++++++++**@@@@@@@@@@@@@%#@@%@%%+++++++++++++++++++++++++*++
// @@@@@@%#***++++++++++++++++**#**###*+++++++++++++++++++++++++++++++++++%++
// @@@@@%***++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%++
// @@@%#***+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*#+++

// end of load bearing santa
// if you deny my PR because of this fuck you
