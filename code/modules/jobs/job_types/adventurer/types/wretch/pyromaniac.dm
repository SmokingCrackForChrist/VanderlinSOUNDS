/datum/attribute_holder/sheet/job/pyromaniac
	raw_attribute_list = list(
		STAT_ENDURANCE = 2,
		STAT_STRENGTH = 1,
		STAT_CONSTITUTION = 3,
		STAT_INTELLIGENCE = 3,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/bows = 30,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/craft/traps = 40,
		/datum/attribute/skill/craft/alchemy = 40,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/craft/engineering = 30,
		/datum/attribute/skill/labor/farming = 10,
		/datum/attribute/skill/craft/bombs = 40,
	)

/datum/job/advclass/wretch/pyromaniac
	title = "Pyromaniac"
	tutorial = "You have been baptized twice - once in water, once in flame. In your rage and hubris, you wield your own personal vendetta against the chaotic forces within Faience - wrath comes for them. Your body is fuel, and your fingers wicks. There is power in pain!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/wretch/pyromaniac
	total_positions = 2
	cmode_music = 'sound/music/cmode/antag/CombatPyromaniac.ogg'

	attribute_sheet = /datum/attribute_holder/sheet/job/pyromaniac

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_FORAGER,
		TRAIT_BEAUTIFUL,
		TRAIT_NOPAINSTUN
	)

	spells = list(
		/datum/action/cooldown/spell/enchantment/singingblade,
		/datum/action/cooldown/spell/undirected/joy
	)

/datum/job/advclass/wretch/pyromaniac/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/static/list/selectableweapon = list(
		"Burning Spear" = /obj/item/weapon/polearm/spear/pyromanicspear,
		"Crossbow" = /obj/item/gun/ballistic/bow/cross,
		"Bow" = /obj/item/gun/ballistic/bow/cross,
	)
	var/weaponschoice = spawned.select_equippable(player_client, selectableweapon, message = "Choose Your Weapon of choice", title = "PYROMANIAC")
	if(!weaponschoice)
		return

	switch(weaponschoice)
		if("Burning Spear")
			to_chat(spawned, span_info("The flame that burns bright lasts half as long."))
		if("Crossbow")
			var/obj/item/ammo_holder/quiver/bolts/pyro/P = new(get_turf(spawned))
			spawned.equip_to_appropriate_slot(P)
			to_chat(spawned, span_info("You are able to make more crossbow ammunition with iron, blast powder and some planks."))
		if("Bow")
			var/obj/item/ammo_holder/quiver/arrows/pyro/P = new(get_turf(spawned))
			spawned.equip_to_appropriate_slot(P)
			to_chat(spawned, span_info("You are able to make more bow ammunition with iron, blast powder and some planks."))

/datum/outfit/wretch/pyromaniac
	name = "Pyromaniac (Wretch)"
	head = /obj/item/clothing/head/roguehood/colored/red/pyromaniac
	mask = /obj/item/clothing/face/facemask/pyromaniac
	neck = /obj/item/clothing/neck/chaincoif/iron
	pants = /obj/item/clothing/pants/trou/leather/pyromaniac
	armor = /obj/item/clothing/armor/leather/splint/pyromaniac
	shirt = /obj/item/clothing/armor/gambeson/heavy/pyromaniac
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black
	gloves = /obj/item/clothing/gloves/leather/pyromaniac
	shoes = /obj/item/clothing/shoes/boots/armor
	r_hand = /obj/item/explosive/bottle
	l_hand = /obj/item/explosive/bottle
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored
	mouth = /obj/item/clothing/face/cigarette/rollie/nicotine/zigar
	backpack_contents = list(
		/obj/item/explosive/bottle = 2,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/rope/chain = 1,
		/obj/item/flint = 1,
		/obj/item/storage/fancy/cigarettes/tinzig = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)
