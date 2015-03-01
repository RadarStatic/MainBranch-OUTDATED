/*
Assistant
*/
/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()

/datum/job/assistant/equip_items(var/mob/living/carbon/human/H)
	switch(H.ckey)
		if("poojawa")
			if(findtextEx(H.real_name,"Pooj"))
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/mailman/poojie(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/clothing/head/mailman/poojie(H), slot_head)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/poojie(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
		if("nebulacallisto")
			if(findtextEx(H.real_name,"Vega"))
				H.equip_to_slot_or_del(new /obj/item/clothing/under/blacktango(H), slot_w_uniform)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)

/datum/job/assistant/get_access()
	if(config.jobs_have_maint_access & ASSISTANTS_HAVE_MAINT_ACCESS) //Config has assistant maint access set
		. = ..()
		. |= list(access_maint_tunnels)
	else
		return ..()