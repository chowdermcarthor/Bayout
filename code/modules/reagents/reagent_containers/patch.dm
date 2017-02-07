/obj/item/weapon/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	item_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 120

	attack(mob/M as mob, mob/user as mob, def_zone)
		//TODO: replace with standard_feed_mob() call.

		if(M == user)
			if(!M.can_eat(src))
				return

			M << "<span class='notice'>You apply \the [src].</span>"
			M.drop_from_inventory(src) //icon update
			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)
			return 1

		else if(istype(M, /mob/living/carbon/human))

			user.visible_message("<span class='warning'>[user] attempts to force [M] to apply \the [src].</span>")

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			if(!do_mob(user, M))
				return

			user.drop_from_inventory(src) //icon update
			user.visible_message("<span class='warning'>[user] forces [M] to apply \the [src].</span>")

			var/contained = reagentlist()
			M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been given [name] by [key_name(user)] Reagents: [contained]</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Fed [name] to [key_name(M)] Reagents: [contained]</font>")
			msg_admin_attack("[key_name_admin(user)] gave [key_name_admin(M)] with [name] Reagents: [contained] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")

			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)

			return 1

		return 0


/obj/item/weapon/reagent_containers/pill/patch/New()
	..()
	//icon_state = "bandaid" // thanks inheritance

/obj/item/weapon/reagent_containers/pill/patch/afterattack(obj/target, mob/user , proximity)
	return // thanks inheritance again

/obj/item/weapon/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	New()
		..()
		reagents.add_reagent("bicardine", 20)

/obj/item/weapon/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	New()
		..()
		reagents.add_reagent("kelotane", 20)

/obj/item/weapon/reagent_containers/pill/patch/stimpak
	name = "Stimpak"
	desc = "Stimpak, or stimulation delivery package, is a type of hand-held medication used for healing the body. This item consists of a syringe for containing and delivering the medication and a gauge for measuring the status of the stimpak's contents. When the medicine is injected, it provides immediate healing of the body's minor wounds."
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "15"
	New()
		..()
		reagents.add_reagent("bicaridine", 20)
		reagents.add_reagent("kelotane", 20)

/obj/item/weapon/reagent_containers/pill/patch/healpowder
	name = "Healing powder"
	desc = "Soldiers of the Legion use healing powder as their primary source of medicine and healing, since the Legion bans the use of other chems, such as stimpaks."
	icon = 'icons/obj/syringe.dmi'
	item_state = "bandaid"
	icon_state = "heal_powder"
	New()
		..()
		reagents.add_reagent("bicaridine", 20)
		reagents.add_reagent("kelotane", 20)

/obj/item/weapon/reagent_containers/pill/patch/supstimpak
	name = "SuperStimpak"
	desc = "The super version comes in a hypodermic, but with an additional vial containing more powerful drugs than the basic model and a leather belt to strap the needle to the injured limb."
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "superstim_15"
	New()
		..()
		reagents.add_reagent("bicaridine", 30)
		reagents.add_reagent("kelotane", 30)


/obj/item/weapon/reagent_containers/pill/patch/radaway
	name = "RadAway"
	desc = "RadAway is an intravenous chemical solution that bonds with radiation particles and passes them through the body's system. It takes some time to work, and is also a potent diuretic."
	icon = 'icons/obj/bloodpack.dmi'
	item_state = "syringe_15"
	icon_state = "radaway"
	New()
		..()
		reagents.add_reagent("anti_toxin", 25)

/obj/item/weapon/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "Jet is a highly addictive drug first synthesized by Myron. It is extracted from brahmin dung fumes and administered via an inhaler."
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "jet"
	New()
		..()
		reagents.add_reagent("impedrezene", 10)
		reagents.add_reagent("synaptizine", 5)
		reagents.add_reagent("hyperzine", 5)

/obj/item/weapon/reagent_containers/pill/patch/psycho
	name = "Psycho"
	desc = "Psycho will increase damage resistance, allowing subjects to survive hits more easily."
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "psycho"
	New()
		..()
		reagents.add_reagent("impedrezene", 10)
		reagents.add_reagent("synaptizine", 5)
		reagents.add_reagent("hyperzine", 5)
		reagents.add_reagent("bicaridine", 30)
		reagents.add_reagent("kelotane", 30)

/obj/item/weapon/reagent_containers/pill/patch/medx
	name = "Mex-X"
	desc = "Med-X is a potent opiate analgesic that binds to opioid receptors in the brain and central nervous system, reducing the perception of pain as well as the emotional response to pain. Essentially, it is a painkiller delivered by a hypodermic needle."
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "medx"
	New()
		..()
		reagents.add_reagent("impedrezene", 10)
		reagents.add_reagent("synaptizine", 5)
		reagents.add_reagent("hyperzine", 5)

/obj/item/weapon/reagent_containers/pill/patch/radx
	name = "Rad-X"
	desc = "Rad-X is an anti-radiation chemical that can significantly reduce the danger of irradiated areas."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "radx"
	item_state = "radx"
	New()
		..()
		reagents.add_reagent("anti_toxin", 25)

/obj/item/weapon/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "Turbo appears as an inhaler of Jet hastily duct-taped to a can of 'HairStylez-brand hair spray. The effect of turbo is a brief slowdown of the surroundings (time goes at about 35% of its original speed), including everything from your enemies' movements, to projectile speeds (your own projectile speed included), and even the duration of the drug itself. However, you are not slowed down yourself - your own movement speed and fire rate will remain the same."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "turbo"
	item_state = "turbo"
	New()
		..()
		reagents.add_reagent("impedrezene", 10)
		reagents.add_reagent("synaptizine", 5)
		reagents.add_reagent("hyperzine", 5)
