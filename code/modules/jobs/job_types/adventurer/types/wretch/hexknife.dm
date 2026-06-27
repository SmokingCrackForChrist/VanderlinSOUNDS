/datum/attribute_holder/sheet/job/hexknife
	raw_attribute_list = list(
		STAT_PERCEPTION = 3,
		STAT_INTELLIGENCE = 2,
		STAT_SPEED = 1,
		STAT_FORTUNE = 2,
		/datum/attribute/skill/misc/swimming = 40,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/misc/sewing = 40,
		/datum/attribute/skill/misc/medicine = 20,
		/datum/attribute/skill/misc/lockpicking = 20,
		/datum/attribute/skill/combat/firearms = 40,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/magic/holy = 10,
	)

/datum/job/advclass/wretch/hexknife
	title = "Hex Knife"
	tutorial = "I had a dream last night. I was cold and wet. I felt heavy, like I'd been drugged. And when I woke up, the sensations didn't go. I was feeling sick and confused and I was starting to get scared. I needed to see mum, to talk to her. I stumbled to her room and as I stood there at the bed watching them, I was overcome with this intense sadness. Then the sadness turned to fear. I just stood there paralyzed with fear and I realized that there was nothing that they could do for me anymore. I've never felt so utterly alone. Everything felt wrong-my body, the way things looked. Then I realized that there was something wrong with me. I started to cry standing there at the foot of their bed."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/wretch/hexknife
	total_positions = 10
	roll_chance = 100
	cmode_music = 'sound/music/cmode/antag/CombatBeest.ogg'

	attribute_sheet = /datum/attribute_holder/sheet/job/hexknife

	traits = list(
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_STEELHEARTED,
		TRAIT_DODGEEXPERT
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/trespasser
	)

/datum/outfit/wretch/hexknife
	name = "Hex Knife(Wretch)"
	neck = /obj/item/clothing/neck/highcollier/iron/renegadecollar
	mask = /obj/item/clothing/face/spectacles/inqglasses
	pants = /obj/item/clothing/pants/trou/leather
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/dark
	head = /obj/item/clothing/head/leather/inqhat/vigilante
	armor = /obj/item/clothing/armor/leather/jacket/leathercoat/colored/wretchrenegade
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/knifebelt/black/iron
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
