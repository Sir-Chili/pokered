	object_const_def
	const_export FARAWAYISLAND_SAILOR
	const_export FARAWAYISLAND_MEW

FarawayIsland_Object:
	db $4 ; border block

	def_warp_events
	warp_event 19, 26, VERMILION_CITY, 10

	def_bg_events

	def_object_events
	object_event 19, 27, SPRITE_SAILOR, STAY, UP, TEXT_FARAWAYISLAND_SAILOR
	object_event 22, 14, SPRITE_MEW, STAY, DOWN, TEXT_FARAWAYISLAND_MEW, MEW, 30

	def_warps_to FARAWAY_ISLAND