/turf/simulated/wall/composite
	name = "concrete wall"
	icon = 'icons/turf/wall/composite.dmi'
	icon_state = "ruins0"
	var/walltype = "ruins"

/turf/simulated/wall/composite/New()
	for(var/turf/simulated/wall/composite/W in range(src,1))
		W.relativewall()

/turf/simulated/wall/composite/Del()
	for(var/turf/simulated/wall/composite/W in range(src,1))
		W.relativewall()
	..()

/turf/simulated/wall/composite/proc/relativewall()
	var/junction = 0

	for(var/cdir in cardinal)
		var/turf/T = get_step(src,cdir)
		if(istype(T, /turf/simulated/wall/composite))
			junction |= cdir
	icon_state = "[walltype][junction]"


/turf/simulated/wall/composite/thermitemelt()
	return 0

//50% chance to use an alternate icon (...once the rest of the alternate icons are added that is)
/turf/simulated/wall/composite/ruins
	walltype = "ruins"
/*
/turf/simulated/wall/composite/ruins/New()
	..()
	var/alt = 0
	if(prob(50))
		alt = 1
	icon_state = "[icon_state][alt ? "alt":""]"
*/


/turf/simulated/wall/composite/store
	icon = 'icons/turf/wall/store.dmi'
	icon_state = "store0"
	walltype = "store"

/turf/simulated/wall/composite/store/reinforced
	icon = 'icons/turf/wall/superstore.dmi'
	icon_state = "supermart0"
	walltype = "supermart"

//This looks weird. Don't use it.
/turf/simulated/wall/composite/tunnel
	name = "tunnel wall"
	icon = 'icons/turf/wall/tunnel.dmi'
	icon_state = "subwaytop"

/turf/simulated/wall/composite/tunnel/update_icon()
	return //Icons would be defined as map instances, as much as I hate that.