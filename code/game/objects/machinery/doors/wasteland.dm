/obj/machinery/door/unpowered/simple/wasteland
	name = "door"
	icon = 'icons/obj/doors/wasteland.dmi'
	icon_state = "wood"
	icon_base = "wood"
	var/seethrough = 0

/obj/machinery/door/unpowered/simple/wasteland/New(var/newloc, var/material_name)
	maxhealth = max(100, material.integrity*10)
	health = maxhealth
	color = material.icon_colour
	if(!seethrough)
		set_opacity(0)
	else
		glass = 1
		set_opacity(1)
	update_icon()


/obj/machinery/door/unpowered/simple/wasteland/bullet_act(var/obj/item/projectile/Proj)
	var/damage = Proj.get_structure_damage()
	if(damage)
		//cap projectile damage so that there's still a minimum number of hits required to break the door
		take_damage(min(damage, 100))


/obj/machinery/door/unpowered/simple/wasteland/ex_act(severity)
	switch(severity)
		if(1.0)
			set_broken()
		if(2.0)
			if(prob(25))
				set_broken()
			else
				take_damage(300)
		if(3.0)
			if(prob(20))
				take_damage(150)


/obj/machinery/door/unpowered/simple/wasteland/attackby(obj/item/I as obj, mob/user as mob)
	src.add_fingerprint(user)

	if(istype(I, /obj/item/stack/material) && I.get_material_name() == src.get_material_name())
		if(stat & BROKEN)
			user << "<span class='notice'>It looks like \the [src] is pretty busted. It's going to need more than just patching up now.</span>"
			return
		if(health >= maxhealth)
			user << "<span class='notice'>Nothing to fix!</span>"
			return
		if(!density)
			user << "<span class='warning'>\The [src] must be closed before you can repair it.</span>"
			return

		//figure out how much metal we need
		var/obj/item/stack/stack = I
		var/amount_needed = ceil((maxhealth - health)/DOOR_REPAIR_AMOUNT)
		var/used = min(amount_needed,stack.amount)
		if (used)
			user << "<span class='notice'>You fit [used] [stack.singular_name]\s to damaged and broken parts on \the [src].</span>"
			stack.use(used)
			health = between(health, health + used*DOOR_REPAIR_AMOUNT, maxhealth)
		return

	//psa to whoever coded this, there are plenty of objects that need to call attack() on doors without bludgeoning them.
	if(src.density && istype(I, /obj/item/weapon) && user.a_intent == I_HURT && !istype(I, /obj/item/weapon/card))
		var/obj/item/weapon/W = I
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(W.damtype == BRUTE || W.damtype == BURN)
			user.do_attack_animation(src)
			if(W.force < min_force)
				user.visible_message("<span class='danger'>\The [user] hits \the [src] with \the [W] with no visible effect.</span>")
			else
				user.visible_message("<span class='danger'>\The [user] forcefully strikes \the [src] with \the [W]!</span>")
				playsound(src.loc, hitsound, 100, 1)
				take_damage(W.force)
		return

	if(src.operating) return

	if(operable())
		if(src.density)
			open()
		else
			close()
		return

	return


/obj/machinery/door/unpowered/simple/wasteland/front
	name = "front door"
	icon_state = "house"
	icon_base = "house"

/obj/machinery/door/unpowered/simple/wasteland/single
	name = "wooden door"
	icon_state = "room"
	icon_base = "room"

/obj/machinery/door/unpowered/simple/wasteland/glass
	name = "front door"
	icon_state = "glass"
	icon_base = "glass"

/obj/machinery/door/unpowered/simple/wasteland/glass/dirty
	name = "glass door"
	icon_state = "dirtyglass"
	icon_base = "dirtyglass"

/obj/machinery/door/unpowered/simple/wasteland/glass/broken
	icon_state = "broken glass"
	icon_base = "broken glass"

/obj/machinery/door/unpowered/simple/wasteland/glass/store
	name = "store door"
	icon_state = "store"
	icon_base = "store"

/obj/machinery/door/unpowered/simple/wasteland/glass/store/dirty
	icon_state = "dirtystore"
	icon_base = "dirtystore"

/obj/machinery/door/unpowered/simple/wasteland/glass/store/broken
	icon_state = "brokenstore"
	icon_base = "brokenstore"
