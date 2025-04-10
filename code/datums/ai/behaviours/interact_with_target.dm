///behavior for general interactions with any targets
/datum/ai_behavior/interact_with_target
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT | AI_BEHAVIOR_REQUIRE_REACH
	///should we be clearing the target after the fact?
	var/clear_target = TRUE
	///should our combat mode be off during interaction?
	var/combat_mode = TRUE

/datum/ai_behavior/interact_with_target/setup(datum/ai_controller/controller, target_key)
	. = ..()
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		return FALSE
	set_movement_target(controller, target)

/datum/ai_behavior/interact_with_target/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target) || !pre_interact(controller, target))
		finish_action(controller, FALSE)
		return FALSE
	controller.ai_interact(target, combat_mode)
	finish_action(controller, TRUE)
	return TRUE

/datum/ai_behavior/interact_with_target/finish_action(datum/ai_controller/controller, succeeded, target_key)
	. = ..()
	if(clear_target || !succeeded)
		controller.clear_blackboard_key(target_key)

/datum/ai_behavior/interact_with_target/proc/pre_interact(datum/ai_controller/controller, target)
	return TRUE
