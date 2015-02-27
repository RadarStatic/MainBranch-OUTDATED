/obj/item/toy/plush/
	icon = 'icons/kotetsu/plush.dmi'
	name = "plush toy"
	desc = "WHO AM I. "
	w_class = 4.0
	var/cooldown = 0

/obj/item/toy/plush/zigzagoon
	name = "\improper Zigzagoon plush"
	desc = "ZIG. ZAG. ZIG. ZAG. OON."
	icon_state = "zigzagoon"
	item_state = "zigzagoon"

/obj/item/toy/plush/jolteon
	name = "\improper Jolteon plush"
	desc = "It's got grey cat fur visible on it." //LEON LIKES A JOLTY
	icon_state = "jolteon"
	item_state = "jolteon"

/obj/item/toy/plush/vaporeon
	name = "\improper Vaporeon plush"
	desc = "Feels kind of rubbery."
	icon_state = "vaporeon"
	item_state = "vaporeon"

/obj/item/toy/plush/flareon
	name = "\improper Flareon plush"
	desc = "It has no moves." //fyre would kill me for this ahaeuauehuaehaehu
	icon_state = "flareon"
	item_state = "flareon"

/obj/item/toy/plush/attack_self(mob/user as mob)
	if(!cooldown)
		if(user.zone_sel.selecting == "mouth")
			user.visible_message("<span class='danger'>[user] chews on the [src]!</span>")
			playsound (user, 'sound/items/bikehorn.ogg', 20, 1)
			cooldown = 1
			spawn(50) cooldown = 0
		else
			user.visible_message("<span class='notice'>[user] hugs [src].</span>")
			playsound(user, 'sound/weapons/thudswoosh.ogg', 20, 1)
			cooldown = 1
			spawn(20) cooldown = 0
