SafariZoneCenterWildMons:
	def_grass_wildmons 30 ; encounter rate
IF DEF(_RED)
	db 22, NIDORAN_M
	db 25, RHYHORN
	db 22, VENONAT
	db 24, EXEGGCUTE
	db 31, NIDORINO
	db 25, EXEGGCUTE
	db 31, NIDORINA
	db 26, SNORLAX
	db 23, SCYTHER
	db 32, CHANSEY
ENDC
IF DEF(_BLUE)
	db 22, NIDORAN_F
	db 25, RHYHORN
	db 22, VENONAT
	db 24, EXEGGCUTE
	db 31, NIDORINA
	db 25, EXEGGCUTE
	db 31, NIDORINO
	db 26, CHANSEY
	db 23, PINSIR
	db 32, SNORLAX
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
