CeruleanCaveB1FWildMons:
	def_grass_wildmons 25 ; encounter rate
	db 55, RHYDON
	db 55, MAROWAK
	db 55, ELECTRODE
	db 64, CHANSEY
	db 64, PARASECT
	db 64, RAICHU
IF DEF(_RED)
	db 57, ARBOK
ENDC
IF DEF(_BLUE)
	db 57, SANDSLASH
ENDC
	db 65, DITTO
	db 63, DITTO
	db 67, DITTO
	end_grass_wildmons

	def_water_wildmons 2 ; encounter rate
IF DEF(_RED)
	db 30, OMANYTE
	db 31, OMANYTE
	db 32, OMANYTE
	db 33, OMANYTE
	db 30, KABUTO
	db 31, KABUTO
	db 32, KABUTO
	db 33, KABUTO
	db 40, OMASTAR
	db 40, KABUTOPS
ENDC
IF DEF(_BLUE)
	db 30, KABUTO
	db 31, KABUTO
	db 32, KABUTO
	db 33, KABUTO
	db 30, OMANYTE
	db 31, OMANYTE
	db 32, OMANYTE
	db 33, OMANYTE
	db 40, KABUTOPS
	db 40, OMASTAR
ENDC
	end_water_wildmons
