/datum/antagonist/jinglesack
	name = "Jinglesack"
	roundend_category = "JINGLESACK IS BACK IN TOWN!!!"
	antagpanel_category = "Jinglesack"
	show_name_in_check_antagonists = TRUE
	antag_flags = FLAG_ANTAG_CAP_IGNORE

/datum/antagonist/jinglesack/on_gain()
	. = ..()
	if(owner)
		owner.special_role = "Jinglesack"

/datum/antagonist/jinglesack/greet()
	owner.announce_objectives()
	..()

/datum/objective/jinglesack
	explanation_text = "Xylix wishes you to spread holiday cheer! By any means necessary. By any means necessary. By any means necessary. By any means necessary. By any means necessary. By any means necessary. By any means necessary. By any means necessary. Have an adequate festive period!"

/datum/antagonist/jinglesack/on_removal()
	. = ..()
	if(owner)
		owner.special_role = null
