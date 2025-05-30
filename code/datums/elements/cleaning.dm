/datum/element/cleaning/Attach(datum/target)
	. = ..()
	if(!ismovableatom(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(Clean))

/datum/element/cleaning/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)

/datum/element/cleaning/proc/Clean(datum/source)
	var/atom/movable/AM = source
	var/turf/tile = AM.loc
	if(!isturf(tile))
		return

	SEND_SIGNAL(tile, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
	for(var/A in tile)
		if(is_cleanable(A))
			qdel(A)
		else if(istype(A, /obj/item))
			var/obj/item/I = A
			SEND_SIGNAL(I, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
			if(ismob(I.loc))
				var/mob/M = I.loc
				M.regenerate_icons()
		else if(ishuman(A))
			var/mob/living/carbon/human/cleaned_human = A
			if(cleaned_human.body_position == LYING_DOWN)
				if(cleaned_human.head)
					SEND_SIGNAL(cleaned_human.head, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
				if(cleaned_human.wear_armor)
					SEND_SIGNAL(cleaned_human.wear_armor, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
				else if(cleaned_human.wear_pants)
					SEND_SIGNAL(cleaned_human.wear_pants, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
				if(cleaned_human.shoes)
					SEND_SIGNAL(cleaned_human.shoes, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
				SEND_SIGNAL(cleaned_human, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_TYPE_BLOOD)
				cleaned_human.regenerate_icons()
				to_chat(cleaned_human, "<span class='danger'>[AM] cleans your face!</span>")
