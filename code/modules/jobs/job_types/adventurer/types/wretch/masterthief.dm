/datum/job/advclass/wretch/masterthief
	title = "Master Thief"
	tutorial = "Unlike your brethren, you're not an outright killer - murder is the mark of an amateur. No, you're something greater than a cutthroat, and that puts you above them. \
	You're what keeps the nobles up at night, what keeps the watch second-guessing if you're in that alley - some people in this world are too rich for their own good, \
	lucky they have you to lend them a hand."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/wretch/masterthief
	total_positions = 10
	cmode_music = 'sound/music/cmode/adventurer/CombatRogue.ogg'

	skills = list(
		/datum/skill/combat/axesmaces = SKILL_LEVEL_JOURNEYMAN, // Needed just for NPC's.
		/datum/skill/misc/swimming = SKILL_LEVEL_MASTER,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT, // They're not meant to kill. Unarmed/Wrestling is annoying, but they're on their own, and they dodge. If it sucks we can always change it.
		/datum/skill/misc/climbing = SKILL_LEVEL_MASTER,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/stealing = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_MASTER,
		/datum/skill/misc/sewing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/bombs = SKILL_LEVEL_JOURNEYMAN // To craft Smoke Bombs.
	)

	traits = list(
		TRAIT_DEADNOSE,
		TRAIT_THIEVESGUILD,
		TRAIT_DODGEEXPERT,
		TRAIT_LIGHT_STEP,
		TRAIT_BLACKBAGGER
	)

	jobstats = list(
		STATKEY_SPD = 3,
		STATKEY_CON = -1,
		STATKEY_STR = 3 // For wrestling, mainly.
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/conjure_item/garrote,
		/datum/action/cooldown/spell/undirected/conjure_item/smoke_bomb,
		/datum/action/cooldown/spell/undirected/shadow_step // Slippery bastard.
	)

/datum/outfit/wretch/masterthief/pre_equip(mob/living/carbon/human/H)
	..()
	H.set_patron(/datum/patron/inhumen/matthios) //It's a toss-up between Xylix or Matthios. Matthios fits more here.
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/black
	mask = /obj/item/clothing/face/sack
	shoes = /obj/item/clothing/shoes/boots/leather
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	backr = /obj/item/storage/backpack/satchel
	pants = /obj/item/clothing/pants/trou/leather
	gloves = /obj/item/clothing/gloves/fingerless
	armor = /obj/item/clothing/armor/leather/splint
	neck = /obj/item/clothing/neck/coif
	belt = /obj/item/storage/belt/leather/black
	beltl = /obj/item/weapon/mace/cudgel
	backpack_contents = list(
		/obj/item/lockpick = 1,
		/obj/item/grapplinghook = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)
	wretch_select_bounty(H)

/datum/outfit/wretch/masterthief/post_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()

	if(alert("Do you wish for a random title? You will not receive one if you click No.", "", "Yes", "No") == "Yes")
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/title
		var/list/titles = list("The Keeper", "The Phantom", "The Crow", "The Raven", "The Magpie", "The Courier", "The Mask", "The Shadow", "The Ghost", "The Fence", "The Intruder", "The Infiltrator", "The Filcher", "The Grifter", "He Who Walks", "The Invisible", "The Watcher", "The Master Thief", "The Dark Project", "The Lurker", "Prince of Shadows", "The Night Watch", "The Antiquarian", "Acquisitions Expert", "Cleptologist", "The Specialist", "The Stalker", "Of Deadly Shadows", "The Trickster", "The Respectable Citizen", "The Locksmith", "The Acquirer", "The Collector", "The Skeleton Key", "The Art Critic", "Recovery Specialist" ) //Dude, Trust.
		title = pick(titles)
		H.real_name = "[prev_real_name], [title]"
		H.name = "[prev_name], [title]"

