/obj/item/toy/zigplush
	icon = 'icons/kotetsu/zig.dmi'
	name = "\improper Zigzagoon plush"
	desc = "ZIG."
	icon_state = "zigzagoon"
	item_state = "zigzagoon"
	w_class = 4.0
	var/cooldown = 0

/obj/item/toy/zigplush/attack_self(mob/user as mob)
	if(!cooldown)
		user.visible_message("<span class='notice'>[user] hugs [src].</span>")
		playsound(user, 'sound/weapons/thudswoosh.ogg', 20, 1)
		cooldown = 1
		spawn(20) cooldown = 0
