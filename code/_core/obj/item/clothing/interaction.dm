/obj/item/clothing/attack_object(var/atom/caller,var/atom/object,location,control,params) //When we attack something with the clothes

	if(is_mob(object))
		var/mob/M = object

		var/obj/inventory/best_inventory

		for(var/obj/inventory/I in M.inventory)
			if(!best_inventory)
				best_inventory = I
				continue

			if(I.can_wear_object(src) && I.priority >= best_inventory.priority)
				best_inventory = I
				continue

		if(best_inventory)
			return src.transfer_item(best_inventory)
		else
			return FALSE

	return ..()