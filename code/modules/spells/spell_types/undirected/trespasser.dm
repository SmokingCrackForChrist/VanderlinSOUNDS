/datum/action/cooldown/spell/undirected/trespasser
	name = "Teleport forward two tiles"
	desc = "Teleports you two tiles forward"
	button_icon_state = "jaunt"
	sound = 'sound/magic/ethereal_enter.ogg'

	cooldown_time = 2 SECONDS
	has_visual_effects = FALSE
	spell_cost = 1
	spell_type = SPELL_STAMINA
	charge_required = FALSE

/datum/action/cooldown/spell/undirected/trespasser/cast(atom/cast_on)
    . = ..()

    var/turf/castonturf = get_turf(cast_on)
    owner.forceMove(castonturf)
    //if(castonturf.density==TRUE)
    //    owner.gib()

    return
