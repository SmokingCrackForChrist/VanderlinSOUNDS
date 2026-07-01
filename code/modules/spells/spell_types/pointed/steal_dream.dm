
/datum/action/cooldown/spell/stealdream
	name = "ABSOLVE"
	spell_flags = SPELL_STAMINA
	spell_cost = 1
	charge_time = 1
	cast_range = 1
	sound = 'sound/magic/psyabsolution.ogg'
	invocation_type = INVOCATION_NONE
	cooldown_time = 2 SECONDS // 60 seconds cooldown
	button_icon_state = "ABSOLVE"

/datum/action/cooldown/spell/stealdream/cast(mob/living/carbon/human/H)
	. = ..()
	var/mob/living/user = owner
	if(!H.mind)
		to_chat(user, span_warning("They have no thoughts in which to form dreams. Useless for the moment."))
		return FALSE // mind check? doublecheck this
	if(!iscarbon(H)) //ishuman maybe?
		to_chat(user, span_warning("Only those that think can make me real."))
		return TRUE

	if(H.stat >= UNCONSCIOUS) // Sleep check.
		to_chat(user, span_warning("They're not dreaming yet. They have to be asleep."))
		return TRUE

	if(H == user) // Nice job targeting yourself dumb-dumb.
		to_chat(user, span_warning("What's the point in stealing my own dreams, stupid?"))
		return TRUE

	if(H == TRAIT_DREAMSTOLEN) // If they've been targeted before, they cannot be targeted again.
		to_chat(user, span_warning("[H] already sees me in their dreams.")) // note to self do i gotta turn all these fuckin returns off?
		return TRUE

	// Special case for dead targets
	if(H.stat >= UNCONSCIOUS)
		if(H.stat >= UNCONSCIOUS) // &&?
			//if(!H.mind)
			//to_chat(user, span_warning("The mind of [H] is not there."))
			//	return FALSE
			to_chat(user, span_warning("You attempt to eat the dreams of [H]!"))
			// Dramatic effect
			user.visible_message(span_danger("[user] grabs [H] by the forehead, gripping it tight!"))
			var/static/list/messages = list(
				"<span class='boldwarning'>THIS ISN'T A DREAM. THIS ISN'T A DREAM I HAVE TO WAKE UP NOW!</span>",
				"<span class='boldwarning'>GONNA DIE. GONNA DIE. GONNA DIE.</span>",
				"<span class='boldwarning'>I TASTE BLOOD. AM I DYING? IS THIS WHAT IT FEELS LIKE TO DIE?</span>",
				"<span class='boldwarning'>WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP </span>",
			)
				//return FALSE
			H.add_nausea(rand(15,20))
			//H.apply_status_effect(/datum/status_effect/buff/psyvived)
			H.emote("whimper")
			H.adjust_jitter(100 SECONDS)
			ADD_TRAIT(H, TRAIT_DREAMSTOLEN, TRAIT_GENERIC)
			H.visible_message(span_notice("[H] has awoken into an eternal nightmare."), span_hypnophrase("I had a dream last night. I was cold and wet. I felt heavy, like I'd been drugged. And when I woke up, the sensations didn't go. I was feeling sick and confused and I was starting to get scared. I needed to see my mother, to talk to her. I stumbled to her room and as I stood there at the bed watching them, I was overcome with this intense sadness. Then the sadness turned to fear. I just stood there paralyzed with fear and I realized that there was nothing that she could do for me anymore. I've never felt so utterly alone. Everything felt wrong-my body, the way things looked. Then I realized that there was something wrong with me. I started to cry standing there at the foot of her bed."))
			return TRUE
		else
			to_chat(user, span_warning("[H] is missing vital organs and cannot be revived!"))
			return FALSE


	// Visual effects

	new /obj/effect/temp_visual/curse(get_turf(user), "#0a43dd")
	new /obj/effect/temp_visual/curse(get_turf(user), "#0a43dd")
	new /obj/effect/temp_visual/curse(get_turf(user), "#0a43dd")

	return TRUE
