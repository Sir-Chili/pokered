	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  60
	;   hp  atk  def  spd  spc

	db POISON, ROCK ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBack

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB,  TOXIC,        BODY_SLAM,    RAGE,         GIGA_DRAIN,   THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  FLAMETHROWER, SELFDESTRUCT, \
	     FIRE_BLAST,   REST,         SHADOW_BALL,  EXPLOSION,    ROCK_SLIDE,   SUBSTITUTE
	; end

	db 0 ; padding
