/datum/action/cooldown/spell/aoe/agamemnon
	name = "aemmngnAo eCoptrurant?"
	desc = "nemnAmgoa Crenartoptu? mgAenmona ptrroaunteC... goemmnaAn teCnaprtrou! annmoAmeg rtauprentoC..."
	button_icon_state = "necra"
	sound = 'sound/magic/churn.ogg'
	charge_sound = 'sound/magic/holycharging.ogg'

	spell_type = SPELL_STAMINA
	invocation_type = INVOCATION_NONE

	click_to_activate = FALSE
	charge_required = FALSE
	cooldown_time = 2 SECONDS // set to 180 seconds, not meant to be used in fights
	spell_cost = 1

	aoe_radius = 7

/datum/action/cooldown/spell/aoe/agamemnon/feedback(had_targets)
	if(!had_targets)
		to_chat(owner, span_notice("I detect no minds to peer into.."))
		return
	owner.visible_message(
		span_warning("You sense that [owner]'s eyes are locked directly with yours."),
		span_notice("I reach into their mind, and begin to scramble their memories."),
	)

/datum/action/cooldown/spell/aoe/agamemnon/is_valid_target(atom/cast_on)
	return isliving(cast_on)

/datum/action/cooldown/spell/aoe/agamemnon/cast_on_thing_in_aoe(mob/living/victim, atom/caster)
	if(victim.stat == DEAD)
		return

	if(victim == caster)
		return

	if(victim.stat >= CONSCIOUS)
		victim.apply_status_effect(/datum/status_effect/debuff/agamemnon)
		//victim.apply_status_effect(/datum/status_effect/debuff/agamemnon, null, owner, clamp(round(GET_MOB_SKILL_VALUE_OLD(owner, associated_skill)), 1 , 3))
		victim.add_quirk(/datum/quirk/vice/dwnightmares)

/atom/movable/screen/alert/status_effect/debuff/agamemnon
	name = "gAnoamnem onCurtaerpt?"
	desc = "aaaAGGGGHHH!!!! AAAAAAAA<b>AAAGGGGHHHH!!!!</b> Oh, <b>GODS!</b> It feels like someone's driven a dirk up my nostril!"
	icon_state = "stressvb"

// This should be stacking
/datum/status_effect/debuff/agamemnon
	id = "emagnomnA traporuetCn?"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/agamemnon
	duration = 30 SECONDS
	examine_text = "<b>SUBJECTPRONOUN is bleeding from their nose!</b>"
	effectedstats = list(STAT_STRENGTH = -1, STAT_CONSTITUTION = -1, STAT_ENDURANCE = -1, STAT_SPEED = -1)
	status_type = STATUS_EFFECT_REFRESH
	tick_interval = 10 DECISECONDS
	var/datum/weakref/debuffer
	var/base_tick = 0.2
	var/intensity = 1
	var/range = 10

/datum/status_effect/debuff/agamemnon/on_creation(mob/living/new_owner, duration_override, mob/living/caster, potency)
	intensity = potency
	if(caster)
		debuffer = WEAKREF(caster)
	return ..()

/datum/status_effect/debuff/agamemnon/on_apply()
	. = ..()
	to_chat(owner, span_warning("I feel something reach over me and push their hand through my head! <b>STANDING HERE MAKES IT WORSE!</B>"))

/datum/status_effect/debuff/agamemnon/on_remove()
	. = ..()
	to_chat(owner, span_notice("The splitting headache has subsided."))

/datum/status_effect/debuff/agamemnon/refresh(mob/living/new_owner, duration_override, ...)
	. = ..()
	intensity += 1
	to_chat(owner, span_boldwarning("aaaggghhh!!! aa</b>AAAGGGHHH!!!</b> GET ME <B>OUT</B> OF HERE!"))

/datum/status_effect/debuff/agamemnon/tick()
	if(!owner)
		return

	if(prob(10))
		to_chat(owner, span_warning("<b>IT'S EVERYTHING, IT'S EVERYWHERE, ALL AT ONCE!!!</b>"))
		owner.emote("scream")

	if(!debuffer)
		return

	var/mob/living/our_debuffer = debuffer.resolve()
	if(get_dist(our_debuffer, owner) > range)
		qdel(src)


/datum/quirk/vice/dwnightmares
	name = "Dream Demon" // THIS NEEDS TO BE A STATUS EFFECT. TODO DREAMWEAVER. FIX THIS SHIT!!!
	desc = "There are eyes in the walls. I taste the ceiling and my body is falling through the floor into a whirling hall of knives."
	point_value = 1
	var/next_scream = 0

/datum/quirk/vice/dwnightmares/on_spawn()
	if(!owner)
		return
	START_PROCESSING(SSobj, src)

/datum/quirk/vice/dwnightmares/process()
	if(!owner)
		return

	if(owner.stat == UNCONSCIOUS && owner.IsSleeping())
		if(world.time >= next_scream)
			next_scream = world.time + rand(30 SECONDS, 60 SECONDS)
			owner.emote("scream", forced = TRUE)
			owner.adjustBruteLoss(rand(5, 10), damage_type = BCLASS_BLUNT) // 5-10 damage, you're not going to outheal wounds without being on a bed.
			if(prob(5))
				owner.remove_quirk(/datum/quirk/vice/dwnightmares)
				to_chat(owner, span_warning("<b>It's gone. Noc has exorcised the demon. I can sleep in peace once more.</b>"))

/datum/quirk/vice/dwnightmares/on_remove()
	STOP_PROCESSING(SSobj, src)



// NOTE TO SELF. This processes as a VICE. turn it into a debuff, it's fucky and will break shit
