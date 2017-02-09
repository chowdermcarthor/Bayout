//Has a special smoothing proc to be used
//Also like composite in that it's not deconstructed the same way as walls and needs the walltype var so
/turf/simulated/wall/composite/wood
	name = "wooden wall"
	desc = "A wall with wooden plating. Stiff."
	icon = 'icons/turf/wall/wood.dmi'
	icon_state = "wood"
	walltype = "wood"

/turf/simulated/wall/wood/New()
	..()
	for(var/turf/simulated/wall/wood/W in range(src,1))
		W.relativewall()
	..()

/turf/simulated/wall/wood/Del()
	for(var/turf/simulated/wall/wood/W in range(src,1))
		W.relativewall()
	..()

//Bringing back an old version of wall smoothing code because this has a bit of a special icon.
/turf/simulated/wall/wood/proc/relativewall()
	var/junction = 0

	for(var/cdir in cardinal)
		var/turf/T = get_step(src,cdir)
		if(istype(T, /turf/simulated/wall/wood))
			junction |= cdir
			continue
/*		for(var/atom/A in T)
			if(istype(A, /obj/structure/window/fulltile))
				junction |= cdir
				break*/
	switch(junction)
		if(3)
			icon_state = "wood1"
		if(12)
			icon_state = "wood2"
		else
			icon_state = "wood"