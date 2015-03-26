/obj/item/clothing/glasses/meson
	//name = "Optical Meson Scanner"
	//desc = "Used by engineering and mining staff to see basic structural and terrain layouts through walls, regardless of lighting condition."
	//icon_state = "meson"
	//item_state = "glasses"
	//origin_tech = "magnets=2;engineering=2"
	//darkness_view = 1
	//vision_flags = SEE_TURFS
	//invis_view = SEE_INVISIBLE_MINIMUM
	action_button_name = "Toggle Mesons"

/obj/item/clothing/glasses/meson/attack_self()
	toggle()

/obj/item/clothing/glasses/meson/verb/toggle()
	set category = "Object"
	set name = "Toggle Mesons"
	set src in usr

	mesontoggle()


/obj/item/clothing/glasses/proc/mesontoggle()			//Shamelessly copypasted from other code, with MAGIC NUMBERS
	if(usr.canmove && !usr.stat && !usr.restrained())
		if(up) //If they're on
			up = !up
			vision_flags = SEE_TURFS
			invis_view = SEE_INVISIBLE_MINIMUM
			icon_state = initial(icon_state)
			usr << "You turn the [src] on."
		else //If they're up.
			up = !up
			vision_flags = 0
			invis_view = 25
			icon_state = "[initial(icon_state)]off"
			usr << "You turn the [src] off."

	if(istype(src, /obj/item/clothing/head))			//makes the mob-overlays update
		usr.update_inv_head(0)
	if(istype(src, /obj/item/clothing/glasses))
		usr.update_inv_glasses(0)
	if(istype(src, /obj/item/clothing/mask))
		usr.update_inv_wear_mask(0)