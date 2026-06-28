/datum/patron/psydon
	name = "Psydon"
	display_name = "Orthodox Psydonite"
	domain = "God of Humenity, Dreams and Creation"
	desc = "Deceased, slain by Necra in His final moments. She ripped His body apart to create The Ten... we must put Him back together again. Psydon lives on, He will return."
	flaws = "Grudge-Holding, Judgemental, Self-Sacrificing"
	worshippers = "Grenzelhoftians, Inquisitors, Heroes"
	sins = "Apostasy, Demon Worship, Betraying thy Father"
	boons = "None. His power is divided."

	associated_faith = /datum/faith/psydon

	confess_lines = list(
		"THERE IS ONLY ONE TRUE GOD!",
		"THE SUCCESSORS HALT HIS RETURN!",
		"PSYDON WILL RETURN!",
	)

/datum/patron/psydon/can_pray(mob/living/carbon/human/follower)
	//We just kind of assume the follower is a human here
	if(
		istype(follower.wear_wrists, /obj/item/clothing/neck/psycross) || istype(follower.wear_neck, /obj/item/clothing/neck/psycross) || istype(follower.get_active_held_item(), /obj/item/clothing/neck/psycross)
		)
		return TRUE

	to_chat(follower, span_danger("I can not talk to Him... I need His cross!"))
	return FALSE

/datum/patron/psydon/extremist
	display_name = "Extremist Psydonite"
	desc = "The Ten are conmen, false prophets, and heathens. The acts of the Tennite church are all tricks to beguile the mind and dissuade you from following the true path of Psydon. My actions prove my faith and His strength. Psydon lives, and you cannot convince me otherwise."
	flaws = "Stubborn, Fanatical, Spiteful"
	worshippers = "Fanatics, Misinformed Fools"
	sins = "Blasphemy, False Prophets, Trickery"
	confess_lines = list(
		"THERE IS ONLY ONE GOD!",
		"YOUR FALSE TEN ARE LIES!",
		"PSYDON LIVES!",
	)

/datum/patron/psydon/quaker
	display_name = "Quaker Psydonite"
	desc = "The Ten are false prophets and my God is dead, but he lives on through his Spirit. And only through the inner light granted to us of contemplation through his word, may we seek to improve this realm."
	flaws = "Enforcement of the categorical imperative, and true belief in your maxim with no room for error."
	worshippers = "Richard Nixon for some fucking reason"
	sins = "Violence, Cruelty, Working on Sunday"
	boons = "Bitchin' Oatmeal."
	added_traits = list(TRAIT_PACIFISM)
	confess_lines = list(
		"I FORGIVE YOU!",
		"PSYDON LOVES YOU!",
		"BLASPHEMY AGAINST THE SPIRIT (OF PSYDON!)",
	)


