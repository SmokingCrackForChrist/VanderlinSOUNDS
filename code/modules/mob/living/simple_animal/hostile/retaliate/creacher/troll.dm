/mob/living/simple_animal/hostile/retaliate/troll
	icon = 'icons/roguetown/mob/monster/trolls/default_troll.dmi'
	name = "troll"
	desc = "Elven legends say these monsters were servants of Dendor tasked to guard his realm; nowadays they are sometimes found in the company of orcs."
	icon_state = "Troll"
	icon_living = "Troll"
	icon_dead = "Trolld"
	pixel_x = -16

	faction = list(FACTION_ORCS)
	footstep_type = FOOTSTEP_MOB_HEAVY
	emote_hear = null
	emote_see = null
	verb_say = "groans"
	verb_ask = "grunts"
	verb_exclaim = "roars"
	verb_yell = "roars"

	turns_per_move = 2
	see_in_dark = 10
	move_to_delay = 7
	vision_range = 6
	aggro_vision_range = 6

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 1,
						/obj/item/alch/horn = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 1,
						/obj/item/natural/hide = 2,
						/obj/item/alch/horn = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange= 2,
						/obj/item/natural/hide = 3,
						/obj/item/alch/horn = 2,
						/obj/item/natural/head/troll = 1)

	health = TROLL_HEALTH
	maxHealth = TROLL_HEALTH
	food_type = list(
					/obj/item/bodypart,
					/obj/item/organ)

	base_intents = list(/datum/intent/unarmed/claw, /datum/intent/simple/bigbite)
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	melee_damage_lower = 40
	melee_damage_upper = 60
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES

	base_constitution = 16
	base_strength = 16
	base_speed = 2
	base_endurance = 17

	retreat_distance = 0
	minimum_distance = 0
	deaggroprob = 0
	defprob = 20
	defdrain = 15
	del_on_deaggro = 99 SECONDS
	retreat_health = 0
	food_max = 250
	food = 0
	dodgetime = 50
	aggressive = TRUE
	dendor_taming_chance = DENDOR_TAME_PROB_HIGH
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/troll
	body_eater = TRUE

	ai_controller = /datum/ai_controller/troll
	AIStatus = AI_OFF
	can_have_ai = FALSE

	var/critvuln = FALSE
	var/is_hidey = FALSE

	//stone chucking ability
	var/datum/action/cooldown/mob_cooldown/stone_throw/throwing_stone

/mob/living/simple_animal/hostile/retaliate/troll/Initialize()
	. = ..()
	if(critvuln)
		ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	throwing_stone = new /datum/action/cooldown/mob_cooldown/stone_throw()
	throwing_stone.Grant(src)
	ai_controller.set_blackboard_key(BB_TARGETED_ACTION, throwing_stone)

/mob/living/simple_animal/hostile/retaliate/troll/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/troll/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/troll/aggro1.ogg','sound/vo/mobs/troll/aggro2.ogg')
		if("pain")
			return pick('sound/vo/mobs/troll/pain1.ogg','sound/vo/mobs/troll/pain2.ogg')
		if("death")
			return pick('sound/vo/mobs/troll/death.ogg')
		if("idle")
			return pick('sound/vo/mobs/troll/idle1.ogg','sound/vo/mobs/troll/idle2.ogg')
		if("cidle")
			return pick('sound/vo/mobs/troll/cidle1.ogg','sound/vo/mobs/troll/aggro2.ogg')

/mob/living/simple_animal/hostile/retaliate/troll/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/troll/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)
	if(fire_stacks + divine_fire_stacks <= 0)
		adjustHealth(-rand(20,35))

/mob/living/simple_animal/hostile/retaliate/troll/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

/obj/effect/decal/remains/troll
	name = "remains"
	gender = PLURAL
	icon_state = "Trolld"

/mob/living/simple_animal/hostile/retaliate/troll/LoseTarget()
	..()
	if(!is_hidey)
		return
	if(health > 0)
		icon_state = "Trollso"

/mob/living/simple_animal/hostile/retaliate/troll/Moved()
	. = ..()
	if(!is_hidey)
		return
	if(!icon_state == "Troll")
		icon_state = "Troll"

/mob/living/simple_animal/hostile/retaliate/troll/GiveTarget()
	..()
	if(!is_hidey)
		return
	icon_state = "Trolla"

/mob/living/simple_animal/hostile/retaliate/troll/after_creation()
	..()
	if(!is_hidey)
		return
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)

/mob/living/simple_animal/hostile/retaliate/troll/bog
	name = "bog troll"
	ai_controller = /datum/ai_controller/bog_troll
	wander = FALSE		// bog trolls are ambush predators
	turns_per_move = 4
	is_hidey = TRUE

	health = BOGTROLL_HEALTH
	maxHealth = BOGTROLL_HEALTH
	food_type = list(/obj/item/reagent_containers/food/snacks/meat,
					/obj/item/bodypart,
					/obj/item/organ)

	base_intents = list(/datum/intent/simple/headbutt, /datum/intent/simple/bigbite)
	melee_damage_lower = 30
	melee_damage_upper = 50

	base_constitution = 16
	base_strength = 16
	base_speed = 3
	base_endurance = 15

	defprob = 30
	defdrain = 13

/mob/living/simple_animal/hostile/retaliate/troll/cave
	name = "cave troll"
	desc = "Dwarven tales of giants and trolls often contain these creatures, horrifying amalgamations of flesh and crystal who have long since abandoned Malum's ways."
	icon = 'icons/roguetown/mob/monster/trolls/cave_troll.dmi'
	ai_controller = /datum/ai_controller/troll/cave

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 1,
						/obj/item/alch/horn = 1,
						/obj/item/natural/rock/mana_crystal = 1,
						)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 1,
						/obj/item/natural/hide = 2,
						/obj/item/alch/horn = 2,
						/obj/item/natural/rock/mana_crystal = 2,
						)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange= 2,
						/obj/item/natural/hide = 3,
						/obj/item/alch/horn = 2,
						/obj/item/natural/head/troll/cave = 1,
						/obj/item/natural/rock/mana_crystal = 3,
						)

	health = CAVETROLL_HEALTH
	maxHealth = CAVETROLL_HEALTH
	defprob = 35
	defdrain = 15
	dendor_taming_chance = DENDOR_TAME_PROB_LOW

/mob/living/simple_animal/hostile/retaliate/troll/cave/ambush
	is_hidey = TRUE
	ai_controller = /datum/ai_controller/troll/ambush
	wander = FALSE

// You know I had to. Hostile, killer cabbit. Strong. Fast. But not as durable.
// The most foul, cruel and bad tempered feline-rodent you ever set eyes on.
/mob/living/simple_animal/hostile/retaliate/troll/caerbannog
	name = "cabbit of the Cairne Bog"
	desc = "That's no ordinary cabbit..."
	icon = 'icons/roguetown/mob/cabbit.dmi'
	icon_state = "cabbit_evil"
	icon_living = "cabbit_evil"
	icon_dead = "cabbit_evil_dead"
	speak = list("HISSS", "GHRHRHRHL")
	speak_emote = list("squeaks")
	emote_hear = list("raises its ears.", "hisses.")
	emote_see = list("turns his head around.", "stands with its hindlegs in guard.")
	health = 160
	maxHealth = 160
	move_to_delay = 3 // FAST.
	attack_sound = list('sound/vo/mobs/rat/aggro (1).ogg', 'sound/vo/mobs/rat/aggro (2).ogg', 'sound/vo/mobs/rat/aggro (3).ogg')
	base_constitution = 5
	base_strength = 5
	base_speed = 10
	base_endurance = 5
	remains_type = /obj/effect/decal/remains/cabbit
	melee_damage_lower = 20
	melee_damage_upper = 40
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 1,
							/obj/item/alch/sinew = 1,
							/obj/item/alch/bone = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 1,
							/obj/item/alch/sinew = 2,
							/obj/item/alch/bone = 1,
							/obj/item/natural/fur/cabbit = 1)

/mob/living/simple_animal/hostile/retaliate/troll/caerbannog/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/rabbit/rabbit_alert.ogg')
		if("pain")
			return pick('sound/vo/mobs/rabbit/rabbit_pain1.ogg', 'sound/vo/mobs/rabbit/rabbit_pain2.ogg')
		if("death")
			return pick('sound/vo/mobs/rabbit/rabbit_death.ogg')

/obj/effect/decal/remains/cabbit
	name = "remains"
	gender = PLURAL
	icon = 'icons/roguetown/mob/cabbit.dmi'
	icon_state = "cabbit_remains"

