/obj/item/device/radio/radio
	icon = 'icons/obj/radio.dmi'
	name = "Small radio"
	icon_state = "radio"
	item_state = "radio"
	w_class = 2
	var/emagged = 0
	var/cooldown = 0

/obj/item/device/radio/radio/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/card/emag))
		if(emagged == 0)
			emagged = 1
			user << "<span class='warning'>PZZTTPFFFT</span>"
			desc = desc+ " The display flickers slightly."

