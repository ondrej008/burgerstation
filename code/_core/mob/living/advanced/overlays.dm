mob/living/advanced/proc/add_overlay(var/atom/A,var/desired_layer,var/desired_icon,var/desired_icon_state,var/desired_color,var/desired_additional_blends)
	world.log << "ADDING OVERLAY OF [A] with icon_state of [desired_icon_state ? desired_icon_state : A.icon_state]"
	var/obj/overlay/O = new /obj/overlay
	O.attached_object = A
	O.initial_icon = desired_icon ? desired_icon : A.icon
	O.initial_icon_state = desired_icon_state ? desired_icon_state : A.icon_state
	O.layer = desired_layer ? desired_layer : A.layer
	O.icon = desired_icon ? desired_icon : A.icon
	O.icon_state = desired_icon_state ? desired_icon_state : A.icon_state
	O.color = desired_color ? desired_color : A.color
	O.additional_blends = desired_additional_blends ? desired_additional_blends : A.additional_blends
	O.update_icon()
	world.log << "FINAL OVERLAY: [O.icon_state] WITH COLOR [A.color]."
	add_overlay_image(O)

mob/living/advanced/proc/remove_overlay(var/atom/A)
	world.log << "REMOVING OVERLAY OF [A]"
	for(var/obj/overlay/O in overlays_assoc)
		if(O.attached_object != A)
			continue
		remove_overlay_image(O)
		qdel(O)

mob/living/advanced/proc/update_overlay(var/atom/A,var/desired_layer,var/desired_icon,var/desired_icon_state,var/desired_color,var/desired_additional_blends)
	world.log << "UPDATING OVERLAY OF [A]"
	for(var/obj/overlay/O in overlays_assoc)
		if(O.attached_object != A)
			continue
		update_overlay_direct(O)

mob/living/advanced/proc/update_all_blends()
	for(var/obj/overlay/O in overlays_assoc)
		world.log << "PENIS [O.attached_object.name]"
		remove_overlay_image(O)
		O.update_icon()
		add_overlay_image(O)

mob/living/advanced/proc/add_overlay_image(var/obj/overlay/O)
	var/image/I = new /image(O.icon)
	I.appearance = O.appearance
	overlays += I
	overlays_assoc[O] = I

mob/living/advanced/proc/remove_overlay_image(var/obj/overlay/O)
	var/image/I = overlays_assoc[O]
	overlays -= I
	overlays_assoc -= I
	qdel(I)

mob/living/advanced/proc/update_overlay_direct(var/obj/overlay/O,var/desired_layer,var/desired_icon,var/desired_icon_state,var/desired_color,var/desired_additional_blends)

	remove_overlay_image(O)

	if(desired_layer)
		O.layer = desired_layer
	if(desired_icon)
		O.icon = desired_icon
	if(desired_icon_state)
		O.icon_state = desired_icon_state
	if(desired_color)
		O.color = desired_color
	if(desired_additional_blends)
		O.additional_blends = desired_additional_blends

	add_overlay_image(O)