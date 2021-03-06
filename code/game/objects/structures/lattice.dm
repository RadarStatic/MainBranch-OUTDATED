/obj/structure/
	desc = "A lightweight support lattice."
	name = "lattice"
	icon = 'icons/obj/structures.dmi'
	icon_state = "latticefull"
	density = 0
	anchored = 1.0
	layer = 2.3 //under pipes
	//	flags = CONDUCT

/obj/structure/lattice/New()
	..()
	if(!(istype(src.loc, /turf/space)))
		qdel(src)
	for(var/obj/structure/lattice/LAT in src.loc)
		if(LAT != src)
			qdel(LAT)
	icon = 'icons/obj/smoothlattice.dmi'
	icon_state = "latticeblank"
	updateOverlays()
	for (var/dir in cardinal)
		var/obj/structure/lattice/L
		if(locate(/obj/structure/lattice, get_step(src, dir)))
			L = locate(/obj/structure/lattice, get_step(src, dir))
			L.updateOverlays()

/obj/structure/lattice/Destroy()
	for (var/dir in cardinal)
		var/obj/structure/lattice/L
		if(locate(/obj/structure/lattice, get_step(src, dir)))
			L = locate(/obj/structure/lattice, get_step(src, dir))
			L.updateOverlays(src.loc)
	..()

/obj/structure/lattice/blob_act()
	qdel(src)
	return

/obj/structure/lattice/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			return
		else
	return

/obj/structure/lattice/attackby(obj/item/C as obj, mob/user as mob)

	if (istype(C, /obj/item/stack/tile/plasteel))
		var/turf/T = get_turf(src)
		T.attackby(C, user) //BubbleWrap - hand this off to the underlying turf instead
		return
	if (istype(C, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/WT = C
		if(WT.remove_fuel(0, user))
			user << "<span class='notice'>Slicing lattice joints ...</span>"
			new /obj/item/stack/rods(src.loc)
			qdel(src)
	return

/obj/structure/lattice/proc/updateOverlays()
	//if(!(istype(src.loc, /turf/space)))
	//	qdel(src)
	overlays.Cut()

	var/dir_sum = 0

	for (var/direction in cardinal)
		if(locate(/obj/structure/lattice, get_step(src, direction)))
			dir_sum += direction
		else
			if(!(istype(get_step(src, direction), /turf/space)))
				dir_sum += direction

	icon_state = "lattice[dir_sum]"
	return

/obj/structure/lattice/catwalk
	name = "catwalk"
	desc = "A catwalk for easier EVA manuevering and cable placement."
	icon_state = "catwalkfull"

/obj/structure/lattice/catwalk/New()
	var/turf/T = loc
	T.cancable = 1
	..()

/obj/structure/lattice/catwalk/Move()
	var/turf/T = loc
	T.cancable = 0
	for(var/obj/structure/cable/C in T)
		C.Deconstruct()
	..()

/obj/structure/lattice/catwalk/Destroy()
	var/turf/T = loc
	T.cancable = 0
	for(var/obj/structure/cable/C in T)
		C.Destroy()
	..()

/obj/structure/lattice/catwalk/Deconstruct()
	var/turf/T = loc
	T.cancable = 0
	for(var/obj/structure/cable/C in T)
		C.Deconstruct()
	..()

/obj/structure/lattice/catwalk/attackby(obj/item/C as obj, mob/user as mob)
	..()
	if(istype(C, /obj/item/stack/cable_coil))
		var/turf/T = get_turf(src)
		T.attackby(C, user) //catwalks 'enable' coil laying on space tiles, not the catwalks themselves
		return

/obj/structure/lattice/catwalk/updateOverlays()
	overlays.Cut()

	var/dir_sum = 0

	for (var/direction in cardinal)
		if(locate(/obj/structure/lattice/catwalk, get_step(src, direction))) //so we only blend with other catwalks
			dir_sum += direction

	icon_state = "[name][dir_sum]"
	return