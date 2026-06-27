/datum/action/cooldown/spell/undirected/trespasser
	name = "Trespass"
	desc = "Interlope through a transparent object."
	button_icon_state = "jaunt"
	sound = 'sound/magic/turntoflies2.ogg'

	cooldown_time = 2 SECONDS
	has_visual_effects = FALSE
	spell_cost = 1
	spell_type = SPELL_STAMINA
	charge_required = FALSE

/datum/action/cooldown/spell/undirected/trespasser/cast(atom/cast_on)
    . = ..()
    var/mob/living/livinguser = usr
    var/turf/blink_loc = get_turf(livinguser)
    blink_loc = get_step(blink_loc, livinguser.dir)
    blink_loc = get_step(blink_loc, livinguser.dir)

    if(blink_loc in view(7,livinguser)) // Two options for this spell. This is if you can't teleport into something you can't see.
    //if(blink_loc) // This one if you don't care if you can't see a tile. Big issues if you teleport off the map.
        livinguser.forceMove(blink_loc)
        if(blink_loc.density==TRUE) // If you teleport into a tile, you explode.
            livinguser.gib()
        var/datum/effect_system/spark_spread/S = new()
        S.set_up(5, 1, blink_loc)
        S.start()
    return
