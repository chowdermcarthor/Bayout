/datum/job/assistant
	title = "Vault Dweller"
	flag = ASSISTANT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	start_only = 1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	economic_modifier = 1
	access = list(access_maint_tunnels, access_hydroponics)//list()			//See /datum/job/assistant/get_access()
	minimal_access = list(access_maint_tunnels, access_hydroponics)	//See /datum/job/assistant/get_access()
	//alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor")
	uniform = /obj/item/clothing/under/f13/vault/v13 ///obj/item/clothing/under/rank/assistant
	//suit = /obj/item/clothing/suit/storage/ass_jacket

/*/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
*/