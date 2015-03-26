/datum/round_event_control/carp_migration
	name = "Carp Migration"
	typepath = /datum/round_event/carp_migration
	weight = 15
	earliest_start = 6000
	max_occurrences = 6

/datum/round_event/carp_migration
	announceWhen	= 3
	startWhen = 50
	var/special_migration=0

/datum/round_event/carp_migration/setup()
	startWhen = rand(40, 60)
	if(prob(10))
		special_migration="duck"

/datum/round_event/carp_migration/announce()
	if(special_migration=="duck")
		priority_announce("Space D*cks are migrating to the space near [station_name()], please stand-by.", "Lifesign Alert")
	else
		priority_announce("Unknown biological entities have been detected near [station_name()], please stand-by.", "Lifesign Alert")


/datum/round_event/carp_migration/start()
	for(var/obj/effect/landmark/C in landmarks_list)
		if(C.name == "carpspawn")
			if(special_migration=="duck")
				new /mob/living/simple_animal/hostile/carp/duck(C.loc)
			else
				new /mob/living/simple_animal/hostile/carp(C.loc)