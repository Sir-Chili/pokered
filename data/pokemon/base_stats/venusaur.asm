	db DEX_VENUSAUR ; pokedex id

	db  80,  85,  85,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
	dw VenusaurPicFront, VenusaurPicBack

	db TACKLE, GROWL, LEECH_SEED, VINE_WHIP ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB,  SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   SOLARBEAM,    EARTHQUAKE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      REST,         SUBSTITUTE,   DRAGON_PULSE, \
	     CUT
	; end

	db 0 ; padding
