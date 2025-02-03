VictoryRoad3FWildMons:
	def_grass_wildmons 15 ; encounter rate
	db 24, MACHOP
	db 26, GEODUDE
	db 22, ZUBAT
	db 42, ONIX
	db 40, VENOMOTH
	db 45, ONIX
	db 43, GRAVELER
	db 41, GOLBAT
IF DEF(_RED)
	db 45, HITMONCHAN
	db 45, HITMONLEE
ENDC
IF DEF(_BLUE)
	db 45, HITMONLEE
	db 45, HITMONCHAN
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
