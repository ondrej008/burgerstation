/mob/living/simple/bullshark
	name = "bullshark"
	icon = 'icons/mob/living/simple/bullshark.dmi'
	icon_state = "living"

	health_base = 200

	ai = /ai/bullshark
	class = /class/bull
	damage_type = /damagetype/unarmed/bite/

	iff_tag = "Meme"
	loyalty_tag = "Meme"

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

	mob_size = MOB_SIZE_LARGE

	blood_type = /reagent/blood/carp
	blood_volume = 750

	butcher_contents = list(
		/obj/item/container/food/dynamic/fish/raw_carp,
		/obj/item/container/food/dynamic/fish/raw_carp,
		/obj/item/container/food/dynamic/fish/raw_carp,
		/obj/item/container/food/dynamic/fish/raw_carp
	)

	armor_base = list(
		BLADE = AP_AXE,
		BLUNT = AP_DAGGER,
		PIERCE = AP_DAGGER,
		LASER = 0,
		ARCANE = AP_SWORD,
		HEAT = AP_GREATAXE,
		COLD = AP_GREATAXE,
		BOMB = AP_DAGGER,
		BIO = AP_GREATAXE,
		RAD = INFINITY,
		HOLY = AP_SWORD,
		DARK = AP_SWORD,
		FATIGUE = AP_SWORD,
		ION = INFINITY,
		PAIN = AP_SWORD
	)

/mob/living/simple/bullshark/post_death()
	. = ..()
	icon_state = "dead"
	return .

