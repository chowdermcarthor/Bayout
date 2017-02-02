/datum/job/settler
	title = "Settler"
	flag = SETTLER
	department_flag = CIVILIAN
	faction = "Station" 
	total_positions = -1
	spawn_positions = -1
	supervisors = "nobody"
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()

	uniform = /obj/item/clothing/under/f13/settler
	idtype = null
	pda = null
	ear = null
	belt = null
	put_in_backpack = list(/obj/item/stack/cable_coil = 1)

	

/datum/job/settler/equip(var/mob/living/carbon/human/H)
	if(!..())	
		return 0
	
	uniform = pick(/obj/item/clothing/under/f13/settler,\
		/obj/item/clothing/under/f13/brahmin,\
		/obj/item/clothing/under/f13/machinist,\
		/obj/item/clothing/under/f13/lumberjack,\
		/obj/item/clothing/under/f13/roving)
	//THIS DOESNT' WORK FOR SOME REASON
	H.equip_to_slot_or_del(new uniform(H), slot_w_uniform) 
	
	if (prob(50))
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_glasses)
	if (prob(80))
		H.equip_to_slot_or_del(new /obj/item/weapon/material/knife(H), slot_l_hand)		
		
	return 1