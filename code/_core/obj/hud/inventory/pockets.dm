/obj/hud/inventory/pocket
	name = "pocket"
	id = "pocket"
	screen_loc = "CENTER,BOTTOM+3"
	worn_slots = 0
	held_slots = 1
	icon_state = "square_trim"
	max_size = SIZE_2
	max_weight = WEIGHT_3
	//should_draw = FALSE
	reverse_draw = TRUE
	drag_to_take = FALSE

	essential = TRUE

	item_bypass = list()

	flags = FLAGS_HUD_INVENTORY | FLAGS_HUD_MOB

	drop_on_death = TRUE

/obj/hud/inventory/pocket/pocket01
	name = "left lower pocket"
	id = "pocket01"
	screen_loc = "CENTER+2,BOTTOM"

/obj/hud/inventory/pocket/pocket02
	name = "right lower pocket"
	id = "pocket02"
	screen_loc = "CENTER+3,BOTTOM"