/obj/machinery/deepfryer
	name = "deep fryer"
	desc = "Deep fried <i>everything</i>."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "fryer_off"
	layer = 3.0
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 5
	var/on = FALSE	// Is it deep frying right now?
	var/obj/item/frying = null	//What's being fried RIGHT NOW?

/obj/machinery/deepfryer/attackby(obj/item/I, mob/user)
	if(on)
		user << "<span class='notice'>[src] is still active!</span>"
		return
	if(istype(I, /obj/item/weapon/grab) || istype(I, /obj/item/tk_grab))
		user << "<span class='warning'>Stop that you cheeky bastard.</span>"
		return
	if(!user.unEquip(I))
		user << "<span class='warning'>You cannot deepfry [I].</span>"
		return
	else
		user << "<span class='notice'>You put [I] into [src].</span>"
		on = TRUE
		user.drop_item()
		frying = I
		frying.loc = src
		icon_state = "fryer_on"
		sleep(160)

		if(frying && frying.loc == src)
			var/obj/item/weapon/reagent_containers/food/snacks/deepfryholder/S = new(get_turf(src))
			if(istype(frying, /obj/item/weapon/reagent_containers/))
				var/obj/item/weapon/reagent_containers/food = frying
				food.reagents.trans_to(S, food.reagents.total_volume)
			S.color = "#FFAD33"
			S.icon = frying.icon
			S.icon_state = frying.icon_state
			S.name = "deep fried [frying.name]"
			S.desc = I.desc
			frying.loc = S	//this might be a bad idea.

		icon_state = "fryer_off"
		on = FALSE
		playsound(src.loc, 'sound/machines/ding.ogg', 50, 1)


/obj/machinery/deepfryer/attack_hand(mob/user)
	if(on && frying)
		user << "<span class='notice'>You pull [frying] from [src]! It looks like you were just in time!</span>"
		user.put_in_hands(frying)
		frying = null
		return
	..()
