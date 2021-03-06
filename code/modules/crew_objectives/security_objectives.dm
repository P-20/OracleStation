/*				SECURITY OBJECTIVES				*/

/datum/objective/crew/enjoyyourstay
	explanation_text = "Welcome aboard. Enjoy your stay."
	jobs = "headofsecurity,securityofficer,warden,detective"
	var/list/edglines = list("Welcome aboard. Enjoy your stay.", "You signed up for this.", "Abandon hope.", "The tide's gonna stop eventually.", "Hey, someone's gotta do it.", "No, you can't resign.", "Security is a mission, not an intermission.")

/datum/objective/crew/enjoyyourstay/New()
	. = ..()
	update_explanation_text()

/datum/objective/crew/enjoyyourstay/update_explanation_text()
	. = ..()
	explanation_text = "Enforce Space Law to the best of your ability, and survive. [pick(edglines)]"

/datum/objective/crew/enjoyyourstay/check_completion()
	if(owner && owner.current)
		if(owner.current.stat != DEAD)
			return TRUE
	return FALSE

/datum/objective/crew/shawshankgonewrong
	explanation_text = "Ensure there are no corpses in security when the shift ends."
	jobs = "brigphysician"

/datum/objective/crew/shawshankgonewrong/check_completion()
	for(var/mob/living/carbon/human/H in GLOB.mob_list)
		if(H.stat == DEAD && H.z == ZLEVEL_STATION_PRIMARY)
			if(get_area(H) == /area/security)
				return FALSE
	return TRUE
