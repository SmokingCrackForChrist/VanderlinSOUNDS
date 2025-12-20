/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_haveanadequatefestiveperiod
	name = "NICE"
	desc = "Have an adequate festive period, everyone!"
	button_icon_state = "curse"
	sound = 'sound/magic/merrycringlefuck.ogg'

	antimagic_flags = NONE

	associated_skill = /datum/skill/combat/unarmed
	associated_stat = STATKEY_STR

	charge_required = FALSE
	has_visual_effects = FALSE
	cooldown_time = 10 SECONDS // 1 MINUTES
	spell_type = SPELL_STAMINA
	invocation_type = INVOCATION_NONE
	item_duration = null
	spell_type = SPELL_STAMINA

///datum/action/cooldown/spell/undirected/conjure_item/jinglesack_fuckingkillyou/is_valid_target(atom/cast_on)
//	. = ..()
//	if(!.)
//		return
//	return isliving(owner)

///datum/action/cooldown/spell/undirected/conjure_item/jinglesack_fuckingkillyou/cast(mob/living/cast_on)
//	. = ..()
//	var/cringlefuckyoudie = pickweight(list("Gun" = 1, "Bomb" = 2, "Knife" = 4)) // merry christmas to all, you're all gonna die
//
//	switch(cringlefuckyoudie)
//		if("Gun")
//			item_type = /obj/item/gun/ballistic/revolver/grenadelauncher/pistol/conjured
//		if("Bomb")
//			item_type = /obj/item/explosive/bottle
//		if("Knife")
//			item_type = /obj/item/weapon/knife/dagger

/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_haveanadequatefestiveperiod/cast(mob/living/cast_on)
    . = ..()
    var/obj/item/random_item = pickweight(list(/obj/item/kitchen/spoon/pewter=1,/obj/item/reagent_containers/glass/bowl/onyxa=1,/obj/item/reagent_containers/food/snacks/meat/human=1,/obj/item/reagent_containers/food/snacks/meat/wiener=1,/obj/item/clothing/wrists/bracers/iron=1,/obj/item/clothing/wrists/gem/shellbracelet=1,/obj/item/clothing/shoes/simpleshoes=1,/obj/item/clothing/ring/gold=1,/obj/item/clothing/pants/trou/leather/quiltedkilt=1,/obj/item/clothing/neck/coif/cloth=1,/obj/item/clothing/neck/bevor/iron=1,/obj/item/collar_detonator=1,/obj/item/clothing/neck/talkstone=1,/obj/item/clothing/neck/elfears=1,/obj/item/clothing/head/menacing=1,/obj/item/clothing/head/crown/circlet=1,/obj/item/clothing/head/helmet/skullcap=1,/obj/item/clothing/gloves/bandages/weighted=1,/obj/item/clothing/face/spectacles/sglasses=1,/obj/item/clothing/face/spectacles/inqglasses=1,/obj/item/clothing/face/facemask/steel/steppebeast=1,/obj/item/clothing/cloak/apron/cook=1,/obj/item/clothing/armor/brigandine=1,/obj/item/clothing/armor/gambeson/light=1,/obj/item/cooking/pan=1,/obj/item/weapon/knife/cleaver=1,/obj/item/storage/messkit=1,/obj/item/clothing/head/articap/porter=1,/obj/item/weapon/knife/dagger/steel=1,/obj/item/weapon/knife/dagger/steel/profane=1,/obj/item/weapon/knife/throwingknife/rous=1,/obj/item/weapon/whip/psydon=1,/obj/item/breach_charge=1,/obj/item/reagent_containers/glass/cup=1,/obj/item/storage/pill_bottle/dice=1,/obj/structure/fluff/walldeco/painting/skull=1,/obj/item/soap=1,/obj/item/signal_horn=1,/obj/item/perfume/random=1,/obj/item/storage/keyring/jester=1,/obj/item/broom=1,/obj/item/holy_grenade=1,/obj/item/weapon/scabbard/sword/royal=1,/obj/item/gun/ballistic/revolver/grenadelauncher/pistol=1,/obj/item/weapon/flail=1,/obj/item/weapon/sword/sabre/scythe=1,/obj/item/explosive/deathshell=1,/obj/item/explosive/canister_bomb=1,/obj/item/clothing/face/cigarette/rollie=1,/obj/item/psydonmusicbox=1,/obj/item/flashlight/flare/torch/lantern/psycenser=1,/obj/item/inqarticles/bmirror=1,/obj/item/mimictrinket=1,/obj/item/hourglass/temporal=1,/obj/item/weapon/hammer=1,/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/slurbow=1,/obj/item/weapon/sword/rapier=1,/obj/item/weapon/sword/long/martyr=1,/obj/item/weapon/katar/abyssor=1,/obj/item/explosive/bottle=1,/obj/item/reagent_containers/food/snacks/hardtack=1,/obj/item/reagent_containers/food/snacks/bread=1,/obj/item/reagent_containers/food/snacks/raisindough_poison=1,/obj/item/reagent_containers/food/snacks/breadslice/raisin=1,/obj/item/reagent_containers/food/snacks/breadslice/raisin_poison=1,/obj/item/reagent_containers/food/snacks/fritter=1,/obj/item/reagent_containers/glass/bottle/killersice=1,/obj/item/reagent_containers/food/snacks/cheesecake_poison_cooked=1,/obj/item/reagent_containers/food/snacks/cheesecake_poison_slice=1,/obj/item/reagent_containers/food/snacks/griddlecake/berry_poison=1,/obj/item/reagent_containers/food/snacks/biscuit_poison=1)) // merry christmas to all, you're
    owner.put_in_active_hand(new random_item)
