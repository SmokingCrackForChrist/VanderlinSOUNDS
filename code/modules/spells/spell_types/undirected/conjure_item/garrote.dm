/datum/action/cooldown/spell/undirected/conjure_item/garrote
	name = "The Garrote."
	desc = "Can't seem to get rid of it, can you?"
	button_icon_state = "call_to_arms"
	sound = 'sound/magic/summonwhistle.ogg'


	cooldown_time = 2 MINUTES
	invocation_type = INVOCATION_NONE
	associated_skill = /datum/skill/combat/unarmed
	item_type = /obj/item/inqarticles/garrote
	item_duration = null
	item_outline ="#0e5c21"
	delete_old = TRUE
	spell_type = SPELL_STAMINA
	spell_cost = 30
