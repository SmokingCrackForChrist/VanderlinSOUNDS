/datum/attribute_holder/sheet/job/hexknife
	raw_attribute_list = list(
		STAT_SPEED = 1,
		STAT_INTELLIGENCE = -1,
		STAT_ENDURANCE = -1,
		STAT_FORTUNE = -1,
		STAT_STRENGTH = -1,
		/datum/attribute/skill/misc/swimming = 40,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/reading = 60,
		/datum/attribute/skill/misc/sneaking = 30,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/misc/sewing = 40,
		/datum/attribute/skill/misc/medicine = 40,
		/datum/attribute/skill/misc/lockpicking = 50,
		/datum/attribute/skill/combat/knives = 30,
	)

// INSPIRATIONS: Perfect Blue, ToME4 Solipsist Class, Hotline Miami, Killer7, Second Sight, The Hat Man.
// Go buy Collect Call when it comes out I've been waiting for 1-900-cult for like nine fucking years man

// TODO: AOE spell that inflicts a temporary nightmares debuff
// Get Blink spell fixed
// Balance Trespassers cost and cooldown, give it some additional flaire if possible
// Make sure numbers on the spells are correct
// Make sure stats are correct

/datum/job/advclass/wretch/hexknife
	title = "Dreamweaver"
	tutorial = "I was a natural at what I did. Noc blessed me, truly - my time at the Wizard's college of Kingsfield had been short, but I had learned more in two \
	than many do within twenty years of their lives. But I had no life. All of my time was spent toiling within the arcana. And it is here, flying higher and higher to Noc's \
	greatness of learning the lauded tomes of Hypnomancy that I realize my better self was within the minds of my peers. My scholars. My tutors... When I look in a mirror, \
	I do not see me, I see the idea of me. The REAL ME is the reflection in the mirror. I MUST MAKE ME REAL."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/wretch/hexknife
	total_positions = 1
	roll_chance = 100
	cmode_music = 'sound/music/cmode/adventurer/CombatDream2.ogg'

	attribute_sheet = /datum/attribute_holder/sheet/job/hexknife

	traits = list(
		TRAIT_DREAMPARANOIAAGENT,
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_NO_REFLECTION,
		TRAIT_KEENEARS,
		TRAIT_KEENEYES,
		TRAIT_SILENT_FOOTSTEPS,
		TRAIT_STEELHEARTED
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/trespasser,
		/datum/action/cooldown/spell/undirected/sleepwalk,
		/datum/action/cooldown/spell/stealdream,
		/datum/action/cooldown/spell/status/phantasm,
		/datum/action/cooldown/spell/aoe/agamemnon
	)

	honoraries = list(
		"the Dreamweaver" = HONORARY_SUFFIX,
		"the Sleepwalker" = HONORARY_SUFFIX,
		"the Sandman" = HONORARY_SUFFIX,
		"the Dreamcatcher" = HONORARY_SUFFIX,
		"the Dreameater" = HONORARY_SUFFIX,
		"the Hat Man" = HONORARY_SUFFIX,
		"the Idea" = HONORARY_SUFFIX,
		"the Shape" = HONORARY_SUFFIX,
		"the Solipsist" = HONORARY_SUFFIX,
		"The Real" = HONORARY_PREFIX,
		"The Fake" = HONORARY_PREFIX,
		"the Hatmaker" = HONORARY_PREFIX,
		"the Idealist" = HONORARY_SUFFIX,
	)

/datum/outfit/wretch/hexknife
	name = "Dreamweaver (Wretch)"
	mask = /obj/item/clothing/face/spectacles/sglasses
	pants = /obj/item/clothing/pants/trou/leather
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/dark
	head = /obj/item/clothing/head/hexknifehat
	armor = /obj/item/clothing/armor/regenerating/skin/easttats/hexknife
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black
	beltl = /obj/item/weapon/knife/dagger/navaja/hexknife
	neck = /obj/item/storage/belt/pouch/coins/rich
	gloves = /obj/item/clothing/gloves/leather
	shoes = /obj/item/clothing/shoes/nobleboot
	wrists = /obj/item/clothing/wrists/bracers/leather
	backpack_contents = list(
		/obj/item/lockpick = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/storage/fancy/cigarettes/zig = 1,
		/obj/item/flint = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)
// This would be Thermal Vision if it had worked.
/datum/job/advclass/wretch/hexknife/on_roundstart(mob/living/carbon/human/spawned, mob/living/carbon/human/H, client/player_client)
	. = ..()
	var/obj/item/organ/eyes/eyes = spawned.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(spawned,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(spawned)

/datum/job/advclass/wretch/hexknife/after_spawn(mob/living/carbon/human/spawned, mob/living/carbon/human/H, client/player_client)
	. = ..()
	spawned.set_patron(/datum/patron/divine/noc, TRUE)

	to_chat(spawned, span_notice("<span class='boldwarning'>The limits of Noc no longer concern you. You have seen what people dream of. You will never make peace with this. </span> \
	Like a rat in a cage you've reduced yourself to gnawing through the man affixed to the metal. \
	<span class='redtext'>You must burn a fingerprint on the psyche of the living.</span> \
	<span class='hypnophrase'>STEALING the DREAMS of a target while they are ASLEEP is the only way to LIVE FOREVER.</span> \
	Inside the thoughts of other people there's a perfect image of you. You need to find it. \
	<span class='smallnotice'>GIVE YOUR TRUE IDENTITY FORM.</span> \
	<span class='redtext'>Men die at the hands of cowards. Ideas remain eternal.</span> "))
	playsound(spawned, 'sound/music/dreamweaverintro.ogg', 80, FALSE)
