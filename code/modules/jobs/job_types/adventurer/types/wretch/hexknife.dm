/datum/attribute_holder/sheet/job/hexknife
	raw_attribute_list = list(
		STAT_PERCEPTION = 2,
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 1,
		STAT_FORTUNE = 1,
		/datum/attribute/skill/misc/swimming = 40,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/misc/sewing = 40,
		/datum/attribute/skill/misc/medicine = 50,
		/datum/attribute/skill/misc/lockpicking = 50,
		/datum/attribute/skill/combat/knives = 30,
	)
// GOAL: Harvest Lux. Infest Dreams. Become an idea. The Dreamweaver is a stealth-focused antagonist who breaks into places and torments the peasantry's residence.
// He has average combat-stats and a permanent inability to equip armor, but an annoying kit and night-vision to compensate for his shortcomings.
// Effectively a Rogue without the ability to dodge. Map awareness and clinging to darkness is how he survives - and accomplishes - his goals.
// Also effectively a slasher villan. His powers are VERY good for freaking people the fuck out in roleplay, along with giving a mechanical reason
// to stalk people and steal their lux.

// Once a mage, he became aware of the fragility of humen life by peering into the dreams of his peers. Now, he seeks to live on forever as an idea.
// And the only effective means to do this, are to leave such a lasting imprint in the psyche of others, that even their next of kin will hear his tale.

// NOTEWORTHY FEATURES
// Hex Knife - A navaja with the vampric enchantment, keeping him a threat despite the low combat stats.
// Night-Vision Eyes - He can see in the dark. Keeping an area lit is a major counter.
// Trespasser - A blink that allows the user to teleport through one open tile. Grates, gates, windows, windoors, so on. He can teleport directly into a door if you're
// spaced properly, but I consider this a feature.
// Attempting to teleport into a wall will result in the Dreamweaver's gibbing. This is incredibly unbalanced but it's both funny and what has been coded for it.
// I didn't code this so the dial's on 'fuck you and die' for now. lol. Thanks Cannibal!
// His leather coat is regenerating and unable to be taken off, giving him a limited choice for protection.


// NUMBER ONE PRIORITIES
// An ability that sacrifices Lux for a random, permanent boon to a stat.

// TODO: AOE spell that inflicts a temporary nightmares debuff.
// Targeted debuff that gives a low amount of stress. Flavortext about "That's the one I keep seeing in my dreams!" Could give them an audio cue of receiving it aswell
// A weaker version of shadow-step that makes him somewhat corporeal, very handy for trying to slink around the keep, but not a bullshit 'i'm going to duck around the corner
// and immediately break chase' ability. He already has one of those if you get lucky with a door/window.
// INCREDIBLY IMPORTANT TO NOT MAKE HIM STRONG IN COMBAT DUE TO THIS.
// Balance Trespassers cost and cooldown, give it some additional flaire if possible


// POSSIBLY: An ability that requires a material cost to do, which makes someone sleepy prematurely. It needs to be a heavy enough cost to not abuse.


// MAYBE: Butcher the Maniac code and have a rarer one that puts transparent eyes on the user's screen.
// Butcher the theme_song feature to play some droning noise.

/datum/job/advclass/wretch/hexknife
	title = "Dreamweaver"
	tutorial = "I had a dream last night. I was cold and wet. I felt heavy, like I'd been drugged. And when I woke up, the sensations didn't go. \
	I was feeling sick and confused and I was starting to get scared. I needed to see mum, to talk to her. I stumbled to her room and as I stood there at \
	the bed watching them, I was overcome with this intense sadness. Then the sadness turned to fear. I just stood there paralyzed with fear and I realized \
	that there was nothing that they could do for me anymore. I've never felt so utterly alone. Everything felt wrong-my body, the way things looked. Then I \
	realized that there was something wrong with me. I started to cry standing there at the foot of their bed."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/wretch/hexknife
	total_positions = 100
	roll_chance = 100
	cmode_music = 'sound/music/cmode/adventurer/CombatDream.ogg'

	attribute_sheet = /datum/attribute_holder/sheet/job/hexknife

	traits = list(
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_NO_REFLECTION,
		TRAIT_KEENEARS,
		TRAIT_KEENEYES,
		TRAIT_STEELHEARTED
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/trespasser,
		/datum/action/cooldown/spell/undirected/shadow_step,
		/datum/action/cooldown/spell/status/phantasm
	)

// make a second version of invisibility / shadow step that just makes you somewhat transparent.
// give him eyes that have some night vision.
// do NOT give him very strong combat skills/stats.

/datum/outfit/wretch/hexknife
	name = "Dreamweaver (Wretch)"
	mask = /obj/item/clothing/face/spectacles/sglasses
	pants = /obj/item/clothing/pants/trou/leather
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/dark
	head = /obj/item/clothing/head/hexknifehat
	armor = /obj/item/clothing/armor/regenerating/skin/easttats/hexknife
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/storage/backpack/satchel/surgbag
	belt = /obj/item/storage/belt/leather/black
	beltr = /obj/item/weapon/knife/dagger/navaja/hexknife
	gloves = /obj/item/clothing/gloves/leather/advanced
	shoes = /obj/item/clothing/shoes/nobleboot
	wrists = /obj/item/clothing/wrists/bracers/leather/advanced
	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/storage/fancy/cigarettes/zig = 1,
		/obj/item/flint = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)

/datum/job/advclass/wretch/hexknife/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
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
	<span class='hypnophrase'>INFESTING a target while they are ASLEEP is the only way to LIVE FOREVER.</span> \
	<span class='redtext'>Men die at the hands of cowards. Ideas live forever.</span> "))
	playsound(spawned, 'sound/music/dreamweaverintro.ogg', 80, FALSE)
