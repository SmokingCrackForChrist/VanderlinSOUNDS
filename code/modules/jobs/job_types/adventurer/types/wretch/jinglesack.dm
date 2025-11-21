/datum/job/advclass/wretch/jinglesack
	title = "Jinglesack"
	tutorial = "It's Jinglesack the merry! Oh, gods..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/wretch/jinglesack
	total_positions = 2
	cmode_music = 'sound/music/cmode/nobility/CombatJester2.ogg'


	skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axesmaces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/mathematics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/firearms = SKILL_LEVEL_JOURNEYMAN
	)

	traits = list(
		TRAIT_FORAGER,
		TRAIT_STEELHEARTED,
		TRAIT_ZJUMP,
		TRAIT_NUTCRACKER,
		TRAIT_SHAKY_SPEECH,
		TRAIT_DUALWIELDER,
		TRAIT_BREADY,
		TRAIT_HEAVYARMOR,
	)

	jobstats = list(
		STATKEY_STR = 7, //So he can wield those weapons!
		STATKEY_END = 4,
		STATKEY_CON = 3,
		STATKEY_INT = 3,
	)
	spells = list(
		/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_fuckingkillyou,
		/datum/action/cooldown/spell/undirected/conjure_item/puffer,
	)

/datum/outfit/wretch/jinglesack/pre_equip(mob/living/carbon/human/H)
	head = /obj/item/clothing/head/helmet/heavy/necked/xylix
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
	to_chat(H, span_userdanger("I JUST LOVE THIS HOLIDAY AND THE MERRY FOLK CELEBRATING IT TOGETHER MY WHOLE MONTH IS JUST A WARM MERRY CAROL AND I ALWAYS WANT TO SPREAD HOLIDAY CHEER THIS IS THE EVE OF CHRISTMAS AND NO FRIEND WILL GO UNGIFTED I WILL PUT UNDER THE TREE AS MANY AS I CAN ITS TIME FOR ME TO GIVE AND ITS TIME FOR THEM TO RECEIVE MY YULETIDE SLEIGH RIDE BEGINS HERE"))
