/datum/antagonist/jinglesack
	name = "Jinglesack"
	roundend_category = "Jinglesack"
	antagpanel_category = "Jinglesack"
	job_rank = ROLE_JINGLESACK
	antag_hud_name = "Jinglesack"
	confess_lines = list(
		"MY YULETIDE SLAYRIDE WILL NOT END!",
		"NAUGHTY! NAUGHTY! NAUGHTY!",
		"NOBODY CAN DENY MY GIFTS!",
	)

/datum/antagonist/jinglesack/on_gain()
	. = ..()
	if(owner?.current)
		equip_jinglesack()

/datum/antagonist/jinglesack/proc/equip_jinglesack()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return

	H.unequip_everything()
	H.equipOutfit(/datum/outfit/jinglesack)
	H.cmode_music = 'sound/music/cmode/nobility/CombatJester2.ogg'
