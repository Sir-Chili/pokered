PowerPlantWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 21, VOLTORB
	db 21, MAGNEMITE
	db 20, PIKACHU
	db 24, RAICHU
	db 23, MAGNEMITE
IF DEF(_RED)
	db 33, ELECTABUZZ
	db 32, MAGNETON
	db 35, MAGNETON
	db 23, VOLTORB
ENDC
IF DEF(_BLUE)
	db 23, VOLTORB
	db 32, MAGNETON
	db 35, MAGNETON
	db 33, ELECTABUZZ
ENDC
	db 30, PORYGON
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
