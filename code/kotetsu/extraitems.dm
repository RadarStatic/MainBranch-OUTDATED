/obj/item/toy/zigplush
	icon = 'icons/kotetsu/zig.dmi'
	name = "\improper Zigzagoon plush"
	desc = "ZIG."
	icon_state = "zigzagoon"
	item_state = "zigzagoon"
	w_class = 3.0

/obj/item/toy/zigplush/attack_self(mob/user as mob)
		user.visible_message("<span class='notice'>[user] hugs the [src].</span>")
		playsound(user, 'sound/weapons/thudswoosh.ogg', 20, 1)