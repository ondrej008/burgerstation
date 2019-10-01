/obj/hud/button/widget/

	name = "widget"

	essential = TRUE

	flags = FLAGS_HUD_MOB

	mouse_opacity = 1

	icon = 'icons/hud/widget.dmi'

/obj/hud/button/widget/experience
	icon_state = "experience"

	screen_loc = "RIGHT,TOP"

/obj/hud/button/widget/experience/clicked_on_by_object(var/mob/caller,object,location,control,params)

	if(!is_living(caller))
		return TRUE

	var/final_text = ""

	var/mob/living/L = caller

	final_text += div("bold underlined","Attributes")

	for(var/k in L.attributes)
		var/experience/attribute/A = L.attributes[k]
		var/current_level = A.get_current_level()
		final_text += div("notice","[A.name]: [A.get_current_level(current_level)]")

	final_text += div("bold underlined","Skills")

	for(var/k in L.skills)
		var/experience/skill/S = L.skills[k]
		var/current_level = S.get_current_level()
		final_text += div("notice","[S.name]: [S.get_current_level(current_level)] ([S.level_to_xp(current_level)]/[S.level_to_xp(min(current_level+1,S.max_level))] xp)")

	L.to_chat(final_text)

	return TRUE