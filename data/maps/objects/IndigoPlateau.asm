	object_const_def
	const_export INDIGOPLATEAU_TRAINERM
	const_export INDIGOPLATEAU_TRAINERF
	const_export INDIGOPLATEAU_PP_UP
	const_export INDIGOPLATEAU_MAX_ELIXER

IndigoPlateau_Object:
	db $e ; border block

	def_warp_events
	warp_event  9,  5, INDIGO_PLATEAU_LOBBY, 1
	warp_event 10,  5, INDIGO_PLATEAU_LOBBY, 1

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_RED, STAY, DOWN, TEXT_INDIGOPLATEAU_TRAINERM, OPP_TRAINER_M, 1
	object_event  3,  4, SPRITE_GREEN, STAY, DOWN, TEXT_INDIGOPLATEAU_TRAINERF, OPP_TRAINER_F, 1
	object_event  3,  4, SPRITE_POKE_BALL, STAY, NONE, TEXT_INDIGOPLATEAU_PP_UP, PP_UP
	object_event 18,  4, SPRITE_POKE_BALL, STAY, NONE, TEXT_INDIGOPLATEAU_MAX_ELIXER, MAX_ELIXER

	def_warps_to INDIGO_PLATEAU
