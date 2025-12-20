/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_fuckingkillyou
	name = "NAUGHTY"
	desc = "Have an adequate festive period, everyone!"
	button_icon_state = "bcry"
	sound = 'sound/magic/fuckyoudie.ogg'

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

/datum/action/cooldown/spell/undirected/conjure_item/jinglesack_fuckingkillyou/cast(mob/living/cast_on)
    . = ..()
    var/obj/item/random_item = pickweight(list(/obj/item/gun/ballistic/revolver/grenadelauncher/pistol/conjured=1,/obj/item/explosive/bottle=1,/obj/item/weapon/knife/dagger=1,/obj/item/explosive/canister_bomb=1,/obj/item/explosive=1,/obj/item/smokebomb/poison_bomb=1,/obj/item/weapon/sword/long/greatsword/zwei=1,/obj/item/weapon/sword/long/exe/astrata=1,/obj/item/weapon/polearm/spear/abyssor=1,/obj/item/weapon/mace/goden=1,/obj/item/weapon/sword/long/greatsword/gutsclaymore=1,/obj/item/cooking/pan=1,/obj/item/weapon/mace/stunmace=1,/obj/item/weapon/katar=1,/obj/item/weapon/whip/chain=1,/obj/item/weapon/greataxe/steel/doublehead/graggar=1,/obj/item/weapon/greataxe/steel/doublehead=1,/obj/item/weapon/spear/naginata=1,/obj/item/weapon/sickle/scythe=1,/obj/item/weapon/whip/urumi=1,/obj/item/weapon/sword/rapier/ironestoc=1,/obj/item/weapon/sword/scimitar/ngombe=1,/obj/item/weapon/sword/sabre/dadao=1,/obj/item/weapon/sword/sabre/hwi=1,/obj/item/weapon/knife/stone/kukri=1,/obj/item/weapon/knife/njora/steel=1,/obj/item/weapon/knife/cleaver=1,/obj/item/weapon/mace/goden/copper=1,/obj/item/weapon/mace/church=1,/obj/item/weapon/knuckles=1,/obj/item/weapon/flail/militia=1,/obj/item/throwing_star=1,)) // merry christmas to all, you're
    owner.put_in_active_hand(new random_item)
