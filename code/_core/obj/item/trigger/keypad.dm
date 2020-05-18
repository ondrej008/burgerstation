var/global/list/obj/hud/button/keypad_buttons = list(
	/obj/hud/button/keypad/bottom,
	/obj/hud/button/keypad/top,
	/obj/hud/button/keypad/close
)


/obj/item/device/keypad
	name = "keypad"
	desc = "An access keypad. Only works if you know the code."
	icon_state = "keypad_red"
	interactable = TRUE

	var/code = 1337

/obj/item/device/keypad/trigger(var/mob/caller,var/atom/source,var/signal_freq,var/signal_code)

	if(loc && signal_freq == -1 && signal_code == code)
		loc.trigger(caller,src,-1,-1)

	return TRUE

/obj/item/device/keypad/clicked_on_by_object(var/mob/caller,object,location,control,params)

	INTERACT_CHECK

	if(!is_player(caller))
		return TRUE

	var/mob/living/advanced/player/P = caller

	P.set_device_active(src)

	return TRUE

/obj/item/device/keypad/on_active(var/mob/living/advanced/player/P)
	show_buttons_to(P)
	return ..()

/obj/item/device/keypad/on_inactive(var/mob/living/advanced/player/P)
	hide_buttons_from(P)
	return ..()

/obj/item/device/keypad/proc/show_buttons_to(var/mob/living/advanced/A)
	for(var/v in keypad_buttons)
		var/obj/hud/button/keypad/K = new v
		INITIALIZE(K)
		K.update_owner(A)
		K.update_sprite()

/obj/item/device/keypad/proc/hide_buttons_from(var/mob/living/advanced/A)
	for(var/obj/hud/button/keypad/K in A.buttons)
		K.update_owner(null)