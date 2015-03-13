/obj/item/device/pda2
	name = "Small Radio"
	desc = "A small radio."
	icon = 'icons/obj/pda.dmi'
	icon_state = "pda"
	item_state = "electronic"
	w_class = 2.0
	var/emagged = 0



/obj/item/device/pda2/attack_self(mob/user as mob)
	if(W, istype(/obj/item/weapon/card/emag))
		emagged = 1
		playsound(user, 'sound/items/AirHorn.ogg', 100, 1)
		user.visible_message("<span class='notice'>[user] plays the [src].</span>")
	else if(src.emagged==1)
		playsound(user, 'sound/machines/click.ogg', 20, 1)
