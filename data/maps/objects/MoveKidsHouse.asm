	object_const_def
	const_export MOVEKIDSHOUSE_MOVE_DELETER
	const_export MOVEKIDSHOUSE_MOVE_RELEARNER
	const_export MOVEKIDSHOUSE_MOVE_KIDS_MOM

MoveKidsHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 8
	warp_event  3,  7, LAST_MAP, 8

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_MOVEKIDSHOUSE_MOVE_DELETER
	object_event  5,  4, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_MOVEKIDSHOUSE_MOVE_RELEARNER
	object_event  4,  1, SPRITE_MOM, STAY, DOWN, TEXT_MOVEKIDSHOUSE_MOVE_KIDS_MOM

	def_warps_to MOVE_KIDS_HOUSE
